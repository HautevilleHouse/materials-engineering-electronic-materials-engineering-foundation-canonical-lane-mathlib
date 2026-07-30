import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure MaterialObject where
  crystalStructure : Type u
  bandGap : ℝ
  conductivity : ℝ
  defectDensity : ℝ

structure AdmissibleClass where
  object : MaterialObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MaterialWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def MaterialWitnessClosed (O : MaterialObject) : Prop :=
  O.bandGap > 0 ∧ O.conductivity > 0

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse