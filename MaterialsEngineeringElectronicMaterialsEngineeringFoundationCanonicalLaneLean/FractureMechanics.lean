import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundation

structure FractureMechanics (A : AdmissibleClass) where
  stressIntensityFactor : Prop
  criticalStrainEnergyReleaseRate : Prop
  fractureToughness : Prop
  parisLawExponent : Prop

structure FractureMechanicsEvidence (A : AdmissibleClass) (F : FractureMechanics A) where
  stressIntensityFactorClosed : F.stressIntensityFactor
  criticalStrainEnergyReleaseRateClosed : F.criticalStrainEnergyReleaseRate
  fractureToughnessClosed : F.fractureToughness
  parisLawExponentClosed : F.parisLawExponent

def FractureMechanicsClosed (A : AdmissibleClass) (F : FractureMechanics A) : Prop :=
  F.stressIntensityFactor ∧ F.criticalStrainEnergyReleaseRate ∧ F.fractureToughness ∧ F.parisLawExponent

theorem fracture_mechanics_closed_from_evidence (A : AdmissibleClass) (F : FractureMechanics A) (E : FractureMechanicsEvidence A F) : FractureMechanicsClosed A F := by
  exact And.intro E.stressIntensityFactorClosed (And.intro E.criticalStrainEnergyReleaseRateClosed (And.intro E.fractureToughnessClosed E.parisLawExponentClosed))

end MaterialsEngineeringElectronicMaterialsEngineeringFoundation
end HautevilleHouse