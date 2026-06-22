Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78C8CD98F2
	for <xen-devel@archiver.kernel.org>; Mon, 22 Jun 2026 14:35:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1343813.1603033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbfje-0003ng-8Q; Mon, 22 Jun 2026 14:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343813.1603033; Mon, 22 Jun 2026 14:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbfje-0003nZ-4q; Mon, 22 Jun 2026 14:34:50 +0000
Received: by outflank-mailman (input) for mailman id 1343813;
 Mon, 22 Jun 2026 14:34:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wbfjd-0003nS-0x
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 14:34:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbfjb-006YyQ-OK
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 16:34:47 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a394802-2eae-0a2a0a5409dd-0a2a450a9f9c-14
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 16:34:47 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a394807-93a5-0a2a450a0019-d155dd35dd68-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 16:34:47 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-45ef779c1c2so3470017f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 07:34:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46666c57afasm27362703f8f.29.2026.06.22.07.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 07:34:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782138887; x=1782743687; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t69er4Z1TL8+YO7SQg3pvNktohCm7IBRsIaxOgqeMK8=;
        b=HJmtvUyNpx+vkdeYvgP4K6+qrURfj1F9s0WdsFyNuMZxx/qk8q7tWZwnpZ7Iw4Oyyj
         IjImq5Xogno+2JzJ7mPI0Z5yYoHxJvb2huM1RVL60Gx4iBbSmLdmwuGGwBvMaIkoc+Vw
         i5sh+8OqnYhLVH+TO1dain06hEXKBD7SwqPOy2qAY5kddAc/JCHp1WgBj20S13OI/8Tv
         unhDmZj8uFPc4ixWAztWlul/uMg1CnZw4CIyzIg44Gn6ECtAxqVRzJvl5e0fpfv5ALOh
         OWcPVpMfeKn7lgndclTaFR82q/gHG99XZ3fMAWyL+HApyxPP+wr0KbYebjyPXDOEAkLK
         t7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782138887; x=1782743687;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t69er4Z1TL8+YO7SQg3pvNktohCm7IBRsIaxOgqeMK8=;
        b=UfTQa/h6g94FfbinmxSfPRyvMcS6FalZnbHjV8iZoCi66jd9YwlmsuISOUpx/Kf6ZE
         iuK1YOgIz+YeTluWdctdP/M3V8XHMw7Y7aYnqINimT9g105MH1mK0wYSCDxilNqOFtTO
         8m3olRgPwCYMSsNvPOm5N5lY7u9w9Th8FAXVJ5+gGL9VBozULBvUYGjJAN6Lk9DaZMba
         fbuwHYTmipZPvpYLq/O8oH5PWXmFHwMKOySO1LCl6ST0+KOnuWKBcgtR1p9AuhF7wqyV
         lTaw8PV6OehbTo1zIxzsAX6cQ1W1vY1QJ3nX2ZZc5u6b7N5WX9nIC2QWJXnL5doF8djl
         vK2A==
X-Forwarded-Encrypted: i=1; AHgh+RoyHe5PoIzaqVJvcAHGW1jbwV8LV6liapHViB9kKdy2YEs9aTnE9i9boNlBxJGGeRCXF8olmleMk4A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwGn1mRTUGfGqRn3UgYzCFR34YAr8/DGXG0FU7MmU36XmghONh
	FRiicNjUsMn7jI66a1XjI0YuQbtDfkQAsa2u9hraFe9FRq7Cr/4IYwyGGS1ZLHExyg==
X-Gm-Gg: AfdE7clsZER8QXIoPRbA1lhaUeTAct+sVA++OQy8OUATxGmebSbESYT/sUpUuRiOgCr
	pTyvGTwr6dDGaK6p91CDJHWmRzeH0atUp2sokcEx3D4/AH5VGRtaKHC8UnpKHcLG6adpsaU0OjL
	Nblidn9oqJES3kwisYg/K5Uliho9BLopC8SRzGFKurx9sEh2MJnF62+a2QkQ5hDRi2SnWFbEyLS
	x2tufDGO8BVH0AAVznAuWQSZjjXe8URrTEONoUmzs+5RA6j/ftF1g25g+zjR4AKChRryrK6W+0i
	cglBBP3gok9VJVBrQ0erZmEDKDKXJOsyIaeitjUihOzxJqRWeMOs4yTRSGcwFiK7Y+Zi4/GzGlK
	XH5Woj05//RTm/t8m9R1xEXl5qowF/xfepZ29faDv6hbiWWtX6keEsWjfTrSvUkaz0qn/f0Kj0Q
	5ODSEqAhowjeMUfcZp7pUTxLv3/QMK4N3v03maPc8MQSsd0i2hmRLdkaOsPxp3nDhfwvHC4UzAx
	CNg
X-Received: by 2002:adf:e5d1:0:b0:441:1e8e:d8fd with SMTP id ffacd0b85a97d-465091bbb2fmr20475742f8f.29.1782138887067;
        Mon, 22 Jun 2026 07:34:47 -0700 (PDT)
Message-ID: <fe4e5c8b-eceb-460d-8727-790d7750e170@suse.com>
Date: Mon, 22 Jun 2026 16:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/23] xen/riscv: implement make_intc_domU_node()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <7b40037c2d0cce84f9e65d7c4a58ec773f7e49d0.1781693963.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7b40037c2d0cce84f9e65d7c4a58ec773f7e49d0.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1782138887-B01C6DB8-7244F107/10/73395122804
X-purgate-type: spam
X-purgate-size: 1258

On 17.06.2026 13:17, Oleksii Kurochko wrote:
> Introduce a RISC-V specific function to create an interrupt controller
> Device Tree node for DomU domains during dom0less build.
> 
> Add make_intc_domU_node() to the dom0less build path and wire it to
> a new generic helper, intc_make_domu_dt_node(), which delegates DT
> node creation to the active interrupt controller implementation via
> vintc_init_ops.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/riscv/intc.c
> +++ b/xen/arch/riscv/intc.c
> @@ -3,6 +3,7 @@
>  #include <xen/acpi.h>
>  #include <xen/bug.h>
>  #include <xen/device_tree.h>
> +#include <xen/fdt-kernel.h>
>  #include <xen/init.h>
>  #include <xen/irq.h>
>  #include <xen/lib.h>
> @@ -72,3 +73,10 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>      intc_set_irq_type(desc, desc->arch.type);
>      intc_set_irq_priority(desc, priority);
>  }
> +
> +int __init make_intc_domU_node(struct kernel_info *kinfo)
> +{
> +    struct vintc *vintc = kinfo->bd.d->arch.vintc;

... this also becoming pointer-to-const.

Jan

> +    return vintc->init_ops->make_domu_dt_node(kinfo);
> +}


