Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9E4C4450A
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 12:37:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363981.1615377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkLLE-0004qV-20; Thu, 16 Jul 2026 12:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363981.1615377; Thu, 16 Jul 2026 12:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkLLD-0004qO-VW; Thu, 16 Jul 2026 12:37:27 +0000
Received: by outflank-mailman (input) for mailman id 1363981;
 Thu, 16 Jul 2026 12:37:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wkLLC-0004qI-VR
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 12:37:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkLLC-00HIyl-CH
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 14:37:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58d078-bab6-0a2a0a5309dd-0a2a45058a82-42
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 14:37:26 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58d086-4cb1-0a2a45050019-d1558030d0de-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 14:37:26 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49546c690ffso684015e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 05:37:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49541ebe485sm52231875e9.14.2026.07.16.05.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 05:37:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1784205446; x=1784810246; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IrdG6Ig7zuqlgnxdtA/QevxhSFr0NlbEin9CqGi0gl4=;
        b=JTxemcaKChq49PJ621lMpCFGVp2pAtO7kTQb2jXSsHZA3l6hbqK8Z/nqga0J0BjyRG
         uzGGW4L7WsK2DCdBjj020rzGLMd3ZUkRtBt8335D567etACZhzHzMhYd8BhGDDMZ3WxS
         yRw8mCf4+DpVXJZLBWcH2TE7ijPTXTGYX2m8xfa+6gyheEDPF6aAIR8oBWPre+CdCfNX
         Nv4r2nq11LxjsPpmueu2UFDvA8vVNkwv0602Wyi5o+++lFsLaaqwDYnjSVI1+ofSYkBD
         uNRlhepnviNJUPjiTFya/VmxRvCyxuTLDjyjcIdRcetL+HkKG1TfMIk/AH3OW/yFa33c
         O09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205446; x=1784810246;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrdG6Ig7zuqlgnxdtA/QevxhSFr0NlbEin9CqGi0gl4=;
        b=VanhOXkKGcyobWsECnljFaPN/XPUzrIWrAgHo0/yQcefzwqmIW1p4Oa3j9G11X4bYZ
         nyWa5bxEuKRnHQWd7U1j3CA1GAMwVO/izb2JjDqXHUcG/0PM3ryZ4JSQ7eKOAQZeMeRp
         tMXm95eHsKCb7QjnaCx7S02yMrufMUu6AFWXZ5MYzVD2SgGRgthHUfBnBxHHDxiQBpIw
         6vP4nW2URxYx+U5ySHMrCAV2GS/Qj1V7+hGpAALPcvj5uMBECPp7eRC7iMyyWVE+qJO+
         oRr8bjzIiMp6Z32u4FZd6O5WTbAtA7dQL+fR5yXcJtPTaqJoz0kTNRO/uMF5kXJbj+3i
         sXFA==
X-Forwarded-Encrypted: i=1; AHgh+RrawlOFRTQ+rJmOKwkWDhBRdDfGgq0/bhFY+fntrDapzopLA+7+4FmWBeJ2JqkeV9+mT5OPW8VE3mU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaPhheGXxmSCxstk/5lKlfSMt8jm0DXk6dUwJIn4gFaaq3Hi9q
	KNJMxoKQW5TUANloEC52DEdaNf9i2PhBgdVwKUzVRJo2yNkGz52skJiu0zXM37TyoQ==
X-Gm-Gg: AfdE7cn/m+wWh8bV8km+zSM/yQMXdPUh7VSWg/M+1+G4ko8R6P0YZVZMO+ZB9UhJdjV
	sbKWi6pCP1Rs84GwJLZ033eDjiKx7peocUAjE4JPq9IQ51JZFyge0hG43QSrzTEsU3PuHgLIOgW
	aVXtnfbL74I8V4eiBrdix2iwzWk6VS1+/Q6Ncf4czi+Es+zuwuYRt9H54ClPdoYJDhkxBdkQzPP
	ixAlKUbAZ5Oz/dhBIfCKFB4rMJiEHb5dn1sQZVKo4Z2SwtzfCt7d7+1ceDA9rLdfBwrTG2XyUia
	x04jZVikMlXyceUq/+j9JrgXNBjluD4AydvjMGGiUB54VUR6ncnE0ScirgvO4E1qhROTeoq1GFc
	Eba1Njsr4HOWZK1XpAsEuI22cXbXqmcLx1uVVHC3MYK3GqfRMLxyvp4o2QsZSRu8hRW/mhIsfTx
	qF1CgVI6k6tKq8NfVISAQlcJroZsHLPRhqMiDMO11eXXdZrfnl2kPF2ClIpvxDA7ourC7oEkNJm
	Gmr
X-Received: by 2002:a05:600c:628b:b0:495:3da0:3f52 with SMTP id 5b1f17b1804b1-4953da04055mr75878215e9.19.1784205445728;
        Thu, 16 Jul 2026 05:37:25 -0700 (PDT)
Message-ID: <15038e5f-588e-4c60-986d-0141bb9d4dce@suse.com>
Date: Thu, 16 Jul 2026 14:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 25/26] xen/riscv: add initial dom0less infrastructure
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
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <8fdb9cb4579e20dec10a9919fa966bc00394c6e7.1783331040.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8fdb9cb4579e20dec10a9919fa966bc00394c6e7.1783331040.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1784205446-72EB12A1-E3D7C089/10/73395122804
X-purgate-type: spam
X-purgate-size: 1554

On 06.07.2026 17:58, Oleksii Kurochko wrote:
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

Acked-by: Jan Beulich <jbeulich@suse.com>


