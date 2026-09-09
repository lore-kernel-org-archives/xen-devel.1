Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72499C79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 13:44:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413118.1643356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4IaW-0000Lt-84; Wed, 09 Sep 2026 13:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413118.1643356; Wed, 09 Sep 2026 13:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4IaW-0000Lm-5E; Wed, 09 Sep 2026 13:43:44 +0000
Received: by outflank-mailman (input) for mailman id 1413118;
 Wed, 09 Sep 2026 13:43:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hpa@zytor.com>) id 1x4IaU-0000Le-Mr
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 13:43:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4IaT-005KJf-LG
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:43:41 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hpa@zytor.com>)
 id 6aa1627b-bab6-0a2a0a5309dd-0a2a450a86dc-46
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:43:41 +0200
Received: from [198.137.202.136] (helo=mail.zytor.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hpa@zytor.com>)
 id 6aa1628b-f2d2-0a2a450a0019-c689ca88826c-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:43:40 +0200
Received: from [IPV6:2601:646:8081:8d71:5cb3:1591:3c4d:f1f4]
 ([IPv6:2601:646:8081:8d71:5cb3:1591:3c4d:f1f4])
 (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 689Dh6ow3804694
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Wed, 9 Sep 2026 06:43:06 -0700
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=2026082801 header.d=zytor.com header.i="@zytor.com" header.h="Date:Subject:To:Cc:References:From:In-Reply-To"
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 689Dh6ow3804694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1788961388;
	bh=ZL/gT4kHs9WamtcdUxmyF1tgVVpVFEeVqovXe+EpBQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eFwHwSC6hjap02ACpRnHIRPw4THKCVy96V7SRclSv0/wvuYj94WdAndZ412lZjsIc
	 ib2dBilG8mtldf/d2E3Hya1jj6o9Zk0Q79lICDrC2lXPZycxmIDR6BMtmn+iMwxd13
	 oyUtUB6IFtwNA2gyH+XgJWNfSBRUAxY/EZqEkIfeO8dY5AHITqf3EmMcOvcElK+Vl9
	 v6VuBiudgQWGq2SHQLrm/vdw1poseknYCfQsThqM83O6PmKtmMho1BxZpAnnk0H5h6
	 yPMZgaU/BF4TkPQ/qZw8cSrbhtDNfIX36C6nbD5kwMiHoJfDBuxLmsWFqIT/oTT9+X
	 EecohgN80cYTA==
Message-ID: <8b00b7d2-2bd3-4871-9908-9fe1568d2690@zytor.com>
Date: Wed, 9 Sep 2026 06:43:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
To: David Laight <david.laight.linux@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>,
        Mauricio Faria de Oliveira <mfo@igalia.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Jan Beulich
 <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
        kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
 <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
 <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
 <d1b9ff734b918889eaf8885d64141bc3@igalia.com>
 <20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
 <e74c5a6b-ed9c-40c6-b9d7-ff04ee8c099e@zytor.com>
 <20260909093831.095b89cb@pumpkin>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260909093831.095b89cb@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1788961421-59FDECFC-90042805/0/0
X-purgate-type: clean
X-purgate-size: 1476

On 2026-09-09 01:38, David Laight wrote:
>>
>> Here is an out-of-line compact memcmp() which works for both 16/32 and 64 bits:
>>
<broken code removed>

>>
>> On 64 bits it compiles to:
>>
>> 0000000000000000 <memcmp>:
>>    0:   48 89 d1                mov    %rdx,%rcx
>>    3:   31 d2                   xor    %edx,%edx
>>    5:   31 c0                   xor    %eax,%eax
>>    7:   f3 a6                   repz cmpsb (%rdi),(%rsi)
>>    9:   0f 97 c2                seta   %dl
>>    c:   0f 92 c0                setb   %al
>>    f:   29 d0                   sub    %edx,%eax
> 
> That isn't the object code from the source ...
> 
And that's the ultimate hint that a cut and paste error had happened.

This was the actual source code.

int memcmp(const void *s1, const void *s2, size_t len)
{
    int lt, gt;

    /*
     * Note: for the benefit of 64-bit code, xDI and xSI are reversed
     * compared with what CMPSB uses; hence SETA and SETB are also reversed.
     *
     * The XOR statements set ZF = 1, CF = 0, which is required to handle
     * the case len == 0 correctly.
     */
    asm volatile("xor %[lt],%[lt] ; "
                 "xor %[gt],%[gt] ; "
                 "repe cmpsb ; "
                 "seta %b[lt] ; "
                 "setb %b[gt]"
                 : "+D" (s1), "+S" (s2), "+c" (len),
                   [lt] "=&q" (lt), [gt] "=&q" (gt)
                 : : "cc", "memory");
    return gt - lt;
}

