Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55297C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 17:58:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393224.1632072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww1as-0001Zw-Gc; Mon, 17 Aug 2026 17:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393224.1632072; Mon, 17 Aug 2026 17:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww1as-0001Zp-Dk; Mon, 17 Aug 2026 17:57:54 +0000
Received: by outflank-mailman (input) for mailman id 1393224;
 Mon, 17 Aug 2026 17:57:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1ww1ar-0001Zj-6Z
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 17:57:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ww1aq-00EUdc-05
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 19:57:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a834b87-bab6-0a2a0a5309dd-0a2a450b83c4-14
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 19:57:51 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a834b9e-b7e8-0a2a450b0019-a0658308d0d0-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 19:57:51 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 9EE1D4459EAC;
 Mon, 17 Aug 2026 13:56:06 -0400 (EDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: xen-devel@lists.xenproject.org,
	jbeulich@suse.com
Cc: andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech
Subject: Re: Re: [PATCH v3] x86/nSVM: Check the L1 IOPM_BASE assigned physical address
Date: Mon, 17 Aug 2026 18:53:56 +0100
Message-ID: <20260817175356.2744006-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0cec914c-e52f-41ee-873b-6bdbc1d1ed82@suse.com>
References: <0cec914c-e52f-41ee-873b-6bdbc1d1ed82@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1786989471-AB2DC9EA-35F9E115/0/0
X-purgate-type: clean
X-purgate-size: 2452

On ,13.08.2026  10:40 Jan Beulich wrote:
>On 07.08.2026 17:58, Abdelkareem Abdelsaamad wrote:
>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>> @@ -18,6 +18,7 @@
>>  
>>  #define NSVM_ERROR_VVMCB        1
>>  #define NSVM_ERROR_VMENTRY      2
>> +#define IOPM_PAGES_COUNT        3
>
>This new item is separate from the NSVM_ERROR_* values and hence wants separating
>by a blank line. Especially with the three numbers being in sequence, not doing
>so could end up being confusing.
>
>Considering the constant is used exactly once - do we actually need a constant?
>Can't we ...
>
>> @@ -294,6 +295,15 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
>>      enum hvm_translation_result ret;
>>      unsigned long *ns_viomap;
>>      bool ioport_80 = true, ioport_ed = true;
>> +    gfn_t ns_iopm_end =
>> +        gfn_add(gaddr_to_gfn(ns_vmcb->_iopm_base_pa), IOPM_PAGES_COUNT - 1);
>
>... use a suitable expression here, e.g. PFN_DOWN((0xffff + 3) / 8)?
OK. I will change it like that in V4.
>> @@ -302,13 +312,12 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
>>      if ( ret != HVMTRANS_okay )
>>      {
>>          gdprintk(XENLOG_ERR, "hvm_copy_from_guest_phys msrpm %u\n", ret);
>> -        return 1;
>> +        return NSVM_ERROR_VVMCB;
>>      }
>>  
>>      /* Check l1 guest io permission map and get a shadow one based on
>>       * if l1 guest intercepts io ports 0x80 and/or 0xED.
>>       */
>> -    svm->ns_oiomap_pa = svm->ns_iomap_pa;
>>      svm->ns_iomap_pa = ns_vmcb->_iopm_base_pa;
>>  
>>      ns_viomap = hvm_map_guest_frame_ro(svm->ns_iomap_pa >> PAGE_SHIFT, 0);
>
>In the description you say "without any sanity checks", yet
>hvm_map_guest_frame_ro() -> _hvm_map_guest_frame() ->
>check_get_page_from_gfn() won't allow unsuitable GFNs to be mapped. Since
>here only the first page is mapped, some extra checking may indeed be
>warranted, but the description then wants updating.
It (the first page) is actually not mapped. It properly fails. However, the Xen
code continues without any issues. The code continues with an internal Xen
allocated memory shadow_io_bitmap in nestedhvm_vcpu_iomap_get.
>
>As to that part of the description, "directly to valid host address" also
>doesn't look to adequately describe what's going on.
I will rephrase the commit message for better clarity in v4.
>--Jan

