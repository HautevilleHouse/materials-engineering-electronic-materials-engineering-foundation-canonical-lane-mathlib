import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure ElectronicBandStructurePackage where
  bandGap : ℝ
  conductionBandMin : ℝ
  valenceBandMax : ℝ
  effectiveMassElectron : ℝ
  effectiveMassHole : ℝ
  densityOfStates : ℝ → ℝ
  bandStructureValid : Prop
  bandGapPositive : Prop
  effectiveMassesPositive : Prop

structure ElectronicBandStructureEvidence (E : ElectronicBandStructurePackage) where
  bandStructureValidClosed : E.bandStructureValid
  bandGapPositiveClosed : E.bandGapPositive
  effectiveMassesPositiveClosed : E.effectiveMassesPositive

def ElectronicBandStructureClosed (E : ElectronicBandStructurePackage) : Prop :=
  E.bandStructureValid ∧ E.bandGapPositive ∧ E.effectiveMassesPositive

theorem electronic_band_structure_closed_from_evidence (E : ElectronicBandStructurePackage) (Ev : ElectronicBandStructureEvidence E) :
    ElectronicBandStructureClosed E := by
  exact And.intro Ev.bandStructureValidClosed (And.intro Ev.bandGapPositiveClosed Ev.effectiveMassesPositiveClosed)

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse