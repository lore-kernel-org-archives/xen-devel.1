Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A996C54F52
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 12:02:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372449.1619772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogVl-0005kl-Om; Tue, 28 Jul 2026 12:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372449.1619772; Tue, 28 Jul 2026 12:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogVl-0005ke-M6; Tue, 28 Jul 2026 12:02:17 +0000
Received: by outflank-mailman (input) for mailman id 1372449;
 Tue, 28 Jul 2026 12:02:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wogVk-0005kY-Jl
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 12:02:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wogVj-00B93T-Kb
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:02:15 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a689a40-bab6-0a2a0a5309dd-0a2a450383ee-18
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 14:02:15 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a689a47-fae8-0a2a45030019-d155dd31b478-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 14:02:15 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47f81a3ccf9so2367378f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 05:02:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f9c4fe4c5sm38069766f8f.12.2026.07.28.05.02.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 05:02:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1785240135; x=1785844935; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVh2Z3n+AHzhxDbsq0VXWx1b9pqd9CkOptKZgtTsxAA=;
        b=B+aTrkudhcuYUOMaV7jGtuJPPz6NEabCCNw4/jMAvs0XxGImlt+OZgxj3cLnHS9F+v
         fQJUb1KrEZ2V2dXdAc7Je9e3JiB1Ots6WpTx4o+qonCLkbpwGiBCgi1YoMgrNbwZ2ED2
         aUXcVOwCHAFQOCn+EtQ4ECTCsjYSSrNu1ANNNVKxm5LGe5b89MNLVCjwM3OHowo53hCz
         xQPpXeGqQYY9n9tch5AE3as1dIHYDk4/JSf46Xtep6UrJ6qajWkVnStbhEqZnNrizsHd
         qsbOdSGcroR4Ua9VVAbP+TT0HaKfshktE7JSqqTiAuRiw1cTmoh5Y9Hto0Anj174rAm+
         tAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240135; x=1785844935;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVh2Z3n+AHzhxDbsq0VXWx1b9pqd9CkOptKZgtTsxAA=;
        b=qko/IqMNohGQQa/BoNJ7ryvM3lmZtOWFGGFfoCFUeOJ1rpMgqO6FK25DUwJrDgBsEy
         lYa6lIOv7OsF8MClaCbKpaGnGeYHJG8jZg4e+eZ/DfhZ+FnFkEQJOCBERaGUP5EHswXS
         pAUlJwKX46aHN2lhR0zvhWQu8ZFDbH7bVpxq2rKwUvDLtT+0mO//KGsirqgZQpcj4Jzw
         /b3LwW5oMcg/st2Q1U9piJYoeFGbKhyiivkHdoIz2nO5Ks3X4v63IK+EKLqVcy/6221s
         1fPuFR7tgxpDKEiu3miGgDLeQmXQC2QDp2GyCPrLCMVX4bymmonFJcQAY/Pkhv2kx1jS
         /JcA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3HTIsApUkJhzlRXu1jB11J1CEPvVJ3Gfaw512UZkuh+uvmie0Stpd9J6iEKrjAUt+6QuyXkgo3xY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyG1Se0V/F1UWsmWcec6GYKFfUUCy9r2HP0iAGWhl0ADRr4wycW
	JVFWBZ2vTLgtjg/RwFDnEl1XRfItWoe6Soyxkfw52ODxqGG/PLaGaxKTzpjE5qvXUA==
X-Gm-Gg: AR+sD11VA0j8AJ7/UJGEQ/WEuDuaU/Y+2C1sSOlZtmQhlMPJGqIT1vNGL5z203sYBMp
	Ya78xRlrvTrL+dXiBHhF2iKIzWWf6BZgR3k2ah1cZIwYWKE8SlBj/BisO2s+U6ywwiAyadVJ1hl
	PAZ5pKNgDlhQmSYCdcZEh4waGmg0Jv0KJTagkHT5v/S7Z6Mb/oKkZDXdbxyzcbQVLTht+c0/OVc
	VtTDQAip0efao3OkDMEoHkhpUgE4MOZB1lSo7dawpqSwmHoXi0O2N97c3NC10HFZnh00DO2AV9p
	rqDK5g++CdiYp3V84HSuKnWWSDKIyfqpqpfunOp5tlId9DZB2kQhx0JlsAQlnfAcYtXE1Ocg5lc
	/qRrYtxTbz+rDjD7MczHtZ+mSthXPP0Do+F2NZeFkLWEMjArvzm0//KpusXqhZ8N5w5eFMbmYzO
	A1iIrCfcaefrxxMvcZBfgIBVVXEmm7Z36ZtTcSDOmG4qRzWM13CBREycOQz0zBPka2Iw==
X-Received: by 2002:a05:6000:2386:b0:47f:9283:1fbe with SMTP id ffacd0b85a97d-47fb1e682e3mr2297380f8f.0.1785240134895;
        Tue, 28 Jul 2026 05:02:14 -0700 (PDT)
Message-ID: <a9725508-7660-4960-88ef-8e5b324f8f08@suse.com>
Date: Tue, 28 Jul 2026 14:02:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/17] xen/riscv: add missing APLIC register offsets,
 masks to asm/aplic.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <ee3825adfd0012437a594f6a0e51c6ee71175cc4.1784560663.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ee3825adfd0012437a594f6a0e51c6ee71175cc4.1784560663.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1785240135-7428D4E9-CCE4DA36/0/0
X-purgate-type: clean
X-purgate-size: 1929

On 20.07.2026 18:02, Oleksii Kurochko wrote:
> @@ -25,6 +27,7 @@
>  #define APLIC_DOMAINCFG_DM      BIT(2, U)
>  #define APLIC_DOMAINCFG_BE      BIT(0, U)
>  
> +/* sourcecfg register fields */
>  #define APLIC_SOURCECFG_SM_INACTIVE     0x0
>  #define APLIC_SOURCECFG_SM_DETACH       0x1
>  #define APLIC_SOURCECFG_SM_EDGE_RISE    0x4
> @@ -32,7 +35,39 @@
>  #define APLIC_SOURCECFG_SM_LEVEL_HIGH   0x6
>  #define APLIC_SOURCECFG_SM_LEVEL_LOW    0x7
>  
> +/* target register fields */
>  #define APLIC_TARGET_HART_IDX_SHIFT 18
> +#define APLIC_TARGET_EIID_MASK      0x7ff

So why would these live here, far ahead of ...

> +#define APLIC_DOMAINCFG         0x0000
> +#define APLIC_SOURCECFG_BASE    0x0004
> +#define APLIC_SOURCECFG_LAST    0x0ffc
> +
> +#define APLIC_SMSICFGADDR       0x1bc8
> +#define APLIC_SMSICFGADDRH      0x1bcc
> +
> +#define APLIC_SETIP_BASE        0x1c00
> +#define APLIC_SETIP_LAST        0x1c7c
> +#define APLIC_SETIPNUM          0x1cdc
> +
> +#define APLIC_CLRIP_BASE        0x1d00
> +#define APLIC_CLRIP_LAST        0x1d7c
> +#define APLIC_CLRIPNUM          0x1ddc
> +
> +#define APLIC_SETIE_BASE        0x1e00
> +#define APLIC_SETIE_LAST        0x1e7c
> +#define APLIC_SETIENUM          0x1edc
> +
> +#define APLIC_CLRIE_BASE        0x1f00
> +#define APLIC_CLRIE_LAST        0x1f7c
> +#define APLIC_CLRIENUM          0x1fdc
> +
> +#define APLIC_SETIPNUM_LE       0x2000
> +
> +#define APLIC_GENMSI            0x3000
> +
> +#define APLIC_TARGET_BASE       0x3004
> +#define APLIC_TARGET_LAST       0x3ffc

... the register definition itself. Would you mind taking a look at the top
third (or so) of arch/x86/include/asm/msr-index.h? There you'll find MSR
index values of MSRs we use, immediately followed by field definitions (of
course only where applicable). With such an arrangement, the extra comments
you add can easily be omitted.

Jan

