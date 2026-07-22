Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB318C44533
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 07:40:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368173.1617658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmRYw-0002z1-HW; Wed, 22 Jul 2026 07:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368173.1617658; Wed, 22 Jul 2026 07:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmRYw-0002yu-Er; Wed, 22 Jul 2026 07:40:18 +0000
Received: by outflank-mailman (input) for mailman id 1368173;
 Wed, 22 Jul 2026 07:40:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wmRYu-0002yo-HE
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 07:40:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmRYt-00HEQX-U1
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 09:40:15 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6073db-e002-0a2a0a5209dd-0a2a4508c810-36
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 09:40:15 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6073df-f659-0a2a45080019-d155dd31c521-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 09:40:15 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47640541585so6384784f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 00:40:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f864305f5sm2910463f8f.17.2026.07.22.00.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2026 00:40:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1784706015; x=1785310815; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlPIhISv92VaZdn74ygYSngw8iSSKtskrahdd9BcbXE=;
        b=QWQJxmqEL3qorpmOHtnyq0Q2DDtq/SL5ZiLQfkkMiDCypcp6RBATB+YG3z3itUq1GD
         VqVQ0SQrYGVNPE6lEGMP+1SjCrPSrD6YfCTH5KeRJP5tuxgqkyobOBfQxmGwXVcbJahf
         bwVtGt++VP1p11hN1OWbEciJqiRJhSyGlplJZrMcLv1KWhS2wtRU3T8opUlXjMjDzyZs
         UT2rk7Ze8rdHb9yRAlK/nPVuf7lf5VXALgU0jwW0rz9XugBYaTaH0vYJE8cRFJYm4m6Z
         nPPlv/bveQRWMF0KB+WIbxUfPCQyBVLE8cbHbyZIWLdaop2xi5lQnwqx9Ax3h0Bxdqbr
         sV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784706015; x=1785310815;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlPIhISv92VaZdn74ygYSngw8iSSKtskrahdd9BcbXE=;
        b=D9Fe7IBG1nkf9Ze/RTl923UqUquNGvJWxlB/VHsFaeHvnC0XWx/T/d6cPiwQOABbFJ
         8i3en4sVqhbaXY2SDWaifY+6ykGBXJQdxpDQZFcSIYhWarsoRqqgHYGUTvszJ9OeY9Sf
         39TK6bHTim/pStGa25CLybeN3N4f9SWF9KFq2ZdeQoaj8qWGywnJtYi4ZaYhxrHIMvOd
         orInIGAIjkBwSp2mx60mGLcYg0SDCFitdbn8DzbpytNG/MaGADmly/qcPQ/DuxQ5eP0j
         OWD917XzwsGWSzZTRc0QW6pYkhVoZsfwnBaOiNWl2caGWa/UFQcPsoD/hNHGJHPVMSXu
         AjRg==
X-Forwarded-Encrypted: i=1; AHgh+RrjECft9Z2+Z9ez/apJGQeMlik0fnfp9Xu4DxMsuiBrx34kjncGWcwmJDspODKV39p8MzDFq7TcO3M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSlXdRIdQVOPJVLRYMaw5AQzO1MkfvBkNV+nkAlcX3xZY8rtDg
	lBBjnz9n6pWlfg5A2NviStDGNVVjefnMx5FWwvkknBBdEODpTrD4pOUuoWq1DFI/NA==
