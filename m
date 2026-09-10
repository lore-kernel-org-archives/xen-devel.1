Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248EBC79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 09:48:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414285.1644063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bNz-0008Ab-Lh; Thu, 10 Sep 2026 09:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414285.1644063; Thu, 10 Sep 2026 09:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bNz-0008AU-IX; Thu, 10 Sep 2026 09:48:03 +0000
Received: by outflank-mailman (input) for mailman id 1414285;
 Thu, 10 Sep 2026 09:48:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4bNy-000899-Df
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 09:48:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4bNx-0025Nl-Qe
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:48:01 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa27cce-8faa-0a2a0a5109dd-0a2a450285ee-8
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:48:01 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa27cd1-6ca4-0a2a45020019-d155802ce485-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:48:01 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49cca4ffdcfso56534765e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 02:48:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c06f04sm64243345e9.13.2026.09.10.02.48.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 02:48:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1789033681; x=1789638481; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dLXmqrgSVLlstBLicQkdZBAUJ+mHmKliLnE6FFI7R3E=;
        b=Rk7gvoLDp7od5o2Ho3diCkOF1OSG5u0tTcICjxZ5iikOlaU9qwojf5f9SZ5V7m5kGi
         /JbgHOEqdTiterYdPQ9LPDwwcKK5QbizH59hNur1iFG+RzLpq8nwdm++ZHfXPQWeIISr
         j1rAkLpFfnKVawWP1+Ce4wBGRjdjyWBv5drDVWGPtk2sXHpzNplfrQHmm73nnHzvfkge
         xokAiPPosRY3gqsYZ6B+9/KLKVP1YfREl272gjC1v5CQgAiXkmxtNcu3htDRyOq52XHt
         kUsq3bH8J42ldgZpDgTT0S6g6+Kw3pq47PXAZ7GkUVfFo8CtKfZ3MdcdnU8jMunzfeIg
         S5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033681; x=1789638481;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLXmqrgSVLlstBLicQkdZBAUJ+mHmKliLnE6FFI7R3E=;
        b=eFb4rlAPZUu0t3YDS+xHwcKrLe4rwBbSe2XekrpHurD6T8KwNoxcjPdtrdINoFppd3
         rSDWc3qwNoKtVo37cFnu7VpAR8MZSixrKQga5RZwSV4UJJ2sNllKJtJXQnNkzlXxvYWk
         LClak+LgcP8m2a35qPf/OjDOfJz6oukUvCqfaqYiARJz6n4rREanTnnPOrMbH9HC45A4
         /19XA8fF26JSxWaafKoYnTtvgP9DJ60p3IKdSQMYtTEazKZvEaSNJH1TcDfhhlBIP61u
         BLg6/7usYThH4UsdZsk7jXqx+2mWS8qKPG7wBPFzD3KIgSZVTYu6K3PWQ3tm7T5MfQmC
         hOQQ==
X-Gm-Message-State: AFuF++ljly1/4v7tC0jXR0Kl0+R4WkMcuIWSzWcDsA0H8wfD/dh4OgzW
	o8cZyv9slpB7FR52IE/DkPANHzzsLuJ60fH/h0Rugo983yckzX/F5bmtqfCrt84lYZgwZHVb5RX
	QlADYtw==
X-Gm-Gg: AYBFou16ZSqmIOinkFAz/w0kjqNouN1Fhv7qlC8onoGSNDfPmXcQVLgaBjl5AgqdEJN
	GeQk+CvQjsfIo386qqDNCfz8M5cEcg6dvYrnyt3/4fSuBx14YB4HrX/ON6pF5au0DDNhso6hI/n
	m5UFkmoJ833tX+ociVIcC98DjUtusiMU5Z7QQ2fvbtScye5Krrrl7FQPUMhAMihgTW762xGdMwx
	Jnf9A6xx/k5A+Cl9N8/YnZ/wUpWiv988h66P5Hhz7tNiQV/MaS6f7LMBjCGypZ/1YWALda7Mvw2
	tVcxoC/MghjjAy5OiGDx87qPOMsvFe/uXys74HbvSI7g1W/heNY7R6gkihwTmuHk9SDigx877DF
	4GkIr/Gvz2RITo3wiB/C13CSqapvRMNIddEI5inzANGy2xfdVWjJ4tyj+cMkbpb8aLFzNdUdcUM
	3Pjp+cP5TuwOAfb5dxqCwmf5MCALcu5HCoR4IhmjRd4sL3TEQKq6zhi7pBQB3+tCLy0El9UWYLS
	IH4gy7cXUk/IqWdJLJSgof2ajiOBl5ydRQLnu3KUxNHJo87ySfVTSmxy2tgbXc=
X-Received: by 2002:a05:600c:4f12:b0:499:da8b:1476 with SMTP id 5b1f17b1804b1-49cf825a5bcmr425426845e9.14.1789033681231;
        Thu, 10 Sep 2026 02:48:01 -0700 (PDT)
Message-ID: <a857c595-53ca-4848-ba1a-e0cc5da572c0@suse.com>
Date: Thu, 10 Sep 2026 11:47:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] xen/riscv: fix boot on missing extensions and MMU
 setup bugs
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
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
In-Reply-To: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1789033681-670B02AC-3D16F129/10/73395122804
X-purgate-type: spam
X-purgate-size: 1849

On 10.09.2026 11:30, Baptiste Le Duc wrote:
> This series introduces bugs fixes that were found while bringing up CI
> support for the HiFive Premier P550 board with a basic smoke test. The
> board-support series itself will follow separately as it depends on
> PLIC/vPLIC and dom0less support that have not been upstreamed yet. This
> series carries only the independent fixes found along the way, none of them
> need the board-support series to apply.
> 
> This series:
>     1: Fix Svade/Svadu A/D bit handling
>     2: Set A/D bits in Xen's own page-table mappings under Svade
>     3: Make Svpbmt no longer a required extension
>     4: Make Zihintpause no longer a required extension
>     5: Flush speculatively cached Bare-mode TLB entries in turn_on_mmu()
>     6: Fix level_map_mask truncation on load_start
> 
> CI pipeline:
> https://gitlab.com/xen-project/people/baptleduc/xen/-/pipelines/2836284276
> 
> ---
> Changes since v1:
> - address ML comments
> - rename some patchs
> - add new patch-fix: 242dd1f890e4 ("xen/riscv: fix level_map_mask
>   truncation on load_start") discovered when working on Spacemit K3 support
> 
> To: Zheng Zhang <Zheng Zhang <zhangzheng@iscas.ac.cn>
> To: Alistair Francis <alistair.francis@wdc.com>
> To: Connor Davis <connojdavis@gmail.com>
> To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> To: Andrew Cooper <andrew.cooper3@citrix.com>
> To: Anthony PERARD <anthony.perard@vates.tech>
> To: Michal Orzel <michal.orzel@amd.com>
> To: Jan Beulich <jbeulich@suse.com>
> To: Julien Grall <julien@xen.org>
> To: Roger Pau Monné <roger@xenproject.org>
> To: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org

Please can you adhere to patch submission rules? Patches are to be sent To:
the list, with relevant people Cc:-ed.

Jan

