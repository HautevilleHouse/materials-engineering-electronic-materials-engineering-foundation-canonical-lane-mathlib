import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure ElasticityTensor where
  stiffnessMatrix : Type u
  complianceMatrix : Type v
  symmetryConditions : Prop
  positiveDefiniteStrainEnergy : Prop
  isotropicComponent : Prop
  anisotropicCorrection : Prop
  symmetryConditionsTerm : symmetryConditions
  positiveDefiniteStrainEnergyTerm : positiveDefiniteStrainEnergy
  isotropicComponentTerm : isotropicComponent
  anisotropicCorrectionTerm : anisotropicCorrection

structure ElasticityTensorEvidence (E : ElasticityTensor) where
  symmetryConditionsClosed : E.symmetryConditions
  positiveDefiniteStrainEnergyClosed : E.positiveDefiniteStrainEnergy
  isotropicComponentClosed : E.isotropicComponent
  anisotropicCorrectionClosed : E.anisotropicCorrection

def ElasticityTensorClosed (E : ElasticityTensor) : Prop :=
  E.symmetryConditions ∧ E.positiveDefiniteStrainEnergy ∧
  E.isotropicComponent ∧ E.anisotropicCorrection

theorem elasticity_tensor_closed_from_evidence (E : ElasticityTensor) (Ev : ElasticityTensorEvidence E) :
    ElasticityTensorClosed E := by
  exact And.intro Ev.symmetryConditionsClosed
    (And.intro Ev.positiveDefiniteStrainEnergyClosed
      (And.intro Ev.isotropicComponentClosed Ev.anisotropicCorrectionClosed))

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse