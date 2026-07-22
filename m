Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2924C4452D
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 07:43:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368183.1617668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmRbg-0003ec-3Y; Wed, 22 Jul 2026 07:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368183.1617668; Wed, 22 Jul 2026 07:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmRbf-0003eV-WD; Wed, 22 Jul 2026 07:43:08 +0000
Received: by outflank-mailman (input) for mailman id 1368183;
 Wed, 22 Jul 2026 07:43:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wmRbe-0003eP-Uz
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 07:43:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmRbe-00FO5x-4u
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 09:43:06 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a607483-e002-0a2a0a5209dd-0a2a4508b94a-16
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 09:43:06 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a607489-f659-0a2a45080019-d1558029cdf2-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 09:43:06 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-493f75f7172so94755525e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 00:43:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956b5c2108sm60384735e9.2.2026.07.22.00.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2026 00:43:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1784706185; x=1785310985; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+i4quTu+VWE9KVRaSLNUD8FGgjagUdRi+DlG+X/VefU=;
        b=Q8eSFqczBmibP4ZhpZYjD7G0y/54jWV3chvqVntYn7mvDn12acpl9w1L6/ctQDN7+v
         9UP9Oz93ZNA2S4UTpwtWwTYfWGXfZjMHmFa/JozRD9IQMH/XwxCUAnFl1zHNRldB22X8
         xUHk9LjM6b8MgzQ5hN+z8CA+3cNoUOXrTTziH9+eAtel03ktrFHiErtPh5EOVLsfNdKc
         XHTbeltWGqOG4LzSfBJN22Ln3YDCWZ7bxz4PF8MuXsA5UD6vzkH4fClYoSkDFiYlZiZe
         ccC+N/58HuhLy3EpbneJEcgfCWN6E7GWCMOc/3eBDyi6qHVn/uCPN4SYyK1gmdiu5/Wc
         Fk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784706185; x=1785310985;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+i4quTu+VWE9KVRaSLNUD8FGgjagUdRi+DlG+X/VefU=;
        b=SYqWnHYXcNnzL9gWgscMLkYZKfCXN+Be9yxD+JlDaNlTuJIktIpOyClSToeDdHqyIk
         I9y5vSo+viwHb7LNZXz2qkuNBwPOh3JTjX8Nuy+w+KlKBxAbH8VMwsVJLK+M8s3ATDQa
         68RXFFw4e5XVp3Jen6wNM0c7XTohE91T7GYnCYnIC3FILp+8V3j7K7k85U/Cda/EIWc6
         IRq3gO8HMzSe+oU+w82vKSbkcjLHq3zvvkjrYFkkYL5gjtgbE/egT5HZ78DAawl8Eyyk
         FVYZIVYYvFij033LmD1JF2SIhCoyPeQzH7JMa+G6zvdmKc7AZrg7gkEn8o9i3PAZap7q
         oaAA==
X-Forwarded-Encrypted: i=1; AHgh+RrIAZf/LcFyrB8wBFSgSd2AAsAh1WUaOMkH1uoc0vmnnhpCiSWd5zrmGMUTDlmW43arQuLOKXKeFgs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQ/4PbuL5npVAiRVj8Ijj8SBxV0rQHx8UR1CwY8So5smdmMxZB
	YNLeJPTFHakVA4rU0WIM5EofvnP4fG/hGZV0O6FHy4hhjDSYSDZbrT9v8iuTGuIQfA==
X-Gm-Gg: AR+sD12PikkL6IBu9ueKeDxkrLRlQBzqGKlY0xsS/AHgaUySE917rsiVPCYG/B64uTs
	L4nlhABJVP/PKbXwz5JDo1ZHkm2NMcqrYoAGaCBsEq1MEolMknyFZGgUePCS2YniZVI/IKr/XYS
	s983c1Mv7nZrhZCSlCVmbPWr7slZT6dfCRzjn/n1UzYIPFKDXnteeK5RVPyg+C1CjM4hMv7JJvF
	xDe0OAfCqU4Br56Bpi/qXr0UBygGZa0lXYh9+BH5K9Zp6pXb2bnl28jm9gVyTA/KarGYon1EUPF
	qz9GGtAINhEXDx4HoqlUKwKEB5hJhmvtVhttQ7CdxmB9eAwFF0+L1kKgukiUx++rlvK8Ys1yfkX
	shwJ5zBxOJ+FE8+rgojm0tTMGPnepivi4anjbSZt4ohkstKtfAjwodSam0oXUlXTy3898IfVpgN
	S0dc9boJoCci8cnSj70a+/PN8eV9cIrN/+ncsXDcoh3ctHtn2IlZzTikEesXDgd1ehrw==
X-Received: by 2002:a05:600c:8b16:b0:495:69eb:27fe with SMTP id 5b1f17b1804b1-49569eb28a0mr43797205e9.11.1784706185516;
        Wed, 22 Jul 2026 00:43:05 -0700 (PDT)
Message-ID: <681f259c-9b64-4240-8d97-8771da6eea41@suse.com>
Date: Wed, 22 Jul 2026 09:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/23] xen/riscv: generate IMSIC DT node for guest
 domains
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
 <332481b9d8e17126a1ca9b52c6e7f0fefb34ca1b.1784559209.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <332481b9d8e17126a1ca9b52c6e7f0fefb34ca1b.1784559209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1784706186-CF55C87B-4221A894/10/73395122804
X-purgate-type: spam
X-purgate-size: 911

On 20.07.2026 17:59, Oleksii Kurochko wrote:
> Guests using the IMSIC interrupt controller require a corresponding
> Device Tree description.
> 
> Add support for generating an IMSIC node when building the guest DT.
> This allows guests to discover and use the IMSIC interrupt controller.
> 
> The value choosen for GUEST_IMSIC_S_BASE is an address which is typically
> used for IMSIC and QEMU.
> 
> DT-building functions are marked __init because domain creation happens at
> boot time, before the init sections are freed. In a typical deployment
> libxl creates the interrupt controller node in userspace and hands the
> complete FDT to Xen, so these functions are only called during early
> domain construction.
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


