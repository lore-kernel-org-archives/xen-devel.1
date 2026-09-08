Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04617C79F9E
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 15:06:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412169.1642667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3xOU-0005CG-Bt; Tue, 08 Sep 2026 15:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412169.1642667; Tue, 08 Sep 2026 15:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3xOU-0005C9-9A; Tue, 08 Sep 2026 15:05:54 +0000
Received: by outflank-mailman (input) for mailman id 1412169;
 Tue, 08 Sep 2026 15:05:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3xOT-0005C3-CQ
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:05:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3xOS-00DlmT-Fy
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 17:05:52 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa0244c-8faa-0a2a0a5109dd-0a2a4504c984-12
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:05:52 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa02450-b57f-0a2a45040019-d1558035d033-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:05:52 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49b392ccaacso70586715e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 08:05:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d07a23e85sm284549695e9.5.2026.09.08.08.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 08:05:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1788879951; x=1789484751; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4+MXLPBiJokAR+uDH2BKPAQ1ps4nAD/H6MbmfGExJ7g=;
        b=PnaLqdlT3RaBqSRbZofpHiMtsjUy6j3M6XakavjnZG/j//VBp01Zmc4NYn6Vi0YaQv
         7WejhwFE8RzDVl8BTjckTKWG9M4PtPZaj8gD3LJGI+pCzDarM+9Xyyva1+XoeSY6vel9
         upjU7oKqCE37sUh5xO3z2+KQWJ2yCybW6tFzVRjdlMGCeMW5uxN3AUBXUpdo+I3f9jYI
         EO2MjuqaoxUzj7BvEqniNIxR4SSH3hbb5E+H0+jSDinDcYxAxQB32i3yyLIdi2Xbzdvt
         WXf8ZVX5wYeHQ4gAj/j1CqVbYvA7L880Q9iHOY2QPB3hmrq5JO4crUKXYjNSQIiDQuuV
         vDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879951; x=1789484751;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4+MXLPBiJokAR+uDH2BKPAQ1ps4nAD/H6MbmfGExJ7g=;
        b=fX9rdL2vvkzWdtjM5qr6qB4+C0I9NQdDFXVg+WiqKuJSuO+FVwXjroc2ssRmiCNG/Y
         F7W386yz12npjOL2norNr5h9EfsVdUMudX2DQvx+8juX1419BOLH7rqBxsztCjJc9ka0
         507fS9fHUE8fmnYEpj7IaxdtsxsXSP/ehENqjEJqyDwRyH4o2rYppAbKHNQiSnF/5G39
         ks5c8JEBGLFwfM2lYsTPXEMBcCfVZgYfbZXPdL4hMHKBNWO13sH7HdE7xYmnvBB46lIo
         MB8bqYOkG426pMra39tsBR06xuT5Bse23bUp56/W5YFlVxWm1wpWQpt4zUMuB3V/W3Vu
         Xthw==
X-Gm-Message-State: AFuF++mu60nI9+yAXK9VsKgdm5ayLqdhfKMAW9AmWJhHOzjAcXD/WdD5
	9pney9OvFsvndfqA4gWh/EV9IGosK6jqiyaPqQCYgc3v6a0PF28yT622Yp4MjQQ5LQ==
