Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD00C88E53
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 20:48:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417929.1646437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x58Aj-0003hr-BJ; Fri, 11 Sep 2026 20:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417929.1646437; Fri, 11 Sep 2026 20:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x58Aj-0003hk-8a; Fri, 11 Sep 2026 20:48:33 +0000
Received: by outflank-mailman (input) for mailman id 1417929;
 Fri, 11 Sep 2026 20:48:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1x58Ai-0003he-EA
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 20:48:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x58Ah-00F47h-RT
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 22:48:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa4689a-e002-0a2a0a5209dd-0a2a4508ccc2-40
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 22:48:31 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa4691f-f659-0a2a45080019-a237832fcce4-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 22:48:31 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 429004EE0220;
 Fri, 11 Sep 2026 22:48:31 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1789159711;
	b=eUgVgdfDog3cys9qdmpsdqQYXvRqcONbLGDdltuq9JMnLBp53DyZkubLgI6RGxgL65/a
	 frISK2L7x6xwAl9Hq6erQM3wkFBFSKBzrrFOm8JitI6MuhCLJLWvyHjTzG10ysx7AVd5y
	 /GiZT1er2WJNuC2tTqy1S9Jkr1lDfI3H2p4u3Oha3aZvZl/DIRyopnbC09KuLsbjuZZmf
	 3AiGE6b5IURbQksdc7xEeMGo5vfwD4FVTOMe4YFNzpsC6UJVKmtOwD27IJfb17MFLVcvC
	 P8t1u6FtYGp/HlWclLWpd+3XT24QoK4aL67L43inQ+V4SZzV+1V8rnDEqnKR8Pg7QFsz0
	 diWKPk2DCrmXaWR1v6DJtqiFgPIpDwyaDiVQppQrBtjWitgp6z56DodbLPrKPMqUSq7mr
	 jIo0ecTr3BvjEi2/E/0S7jW5hqB+xq9EjdlTi5MmWxjJ33isyTiPMG9qpAf2JVS9ZkMlW
	 Z5sSj4w6ibgxyhh48tfp1oLwqSDa3khfDQWEPJzMlPd61ii7urw0zQC+MuDWKIOfmIXOB
	 V66AkH/y45y80r0ZbAC10vAbOrRs7X3z/LDJN0sp9r0rq9OtQ2tULP2MtKF5iEyx7htt9
	 Kg6rLA3JKntpt/9vN3XaKgzZ1p6KGaGQ4TgMRtaNFohbyOSMRTRTgTLda707/fs=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789159711;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=tOq7YAe7AEIzwPq2SUqy9vcCJts7c1Uw76MmAf6p3ds=;
	b=zW94Tz5Vcmn1YXk2jq6pXSKWkahq7fqIiVyHb5wftztlowjTK4niy8jwWZ6Q6RyK01iv
	 fWUj37GjTx00jw093V5nWDrm64O6y256mqWpd4dI4fidXtR9IMcwrUiCntA1ES7h07QWn
	 reOc2VWktMx5dV3iKrKEyqw3U1hA/D5zSwNtisiZQq/kFrS9aJvUMP/UGn7DxAS864Km7
	 rsZ3KwYddrIGoxhJw6ZmszaYbOOruSkhlqDypH7KCsg7P7Zi/OntM4Fm1lFt3QcLYgMrG
	 YjkGzbXmm11l4bw8H130CwWQiYYp7Ef/Fv6ExWWr/L3pA0imDDLbH/rqzgZ6qEYf7mM0e
	 /9nypbZ6/xQIwdVYfsQ0dI6mxdr92QvBoPFhamS3z+ttgj8BAkJuBAyl4iXxA0o0fNSeM
	 veDqEHpayjOXjGGkAFBJ7+hUjMC3j4VlFc8bUPWvpeLMGdMCNPPS6FEAHf6hFH9Ep+sMT
	 0hnoeMoFNr0Xi8YNq4XXon1FD5JX/NNoGMQze0xXGdG5ZjeLmrw+Wbv/mkgT/b4JJlCvQ
	 eE8pgjlZ3NvmBdE7dgXpybc8rjRLlG4cRJ1f5rWDPE3cyEPWV7hLyW2tvGkEoNxLQh6Sp
	 ocs9VDCPs4Ld4PcdQt93SFX2hk+9M3lwnNVOMMIoiyoCOvpGvTi2ZpUjIQaQFYc=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 22:48:31 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 04/12] x86: add noreturn in a few more places
In-Reply-To: <26a57fab-955a-4de6-b17b-eb57aa1f014b@suse.com>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <d0f991de-db67-4f49-aef0-25c590b3889e@suse.com>
 <66fc1415-df9e-41c2-b3ae-78305814cbfc@citrix.com>
 <d08b2d8a-d363-49d5-965f-f954c79fe04c@suse.com>
 <320b920b3e673671eddceccb4b86f211@bugseng.com>
 <26a57fab-955a-4de6-b17b-eb57aa1f014b@suse.com>
