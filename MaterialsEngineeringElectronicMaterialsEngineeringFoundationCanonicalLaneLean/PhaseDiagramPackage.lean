import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure PhaseDiagramPackage where
  phases : Type u
  transitions : Type v
  gibbsFreeEnergy : Prop
  phaseBoundaries : Prop
  eutecticPoint : Prop
  solidSolubilityLimit : ℝ

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  gibbsFreeEnergyClosed : P.gibbsFreeEnergy
  phaseBoundariesClosed : P.phaseBoundaries
  eutecticPointClosed : P.eutecticPoint

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.gibbsFreeEnergy ∧ P.phaseBoundaries ∧ P.eutecticPoint

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) :
    PhaseDiagramClosed P := by
  exact And.intro E.gibbsFreeEnergyClosed (And.intro E.phaseBoundariesClosed E.eutecticPointClosed)

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse