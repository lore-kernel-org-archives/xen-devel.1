Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE87C79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 19:08:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413597.1643726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4NeI-0004sb-T6; Wed, 09 Sep 2026 19:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413597.1643726; Wed, 09 Sep 2026 19:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4NeI-0004sU-Q4; Wed, 09 Sep 2026 19:07:58 +0000
Received: by outflank-mailman (input) for mailman id 1413597;
 Wed, 09 Sep 2026 19:07:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1x4NeI-0004sO-9l
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 19:07:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4NeH-000GAd-Fz
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 21:07:57 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa1ae66-8faa-0a2a0a5109dd-0a2a45029810-32
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 21:07:57 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa1ae8d-6ca4-0a2a45020019-a237832fc308-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 21:07:57 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id D7CC14EE00C1;
 Wed,  9 Sep 2026 21:07:56 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1788980877;
	b=A3qUI1u2Dk4VHrELb/TJZmWV2Rr3vWge1ORQfYI+seb+SR3S7F9SnhfKXQB4QiSaA5kG
	 nKmNe2lSnroeydb/1xS13Sh5kjZpWh+1jYS35D0jpp3khGFVPhniMcaVALtjcaAX7UXT6
	 sOm1gIm7OrtKfcQazanXyyzLVAvSjZFT2OWKI+rArMZoMVIc9NO2ZIKohqj99XA/MTcKq
	 4CLgH9Ez8xxgXrJsS6tiPjrpH8PvGX9jKilCBj0E5cIcVf6hW0wSwfLu4p0o+LOLDC/Eg
	 rSb2AsVQFy45iqP+954pNrcHsphtPC1/UnLiLPMxZrOhZsworhqAGjxY+AQ9BaTJn1koO
	 WNBe5RfzG7vIk963Ykx3W5J8N71iLrX6X5GLfssYNLttuSy24jbP/R68d6/8VDCZRamjo
	 uXcHn8RKNLb5OTs9RsBvzJHDZzfh2TE/0UUF1Cx2H7xDClfof5myFpio8gD+mXGpE4m1S
	 cSqQ/lnho9KK8FCV+1fAa/AWYyg6FjHEXKWMnsWTKqqBUdJqh34YL2udO68XOLRw3IwEe
	 hUGUzKk/yruMgzsuZWAGloeHmfvYPPUpjVs3daVAAAIDOaguHR7qncqCfASqv6nZAnbXW
	 ZtFpHENI/+4JBLtKE3HEHP1DjISuhEBVZIl/kTdT5Xk1QqyMW0A4oa4PBV89ezI=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788980877;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=NDrl5IY0otNcDgKDoWPhJydoi9fBTL1klCgRxR16pvs=;
	b=LJA2XYJzsRha7w+g7NqleDUJioCxCTHcipysx4g/dNSsAQmQDSQeVyR+P13wMn5TU9qD
	 v+pq6vWlC1uRoEg1HrapLv0CCCYn2Bk2LgjZQ3U6OSqtRiOQEKKbNX5rxzz+GX8t6UF1S
	 hbG5r4gEYnyGvD/sQ2sgvwqcWbK+y+jpYkA0330nV+wv6HMBsyZahCrhQ8MIx6UO+HiKm
	 tnYKMI+qKpCvD09YCwA+qkoQxuOba0XM4i2RpyoTkZgoYjbDlrDjNbUvu4u0MVlEE6RmH
	 vSFxTSwqoiWcoHZ1xcJtfMph4n4GCr/8/U5c1YBQBo6bA4S9atkyR5FmWeslNX6Eq1vvm
	 H/DX8aXPzwttQqxdidgVsfH9igiKu6pFZZVzoVE8dfUV+imOoikPWjE+3upE15I9Wj866
	 ga0xIwALk1htwbyFmkQlhxgRvVsydBzLoGJxgqqYYze2kMfPi12GlA+QybJrTYuPVmxG2
	 Glc+swQdUbPl0UbiKvkEbfT/g8L89F/0HcZnXGqaR4Xh9nsroz8r2vxaiL3PDvCIJw8Z1
	 lzYodcL+mnxDtUbUS+hWNbYQOQfc/GUW3SPz3Lf25kPm0dmZEOt1cOInJo4xHwuhl3bIK
	 9chPax2AjaUZG5l8SIEHZwdDk1ch5W9SMDdlI15uAon8EnpvPYyB52CQZSp5OPY=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Wed, 09 Sep 2026 21:07:56 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie
 <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 04/12] x86: add noreturn in a few more places
