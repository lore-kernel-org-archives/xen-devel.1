Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18339C5AC7A
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2026 14:28:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1386041.1628240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsLYM-0006cI-4w; Fri, 07 Aug 2026 14:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1386041.1628240; Fri, 07 Aug 2026 14:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsLYM-0006cA-1i; Fri, 07 Aug 2026 14:28:06 +0000
Received: by outflank-mailman (input) for mailman id 1386041;
 Fri, 07 Aug 2026 14:28:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1wsLYK-0006aw-Ep
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 14:28:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wsLYJ-001Pe9-Rs
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 16:28:03 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a75eb73-e002-0a2a0a5209dd-0a2a450bc9b0-0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 16:28:03 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a75eb72-b7e8-0a2a450b0019-a0658308cbf4-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 16:28:03 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 9001C44BABEF;
 Fri,  7 Aug 2026 10:26:23 -0400 (EDT)
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
	roger.pau@citrix.com,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech
Subject: Re: Re: [PATCH v2] x86/nSVM: Check the L1 IOPM_BASE and MSRPM_BASE
Date: Fri,  7 Aug 2026 15:24:44 +0100
Message-ID: <20260807142444.2510849-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ff01adce-5807-4fda-becc-3290ad6deafc@suse.com>
References: <ff01adce-5807-4fda-becc-3290ad6deafc@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1786112883-19CC79EA-F6BB306F/0/0
X-purgate-type: clean
X-purgate-size: 2182

On 05.08.2026 10:36, Jan Beulich wrote:
>On 29.07.2026 16:38, Abdelkareem Abdelsaamad wrote:
>> @@ -294,6 +296,24 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
>>      enum hvm_translation_result ret;
>>      unsigned long *ns_viomap;
>>      bool ioport_80 = true, ioport_ed = true;
>> +    gfn_t ns_iopm_end =
>> +        gfn_add(gaddr_to_gfn(ns_vmcb->_iopm_base_pa), (IOPM_PAGES_COUNT - 1));
>> +    gfn_t ns_msrpm_end =
>> +        gfn_add(gaddr_to_gfn(ns_vmcb->_msrpm_base_pa), (MSRPM_PAGES_COUNT - 1));
>
>Nit: Why the excess parentheses around the 2nd arguments each? Without them
>the 2nd instance also more obviously stays within line length limits.
>
I will address in V3.

>> +    if ( gfn_x(ns_iopm_end) > domain_get_maximum_gpfn(v->domain) )
>
>I don't think using domain_get_maximum_gpfn() is correct here. Imo you want
>to merely check against what the guest is told in CPUID. 
I will switch to using gfn_valid() in V3 to properly align with what is valid
for the guest.
>...Everything else
>ought to be properly covered by hvm_copy_from_guest_phys() /
>hvm_map_guest_frame_ro() already. In fact for the MSR bitmap I thus can't
>see why further checking would be needed. 
Indeed,  I rechecked the call and confirmed that an invalid address should be
caught downstream in __hvm_copy() -> hvm_translate_get_page(). I will drop this
check in V3.
>..And for the I/O bitmap it looks
>to be a matter of better error handling, rather than introducing extra
>checking.
>
I tested with the address (0xffffffffffffffffUL) assigned to the VMCB::IOPM and
this just passes successfully without any error reported because it is all the
time mapped to a valid host address. So, I think an explicit extra check is
required here rather than just better error reporting.

> +    {
> +        gdprintk(XENLOG_ERR, "%s invalid _iopm_base_pa address (%#"PRIx64")\n",
> +                 __func__, ns_vmcb->_iopm_base_pa);
> +        return 1;

>Why literal 1? Yes, there is another such return in the function, but no, we
>don't want to extend that. Aiui NSVM_ERROR_VVMCB is meant here.
I will change both in V3.

>Jan

