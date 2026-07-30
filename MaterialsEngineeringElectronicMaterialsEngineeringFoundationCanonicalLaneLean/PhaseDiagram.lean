import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure PhaseDiagramPackage where
  componentSpecies : Type u
  temperatureRange : Type v
  pressureRange : Type w
  phaseBoundaries : Prop
  eutecticPoint : Prop
  eutecticComposition : Prop
  phaseBoundariesClosed : phaseBoundaries
  eutecticPointClosed : eutecticPoint
  eutecticCompositionClosed : eutecticComposition

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  phaseBoundariesClosed : P.phaseBoundariesClosed
  eutecticPointClosed : P.eutecticPointClosed
  eutecticCompositionClosed : P.eutecticCompositionClosed

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.phaseBoundaries ∧ P.eutecticPoint ∧ P.eutecticComposition

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) :
    PhaseDiagramClosed P := by
  exact And.intro E.phaseBoundariesClosed (And.intro E.eutecticPointClosed E.eutecticCompositionClosed)

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse
