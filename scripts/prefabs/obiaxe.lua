local assets=
{
    Asset("ANIM", "anim/axe_obsidian.zip"),
    Asset("ANIM", "anim/swap_axe_obsidian.zip"),
 
    Asset("ATLAS", "images/inventoryimages/obiaxe.xml"),
    Asset("IMAGE", "images/inventoryimages/obiaxe.tex"),
}

prefabs = {
}

local function onfinished(inst)
    inst:Remove()
end

local function OnEquip(inst, owner)
		owner.SoundEmitter:PlaySound("dontstarve/common/telebase_gemplace")
        owner.AnimState:OverrideSymbol("swap_object", "swap_axe_obsidian", "swap_axe")
        owner.AnimState:Show("ARM_carry")
        owner.AnimState:Hide("ARM_normal")
end
	
 
local function OnUnequip(inst, owner)
        owner.AnimState:Hide("ARM_carry")
        owner.AnimState:Show("ARM_normal")
end


local function fn(sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    MakeInventoryPhysics(inst)
	inst.entity:AddNetwork()
     
    anim:SetBank("axe_obsidian")
    anim:SetBuild("axe_obsidian")
    anim:PlayAnimation("idle")

    inst:AddTag("sharp")


      if not TheWorld.ismastersim then
        return inst
    end

	inst.entity:SetPristine()
    
    -----
    inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.CHOP)
    -------
    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.AXE_USES * 1.5)
    inst.components.finiteuses:SetUses(TUNING.AXE_USES * 1.5)
    inst.components.tool:SetAction(ACTIONS.CHOP, TUNING.MOONGLASSAXE.EFFECTIVENESS)
    inst.components.finiteuses:SetConsumption(ACTIONS.CHOP, 1 / TUNING.GOLDENTOOLFACTOR)
	inst.components.finiteuses:SetOnFinished(onfinished) 
    -------

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(35)
	inst.components.weapon.attackwear = 1 / TUNING.GOLDENTOOLFACTOR
	
    -------
	inst:AddComponent("inspectable")
		
	inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "obiaxe"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/obiaxe.xml"
     
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)
    inst:AddInherentAction(ACTIONS.CHOP)
    inst.components.equippable.walkspeedmult = 1.05

     ------
            MakeHauntableLaunch(inst)
 
    return inst
end

return  Prefab("common/inventory/obiaxe", fn, assets, prefabs)