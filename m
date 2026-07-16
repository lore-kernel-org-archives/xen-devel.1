Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F94C4450E
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 12:04:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363864.1615342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkKpB-0007Uk-Q9; Thu, 16 Jul 2026 12:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363864.1615342; Thu, 16 Jul 2026 12:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkKpB-0007Ud-MO; Thu, 16 Jul 2026 12:04:21 +0000
Received: by outflank-mailman (input) for mailman id 1363864;
 Thu, 16 Jul 2026 12:04:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1wkKpA-0007UV-6T
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 12:04:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkKp9-005k3y-JZ
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 14:04:19 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a58c8bd-5cb7-0a2a0a5109dd-0a2a45078176-22
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 14:04:19 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a58c8c2-b4ea-0a2a45070019-a0658308cb38-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 14:04:19 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 5289D43F950F;
 Thu, 16 Jul 2026 08:02:50 -0400 (EDT)
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
	teddy.astie@vates.tech
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	jason.andryuk@amd.com
Subject: Re: Re: [PATCH v1] nSVM: Check injected event consistency
Date: Thu, 16 Jul 2026 13:02:11 +0100
Message-ID: <20260716120211.1319571-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <1784124787.8631fc262581453bbf619ec5b2062170.19f661fca07000edb5@vates.tech>
References: <1784124787.8631fc262581453bbf619ec5b2062170.19f661fca07000edb5@vates.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1784203459-348C9AE4-CB4AC7EC/0/0
X-purgate-type: clean
X-purgate-size: 2040

On 15.07.2026 16:15, Teddy Astie wrote:
>+             (vmcb_get_sev_es(vmcb) && vmcb_injected_vector == X86_EXC_VC) );

>I'm not sure that #VC is gated behind SEV-ES guest.

>Regardless, injecting manually #VC is weird (especially for SEV-ES guests where it's strongly discouraged), but it could be somewhat abused to emulate some of the SEV-ES semantics. So I would suggest to threat it like the others.
However, It should be a valid VMCB configuration (#VC vector without SEV-ES fields enabled) from the hardware perspective according to the APM stated conditions. I think it is better for the hypervisor software to sanitize against such configuration. The reason is, to my understanding, the #VC vector is architecturally designed exclusively for AMD SEV-ES and SEV-SNP guests. The handlers for #VC in the guest's IDT table without SEV-ES support are not necessarily required which can still result in further debugging and security complications.

>> +    uint8_t vmcb_injected_type = vmcb->event_inj.type & SVM_EVENT_INJ_TYPE_MASK;
>> +    uint8_t vmcb_injected_vector = vmcb->event_inj.vector & SVM_EVENT_INJ_VEC_MASK;

>What are these masks for ?

>The definition of vmcb->event_inj suggest that they are not required
> > uint8_t  vector;
> > uint8_t  type:3;
Ah, right. This seems to be a leftover from my first draft implementation.
It is redundant and not really needed. I will get rid of it in the next revision.

>>   
>>   #define PRINTF(fmt, args...) do { \
>>       if ( !verbose ) return true; \
>> @@ -392,6 +419,15 @@ bool svm_vmcb_isvalid(
>>           PRINTF("eventinj: MBZ bits are set (%#"PRIx64")\n",
>>                  vmcb->event_inj.raw);
>>   
>> +    if ( vmcb_injected_type > X86_ET_SW_INT )
>> +        PRINTF("eventinj: Invalid Injected Event Type: (%#"PRIx8")\n",
>> +               vmcb_injected_type);

>What about vmcb_injected_type == 1 case ?
That is a good catch. I assumed all the representations up to X86_ET_SW_INT (4) are valid. I will
fix in the next revision.