Message-ID: <98af89029999f2d0535d603ebf64d9b4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1789159711-DF6D687B-A16F0436/0/0
X-purgate-type: clean
X-purgate-size: 4984

On 2026-09-10 08:43, Jan Beulich wrote:
> On 09.09.2026 21:07, Nicola Vetrini wrote:
>> On 2026-09-01 08:26, Jan Beulich wrote:
>>> On 31.08.2026 21:13, Andrew Cooper wrote:
>>>> On 28/08/2026 8:01 am, Jan Beulich wrote:
>>>>> --- a/xen/arch/x86/traps.c
>>>>> +++ b/xen/arch/x86/traps.c
>>>>> @@ -2304,7 +2304,7 @@ void asmlinkage entry_from_pv(struct cpu
>>>>>      case X86_ET_HW_EXC:
>>>>>          switch ( vec )
>>>>>          {
>>>>> -        case X86_EXC_DF: return do_double_fault(regs);
>>>>> +        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
>>>>>          case X86_EXC_MC: return do_machine_check(regs);
>>>>>          }
>>>>>          break;
>>>>> @@ -2615,7 +2615,7 @@ void asmlinkage entry_from_xen(struct cp
>>>>>      case X86_ET_HW_EXC:
>>>>>          switch ( regs->fred_ss.vector )
>>>>>          {
>>>>> -        case X86_EXC_DF: return do_double_fault(regs);
>>>>> +        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
>>>>>          case X86_EXC_MC: return do_machine_check(regs);
>>>>>          }
>>>>>          break;
>>>>> 
>>>> 
>>>> For starters you're missing a break, and the only reason this isn't 
>>>> a
>>>> compile error is the trailing comment.
>>> 
>>> "break" there would again be unreachable, though.
>>> 
>>>>   Second, it's a tailcall anyway. 
>>>> There really is nothing unreachable anywhere in this construct.
>>> 
>>> Just that the concept of "tailcall" is an optimization, not something
>>> inherent to the language.
>>> 
>>>> But by far the most important, it the singular noreturn attribute on
>>>> do_double_fault() (elsewhere, and not visible when reading these two
>>>> functions) which is preventing #DF falling into #MC.   This 
>>>> introduces
>>>> fragility which did not exist previously.
>>> 
>>> I realized that when making the patch, yet what do you do when the 
>>> rule
>>> is as it is? Hence why I added the comment, really.
>>> 
>>>> do_double_fault() would conditionally return if we ever got around 
>>>> to
>>>> fixing espfix64.
>>> 
>>> And hence would have to lose its "noreturn". At which point call 
>>> sites
>>> would need inspecting. (As said - yes, I do realize the fragility.)
>>> 
>>>> So no - I'm going to insist that Eclair is taught to accept "return
>>>> some_noreturn_fn();" as intentional.  It is objectively less fragile
>>>> than the MISRA-preferred option.
>>> 
>>> Nicola, thoughts?
>> 
>> If you find a suitable argument from the toolchain that the generated
>> code is correct even though you return from a function where you
>> promised not to return in its declaration, I suppose that's fine, but
>> that MISRA Rule I mentioned ("A function declared with a _Noreturn
>> function specifier shall not return to its caller"), which is not 
>> (yet)
>> applied to Xen exists to defend from stumbling on UB 71 of C11: A
>> function declared with a _Noreturn function specifier shall not return
>> to its caller.
>> 
>> So in general ECLAIR should not accept this by default. What you can 
>> do
>> is deviate these (hopefully few) cases if you have backing evidence of
>> the correct behavior.
> 
> The disagreement between you suggesting a deviation and Andrew 
> demanding
> "that Eclair is taught to accept ..." will need resolving. The argument
> towards the code being overall less fragile in its original shape 
> cannot
> easily be put away. And Misra demanding code to be made more fragile
> than it needs to be cannot really be the goal either.
> 

Well, I feel like I have explained my reasoning, but let me step back a 
bit and lay out the possible safe alternatives I see for this construct. 
By the way, perhaps it's a better idea to split off this change from the 
other additions of noreturn, which can probably go in as is.

Adding noreturn to do_double_fault() while keeping "return 
do_double_fault()" in the #DF path is likely subtly broken (i.e. the 
compiler can rightfully optimize assuming the function does not return) 
so that's not a feasible solution.

If noreturn is added to do_double_fault(), removing the return in 
entry_from_pv(), shouldn't that be guarded against falling trough via 
BUG() or equivalent constructs that do not vanish in release builds? My 
understanding, that may be incorrect, is that returning from 
do_double_fault() is currently not expected to happen (hence the panic() 
in it).

The third option is to ignore all this and not add noreturn to 
do_double_fault, adding a specific deviation. The deviation is not 
necessarily done via SAF, can also be something as shown below 
(untested):

-config=MC3A2.R2.1,reports+={deliberate, 
"any_area(decl(name(do_double_fault)))"}

and then in its documentation in rst you can summarize why it's not 
being touched.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