X-Gm-Gg: AR+sD13C1cUHUObCFjgI8MtKckWwc49Yh2TNvvux/zmHY0DRyLuHrH5FPOiX3dxUjBN
	90Ntx42xj4MFOEaqHtm7GKQVb5ZgA2NRdviHMjyJ3cYuURIVqT8PCaZ8QjDGyeVzz+ci3Jz0jfE
	oGW88QGTLp2DZTAAqJ9yHLArrRpqEj5Nk0Pz1dnvOaUsFrC+nXo8a0fVUBzKFyJpGML4Bzv2IHV
	Ond14DmBG3+Uj0b3/ueGlrwg/NGr6EgODrXbgsyX04wcIcqEZFSZ1VDS4wSKAlVqV5RaeN9bhp9
	JIRSkRw7CSr4kIxGQcpEXbN3P9YqfvppMDwIZZ4PpaTAKf6asp+tJGfCamBbIMRsC98P2uRTKYR
	pUE37hatv4ln1qIB/qRE283CaYWCT+nrQCP3EopVAcrYF+SuI82YqUaNjsqShEQOywvApjIoRdQ
	Q/6yqJef89CQNja+RWvVWRtGuZslZRvmte/t22Es8FdLSnSeSRK1Q5DvD5qZgi+FMA7A==
X-Received: by 2002:a05:6000:4914:b0:47f:6e23:64d6 with SMTP id ffacd0b85a97d-47f6e2366f5mr18025576f8f.16.1784706015071;
        Wed, 22 Jul 2026 00:40:15 -0700 (PDT)
Message-ID: <e5ac074d-c824-4fe4-a1d4-ba986236fbb1@suse.com>
Date: Wed, 22 Jul 2026 09:40:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/23] xen/riscv: introduce minimal virtual APLIC
 (vAPLIC) infrastructure
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
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
 <98bcad12ca4e5ee270cc1ef9db09d89a32f863f8.1784559209.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <98bcad12ca4e5ee270cc1ef9db09d89a32f863f8.1784559209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1784706015-D634587B-D0896945/10/73395122804
X-purgate-type: spam
X-purgate-size: 2575

On 20.07.2026 17:59, Oleksii Kurochko wrote:
> At the current development stage, only domain vINTC init and deinit
> operations are required, so implement those first.
> 
> Initialize vAPLIC's domaincfg to with the interrupt-enable bit set and
> MSI delivery mode selected as the current solution is exepcted to have
> always IMSIC, and initialize vintc->ops.
> 
> Other operations such as emulate_load(), emulate_store(), and is_access()
> will be needed once guests are running and MMIO accesses to APLIC MMIO
> range must be handled. These will be introduced separately later.
> 
> Introduce a structure to describe a virtual interrupt controller (vINTC)
> and a vintc_ops structure, which provides operations to emulate load and
> store accesses to interrupt controller MMIOs and to check whether a given
> address falls within the MMIO range of a specific virtual interrupt
> controller.
> Note that already existed init_ops field in struct vintc will be init-ed
> for APLIC in the follow up patch.
> 
> The vAPLIC implementation of these operations will be provided later
> once guests can be run and these operations are actually needed.
> 
> Introduce these structures here as they are required for the implementation
> of domain_vaplic_init() and domain_vaplic_alloc(). Also, introduce
> vaplic_init() and init vintc_ops->vcpu_init() with it.
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit I (continue to) think that ...

> --- a/xen/arch/riscv/include/asm/intc.h
> +++ b/xen/arch/riscv/include/asm/intc.h
> @@ -17,6 +17,7 @@ enum intc_variant {
>  struct cpu_user_regs;
>  struct irq_desc;
>  struct kernel_info;
> +struct vcpu;
>  
>  struct intc_info {
>      enum intc_variant hw_variant;
> @@ -53,8 +54,19 @@ struct vintc_init_ops {
>      int (*make_domu_dt_node)(struct kernel_info *kinfo);
>  };
>  
> +struct vintc_ops {
> +    /* Initialize some vINTC-related stuff for a vCPU */
> +    int (*vcpu_init)(struct vcpu *v);
> +
> +    /* Deinitialize some vINTC-related stuff for a vCPU */
> +    void (*vcpu_deinit)(struct vcpu *v);
> +};
> +
>  struct vintc {
> +    /* Used during domain build only; dropped afterwards. */
>      const struct vintc_init_ops *init_ops;

... "dropped" in the comment is misleading - there's nothing being dropped
here, as that's technically impossible. Iirc you don't even poison the
field once domain build is finished.

Jan

