Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124D2C79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 06:56:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413993.1643853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Yhs-0000M5-2d; Thu, 10 Sep 2026 06:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413993.1643853; Thu, 10 Sep 2026 06:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Yhr-0000Ly-WE; Thu, 10 Sep 2026 06:56:24 +0000
Received: by outflank-mailman (input) for mailman id 1413993;
 Thu, 10 Sep 2026 06:56:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4Yhq-0000Lr-E0
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 06:56:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Yhp-004PWd-3p
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 08:56:21 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2548a-8faa-0a2a0a5109dd-0a2a45069bc6-16
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 08:56:20 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa25494-195a-0a2a45060019-d1558036e070-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 08:56:20 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49b8e527d63so84350035e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 23:56:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26bf2bb2sm46769135e9.7.2026.09.09.23.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 23:56:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1789023380; x=1789628180; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGeg65X8xrMBCKHpM+4jNdPFWFcOAEGzT83tBCH4FU4=;
        b=Kl/vmLJvefXzn9oE4kmcsEGw2PAMUS6ZRKqGGKp2psAueQD1v1GxwwRdonG3alXEM2
         5lvqt2u+Us424XODrxT+WBwjhQaGuMORQl4idnPcA1+Fyh+a5yIdl25BNsBjWSNoc8AL
         AzgDMX/58tSJUCjxGYsM3WkiZADUwyq8WzEuWeFHSjsST2M6ENNBI8yzq5A0ePjSmHq6
         YmnACEfVRSiArW30+duD/JXaR1kPgsIlIh3GDPMoxyFk8TYpaOcYrXH1vkhRpm30uSuK
         ZxFyrtmvVOj1qVVzMSR0xD0DKV01elnSwL2yijiNkoRJKGr1bryrTwUTzN+1x4lKmJSr
         93OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789023380; x=1789628180;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGeg65X8xrMBCKHpM+4jNdPFWFcOAEGzT83tBCH4FU4=;
        b=DUeHAL0VVaqF3WsjBYPvovGZJJC8Y9PY9BHuABBTlObfu/sQQCYKkV34ZlKGuYOFsa
         PvqV8kyrjt3otoei3EhIx00yOfUVMqrcrzKNhwocm43N3SkQ2Bjgkuu2WxEthOSAUoEg
         jaP1qsI/djCePfHP6brdrO5gQYJo8fvN9PTpgmyg8nz1EKwTxz2mm5W1BrEQIF/4bJCB
         9pewcLOsghcM6GYCYCjp+9cS29o+HvunAg/1gTXBAiCsiLSZ2gBc5Sw9fDL2IZ8d/YU2
         QcGPRkiwUgkycXj9fA09tox/y5ij0YSz4o6+Crzd/vI6pkyrMhpe0eBvF7jGAkSCweJK
         DSjA==
X-Forwarded-Encrypted: i=1; AKwUvBztnADu0jlINjhJqIjEYoAGhTUWAKXYLt+uan3unyB4dAOcogrI8rh1wav9UBGj011L0g6gHOSQpMQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++lWqpaLMSDfe4fJC5yEkMh3GHwpxB1RFYcINTHZfRUDBNUieMvj
	OWynf4jq2ocf+Ug/dvq6YNMzhHEe7eaGjulRS7BHaUTRd2PSmFcKP7z7i6of4oj/GQ==
X-Gm-Gg: AYBFou3pA5e+USJL37RotUpssuabhtnHuxL+vq74I3F8RSMf8JsruZi0j9nyWaVQ4VZ
	UDpoRqlU/hB/IgWwVLNgGIuzTW38ajEdf8r3STGC/0NHoCDXgyCtnd8VJ2zS+0wDdZFMHOR3ldO
	Z39D07ESR5kUwPisae8/TMhma5vPThnmUFA0BAU04LBt7ZHo6j//tiqLVNSPOxR09Ccy6V8Kvyn
	5BsURNlodvBtbWVzH69dO+a0EkQiyhG167OLaaxqWXcLCSGd1ZVo56T/71O84hgNnsVWWG8U+Al
	cxN3wJNe0fsgKokCOCj8gkYgt1SHQ2dymHWJMwiva4pyEN+drtRMjURMYZWnHWVmWYb/V1wtJKT
	2wVTWL3vwRuoG7kJGj/Km8Jp3XqsNs057nM2Dtoou79lXNtqs9WrsJCkU3YGQlmuXvkPyLaPgIv
	ZA8PZhvKNb1hpNHdjrZrkj2B1/2P90oPBJ2cCocCxopjvZqlbETvFZUmIOHItA11oRszc07D94l
	+5CWvDuBwBw+8uO0XljndbekqgY9n8/ac2MDcYN7PVgxrdOJp4Z4oXa+pvoGeQ=
X-Received: by 2002:a05:600c:34c2:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-49d10d6fdeemr231467635e9.1.1789023380428;
        Wed, 09 Sep 2026 23:56:20 -0700 (PDT)
