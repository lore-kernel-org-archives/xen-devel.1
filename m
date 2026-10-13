Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3A3CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 11:39:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447021.1663172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGaqt-0001MN-T4; Tue, 13 Oct 2026 11:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447021.1663172; Tue, 13 Oct 2026 11:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGaqt-0001MG-Px; Tue, 13 Oct 2026 11:39:27 +0000
Received: by outflank-mailman (input) for mailman id 1447021;
 Tue, 13 Oct 2026 11:39:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGaqs-0001MA-OT
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 11:39:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGaqr-000Dfq-U1
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 13:39:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace1869-2eae-0a2a0a5409dd-0a2a4503a638-10
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 13:39:25 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace186d-fae8-0a2a45030019-d155802be0e6-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 13:39:25 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so28697165e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 04:39:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf1358asm362338865e9.4.2026.10.13.04.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 04:39:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1791891565; x=1792496365; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uyPd4ETxoPO8/iFsSx9XpoUu479xw20UGesX25IrssA=;
        b=ANvR/ojqcm8ehpwoMYZikWVS0i+slZ5GL1Dh6X5xoeAH0pl/IQu9XkPWeJ+blUlpZO
         QU354YoRGUihs4TDGm1g4BmminLzh0eCdGvVZwQ8fSaLF4JhH/nK991OPGbX5ysZtIFc
         UoMpM5KV0l35PmFr0xhcdT+1gGvhcvGap2JhxqL06LLCIOhPVXF5zTTk+t78M0vLiGja
         lUv0gBjg3HfRzooYwK0qsd7nll8ZBtrKFxysNsDYSlNBvNUKYyUgXNoFdCHAOPAGuDRJ
         VT9yLANrFh7XU9iGfMs/Nf3KX9LYywMW8sb6egIInSI5UrnAXSYJaeT+ZFgPWjpFYcMd
         dGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791891565; x=1792496365;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uyPd4ETxoPO8/iFsSx9XpoUu479xw20UGesX25IrssA=;
        b=HgDfUJXud2bDxGI6Oo7hD263T2aH718YTikt4Jx9wcSgDDiIu2HZZOMib0EqxgRmSz
         Rcj0/cFoVtig1EC1TBssE6bjOgvjMo8P5cCXUrHbIC0n3bK1WlEhWWPOxy8w8DnR9LWG
         yI8cENEr3LCYVZCQFbaW9dj++b6NL+fVnKmwMe/7TWdlPdWKnIPH6ycE83DbX93iG+z4
         WVkVVJA9CfmGCkKTpEBjFGpH7yM4TTwiiZidIYnn1e6lLQNM2E+Izu9vsl/H/wqnEysq
         lplxT1MmuTdQp6rxZMFq0HzU0GYdsOxOoACs2fAR/p7kI5zzZocgNZqzf+QfWSRLnsB/
         8TJA==
X-Gm-Message-State: AFq9FYJMN7DvCc+AV9iCJvDW/nHICmrCDb/GVkd/M2T5MC9h2p7vP50T
	QfRQhiXgDHd1y1fBYLesTbp6ufHboyYpHF1vrye2qBSw6EVuY24gdsO6L6YwA/22mg==
X-Gm-Gg: AYBFou3CXtjvOZe7yQAFldyKXLgca2bxsKiFwu67QeXkIPk9y1WFdfpoIpgBMKv2ETL
	k5qd9BeZ7j7dimIme38gHnCh+JEXYyZ0TI2wN43gJvoDTWCE0M8tjQMSRiaRALquoRxu3xsgTq/
	3TsUsCkyKluhW8MP9y/4MZIOMmXQozPiC/knQBdgrXqW20dCtp1Z/yWYPiAcAHdW4ELyjZc3xVf
	iIOg3SPLFDds3Bnvh89+8/w1Ioo2JnOwgfzRBjNbEICpLFaGLR4jxr4y8Ow0Oc3Z5mqwgMnsDSv
	XPWGLK8AT0uV+DwNAVze0DzjsZ3FhG4f2j+xMoC8EG7YFDfL3LV7F1vlp3BMWJJnk3KCBK+o9p4
	52sRodSZ1eKfQpJrrvCHGc4vWOO9EeaFd7vXkTzI+C9nGj6lx+vEGwSgc5RcLsNwOnMh0JtY49N
	/XcR4IB93mlMh3JjEwus0SpB5o4EzY0Aj6fWpyKaBnb+wiJG8n/AwX9mKCQGtBQHmSc1apIO8aT
	0O3pOHDre0Eshlm6e+oUSoqVZoAxMZFjcZoIeapzHZTui8gfVEQfofE1SNoxQ==
X-Received: by 2002:a05:600c:154b:b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-4a18e4d0be2mr234485795e9.23.1791891565217;
        Tue, 13 Oct 2026 04:39:25 -0700 (PDT)
Message-ID: <c7201691-320c-49f2-a772-481acf3f798b@suse.com>
Date: Tue, 13 Oct 2026 13:39:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] x86/setup: break out E820_RAM accumulation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <d1a67360-838e-4d9b-8b91-1ebfd9e6f613@suse.com> <as4QeRrfi3k9hMnZ@Mac.lan>
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
In-Reply-To: <as4QeRrfi3k9hMnZ@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1791891565-764FC4E9-3EFAE8D6/10/78276251493
X-purgate-type: spam
X-purgate-size: 1016

On 13.10.2026 13:05, Roger Pau Monné wrote:
> On Mon, Oct 12, 2026 at 10:20:16AM +0200, Jan Beulich wrote:
>> We already have two instances of this, and we're about to gain a third.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger@xenproject.org>

Thanks.

>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1007,6 +1007,17 @@ static unsigned int __init copy_bios_e82
>>      return n;
>>  }
>>  
>> +static unsigned long __init nr_ram_pages(void)
>> +{
>> +    unsigned long nr_pages = 0;
>> +
>> +    for ( unsigned int i = 0; i < e820.nr_map; i++ )
>> +        if ( e820.map[i].type == E820_RAM )
>> +            nr_pages += e820.map[i].size >> PAGE_SHIFT;
> 
> Do we want/need to ensure size is page-aligned here?  AFAICT this is
> the sanitized memory map, so it should have all regions aligned to
> page boundaries.

Neither user cares about an entirely exact value, so keeping things
simple looks sufficient.

Jan