X-Gm-Gg: AYBFou2OSfqFqnUpV6WOkbXK+S7Da9RZhl9AoLIu5y2J4QxS5xoIPReVbgvwOT3jtdk
	NXitHQkbLk/4sZaKlMHPLJxXFa4nkxrcaryjosrY2hEfDUcEFhS1PNaIuyFZvX0V1Ya0lOgC5BE
	bz/WY2JYcwoaCyWPpO6+cI33g1kEn2f8sLVzLrKX1L4SHC+9DZ9pS1uOM98iBzuHrBgDgn0zicr
	V8fZrx5a72oKNroGwq4vq2NdVuCCFIUG7nNcRJVD6YMPL+MR7aOMZ+4xqMG061vffSg7PB7ep6H
	GatQB+Vp1mYEOsFTMP/dar1K1zGIT8keC6Ghv0l2DjmG35npyFbCO0XiGLMnCADhQGut7EWbjtD
	0tVWdVrTvoXmdKWJeunXK+u+xrJz457qyEmVtO4XQRNV/qXcBqKykB/C4BSdlmikQpMtxyAaj3r
	CrxZdF7mWcVTtNMA41Jii46B9F9KDNZFfbKG9U24wSLkH0svls8lNCh5oT2SI9dCtg5qooqNHK0
	bWARexu2DjW9UPDEep2s2XgqUjNM7rXhTJG/nzX2QfAgvF9477U
X-Received: by 2002:a05:600c:3f06:b0:49d:1cc3:fa9a with SMTP id 5b1f17b1804b1-49d1cc3fde0mr34132975e9.14.1788879951576;
        Tue, 08 Sep 2026 08:05:51 -0700 (PDT)
Message-ID: <da081e7c-eca8-48bc-b62d-bc84a9c09d7f@suse.com>
Date: Tue, 8 Sep 2026 17:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/39] xen/riscv: implement trap redirection to a guest
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <583b0a190bad7121eae9bc99bd1e13dc1743efe4.1787838835.git.oleksii.kurochko@gmail.com>
 <1788796634.8631fc262581453bbf619ec5b2062170.1a07c96862b000c4f3@vates.tech>
 <2f734f0a-7f3e-4e27-82ed-52ccf72fe49a@gmail.com>
 <72b89a0c-ad0e-4c1d-97f7-92f49ede7a55@gmail.com>
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
In-Reply-To: <72b89a0c-ad0e-4c1d-97f7-92f49ede7a55@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1788879952-536C2B50-1EA30396/0/0
X-purgate-type: clean
X-purgate-size: 1723

On 08.09.2026 16:58, Oleksii Kurochko wrote:
> On 9/8/26 12:01 PM, Oleksii Kurochko wrote:
>> On 9/7/26 5:57 PM, Baptiste Le Duc wrote:
>>>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>>>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>>>> @@ -109,6 +109,12 @@
>>>>   #define SIP_SSIP            MIP_SSIP
>>>>   #define SIP_STIP            MIP_STIP
>>>> +/* stvec/vstvec: MODE is bits [1:0], BASE is bits [XLEN-1:2] */
>>>> +#define STVEC_MODE_MASK            _UL(0x3)
>>>> +#define STVEC_MODE_DIRECT        _UL(0x0)
>>>> +#define STVEC_MODE_VECTORED        _UL(0x1)
>>>> +#define STVEC_BASE_MASK            (~STVEC_MODE_MASK)
>>> Nit: STVEC_MODE_DIRECT and STVEC_MODE_VECTORED aren't used anywhere in
>>> this patch (only STVEC_BASE_MASK is). Either use them where you decide
>>> exceptions always target BASE regardless of MODE, or drop them until a
>>> patch that needs them.
>>
>> IMO it is fine to introduce *_DIRECT/VECORED here as they are used 
>> implicitly through STVEC_BASE_MASK and thereby it will be better to 
>> introduce them here now instead of open-code them and then just update 
>> STVEC_BASE_MASK again when *_DIRECT/VECORED will be re-introduced.
>>
> 
> Oh, sorry, you are right. STVEC_MODE_DIRECT and STVEC_MODE_VECTORED are 
> really not used here (in this implementation). I planned to do:
> 
> #define STVEC_MODE_MASK (STVEC_MODE_DIRECT | STVEC_MODE_VECTORED)
> 
> But I missed to do in that way.
> 
> I will update the defintion of STVEC_MODE_MASK in suggested above way.

But that's yield a mask value of 1, when you want it to be 3. That ORing
together looks bogus to me anyway.

Jan

