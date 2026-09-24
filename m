Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2D1C9830E
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 09:57:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431971.1653602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9gCm-0007rM-5J; Thu, 24 Sep 2026 09:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431971.1653602; Thu, 24 Sep 2026 09:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9gCm-0007rF-1Y; Thu, 24 Sep 2026 09:57:28 +0000
Received: by outflank-mailman (input) for mailman id 1431971;
 Thu, 24 Sep 2026 09:57:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x9gCk-0007r9-KG
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 09:57:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9gCj-005rSd-57
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 11:57:25 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab4f404-e002-0a2a0a5209dd-0a2a4509d38e-2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 11:57:25 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab4f401-be1a-0a2a45090019-4a7de18cfedf-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 11:57:21 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49e66390995so11736375e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 02:57:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886848646dsm12255454f8f.10.2026.09.24.02.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2026 02:57:20 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790243841; x=1790848641; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awkUv4uskLqcruZcmAXZuPDqqAn7vtVBRl8R4zKRSvs=;
        b=cRWI8YgV505oyl/MqQjKV4qWw7f0uau5aONq1MJuJVfn2xSsRuiJ5bjGLBcGlvReQS
         Wgwf8dBijMm8TEEyGs89fJEkGW4BfzmhwWL+WUc4cS7Fy/NCeJa+bHLwsZBGAfS1XyY5
         uMW9ZUUTMVsyheiSLy8x9dIYo0FbN6csuBZ5IHqFuJZyRnxyw55sFF/mCJBMqEp7Pyz3
         rjmaR4rwQpBGmOIXzBINR/tShOi3jv/ca+iIaSY3a+tIeczV7El9A4QS+BtizTQ6Bj0l
         UHjhUuMiObFlAbYhxTBqep+k1rgJ7U65cwFDuqhUAbVCQxE2yZEuvyhSwhoeUFWl7b1a
         D34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243841; x=1790848641;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=awkUv4uskLqcruZcmAXZuPDqqAn7vtVBRl8R4zKRSvs=;
        b=R8ZZpuXUmBQlaI82Mj37blij5aOmu8Sae1/hoaHpaXn3mS5F9vGqGPA/T+1IKZqM+J
         mukUUTRgc+gEnx23ce8+lN7j7/xdseZw+YwHekcBaKkjQBkauNHrw8bqsQ1sAE9Ixl+h
         paa06+/lZ30c72Th5xrApWyJ8XOY1Ho2dkZ4aKyQbbCZGtPoXxvinaAl6HfvlZNk/cON
         nQdx0zZJyKMpQYmnsanyw4r4YdFssCvVUsKj5AVRiT81Ogd6S3UOZu7ezi6DZFpaSfyH
         z5AUKRIpbnOg1kBhoVQev7d6gRVOL2LrqVDNsSNfpy2JY3gleqRU1ij6BFSzOmNYh4Bt
         0hlg==
X-Gm-Message-State: AFuF++koW5DefHdZsZpPfQHCyHrqE+0RkJVGh30qSdCCqoTlrXW2BklL
	Btmw5p5qO76SDqPVUYQYkzP+FoHO7/038G1igndC49Q1ViXwrKDf8fWDzsIEAti/b3c+K5pqmIc
	OODmqcA==
X-Gm-Gg: AYBFou08RbF6Ly9f5xzCONGxW69POJ8tVYnzas0x4jH2nOUVAPVbQTq5GQrlEdhF3ky
	mxLhWeORiU4s6FF2pdV0RFKuoclsXPnuRhWdASyasl+6ZaovvrTI3m8AhDZCzVHoBv8iqDz/bTy
	fbTH6u4UrnnPmTrmgPdxMBcoAenoTdowFvjWrTeEIQ9Yqy6FeTv6xasyizGOIwNnrqpNBQB2Mww
	LSMZZ08lWFjZ4N0rGSnYxU0bsPqP+r1PpmNw5xbDRV/nrBdtClrXDjoAsnoBygPAVJaxNDwc9vM
	Z7GAlKtePMfvVD6bEFN+uJegd0HmhqZfxU+FyLX+Zy8so7r8ztm/hFIaFdyEH0jMraFM0T2cnyk
	qD5Hp1vR0xB4A9FjC/o80GQZulz5qB2OcWF1R63EG4v/vSbWEHaGkKvMpoBSALOa4eKmTziHJJb
	HZ0RgiVg4b5G+aJ1+uq9vXLJ23/ylgmi0+ihtb4t7Sn4NNhDsARDjSPSdf4I3ITfKvzFqulfNPY
	0phZQXZ3gNkowjmvmr6AMVfuon9IcRnDYsaazVg6kfgLVy6tgFFqF19RTETzuE=
X-Received: by 2002:a05:600c:34c7:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49fe66c8e71mr30055675e9.2.1790243841046;
        Thu, 24 Sep 2026 02:57:21 -0700 (PDT)
Message-ID: <cc7da531-958b-4b03-9c0e-514d77ebb366@suse.com>
Date: Thu, 24 Sep 2026 11:57:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] x86/pass-through: no locking around
 pt_irq_{create,destroy}_bind()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Julian Vetter <julian.vetter@vates.tech>
References: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
 <92b0a72a-44df-424f-acbe-58d7167f1c4d@suse.com>
 <arOr69DIql2Mjnd7@macbook.local>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <arOr69DIql2Mjnd7@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1790243841-FC610034-45317CB7/0/0
X-purgate-type: clean
X-purgate-size: 1469

On 23.09.2026 12:37, Roger Pau Monné wrote:
> On Tue, Sep 08, 2026 at 03:01:51PM +0200, Jan Beulich wrote:
>> The questionable use of pcidevs_lock() there was discussed more than once.
>> It really is pointless: The functions synchronize primarily via the per-
>> domain event lock. They also may already be called with the global PCI
>> devices lock not held: See hvm/vmsi.c:vpci_msi_update(),
>> hvm/vmsi.c:vpci_msi_arch_update(), and hvm/vmsi.c:vpci_msi_disable().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/domctl.c
>> +++ b/xen/arch/x86/domctl.c
>> @@ -636,10 +636,7 @@ long arch_do_domctl(
>>              ret = -EPERM;
>>          else if ( is_iommu_enabled(d) )
>>          {
>> -            pcidevs_lock();
>>              ret = pt_irq_create_bind(d, bind);
>> -            pcidevs_unlock();
> 
> pt_irq_create_bind() might call into msixtbl_pt_register() which
> requires either the pcidevs_lock() or the per-domain d->pci_lock lock
> to be taken, which I think is not the case in the context here?

Hmm, indeed. Not having seen the assertion there trigger kind of worries
me a little. Do you agree that the change to vioapic_hwdom_map_gsi() can,
otoh, be left as is?

In turn I will then extend patch 3 to also tighten the assertions in
msixtbl_pt_{,un}register(), as each of them has only this one call site.
Would you mind indicating whether in doing so I may retain you A-b there?

Jan

