<?php
function get_help_text($topic) {
	switch ($topic) {
		case 'capture':
			return '
					<strong>Settling a Transaction</strong><br /><br />
					Settling a transaction will finalize it and secure the funds. A settled transaction can be batched.<br /><br />
					When a transaction is authorized only, it must be settled before the funds can be secured and the transaction batched.<br /><br />
					After a transaction has been voided, it cannot be settled.<br /><br />
					You cannot settle more funds than have been authorized.
					';
			break;		
		case 'refund':
			return '
					<strong>Issuing a Refund</strong><br /><br />
					Refunds are new transactions that transfer money from the merchant\'s account to the card holder\'s account. Issuing a refund will create a new transaction.<br /><br />
					A refund can only be issued if the original transaction has been finalized and settled. If this isn\'t the case, you can void the transaction instead.
					';
			break;
			
		default:
			return 'nothing';
			break;
	}
}
?>