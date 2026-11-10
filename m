Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62629606A33C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 16:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YeV51e5Y
Received: from list by lists.xenproject.org with outflank-mailman.1482076.1685942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQozE-000212-4d; Tue, 10 Nov 2026 16:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482076.1685942; Tue, 10 Nov 2026 16:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQozE-00020v-1N; Tue, 10 Nov 2026 16:46:20 +0000
Received: by outflank-mailman (input) for mailman id 1482076;
 Tue, 10 Nov 2026 16:46:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQozD-00020o-6n
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 16:46:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQozC-000fgg-CF
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 17:46:18 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af34a50-e002-0a2a0a5209dd-0a2a4501a358-10
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 17:46:18 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af34a59-5984-0a2a45010019-d155dd2ff036-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 17:46:18 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-491971ac844so2198643f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:46:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498366c43f4sm7255634f8f.47.2026.11.10.08.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 08:46:17 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794329177; x=1794933977; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/QtkctxDsHqWwFMS9AKXXvVHOtKd7xdd1ENotr4EVs=;
        b=YeV51e5Yr0BDBt1y25ObLBHe5V9bD7Lor5NJlWp2A6vZSHRW1RybpGsfMXH1hZ3rlv
         YlnAV5/FoPtc47k/wphGaXpBd+b6WsSJCyFzRHykg7L67tzQz8z1AYEeYVUTMtpRNwc9
         HN43J+KVuA+phE3fYnN2lcIxQxO9YyVNliD9wNT85CX5SukI/I0Jm89BIWSzMHBbjp/0
         oidNvTHNAlkzuiMNcQYczNo86OGIxjZXzDnIuv28E47EbJJ9lhGrEsqRe0DtbQt7pAvs
         oT7+vGESj/YeT/CuhWIdX3t/wFfzNRd4Jy6ZE7nspcTFTJqwVdAlVplcATbWLSi3SliO
         Y2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329177; x=1794933977;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/QtkctxDsHqWwFMS9AKXXvVHOtKd7xdd1ENotr4EVs=;
        b=x/KcV58jiRVSpcZg8rTUkHBMH6Dl8agpMaejspycNGK27hvO7wb1yagvUaVIvfSEFT
         u+oCsRCMNSuX2CIF1rEzkWV3wIry156fRIY0Ptkqjr/4OXWsY4saWBqFS/jYLk4dnYG1
         dtX8nHXjSUHIF3OE/FovJE2tC/1Ihu4tZS0KxkVMWSvFizPh/1z+A6E4F47R0AhL9lFZ
         dWL06oMw9i5Er+o+2q3fjJrU7lY3jh7f0jZI4XB2ocbrxd/60yczRI/cg/LLrS20sx9n
         DrT01XfEKv5BfJ+kh6Klvk3g5ppI5I+zWdAlQ5ZHuKTgWHwE/6n5GXLZZtvkr01Qcco1
         Z/NA==
X-Gm-Message-State: APuU4Z/cu887T8HVH/UEnR8hmG+8jmyGePWddxoU8bJPc0jz/D/eUSR6
	/U/LeR+HJF7p8dMLsebFzqDdIn2+sYZuL1Nm0xHKPUt+fmMxtmsdMIrBJiOTV5z8zA==
