
# Conventional (Weight training, EP)
#python main.py --config configs/training/conv4/conv4_training.yml
#python main.py --config configs/ep/conv4/conv4_sc_ep.yml

#python main.py --config configs/hypercube/conv4/conv4_sc_hypercube_reg.yml #> log_hc_reg_naive 2>&1
#python main.py --config configs/hypercube/conv4/conv4_sc_hypercube_reg_multistep_decay.yml #> log_hc_reg_naive 2>&1

# for testing probabilistic pruning
#python main.py --config configs/hypercube/conv4/conv4_sc_hypercube_reg_test_hybrid_pruning.yml 


#:<<BLOCK
weight_init_arr=('signed_constant' 'kaiming_normal')
score_init_arr=('bern' 'unif')

for w in ${weight_init_arr[@]}
do
    for s in ${score_init_arr[@]}
    do
        python main.py --config configs/hypercube/conv4/conv4_sc_hypercube_reg_for_high_before_rounding.yml --init $w --score-init $s
    done
done
#BLOCK


:<<BLOCK
lr_arr=(0.005 0.0075 0.01 0.02)
lmbda_arr=(0.000001 0.000002)

for lr in ${lr_arr[@]}
do
    for lm in ${lmbda_arr[@]}
    do
        python main.py --config configs/hypercube/conv4/conv4_sc_hypercube_reg_for_high_before_rounding.yml --lr $lr --lmbda $lm
    done
done
BLOCK

#python main.py --config configs/hypercube/conv4/conv4_sc_hypercube_reg_multistep_decay.yml #> log_hc_reg_naive 2>&1
#python main.py --config configs/hypercube/conv4/conv4_sc_hypercube_reg_compare_naive_prob.yml


#python main.py --config configs/hypercube/conv4/conv4_sc_hypercube_reg_for_high_before_rounding_sgd.yml





