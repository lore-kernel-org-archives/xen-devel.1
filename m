Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C42FD3774
	for <xen-devel@archiver.kernel.org>; Wed, 25 Feb 2026 16:34:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1240920.1542163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvHqY-0005H5-6C; Wed, 25 Feb 2026 16:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240920.1542163; Wed, 25 Feb 2026 16:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvHqY-0005Gy-3R; Wed, 25 Feb 2026 16:34:46 +0000
Received: by outflank-mailman (input) for mailman id 1240920;
 Wed, 25 Feb 2026 16:34:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j5m4=A5=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vvHqW-0005F6-Q4
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 16:34:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e209baa8-1267-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 17:34:41 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 6194C4EE7808;
 Wed, 25 Feb 2026 17:34:39 +0100 (CET)
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
X-Inumbo-ID: e209baa8-1267-11f1-b164-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1772037279;
	b=h4o42yMSIKhtOfTa0n/032J3+CTvI3wQgJnv3ZYgWCWrzanZ2rU+iEZ6CUmEJiNkmSW4
	 Ngi3Wnu0HDnPFHC0CBgHj72S+zO8jurNXuapGEoNXs5aY975UP7+szyhljum+b4SXdzXC
	 Qswxg61qL/DDef/uZdWr657PF7AyFk0nA9J2BlsHTBAlXaWUvuWyeKFeI1p38V0XaF+Zw
	 Dh2OkbXU6OSnvYv1qOiLANBPwYvFctVGMueugOcDtmx9KKZhnHAo0G+xUi/LK78QUSNr8
	 ZqCCjVddI5x0+dn2z45CCV2OJcn9/F/BYuYpP8ytLBVDB1WP2FFNIY8OhJYudiPb1fnLP
	 kJ8wECU7X9RRf1sDmaHHZZGcRxLuF3t6f1fdg3cCfx3nfgiv29dHZI1riNG2s1V+1JWGI
	 1drBJoEetxA6lQsKaiZi2rPE4oyn8sVdnYthOYeCTjlpPZd9gzZimUgMiz9C8Whf9q0sh
	 y+G/k6Xx6/oEYiSLSbMVhcPBxhiwnjKZ9mcQa1AIaUIeosnyYiPgfM0R93GzXsyhPrw+v
	 8VGcVJhOgEPle76H+eU2d6zFFv6HbQ4BrWJ1KIvzhDcnye+oFgPSrLND1GXkVb67Bgkjk
	 FfjPaxLruH9BM9nyTvKs4xe9nDdV2yVbe/lN4Q5zEKKduHWV0FJAjhl2pfNZMlY=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1772037279;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=6kHTQwT6E5aPdQgdrwEfnEfD2oRdXwzFPDU/nBMaU4s=;
	b=P0/YYp0sqHYxe2DOUYX2+TFLVb8hsCR923sfJUKLYKzXnwDPeiAUoIKHsPF+bqhhimdG
	 nkVb8HARD3IcWv5VmubAGUbpYPL1cahLkF3m7FCeuiTz1dWDZAkmNpKIhSW5O8d5oWr1x
	 62mrqicY7khEHyb//RX9/CuNf2aQT8+X7qgpLOUCXBgzILAK3NdbuX50OiTtGtCS7KONR
	 EafyC0F0dgm0QIVjhG7E7KMRmigxPeAx0gPdLBRaE49gm+1n7DWcQDywmCoNW8J78m0Zx
	 cfDhW1hhY0OFSh8DibjPmDJ5R7cSDdyITxNOsVgwaWLDLOv8J5FbF6cWxqDoxs0TB30Pj
	 Fem5JVG1UDQHqaLdG9JRlpUix5miX5ndFJ7E515T6CzVW9RFaheI/8346q3rc8oCqQ2pS
	 FCKmdBzCjWAeYyLhW/2kyh+o+BQZ6OLqkaRAC8WwqxExG1sEx/nFLfpBU2BxHE/5l3zIY
	 ECh6UiQ625FU1Xlz4ADf77g1ASokkpaq+QlhKbH4hDQQwLZGsVMhUy4LVXq6VWKJPJ/nC
	 rHRjrHvxySKc3PeUYo5xhYNckNDppcnKVPBkdxTpBcJehd+uuX7AI9X20dNJF6f7jdp4o
	 u73jw/yYZwXFZFU7C5iC+2FT1cqijjs/yT/4VqqJVkwm3mTKnmS0YTe4MgQux/8=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Wed, 25 Feb 2026 17:34:39 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>, "consulting @ bugseng . com"
 <consulting@bugseng.com>
Subject: Re: [PATCH 11/12] xen: Bracket uses of macro parameters
In-Reply-To: <82bbccff-fca6-4256-b228-88fc326cf5d6@citrix.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-12-andrew.cooper3@citrix.com>
 <a917dc27a7fba87a8f829558444545bb@bugseng.com>
 <82bbccff-fca6-4256-b228-88fc326cf5d6@citrix.com>
Message-ID: <5f1dfb0a9a17e06309427726c4525a41@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-02-25 17:05, Andrew Cooper wrote:
> On 20/02/2026 10:45 pm, Nicola Vetrini wrote:
>> On 2026-02-20 22:46, Andrew Cooper wrote:
>>> Fixing Rule 20.7 violations.
>>> 
>>> No functional change.
>>> 
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> 
>> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Thanks.
> 
>>> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
>>> index 7446533c8cfb..63473925cafb 100644
>>> --- a/xen/common/livepatch.c
>>> +++ b/xen/common/livepatch.c
>>> @@ -664,9 +664,10 @@ static inline int
>>> livepatch_check_expectations(const struct payload *payload)
>>>      const struct livepatch_elf_sec *__sec =
>>> livepatch_elf_sec_by_name(elf, section_name); \
>>>      if ( !__sec
>>> )                                                     
>>>                    \
>>>         
>>> break;                                                        
>>>                    \
>>> -    if ( !section_ok(elf, __sec, sizeof(*hook)) ||
>>> __sec->sec->sh_size != sizeof(*hook) ) \
>>> +    if ( !section_ok(elf, __sec, sizeof(*(hook)))
>>> ||                                      \
>>> +         __sec->sec->sh_size != sizeof(*(hook))
>>> )                                         \
>>>          return
>>> -EINVAL;                                               
>>>                    \
>>> -    hook =
>>> __sec->addr;                                               
>>>                    \
>>> +    (hook) =
>>> __sec->addr;                                             
>>>                    \
>> 
>> This is not strictly needed, if not for consistency.
> 
> That explains why my first try didn't succeed.  But, why is it that 
> only
> MISRA only cares about bracketing for rvalues, not lvalues ?
> 

It was actually asked by Xen maintainers to introduce this special case 
on the grounds that it is extremely unlikely to result in an operator 
precedence mishap that leads to incorrect expansion. See below:

-doc_begin="Code violating Rule 20.7 is safe when macro parameters are 
used: (1)
as function arguments; (2) as macro arguments; (3) as array indices; (4) 
as lhs
in assignments; (5) as initializers, possibly designated, in initalizer 
lists;
(6) as the constant expression in a switch clause label."
-config=MC3A2.R20.7,expansion_context=
[...]


-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