In-Reply-To: <d08b2d8a-d363-49d5-965f-f954c79fe04c@suse.com>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <d0f991de-db67-4f49-aef0-25c590b3889e@suse.com>
 <66fc1415-df9e-41c2-b3ae-78305814cbfc@citrix.com>
 <d08b2d8a-d363-49d5-965f-f954c79fe04c@suse.com>
Message-ID: <320b920b3e673671eddceccb4b86f211@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1788980877-66CB22AC-21802FE6/0/0
X-purgate-type: clean
X-purgate-size: 3063

On 2026-09-01 08:26, Jan Beulich wrote:
> On 31.08.2026 21:13, Andrew Cooper wrote:
>> On 28/08/2026 8:01 am, Jan Beulich wrote:
>>> --- a/xen/arch/x86/traps.c
>>> +++ b/xen/arch/x86/traps.c
>>> @@ -2304,7 +2304,7 @@ void asmlinkage entry_from_pv(struct cpu
>>>      case X86_ET_HW_EXC:
>>>          switch ( vec )
>>>          {
>>> -        case X86_EXC_DF: return do_double_fault(regs);
>>> +        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
>>>          case X86_EXC_MC: return do_machine_check(regs);
>>>          }
>>>          break;
>>> @@ -2615,7 +2615,7 @@ void asmlinkage entry_from_xen(struct cp
>>>      case X86_ET_HW_EXC:
>>>          switch ( regs->fred_ss.vector )
>>>          {
>>> -        case X86_EXC_DF: return do_double_fault(regs);
>>> +        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
>>>          case X86_EXC_MC: return do_machine_check(regs);
>>>          }
>>>          break;
>>> 
>> 
>> For starters you're missing a break, and the only reason this isn't a
>> compile error is the trailing comment.
> 
> "break" there would again be unreachable, though.
> 
>>   Second, it's a tailcall anyway. 
>> There really is nothing unreachable anywhere in this construct.
> 
> Just that the concept of "tailcall" is an optimization, not something
> inherent to the language.
> 
>> But by far the most important, it the singular noreturn attribute on
>> do_double_fault() (elsewhere, and not visible when reading these two
>> functions) which is preventing #DF falling into #MC.   This introduces
>> fragility which did not exist previously.
> 
> I realized that when making the patch, yet what do you do when the rule
> is as it is? Hence why I added the comment, really.
> 
>> do_double_fault() would conditionally return if we ever got around to
>> fixing espfix64.
> 
> And hence would have to lose its "noreturn". At which point call sites
> would need inspecting. (As said - yes, I do realize the fragility.)
> 
>> So no - I'm going to insist that Eclair is taught to accept "return
>> some_noreturn_fn();" as intentional.  It is objectively less fragile
>> than the MISRA-preferred option.
> 
> Nicola, thoughts?
> 

If you find a suitable argument from the toolchain that the generated 
code is correct even though you return from a function where you 
promised not to return in its declaration, I suppose that's fine, but 
that MISRA Rule I mentioned ("A function declared with a _Noreturn 
function specifier shall not return to its caller"), which is not (yet) 
applied to Xen exists to defend from stumbling on UB 71 of C11: A 
function declared with a _Noreturn function specifier shall not return 
to its caller.

So in general ECLAIR should not accept this by default. What you can do 
is deviate these (hopefully few) cases if you have backing evidence of 
the correct behavior.


-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

