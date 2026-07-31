Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACBBC54F54
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 14:30:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379173.1623948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpoFp-0004WW-37; Fri, 31 Jul 2026 14:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379173.1623948; Fri, 31 Jul 2026 14:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpoFp-0004WP-01; Fri, 31 Jul 2026 14:30:29 +0000
Received: by outflank-mailman (input) for mailman id 1379173;
 Fri, 31 Jul 2026 14:30:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1wpoFn-0004WJ-L2
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 14:30:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpoFm-00H80u-Jt
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 16:30:26 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a6cb167-bab6-0a2a0a5309dd-0a2a45048a42-24
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:30:18 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a6cb179-b57f-0a2a45040019-a065830991ee-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:30:17 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 89848832FB23;
 Fri, 31 Jul 2026 10:28:30 -0400 (EDT)
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
Subject: Re: Re: [PATCH v2] nSVM: Check injected event consistency
Date: Fri, 31 Jul 2026 15:26:58 +0100
Message-ID: <20260731142700.2207713-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <1785247466.8631fc262581453bbf619ec5b2062170.19fa90a823a000e099@vates.tech>
References: <1785247466.8631fc262581453bbf619ec5b2062170.19fa90a823a000e099@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1785508218-506DAB50-273F4A3F/0/0
X-purgate-type: clean
X-purgate-size: 3546

On 28.07.2026 14:04, Teddy Astie wrote:
>On 16.07.2026 17:41, Abdelkareem Abdelsaamad wrote:
>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>> @@ -320,6 +320,31 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>>       svm_dump_sel("  TR", &vmcb->tr);
>>   }
>>   
>> +static bool is_valid_svm_vmcb_injected_exception_vector(
>> +    const struct vmcb_struct *vmcb, uint8_t vmcb_injected_vector)
>> +{
>> +    return ( (vmcb_injected_vector == X86_EXC_DE) ||
>> +             (vmcb_injected_vector == X86_EXC_DB) ||
>> +             (vmcb_injected_vector == X86_EXC_BP) ||
>> +             (vmcb_injected_vector == X86_EXC_OF) ||
>> +             (vmcb_injected_vector == X86_EXC_BR) ||
>
>This particular exception is special. AMD APM states that this event is 
>"impossible" if the guest is in 64-bit mode and will cause 
>VMEXIT_INVALID in such case.
>
> > If the VMM attempts to inject an event that is impossible for the 
>guest mode (e.g., a #BR exception when the guest is in 64-bit mode), the 
>event injection will fail and no guest state instructions will be 
>executed; VMRUN will immediately exit with an error code of VMEXIT_INVALID.
>
>So this one likely want a additional check for hvm_guest_x86_mode() != 
>X86_MODE_64BIT.
>
>It looks like #OF has the same quirk (invalid in 64-bits mode).
>
I agree your point is valid. I will address in V3.
>Though I don't know if any other exception has a similar behavior though.
I have double-checked the APM vOL3(24594—Rev. 3.37—jULY 2025) regarding the
other exception vectors and instructions. Vector 4 (#OF) and vector 5 (#BR) are
unique because their triggering instructions BOUND and INTO are invalid and
disabled in 64-bit mode, making them structurally invalid. Other vectors remain
legal across the other modes. In V3, I will make use of hvm_guest_x86_mode to
correctly isolate these two cases.
>
>> +             (vmcb_injected_vector == X86_EXC_UD) ||
>> +             (vmcb_injected_vector == X86_EXC_NM) ||
>> +             (vmcb_injected_vector == X86_EXC_DF) ||
>> +             (vmcb_injected_vector == X86_EXC_TS) ||
>> +             (vmcb_injected_vector == X86_EXC_NP) ||
>> +             (vmcb_injected_vector == X86_EXC_SS) ||
>> +             (vmcb_injected_vector == X86_EXC_GP) ||
>> +             (vmcb_injected_vector == X86_EXC_PF) ||
>> +             (vmcb_injected_vector == X86_EXC_MF) ||
>> +             (vmcb_injected_vector == X86_EXC_AC) ||
>> +             (vmcb_injected_vector == X86_EXC_MC) ||
>> +             (vmcb_injected_vector == X86_EXC_XM) ||
>> +             (vmcb_injected_vector == X86_EXC_HV) ||
>> +             (vmcb_injected_vector == X86_EXC_SX) ||
>> +             (vmcb_get_sev_es(vmcb) && vmcb_injected_vector == X86_EXC_VC) );
>> +}
>
>I think using a switch here would help making things more readable, 
>especially if we need to add additional comparisons in specific cases 
>(SEV-ES for #VC, !64-bits for #BR and #OF, ...).
>
>I have in mind something like
>
>   switch (vmcb_injected_vector)
>   {
>   case X86_EXC_OF:
>   case X86_EXC_BR:
>       return hvm_guest_x86_mode(v) != X86_MODE_64BIT;
>
>   (all other special cases, ...)
>
>   case X86_EXC_UD:
>   (all other simple cases ...)
>       return true;
>
>   default:
>       return false;
>   }
Yes, I agree writing it with switch-case makes sense with this structure. I
will change to switch structure in V3.
>
>Teddy
--Abdelkareem

