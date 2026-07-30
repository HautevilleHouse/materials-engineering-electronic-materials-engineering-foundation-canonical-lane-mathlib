import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure ElasticityContinuum where
  strainTensor : Type u
  stressTensor : Type u
  elasticityTensor : Type u
  youngModulus : ℕ
  poissonRatio : ℚ
  shearModulus : ℕ
  bulkModulus : ℕ
  linearElastic : Prop
  isotropic : Prop

structure ElasticityContinuumEvidence (E : ElasticityContinuum) where
  linearElasticClosed : E.linearElastic
  isotropicClosed : E.isotropic
  youngModulusPositive : E.youngModulus > 0
  poissonRatioValid : -1 < E.poissonRatio ∧ E.poissonRatio < 0.5
  shearModulusPositive : E.shearModulus > 0
  bulkModulusPositive : E.bulkModulus > 0

def ElasticityContinuumClosed (E : ElasticityContinuum) : Prop :=
  E.linearElastic ∧ E.isotropic ∧
  E.youngModulus > 0 ∧ -1 < E.poissonRatio ∧ E.poissonRatio < 0.5 ∧
  E.shearModulus > 0 ∧ E.bulkModulus > 0

theorem elasticity_continuum_closed_from_evidence (E : ElasticityContinuum) (Ev : ElasticityContinuumEvidence E) :
    ElasticityContinuumClosed E := by
  exact And.intro Ev.linearElasticClosed
    (And.intro Ev.isotropicClosed
      (And.intro Ev.youngModulusPositive
        (And.intro Ev.poissonRatioValid.1
          (And.intro Ev.poissonRatioValid.2
            (And.intro Ev.shearModulusPositive Ev.bulkModulusPositive)))))

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse