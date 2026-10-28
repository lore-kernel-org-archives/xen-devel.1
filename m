Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CAE606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HRmSDSn6
Received: from list by lists.xenproject.org with outflank-mailman.1463211.1674148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM2z5-0001Ho-PU; Wed, 28 Oct 2026 12:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463211.1674148; Wed, 28 Oct 2026 12:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM2z5-0001Hh-Lt; Wed, 28 Oct 2026 12:42:27 +0000
Received: by outflank-mailman (input) for mailman id 1463211;
 Wed, 28 Oct 2026 12:42:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM2z4-0001HZ-FW
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 12:42:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM2z3-007aDe-Ov
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 13:42:25 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1eda3-e002-0a2a0a5209dd-0a2a450a85b2-18
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 13:42:25 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1edb1-f2d2-0a2a450a0019-d155802cb567-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 13:42:25 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a215e64962so9906115e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 05:42:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a96a32eef4sm26077285e9.3.2026.10.28.05.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 05:42:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1793191345; x=1793796145; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WriChvNKiJETe4YDI5a0z5UfBiITFyfI8Vbt79WV9g4=;
        b=HRmSDSn67OrqVqBKFNKgfsjqMKqb88f4tFdRrM+xIaTOQds/iGic3IEnVMU0rvaxK4
         H/XJHqqH2be7jruZevk3IM6/nf2PzdJqCVAmH2F7yNAuccS2ZHNilNUhpYDKjUxhJfgZ
         PVqQ9B8vCnyn/Fb/9nBlVhi+jg2td237klqIY2nzAmygCFz4WRZvSjmzW/8RXFLq85aO
         PUX4yFfYbpGuXTjY50OhLoTXzrHVUJf8PaqpH03IYfD5bzdPrzDpOuCLHljFSnYT5ziN
         RnMsuSNhcG1HpNXOjR2zM64hMsxEudILDWo5hfUlTg1pX1QuexrrGFFQdkeBfO3rcCNo
         5vCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191345; x=1793796145;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WriChvNKiJETe4YDI5a0z5UfBiITFyfI8Vbt79WV9g4=;
        b=e5TWcIxcys8WfWol6kHMeSsAn1BjFWaKqBzhiqT4xFNp1TUFJ/KF6HwZqef2pxAhW6
         I2JuxGqC0XRa/ab21v/m0eqRvJYdKi0Qu0N2H5tjI3zdSsD9PSDk7o0NdN592FGjscLZ
         5lYV4EzspOWuf+6fXnqQ/vGinh2wYofsnCCx6L/T+/ImgQ5+SyFcMzt55h+2C58y5KH0
         gSBG9bpOwk1G70shRMIrb6HIPYZqhnAuRM4Iiz5k6BI4SIObOtpfbDegL+Ls62OkI0MW
         /UuNVUqw4PY9qHcRGCgR0CQ0V+Dm6Pv/kU6JcaHQRPNsf5PFopc4UAdCwHjY0LrgM39n
         2l1A==
X-Forwarded-Encrypted: i=1; AKwUvBxcs4mikaADOapLictAow2rJ9BKsxewoKSDpEE0rMfJgbY8XBioI3Gw9u/xLZ7L03NluRzQobrnr8c=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKTdaRneqXrymnlVJCFTZB7iIJPVeAcld/XGodncRxLbEi4bll2
	H4ObIVLNFhCXRqk6i9RXnwB9GsecCdS83ezLhtU32HBBSaHdHgH/JLtt/kH/5PURnw==
