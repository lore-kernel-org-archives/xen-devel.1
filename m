Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED1AC5AC7A
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2026 06:23:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385762.1628159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsDyi-0006NO-4x; Fri, 07 Aug 2026 06:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385762.1628159; Fri, 07 Aug 2026 06:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsDyi-0006NH-1s; Fri, 07 Aug 2026 06:22:48 +0000
Received: by outflank-mailman (input) for mailman id 1385762;
 Fri, 07 Aug 2026 06:22:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wsDyh-0006N9-3p
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 06:22:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wsDyg-009zRA-CJ
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 08:22:46 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7579ad-e002-0a2a0a5209dd-0a2a4506a050-6
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 08:22:46 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7579b6-195a-0a2a45060019-d1558031d130-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 08:22:46 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4995b0343c1so6166875e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 23:22:46 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:300d:c60:b520:be19:f863?
 (p200300cab70d300d0c60b520be19f863.dip0.t-ipconnect.de.
 [2003:ca:b70d:300d:c60:b520:be19:f863])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995ea2d84csm7397145e9.12.2026.08.06.23.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 23:22:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1786083766; x=1786688566; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Mju8ec2JsULKhgYsZxe4dHqgEj7FEBGGh4W6raF2x0=;
        b=aFb6OKuPHp38Vnm3K/ztincFsJ6AnlKzVeGrBp+CZQZYrCmpTPevw5/GmPOv9RqDIf
         z6Pzv8WfiawoaTA2EdNMa7S5mfgSmseVKl9uIFgPi69K6Tz0iaVveG6ks4HrY+YqD5hT
         ynFrcnzIFgIS/YMwAhca2W8WFHnrlLeYTsBCNRAlXmsTkQWWckzFscOQ+GyABqWgEpXS
         C3UueuYuGf30jnCilqdt8wQFV9YMRQxAngLFDLSBjCN6zNItILpB26/8CAyOjtJlrkYa
         uGII/8Va0+fhDs5YVr+8bNK8DDVhMI9ItAG8e4OH0yBaedxX95H0Lr5T/lXRRySwvIDD
         aBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786083766; x=1786688566;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Mju8ec2JsULKhgYsZxe4dHqgEj7FEBGGh4W6raF2x0=;
        b=l1FF8xIXuJP1P9ZumO1d2znM4LAgAZJRqMp5+GN5hHuaC8bqrBf61mYDJUWSU/drvm
         9UIFaZByt8uPk0MXIDiVvv4nNHI234XEBpotReJhygZP7c5/xERbUyrXr5shmRmCnGB8
         TChYGpCos4/4Ep0C8eOqMRjrZ7qrgqSveii+kVFJwWKWOiEOQFXIKu54DQdPLnlYkImH
         BfpacMfoId2cMOHYT/G3Jhn8NZjDG4cOCiCWbpJe/Zu06jKYb84LSrIttzHZl3mKokZF
         Zaitrc4kx77Wv7hELmjh8fPTyHaCiFEfnthQJ95u5nEP7JvGGauRy3bifnUKI6OfGlA5
         jLLg==
X-Forwarded-Encrypted: i=1; AHgh+Rqo3PhH0J+UhsQWAVINLkUafapKkyKMHsUFdd7NjkPXRHSW6yNjCKVfGrtT3adgurEeT/aMCNRLayo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYwYslfZEmzuHVWS2fS/HJzDTR1KAV/pi4/XioElbdaqr0xOkQ
	03Teydyz6iCG1WoR5zIQBhTVHf0slDpJKJnYb0pWb26gERPatcyGvKVBiAIv74S97NVi4onP1fN
	LeYQ=
X-Gm-Gg: AR+sD11vFDdVezDIwOCN3IiWDFpFZWwjs8XeX+t4SCILtmtU0JLYoQHthzCXTDhIyjp
	E9Uxc5uxPGiu5LzdOUSifhslLNeDpxDMiEU6veuvhBQReOk4phpcmziKeW4u+pdGUG7Knn+e11E
	LTqzII2Np4XPIyeXZStPVTNinQydx2fZHfohxXQQ59oqbyjzDEF0840rpYW/L2oE1wD/16TK2T/
	LEAco4BO3+1AyVhSqsJ/MKqaqg5wHmFGl+DNxwLg/mK+MtHHkLf9IlLUd4bcl+ado8pqYq/tNz+
	71Lfz+/qVIKzbtmAvO7YNvBBTs6+5J7VVWkvasEfi0D37SHdloJDI5HPOsfxTeFgOIHJcVvOGFN
	cCZ6z50sbjk/HVewjFC+/b2io4pWC088ATGqPEJ79jRXYJpMO/O8b2aSKN+TlMjOzikX9zR1DRq
	8iuIzqHS/JERaX29J2DF0U5HeFbSXjWBOptktT8HFDqxEAsITQ0qnXAmma2efQ+MRrIj0dH6Lsf
	2+8vfbOgVQ8T0Qvf/9mdAKEGqNihxBiJisWZj4LxyFs4wXZz7emkgYsAi5nwtHegnlZHtC37Fs4
	Hk2dV468UmyvVcvY3L8=
X-Received: by 2002:a05:600c:198f:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-4994e7cc5a4mr272904255e9.15.1786083765693;
        Thu, 06 Aug 2026 23:22:45 -0700 (PDT)
Message-ID: <c818745e-6f61-4b32-b7f5-ee5b7ff82981@suse.com>
Date: Fri, 7 Aug 2026 08:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/pci: prevent cross-device accesses in
 pci_mmcfg_{read,write}()
To: Roger Pau Monne <roger@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260806152619.23881-1-roger@xenproject.org>
 <20260806152619.23881-2-roger@xenproject.org>
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
In-Reply-To: <20260806152619.23881-2-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1786083766-FD20877B-0B928D98/0/0
X-purgate-type: clean
X-purgate-size: 1528

On 06.08.2026 17:26, Roger Pau Monne wrote:
> Introduce a specific check that prevents an accesses from spilling across
> two devices.
> 
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with a remark:

> --- a/xen/arch/x86/x86_64/mmconfig_64.c
> +++ b/xen/arch/x86/x86_64/mmconfig_64.c
> @@ -61,7 +61,8 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
>      char __iomem *addr;
>  
>      /* Why do we have this when nobody checks it. How about a BUG()!? -AK */
> -    if (unlikely((bus > 255) || (devfn > 255) || (reg > 4095))) {
> +    if (unlikely((bus > 255) || (devfn > 255) ||
> +                 (reg + len > PCI_CFG_SPACE_EXP_SIZE))) {
>  err:        *value = -1;
>          return -EINVAL;
>      }
> @@ -91,7 +92,8 @@ int pci_mmcfg_write(unsigned int seg, unsigned int bus,
>      char __iomem *addr;
>  
>      /* Why do we have this when nobody checks it. How about a BUG()!? -AK */
> -    if (unlikely((bus > 255) || (devfn > 255) || (reg > 4095)))
> +    if (unlikely((bus > 255) || (devfn > 255) ||
> +                 (reg + len > PCI_CFG_SPACE_EXP_SIZE)))
>          return -EINVAL;
>  
>      addr = pci_dev_base(seg, bus, devfn);

In both cases the unlikely() uses won't have the intended effect, from all I
know. They would help as used here only if the compiler managed to fold all
three parts of the ||-expression into a single conditional branch, which I
don't think it would end up doing.

Jan

