import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure BandStructurePackage where
  brillouinZone : Type u
  energyBands : Type v
  dispersionRelation : Prop
  bandGap : ℝ
  effectiveMass : ℝ
  densityOfStates : Prop

structure BandStructureEvidence (B : BandStructurePackage) where
  dispersionRelationClosed : B.dispersionRelation
  bandGapClosed : B.bandGap > 0
  effectiveMassClosed : B.effectiveMass > 0
  densityOfStatesClosed : B.densityOfStates

def BandStructureClosed (B : BandStructurePackage) : Prop :=
  B.dispersionRelation ∧ (B.bandGap > 0) ∧ (B.effectiveMass > 0) ∧ B.densityOfStates

theorem band_structure_closed_from_evidence (B : BandStructurePackage) (E : BandStructureEvidence B) :
    BandStructureClosed B := by
  exact And.intro E.dispersionRelationClosed (And.intro E.bandGapClosed (And.intro E.effectiveMassClosed E.densityOfStatesClosed))

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse