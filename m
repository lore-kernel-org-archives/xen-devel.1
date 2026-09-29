Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD25CA5FA5
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 17:53:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436677.1655366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBc0d-0007Xy-W6; Tue, 29 Sep 2026 17:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436677.1655366; Tue, 29 Sep 2026 17:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBc0d-0007Xr-Su; Tue, 29 Sep 2026 17:52:55 +0000
Received: by outflank-mailman (input) for mailman id 1436677;
 Tue, 29 Sep 2026 17:52:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1xBc0c-0007Xl-D3
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 17:52:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBc0b-003qnp-Mc
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 19:52:53 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6abbfab6-e002-0a2a0a5209dd-0a2a4504c3d2-46
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 19:52:53 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6abbfaf5-b57f-0a2a45040019-a237832fe10e-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 19:52:53 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id C4EBE4EE0056;
 Tue, 29 Sep 2026 19:52:52 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1790704373;
	b=amEbrz2MwrkJ4c/5HksIXCBEAyt+tUR3qn7H8iHblAIqPn4Jrj6mtgg/uCYMHrdg1Hw0
	 dTd3aJ7/wDcZmvn9B4VX1hYaC4iWMlsqSqd+zFEsXgC0U4TSqLlgNNcLGSyo+hYFNNHCY
	 owPkXbrnAvAheTaW/+a2WojDB5P/dg43CsWrh9ISyxZW2DTljyPuFFdwyzsF0lXiiS6IJ
	 IImtGOfF9Z28b60ZyIb9kT3nS3XO9996dK/9PGDD3RcNGIDA1FxYXBteMkHHtzfpMY9Xd
	 e2bzdO1SbpNrZWO8vmRFzPXlZGorLXkM7uZP0UzwGs4VoY2yn7PI6UG9dJjJez7GyWCS+
	 FjBG7zxT0LxclX1uRktwi8LjKZ79UYWjAbZiwFZBsBc8ZjvxU/UkOZZ2zwPpE45aSFf0M
	 NyBKTvBXPoKzlUtNZiL8WE6QT3j3fIeKz+nyMYIqoSE6gr7WxTbRqEzkofGVjb0C1MOhG
	 eW2VwlE+pZ76WlwI6Xg0J/b/JTg3hpBEw8xycPgeUxTCIiolmHGUWsxt3420ZB8LZZyWT
	 VeC8gD4OsraOxwgrl0XPdflmJ89KrKu3qObAdaECtAJQOnaEYEyTUBwT7a2pmwD19QHkQ
	 MQjZacOU7OL9fp7cZum3EDkhipEUObI5ElAOK4zLzn4A6a7ofr5AaW4/4rV4Vaw=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790704373;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=lwdcqZBsBN5quqmne56Qas7ABZJkiiSTTk6SQKKainc=;
	b=BU6B5/Cu+6uCm0lHiZqCPypUZwZYFWrh2izVEhqooDeApGuBd0FfxM/FEIQio2ijDKM4
	 D8KJeaaVy6W/OmsbUB82/rPmal4NpQA/Y6GsbmHjKhnQbzX5p/B26u9SHpXpkPwz8k3fD
	 XY/6/8NFzzp9iJiJjEVN9BsPb1r5un7b/RWbYylPlpyblBTWdYKLXpv8S71CzkFvBgwcw
	 rQu48vPvan6scnwRW5VmlN+7ognAk9MoTq350s4CEKO+7qILxI1cFO4QBMEhqONOMGzF/
	 Evj2Ek8vfYhMkWr3+Vo/hToJeZox26KBRKztlegnLY8fig9mNgijygdD6RsUaIbqQI6Ao
	 HJ5SkhL9Gq3CJEy4bNKwr+QXjT/cCuz+egD4GScVWwe0dDvfS8AH69F8w4s1d/gTiwTj/
	 aJrdYxUJdbTuGCM0hzOA4syocIpALZ1puVnEt7bI+9CnA9I/Iv5GHkJ3VJQ8yZlp15W46
	 5t+/ugWYKfc1ruxV+h1PIXA2e4vuTGlUbGbX5rlB6F6tREAlNdVcQEKEwGAVu8Lzzp7L+
	 QqvRqTnUFdhHNybC1VdQDmvY3BbhEnUn14NoXqncgs8SBuTwjZw8WsQBTppA8X/4GkHAU
	 Jc8vmGVS5bSgj4CtSQCD7UWk+yNIe3Z3oviuFrBvLvCmjrhvV7cgAHNaSIx+Dkw=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 29 Sep 2026 19:52:52 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper3
 <andrew.cooper3@citrix.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Doug Goldstein
 <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
