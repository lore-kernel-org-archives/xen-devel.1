Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A119ECC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 11:46:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447035.1663191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGaxx-0003N4-Qi; Tue, 13 Oct 2026 11:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447035.1663191; Tue, 13 Oct 2026 11:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGaxx-0003Mw-Ms; Tue, 13 Oct 2026 11:46:45 +0000
Received: by outflank-mailman (input) for mailman id 1447035;
 Tue, 13 Oct 2026 11:46:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1xGaxw-0003Mq-D4
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 11:46:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGaxv-007jFx-LJ
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 13:46:43 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ace1a18-e002-0a2a0a5209dd-0a2a4509e4b8-30
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 13:46:43 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ace1a21-be1a-0a2a45090019-a237832fc970-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 13:46:41 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 0CC4F4EE0237;
 Tue, 13 Oct 2026 13:46:41 +0200 (CEST)
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
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1791892001;
	b=ZDwOWxz8c5Y4cae5MnGwmJNevFbdLAQSYENXLD0dRxPnS9WFLbYoHbbZbjE/x8oULRvi
	 vovuKbAs45uSSR0xYbmwTRgT2POWNSIbh50u1K4toGNFDG36zxC3zx1BqCRvN81RGYzAX
	 qh8+xE/AJhLM3M8xyKOgczeOzPwlkeH+Ibi72u8+yhEaalfuQdZuXNUlCN9GsKM+SbGXa
	 hvp2Ue3nAh5CBkta2aORZ4uKyjdKOAcvScQCdZzMTM3cXO1FabDUq4TW4iwLLo/1PfB03
	 GaSNQhD82CNkfiT+cxcjjo/EFrxkSbsgNtB065g7fmrVWMZGDVAc/N7oTV1239qLmYH3H
	 ToX8LRskreut3e3r0QcrdqPxpf19aROsR3hE8LtWNpG0Dc7mK+5CFl2u8IwyF7mAUCdiS
	 8aDEANuBsG/THWfs+6RuMiPNMVR/DqutjzY+seHlEMuUUUpnhfnBLHwFm/pfBF5OPyrLX
	 mgxF55VyJMBmu9jen5UHDW2TYnfNbdd1s9BzdPuYOIA0tiaMctLHMWzzFUQBmaDeNzrSk
	 Wv+t++TNJiRnv5GQDrN6YYa0p5i6ycujfWKM9EvYrHt3Gcad/9qU/Hd277neutyhYJNlW
	 52yzU4gX4BMAtjudPs9qxepdlRllZrl3x5nfjEE59BOJgs01zIOCoO9hVi8JUjU=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791892001;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=0aFJGHn6IXliAaZZ218UHdsSPfPzBsMF6hxm+/N3Td8=;
	b=0smyOpQDTfDMiBA2rqPDXnaVl5IjvFXJfMfl1a5epufHcRbS1tCCYLjhNcI6sogVuWDy
	 qAnXPDaCDGxvs+vk+G6YOJ4d36eYhZKpNWbK4wFR5UsZwZw8Df3gJytoh0CMeIs0ZoS07
	 x10hSK2ScVUetpAIAI6KFnFqxY+bAJGg9fMuG565gO/i2A008o0uFcRnH65V1YjxHcGbk
	 0DoTTk5IZi47zf90tBFvX1g/c4BxWgfcybCDcVL9mDNwLAMt47ObX/8A6Uu0/VfLmVfOx
	 YvXAqo0nNrcHfQbA/dju4iEY3Q88CDzx3AoxyGiXpUvIPHQWFhXFF5aUBMxhak31l8Mp7
	 G/Vu315zeBfZopu23GKFgDL/oHktSAlvQtCd04rLT7XfOcZ4vXYLK9U11lT+wkUILtfA5
	 EJn1Q3eGOrIlmibhO604VdJPn7w0euBldu9r6V218kg+OowayO/Odp9GTFU/meuriKnvt
	 t5yrwC2EMlvy9Nll60yjCcmY1IUQs3ld+qQuAR6ecdSUikzdhb+nBswbY2wwIqMuOdL8V
	 khp/mdcx13kIWVnI/6lrLLUoSvbexFrDl5odVym9u8cEgW9twqnZ++WcamrvEos4+X/nb
	 DBA0kc3HyPUizTyRMkTNt/GvBPPA5EIFAKzRBKrGhDYb1yw9GOOxHUuoPW+CwMI=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 13 Oct 2026 13:46:41 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Dmytro Prokopchuk1
 <dmytro_prokopchuk1@epam.com>
