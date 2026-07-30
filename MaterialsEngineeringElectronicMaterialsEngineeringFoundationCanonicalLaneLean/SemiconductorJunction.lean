import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean

structure SemiconductorJunction where
  dopingTypeN : Prop
  dopingTypeP : Prop
  builtInVoltage : ℕ
  depletionWidth : ℕ
  junctionCapacitance : ℕ
  breakdownVoltage : ℕ
  idealityFactor : ℚ

structure SemiconductorJunctionEvidence (J : SemiconductorJunction) where
  dopingTypeNOrP : J.dopingTypeN ∨ J.dopingTypeP
  builtInVoltagePositive : J.builtInVoltage > 0
  depletionWidthPositive : J.depletionWidth > 0
  junctionCapacitancePositive : J.junctionCapacitance > 0
  breakdownVoltagePositive : J.breakdownVoltage > 0
  idealityFactorValid : 1 ≤ J.idealityFactor ∧ J.idealityFactor ≤ 2

def SemiconductorJunctionClosed (J : SemiconductorJunction) : Prop :=
  (J.dopingTypeN ∨ J.dopingTypeP) ∧ J.builtInVoltage > 0 ∧ J.depletionWidth > 0 ∧
  J.junctionCapacitance > 0 ∧ J.breakdownVoltage > 0 ∧ 1 ≤ J.idealityFactor ∧ J.idealityFactor ≤ 2

theorem semiconductor_junction_closed_from_evidence
    (J : SemiconductorJunction) (E : SemiconductorJunctionEvidence J) :
    SemiconductorJunctionClosed J := by
  refine And.intro E.dopingTypeNOrP
    (And.intro E.builtInVoltagePositive
      (And.intro E.depletionWidthPositive
        (And.intro E.junctionCapacitancePositive
          (And.intro E.breakdownVoltagePositive
            (And.intro E.idealityFactorValid.1 E.idealityFactorValid.2)))))

end MaterialsEngineeringElectronicMaterialsEngineeringFoundationCanonicalLaneLean
end HautevilleHouse