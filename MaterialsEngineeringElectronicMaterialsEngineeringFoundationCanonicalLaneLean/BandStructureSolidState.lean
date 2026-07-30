import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure BandStructure where
  crystalMomentum : Type u
  energyBands : List (String × ℕ)
  bandGap : ℕ
  effectiveMass : ℕ
  fermiLevel : ℕ
  densityOfStates : Type u

structure BandStructureEvidence (B : BandStructure) where
  crystalMomentumDefined : B.crystalMomentum = B.crystalMomentum
  energyBandsNonempty : B.energyBands ≠ []
  bandGapNonnegative : B.bandGap ≥ 0
  effectiveMassPositive : B.effectiveMass > 0
  fermiLevelPositive : B.fermiLevel > 0
  densityOfStatesDefined : B.densityOfStates = B.densityOfStates

def BandStructureClosed (B : BandStructure) : Prop :=
  B.energyBands ≠ [] ∧ B.bandGap ≥ 0 ∧ B.effectiveMass > 0 ∧ B.fermiLevel > 0

theorem band_structure_closed_from_evidence (B : BandStructure) (E : BandStructureEvidence B) :
    BandStructureClosed B := by
  exact And.intro E.energyBandsNonempty
    (And.intro E.bandGapNonnegative
      (And.intro E.effectiveMassPositive E.fermiLevelPositive))

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse