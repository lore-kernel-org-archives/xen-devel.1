Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28C6C531D0
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 23:14:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369656.1618215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn2bn-0006ZQ-06; Thu, 23 Jul 2026 23:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369656.1618215; Thu, 23 Jul 2026 23:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn2bm-0006Yt-SU; Thu, 23 Jul 2026 23:13:42 +0000
Received: by outflank-mailman (input) for mailman id 1369656;
 Thu, 23 Jul 2026 23:13:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hpa@zytor.com>) id 1wn2bl-0006WX-Md
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 23:13:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wn2bk-00A8PH-VH
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 01:13:41 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hpa@zytor.com>)
 id 6a629fcf-5cb7-0a2a0a5109dd-0a2a450cce32-28
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:13:40 +0200
Received: from [198.137.202.136] (helo=mail.zytor.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hpa@zytor.com>)
 id 6a62a01e-f479-0a2a450c0019-c689ca88a876-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:13:35 +0200
Received: from [IPV6:2601:646:8081:7da1:14d6:374d:d1f7:d29c]
 ([IPv6:2601:646:8081:7da1:14d6:374d:d1f7:d29c])
 (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 66NNCwoN3915882
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 23 Jul 2026 16:12:59 -0700
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=2026062701 header.d=zytor.com header.i="@zytor.com" header.h="Date:Subject:To:Cc:References:From:In-Reply-To"
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 66NNCwoN3915882
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1784848380;
	bh=8PXTFQp+nc5iVg72qAvrsYZWp0ruRgVFKDvX1SpODZA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mgr/tfdGvfkXlD4MS+SPjW7hHK1yidys1xkpttHHbJUlxPm7b7xMyRLFnyMHxmYMW
	 51nrlM9UpGo2LnwQRysOl0IrVAmFvcHWLFQD1xBDpzz9MSWBuly8fp4gLvKn8VK1X3
	 lJ1KVRbhR5wK+OumlEjGzaXI8U9ReflDqRcaQmUBnyWwdD2GYy0yUrzMKc14YFgHPu
	 D2YjJg9pBDCu7f3skgUYAltAJjuKtM1iHwKMOlLiXTuuL6knxnwaY8PA9IRkNg2tao
	 jGrUiQ7Aiilb1VAFHI/ENrEu91vR36HX89vTrFuhDCwSNDkgTIfPk09woC6yEwOH24
	 bACxElX0CQXvA==
Message-ID: <5e19b195-0ca2-4510-81cb-497b40e4aaf5@zytor.com>
Date: Thu, 23 Jul 2026 16:12:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] x86/asm: add volatile, clobbers and zero-length
 check in inline memcmp
To: Jan Beulich <jbeulich@suse.com>,
        Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
        linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        Borislav Petkov <bp@alien8.de>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
 <20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com>
 <20260722170334.GCamD35gwrCng30WH1@fat_crate.local>
 <0F3A1121-208F-4F71-8C88-BEAE7CB50E75@zytor.com>
 <4daed8ac-b533-436f-9f86-6d297b87abbb@suse.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <4daed8ac-b533-436f-9f86-6d297b87abbb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1784848420-004CFA5B-22FB9C21/0/0
X-purgate-type: clean
X-purgate-size: 1495

On 2026-07-22 23:59, Jan Beulich wrote:
>>
>> Also, this is silly. Instead of adding a whole separate test, just do "test %3,%3" before the repe to set ZF and let the REPE skip.
> 
> Besides this, isn't the function effectively returning bool wrong anyway? This
> way you can use it for equal / not-equal comparisons, but not for sorting and
> alike.
> 
There is no use case in the early code for sorting, and it seems rather broken
to burden the code with that.

That being said it probably should return bool explicitly (it makes no sense
for the prototype to be different than the internal variable.)

We could call it memneq() if someone really, really cares, I guess.

The early code is very size-sensitive, so I'm really not fond of the idea of
burdening it further. Perhaps something like:

A memory clobber is ugly here since no memory is actually modified, although
it probably doesn't affect code; "cc" is completely redundant with condition
code output operand.

static __always_inline bool
__inline_memcmp(const void *s1, const void *s2, size_t len)
{
	bool diff;

	if (__builtin_constant_p(len == 0)) {
		if (!len)
			return false;
		asm volatile("repe cmpsb"
				: "=@ccnz" (diff),
				  "+D" (s1), "+S" (s2), "+c" (len)
				: : "memory");
	} else {
		/* Clear ZF beforehand in case len == 0 */
		asm volatile("test %3,%3; repe cmpsb"
				: "=@ccnz" (diff),
				  "+D" (s1), "+S" (s2), "+c" (len)
				: : "memory");
	}
	return diff;
}


