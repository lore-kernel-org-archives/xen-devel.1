Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78A8C531F9
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 23:58:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370342.1618540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnPmX-0008FB-9v; Fri, 24 Jul 2026 23:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370342.1618540; Fri, 24 Jul 2026 23:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnPmX-0008F4-6z; Fri, 24 Jul 2026 23:58:21 +0000
Received: by outflank-mailman (input) for mailman id 1370342;
 Fri, 24 Jul 2026 23:58:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hpa@zytor.com>) id 1wnPmV-0008Ev-Cc
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 23:58:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnPmT-00D7r7-QC
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 01:58:17 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hpa@zytor.com>)
 id 6a63fb32-e002-0a2a0a5209dd-0a2a4502a74a-32
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 01:58:17 +0200
Received: from [198.137.202.136] (helo=mail.zytor.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hpa@zytor.com>)
 id 6a63fc17-6ca4-0a2a45020019-c689ca88d0c8-3
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 01:58:16 +0200
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net
 [76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 66ONvodj2120226
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 24 Jul 2026 16:57:51 -0700
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
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 66ONvodj2120226
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1784937472;
	bh=W1+RFu9YGD1n2obMJ7+LCs5yJk3LovJgDqEgPVEr4is=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=c0Q5iqr9Ip5NuYLC4z2dvmAcThmWm+yxSrbnM+TxbD3nYxbZ+2f5g9YlNJ4TPCBnF
	 0Kk1Y7FhOnYG9UClrN0c/WH5lKuX7QQXx7c6nWlUtf1db1xMfXG95qeBPqei09Xra8
	 f6wqqxwTk1NAhO740TleI0VWFLT8PtiA4FrkRyKUo8Yja1mVTr7yA8Xz7QMnCRh3cr
	 WEisX+fhru3qwUwV+TklGDSEc2RUdlhclFwCw3c5gL3cDh7QBC3hBmsEECL/3abThc
	 Ft1kLzX9GZJPu8LeRTQvIo+IPaDey9WFyqo/HlsIFXP9A/IPTIwjbXRn68lt8op1Ph
	 ZPfbHGdVqxzdQ==
Message-ID: <e52ff0fa-ee19-45e3-9b45-573ec3c5da24@zytor.com>
Date: Fri, 24 Jul 2026 16:57:45 -0700
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
Content-Language: en-US, sv-SE
In-Reply-To: <348133f5-8a78-4805-bf0a-b1b08cdc65f2@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1784937497-311CF2AC-24FC711A/0/0
X-purgate-type: clean
X-purgate-size: 1953

On 2026-07-24 16:35, H. Peter Anvin wrote:
> On 2026-07-24 14:53, H. Peter Anvin wrote:
>>
>> It's pretty bloaty; I don't know exactly how much the rest of the code bloats.
>>
>> I would be fine with having mem[n]eq() though as an explicit API. For the out-of-line version used for compiler-generated memcmp() calls it doesn't matter. 
>>
>> Here is a very compact way the out-of-line version can be written (showing the 64-bit version; formatting apologies, on a phone):
>>
>> xor %eax,%eax    /* Sets ZF */
>> repe cmpsb
>> jr z,1f
>> movzbl -1(%rdi),%edi
>> mov -1(%rsi),%al
>> sub %edi,%eax
>> 1: ret
>>
> With a C wrapper to work in any mode:
> 
> int memcmp(const void *a, const void *b, size_t size)
> {
>         int diff;
> 
>         asm volatile("xor %0,%0 ;"      /* Sets ZF for the size = 0 case */
>                      "repe cmpsb ;"
>                      "jz 1f ;"          /* When size = 0 loading is unsafe */
>                      "movb -1(%2),%b0 ;"
>                      "movzbl -1(%1),%k1 ;"
>                      "sub %k1,%0 ;"
>                      "1:"
>                      : "=&q" (diff), "+D" (a), "+S" (b), "+c" (size)
>                      : : "memory");
>         return diff;
> }
> 

And of course I got the comparison backwards (negative means a < b, thus we
want a - b not b - a). Here is a fixed version.

int memcmp(const void *a, const void *b, size_t size)
{
        int diff;

        asm volatile("xor %0,%0 ;"      /* Sets ZF for the size = 0 case */
                     "repe cmpsb ;"
                     "jz 1f ;"          /* When size = 0 loading is unsafe */
                     "movb -1(%1),%b0 ;"
                     "movzbl -1(%2),%k2 ;"
                     "sub %k2,%0 ;"
                     "1:"
                     : "=&q" (diff), "+D" (a), "+S" (b), "+c" (size)
                     : : "memory");
        return diff;
}

	-hpa


