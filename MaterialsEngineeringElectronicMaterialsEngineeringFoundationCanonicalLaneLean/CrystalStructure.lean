import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure CrystalStructurePackage where
  latticeType : Type u
  basisVectors : Type v
  unitCell : Prop
  bravaisLatticeClassification : Prop
  symmetryGroup : Type w
  xrayDiffractionPattern : Prop
  unitCellClosed : unitCell
  bravaisLatticeClassificationClosed : bravaisLatticeClassification
  xrayDiffractionPatternClosed : xrayDiffractionPattern

structure CrystalStructureEvidence (C : CrystalStructurePackage) where
  unitCellClosed : C.unitCellClosed
  bravaisLatticeClassificationClosed : C.bravaisLatticeClassificationClosed
  xrayDiffractionPatternClosed : C.xrayDiffractionPatternClosed

def CrystalStructureClosed (C : CrystalStructurePackage) : Prop := 
  C.unitCell ∧ C.bravaisLatticeClassification ∧ C.xrayDiffractionPattern

theorem crystal_structure_closed_from_evidence (C : CrystalStructurePackage) (E : CrystalStructureEvidence C) :
    CrystalStructureClosed C := by
  exact And.intro E.unitCellClosed (And.intro E.bravaisLatticeClassificationClosed E.xrayDiffractionPatternClosed)

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse
