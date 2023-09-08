@extends('layouts.app')
<style>
	.preview_data{
		text-transform: uppercase;
	}
	</style>
@section('content')



<div class="row">
	<div class="col-lg-8 offset-lg-2">
		<div class="card">
			<div class="card-header">
				<h4 class="header-title text-center">{{ _lang('Wire Transfer') }}</h4>
			</div>
			<div class="card-body">
			    <form method="post" class="validate" autocomplete="off" action="{{ route('transfer.wire_transfer') }}" enctype="multipart/form-data">
					{{ csrf_field() }}
					
<!-- Modal -->
<div class="modal fade" id="confirmPayment" tabindex="-1" role="dialog" aria-labelledby="confirmPaymentLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="confirmPaymentLabel">Confirm Transfer Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<!-- Preview you information -->
	  	<h6 style="color:grey;font-size:12px"><b><em>Please review the information below</b></em></h6>
		  <table width="590" cellspacing="0" cellpadding="0" border="0" align="center">
                        <tbody>
                            <tr>
                          
                                    <table cellspacing="3" cellpadding="3" border="0">
                                        <tbody>

                                            <tr>
                                                <td class="preview_title"><strong>Bank :</strong></td>
                                                <td  class="preview_data" id='pre_bank'></td>
                                            </tr>
											<tr>
                                                <td class="preview_title"><strong>Swift Code :</strong></td>
                                                <td  class="preview_data" id='pre_swift_code'></td>
                                            </tr>
											<tr>
                                                <td class="preview_title"><strong>Currency :</strong></td>
                                                <td  class="preview_data" id='pre_currency'></td>
                                            </tr>
											<tr>
                                                <td class="preview_title"><strong>Branch :</strong></td>
                                                <td  class="preview_data" id='pre_branch'></td>
                                            </tr>
											<tr>
                                                <td class="preview_title"><strong>Account Number :</strong></td>
                                                <td  class="preview_data" id='pre_account_number'></td>
                                            </tr>
											<tr>
                                                <td class="preview_title"><strong>Account Holder Name :</strong></td>
                                                <td  class="preview_data" id='pre_account_holder_name'></td>
                                            </tr>

											<tr>
                                                <td class="preview_title"><strong>Amount :</strong></td>
                                                <td  class="preview_data" id='pre_amount'></td>
                                            </tr> 
											<tr>
                                                <td class="preview_title"><strong>Address</strong></td>
                                                <td  class="preview_data" id='pre_address'></td>
                                            </tr>
											<tr>
                                                <td class="preview_title"><strong>Telephone :</strong></td>
                                                <td  class="preview_data" id='pre_phone'></td>
                                            </tr> <tr>
                                                <td class="preview_title"><strong>Email :</strong></td>
                                                <td  class="preview_data" id='pre_email'></td>
                                            </tr> <tr>
                                                <td class="preview_title"><strong>Note :</strong></td>
                                                <td  class="preview_data" id='pre_note'></td>
                                            </tr>
											

                                        </tbody>
                                    </table>
                                   
                                </td>
                            </tr>
                        </tbody>
                    </table>
	  	<!-- Preview you information -->
      </div>
      <div class="modal-footer">
       <button type="submit" class="btn btn-success btn-lg btn-block">Confirm Transaction</button> 
					
      </div>
    </div>
  </div>
</div>
<!-- //////////////////////Modal -->
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label class="control-label">{{ _lang('Bank') }}</label>
								<input type="text" class="form-control " onchange='update_preview(this,"pre_bank")' data-selected="{{ old('bank') }}" name="bank" id="bank" required>
									
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label">{{ _lang('Swift Code') }}</label>
								<input type="text" class="form-control" id="swift_code" name="swift_code"  onchange='update_preview(this,"pre_swift_code")'>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label">{{ _lang('Currency') }}</label>
								<input type="text" class="form-control" id="currency" name="currency"  onchange='update_preview(this,"pre_currency")'>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label class="control-label">Branch </label>
								<input type="text" class="form-control "  name="branch" id="branch"  onchange='update_preview(this,"pre_branch")'>
								
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label">{{ _lang('Account Number') }}</label>
								<input type="text" class="form-control" name="td[account_number]" value="{{ old('td.account_number') }}"  onchange='update_preview(this,"pre_account_number")' required>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label">{{ _lang('Account Holder Name') }}</label>
								<input type="text" class="form-control" name="td[account_holder_name]" value="{{ old('td.account_holder_name') }}"  onchange='update_preview(this,"pre_account_holder_name")' required >
							</div>
						</div>

						<div class="col-md-12">
							<div class="form-group">
								<label class="control-label">{{ _lang('Amount') }}</label>
								<input type="text" class="form-control float-field" name="amount" value="{{ old('amount') }}" required  onchange='update_preview(this,"pre_amount")'>
								<small id="amount_limit"></small>
								<p class="text-info" id="fee"></p>
							</div>
						</div>
				
						
						<div class="col-md-12">
							<div class="form-group">
								<label class="control-label">Address</label>
								<input type="address" class="form-control "  name="address" id="address" required  onchange='update_preview(this,"pre_address")'>
									
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
							
								<label class="control-label">Telephone</label>
								<input type="tel" class="form-control "  name="phone" id="phone" required  onchange='update_preview(this,"pre_phone")'>
								<h6 style="color:red;font-size:12px"><b><em>Begin with your country code</b></em></h6>
									
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label class="control-label">Email</label>
								<input type="mail" class="form-control "  name="email" id="phone" required  onchange='update_preview(this,"pre_email")'>
									
							</div>
						</div>

						<div class="col-md-12">
							<div class="form-group">
								<label class="control-label">{{ _lang('Note') }}</label>
								<textarea class="form-control" name="note"  onchange='update_preview(this,"pre_note")'>{{ old('note') }}</textarea >
							</div>
						</div>

						<div class="col-md-12">
							<h6 id="instructions"></h6>
						</div>

						<div class="col-md-12 mt-4">
							<div class="form-group">
							<button type="button" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#confirmPayment" onclick="updatePreview()"> <i class="icofont-check-circled"></i> {{ _lang('Submit') }}</button>
							</div>
						</div>
					</div>
			    </form>
			</div>
		</div>
    </div>
</div>
@endsection

@section('js-script')
<script>
	function update_preview(form_element,pre_element)
	{
		document.getElementById(pre_element).innerHTML =form_element.value;
	}
	function updatePreview() {
		jQuery('input').trigger('change');
		jQuery('select').trigger('change');		
	}
	
(function ($) {
  "use strict";
$(document).on('change','#bank',function(){
	var getBank=1;
		if(getBank != ''){
			$.ajax({
				url: "{{ route('transfer.get_other_bank_details') }}" + "/" + getBank,
				success: function(data){
					var currency = data['currency']['name'];
					// $("#swift_code").val(data['swift_code']);
					$("#currency").val(currency);
					$("#instructions").html(data['descriptions']);
					$("#fee").html("{{ _lang('Transaction Fee') }} " + currency +' '+ data['fixed_charge'] + " + " + data['charge_in_percentage'] + "%");
					$("#amount_limit").text("{{ _lang('Transfer Limit') }} (" + currency + " " + data['minimum_transfer_amount'] + " - " + currency + " " + data['maximum_transfer_amount'] + ")");
				}
			})
		}
	});
})(jQuery);
</script>
@endsection


