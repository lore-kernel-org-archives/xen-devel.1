Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE77C531F7
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 15:59:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369356.1618165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmvpN-0001VE-60; Thu, 23 Jul 2026 15:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369356.1618165; Thu, 23 Jul 2026 15:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmvpN-0001V7-3O; Thu, 23 Jul 2026 15:59:17 +0000
Received: by outflank-mailman (input) for mailman id 1369356;
 Thu, 23 Jul 2026 15:59:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmvpM-0001V1-6t
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 15:59:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmvpL-00GIlZ-K7
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 17:59:15 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a623a51-5cb7-0a2a0a5109dd-0a2a45089eda-4
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 17:59:15 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a623a53-f659-0a2a45080019-d155dd2ca950-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 17:59:15 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4720f3bf164so441984f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 08:59:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c6d277sm17006857f8f.32.2026.07.23.08.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 08:59:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1784822355; x=1785427155; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=evsyqrqieCD0C8dQZlE01KrvCm/bGqDTqEzmszC6Rgg=;
        b=gFrXsemYJTEOJHT1mCHf/bBwWRWqxY9AhqEE1435jM41zAjW9oZuVehGkqr0fcbU8+
         SLtEDXh4biUsm5WSWtRCnUOIhRES+43enbexTWSCcRkZieIhTFSe773XVCtyDmGo6lQZ
         Oi2WzeJtpK5bx5GfjcTznxawIILG8Yl3xepaHPlWgOM0ePttJ4RcN4ydE2CZEUlpk4Sj
         RCrBlYbJkMc7kIqbH8DlVBk/AvKLS8kIx+Af5L8xkWlrU5SR7N4gRLceDyp8ae/XrsP8
         Ve7ldvdoMv5US5TQwtsTolLIAZwaTUSfD/w2pESDHN55uyjD1ruwcRw3HI5NGB3fjOGT
         1TLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784822355; x=1785427155;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=evsyqrqieCD0C8dQZlE01KrvCm/bGqDTqEzmszC6Rgg=;
        b=FHDBfddA449dmrRsP80uyLVz9ayLOz40buCtpo8SrUepK2CmkH4JHj8lkslmkL3ZPG
         L8xmLuMyiSq7fntDL8s9SLCz+g8fXbwBJ7L+4EtT/Ozj0Oy8/3YcSUa5ZPx96uNVUqzu
         M8CLjne+F/qkYzgfxa1hX4c46i0MAGWugVrL8WuZDECOdkftRmEGWTjWFAHsAHjxHsQp
         Bq6d3dhRBEVWuYkDq/nX+JCP59eSgBgAKQBKx/YzEsZnBM0tDtoBxeSACrOpPoGo2aF4
         KI7wZiPTwczJIP5U6Tk24bh0TeuDFy1W9ZIwVAun1GQBv+0HWuiSkhzouWd8arzhrrK4
         Zy0A==
X-Forwarded-Encrypted: i=1; AHgh+Roh2B38VxkdBjM37DcULwnUum4kMN7Fese9De/tc5YSFEzAS1oBoAh66gWhegevh3q7atSK+uYVwbI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/aiZefmuDRNAS8dDCQuIVmVMZAgncmZCahNAbHPutHjUm2Bzs
	A9ASIFuehxWbAF/mYE6+swdE9JN/A2l4SJmiI+E2oybJ0MwxBUumQCqgqLa11IP5hw==
X-Gm-Gg: AR+sD10p244yJibnqs2LAvMd8i8OtSb9qpqLfWAPyFuj04V9Fs8gfAK1JmnSrN2bMJi
	u0G/73Qc8I8ds9gEYCTugtPRWW7Xj6n0K0y3Jg2Z7SyCzJ2ODXWxFj9lq8hHz6gxxMi3EEN0F+N
	/WcnpxtLazunGqKmXw8UnqcK7RqiovQCcpyinqL6zYFks2dYMcXZhDrySnrywlwOrz78WuPlrY5
	/zjA82fDoqvmhFixC08tuBxmJpUHKKfSENqzzHuBDrsH27ycZNoKmeDTOrBFGJk5MxeGCAFnXrO
	LpI8VUDy0bT/A89lEv6V1YObh8NKlt7+/zDWjWP5s/mHKsYVjjaTMft7MNwW6dp1C1u+UbzwdEa
	fdpSg8p+3IGRE5Qf3BrOGtdQmYpmQ7dt9QsYcYp3A20ItpYDHtDZXns5A8qT1x+89p5dUgSV0bR
	OAv2+30RJKbcl8apNtVxUKcP0oScZMBic3DpSIaOAgVBAAfZvlGjR3BnmnzdXvYvbDmQ==