X-Gm-Gg: AYBFou2r0OdleXBQp9FCPIHyX2TEc0ImiozxwBWaALfxFGVsJhkJXBHJQ6Po379XQR2
	EXezTaBpa1Sf0g1+Tzl0SVAg3ps5c1GjyuPZWv2Z2Wwell59kxzSepZrMWkdixpBB5lCP19srpZ
	2tRDe25pb0K45qAdlQ4/vkAFi5n0lrpUn67bM3agG359Ro2flEc7M9QGVQ3BIktg/oWLCgMbNAq
	dVcdC4d6Qhlzipqk7VdMoSQYXYQooGeD69WxE1BC+PMrs73OOyn9jhCdg8x83C4q5frMEkYJZrI
	PGyESl9+XwWxTmZvYq5dkb01oJ+1xLE1Z84gjzkufnYQ0hkXz3vdvtbe9KhQea/ySSRyBleZOPn
	Vsic/+l56yetg8NIbecWZIf1wmq07TvQ37npiHR5HQJmjHxKI2Eg+r8DeAGwBMwIt8+jgdmUkRK
	umhv27OMtjNQQcbAMQx+AC2mQMXIcjTEqMi6vTGg9b24uMt5hQstuARu0+1r2sf0gxo6fLd1vwU
	H6ECvvxkGWxPNrwsk13ER8eDWzlVM4gjNZ4RO1IohsQwb/+HwGc2U5lbjfrZMt/KQkBltdfU7cG
	1eoE45BhLZyGmQQGh52L/T0gsQ+KPhj/1c1o2vxbIB591oXpo+9eeguNnW9b8ZM7/y5pLKdUpi0
	r3kTQLmwXkAK/tI/UDw==
X-Received: by 2002:a05:6000:268a:b0:492:880f:494e with SMTP id ffacd0b85a97d-498306cfcabmr5855521f8f.40.1794329177523;
        Tue, 10 Nov 2026 08:46:17 -0800 (PST)
Message-ID: <9ae147c4-8685-4976-aa31-cddc6cf772e6@suse.com>
Date: Tue, 10 Nov 2026 17:46:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/39] xen/riscv: save and restore vsiselect on vCPU
 context switch
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
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <3a454373368c507a7bf9693c6651a7749d2a86b7.1790779209.git.oleksii.kurochko@gmail.com>
 <1791363264.8631fc262581453bbf619ec5b2062170.1a1159231980003f66@vates.tech>
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
In-Reply-To: <1791363264.8631fc262581453bbf619ec5b2062170.1a1159231980003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1794329178-BD67C757-54DE1A04/10/78276251493
X-purgate-type: spam
X-purgate-size: 2174
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 07.10.2026 10:53, Baptiste Le Duc wrote:
>> vsiselect is a per-hart CSR which a guest changes on its own: when V=1,
>> VS-mode accesses to siselect are really accesses to vsiselect.
>> Architecturally a vCPU has to find there the value it last wrote, but as
>> long as the CSR isn't part of the vCPU context it finds whatever selector
>> the vCPU which ran on the hart before it left behind. A guest which writes
>> siselect, is descheduled and then reads sireg without rewriting siselect
>> therefore reaches a register it never selected, and it can also observe
>> another guest's selector value.
> Nit: I'd suggest a more tighter version that might be more clear. Feel
> free to use it:
> 
>     ```
>     vsiselect isn't saved/restored, yet the guest writes it directly (VS-mode
>     accesses to siselect go to vsiselect). After a context switch a vCPU
>     therefore sees the selector left by the previous vCPU on that hart: a guest
>     writing siselect, getting descheduled, then accessing sireg hits a register
>     it never selected, and it can observe another guest's selector value.
>     ```
> 
>>
>> When Smstateen is implemented, access to vsiselect and vsireg is gated by
>> hstateen0.CSRIND (bit 60, SMSTATEEN0_SVSLCT in Xen's headers), and
>> v->arch.hstateen0 holds the bits vcpu_csr_init() ended up with. A clear
>> bit there covers the two cases in which the CSR has to be skipped:
>>
>>  - Xen didn't hand the guest access to it, so the guest can't have changed
>>    the CSR and there is no state to preserve;
>>  - M-mode denied the state altogether. Smstateen makes a bit which is zero
>>    in mstateen0 read-only zero in hstateen0, and a zero bit in mstateen0
>>    traps accesses from every privilege mode less privileged than M-mode,
>>    HS-mode included, so Xen couldn't even read the CSR to save it.
>>
>> Without Smstateen no bit controls access to the CSR, so it is saved and
>> restored whenever Ssaia is available.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


