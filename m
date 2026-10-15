Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2B1CC6B39
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 16:04:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450852.1666225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHNwL-0004CH-Ho; Thu, 15 Oct 2026 16:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450852.1666225; Thu, 15 Oct 2026 16:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHNwL-0004CA-FD; Thu, 15 Oct 2026 16:04:21 +0000
Received: by outflank-mailman (input) for mailman id 1450852;
 Thu, 15 Oct 2026 16:04:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHNwK-0004C4-CX
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 16:04:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHNwJ-00GFY2-PR
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 18:04:19 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad0f965-bab6-0a2a0a5309dd-0a2a4505da7e-46
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 18:04:19 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad0f983-4cb1-0a2a45050019-d1558031cc81-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 18:04:19 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a1ad2e2391so23885645e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 09:04:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd993caesm158643695e9.12.2026.10.15.09.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 09:04:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1792080259; x=1792685059; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+jyMiZ1GGN0rRgnNxkmGjWG6cimbc3Tb4W+2v5Mpeh8=;
        b=ROExlOLEXqC08c1QO5LUNzYkIYMXMbFfQ5y/3dwg2Rz57XxLW/VIO8kgfJh9vhbjKd
         gmauO953fD0rsUt71PteDsYk9JUJPt+M9u1brge9eoIfYmglZUMMZiwf5sMJ2i52ciVa
         tfF2vHt29UOXfPq8CyVgIc+/5Ci7WVOgUvinyp702pFEotcY48KB/ChGEwekxdPl4xaV
         GbwI8u6wLemOBZQ27Zi7fe1eT83nIQDQaVSQbQBzH1MCMPMXikiFo7HNTiifkyLJ3YFF
         HkgftqpmdYMn4IdLrsAveNpIL22loJYOtONQZYf2mncwnkWFjsPSN1sWr1+orXRCZgOR
         DNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792080259; x=1792685059;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jyMiZ1GGN0rRgnNxkmGjWG6cimbc3Tb4W+2v5Mpeh8=;
        b=ikkFAX0ZCRjqRs5DXfp5ub/1++rUCtXC+nGLdWNFMkO//eSzfR49/NQkucqOuaMN0c
         9I4//1RH1OgimcGjbRFz48m4HBo4in7CiVdrQjhh5G/nchkwzk89xq/QLX30qKpAzsBc
         aZ7rxXJJGMecxTOfn6vAjWWJXzUJ5tB835ZqoP9Nsv2H0kaUNphEzTLLZS4YaqYHdRv0
         t3X4bW2/S4WmlE+GPKrFMYfKztBTTy01EOQm4/xbuyE8ImJtqfSSWA32Pu4eqG91WLPr
         VZTgAQAPp5SdDgvOT6TGAj5x2EgmIZ6KXBaK+QCDE49pm81s0C9BioyVivIbhHh91aen
         GBfw==
X-Forwarded-Encrypted: i=1; AKwUvBz93I/dMkfqenwVuqExd9qh6Su4rUiSaL1c7Glr4I9DSflAxygUAc+n0W2HvmCzg5PhZ0tOC24md44=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKYqU2g5qINSLifxp9d0HHIEpC5F2jeQMHV3Jhv7MRyUXd0RZ8x
	DcJqF/X0sVRSzfHEjk3egFPAXjEf7/Z7fl/gZAUnQ1SFp0Yz/fVr4ipAmqI5pWojyw==
X-Gm-Gg: AYBFou3IltlYi4I4rrl4yvphouGFuSuH+1WycJv9wE3RXsrjd9r1+Tx1OhZuRKgT3yh
	oqjVZgyOCHMBme+00nIBVrxDb8I+KmPyNIq3wNH9rcXTqIhxQQRiUKYvyJsn+hwCkuvdK3HoQRP
	+wsMUDqq0fxWAvXeQ1RkD/2satzexrCuas7wuegoc++6vf5SPvPxwtw/nKR+Iiz6EerNbAJh9Eu
	9FRY+WLgeDUmpWYEqL8pHDnOQ5Vsb54L6ARQ2XqPndc0CNQ9S6JljHwtDO4uYzxdPBPPeubQQhv
	HrQsnyiw26dctwtHfKSouqjhETnA4E14/4LM1fZ+Rf/0DwGuxu/OyzDQptoeQxeT7pWJuaODvTT
	JBdxLyzTKK7P0MYDHzKXcEBRVhOncSBE00PyZ1tjMWpfS81NPNkGnXGPy0fOf5ul9BYQcyUtu3J
	RsV1D+xSQBwD3mIrRcPStyhGR0DlAbOtw7z9b+OTF2U3Rlh+nLHV8Dg3kF1qM/+kJsEESnvE7H5
	ZmO7M8hfFcR7OZ5ZxfpiXPlmhCQAaFbUY5OxvoWcFh0qr4ZrvmBXM+tMLpeDOc=
X-Received: by 2002:a05:600c:c104:b0:4a1:96cd:2f67 with SMTP id 5b1f17b1804b1-4a196cd3240mr247982915e9.4.1792080259039;
        Thu, 15 Oct 2026 09:04:19 -0700 (PDT)
Message-ID: <2f04c46d-f533-4eda-9bd1-8b8e100dff07@suse.com>
Date: Thu, 15 Oct 2026 18:04:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] xen/riscv: probe the PTE A/D bits update scheme at
 boot
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 xen-devel@lists.xenproject.org, Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
 <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
 <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
 <1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@vates.tech>
 <db0d448a-ff1f-4549-84f1-c53e3e4a711e@suse.com>
 <1791996314.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425@vates.tech>
 <4e914f14-50ff-48a5-9f56-836913e487fb@suse.com>
 <1792052907.8631fc262581453bbf619ec5b2062170.1a13ead4e580008425@vates.tech>
 <7f5da80c-424f-49dc-8ce3-10ca2fae9f55@suse.com>
 <81ad5bb7-2300-4ac2-a999-adbb39270ddf@gmail.com>
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
In-Reply-To: <81ad5bb7-2300-4ac2-a999-adbb39270ddf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1792080259-2551A2A1-9A9416E5/10/78276251493
X-purgate-type: spam
X-purgate-size: 1172

On 15.10.2026 17:38, Oleksii Kurochko wrote:
> On 10/15/26 10:41 AM, Jan Beulich wrote:
>>>> Xen's internal behavior, but I'm unconvinced that it should also lead to
>>>> marking extensions as available.
> 
> Could we use the probe mechanism solely to verify that the A/D bits 
> behavior configured by the firmware matches what is advertised in the DTS?
> 
> In other words, rather than automatically setting the corresponding bit 
> in riscv_isa here ...
> 
> 
>>> Therefore, as far as I understood, you're not convinced of this:
>>>
>>>      /* Neither advertised: trust the probe. */
>>>      __set_bit(has_hw_update ? RISCV_ISA_EXT_svadu : RISCV_ISA_EXT_svade,
>>>                riscv_isa);
>>>
> 
> ... based on the probe result when neither extension is advertised, we 
> could require riscv,isa to explicitly advertise the appropriate 
> extension. If the probe result contradicts what is advertised in the 
> DTS, we would fail to boot and print a message asking the user to update 
> riscv,isa accordingly.

That's what I suggested earlier, yet from replies I concluded it wouldn't
be overly practical to have people edit DTs.

Jan

