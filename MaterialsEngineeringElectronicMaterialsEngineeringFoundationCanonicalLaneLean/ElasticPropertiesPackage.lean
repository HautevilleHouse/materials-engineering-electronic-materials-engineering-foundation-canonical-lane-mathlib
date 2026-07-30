import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure ElasticPropertiesPackage where
  youngsModulus : ℝ
  poissonsRatio : ℝ
  shearModulus : ℝ
  bulkModulus : ℝ
  elasticConstantsValid : Prop
  positivePoissonsRatio : Prop
  moduliPositive : Prop

structure ElasticPropertiesEvidence (E : ElasticPropertiesPackage) where
  elasticConstantsValidClosed : E.elasticConstantsValid
  positivePoissonsRatioClosed : E.positivePoissonsRatio
  moduliPositiveClosed : E.moduliPositive

def ElasticPropertiesClosed (E : ElasticPropertiesPackage) : Prop :=
  E.elasticConstantsValid ∧ E.positivePoissonsRatio ∧ E.moduliPositive

theorem elastic_properties_closed_from_evidence (E : ElasticPropertiesPackage) (Ev : ElasticPropertiesEvidence E) :
    ElasticPropertiesClosed E := by
  exact And.intro Ev.elasticConstantsValidClosed (And.intro Ev.positivePoissonsRatioClosed Ev.moduliPositiveClosed)

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse