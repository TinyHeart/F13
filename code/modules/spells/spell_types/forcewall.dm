/obj/effect/proc_holder/spell/targeted/forcewall
	name = "Forcewall"
	desc = "Create a magical barrier that only you can pass through. Does not require wizard garb."
	school = "transmutation"
	charge_max = 100
	clothes_req = 0
	invocation = "TARCOL MINTI ZHERI"
	invocation_type = "shout"
	sound =  "sound/magic/ForceWall.ogg"
	action_icon_state = "shield"
	range = -1
	include_user = 1
	cooldown_min = 50 //12 deciseconds reduction per rank

/obj/effect/proc_holder/spell/targeted/forcewall/cast(list/targets,mob/user = usr)
	new /obj/effect/forcefield/wizard(get_turf(user),user)
	if(user.dir == SOUTH || user.dir == NORTH)
		new /obj/effect/forcefield/wizard(get_step(user, EAST),user)
		new /obj/effect/forcefield/wizard(get_step(user, WEST),user)
	else
		new /obj/effect/forcefield/wizard(get_step(user, NORTH),user)
		new /obj/effect/forcefield/wizard(get_step(user, SOUTH),user)


/obj/effect/forcefield/wizard
	var/mob/wizard

/obj/effect/forcefield/wizard/New(atom/loc, mob/summoner)
	..()
	wizard = summoner
	QDEL_IN(src, 300)

/obj/effect/forcefield/wizard/CanPass(go/mover, turf/target, height=0)
	if(mover == wizard)
		return 1
	return 0
