Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38087C88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 18:53:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417786.1646401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x56NE-000463-1r; Fri, 11 Sep 2026 18:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417786.1646401; Fri, 11 Sep 2026 18:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x56ND-00045w-Uv; Fri, 11 Sep 2026 18:53:19 +0000
Received: by outflank-mailman (input) for mailman id 1417786;
 Fri, 11 Sep 2026 18:53:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1x56ND-00045q-7p
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 18:53:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x56NC-0033NG-Fs
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 20:53:18 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa44e1c-8faa-0a2a0a5109dd-0a2a4501d5e2-4
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 20:53:18 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa44e1e-5984-0a2a45010019-a237832fbf7c-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 20:53:18 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id EF2BC4EE01FE;
 Fri, 11 Sep 2026 20:53:17 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1789152798;
	b=NFGGyry99wHxT89hqTXy6eIQDuDC0zg6dv+ZvKqXpfEdWnzDqEYI9I35Jz3z4BNifFP8
	 EAGiJ5+SUSK8NjkFnGbMEU02Y6DEGnh8m/wh1y5j1zhMh1jzKVnURIjLtAvrVWHluRYSA
	 7uVZx7EEn45BZSyP5xddcMMAi6CMOQau5jg46jH14XIWOF8X1nO+XsKTvZIC5UyF7UW6l
	 lfJ/jdGlhqWw6P4tyd5bXEyRGrW+wZqoH2eJ0Q0qHTQuHNq0KFp14gxfRJDEHz4QOhbH5
	 FgjwS/FMpmqr6wn9vTEKN+xWKE2Wt5rCWa2eExGyuBzqyC8zsRR8g6EZC+b1kPLM3y7TO
	 m229J0+Mv18vuFn300VWRQEr1chqMKZfh2Hl783mGMvB19EVoxxcrABeaCoeJMeRu+P3X
	 OHBsykeoxLWWTV9OzYJRB6ZpcWja8fPdAoL8rJ+EafUK+4MyKgrQncg+7s6k81WXZDvCu
	 /eoYnn2OI04MDRE8MdFtSjpoPCB7wA20y6mYRm4letMt7sL7+1kx9I7cB906HEeEUgEQT
	 VzbNXq3pKceyZLXjSem2Epo62NRHWj/rK16h9LZL+tvlr7VWhJ1HrEfRobrrBMq0Puc2c
	 V7g9R+PXLgQMWZ1cIRelDn91bSK68SJmnBifVDjaYZCumElRr090xzFGJdFH944=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789152798;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=/Nl/bXoLlpRodQiguxc1BmSbW9w9homJBvBgY3Cas0s=;
	b=YWIne7AgnBevLcbDiNdGiNA6bj6VBfqjURLyj8Vxc7rZyifFoKsuS3CnPJWcqVr16hoX
	 GrDWChT7wQsZL97iy2ulvAcjl/qObxaGCj2NX1wzTGr9AKZ7Qo0maLEXH2CiQwSQ8TZJB
	 udAE1gUfDRWVJAzszsy7kByM7u27KIvJ7O4q7FC8hyrtClDUSpA28+HwFUCcHp+EG+9yf
	 7y7g0LraJyAM9IsWyRjmyEiTt4U4t4cgYPDm4GVORL3ykCG085Gfog4EL8zYtz7wUA9hA
	 zFXLL4mwHWkIMtVgJBaNmPqaagQMfLvLIsKZsis5qpJji0a1Xg92+SzjenEzKzTpDTkGd
	 eS9xCpAV1LsPi9RTsWQKt9Hk8BOOK44caXeezMFSqTmwHnWvotTVN5PT6kFhbtR/FkjJF
	 ykJM7Z4inbTiN5p6oEy/K9MVhxc1Md5I0DfCg2nup/BKoj/1IKyO2+fyZI1GFmiPNFaU0
	 1I6WKJQNU5d20CLSQaYUDUp1T/hGrxNS/Oj57uvwmS2Lsy66w99RKVkj4ZeDvichEgcx+
	 3DM7OVFyi0FqLrAJzhzCemEhp9vfSSI30Q3iy0ztCxnHtwhufGyPhLlySAmlGOgNHecAN
	 9f3h72gTfxZ2TSXuIjhYTs0H40tkw+IppsuyCTXsYuW4XapUl83BKMzMqrsbQqU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 20:53:17 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Andrew
 Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 05/12] x86/crash: address Misra 2.1 rule violation
In-Reply-To: <aqKikxvL_6SCs_Cj@macbook.local>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <96de425a-29f7-4759-8466-b72bbe40b90b@suse.com>
 <aqJhJO2FtkrJCabM@macbook.local>
 <f17563f9-3a42-4002-afa0-b763e125dcd6@suse.com>
 <aqJ4myv4_II75W5K@macbook.local>
 <f51588b3-4100-4353-a35d-ac0780f2aab0@suse.com>
 <aqKikxvL_6SCs_Cj@macbook.local>
Message-ID: <46dcfb81294d6f644a4d3f3c11b1f47e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1789152798-BCF47757-0521F5DA/0/0
X-purgate-type: clean
X-purgate-size: 2351

On 2026-09-10 14:29, Roger Pau Monné wrote:
> On Thu, Sep 10, 2026 at 11:52:10AM +0200, Jan Beulich wrote:
>> On 10.09.2026 11:30, Roger Pau Monné wrote:
>> > On Thu, Sep 10, 2026 at 10:38:34AM +0200, Jan Beulich wrote:
>> >> On 10.09.2026 09:49, Roger Pau Monné wrote:
>> >>> On Fri, Aug 28, 2026 at 09:02:18AM +0200, Jan Beulich wrote:
>> >>>> The use of unreachable(), when unreachability is visible to Eclair (and
>> >>>> compilers), is deemed a violation. Drop the redundant statement.
>> >>>
>> >>> Urg, isn't that something that should be fixed in Eclair then?
>> >>> Otherwise all the unreachable() calls in our codebase are likely to be
>> >>> found by Eclair sooner or later, and will need to be removed.
>> >>
>> >> No, aiui most are covered by deviations. In particular ones in BUG() and
>> >> ASSERT_UNREACHABLE().
>> >
>> > Shouldn't this be a deviation then also?
>> 
>> Maybe, just that I had no good idea how to express such a deviation 
>> (preferably
>> without a SAF comment).
>> 
>> >  Maybe it would be helpful if
>> > the commit message states why this is handled differently from other
>> > unreachable() instances then.
>> 
>> I've added "..., , and the one here isn't covered by a deviation" to 
>> the first
>> sentence. Will that suffice?
> 
> TBH, the handling of unreachable() feels inconsistent to me.  I don't
> blame you for this, I know you are just trying to fix the remaining
> issues.
> 
> I guess I will defer the change to someone more familiar with MISRA
> and why some unreachable() usages are covered by deviations while
> others aren't.
> 
> I think the point of adding something to the commit message is to
> justify why this is removed vs a deviation being added.
> 

Actually this should be done with a deviation, and I thought it was 
already taken care of by

-config=MC3A2.R2.1,statements+={deliberate, 
"call(decl(name(__builtin_unreachable||panic||do_unexpected_trap||machine_halt||machine_restart||reboot_or_halt)))"}

namely because unreachable() expands to a call to 
__builtin_unreachable(). It might be worth checking why that is not the 
case. Probably the configuration needs a slight tweaking.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

