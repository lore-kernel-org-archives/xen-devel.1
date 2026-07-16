Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A5BC44512
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 14:52:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364221.1615540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkNR5-0005s6-8u; Thu, 16 Jul 2026 14:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364221.1615540; Thu, 16 Jul 2026 14:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkNR5-0005rz-60; Thu, 16 Jul 2026 14:51:39 +0000
Received: by outflank-mailman (input) for mailman id 1364221;
 Thu, 16 Jul 2026 14:51:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkNR4-0005rt-AJ
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 14:51:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkNR3-008Bna-A6
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 16:51:37 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58efe9-5cb7-0a2a0a5109dd-0a2a45099abc-44
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:51:37 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58eff9-be1a-0a2a45090019-d1558036e95a-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:51:37 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4953ddae026so12976295e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 07:51:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f4634e036sm28480301f8f.5.2026.07.16.07.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 07:51:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1784213497; x=1784818297; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KJdAVEgKyaQcD3zovGTs8U+yQLYpwodJ3cTWgNRQCMo=;
        b=KcwwiNiA+5MBUlbfLXd21TNTaL0nKwhsoIkdwHWc6/zzo19hucPUOdaZj1wtcnwPtB
         k4cM44/zIYpo5Pd5k3aSP/SzjRlEPuL+OYIcdEFR2BZedx3g6iNWO/exO0YyZa7LK6sF
         FyejddXi7UJXmpjVQsguu1KG6axMvfigWM1eehPniKSzlX57LuP4FLZh13da6768TCKI
         lbcSBiMXKcV0QvI8Xd9UCRUc05qx7vD0xgkjTBOF+T0xrjG/bupxA2OjPoGAAOWp3/AD
         aYWj/dN1kGXu1OLKqVoOUBjNwdp7d3MHNWakdkKYGNr7xbYM71xA0qkMxTlBdcynyVYg
         Ikkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784213497; x=1784818297;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KJdAVEgKyaQcD3zovGTs8U+yQLYpwodJ3cTWgNRQCMo=;
        b=s08kFk/YBa53gE1NIzfndtKwu2DvXMhqzOwupnRe3m03fiwDs99GOe9cP1MEK0y1qH
         zX8gFUFMl05TtFMVh2k724bWGpP2dGMpHDWPUdMIHKg+OXp5FZCf1sq2EiuTWid1sHPi
         MP4BHrSlKF0yGBF+D5PSysMuuZxuEdSb2Pm1oeDkdT/deQdM3LzEI0dwC9/Acr5fdEY4
         xVR2YKu65ZLBv8t0dJQ0RZKuNdZke46B7SNT6gd6KDcnaIOwt2ORdlkMYuWa2g3xneVj
         JdXCbJqXtExuEQzRcCZHz86Hq3ZDs3wURNYkWkeRZEHGr12EakS2SoEhABPvgrLBnEwH
         l/hQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSHzh5yjLOQ0OMgz8Ac2MbuhcsjvmFF6quBuSjU3GUSJVYNENoRBqmhOQhwls7gaRdbZU1aWsgGfY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWkryV1DVm9wmdrW7tw1gNsa9n7ekbCpWMWNMwhDk7GSe6lTP1
	WA7v1EvupgJvZBexaE9pHNvlDpbVZUiFVdXj993vqK6T2Bahh0JqMf8mbrlDhugu0uMFavbGotp
	8wpsCbw==
X-Gm-Gg: AfdE7cl1VjsTVUyYtb4UYvFGzRJHBvv3wP0bQcahRoTCGsBEKJdbXqEcrgcjD3gyO3N
	ww50ZCIHhbKVZkX/EQ3NRNO0d9jT7VfudFenx1wsJOTEEbGBltQmhOF0dCKRQnmeoxrb7Q5x+mW
	sUluMLeQEQ2XZOsALYtZdSbVGgEOLemksmOiogXrexXZDkAz8HUBNdE6ZuQxwPqQW+H6PJPY1sK
	95ZwfiMArEJr6OAG2GlsKb78SP3NmW45tchMzxkMEYdRU/rQC+EXeP9agQuaLrE40JsYgIbt7Wz
	NhO/ORie9RRZoIdJ/mH4nwXP2TkjjCBSK0kYa1x+sSvZUfvZOCiK+p/OQOabtMKVIgIi2BgZMXM
	xjz0xdnyGSkUB4Ps3bw7/8ZWNOGw5VCoX1nAh7JwiVztWdgeGmh/LNJ+0gIWtkRC+u3ElLnF5zo
	4t+7UEGjLznNeNIlj53NB5L8uDkjxhwzmJg1oFBfFBBCOAta9CDjqSNfZzcyH9ND68Pw==
X-Received: by 2002:a05:600c:6989:b0:493:bfbf:1da4 with SMTP id 5b1f17b1804b1-493f881de65mr228121365e9.22.1784213495831;
        Thu, 16 Jul 2026 07:51:35 -0700 (PDT)
Message-ID: <077f245a-7a0d-497d-90db-6a0bfaf4bd0a@suse.com>
Date: Thu, 16 Jul 2026 16:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] xen/acpi: Import PPTT definitions from Linux
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Mykyta_Poturai@epam.com, xen-devel@lists.xenproject.org
References: <20260714104445.919830-1-taka@valinux.co.jp>
 <20260714104445.919830-5-taka@valinux.co.jp>
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
In-Reply-To: <20260714104445.919830-5-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1784213497-BE2C4034-B9923FC2/0/0
X-purgate-type: clean
X-purgate-size: 732

On 14.07.2026 12:44, Hirokazu Takahashi wrote:
> Import the Processor Properties Topology Table (PPTT) definitions
> from the Linux kernel header (include/acpi/actbl2.h) into Xen.
> 
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git 091c4af3562d

Not really. This was only a correction to what was done earlier.
e62f8227851d mirrored an ACPICA commit moving PPTT from actbl1.h to
actbl2.h. b8355bcac253 is where the definitions first appeared. I'd
suggest to reference all three commits, maybe also the one that was
in need of correction.

> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>

With the Origin: tags properly sorted:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

