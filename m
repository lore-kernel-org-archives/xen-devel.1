Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC041C55196
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 18:47:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381762.1625287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqxh3-0003pK-My; Mon, 03 Aug 2026 18:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381762.1625287; Mon, 03 Aug 2026 18:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqxh3-0003pD-KQ; Mon, 03 Aug 2026 18:47:21 +0000
Received: by outflank-mailman (input) for mailman id 1381762;
 Mon, 03 Aug 2026 18:47:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1wqxh2-0003p7-85
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 18:47:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqxh0-00Fim2-BI
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 20:47:18 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a70e22d-5cb7-0a2a0a5109dd-0a2a45038af8-6
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 20:47:18 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a70e235-fae8-0a2a45030019-a0658308bfc6-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 20:47:18 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id EE4E9440E018;
 Mon,  3 Aug 2026 14:45:39 -0400 (EDT)
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
To: jbeulich@suse.com,
	xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	jason.andryuk@amd.com,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: Re: [PATCH v2] nSVM: Check injected event consistency 
Date: Mon,  3 Aug 2026 19:44:09 +0100
Message-ID: <20260803184412.2323732-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <c99c9645-4ffe-43e3-a56e-1a0c6efc006e@suse.com>
References: <c99c9645-4ffe-43e3-a56e-1a0c6efc006e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1785782838-6ECCB4E9-95CB2077/0/0
X-purgate-type: clean
X-purgate-size: 2194

On 03.08.2026 07:12, Jan Beulich wrote:
>On 31.07.2026 16:26, Abdelkareem Abdelsaamad wrote:
>> On 28.07.2026 14:04, Teddy Astie wrote:
>>> On 16.07.2026 17:41, Abdelkareem Abdelsaamad wrote:
>>>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>>>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>>>> @@ -320,6 +320,31 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>>>>       svm_dump_sel("  TR", &vmcb->tr);
>>>>   }
>>>>   
>>>> +static bool is_valid_svm_vmcb_injected_exception_vector(
>>>> +    const struct vmcb_struct *vmcb, uint8_t vmcb_injected_vector)
>>>> +{
>>>> +    return ( (vmcb_injected_vector == X86_EXC_DE) ||
>>>> +             (vmcb_injected_vector == X86_EXC_DB) ||
>>>> +             (vmcb_injected_vector == X86_EXC_BP) ||
>>>> +             (vmcb_injected_vector == X86_EXC_OF) ||
>>>> +             (vmcb_injected_vector == X86_EXC_BR) ||
>>>
>>> This particular exception is special. AMD APM states that this event is 
>>> "impossible" if the guest is in 64-bit mode and will cause 
>>> VMEXIT_INVALID in such case.
>>>
>>>> If the VMM attempts to inject an event that is impossible for the 
>>> guest mode (e.g., a #BR exception when the guest is in 64-bit mode), the 
>>> event injection will fail and no guest state instructions will be 
>>> executed; VMRUN will immediately exit with an error code of VMEXIT_INVALID.
>>>
>>> So this one likely want a additional check for hvm_guest_x86_mode() != 
>>> X86_MODE_64BIT.
>>>
>>> It looks like #OF has the same quirk (invalid in 64-bits mode).
>>>
>> I agree your point is valid. I will address in V3.
>>> Though I don't know if any other exception has a similar behavior though.
>> I have double-checked the APM vOL3(24594—Rev. 3.37—jULY 2025) regarding the
>> other exception vectors and instructions. Vector 4 (#OF) and vector 5 (#BR) are
>> unique because their triggering instructions BOUND and INTO are invalid and
>> disabled in 64-bit mode, making them structurally invalid. Other vectors remain
>> legal across the other modes.

>#BR is also used by MPX insns, which are usable from 64-bit mode.
I think this is only relevant to Intel's VMX, not AMD's SVM.
>Jan

