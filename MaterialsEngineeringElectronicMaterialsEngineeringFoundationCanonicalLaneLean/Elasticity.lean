import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundation

structure Elasticity (A : AdmissibleClass) where
  youngModulus : Prop
  poissonRatio : Prop
  shearModulus : Prop
  bulkModulus : Prop

structure ElasticityEvidence (A : AdmissibleClass) (E : Elasticity A) where
  youngModulusClosed : E.youngModulus
  poissonRatioClosed : E.poissonRatio
  shearModulusClosed : E.shearModulus
  bulkModulusClosed : E.bulkModulus

def ElasticityClosed (A : AdmissibleClass) (E : Elasticity A) : Prop :=
  E.youngModulus ∧ E.poissonRatio ∧ E.shearModulus ∧ E.bulkModulus

theorem elasticity_closed_from_evidence (A : AdmissibleClass) (E : Elasticity A) (Ev : ElasticityEvidence A E) : ElasticityClosed A E := by
  exact And.intro Ev.youngModulusClosed (And.intro Ev.poissonRatioClosed (And.intro Ev.shearModulusClosed Ev.bulkModulusClosed))

end MaterialsEngineeringElectronicMaterialsEngineeringFoundation
end HautevilleHouse