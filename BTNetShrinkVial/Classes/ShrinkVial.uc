class ShrinkVial extends Pickup;

/*
	+--------------------------------------------------------------------------+
	| BTNetShrinkVial                                                          |
	| ------------------------------------------------------------------------ |
	| Author:      Dizzy <dizzy@bunnytrack.net>                                |
	| Description: A pickup actor which shrinks the player, making them small  |
	| Version:     2017-10-01                                                  |
	| Website:     bunnytrack.net                                              |
	| ------------------------------------------------------------------------ |
	| Released under the Creative Commons Attribution-NonCommercial-ShareAlike |
	| license. See https://creativecommons.org/licenses/by-nc-sa/4.0/          |
	+--------------------------------------------------------------------------+
*/

var float defaultCollisionRadius;
var float defaultCollisionHeight;

function PickupFunction(Pawn Other) {

	if (Pawn(Owner) != None) {

		defaultCollisionRadius = Pawn(Owner).CollisionRadius;
		defaultCollisionHeight = Pawn(Owner).CollisionHeight;

		Pawn(Owner).DrawScale = 0.3;
		Pawn(Owner).SetCollisionSize(defaultCollisionRadius, 8);

		Pawn(Owner).Weapon.ThirdPersonScale = 0.3;

		Pawn(Owner).ClientMessage("You are small now");

	}

}

event Destroyed() {

	if (Pawn(Owner) != None) {

		Pawn(Owner).DrawScale = 1;
		Pawn(Owner).SetCollisionSize(defaultCollisionRadius, defaultCollisionHeight);
		Pawn(Owner).ClientMessage("You are back to normal size now");

	}

	Super.Destroyed();

}

defaultproperties {
	RemoteRole=ROLE_SimulatedProxy
	Mesh=LodMesh'Botpack.Vial'
	PickupViewMesh=LodMesh'Botpack.Vial'
	PickupSound=Sound'Botpack.Pickups.UTHealth'
	bAlwaysRelevant=True
	bNetTemporary=False
	bHidden=False
	bRotatingPickup=True
	RespawnTime=0.100000
}