import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure ElasticityPackage where
  youngModulus : ℝ
  poissonRatio : ℝ
  shearModulus : ℝ
  hookesLaw : Prop
  stressStrainRelation : Prop
  elasticLimit : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  hookesLawClosed : E.hookesLaw
  stressStrainRelationClosed : E.stressStrainRelation
  elasticLimitClosed : E.elasticLimit

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.hookesLaw ∧ E.stressStrainRelation ∧ E.elasticLimit

theorem elasticity_closed_from_evidence (E : ElasticityPackage) (Ev : ElasticityEvidence E) :
    ElasticityClosed E := by
  exact And.intro Ev.hookesLawClosed (And.intro Ev.stressStrainRelationClosed Ev.elasticLimitClosed)

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse