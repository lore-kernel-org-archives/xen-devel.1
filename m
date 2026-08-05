Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BE1C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:24:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383578.1626850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrcXR-0004Kg-2h; Wed, 05 Aug 2026 14:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383578.1626850; Wed, 05 Aug 2026 14:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrcXQ-0004KZ-Va; Wed, 05 Aug 2026 14:24:08 +0000
Received: by outflank-mailman (input) for mailman id 1383578;
 Wed, 05 Aug 2026 14:24:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrcXP-0004KR-Cm
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:24:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrcXO-00CYWN-PY
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:24:06 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a734775-5cb7-0a2a0a5109dd-0a2a4507e9dc-46
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:24:06 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a734786-b4ea-0a2a45070019-d1558031b5bf-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:24:06 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49557167508so9697765e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 07:24:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994a100e14sm171303405e9.14.2026.08.05.07.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 07:24:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1785939846; x=1786544646; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbRVw62g8SNCcV8AekHEQaKPLBlLD87oFEQk+G4hP3c=;
        b=NGODxzB3nbbe9lBKUiIF1N+KcS4w/U8muYTDKADsjlAiQpRBVU735XU1G+QVUm+pLT
         OxIhbeC71kQNYAQTPQrfwX64Ml3W4z7o0ftSaMvo3DnyILPVqSfzl7T2L8cb9mWIyUDJ
         5mtg5qTUS/FuqNdY1D+P53A35xqr8VFo+NYwvswWrNoc2wWZ2K4/W+ugNmp4FBUmw2xS
         4V8qf/7TcsWg0I9lHCsDzGqWB2oEUvbDH7Q49yIkg/4vjwm07d/F0fIeLNYBdX5anlQp
         Rt5Q1lxDKXoFAJkHPk9CtnYTSgH5JMOwps6AlNkruI9PbIlQg14R033Jn1HZplXpXoPE
         UfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785939846; x=1786544646;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbRVw62g8SNCcV8AekHEQaKPLBlLD87oFEQk+G4hP3c=;
        b=YQ2Uwd4cS0W74zUX641JxTk3AyAiGHFyLony0Q8GV7nc6ykFT0NgeAWx2BJTRa/tAY
         6XXVI7DxqiZUWRk6bd4dbjzWxcPYNKqIroy7KSrklnZdEugP2wkEJPV+4JVGuMaIAen/
         +uGYCswvSE8SDYnV8GEwnJ33iCvcmrzi/IFo0+8xNK4VfY0+msO79BGtbB98EDR2ahvD
         bEXLxx2QDP6ZFvMkXR06bV9Y11c8u/ljUI4hlbbRFNmgwhgAd8xuLr4UU9jFX68HI1VP
         xgPJ9T2rL+LZDqdMZzB36mrv8kl/4RFRwPLCf0wpKSNLMFQUCMJZrmJCQHXjv6gBHgGS
         CmrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRwoF8DcezR/YLeiI0ubYzn8B0Fp1iNdWoS2+45RPBrjPsDYgqCH2fwu+pSp8vCtGYORyPH32R1H8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNYOxhSHnk4bdUbiquEE1m3PUbAt7Ie6TWJ8IAmqH5S6j09BYd
	mJvqeW7yGbqf5O5iIppfF/cjK+InUejuh/SRpFmaKde+9OFFpjl0lHT6yowtahJ4lg==
X-Gm-Gg: AR+sD12cFfbd/TVGaGaQ6qDldMrThNDhOM0NgSvNqSM4HyPGMRnmi3BMlSaT2QOO+v2
	MOCTMhp32SWk/gCq4MjNZW1F6bWfMvsUbRNnnnvcwy0pCn9K1uVnXNKw8zC3hfytwllg2nG8xUE
	XwCoVt/yuPh3FLEq0yoxn9eood5pbrtmrke6cX0qK69v3s5CczKzCTpbcJeJwpY8MWBYZgELvSR
	foUIN52L9Dn7Qmmxz2eDMI/1B00vM6wbR2MzJtQuU3l2pmsM+TNAdC1DWAWPOoy/voot/vkkirN
	lKJ4DilMwbdYIsvmuYWPukFFgSujNxvLj5gAaLBPwVd0sCvDsM2XKpNLZIwEMaXIFsUDXRCG55d
	2tjpstn4BhL9SToITBxEJ3PNcd07iCVD6KqufatHZ3GGEZfYcJqUg4twZxZYLfVos0qeedN1XMN
	nCIELQ74LZ3ozgFFytrnvTfnQ41HlthplGOUPNCYgClS04XXNTgjqL6Wl8VXflF77pbqrYtGUOT
	GzKtwz6aakBhGZDhShXtQRHLxTElb08DG7ImWj9S+sI9sXXnCRt
X-Received: by 2002:a05:600c:1d23:b0:499:51b8:d649 with SMTP id 5b1f17b1804b1-49951b8d652mr25870305e9.3.1785939845902;
        Wed, 05 Aug 2026 07:24:05 -0700 (PDT)
Message-ID: <5a444465-1d4b-4618-825e-1be612408009@suse.com>
Date: Wed, 5 Aug 2026 16:24:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] xen/acpi: Parse PPTT to initialize CPU topology
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Mykyta_Poturai@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260728050642.411240-1-taka@valinux.co.jp>
 <20260728050642.411240-5-taka@valinux.co.jp>
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
In-Reply-To: <20260728050642.411240-5-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1785939846-A7CD7AE4-C3F38FC4/0/0
X-purgate-type: clean
X-purgate-size: 454

On 28.07.2026 07:06, Hirokazu Takahashi wrote:
> Parse the ACPI PPTT (Processor Properties Topology Table) to
> initialize the CPU topology.
> 
> For ACPI 6.3 and later, the ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD flag
> is checked to determine the presence of threading. For ACPI 6.2 and
> earlier, CPUs are assumed not to support threading.
> 
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>

Acked-by: Jan Beulich <jbeulich@suse.com>


