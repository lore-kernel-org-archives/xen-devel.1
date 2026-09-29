Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD20C9832A
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 14:56:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436495.1655149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBZFb-0006Jv-Bx; Tue, 29 Sep 2026 14:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436495.1655149; Tue, 29 Sep 2026 14:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBZFb-0006Jo-8S; Tue, 29 Sep 2026 14:56:11 +0000
Received: by outflank-mailman (input) for mailman id 1436495;
 Tue, 29 Sep 2026 14:56:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1xBZFZ-0006Jh-Q2
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 14:56:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBZFY-00BP9v-9u
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 16:56:08 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6abbd177-8faa-0a2a0a5109dd-0a2a450c9830-28
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 16:56:08 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6abbd187-f479-0a2a450c0019-a237832f981e-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 16:56:08 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 6E0084EE0056;
 Tue, 29 Sep 2026 16:56:07 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1790693767;
	b=Jib0RG10X/mtZBaLKJ8/HYrIgQ4lMeBAOxdYj0iUqR3FWVEBhm+zcVPlA1wX6Hlr2Ctd
	 A3cOSjFmsGCWXDlFsZsgNMlAKVIjdN0UqQ5NFVYWc2fXyPtQtiLlruBlBeflAh8u2ROGM
	 CsOl/XwDrwmI9gJZ0eyx1FTGTtf+Ithxg4cIooV5xrosL/M85UoycI/s+a7oeG9pWZ9tc
	 85x3bbjTiyEyEWSVxJhljXzZgpyoE0tjTc2HRhO2qC61s4t3XqxQEoUiv8+MDl19HeSA6
	 YvV1EqsU5nIt5gRLBFqeRvuDtNe3NGBgpa7KNtJTPWIzxuQvuLcPEWc99Fru1TpFq5YTJ
	 973BrIb//aO2XGzsx5ue8DKH3Px4pOqp3AfK430GiVN48PKaeu26vIVjEGkJ5bDYpSlKC
	 BDUQbTNiOJsh7+5WUfqx0BOZxnnXs4LceDJ1Mds3ec4tEbnzASl1xkuHNqzypkB9yUIkR
	 8anqPB4WZTMehhv3+UEetVpVQ6QicgT+BpNxuGqpqDDGzgUBSdeUPHV3ENjLLCtTLkp9g
	 UUDybptsNe3VatWlVTlX/2NMAJI6Oi2lMoK7xW+nBBC1tGoQ5MtAtEfbhTFGZrFx3fYTH
	 nAVHIYZRxHmvWu+qh2vJ1mEMGdPjgAAX0ehNOl3vEHqFAA4MNkXPBpl/GFWRtOo=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790693767;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=YGQwRXEiV7XZt9L+YrtPG7YGT7ZQb707ksQJ0k6m2tc=;
	b=1hqWzmai0AeSygfdQwDDdsh/8IQoc+IrmiKFs7r7nk+lqI3LKLNoOQy0PCyCsNEjyfon
	 O+II1kEAxkLY00LfQYE3jt+K2Aa4RAIJHXpz//N3PJCjLhIUpufqdEeFsSmS0O/xB6lpL
	 tC0ZMUkosLDf9bKrXrLquuJRumGDKOfRwZNf2DiTa0fLk8/fBHFHiukr+Rcv8Y2yESL9H
	 09soJzgaPkBQcRl8yP0aTY7H8YRcRI2Kf8NN/N0BBZnvJr0hdd2SRFLGSouGw85/d5DBV
	 GAcjT1DOrYFCPu5rUS1WqfxRmpW0UbQXpRIq6KVEOw9eYCI0hwgMpKUjfCNNEOagI4O2X
	 PLiqGFIaKFeVCILquoidQlUFAmnLPeUt25K3ATlBaQIdybpfNtkDnvjnEhleoc+h5T1wA
	 lqxUbjmjv439mxxyD/gWOKo8FoAhol1+rVBuY4RescRgHR18Ppb96z5MMo2+hLqDeCHFl
	 ty8x8UKAyrwqYskmPuyyuC5Y9rFF6+JfGDu5CTzUKVQJCUjICvr3t5anZHcT+Wj9hGkq8
	 VuarSbYg/ykLciy/PaZ5kOoMFunpI5oQ56HCHp/TOsdcixG0QFgPJwRC9pMfsdH1hArXk
	 RVxs9w5MVucv3Y9tKejmp+1wDMSJMSqLgirvDawRSoUaxo7bZtG9Fkjjg3bJbCU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 29 Sep 2026 16:56:07 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Doug Goldstein
 <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
In-Reply-To: <0a286fe9-2133-4f28-8fab-59f4e51d1484@suse.com>
References: <4abcb11ef287170ced74935cbee60c90058c1307.1790671787.git.dmytro_prokopchuk1@epam.com>
 <0a286fe9-2133-4f28-8fab-59f4e51d1484@suse.com>
Message-ID: <446354d93ae04a07b86d7293705d7e46@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1790693768-02EDAA5B-EDAFF959/0/0
X-purgate-type: clean
X-purgate-size: 2111

On 2026-09-29 15:40, Jan Beulich wrote:
> On 29.09.2026 11:03, Dmytro Prokopchuk1 wrote:
>> bsearch(), memchr(), memchr_inv(), strchr(), strpbrk(), strrchr() and
>> strstr() all accept a const pointer/object but return a non-const 
>> pointer
>> to the matched element or byte, matching their standard C library
>> interfaces. The const qualifier is deliberately stripped so that 
>> callers
>> searching a non-const object get back a mutable pointer to it. Fixing
>> this would require changing the public API, so document these uses as
>> deviations instead.
>> 
>> Update docs/misra/rules.rst to note that this class of double-use
>> library functions is deviated on a per-function basis.
>> 
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> 
> When I prepared my 11.8 series [1], I was wondering whether we need to 
> go
> as far as deviating these. Since we now uniformly take gcc5 as minimum
> baseline, there is (at least in theory) the option of using _Generic to
> cover the dual-use. One question there is whether Eclair would 
> recognize
> such - Nicola? After all, looking at e.g. glibc's implementation, the
> functions themselves remain "unsafe" there; it's a macro wrapping them
> which puts the lost qualifier back.
> 

Could you provide a concrete example? In passing, for stronger 
guarantees w.r.t. _Generic it would be better to switch to MISRA C:2012 
Amendment 3, which has specific support for that feature. Keeping AMD2 
and using _Generic weakens a bit the safety argument (though one can do 
an analysis himself, of course).

> Another question is about memchr_inv(): That's not a standard function,
> and hence it also doesn't need to strictly follow the pattern of those
> other functions. In no case should it, imo, be mixed with the standard
> functions without mentioning the difference.
> 
> Jan
> 
> [1] https://lists.xen.org/archives/html/xen-devel/2026-09/msg00036.html

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

