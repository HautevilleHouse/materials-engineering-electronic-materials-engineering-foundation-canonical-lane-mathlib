import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundation

structure CrystalStructure (A : AdmissibleClass) where
  latticeType : Prop
  bravaisType : Prop
  unitCellVolume : Prop
  symmetryGroup : Prop

structure CrystalStructureEvidence (A : AdmissibleClass) (C : CrystalStructure A) where
  latticeTypeClosed : C.latticeType
  bravaisTypeClosed : C.bravaisType
  unitCellVolumeClosed : C.unitCellVolume
  symmetryGroupClosed : C.symmetryGroup

def CrystalStructureClosed (A : AdmissibleClass) (C : CrystalStructure A) : Prop :=
  C.latticeType ∧ C.bravaisType ∧ C.unitCellVolume ∧ C.symmetryGroup

theorem crystal_structure_closed_from_evidence (A : AdmissibleClass) (C : CrystalStructure A) (E : CrystalStructureEvidence A C) : CrystalStructureClosed A C := by
  exact And.intro E.latticeTypeClosed (And.intro E.bravaisTypeClosed (And.intro E.unitCellVolumeClosed E.symmetryGroupClosed))

end MaterialsEngineeringElectronicMaterialsEngineeringFoundation
end HautevilleHouse