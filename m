Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13440C531D4
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 14:44:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369268.1618120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmuf1-0006qx-52; Thu, 23 Jul 2026 14:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369268.1618120; Thu, 23 Jul 2026 14:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmuf1-0006qq-24; Thu, 23 Jul 2026 14:44:31 +0000
Received: by outflank-mailman (input) for mailman id 1369268;
 Thu, 23 Jul 2026 14:44:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmuez-0006qk-VL
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 14:44:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmuey-00BSTo-Vz
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 16:44:29 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6228b9-5cb7-0a2a0a5109dd-0a2a4502e446-44
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 16:44:28 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6228cc-6ca4-0a2a45020019-d155dd34d8ac-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 16:44:28 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47f878135e0so458950f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 07:44:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c63678sm14792257f8f.29.2026.07.23.07.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 07:44:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1784817868; x=1785422668; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iU2vQ3LZhSYrdK8dH0cM7l6dQ5LgVRLh6Aarzr4LeAc=;
        b=VG02npxSit+I6fnXqpa3Ib+35ucE74Wfk3TZCWrjqMZHXIyqHCJ075pHTC+nX9/I3y
         ujh4KRJXJtM0shf5Iy3o+FU48/AAYWjaZkibCpMIZCTGDSMHeKZnRqvwKT0C5JHBRjVo
         85zb4ccY2bq/uFVemtbBv0mPZNCZ/YAW1ArbLylp9KkO6BFy/cvAHvU/bmihtb4Hskus
         1Q/M9RScHSW3SnM76LkqjlZCutEouB9j2Cr8UZLUzywP+kQ8kvgKE9A9eaAJE/nilJnG
         QlxvqBfHUD5bc+K8exOKHKOCCcglsPYFKzHMY8/sCCM0V5SFaesugBbZirNpi1nltbIP
         PpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784817868; x=1785422668;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iU2vQ3LZhSYrdK8dH0cM7l6dQ5LgVRLh6Aarzr4LeAc=;
        b=r2S5tazgmGRxfLabteSRLNx0SkKEhPRNnWCC5lRqHB54t8YCIKmaX2nqub2MX8TUML
         pfrRw1Et/gpD/8uOFMT9L3CYVbj2YPXhB2U+K8PAeau7UJD5Cd98yArUB/t7h2N8EADF
         ysapZpbYMACkQTwVoAUfV5MTXBmCG9/SgZiUcYn7Bs3Z4NHWIBwtCkp8XsrCUle7XWjO
         KUb/ILf1/BemQV68IFc8suoLhNyiRi1wGERVh9XFdOe861fMlRTnH3yPd/gL2yQ/ps6L
         PsDUZRn7eNhFGn2aODjEzv3WvUrFkOXmKND4cvjClyrHGiIOcB2iyv5B9UO4uAafBKuN
         hqGA==
X-Forwarded-Encrypted: i=1; AHgh+RqtZhg6v/GeFlu0z8Yd5pwoId7Ye7cQ5O0IEkXyZel/8nQFgihHfMHZllv+qa/qGNiq6C9uL9L978I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMKNS2xQMEeGRsfQKZ62gLqNrnjLy5l9q8se0L2c+P4PMSJv6W
	4BPjNekpFuQRHbpNpvG2BvDKm7O7PaRp6VnFeqab6PtNmrUrwb6BRt7cEsGJ2U0AQQ==
