Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F84CA5FF0
	for <xen-devel@archiver.kernel.org>; Sun,  4 Oct 2026 21:06:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440519.1657959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDTOu-0003BS-9m; Sun, 04 Oct 2026 21:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440519.1657959; Sun, 04 Oct 2026 21:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDTOu-0003BK-4Z; Sun, 04 Oct 2026 21:05:40 +0000
Received: by outflank-mailman (input) for mailman id 1440519;
 Sun, 04 Oct 2026 21:05:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1xDTOs-0003BE-Oh
 for xen-devel@lists.xenproject.org; Sun, 04 Oct 2026 21:05:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDTOr-000cZF-N6
 for xen-devel@lists.xenproject.org; Sun, 04 Oct 2026 23:05:37 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ac2bf73-e002-0a2a0a5209dd-0a2a450bc472-24
 for <xen-devel@lists.xenproject.org>; Sun, 04 Oct 2026 23:05:37 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ac2bfa1-b7e8-0a2a450b0019-a237832f84e6-3
 for <xen-devel@lists.xenproject.org>; Sun, 04 Oct 2026 23:05:37 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 389754EE0056;
 Sun,  4 Oct 2026 23:05:37 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1791147937;
	b=5VsbfVqh1MMxnAS/zbCXjv3s4V5hzs4Ulj+5qUgjBjp6DQNOl+TZqEB0+DvZI6xc+hQ5
	 2b4dhHL7j54XoWwj7rtJpS1u6Xb/cfXwOEmZ9RCn+rN2SaJgypSbaxlpX8I7mJo6Jvsvy
	 Q4MmMPJ4lpYSIDPPasyrx0LLT1QlsknA7ELxMIH3rL5w8wLW+N7ilWoMPB+N1Y7YMl+PR
	 VtymFPZ11rLW/liw5SWgr3MN77dy0dUhinGJ9V4V9QbCSnBB7rbrK/u9htQIxWbsR2/Ap
	 z1KXHMUsrp5gRxTDK/2jYPNuAORo6M+DQHMpd4BsywZ+8tbMlFAxEqM0n27k1f5dT9zD5
	 QoHnmIEXbjXuTYcBYOfAcDG6Qyg0aSAbEZO+UhIECi9fIqee35yVqU6xcqPCYxTacgnfh
	 J/hmqGYckRgFBUZ13OWFxLayoEAEzsFnW+jSm40bFINGSFJN4Gm2VufcNSHaolrmdkEuG
	 UZNmiuqV1jeAFOg3hQxBcgVjdpvbp6/v1PAOsZ4gxAVeu0g3EnDBvQ74gjsZnwsNUBDha
	 U/ksD6m+Rao+frqQyi0DXNpftgsZ1joloQI2TOOBxe6FXh45W3LCMIADC7ju33j1BeSK1
	 0bx4nCVFDh962bqT0XGGfA1LVqsnjl5m8D3w2SXLDy6vyQdIYqfMT+60Osyf9gw=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791147937;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=pIXzNPGV2mEcYZM8LYJWcaxfMFv2rTyU1Gv2VXgAUSc=;
	b=pmXSezW1aqtxmQK9toKOxacDRQiv/x4TofRswArvKmxHFaf853svXyWDFxrvBnna+Sc0
	 wxQq1hRZ7Dj6OUgwyyrMIrOjhpE54MTeqjBAcwPnPYh++jEfzzblH2AqCgtaLTKubrXgQ
	 o2AvK4PdAO6mpnKrF9VDQIDWr9VeS15V4Z9BX7YosEXkZq7IcLLPZtJbDSSRdsBW3i68q
	 JE9g1A//feghByP1jt0eHrnUe7iM7lwsSwJ+NMxAF9CzZH9T+a84e7LP8HG5sq4LpPCo4
	 OsnX2J9/j5sLVTZURl0ejM3lQ2s4IUkYNBph+IAaEMTKM7PiGJvXtS/+74Y/5E2iLMHWA
	 /7fv2G+0xVbjLhbcaTrrvSG7z6E8hpNznHFSt63b7LLB6Ix61/YHuQjT4RIvjCUyrix0o
	 BYjIgv95nvxbQfPgiu7Go5hSUrfWL03Fz/grpKMrf/4Mls01Bs5eVz/e899wWQWy/XNto
	 ETiILTwiwQ/OWJ4m7haZHQlLmRMVuthASNrudZ40oGo9+LTOihSNS4jQiFUH1Uu1jt5rb
	 WgOUTvGHzEkCMRjOfI4IQxkJ43395MhuqJiNNsFgY9HrzaqF+r1jomUSnuRcP+JvMAgoh
	 6q6bN3vkBbd/zYazuG4X3hsvt0eeh1usEndE51Phf3glBl7XvzBkeWBNGy296t0=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Sun, 04 Oct 2026 23:05:37 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jbeulich <jbeulich@suse.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Doug Goldstein
 <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
