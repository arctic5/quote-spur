//Initiation script. When someone told me to keep it short and simple, I told them to suck my dick.
global.jumpFlameParticleTypeString="jumpFlameParticleType"
global.jumpFlameParticleSystemString="jumpFlameParticleSystem"
global.jumpDustParticleTypeString="jumpDustParticleType"
global.jumpDustParticleSystemString="jumpDustParticleSystem"
global.maxAmmoString="maxAmmo"
global.indicatorString="indicator"
global.cloakString="cloak"
global.BassMakesPaste="BassMakesPaste"
//Spriteloading.
spriteDirectory=argument0+"\Sprites\";

global.CSBloodS=sprite_add_sprite(spriteDirectory+"CSBloodS"+".gmspr")
global.CSDullImpactS=sprite_add_sprite(spriteDirectory+"CSDullImpactS"+".gmspr")
global.SingleDot=sprite_add_sprite(spriteDirectory+"SingleDot"+".gmspr")
global.SpurS=sprite_add_sprite(spriteDirectory+"SpurS"+".gmspr")
global.GoldenSpurS=sprite_add_sprite(spriteDirectory+"GoldenSpurS"+".gmspr")
global.SpurShotS=sprite_add_sprite(spriteDirectory+"SpurShotS"+".gmspr")
global.SpurChargeShotS=sprite_add_sprite(spriteDirectory+"SpurChargeShotS"+".gmspr")
global.StarExplosionS=sprite_add_sprite(spriteDirectory+"StarExplosionS"+".gmspr")
global.TinyExplosionS=sprite_add_sprite(spriteDirectory+"TinyExplosionS"+".gmspr")
global.quoteSmokeS = sprite_add(spriteDirectory+"QuoteSmokeS.png", 7, 1, 0, 8, 8);
global.quoteExplosionS = sprite_add(spriteDirectory+"QuoteExplosionS.png", 5, 1, 0, 20, 20);

//sprite_collision_mask(global.name,0,2,8,35,19,40,1,0)
//sprite_set_offset(global.name,22,27)

global.QuoteSymbolsS= sprite_add_sprite(spriteDirectory+"Symbols.gmspr")
global.QuoteRedNumbersS= sprite_add_sprite(spriteDirectory+"RedNumbers.gmspr")
global.QuoteHudS= sprite_add_sprite(spriteDirectory+"HudBase.gmspr")
global.QuoteNumbersS= sprite_add_sprite(spriteDirectory+"Numbers.gmspr")

//Soundloading
soundDirectory=argument0+"\Sounds\";
global.CSObjectHurtSnd=sound_add(soundDirectory+"CSObjectHurtSnd"+".wav",0,0)
global.CSQuoteHurtSnd=sound_add(soundDirectory+"CSQuoteHurtSnd"+".wav",0,0)
global.CSQuoteJumpSnd=sound_add(soundDirectory+"CSQuoteJumpSnd"+".wav",0,0)
global.CSQuotesplosionSnd=sound_add(soundDirectory+"CSQuotesplosionSnd"+".wav",0,0)
global.CSSqueakBigSnd=sound_add(soundDirectory+"CSSqueakBigSnd"+".wav",0,0)
global.CSSqueakMedSnd=sound_add(soundDirectory+"CSSqueakMedSnd"+".wav",0,0)
global.CSSqueakSmallSnd=sound_add(soundDirectory+"CSSqueakSmallSnd"+".wav",0,0)

global.CSSpurCharge1Snd=sound_add(soundDirectory+"CSSpurCharge1Snd"+".wav",0,0)
global.CSSpurCharge2Snd=sound_add(soundDirectory+"CSSpurCharge2Snd"+".wav",0,0)
global.CSSpurCharge3Snd=sound_add(soundDirectory+"CSSpurCharge3Snd"+".wav",0,0)
global.CSSpurChargeCompleteSnd=sound_add(soundDirectory+"CSSpurChargeCompleteSnd"+".wav",0,0)

global.SpurSnd1=sound_add(soundDirectory+"SpurSnd1"+".wav",0,0)
global.SpurSnd2=sound_add(soundDirectory+"SpurSnd2"+".wav",0,0)

global.CSSpurChargeShot1Snd=sound_add(soundDirectory+"CSSpurChargeShot1Snd"+".wav",0,0)
global.CSSpurChargeShot2Snd=sound_add(soundDirectory+"CSSpurChargeShot2Snd"+".wav",0,0)
global.CSSpurChargeShot3Snd=sound_add(soundDirectory+"CSSpurChargeShot3Snd"+".wav",0,0)

global.CSTeleportSnd=sound_add(soundDirectory+"CSTeleportSnd"+".wav",0,0)


//Object creation
global.damageCounter=object_add()
global.Spur=object_add()
object_set_sprite(global.Spur,global.SpurS)
object_set_parent(global.Spur,Weapon)
global.SpurShot=object_add()
object_set_sprite(global.SpurShot,global.SpurShotS)
global.SpurChargeShotFront=object_add()
object_set_sprite(global.SpurChargeShotFront,global.SingleDot)
global.SpurChargeShotBack=object_add()
object_set_sprite(global.SpurChargeShotBack,global.SingleDot)
global.StarPop=object_add()
object_set_sprite(global.StarPop,global.StarExplosionS)
global.TinyExplosion=object_add()
object_set_sprite(global.TinyExplosion,global.TinyExplosionS)
global.IneffectiveExplosion=object_add()
object_set_sprite(global.IneffectiveExplosion,global.CSDullImpactS)
global.HurtBlood=object_add()
object_set_sprite(global.HurtBlood,global.CSBloodS)
global.quoteSmoke = object_add();
object_set_sprite(global.quoteSmoke, global.quoteSmokeS);
global.quoteExplosion = object_add();
object_set_sprite(global.quoteExplosion, global.quoteExplosionS);
execute_file(argument0+"\Objects.gml")