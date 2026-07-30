import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure ElectronicBandStructurePackage where
  brillouinZone : Type u
  energyBands : Type v
  bandGap : Prop
  effectiveMassTensor : Type w
  densityOfStates : Prop
  bandGapClosed : bandGap
  densityOfStatesClosed : densityOfStates

structure ElectronicBandStructureEvidence (E : ElectronicBandStructurePackage) where
  bandGapClosed : E.bandGapClosed
  densityOfStatesClosed : E.densityOfStatesClosed

def ElectronicBandStructureClosed (E : ElectronicBandStructurePackage) : Prop :=
  E.bandGap ∧ E.densityOfStates

theorem electronic_band_structure_closed_from_evidence (E : ElectronicBandStructurePackage) (Ev : ElectronicBandStructureEvidence E) :
    ElectronicBandStructureClosed E := by
  exact And.intro Ev.bandGapClosed Ev.densityOfStatesClosed

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse
