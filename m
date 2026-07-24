Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6ADC531C9
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 23:36:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370330.1618531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnPRF-0005JF-NS; Fri, 24 Jul 2026 23:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370330.1618531; Fri, 24 Jul 2026 23:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnPRF-0005J8-KB; Fri, 24 Jul 2026 23:36:21 +0000
Received: by outflank-mailman (input) for mailman id 1370330;
 Fri, 24 Jul 2026 23:36:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hpa@zytor.com>) id 1wnPRE-0005J2-Ba
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 23:36:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnPRD-00BcJH-B5
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 01:36:19 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hpa@zytor.com>)
 id 6a63f6dd-bab6-0a2a0a5309dd-0a2a4509e498-6
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 01:36:18 +0200
Received: from [198.137.202.136] (helo=mail.zytor.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hpa@zytor.com>)
 id 6a63f6f0-be1a-0a2a45090019-c689ca889ca4-3
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 01:36:18 +0200
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net
 [76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 66ONZint2085117
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 24 Jul 2026 16:35:45 -0700
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
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 66ONZint2085117
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1784936147;
	bh=wYDH5pOs2+jx/abQM0EIsbUFZWqcqfJ/wXbQerifBqs=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=uZRAuz7fa+7I3KyB1K7hYF2dL8mbMB2lMG24qgmegdW4VmBTOSjx6kcoIUWTOztoV
	 R09akCfZgeXPycfNBMKZG9QrUY/8kIYi0whCecNNVy8aTBehIuz2hmXQ5I9i1nEYAj
	 sWdppzvc0vcHwzw82BtaPxZvefmfKt3p6kImCSuaFpxL/LN9m94Q33pDcVbRwL3Pjx
	 AxPTZ72g07EW3ZHq9Jhxtj/d7QZZKO14RVdGeiXwI+9zHhet4SZkE2W1y0/h7ppUCG
	 /9RtWmRewzzTAKnhj0i0LjZ2FM9D/vtNvH0JkJbAxMuTTSdT74LdWXcQsC19yAGBDG
	 jyLc8csqWSeUg==
Message-ID: <348133f5-8a78-4805-bf0a-b1b08cdc65f2@zytor.com>
Date: Fri, 24 Jul 2026 16:35:39 -0700
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
Content-Language: en-US, sv-SE
In-Reply-To: <7148BD5B-2E06-4137-B361-18AAF329DDC5@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1784936178-FCE14034-7DE4B3E5/0/0
X-purgate-type: clean
X-purgate-size: 1165

On 2026-07-24 14:53, H. Peter Anvin wrote:
> 
> It's pretty bloaty; I don't know exactly how much the rest of the code bloats.
> 
> I would be fine with having mem[n]eq() though as an explicit API. For the out-of-line version used for compiler-generated memcmp() calls it doesn't matter. 
> 
> Here is a very compact way the out-of-line version can be written (showing the 64-bit version; formatting apologies, on a phone):
> 
> xor %eax,%eax    /* Sets ZF */
> repe cmpsb
> jr z,1f
> movzbl -1(%rdi),%edi
> mov -1(%rsi),%al
> sub %edi,%eax
> 1: ret
>
With a C wrapper to work in any mode:

int memcmp(const void *a, const void *b, size_t size)
{
        int diff;

        asm volatile("xor %0,%0 ;"      /* Sets ZF for the size = 0 case */
                     "repe cmpsb ;"
                     "jz 1f ;"          /* When size = 0 loading is unsafe */
                     "movb -1(%2),%b0 ;"
                     "movzbl -1(%1),%k1 ;"
                     "sub %k1,%0 ;"
                     "1:"
                     : "=&q" (diff), "+D" (a), "+S" (b), "+c" (size)
                     : : "memory");
        return diff;
}


