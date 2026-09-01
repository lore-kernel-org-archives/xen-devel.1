Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FDDC624D3
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 15:59:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404831.1638499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1QtL-0004Gh-5R; Tue, 01 Sep 2026 15:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404831.1638499; Tue, 01 Sep 2026 15:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1QtL-0004Ga-1k; Tue, 01 Sep 2026 15:59:19 +0000
Received: by outflank-mailman (input) for mailman id 1404831;
 Tue, 01 Sep 2026 15:59:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1QtJ-0004GU-Tr
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 15:59:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1QtI-00Dni4-NK
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 17:59:16 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a96f651-8faa-0a2a0a5109dd-0a2a45058b96-6
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 17:59:16 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a96f654-4cb1-0a2a45050019-d155802ae81a-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 17:59:16 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49b8be0409fso8858275e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 08:59:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ccea87e1asm203555295e9.2.2026.09.01.08.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 08:59:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1788278356; x=1788883156; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FTKcWvsg9ZmRsPfEQDE1JeKRUJhC6t8MmFGG+2Q1b4=;
        b=bo620GCgL32087doVw4Ot3goiCKdEwwuxdDjFZotjQ3zz8c8mcJ1hQjZno6jKuevhD
         H4V3aNTbArWnX0imlkK5eF5Xf4i8YUi1ZcY1aGVpHE6NaQkTREQBbYs0N7bDsrTXbUlR
         VybINiWLS7gWiHpu2vQZ570Sb0aO9CP9w8SJeIjxBG1qwEjTrYEqcU0WcSSmVIrrO64s
         9uBSMQa4kBi2aUSs1Bm0YJuHJGWYZzSbxKmswNOFFKqYIzGZITqolkEGuhs+UwrkqCI2
         aQwyU4HKDSQ0FZza+h0QbVgkJ0VLTjIYvYy3xYV9G1yVq6KAJ4zDRv9TN/8H4O/OgYPX
         cizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278356; x=1788883156;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FTKcWvsg9ZmRsPfEQDE1JeKRUJhC6t8MmFGG+2Q1b4=;
        b=PTdjDyaIeJ1fRHGZf4WVJtBgttLNfeK5LNW5GrQIU/onuF5/r2S1eDf+z4yhhf6KWL
         kPV6V7Qf0qrmoTkNzbXo26FxRWZqrTM507cc9aqp7i2CHWohJZwPgzj1ZRYNaXt3eaON
         6pxLik7oDD97bme1505GW63BZlFpnJOgUj6HiLMP5qDuHiR86mpRcSJD1MtyW8SXbXJ4
         qFXg0flZ7pQ2+uZFhyBIHXYvP7bt4yJ0+UpedDSQ2yzobrr9QXpAcb54OA8IUpYO/C7Y
         mpAnU39uU8g/acQU7/CI/sUQ3TP8j6aEPvZELK3BmiX1hZr0v5zjqekEpEg5JWJSus15
         A6IQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqu90SBq79GaZwUYai++L76KtgMUe0VSkD81Ss0/O6sje/W/5FsiVctuX6RR8U+Eizg2T4mHl0/TQQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++ljRqjoJbo3yz7PoOMdi3qRtvY66iTDHqSPxYS2DddlK4p7bKAT
	aPG9MVpCaSFGUvrcMpP4cvUtzzEbNMp6mz1o+gMwtt8VEWjXS2YUKUNyB/P8o3Ngkg==
X-Gm-Gg: AR+sD13xnuFEMa3qBogvmQPmOvblJNpzgbCh1+QJV6E7AQWKCLgHvgCTurRyjv2swWV
	VVMvZq3lHdK+82X89KMGFAuxbI4hKCQyUbFLoTjab+scXeYwyHpLmcdtFo3hFm2IOK3mGrXhVFA
	kjQfKiWfEo7eOraik/hA/cBwVXOxE1MjjhAEYjYy2/lCbs2BfY+9nmuorpeSEymRfWzjo1n0pVP
	ktIaxi+VCzXmlO8pwXwQG0oPRpCYhOz2VHsOG4Yb7hzNgrR6LQzpXQnuErMNf9UoFuYFo+Vk+Py
	9S0FeSLkGtdz8YZdy6ud2DNGKARtZobQT47/utCtYEQwtm9TF1sR0fqDGfTYJ1pq5QP8quzmT0Q
	0hcsqPHaWYY3TPzSArSAl5iy6Ec0k0D2VLC0vHkVv5/4yZGovRMXqM3NmL3RZDrIiErAWxQk9Vo
	s9fG9PRrPOnjMfYMJq83nVOjpudq5SoR9jUeugFycu3LpKqSwyQisWtpAOkGvNQKGCRcXqJykvf
	NbMYJPSqQxnbe+LytjX+54bOXRdH+hEXRjT1DO2gH1bubLPn1Ar
X-Received: by 2002:a05:600c:6088:b0:49b:2796:be30 with SMTP id 5b1f17b1804b1-49b91c433a4mr570456425e9.11.1788278356026;
        Tue, 01 Sep 2026 08:59:16 -0700 (PDT)
Message-ID: <45fc41c1-7127-4e70-ba81-2a85d1bc7655@suse.com>
Date: Tue, 1 Sep 2026 17:59:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: fix out-of-range indexing of the IMSIC per-CPU
 MSI array
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260901155023.116381-1-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20260901155023.116381-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1788278356-24F1F2A1-74F571FB/0/0
X-purgate-type: clean
X-purgate-size: 672

On 01.09.2026 17:50, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -326,6 +326,8 @@ int __init imsic_init(const struct dt_device_node *node)
>      unsigned int nr_parent_irqs, index, nr_handlers = 0;
>      paddr_t base_addr;
>      unsigned int nr_mmios;
> +    /* imsic_cfg.msi[] is indexed by Xen CPU id, so size it accordingly. */
> +    unsigned int nr_msi = num_possible_cpus();

The possible-CPUs-map may be sparse, so num_possible_cpus() may still yield
too small a value to use here. The thing to use likely is nr_cpu_ids. I notice
that variable is entirely unused so far by arch/riscv/*, though.

Jan

