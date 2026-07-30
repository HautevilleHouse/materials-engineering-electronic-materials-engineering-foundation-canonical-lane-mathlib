import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure GibbsPhaseDiagram where
  components : List String
  phases : List String
  temperatureRange : ℕ × ℕ
  pressureRange : ℕ × ℕ
  phaseBoundaries : List (String × String)
  eutecticPoint : Option (ℕ × ℕ)

structure GibbsPhaseDiagramEvidence (P : GibbsPhaseDiagram) where
  componentsNonempty : P.components ≠ []
  phasesNonempty : P.phases ≠ []
  phaseBoundariesConsistent : ∀ (s : String × String), s.1 ∈ P.phases ∧ s.2 ∈ P.phases
  eutecticConsistent : P.eutecticPoint = none ∨ P.eutecticPoint ≠ none

def GibbsPhaseDiagramClosed (P : GibbsPhaseDiagram) : Prop :=
  P.components ≠ [] ∧
  P.phases ≠ [] ∧
  (∀ (s : String × String), s ∈ P.phaseBoundaries → (s.1 ∈ P.phases ∧ s.2 ∈ P.phases))

theorem gibbs_phase_diagram_closed_from_evidence (P : GibbsPhaseDiagram) (E : GibbsPhaseDiagramEvidence P) :
    GibbsPhaseDiagramClosed P := by
  refine And.intro E.componentsNonempty (And.intro E.phasesNonempty ?_)
  intro s hs
  exact E.phaseBoundariesConsistent s

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse