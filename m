Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FBFC5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 07:42:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388794.1629777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3b3-0007eT-QK; Wed, 12 Aug 2026 07:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388794.1629777; Wed, 12 Aug 2026 07:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3b3-0007eM-MG; Wed, 12 Aug 2026 07:41:57 +0000
Received: by outflank-mailman (input) for mailman id 1388794;
 Wed, 12 Aug 2026 07:41:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu3b2-0007eB-MR
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 07:41:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu3b2-002NrJ-2X
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 09:41:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c23bf-2eae-0a2a0a5409dd-0a2a4507cc34-20
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 09:41:56 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c23c3-b4ea-0a2a45070019-d1558032bc11-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 09:41:55 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so4707415e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 00:41:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997b33e038sm27710045e9.4.2026.08.12.00.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 00:41:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1786520515; x=1787125315; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3UBX0ogQdkSoMnSPy/v+GaVoz34I1SPSZX5Aqejg1Bw=;
        b=FhxKcMnkcXWCEvApssjt6rJIJfezYbrP5fqFT5NAw+2v/UgB9yVvs5Y3IpngfUH6qp
         MbDkgJQQVIF3/LmOxy7mxOIeEZs4qi8R30++AwXgFM5FdiTc/AHV2M9kmV3zHgqRg2Dy
         ay6Isr9shVZJhNEWIn7LNCO9EHg42sElVUynX7ekkv0tl8jP2Wr58hmnDSo52v28n+Q5
         bdyccVRvMx1LgfMl1KOzyzhza+roxR7oR3GtGK4dT0SahDz4BQLkjh/ljqEBqsYRYtll
         6masjiEtb72MKpyqyH5Tn5ruGKdj99dgomcSTORMy9YzlGopPAc97Zlc7q3QquxFpUvA
         9ULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786520515; x=1787125315;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3UBX0ogQdkSoMnSPy/v+GaVoz34I1SPSZX5Aqejg1Bw=;
        b=Xxzj8P1b6jXqlfzaVf+RWQMTcGraE1IAjyhkh+ExtpGIu+qMUbmKERj6CGXHCOqZFa
         80u02EpbFL0nB0/wugMPuwZFpWb353i2/Nv9RGtKAunHQJx5q6cB0O4FeNCpQN1vVVME
         p5K9ANFaOJQxP5V7Ea6YyPWbKQsNX0gtAtA9N3tySbKZQZIqiLOZkVmsUqTxqpicxJ9S
         6W5G09HNv9fGaXoCbhHSv9hssZDoRSxP4N2SPLguviSvavA0B1XHrd9fVJKhTH9QPQtO
         I2GEWsVejj/k/gEbmmFLsm8oBuXpVpPI1hLALdUxuY6YLdGvRhVe0YU97a79y+B5NRyh
         s2dQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGcZZu1b0gpSBBzPmyhd7FV0qIkwpgbyESW79GWEvJ9u3qyoOlcnGMyWnLptppZuLclOUfR8BDv2w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5Cq65qxAQUqpDBrjzqfmoP8nDvjkyE4VCN5xTcyu/iopywdDb
	87ttp7O5LDSdW98EHTxjEYWkIj2mtaYXdnj/m8Svi0EU2qlgpZLxoeuW184KuJzauw==
X-Gm-Gg: AR+sD10DemBbfd5Mx5L/o4UfNs15hNCi+setKFmP0v5CPdiaBwIsFPnUP6Mu2kvI2BG
	uP7elR8YdP1PDyc+60EOlxQR9EOR9opqWMiiG8LoAY1KHrv0W/lH2sVab3DBicUL51JisRA07yG
	9rh2KhCkls+4kAf3qSO8oi7kRLQSTttKI7xjDKADzXX1H/+FOsobBAPXpzul+cTVj14LpwqA5T+
	WCnrFeo1aCeZ6m9SyBf7tZgAKsLBgjSQaYAPfi3jTg/9jfftF8wAbULVx9YEdEYyeMY0Mw17vbG
	WR+4lSr+McwhtXDE8288e66X89+hi48C2ZVMTMq0kz+IVvYoollHp5apBy9I6IK23uZymTykzpV
	SfS4V+NJTq8sDkju5FFNenzM2TUsDJ8XW0Niff3eOldMqn1VrIyROPDy+m4MjKfMnhyLtUr3ogc
	ShlBpcexI40A6w4ZYwOoDjq+3H/Jfnlcqv9vVX2UEKFeGfzAkbsRbfelk/DfPfPOILajz4NcV0P
	my1panyY59cEf64YQwkojU2wSdVg4hPEdB4PuIk3pKbjIWIKo4l
X-Received: by 2002:a05:600c:4e90:b0:495:6a50:3fb8 with SMTP id 5b1f17b1804b1-4997c0e3721mr28543855e9.1.1786520515072;
        Wed, 12 Aug 2026 00:41:55 -0700 (PDT)
Message-ID: <0189f567-7dbc-4450-b247-371b8de0c874@suse.com>
Date: Wed, 12 Aug 2026 09:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/domctl: Fix unitialized copyback in
 XEN_DOMCTL_PSR_GET_*
To: =?UTF-8?Q?Johann_H=C3=B6pfner?= <hoepf@cit.tum.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <anWrDspbnvRYCwGZ@cit.tum.de>
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
In-Reply-To: <anWrDspbnvRYCwGZ@cit.tum.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1786520515-A58C1AE4-A11205F8/0/0
X-purgate-type: clean
X-purgate-size: 632

On 10.08.2026 00:38, Johann Höpfner wrote:
> domctl_psr_get_val() copies unitialized stack space back if psr_get_val
> fails. Fix by zero-initializing v_.
> 
> Fixes: 03f30dc193c8 ("x86: refactor psr: L3 CAT: implement get value flow.")
> Signed-off-by: Johann Höpfner <hoepf@cit.tum.de>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Consider instead removing the local variable indirection introduced by
> 03f30dc193c8 and passing &(domctl)->u.psr_alloc.data to psr_get_val
> instead or only conditionally setting copyback true.

Well - the way you've done it is clearly easiest / most obviously correct.

Jan

