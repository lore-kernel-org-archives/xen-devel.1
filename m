Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B53CA9ED2
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 12:52:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447824.1663675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbza-0004Ju-Nc; Tue, 13 Oct 2026 12:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447824.1663675; Tue, 13 Oct 2026 12:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbza-0004Jn-JT; Tue, 13 Oct 2026 12:52:30 +0000
Received: by outflank-mailman (input) for mailman id 1447824;
 Tue, 13 Oct 2026 12:52:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1xGbzY-0004Jh-Oy
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:52:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGbzX-00DNiH-DX
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 14:52:27 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ace2986-8faa-0a2a0a5109dd-0a2a4503af26-20
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 14:52:27 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ace298b-fae8-0a2a45030019-a237832fb85a-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 14:52:27 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id E902E4EE0235;
 Tue, 13 Oct 2026 14:52:26 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1791895947;
	b=X+FmH2uirVzikP3bCv1p01jalAUJEHtotz/+Wm6DfROPkLkj/E1kFwOqPWGF+bD0Pz0Z
	 2qy2eQ4x5MqgzC09YYAFcIjhNaEfsZjD+pzOGWk7WMicxo3LPcCz8GBjTIR0f4lSxYha/
	 /jKM0MfW6kXooJ22WMWoTBqYoIlHGlmKM8Bh97K1YroewO2SuZANjmZHOVc1M2VJXQuzb
	 l7vnkgf19sikQW4rHObgWCyCYbII5TbLHmh/R1MF1aZ1scDmEbVSKyZODg1wwAyR4r75u
	 GTl5wGwyI08dJ1GaRFj1kMpcOgN9HlxG/C+xLt5Uk4mirNPzi5E92KaQxtPKJdTmMLi6R
	 AdMJuKJ06mNaiNCGFKZsOL/Gvq1gEiZk2nJ/kUqLaDnHhxSMAjCdJU72pCHS2evGQAMJ9
	 zjHFUC0zzGy0ha9wOMcac4g0wDASFXXOkMqmSBSk0k200UjDIWWK336Tc/39XiMQFzgFt
	 +czrelyKqlSnau4zEaPmRTRg/Tsoh0zIM2pc8IPAL1hVjAkBBp0Im94wcBnD0uBTehRnW
	 fkDAv5U0JptDtD/bczePyHpAvvFA1reCEDfejQr76Vn/n8mFtYnBywJsV6hpzldPeXWNI
	 dSHToifjiJdt6nmnz48FH4i0l0QiTVVWnb6kHFpk4tANWLAjdJ9epeBzeGA577g=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791895947;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=Scx/D5lEEBOI7l8XQtkdHK7+kkeAjqtP4oi5wrvXWfA=;
	b=eXnMag59LyfBjMOtSLanfDiecS4VEZjD2Qn6DnE/AxXu+aZyoaofvxEJxQBiDpyBG0Cv
	 E55GB1w03ufez3wtjbNjxhWmAz7ZjX6UuvqBkFHPs0SK+9BblvBIwHnAj3D3RVValYATm
	 6+IRyLyflDBaVcmXdCB4Ts9yEw5FvAv/Uh5vjbrHSTCw20qMSRcuSbEk9MUfkWagvYka7
	 UoRrYY6lWmYinLda5hvFLBIRg7gnfO2avuNOlK6xCnYKGYK7ub4sE88cC6aMKM31de8lC
	 AKEbcOeXzd9mY8uRHCVacFjxszr4RtR0H2XDj4PHDELnUZqVi7ZSwvE1kVB44Y9cNt9o6
	 v7ebBiPxQAOEB3obTVZ783R0sjiS1nzODkwzlnhnIUF00z8jSzjnnTScdJ/OK67T76wdF
	 v2RLRo94sCHiLbwO1zEkMgyXTcakijLuAAcNUvv0rmmwPBai+rOGJ1l0CJ+GPAA3su5zS
	 TSaQ8m1HsFB5KIWiFtdN9cnJpk1/b/I4Kdvf1X50VH8C3ocaQObd039/NDue3ib+f12Bc
	 HSLTy3F+luJ9Mr8wAUDnxy/vAradN3JZ9TUaFctyfBMF2Hr789BTAR6vAI11UVk3hDFGw
	 keRGQ83XFTHmBjSnQdYVSkv9jRckr+jFqG7svvB+yXEsNtm5wDqzzdFLQBqn08s=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 13 Oct 2026 14:52:26 +0200
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
In-Reply-To: <870ae4c3-9776-49b0-bb62-5db71c9f6192@suse.com>
References: <d68c56607781bfa829766aed36eeb31f06080fbc.1791224638.git.dmytro_prokopchuk1@epam.com>
 <5b5cccc8bbbc4c87fc99427eb4c1c413@bugseng.com>
 <96319798-7cf6-4905-9b1b-37bb6a41bdcd@suse.com>
 <d66bcdda409b9144da2c9bc75d3afd1b@bugseng.com>
 <870ae4c3-9776-49b0-bb62-5db71c9f6192@suse.com>
