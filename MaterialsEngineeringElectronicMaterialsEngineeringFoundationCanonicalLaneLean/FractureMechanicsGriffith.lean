import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure GriffithFractureMechanics where
  crackLength : ℕ
  criticalStress : ℕ
  fractureToughness : ℕ
  surfaceEnergy : ℕ
  elasticModulus : ℕ
  stressIntensityFactor : ℕ
  fractureCriterion : Prop

structure GriffithFractureMechanicsEvidence (F : GriffithFractureMechanics) where
  crackLengthPositive : F.crackLength > 0
  criticalStressPositive : F.criticalStress > 0
  fractureToughnessPositive : F.fractureToughness > 0
  surfaceEnergyPositive : F.surfaceEnergy > 0
  elasticModulusPositive : F.elasticModulus > 0
  stressIntensityFactorPositive : F.stressIntensityFactor > 0
  fractureCriterionClosed : F.fractureCriterion

def GriffithFractureMechanicsClosed (F : GriffithFractureMechanics) : Prop :=
  F.crackLength > 0 ∧ F.criticalStress > 0 ∧ F.fractureToughness > 0 ∧
  F.surfaceEnergy > 0 ∧ F.elasticModulus > 0 ∧ F.stressIntensityFactor > 0 ∧
  F.fractureCriterion

theorem griffith_fracture_mechanics_closed_from_evidence
    (F : GriffithFractureMechanics) (E : GriffithFractureMechanicsEvidence F) :
    GriffithFractureMechanicsClosed F := by
  exact And.intro E.crackLengthPositive
    (And.intro E.criticalStressPositive
      (And.intro E.fractureToughnessPositive
        (And.intro E.surfaceEnergyPositive
          (And.intro E.elasticModulusPositive
            (And.intro E.stressIntensityFactorPositive E.fractureCriterionClosed)))))

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse