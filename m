Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96623E95376
	for <xen-devel@archiver.kernel.org>; Wed,  4 Feb 2026 10:49:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1220413.1529120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnaRo-00054Y-L8; Wed, 04 Feb 2026 10:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220413.1529120; Wed, 04 Feb 2026 10:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnaRo-00054R-Gl; Wed, 04 Feb 2026 10:49:24 +0000
Received: by outflank-mailman (input) for mailman id 1220413;
 Wed, 04 Feb 2026 10:49:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnaRm-00054L-Ne
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 10:49:22 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28eb3774-01b7-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 11:49:20 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so6161661f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 02:49:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e25d0dsm5599104f8f.7.2026.02.04.02.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 02:49:19 -0800 (PST)
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
X-Inumbo-ID: 28eb3774-01b7-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770202160; x=1770806960; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qz7dYmytK84FneTLu68z4Bm1ji8uFvgf8x5Z7BmWi18=;
        b=GnwuXX1cKjMV+gUjk/YGifHnzCNWptZlgp9fJUnqrJ0rgz2ihAN09Shjp0Y7hH0+jg
         SbI/5xODXyZE7kkMCGP08VB3ExB2Lpvg5Ra9oG2XKNDQZFqewxBu8eDEQH6Szi78stax
         ofrsTJKtCxO+cSmkVYVg/bPAOgj4u7aLuVgibLnIhYBZkYyn5qIxfvhTcd+itjEScQTg
         59m79jLSuoEMYnlGeJ8gHQajk9YPWi8IeyI3QIXK/VusroRzX+y+YN+YT4Mubl5Nhtm1
         w7WeDCuGeviDetdzKb+a07GHppOVlOSFcRwfwIX0i/2cK4bPmnpd+Z/Ht3qeW6cytXtg
         7vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770202160; x=1770806960;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qz7dYmytK84FneTLu68z4Bm1ji8uFvgf8x5Z7BmWi18=;
        b=wd3nhPzPrq1yCn5LrpFzypN4LUVkAFGAenhvPFAWBgRziUv2YGFRTEizAErLTm6jOb
         C2NaXqkApXTu4avsMd/+nEwWgsZxe/gV0CnoO17LbMjub6814omw+NvFpVqN1XB9LSdA
         SdD5ChbkfM9JIh5X5pBuuSSNnHIo0hvXJUim79lHDT4War0Cj+EsRwnm4sRmsNlDaNCz
         5AFvtl4/0j/6RX9a901eDu5EIeGvr+HBbYkBF5foFwO/Q3r7fi4ozjITVK84JkaQwHHk
         9i94RLso+O4/yELdb+dKiSs2NbMudGU5ef9zEyDbXnqXxPvYfaDpwjC8OD7iPE4HVlYf
         Wytg==
X-Forwarded-Encrypted: i=1; AJvYcCVRRGmVMP+p7D2SmnNFSRVGKPPLsYnZzUWRN8Cqm+6iIGRNJ0RUbXOcIBQnfH5ZOf9PGjM+3s/PDNs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwaLbKPkR88HHghjgohwdOqYVrUa+2JnulPh/F5G6XZcKm1SEzm
	nZw91mqHN8BjQvSw46e6FPSfJnZaUP2EjU126zZ9838inV9Vy6+GPWMtfOd11D1NVQ==
X-Gm-Gg: AZuq6aLSoDY0dpHvrr0lO8OedBCfYkNnl0fAfbijxF91XtwZC/YcnbeVOl/6Pizuk/H
	DJW+mEg4ObFcG+Yixdc7IUhsFMk3VFdT74OpOb5gfkOhFuRuR4GGx3nuCn52Tr7d1J/ISbi7iw7
	9+FLerCLeD+HiCjOztBCqYAUQoIcTaEyqoluvSXNw4QYejfR38SO9XzRkvVHYSKm3kZ1gnjBa0z
	NeflF7IUxNHMq0kEjBv8PD/vaiPcMY/GkbXe5cFS5rFjZomm1I5pBTHhjAzaFIDYaf1787txTzg
	le+/hCSkqjvuYHGoSuSKQ6BYnKWG86ojRXdMRn6LHhvJNXnX3e1F6hfkFaHsQ/VWIoaakjfopWr
	h/iyYBMqkw5jsy1TCrLxMlIeIXAFcBFOdgZRVZLPkipAo4qIZ7MIaLh1b7TxZVt/chPYSoBv2hy
	SDYR72nAL9Y+AXCUEAOWohU78gHDNntreHUvtiCGWsdz/+a923mmic6R0VpWrWwzm8i8pMJgeTb
	jI=
X-Received: by 2002:adf:eb82:0:b0:436:1a2e:2c50 with SMTP id ffacd0b85a97d-4361a2e2f57mr1542766f8f.12.1770202159719;
        Wed, 04 Feb 2026 02:49:19 -0800 (PST)
Message-ID: <316accc5-2e6b-4571-98a7-5776a47a4ad7@suse.com>
Date: Wed, 4 Feb 2026 11:49:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/16] xen/riscv: implement sync_vcpu_execstate()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <eb254f5a49d01712f9b3745e420dd37a4a9ba0bc.1769099885.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <eb254f5a49d01712f9b3745e420dd37a4a9ba0bc.1769099885.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.01.2026 17:47, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -259,3 +259,21 @@ void sync_local_execstate(void)
>  {
>      /* Nothing to do -- no lazy switching */
>  }
> +
> +void sync_vcpu_execstate(struct vcpu *v)
> +{
> +    /*
> +     * We don't support lazy switching.
> +     *
> +     * However the context may have been saved from a remote pCPU so we
> +     * need a barrier to ensure it is observed before continuing.
> +     *
> +     * Per vcpu_context_saved(), the context can be observed when
> +     * v->is_running is false (the caller should check it before calling
> +     * this function).
> +     *
> +     * Note this is a full barrier to also prevent update of the context
> +     * to happen before it was observed.
> +     */
> +    smp_mb();
> +}

Where's the counterpart of this barrier (going to be)?

Jan