Message-ID: <615008ea29f7dc71625800694c785f9d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1791895947-760FE4E9-2421FDDD/0/0
X-purgate-type: clean
X-purgate-size: 3842

On 2026-10-13 14:37, Jan Beulich wrote:
> On 13.10.2026 13:46, Nicola Vetrini wrote:
>> On 2026-10-12 08:52, Jan Beulich wrote:
>>> On 09.10.2026 17:37, Nicola Vetrini wrote:
>>>> On 2026-10-05 20:56, Dmytro Prokopchuk1 wrote:
>>>>> The R11.1 safe cast only matched void noreturn (*)(void *). Accept
>>>>> any
>>>>> noreturn function pointer converted to a compatible function 
>>>>> pointer.
>>>>> canonical() covers typeof destinations, and
>>>>> compatible_deep_unqualified
>>>>> keeps the parameter and return types aligned.
>>>>> 
>>>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>>>> ---
>>>>> 
>>>>> This patch tries to cover both of these:
>>>>> 
>>>>> 1. eclair: widen R11.1 noreturn cast deviation
>>>>> https://patchew.org/Xen/c6632dd805a119aca54b9d1ae2eea68ef9c1334c.1790674358.git.dmytro._5Fprokopchuk1@epam.com/
>>>>> 
>>>>> 2. Eclair: relax "noreturn" function-pointer conversion deviation
>>>>> https://patchew.org/Xen/6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com/4cca58b6-b555-4064-aa26-5204dc4b99cc@suse.com/
>>>>> 
>>>>> Test CI pipeline:
>>>>> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2914802667
>>>>> 
>>>>> The only one Rule11.1 violation remains, which is covered by this
>>>>> Jan's
>>>>> patch:
>>>>> x86/kexec: address Misra rule 11.1 violation in 
>>>>> machine_kexec_load()
>>>>> 
>>>> 
>>>> The change itself is fine, but the aspect I'm concerned with is the
>>>> following: if you have a function marked noreturn, the compiler is
>>>> entitled to
>>>> essentially remove any code following it, so in principle this could
>>>> be
>>>> the case also when invoking a function pointer (i.e. the compiler 
>>>> has
>>>> no
>>>> obligation to retain code after a call to a function pointer that is
>>>> actually a noreturn function). While this in practice may not happen
>>>> often (e.g., the analysis done by a compiler is probably too shallow
>>>> to
>>>> actually infer paths where the function pointer is only ever 
>>>> assigned
>>>> to
>>>> noreturn functions when it is called), it is still not completely 
>>>> true
>>>> to say that the behavior is not altered by casting away noreturn.
>>> 
>>> With "behavior" here you mean that of the compiler? Because Xen's
>>> behavior
>>> won't change if the code following such an indirect call isn't
>>> eliminated.
>>> It will "just" be unreachable code then.
>>> 
>>> That said, ...
>> 
>> I was more worried about the other direction: code that is expected to
>> be executed by the developer that is instead removed by the compiler,
>> with (rightfully) no diagnostic. Clearly if code is not removed it 
>> would
>> be unreachable, but such that a static analysis tool or compiler will
>> likely not diagnose, precisely because the attribute is dropped, so
>> there may be missing diagnostics.
> 
> Hmm, interesting. The noreturn attribute isn't visible at call sites
> anyway, so I don't quite see how that would be any more unexpected than
> for a normal (direct) function call.
> 

For a direct function call the prototype would hopefully be visible, so 
it's easier to diagnose. For function pointers the prototype may not be 
visible, but a static analyzer can in principle do an over-approximation 
of all the possible function pointers that may be bound at that call 
site and derive their attributes from declaration(s). In any case, an 
argument for allowing the deviation may be that code coverage on tests 
shows that the compiler does the expected thing on the tested 
configuration: where code is expected not to be removed, it is indeed 
preserved and reached, and vice versa.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