In-Reply-To: <0373fcc0-5bc9-4140-a2c9-52a31c7e42b5@suse.com>
References: <4abcb11ef287170ced74935cbee60c90058c1307.1790671787.git.dmytro_prokopchuk1@epam.com>
 <0a286fe9-2133-4f28-8fab-59f4e51d1484@suse.com>
 <446354d93ae04a07b86d7293705d7e46@bugseng.com>
 <0373fcc0-5bc9-4140-a2c9-52a31c7e42b5@suse.com>
Message-ID: <2a8557d7ba88e95ec75148ff180ae0a0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1790704373-C2CCFB50-B78E67C0/0/0
X-purgate-type: clean
X-purgate-size: 2930

On 2026-09-29 17:11, Jan Beulich wrote:
> On 29.09.2026 16:56, Nicola Vetrini wrote:
>> On 2026-09-29 15:40, Jan Beulich wrote:
>>> On 29.09.2026 11:03, Dmytro Prokopchuk1 wrote:
>>>> bsearch(), memchr(), memchr_inv(), strchr(), strpbrk(), strrchr() 
>>>> and
>>>> strstr() all accept a const pointer/object but return a non-const
>>>> pointer
>>>> to the matched element or byte, matching their standard C library
>>>> interfaces. The const qualifier is deliberately stripped so that
>>>> callers
>>>> searching a non-const object get back a mutable pointer to it. 
>>>> Fixing
>>>> this would require changing the public API, so document these uses 
>>>> as
>>>> deviations instead.
>>>> 
>>>> Update docs/misra/rules.rst to note that this class of double-use
>>>> library functions is deviated on a per-function basis.
>>>> 
>>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>> 
>>> When I prepared my 11.8 series [1], I was wondering whether we need 
>>> to
>>> go
>>> as far as deviating these. Since we now uniformly take gcc5 as 
>>> minimum
>>> baseline, there is (at least in theory) the option of using _Generic 
>>> to
>>> cover the dual-use. One question there is whether Eclair would
>>> recognize
>>> such - Nicola? After all, looking at e.g. glibc's implementation, the
>>> functions themselves remain "unsafe" there; it's a macro wrapping 
>>> them
>>> which puts the lost qualifier back.
>> 
>> Could you provide a concrete example?
> 
> From glibc 2.43:
> 
> # define __glibc_const_generic(PTR, CTYPE, CALL)	\
>   _Generic (0 ? (PTR) : (void *) 1,			\
> 	    const void *: (CTYPE) (CALL),		\
> 	    default: CALL)
> 
> while the declarations still are e.g.
> 
> extern void *memchr (const void *__s, int __c, size_t __n)
>       __THROW __attribute_pure__ __nonnull ((1));
> 
> (and hence the implementation still - necessarily - casts away
> const-ness).
> 

Ok, will look into that

>> In passing, for stronger
>> guarantees w.r.t. _Generic it would be better to switch to MISRA 
>> C:2012
>> Amendment 3, which has specific support for that feature. Keeping AMD2
>> and using _Generic weakens a bit the safety argument (though one can 
>> do
>> an analysis himself, of course).
> 
> As this keeps coming up, we surely want to discuss / progress this 
> move.
> 
> Jan

That makes a lot of sense. We could add to the next community call or 
maintainers/committers call to present the problem and propose a way 
forward so that all stakeholders are aware. From my side, I can explain 
what moving from one to the other can entail in terms of static 
analysis, while others (e.g. Andrew Cooper) may expand a bit on specific 
C11/C18 features is desirable aside from safety.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