X-Gm-Gg: AR+sD126EMLKAgEIGSx5YT11BN+u0YLq5RlBlermO5TQOMTo0EumBR6GYmixYqQ3wHB
	t4BhAG5vXdEF4R/MGl2wwQ4Z2Whs886ru/Z/2skdQ9ytzO91ZebNGFc5mQMc15BD2muVDNwuctX
	n+MJ82jkDOYQ6FNPAuLTCzaVKQHsCmybZSieM3C7/ezRQBFBVxIVDMRYInyG9Q6fQYsHPak42Zr
	buczSoKUQjwfhztfTjvBg+G2E5lqVY0/4ptQOG59IJvdgysjN+yU4LaucqvA9N3+UR1UVn9tjvx
	pi5vtlR1Dk+HqQGLymjl55FKbbWwrA5EnCZAaLmCWeWIeX6wSu+9yNQm/uwxxLv+vj4cWroHlJF
	N/zkj14+M5OJkc647vwX3qUPYzkHBU8hpnbOJxhpA4XXU9SKCtI116SXlgxQdi0XxL0QGg9n4up
	MazE3YQHnZpSWuKKupF9EOqMzgAwWQJdOCGFO7qJ3AjD3VeotC13mXtIyAp/N8wM7uUNodH5GyH
	/46
X-Received: by 2002:a05:6000:2687:b0:47e:8e7a:90a0 with SMTP id ffacd0b85a97d-47f8dcaefebmr4542489f8f.52.1784817868173;
        Thu, 23 Jul 2026 07:44:28 -0700 (PDT)
Message-ID: <0255d2bf-748e-444b-8c09-f69925ec88c4@suse.com>
Date: Thu, 23 Jul 2026 16:44:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] vpci: move BAR mapping permissions checks
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20260708210233.922275-1-stewart.hildebrand@amd.com>
 <20260708210233.922275-2-stewart.hildebrand@amd.com>
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
In-Reply-To: <20260708210233.922275-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1784817868-66AB52AC-F90D51DE/0/0
X-purgate-type: clean
X-purgate-size: 2454

On 08.07.2026 23:02, Stewart Hildebrand wrote:
> There's no need to defer the permissions checks. Perform them right away
> in modify_bars().
> 
> As a result of the move, the permissions checks will now cover the whole
> BAR before any holes are removed.

Is this a good idea though? A really good toolstack would avoid granting
access to e.g. the MSI-X table.

> Carry over the domain_crash() in the error path for domUs.

I don't think this is warranted.

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -58,24 +58,6 @@ static int cf_check map_range(
>           * offset of the current address from the BAR start.
>           */
>          unsigned long map_mfn = start_mfn + s - start_gfn;
> -        unsigned long m_end = map_mfn + size - 1;
> -
> -        if ( !iomem_access_permitted(map->d, map_mfn, m_end) )
> -        {
> -            printk(XENLOG_G_WARNING
> -                   "%pd denied access to MMIO range [%#lx, %#lx]\n",
> -                   map->d, map_mfn, m_end);
> -            return -EPERM;
> -        }
> -
> -        rc = xsm_iomem_mapping_vpci(XSM_HOOK, map->d, map_mfn, m_end, map->map);
> -        if ( rc )
> -        {
> -            printk(XENLOG_G_WARNING
> -                   "%pd XSM denied access to MMIO range [%#lx, %#lx]: %d\n",
> -                   map->d, map_mfn, m_end, rc);

I realize you literally only take what's here, but ...

> @@ -369,6 +351,28 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              return -EINVAL;
>          }
>  
> +        if ( !iomem_access_permitted(pdev->domain, start, end) )
> +        {
> +            printk(XENLOG_G_WARNING
> +                   "%pd denied access to MMIO range [%#lx, %#lx]\n",
> +                   pdev->domain, start, end);
> +            if ( !is_hardware_domain(pdev->domain) )
> +                domain_crash(pdev->domain);
> +            return -EPERM;
> +        }
> +
> +        rc = xsm_iomem_mapping_vpci(XSM_HOOK, pdev->domain, start, end,
> +                                    !!(cmd & PCI_COMMAND_MEMORY));
> +        if ( rc )
> +        {
> +            printk(XENLOG_G_WARNING
> +                   "%pd XSM denied access to MMIO range [%#lx, %#lx]: %d\n",
> +                   pdev->domain, start, end, rc);

... is the logging of rc actually useful? Afaict it's only ever going to be
-EPERM.

Jan