X-Gm-Gg: AYBFou3BV/9fWEouVaRJbqRjuqxFj5sA+0T/Qe6tCPeyx/yeWQloYxm/8NHzM+O39oh
	T5TPl+6V2Jukfe8krnlZQm62TFFNe6e5rPbrP/b4THIeQq7jW258maHBVS2xfWaom9Yq6DLIhGe
	VJFLpUbkLmIkkiCU+VmMy3HLh9avqO1oEuHfudYMNpwA4GgDbn5SlgUVjmm8YLo5V5VzZvjr0Fz
	pHpFucThVxLYiZ3Kjg/VX76CyYNzl1RN1ut5rGkvFuiwxOKFHGyeWAsqkTa+bO+pkJh828MPZqF
	UOFmYP6VND5kxqHw902JzmAAMQcE/1cf0G8e+mMQab3r5wo/jfEncoic5RYAe8P5p2zqOP5EkCj
	5NG+rIExyEO0N+QL0541zA5UCUEhgDTaP+QrB5dQ+HEKvXGWAUL3ZTj4vBeawvz48Lk7x9O2AzL
	Bm/6TEFH21GDcRG1qxoM5kj88fQ4R+mwPbNjsY19VPcW8S9RxF6yoZXmaaSAmpKSDZYwpNvym6e
	1u+2AU9cPvKEgUgKSk+7iZDDbaXnI/NSPKmi7XxE87VODlRuTWV+DBchcoq14V4hdM8jHABWHM5
	Q8u0JKQHXWH6PzU3hHLJPHyXqR9vBLFMbVRU/wKtXFrisTVZbVxkeAZjFSsMvVjZCa3VTIIISk1
	n2lD6LWd2GXcFjAKJ
X-Received: by 2002:a05:600c:3e0b:b0:4a6:42cc:bf7b with SMTP id 5b1f17b1804b1-4a963ffcf7bmr49383175e9.3.1793191345092;
        Wed, 28 Oct 2026 05:42:25 -0700 (PDT)
Message-ID: <fe6088eb-7307-4f60-ae18-69fc8bc27894@suse.com>
Date: Wed, 28 Oct 2026 13:42:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] vpci: allow queueing of mapping operations
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1792072426.git.mykyta_poturai@epam.com>
 <14cc4abdcf4c3c3d9a620cf4df3ec87e7b11bd13.1792072426.git.mykyta_poturai@epam.com>
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
In-Reply-To: <14cc4abdcf4c3c3d9a620cf4df3ec87e7b11bd13.1792072426.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793191345-516C6CFC-29376209/10/78276251493
X-purgate-type: spam
X-purgate-size: 2200
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 15.10.2026 16:08, Mykyta Poturai wrote:
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -24,6 +24,11 @@
>  
>  #ifdef __XEN__
>  
> +void vpci_vcpu_init(struct vcpu *v)
> +{
> +    INIT_LIST_HEAD(&v->vpci.task_queue);
> +}

If there's more that's going to be added to this function, having it out-of-
line is fine. If it stays like that, it can be inline (and then there won't
be a need for a separate stub).

> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -19,6 +19,8 @@
>   */
>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>  
> +void vpci_vcpu_init(struct vcpu *v);
> +
>  /* Assign vPCI to device by adding handlers. */
>  int __must_check vpci_assign_device(struct pci_dev *pdev);
>  
> @@ -54,7 +56,6 @@ struct vpci {
>              uint64_t guest_addr;
>              uint64_t size;
>              uint64_t resizable_sizes;
> -            struct rangeset *mem;
>              enum {
>                  VPCI_BAR_EMPTY,
>                  VPCI_BAR_IO,
> @@ -152,14 +153,24 @@ struct vpci {
>  #endif
>  };
>  
> -struct vpci_vcpu {
> +#ifdef __XEN__
> +struct vpci_map_task {
>      /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
> -    const struct pci_dev *pdev;
> +    struct list_head next;
> +    struct vpci_bar_map {
> +        uint64_t addr;
> +        uint64_t guest_addr;
> +        struct rangeset *mem;
> +    } bars[ARRAY_SIZE(((struct vpci_header *)NULL)->bars)];
>      uint16_t cmd;
>      bool rom_only : 1;
> +    const struct pci_dev *pdev;
> +};

As this struct isn't used anywhere in the header itself, it can likely move
to vPCI's private.h.

Jan

> +struct vpci_vcpu {
> +    struct list_head task_queue;
>  };
>  
> -#ifdef __XEN__
>  void vpci_dump_msi(void);
>  
>  /* Arch-specific vPCI MSI helpers. */
> @@ -204,6 +215,8 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
>  #else /* !CONFIG_HAS_VPCI */
>  struct vpci_vcpu {};
>  
> +static inline void vpci_vcpu_init(struct vcpu *v) { }
> +
>  static inline int vpci_reinit_ext_capabilities(struct pci_dev *pdev)
>  {
>      return 0;