X-Received: by 2002:a05:6000:385:b0:47f:853c:ad7b with SMTP id ffacd0b85a97d-47f901ce2e3mr3929075f8f.9.1784822354923;
        Thu, 23 Jul 2026 08:59:14 -0700 (PDT)
Message-ID: <7f8ad0ec-d93e-4664-ab9a-c2b9199f3d2a@suse.com>
Date: Thu, 23 Jul 2026 17:59:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/9] vpci/msix: move MSI-X hole punching as a result of
 memory decoding enable
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20260708210233.922275-1-stewart.hildebrand@amd.com>
 <20260708210233.922275-5-stewart.hildebrand@amd.com>
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
In-Reply-To: <20260708210233.922275-5-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1784822355-CD94A87B-98097305/0/0
X-purgate-type: clean
X-purgate-size: 2640

On 08.07.2026 23:02, Stewart Hildebrand wrote:
> From: Roger Pau Monne <roger.pau@citrix.com>
> 
> Deferring the p2m unpopulate of the MSI-X table region to after the BARs are
> mapped in the p2m is not needed.  The aim of vpci_make_msix_hole() is to
> cope with the BAR containing the MSI-X table being positioned over a
> reserved e820 region, by making sure the MSI-X table region is
> unpopulated on the p2m. Note that reserved e820 regions are identity mapped
> in the hardware domain p2m by default.
> 
> Doing it before or after the BAR p2m changes are done is irrelevant, hence
> do it ahead of the p2m changes, as that's simpler.
> 
> Note that vpci_make_msix_hole() should be invoked strictly after setting
> bar->enabled. The movement of vpci_make_msix_hole() is OK since
> bar->enabled is set in modify_bars().
> 
> Take the opportunity to store the memory decoding enabled bit in a local
> variable.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> Note that this should not be committed until after the bar->enabled
> setting movement in ("xen/vpci: only check BAR validity once")
> 
> I tested this with hot-plug as described in 7c24d58a6e64 ("vpci/msix:
> check for BARs enabled in vpci_make_msix_hole").
> 
> The return at the end of the function will gain a purpose again after a
> later code movement patch in the series.
> 
> The new_enabled variable will gain 2 additional uses later in the series.
> 
> v1->v5:
> * order after ("xen/vpci: only check BAR validity once")
> * preserve behavior of only invoking vpci_make_msix_hole() when memory
>   decoding toggles from 0 to 1
> * add note about vpci_make_msix_hole() invocation after setting bar->enabled
> * use local variable
> * Jan offered an R-b tag in [1], though I hesitated to pick it up due to
>   changes, and it was offered prior to 7c24d58a6e64 going upstream
> [1] https://lore.kernel.org/xen-devel/e2c4944d-d089-490c-879d-b6baec5e4cae@suse.com/

If there wasn't ...

> @@ -556,6 +544,12 @@ static void cf_check cmd_write(
>          modify_bars(pdev, cmd, false);
>      else
>          pci_conf_write16(pdev->sbdf, reg, cmd);
> +
> +#ifdef CONFIG_HAS_PCI_MSI
> +    /* Unpopulate MSI-X table region, so accesses trap into Xen. */
> +    if ( !header->bars_mapped && new_enabled && vpci_make_msix_hole(pdev) )
> +        return;
> +#endif

... the new first part of the conditional, I'd re-offer R-b right away. With
that check added, aren't we at risk of leaving the range mapped when it
shouldn't be?

Jan

