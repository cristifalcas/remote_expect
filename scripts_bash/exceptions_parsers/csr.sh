function csr() {
  reg="(ERROR|FATAL|INFO): [[:print:]]{1,}"
  for filename in ${FILES[@]}; do
  gawk --re-interval -v RS="$regdate $regtime $reg\n" -v FS="\n" '{
    c=split(FILENAME,arr,"/");fname=arr[c];
    if (NR>1) {
      split(MATCH, array, " ")
      if ( array[3] == "ERROR" ) {
		pos = 1;
      } else if ( array[3] == "FATAL" ) {
		pos = 1
	  } else {
		pos =1
      }

      if ( ($pos != "") &&
	    ($pos != "com.mind.csr.core.CSRException: Account category Commercial is not supported by assigned package/product.") &&
	    ($pos != "com.mind.csr.core.CSRException: Account type must be entered.") &&
	    ($pos != "com.mind.csr.core.CSRException: Tariff plan is not overridden") &&
	    ($pos != "com.mind.csr.core.CSRException: Data cre?rii survine datei data activ?rii.") &&
	    ($pos != "com.mind.utils.exceptions.MindTypeException: Trebuie introdus c?mpul Sum?.") &&
	    ($pos != "com.mind.csr.core.CSRException: C?mpul C?mp avansat '"'"'Num?r de ?nregistrare TVA'"'"' trebuie s? fie numeric.") &&
	    ($pos !~ "^com.mind.utils.exceptions.MindTypeException: Nu s-a g?sit [[:print:]]{1,}\\/[[:print:]]{1,}.$")  &&
	    ($pos != "com.mind.utils.exceptions.MindTypeException: Trebuie introdus c?mpul Suma.") &&
	    ($pos != "com.mind.csr.core.CSRException: Invoice for new account should include goods or adjustments only.") &&
	    ($pos != "com.mind.csr.core.CSRException: Account does not exist.") &&
	    ($pos != "com.mind.csr.core.CSRException: Codul activ al tarifului nu poate fi schimbat.") &&
	    ($pos != "com.mind.csr.core.CSRException: Partea de domeniu a adresei de E-mail este incorect?.") &&
	    ($pos != "com.mind.csr.core.CSRException: C?mpul Pachet trebuie selectat.") &&
	    ($pos != "com.mind.csr.core.CSRException: Sec?iunea expediere nepermis?. Contul nu este facturabil sau este de tip voucher/card debit.") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: N�mero do PIN [[:digit:]]{1,} inv�lido.$")  &&
	    ($pos != "com.mind.csr.core.CSRException: Elementul nou este deja alocat.") &&
	    ($pos != "com.mind.csr.core.CSRException: Lipse?te adresa destinatarului.") &&
	    ($pos != "com.mind.csr.core.CSRException: Creation date is greater than activation date.") &&
	    ($pos != "com.mind.csr.core.CSRException: Strada intodus? nu exist? ?n localitatea selectat?.") &&
	    ($pos != "com.mind.csr.core.CSRException: Data cre?rii survine datei Data activ?rii.") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Data cre?rii trebuie s? fie mai mic dec?t sau egal cu [[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}.$")  &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Tranzac?ia financiar? [[:digit:]]{1,} este deja anulat?.$")  &&
	    ($pos != "com.mind.csr.core.CSRException: Código ou ID deve ser introduzido.") &&
	    ($pos != "com.mind.csr.core.CSRException: Elementul nu a fost g?sit ?n Gestionare Resurse.") &&
	    ($pos != "com.mind.csr.core.CSRException: E-mail address is invalid. E-mail must be like local@domain.") &&
	    ($pos != "com.mind.csr.core.CSRException: Data na?terii trebuie s? fie ?ntre anul 1900 ?i prezent") &&
	    ($pos != "com.mind.csr.core.CSRException: Adresa de E-mail este incorect?. E-mail-ul trebuie sa arate astfel: local@domeniu.") &&
	    ($pos != "com.mind.csr.core.CSRException: C?mpul C?mp avansat '"'"'Cod fiscal vechi'"'"' trebuie s? fie numeric.") &&
	    ($pos != "com.mind.csr.core.CSRException: Nu se poate ad?uga tranzac?ie financiar? pentru cont nefacturabil.") &&
	    ($pos != "com.mind.csr.core.CSRException: Adresa E-mail pentru adresa contact lipse?te.") &&
	    ($pos != "com.mind.csr.core.CSRException: Aceast? condi?ie este deja existent?.") &&
	    ($pos != "com.mind.csr.core.CSRException: Valoarea '"'"'P?n? la data de'"'"'nu poate fi anterioar? valorii '"'"'De la data de'"'"'. ") &&
	    ($pos != "com.mind.csr.core.CSRException: One of the following must be entered: Receipt No., Transaction ID, From date, To date.") &&
	    ($pos != "com.mind.csr.core.CSRException: To date cannot be earlier than the From date.") &&
	    ($pos != "com.mind.csr.core.CSRException: Expiration date must be entered.") &&
	    ($pos != "com.mind.csr.core.CSRException: C?mpul Cod po?tal trebuie s? fie numeric.") &&
	    ($pos != "com.mind.utils.exceptions.MindTypeException: C?mpul Nume pachet trebuie selectat.") &&
	    ($pos != "com.mind.csr.core.CSRException: Trebuie introdus? una dintre urm?toarele: De la data, P?n? la data.") &&
	    ($pos != "com.mind.csr.core.CSRException: Address for the mailing contact is missing.") &&
	    ($pos != "com.mind.utils.exceptions.MindTypeException: Cerere pachet planificat deja existent? pentru acest cont.") &&
	    ($pos != "com.mind.csr.core.CSRException: Trebuie introdus? una dintre urm?toarele: Nr. Factur?, De la data, P?n? la data.") &&
	    ($pos != "com.mind.csr.core.CSRException: C?mpul Sum? divizat? este incorect.") &&
	    ($pos != "com.mind.csr.core.CSRException: Crearea contului nu este permis?. Statutul p?rintelui este incorect") &&
	    ($pos != "com.mind.csr.core.CSRException: C?mpul Cod cont exist? deja!") &&
	    ($pos != "com.mind.utils.exceptions.MindTypeException: C?mpul Num?r de telefon trebuie selectat.") &&
	    ($pos != "com.mind.utils.exceptions.MindTypeException: Discount must be entered.") &&
	    ($pos != "com.mind.csr.core.CSRException: Até a data deve ser maior ou igual a A partir da data.") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Data expir\\?rii trebuie s\\? survin\\? datei [[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}\\.$") &&
	    ($pos != "com.mind.csr.core.CSRException: Reactivate expired service is not allowed.") &&
	    ($pos != "com.mind.csr.core.CSRException: This request is already registered in the system.") &&
	    ($pos != "com.mind.csr.core.CSRException: Release service failed, caused by: Timeout interval elapsed.") &&
	    ($pos != "com.mind.utils.exceptions.MindTypeException: No adjustments were found for invoice.") &&
	    ($pos != "com.mind.csr.core.CSRException: Discount must be greater than zero.") &&
	    ($pos != "com.mind.csr.core.CSRException: Bank code not found.") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Destina\\?ia [[:digit:]]{1,} nu este permis\\? de limit\\?rile reducerii de tip Prieteni & Familie de la nivel de serviciu\\.$") &&
	    ($pos != "com.mind.csr.core.CSRException: Limita Destina?ie dep??it?.") &&
	    ($pos != "com.mind.csr.core.CSRException: Advanced field '"'"'Activabil Automat'"'"' must be entered.") &&
	    ($pos != "com.mind.csr.core.CSRException: Cheia element este obligatorie atunci c?nd este folosit? drept c?mp de intermediere.") &&
	    ($pos != "com.mind.csr.core.CSRException: C?mpul Data de ?ncheiere a planului de tarifare este incorect.") &&
	    ($pos != "com.mind.csr.core.CSRException: Cannot add finance transaction for non-billable account.") &&
	    ($pos != "com.mind.csr.core.CSRException: Caracteristica (Barring of all outgoing Calls (BAOC)) nu poate fi selectat?.") &&
	    ($pos != "com.mind.csr.core.CSRException: Categoria contului Comercial nu este suportat? de produsul alocat.") &&
	    ($pos != "com.mind.csr.core.CSRException: Cod banc? nu a fost g?sit.") &&
	    ($pos != "com.mind.csr.core.CSRException: Cont nu exist?.") &&
	    ($pos != "com.mind.csr.core.CSRException: Contul are procese comerciale active.") &&
	    ($pos !~ "$com.mind.csr.core.CSRException: Feature \\(Barring of all outgoing Calls \\(BAOC\\)\\) cannot be selected.") &&
	    ($pos != "com.mind.csr.core.CSRException: ID or Code must be entered.") &&
	    ($pos != "com.mind.csr.core.CSRException: Introduce?i cel pu?in un criteriu de c?utare.") &&
	    ($pos != "com.mind.csr.core.CSRException: Item key is mandatory when is used as mediation field.") &&
	    ($pos != "com.mind.csr.core.CSRException: Número do PIN deve ser introduzido.") &&
	    ($pos != "com.mind.csr.core.CSRException: Numele si prenumele tipului de contact exist? deja") &&
	    ($pos != "com.mind.csr.core.CSRException: O voucher năo possui serviço para recarga, por favor, verifique o PIN.") &&
	    ($pos != "com.mind.csr.core.CSRException: P?n? la data trebuie s? fie mai mare sau egal(?) cu De la data.") &&
	    ($pos != "com.mind.csr.core.CSRException: Payment amount must include payment for all selected invoices.") &&
	    ($pos != "com.mind.csr.core.CSRException: Provider must be entered.") &&
	    ($pos != "com.mind.csr.core.CSRException: Tariff age is invalid.") &&
	    ($pos != "com.mind.csr.core.CSRException: Tariff must be entered.") &&
	    ($pos != "com.mind.csr.core.CSRException: The new item is already assigned.") &&
	    ($pos != "com.mind.csr.core.CSRException: This condition line already exists. ") &&
	    ($pos != "com.mind.csr.core.CSRException: Utilizatorul nu poate edita Clas? credit limitat") &&
	    ($pos != "com.mind.utils.exceptions.MindTypeException: C?mpul Num?r de telefon trebuie selectat..") &&
	    ($pos != "com.mind.utils.exceptions.MindTypeException: Discount is invalid.") &&
	    ($pos != "com.mind.utils.exceptions.MindTypeException: Factura nu a putut fi reexpediat? deoarece factura nu a fost ?nc? expediat?.") &&
	    ($pos != "com.mind.utils.exceptions.MindTypeException: Imprimarea raportului a e?uat.") &&
	    ($pos != "com.mind.utils.exceptions.MindTypeException: Quantity is invalid.") &&
	    ($pos != "com.mind.utils.exceptions.MindTypeException: Scheduled date must be entered.") &&
	    ($pos != "com.mind.utils.exceptions.MindTypeException: Trebuie introdus? data planificat?. ") &&
	    ($pos !~ "^com.mind.csr.(web|core).(CSRWebException|CSRException): Trebuie introdus c\\?mpul") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: A mutually exclusive group \\([[:print:]]{1,}\\) cannot hold more than one selected feature.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Access key must be numeric.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Account class must be entered.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Account code [[:digit:]]{1,} class is not allowed to have descendent accounts$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Account goods instance does not exist.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Feature [[:print:]]{1,} does not exist\\.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Account not found.\rYou may want to try an extended search\rusing the search fields in the Accounts page.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Account Phone Number Range: [ [[:digit:]]{1,} - [[:digit:]]{1,}] already exists!$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Acest cont are tranzac\\?ii comerciale\\.") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Active tariff code cannot be changed.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Advanced field [[:print:]]{1,} does not exist.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: At least one search criteria must be entered.$")  &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Bank name must be entered.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Cannot reactivate a deactivated service under a deactivated subproduct.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Tariff [[:print:]]{1,} cannot be assigned to [[:print:]]{1,} service$") &&
	    ($pos != "^com.mind.utils.exceptions.MindTypeException: Nu s-a g?sit MEID/ESN.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Cannot use more than one goods item with IMSI mediation value for the same service.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Cannot use this goods item mediation fields.[[:cntrl:]]{1}Account has two services of the same type.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Billability change is not allowed.[[:cntrl:]]{1,}Previous period should be invoiced\\.$") &&
	    ($pos !~ "^com.mind.utils.exceptions.MindTypeException: Cannot generate invoice.[[:cntrl:]]{1,}The finance server did not complete transactions for the billing period.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Schimbarea posibilit\\?\\?ii de facturare nu este permis\\?.[[:cntrl:]]{1,}Perioada anterioar\\? trebuie facturat\\?.$") &&
	    ($pos != "com.mind.csr.core.CSRException: Tranzac?ia nu poate fi anulat?") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Cannot delete this phone number.[[:cntrl:]]{1}It is used as mediation field by a resource management item.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Card holder name must be entered.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Closed by is invalid.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Contact type, last name and first name already exist.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Contul nu a fost g\\?sit\\.") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Credit card number length is invalid.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Credit card number length is limited to [[:digit:]]{1,} digits.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: De la data trebuie s\\? fie mai mare sau egal\\(\\?\\) cu [[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Discount must be less than or equal to 100.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: E-mail account name already exists!$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: E-mail account name is invalid.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: E-mail account name must be entered.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: E-mail address already exists!$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: E-mail address contains invalid characters.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: E-mail address local part is invalid.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: E-mail password must be entered.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Expiration date must be less than [[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Expiration year must be between [[:digit:]]{4} and [[:digit:]]{4}") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Feature cannot be selected [[:print:]]{1,}$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Force generation \\(ignore generation rules\\) is not relevant to draft invoice generation.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Framed IP address must be entered.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Framed IP netmask must be entered.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: From date must be greater or equal to [[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: From number is invalid.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Goods instance cannot be assigned directly to account or product/package.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Goods type has not been assigned to this service.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: IP already exists in pool.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: IP is in use$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Item key must be entered.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Last name must be entered.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Mailing contact is missing.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Número do PIN [[:print:]]{1,} já existe\\!$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Năo é possível carregar o cartăo. Número do PIN  [[:print:]]{1,} năo existe\\.") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: One of the following must be entered: From date, To date.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: One of the following must be entered: Invoice No., From date, To date.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Package must be selected.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Password must be entered.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Phone Number is invalid.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Phone number mediation value already assigned.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Phone Number must be entered.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Phone Number [ [[:digit:]]{1,} ] already exists!$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Processor is not running! [[:cntrl:]]{2} Please run processor.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: S-au g\\?sit prea multe rezultate pentru ") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Shipment section not allowed. Account is not billable or is of type voucher/debit card.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Subnet mask must be entered.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Tariff plan end date is invalid.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: The service cannot have IP allocation and multiple concurrent sessions defined.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Tipul de serviciu [[:print:]]{1,} nu este suportat.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: User Code must be numeric.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: User ID already exists!$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: User ID is invalid.$")  &&
	    ($pos !~ "^com.mind.csr.core.CSRException: User ID must be entered.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Value must be entered.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Value [[:digit:]]{1,} must be entered.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Voucher [[:print:]]{1,} está inutilizável.$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Web login name already exists!$") &&
	    ($pos !~ "^com.mind.csr.core.CSRException: Zip must be at most [[:digit:]]{1,} characters.$") &&
	    ($pos !~ "^com.mind.csr.web.CSRWebException: Verificare [[:print:]]{1,} must be entered.$") &&
	    ($pos !~ "^com.mind.utils.exceptions.MindTypeException: A scheduled package request already exists for this account.$") &&
	    ($pos !~ "^com.mind.utils.exceptions.MindTypeException: Amount is invalid.$") &&
	    ($pos !~ "^com.mind.utils.exceptions.MindTypeException: Amount must be entered.$") &&
	    ($pos !~ "^com.mind.utils.exceptions.MindTypeException: Cannot generate an invoice with usage. A periodic invoice should be generated.$") &&
	    ($pos !~ "^com.mind.utils.exceptions.MindTypeException: Cannot generate invoice. The account has missed a periodic invoice.$") &&
	    ($pos !~ "^com.mind.utils.exceptions.MindTypeException: C\\?mpul Card [[:print:]]{1,} trebuie selectat\\.$") &&
	    ($pos !~ "^com.mind.utils.exceptions.MindTypeException: Invalid scheduled date.[[:cntrl:]]{2}The scheduled date must be greater than current date.$") &&
	    ($pos !~ "^com.mind.utils.exceptions.MindTypeException: Invoice for new account should include goods, adjustments and/or interest calculation only.$") &&
	    ($pos !~ "^com.mind.utils.exceptions.MindTypeException: Invoice was not generated - amount due [[:print:]]{1,}[[:digit:]]{1,}.[[:digit:]]{1,} is less than [[:print:]]{1,}[[:digit:]]{1,}.[[:digit:]]{1,}.$") &&
	    ($pos !~ "^com.mind.utils.exceptions.MindTypeException: Nu s-a g\\?sit [[:print:]]{1,}\\$.") &&
	    ($pos !~ "^com.mind.utils.exceptions.MindTypeException: Print report failed.$") &&
	    ($pos !~ "^com.mind.utils.exceptions.MindTypeException: Tipul de bun cu codul [[:print:]]{1,} nu exist\\?$") ) {
	print MATCH,$1;
	print $2
	if (pos==2) {
	    print $3
	    print $4
	}
	print "++++++++++++++++++++++++ "fname"\n";
      }
    }
    MATCH=RT
  }' $filename
  done
}
