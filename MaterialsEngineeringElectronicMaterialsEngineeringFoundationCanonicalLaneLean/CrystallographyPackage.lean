import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure CrystallographyPackage where
  lattice : Type u
  unitCell : Type v
  bravaisLatticeType : Prop
  symmetryGroup : Prop
  xrayDiffractionPattern : Prop
  unitCellVolume : ℝ

structure CrystallographyEvidence (C : CrystallographyPackage) where
  bravaisLatticeTypeClosed : C.bravaisLatticeType
  symmetryGroupClosed : C.symmetryGroup
  xrayDiffractionPatternClosed : C.xrayDiffractionPattern

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.bravaisLatticeType ∧ C.symmetryGroup ∧ C.xrayDiffractionPattern

theorem crystallography_closed_from_evidence (C : CrystallographyPackage) (E : CrystallographyEvidence C) :
    CrystallographyClosed C := by
  exact And.intro E.bravaisLatticeTypeClosed (And.intro E.symmetryGroupClosed E.xrayDiffractionPatternClosed)

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse