local assets=
{
    Asset("ANIM", "anim/machete_obsidian.zip"),
    Asset("ANIM", "anim/swap_machete_obsidian.zip"),
 
    Asset("ATLAS", "images/inventoryimages/obiblade.xml"),
    Asset("IMAGE", "images/inventoryimages/obiblade.tex"),
}

prefabs = {
}

local function onfinished(inst)
    inst:Remove()
end

    local function OnEquip(inst, owner)
	    owner.SoundEmitter:PlaySound("dontstarve/common/telebase_gemplace")
        owner.AnimState:OverrideSymbol("swap_object", "swap_machete_obsidian", "swap_machete")
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
     
    anim:SetBank("machete_obsidian")
    anim:SetBuild("machete_obsidian")
    anim:PlayAnimation("idle")

    inst:AddTag("sharp")


      if not TheWorld.ismastersim then
        return inst
    end


    inst:AddComponent("inspectable")
	inst.entity:SetPristine()
    

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(63)
	inst.components.weapon:SetRange(1.1)


     
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "obiblade"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/obiblade.xml"
     
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)
    inst.components.equippable.walkspeedmult = 1.05
	
    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(200)
    inst.components.finiteuses:SetUses(200)
    inst.components.finiteuses:SetOnFinished(onfinished)

            MakeHauntableLaunch(inst)
 
    return inst
end

return  Prefab("common/inventory/obiblade", fn, assets, prefabs)