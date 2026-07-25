Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30466C531C9
	for <xen-devel@archiver.kernel.org>; Sat, 25 Jul 2026 00:26:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370353.1618549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnQDr-0004UO-FP; Sat, 25 Jul 2026 00:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370353.1618549; Sat, 25 Jul 2026 00:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnQDr-0004UG-Cc; Sat, 25 Jul 2026 00:26:35 +0000
Received: by outflank-mailman (input) for mailman id 1370353;
 Sat, 25 Jul 2026 00:26:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hpa@zytor.com>) id 1wnQDp-0004UA-Me
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 00:26:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnQDo-00DA3Q-RJ
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 02:26:32 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hpa@zytor.com>)
 id 6a640291-5cb7-0a2a0a5109dd-0a2a4501b046-14
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 02:26:32 +0200
Received: from [198.137.202.136] (helo=mail.zytor.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hpa@zytor.com>)
 id 6a6402b7-5984-0a2a45010019-c689ca88b67e-3
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 02:26:32 +0200
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net
 [76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 66P0Q0Qj2166700
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 24 Jul 2026 17:26:01 -0700
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=2026062701 header.d=zytor.com header.i="@zytor.com" header.h="Date:Subject:From:To:Cc:References:In-Reply-To"
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 66P0Q0Qj2166700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1784939162;
	bh=P2raLxbCtVSSJuZJ+YGPnRwRiSskOiNWBRTYxU2bOuY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=oina3z+nAJtWiwAMLXkXL1AGiUWLOBhK1SbkRn6F8w/BALe1IE7tJwX2F4PYTjUCj
	 EiCnAt1G/URk4Pl2VOD0pUjaFxI5Sep43Y5I4D2f9XVUBta8iD8Mldj8jWH0MkerNz
	 9LguvSlYzTt2Cm1u8af2PujU/RDJ+KmTN1rTPObCSRayGp4vqL9ZSC6GeZlRoqmVkg
	 4x9Qqx6sZpBGWLwlWzUCPRNEQn7K5bphASDfCtqgsVbl3K8wUjQN2obbpcCYyGG0bP
	 NGuoJRgXqBJD5CAS3cKFcOoQRHsV5uZAmHKqKC7eqAoi/xGN4iQi7Dv0wFhrJqcrgZ
	 T1dir1l2qcLug==
Message-ID: <f616c114-2727-435a-97f7-57ee6b0b60e4@zytor.com>
Date: Fri, 24 Jul 2026 17:25:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] x86/asm: add volatile, clobbers and zero-length
 check in inline memcmp
From: "H. Peter Anvin" <hpa@zytor.com>
To: Mauricio Faria de Oliveira <mfo@igalia.com>,
        Borislav Petkov <bp@alien8.de>
Cc: Jan Beulich <jbeulich@suse.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
        linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
 <20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com>
 <20260722170334.GCamD35gwrCng30WH1@fat_crate.local>
 <0F3A1121-208F-4F71-8C88-BEAE7CB50E75@zytor.com>
 <4daed8ac-b533-436f-9f86-6d297b87abbb@suse.com>
 <5e19b195-0ca2-4510-81cb-497b40e4aaf5@zytor.com>
 <8df0340f0dc7f6c303c6a7da78fad7b8@igalia.com>
 <7148BD5B-2E06-4137-B361-18AAF329DDC5@zytor.com>
 <348133f5-8a78-4805-bf0a-b1b08cdc65f2@zytor.com>
 <e52ff0fa-ee19-45e3-9b45-573ec3c5da24@zytor.com>
Content-Language: en-US, sv-SE
In-Reply-To: <e52ff0fa-ee19-45e3-9b45-573ec3c5da24@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1784939192-BE867757-6097A72F/0/0
X-purgate-type: clean
X-purgate-size: 1542

On 2026-07-24 16:57, H. Peter Anvin wrote:
> 
> And of course I got the comparison backwards (negative means a < b, thus we
> want a - b not b - a). Here is a fixed version.
> 
> int memcmp(const void *a, const void *b, size_t size)
> {
>         int diff;
> 
>         asm volatile("xor %0,%0 ;"      /* Sets ZF for the size = 0 case */
>                      "repe cmpsb ;"
>                      "jz 1f ;"          /* When size = 0 loading is unsafe */
>                      "movb -1(%1),%b0 ;"
>                      "movzbl -1(%2),%k2 ;"
>                      "sub %k2,%0 ;"
>                      "1:"
>                      : "=&q" (diff), "+D" (a), "+S" (b), "+c" (size)
>                      : : "memory");
>         return diff;
> }
> 
For extra credit, this version is even smaller in 16- and 32-bit mode, but
larger in 64-bit mode (because it depends on the order of the CMPSB operands,
which is the inverse of what the x86-64 ABI expects; swapping the order of "a"
and "b" and adding a cmc instruction improves the x86-64 size, but 64 bits is
not where the really tight code is...)

int memcmp(const void *a, const void *b, size_t size)
{
        int diff;

        asm volatile("xor %0,%0 ;"
                     "repe cmpsb ;"
                     "jz 1f ;"
                     "sbb %0,%0 ;"
                     "or $1,%0 ;"
                     "1:"
                     : "=&r" (diff), "+S" (a), "+D" (b), "+c" (size)
                     : : "memory");
        return diff;
}


