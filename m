Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42BAC55ABF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 12:15:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384689.1627511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrx05-0008BF-32; Thu, 06 Aug 2026 12:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384689.1627511; Thu, 06 Aug 2026 12:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrx04-0008B8-W2; Thu, 06 Aug 2026 12:15:04 +0000
Received: by outflank-mailman (input) for mailman id 1384689;
 Thu, 06 Aug 2026 12:15:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrx03-0008B2-PA
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 12:15:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrx03-00FZMR-4w
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 14:15:03 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a747ac5-bab6-0a2a0a5309dd-0a2a4509d75c-4
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 14:15:03 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a747ac6-be1a-0a2a45090019-d1558036e9f4-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 14:15:02 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4955de8797cso14202675e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 05:15:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499541b86f5sm59244655e9.0.2026.08.06.05.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 05:15:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1786018502; x=1786623302; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3R0vA+IQ+bdFfwfHDI/nIiFtIJi+isNnUOnVQX7C3yc=;
        b=MADXWPqvEscO9DbC8WHrOoPlDFDZ04z9wpoEs1J7t0+zbG7DYCunqPHKlKJnDuDoZN
         QMIMt0xZF+i4u95BjtOR3DDY/FCSo9R8o6knSoimQslK6Cg1KBiFlsHyIttNz1YaFJHr
         mnGnN6PHwuc+LtR0nQvhvpdERU7vAHfsr1ZNhxxQfb/foVHD09uNXQeDRNuHtrIzM/Bb
         BBsYw8EbVI3iiOODrB7t8hAUiOvji5XJrykrjUXow58wHPCOolyBNgP81Ka55urQDvQ7
         aZxq8Sd4N5EwmS/teB2NTN0ag1bnvPFzMpkhXGuHS8hbqSJQimCRF101DCNnnztcDNCz
         BGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018502; x=1786623302;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3R0vA+IQ+bdFfwfHDI/nIiFtIJi+isNnUOnVQX7C3yc=;
        b=Vk4KOZlMQYxqaR9O79ZvpAzG5Ux9nsIlNdFsuuQ42JXnt4G+8yxcBfpxvOvF1Q+e0e
         FBBP95Xy5B43Hc8yNF/z222oa0rXxDayV8P4yDclXXFQMpAYXO7IRE9XKl/+Irp34tGD
         D4v/jwWWw+StncJanP8zYhwEEKW5nD/9F6NTLmUDrDJufY0Ef/ExK4cTsTM2oenRHJMT
         SxxSkuxetQ3mZDLboNBK7mEN8kZ5+MYv4hoAs3m+53xHrCaTdA1sSH4QvToyNKaXxWyw
         1wDvF6CSoNgDzNpfJ1oH0sraxEVHwiHIoXXqUIME2ubGZ5f6AS6vRu9eVQGSVm2h4oHS
         piBQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrTmyow76wEiJxexkTrQ5TbCeKPQjrrWVIG1DhRKV9BttHqXA4HveJO7wMEfncRurc0hsDyQjuRMk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNIzIGbm3pIc1+w0PGpI9HnWQDjR2hcEFtpjezIem9wjBYs7ZA
	M7WAVULl9DIbYODsoyFZPZZItO+blMLAjb2zOmVOKYj018aXZRNrqTdMxVpRL8Pzzw==
X-Gm-Gg: AR+sD10n3oA6q4UUTwRQmqQaKCAd9bo1BkIgNeLDVBRtHfU1w8Ogj4nJzwMwuWJ1hdV
	/fQfutrFUtmpy0OLL1sKmVCsKPfxy+RbAMMkNIMTbQdWYQg42vKi7qr7fLr8CRL+Wmrczo9+F74
	+k43Lhf5MTzIOnlvhsRQM5mv/mYRdn1CmmKOZItGcsyEXCAKsG7vx3YjYiIitluux765vT7aN01
	ZT/x78IWMKAo+BemKvYeq5ggexhpR0rCRJneEtGinoquSWZMNtd2DUP4LevbIO1jYwxNKNB8lM4
	Ndt44irHKtlGVsychsiUkDdKq22H8Mdc1AU8TPGDzg34gQW03Ec5lhKmeCBAR9w/K+7ar3+NNnE
	DMpoCZesdI5MrDD1wx4cv0Yteh63FPJUR2Z69P/msC0IePV8K4mjgBAClIXRiqN+5Gp/LOnckP3
	hHTwfJdOEChHvfb5f7WTJSmwsPNoM4co4BzoB2l+KJvhZFFBXD+Q6vPhKRw5PHcMVvz8ecZYI50
	1Ldtc9j64d4aiO3iJ/6ZABH9RKWozCEcmTJz6nmap0LPB/HKETe
X-Received: by 2002:a05:600c:4fca:b0:496:c2fd:1731 with SMTP id 5b1f17b1804b1-4994e711309mr172456795e9.1.1786018502050;
        Thu, 06 Aug 2026 05:15:02 -0700 (PDT)
Message-ID: <eb219e1f-39a0-46b9-9035-2b156cea684c@suse.com>
Date: Thu, 6 Aug 2026 14:15:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/vpci: allow unaligned accesses by the hardware domain
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger@xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260806110401.19615-1-roger@xenproject.org>
 <c510770f-33e5-4b85-a52b-67bb776fb70c@citrix.com>
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
In-Reply-To: <c510770f-33e5-4b85-a52b-67bb776fb70c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1786018502-3BCD7034-5A9AB471/0/0
X-purgate-type: clean
X-purgate-size: 1745

On 06.08.2026 13:48, Andrew Cooper wrote:
> On 06/08/2026 12:04 pm, Roger Pau Monne wrote:
>> --- a/xen/arch/x86/x86_64/pci.c
>> +++ b/xen/arch/x86/x86_64/pci.c
>> @@ -26,7 +26,7 @@ uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg)
>>  
>>  uint16_t pci_conf_read16(pci_sbdf_t sbdf, unsigned int reg)
>>  {
>> -    if ( sbdf.seg || reg > 255 )
>> +    if ( sbdf.seg || reg > 255 || !IS_ALIGNED(reg, 2) )
>>      {
>>          uint32_t value;
>>  
> 
> Personally, I think this is making a bad situation worse.
> 
> Baring quirks (i.e. K10 era), there is never a case where we want to use
> the IO Ports when we've got ECAM.  Furthermore, on AMD systems when
> we're lacking ECAM we can still access Extended Config Space; something
> which Xen currently gets wrong in several ways.
> 
> The IO ports require a global spinlock in Xen, and then a global
> resource in hardware just to be able to translate the IO access back
> into the ECAM access we passed on originally.  i.e. from a safety
> non-interference point of view, you want to veto any use of the IO ports
> by Xen.
> 
> Xen needs to use ECAM, and only fall back to IO Ports if we think there
> isn't ECAM covering the target sbdf.  This will cause (mis)alignment to
> get fixed automatically.  It will also be a substantial perf boost in
> the general case; all the MSI/MSI-X editing we do (far too frequently)
> is in Legacy Config Space just uses IO Ports.

While I agree, that's a bigger change which likely is going to be unsuitable
for (immediate) backporting. Nevertheless the cross-device access that the
changes as presented could cause needs preventing, by altering the checks at
the start of pci_mmcfg_{read,write}().

Jan

