Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AF4C44529
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 07:28:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367488.1617230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm4tS-0007E6-Lk; Tue, 21 Jul 2026 07:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367488.1617230; Tue, 21 Jul 2026 07:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm4tS-0007Dz-J8; Tue, 21 Jul 2026 07:27:58 +0000
Received: by outflank-mailman (input) for mailman id 1367488;
 Tue, 21 Jul 2026 07:27:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wm4tR-0007Dt-LR
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 07:27:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm4tQ-00BeQx-Rw
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 09:27:56 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f1f6c-5cb7-0a2a0a5109dd-0a2a45088a0a-40
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:27:56 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f1f7c-f659-0a2a45080019-d155dd2dd96e-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:27:56 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47f71156e1aso1116539f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 00:27:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e496ffsm35793187f8f.3.2026.07.21.00.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 00:27:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1784618876; x=1785223676; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+f3FANgQfJ7d2F0s5WKsOk0oaX5xJlsAyxOE1wB6sA=;
        b=bd4BJfAyAB0bw0TOb8JXTxmDd5v7l+tVfwfOVlsXF6YuzXYAjATANhtoSHX5QgquLp
         RgYYJnci0Mxzxhv4ZPnrIFG6LL/CwNGE++ZC5Tr5Vy5FuDjwpTTHlSoxWpiJIcWxcy1B
         jtYrJ76LhYtZ7bxjWofOfK7GsGXpcQiZHn+DdI0c/TNJnYEZJpPdY3bFeXuhSz3hBXtk
         8RU1IqNw5irViigMc5ABNkooM8dVwI8GkfyYN6Cmfv2fOMvRfP4Vaq4Jhya0lb9+FrEy
         wXneyL7B5VHypbNPYQUGGkulm5coZ3M9ABXIYWZbv+tMkaX24Nab9AgfeA4rVDT8gsMl
         9lgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784618876; x=1785223676;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+f3FANgQfJ7d2F0s5WKsOk0oaX5xJlsAyxOE1wB6sA=;
        b=cB7EfRj1EZNOv3FC959BQ69IHODQ2maQLOX++je3Lab7RGMSeUYay3CQ057vjYZDAF
         brDyMwrmhwzAK3xwjGLbS5xuwXWvifl5zliqGVJRWVrxXSjMUSw0SaM3vErjUU0b1iQr
         T4C4foi1vamN3BPJH4CP6XUIQuLxBLs9bUREjqSw9QDkcA/cYXK9+romr06DkwlJqPuv
         KeVMJRfnFBCVdjPutOrWw2bcP/KGZ4FQYUwhK/Vouj1544qbJzP3FvruG0+JHdQECVyh
         hKmC2aMMiUX2AdmmW7AvW3Twq2SzXVOKpJsTyBCJvz1WI+iJjGnEMprkmW2iilU0sIjI
         k65A==
X-Forwarded-Encrypted: i=1; AHgh+RqbX/8aIeBL2ZKIDJkNjV5SmdR0nnlsuVWXz9HKsR95YRDQ2c7hghqpuWDC31jq8gKQr6cJrC/bMMI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxw3e0F7Ia0NhBdXhor83SU3Wk9VASk+eMDXyJYO0npxy5iIDy9
	fdYWOr0N4Ea3JDCNUG7hYF5rKdvCYu6vqNmvluZT25QX2nvLqL75CDIjjW8wgbzmHg==
X-Gm-Gg: AR+sD10VqYO14yuHFVpTfQec6xjcBwkyBJZTB/PZCbZ5vFda87D0uTXo+ggL1H0cSR2
	cMmiJ4+nOHGA9R4g9fEiQ5NgeWWm0SNewBYcoe0dVy1njwe7miDic4WehwFAT3xqYxUTRXirBa0
	tCfOtmliSnlvPAOdqLe5I3a5Lq81zHHufXsQCeYxu6w3vwsDIHQR1FBQFath7sTToMtSXULw7vy
	pKFzPLw70dAv9IJUGNmAQz5OnUVuAf6b+gyBfGXqXdZWrsacv2I95SrYAVktas1nCZVQNuWK/Vc
	teodC1rq+WWkqnYNc4MJOfVjuwY9PIpmDulVesmn87B9rTozSaGynBGsq10OIipHKuMuDEzMrn2
	NN4oC1lhk3oXpY7QUE2L6Vewx3IAy8BLvfjyPgmXt/CW85OpA9UGBztZcsvBZ5MLwptAg2Edv9o
	VDuge1KQkvWI0Lk6PjFq3mNtj56p0UFUx1IBfttEhg1o+OiGd7o2S2LBobyiaCzSaWq6ADUjURB
	yuP
X-Received: by 2002:a05:6000:41c2:b0:475:f100:360c with SMTP id ffacd0b85a97d-47f6234003dmr20098235f8f.59.1784618876153;
        Tue, 21 Jul 2026 00:27:56 -0700 (PDT)
Message-ID: <eab4a7b4-7e4b-4d29-a6e7-33390d587cee@suse.com>
Date: Tue, 21 Jul 2026 09:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 22/23] xen/riscv: add initial dom0less infrastructure
 support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
 <0b381795a3a7c2d09088c1fae59d3a19099069c2.1784559209.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0b381795a3a7c2d09088c1fae59d3a19099069c2.1784559209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1784618876-CE54487B-DE548BBC/10/73395122804
X-purgate-type: spam
X-purgate-size: 1649

On 20.07.2026 18:00, Oleksii Kurochko wrote:
> Enable dom0less support for RISC-V by selecting HAS_DOM0LESS and
> providing the minimal architecture hooks required by the common
> dom0less infrastructure.
> 
> Add stub implementations for architecture-specific helpers used when
> building domains from the device tree. These allow the generic
> dom0less code to build and let a basic DomU be constructed on RISC-V.
> construct_hwdom() and make_hypervisor_node() are still stubs returning
> an error: Dom0/hwdom construction isn't supported yet, and the
> hypervisor node generation (needed by domains with
> DOM0LESS_ENHANCED_NO_XS set) is not implemented. Both are marked with
> a TODO and are not reached by the currently supported configurations.
> 
> Provide missing helpers and definitions required by the domain
> construction code, including domain bitness helpers and the
> p2m_set_allocation() prototype.
> 
> Additionally define the guest magic memory region (GUEST_MAGIC_BASE /
> GUEST_MAGIC_SIZE) in asm/guest-layout.h. The base is arbitrary; the
> only constraint is that the region must not overlap guest RAM or the
> emulated device regions. It is placed in the unused gap below
> GUEST_RAM0_BASE (0x80000000); the constraints are documented next to
> the #define-s.
> 
> A separate region for grant tables will be introduced at the same time as
> the introduction of the grant table for RISC-V.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v6:
>  - Acked-by: Jan Beulich <jbeulich@suse.com>.

Except that once you again you didn't really add the tag.

Jan

