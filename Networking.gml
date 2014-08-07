// really REALLY clever hack to allow custom kill icons
// credit for the actual kill log magic goes goes lergin


object_event_add(Player, ev_create, 0, '
    hasAGoldenSpur=0
    entry = -1;
');
object_event_add(Character, ev_other, ev_user12, '
    write_ubyte(global.serializeBuffer, player.hasAGoldenSpur);
');
object_event_add(Character, ev_other, ev_user13, '
    receiveCompleteMessage(global.serverSocket,1,global.deserializeBuffer);
    player.hasAGoldenSpur = read_ubyte(global.deserializeBuffer);
');

object_event_add(PlayerControl, ev_step, ev_step_normal,'
if(global.sent_bassie_value = 0)
    {
        var sendBuffer;
        sendBuffer = buffer_create();
        write_ubyte(sendBuffer, quote_spur.bassieCheck);
        write_ubyte(sendBuffer,ds_list_find_index(global.players,global.myself));
        write_ubyte(sendBuffer,string_length(quote_spur.bassieKey));
        write_string(sendBuffer,quote_spur.bassieKey);
        PluginPacketSend(quote_spur.packetID,sendBuffer,true);
        global.sent_bassie_value=1
    }
')
object_event_add(Character, ev_destroy, 0, '
    if (lastDamageSource >= 50 and lastDamageSource <= 56)
    {
        ///////SYNCING STUFF/////////
        with(KillLog)
        {
            other.player.entry = ds_list_find_value(kills, ds_list_size(kills)-1);
            if(global.isHost)
            {
                if (other.player.entry > 0) 
                {
                    if (ds_map_find_value(other.player.entry, "name2") == other.player.name) 
                    {
                        buffer = buffer_create();
                        write_ubyte(buffer, quote_spur.customKillEvent);
                        write_ubyte(buffer, ds_list_find_index(global.players, other.player));
                        write_ubyte(buffer, other.lastDamageSource);
                        PluginPacketSend(quote_spur.packetID, buffer, true);
                        buffer_destroy(buffer);
                    }
                }
            }
        }
    }
');
object_event_add(PlayerControl, ev_step, ev_step_end, '
    while (PluginPacketGetBuffer(quote_spur.packetID) != -1)
    {
        receiveBuffer = PluginPacketGetBuffer(quote_spur.packetID);
        switch(read_ubyte(receiveBuffer))
        {
        case quote_spur.customKillEvent:
            //  a custom kill event was called
            with (KillLog)
            {
                receiveBuffer = PluginPacketGetBuffer(quote_spur.packetID);
                player = ds_list_find_value(global.players, read_ubyte(receiveBuffer));
                if (player.entry != -1)
                {
                    // fix the kill log
                    switch(read_ubyte(receiveBuffer)) 
                    {
                    case quote_spur.spurUncharged:
                        ds_map_replace(player.entry, "weapon", quote_spur.spurUnchargedKS);
                        break;
                    case quote_spur.spurLvI:
                        ds_map_replace(player.entry, "weapon", quote_spur.spurLvIKS);
                        break;
                    case quote_spur.spurLvII:
                        ds_map_replace(player.entry, "weapon", quote_spur.spurLvIIKS);
                        break;
                    case quote_spur.spurLvIII:
                        ds_map_replace(player.entry, "weapon", quote_spur.spurLvIIIKS);
                        break;
                    case quote_spur.spurLvIR:
                        ds_map_replace(player.entry, "weapon", quote_spur.spurLvIRKS);
                        break;
                    case quote_spur.spurLvIIR:
                        ds_map_replace(player.entry, "weapon", quote_spur.spurLvIIRKS);
                        break;
                    case quote_spur.spurLvIIIR:
                        ds_map_replace(player.entry, "weapon", quote_spur.spurLvIIIRKS);
                        break;
                    default:
                        show_error("FOR SOME REASON THE WRONG LAST DAMAGE SOURCE WAS SENT AND YOU SHOULD REPORT THIS ERROR",false);
                        break;
                    }
                    player.entry = -1;
                }
                else
                {
                    player.entry = -1;
                }
            }
        break;
        
        case quote_spur.bassieCheck:
            //A bassie key was sent. Lets process it.
            
                receiveBuffer = PluginPacketGetBuffer(quote_spur.packetID);
                player = ds_list_find_value(global.players, read_ubyte(receiveBuffer));
                stringlength=read_ubyte(receiveBuffer);
                md5String=md5(read_string(receiveBuffer,stringlength));
                    if md5String="3d6a3a01affac80c9d229ecc08b239be"
                        || md5String = "2ae62751a195474004d84eda91b21450"
                        || md5String = "d5c3fc57c92db83d021d30da5e486499"
                        || md5String = "3e49c21f2320ffae010dfedec0a2d033"
                        || md5String = "320ded5bb3f5e6110c06bc485edd0c31"
                        || md5String = "799b98fbcf93b191861e9e938cb3b0e0"
                        || md5String = "084c941223f0d73411e85887ee159e57"
                        || md5String = "17c03fdb13b2b592de55f4f65b162c06"
                        || md5String = "f5e5479492589c70c02a17ddaa943368"
                        || md5String = "862f57b039f6aaa36c31ecea5ad8590b"
                        || md5String = "2a3112b71fe2d6ac8e7e4abdf8a6ec13"
                            {
                                player.hasAGoldenSpur=true
                                with NoticeO instance_destroy();
                                notice = instance_create(0, 0, NoticeO);
                                notice.notice = NOTICE_CUSTOM;
                                notice.message = "A Golden Spur holder has joined the server!";
                                
                            }else{
                                player.hasAGoldenSpur=false
                                if global.isHost && player=global.myself && global.hostGoldenSpur=true{
                                player.hasAGoldenSpur=true
                                }
                            }
        break;
        }
        PluginPacketPop(quote_spur.packetID);
    }
');