In-Reply-To: <f68982e1-f46c-4640-88b7-36ef362bf340@citrix.com>
References: <4abcb11ef287170ced74935cbee60c90058c1307.1790671787.git.dmytro_prokopchuk1@epam.com>
 <0a286fe9-2133-4f28-8fab-59f4e51d1484@suse.com>
 <446354d93ae04a07b86d7293705d7e46@bugseng.com>
 <0373fcc0-5bc9-4140-a2c9-52a31c7e42b5@suse.com>
 <2a8557d7ba88e95ec75148ff180ae0a0@bugseng.com>
 <f68982e1-f46c-4640-88b7-36ef362bf340@citrix.com>
Message-ID: <e67e84f5f619c38ed8269ebe5464ac6e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1791147937-AACDF9EA-46789270/0/0
X-purgate-type: clean
X-purgate-size: 3558

On 2026-10-01 14:39, Andrew Cooper wrote:
> On 29/09/2026 6:52 pm, Nicola Vetrini wrote:
>> On 2026-09-29 17:11, Jan Beulich wrote:
>>> On 29.09.2026 16:56, Nicola Vetrini wrote:
>>>> On 2026-09-29 15:40, Jan Beulich wrote:
>>>>> On 29.09.2026 11:03, Dmytro Prokopchuk1 wrote:
>>>>>> bsearch(), memchr(), memchr_inv(), strchr(), strpbrk(), strrchr() 
>>>>>> and
>>>>>> strstr() all accept a const pointer/object but return a non-const
>>>>>> pointer
>>>>>> to the matched element or byte, matching their standard C library
>>>>>> interfaces. The const qualifier is deliberately stripped so that
>>>>>> callers
>>>>>> searching a non-const object get back a mutable pointer to it. 
>>>>>> Fixing
>>>>>> this would require changing the public API, so document these uses 
>>>>>> as
>>>>>> deviations instead.
>>>>>> 
>>>>>> Update docs/misra/rules.rst to note that this class of double-use
>>>>>> library functions is deviated on a per-function basis.
>>>>>> 
>>>>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>>>> 
>>>>> When I prepared my 11.8 series [1], I was wondering whether we need 
>>>>> to
>>>>> go
>>>>> as far as deviating these. Since we now uniformly take gcc5 as 
>>>>> minimum
>>>>> baseline, there is (at least in theory) the option of using
>>>>> _Generic to
>>>>> cover the dual-use. One question there is whether Eclair would
>>>>> recognize
>>>>> such - Nicola? After all, looking at e.g. glibc's implementation, 
>>>>> the
>>>>> functions themselves remain "unsafe" there; it's a macro wrapping 
>>>>> them
>>>>> which puts the lost qualifier back.
>>>> 
>>>> Could you provide a concrete example?
>>> 
>>> From glibc 2.43:
>>> 
>>> # define __glibc_const_generic(PTR, CTYPE, CALL)    \
>>>   _Generic (0 ? (PTR) : (void *) 1,            \
>>>         const void *: (CTYPE) (CALL),        \
>>>         default: CALL)
>>> 
>>> while the declarations still are e.g.
>>> 
>>> extern void *memchr (const void *__s, int __c, size_t __n)
>>>       __THROW __attribute_pure__ __nonnull ((1));
>>> 
>>> (and hence the implementation still - necessarily - casts away
>>> const-ness).
>>> 
>> 
>> Ok, will look into that
> 
> We are going to have to deviate the implementation, even if we are 
> using
> _Generic() to force const-correct behaviour from the callers.
> 
> We could duplicate the functions, but there's a different rule about
> that.  We can't use ELF aliasing tricks because that breaks software
> type-hashing techniques for control-flow integrity.
> 

Yeah. The internal cast is clearly still signaled by ECLAIR, regardless 
of the surrounding context. That being said, the trick is quite nice and 
it would actually be a stronger argument for a deviation in my opinion: 
it mitigates the risk pointed out by the MISRA rule at the callsites. It 
is also true that the C23 signature is a lot nicer in terms of typing 
[1].

There's a slight friction with MISRA C Rule 23.5 ("A generic selection 
should not depend on implicit pointer type conversion") from MISRA 
C:2012 Amendment 3 for the non-const input case, because the type of the 
controlling expression could match either alternative depending on the 
context, but that's not a strong concern (Advisory rule, no associated 
UB).

[1] https://en.cppreference.com/c/string/byte/memchr

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