Subject: Re: [PATCH] automation/eclair: generalize the noreturn
 function-pointer deviation
In-Reply-To: <96319798-7cf6-4905-9b1b-37bb6a41bdcd@suse.com>
References: <d68c56607781bfa829766aed36eeb31f06080fbc.1791224638.git.dmytro_prokopchuk1@epam.com>
 <5b5cccc8bbbc4c87fc99427eb4c1c413@bugseng.com>
 <96319798-7cf6-4905-9b1b-37bb6a41bdcd@suse.com>
Message-ID: <d66bcdda409b9144da2c9bc75d3afd1b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1791892001-BDCC7034-DA8BD8C2/0/0
X-purgate-type: clean
X-purgate-size: 3248

On 2026-10-12 08:52, Jan Beulich wrote:
> On 09.10.2026 17:37, Nicola Vetrini wrote:
>> On 2026-10-05 20:56, Dmytro Prokopchuk1 wrote:
>>> The R11.1 safe cast only matched void noreturn (*)(void *). Accept 
>>> any
>>> noreturn function pointer converted to a compatible function pointer.
>>> canonical() covers typeof destinations, and 
>>> compatible_deep_unqualified
>>> keeps the parameter and return types aligned.
>>> 
>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>> ---
>>> 
>>> This patch tries to cover both of these:
>>> 
>>> 1. eclair: widen R11.1 noreturn cast deviation
>>> https://patchew.org/Xen/c6632dd805a119aca54b9d1ae2eea68ef9c1334c.1790674358.git.dmytro._5Fprokopchuk1@epam.com/
>>> 
>>> 2. Eclair: relax "noreturn" function-pointer conversion deviation
>>> https://patchew.org/Xen/6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com/4cca58b6-b555-4064-aa26-5204dc4b99cc@suse.com/
>>> 
>>> Test CI pipeline:
>>> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2914802667
>>> 
>>> The only one Rule11.1 violation remains, which is covered by this 
>>> Jan's
>>> patch:
>>> x86/kexec: address Misra rule 11.1 violation in machine_kexec_load()
>>> 
>> 
>> The change itself is fine, but the aspect I'm concerned with is the
>> following: if you have a function marked noreturn, the compiler is
>> entitled to
>> essentially remove any code following it, so in principle this could 
>> be
>> the case also when invoking a function pointer (i.e. the compiler has 
>> no
>> obligation to retain code after a call to a function pointer that is
>> actually a noreturn function). While this in practice may not happen
>> often (e.g., the analysis done by a compiler is probably too shallow 
>> to
>> actually infer paths where the function pointer is only ever assigned 
>> to
>> noreturn functions when it is called), it is still not completely true
>> to say that the behavior is not altered by casting away noreturn.
> 
> With "behavior" here you mean that of the compiler? Because Xen's 
> behavior
> won't change if the code following such an indirect call isn't 
> eliminated.
> It will "just" be unreachable code then.
> 
> That said, ...
> 

I was more worried about the other direction: code that is expected to 
be executed by the developer that is instead removed by the compiler, 
with (rightfully) no diagnostic. Clearly if code is not removed it would 
be unreachable, but such that a static analysis tool or compiler will 
likely not diagnose, precisely because the attribute is dropped, so 
there may be missing diagnostics.

>> I have
>> given in [1] my R-by to the previous form of this deviation, but I
>> realize that this aspect should be mentioned. This is of course
>> supported by testing and code coverage evidence that the behavior is
>> indeed the same, or a suitable guarantee from the compiler vendor that
>> the behavior never diverges.
> 
> ... making this explicit in the patch and/or deviation description is 
> of
> course not going to hurt.
> 
> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

