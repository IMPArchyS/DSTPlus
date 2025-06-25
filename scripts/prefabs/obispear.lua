local assets=
{
    Asset("ANIM", "anim/spear_obsidian.zip"),
    Asset("ANIM", "anim/swap_spear_obsidian.zip"),
 
    Asset("ATLAS", "images/inventoryimages/obispear.xml"),
    Asset("IMAGE", "images/inventoryimages/obispear.tex"),
}

prefabs = {
}

local function onfinished(inst)
    inst:Remove()
end

    local function OnEquip(inst, owner)
	    owner.SoundEmitter:PlaySound("dontstarve/common/telebase_gemplace")
        owner.AnimState:OverrideSymbol("swap_object", "swap_spear_obsidian", "swap_spear")
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
     
    anim:SetBank("spear_obsidian")
    anim:SetBuild("spear_obsidian")
    anim:PlayAnimation("idle")

    inst:AddTag("sharp")


      if not TheWorld.ismastersim then
        return inst
    end


    inst:AddComponent("inspectable")
	inst.entity:SetPristine()
    

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(53)
	inst.components.weapon:SetRange(1.2)


     
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "obispear"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/obispear.xml"
     
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)
    inst.components.equippable.walkspeedmult = 1.05
	
    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(375)
    inst.components.finiteuses:SetUses(375)
    inst.components.finiteuses:SetOnFinished(onfinished)

            MakeHauntableLaunch(inst)
 
    return inst
end

return  Prefab("common/inventory/obispear", fn, assets, prefabs)