Message-ID: <f870eac7-da3f-4ca8-9d27-ea1d376e2277@suse.com>
Date: Thu, 10 Sep 2026 08:56:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/20] Introduce enablemenant of dom0less
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cover.1788876411.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1789023380-FDC0F77B-CF0FB9B6/0/0
X-purgate-type: clean
X-purgate-size: 4227

On 09.09.2026 17:07, Oleksii Kurochko wrote:
> This patch series reprensent a bunch of patches necessary to enable common part
> of Dom0less.
> The stuff necessary to start/launch domains will be introduced separately.
> 
> CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2829940455
> 
> ---
> Changes in v9:
>  - Address the comments.
> ---
> Changes in v8:
>  - Address the comments.
>  - Rename some variable in [PATCH v8 11/20] xen/riscv: introduce per-vCPU IMSIC state.
>  - Drop vaplic_init() and vcpu_aplic_deinit() in
>    [PATCH v8 12/20] xen/riscv: introduce minimal virtual APLIC (vAPLIC) infrastructure.
> ---
> Changes in v7:
>  - Merged to upstream/staging:
>    - xen/riscv: Implement ARCH_PAGING_MEMPOOL
>    - xen: arm: update p2m_set_allocation() prototype
>    - xen/riscv: do a 4th linking pass if necessary
>  - Address the comments from ML.
> ---
> Changes in v6:
>  - Merged to upstream/staging:
>    - xen: arm: move declaration of map_device_irqs_to_domain() to common header
>    - xen/Kconfig: introduce HAS_STATIC_MEMORY
>    - xen/riscv: rename enum intc_version to intc_variant
>    - xen/riscv: implement prerequisites for domain_create()
>  - Move UBSAN fix ("xen: introduce CONFIG_HAS_SHARED_INFO for archs without a shared page")
>    to this patch series as it is connected to "xen/Kconfig: introduce HAS_STATIC_MEMORY".
>  - Address the comments from ML.
> ---
> Changes in v5:
>  - Add new patch (xen/riscv: do a 4th linking pass if necessary) which fixes
>    randconfig job issue.
>  - Address comments from ML.
> ---
> Changes in v4:
>  - Address comments from ML.
> ---
> Changes in v3:
>  - Drop dependency from other patch series
>    ([1] https://lore.kernel.org/xen-devel/cover.1778140240.git.oleksii.kurochko@gmail.com/T/#t)
>    as it was merged.
>  - Reorder patches:
>    - move common patches to the start.
>    - Move some patches to separate patch series (will be introduced later)
>  - Address comments from ML.
> ---
> Changes in v2:
>  - Move patch "[PATCH v1 04/27] xen/riscv: rework G-stage mode handling" to
>    patch series [1]
>  - Address the comments from ML.
>  - The following patches were folded into one:
>    # xen/riscv: implement init_intc_phandle()
>    # xen/riscv: call do_initcalls() in start_xen()
>    # xen/riscv: setup system domains
>  - The following patch were folded into one:
>    # xen/riscv: add vaplic access check
>    # xen/riscv: emulate guest writes to virtual APLIC MMIO
>    # xen/riscv: emulate guest reads from virtual APLIC MMIO
>  - Add new bug fix, not really necessary to this patch series:
>    xen/riscv: manage IRQ_DISABLED flag in APLIC irq enable/disable callbacks
> ---
> 
> Oleksii Kurochko (20):
>   xen: introduce CONFIG_HAS_SHARED_INFO for archs without a shared page
>   xen/dom0less: turn max_init_domid into a common variable
>   xen/riscv: Implement construct_domain()
>   xen/riscv: introduce guest riscv,isa string
>   xen/riscv: implement make_cpus_node()
>   xen/riscv: implement make_timer_node()
>   xen/riscv: implement make_arch_nodes()
>   xen/riscv: introduce init interrupt controller operations
>   xen/riscv: implement make_intc_domU_node()
>   xen/riscv: introduce aia_init() and aia_usable()
>   xen/riscv: introduce per-vCPU IMSIC state
>   xen/riscv: introduce minimal virtual APLIC (vAPLIC) infrastructure
>   xen/riscv: introduce (de)initialization helpers for vINTC
>   xen/riscv: generate IMSIC DT node for guest domains
>   xen/riscv: create APLIC DT node for guest domains
>   xen/riscv: implement IRQ routing for device passthrough
>   xen/riscv: implement init_intc_phandle()
>   xen/riscv: initialize RCU, scheduler, and system domains in
>     start_xen()
>   xen/riscv: provide init_vuart()
>   xen/riscv: add initial dom0less infrastructure support

It is hard to tell how far into the series things could be committed without
committing patch 1 (which _still_, despite me pointing out the need, is
lacking an Arm ack). I'll be conservative and try solely patch 02.

(Also, btw, we're at v9 and you still didn't notice the typo in this cover
letter's subject.)

Jan

