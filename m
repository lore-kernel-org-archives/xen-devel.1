Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B192CC6B33
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 10:11:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450190.1665686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHIQu-0001BI-8J; Thu, 15 Oct 2026 10:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450190.1665686; Thu, 15 Oct 2026 10:11:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHIQu-0001BB-5e; Thu, 15 Oct 2026 10:11:32 +0000
Received: by outflank-mailman (input) for mailman id 1450190;
 Thu, 15 Oct 2026 10:11:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHIQt-0001B5-LW
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 10:11:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHIQt-00FApW-2S
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 12:11:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad0a6c3-2eae-0a2a0a5409dd-0a2a4503a8fa-48
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 12:11:30 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad0a6d2-fae8-0a2a45030019-d1558031f04c-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 12:11:30 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso17465585e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 03:11:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd97ef4dsm65621625e9.4.2026.10.15.03.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 03:11:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1792059090; x=1792663890; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wDlcm+UsGOUlIyU2aSur0r1yZnp3JNhL9jjIS/sHvw=;
        b=SNJuTtD/t7PsDho8Sn8MUtUAf7+qFZZKxeTxOkZxR5iizWf8P935GCZEZ1riFYZ134
         hIOEJLfnaWu/3pnmJvIOfIhcV7ytHLl5UcnHZjiBy/gSUROciuhqf7VnEpBR5MD/nV/i
         Uzv6l4lXM6o0AXq93Rt0wFGWHstJCohX6gzarzN91oJxtckys36VMsPC/rCOf35UqdxC
         47fr50/8C21sZStNYaVzUR9d2YYwAHwA0/WdRoRIh0coOiCpDNY8ii2QHI45xB6OKT+W
         Sn0YuU+/93O8X3tbYYu/pnimhRUHG9+JVQ/lXWBGMA0UpBhZA2rM3RbfAURCe3wYwfwD
         ZijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059090; x=1792663890;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wDlcm+UsGOUlIyU2aSur0r1yZnp3JNhL9jjIS/sHvw=;
        b=sd7c6dbgqQv21MYmrnn9a7K/lGsuFADIeAuJt4OkOi/gGTh5oSMdIyBOf1AC3nWVIV
         2sjiR53EpmEBJ8qCnU3nVVvd/f2BEpr7mDLptryzDHLNDpPDs1ihFuNQLabdkxffRW3G
         erGpMRl25Hme6Zj7HXafDI3N+rW1WUSdQJrrY7ZxvkhqvgdSXTsy4IvSRbnxX9xkgteu
         7WAuLgZgPmBqp47TquTYjPtC4rO8fxvnuASAOfM05ZcA43sibyWF4CRINXpWvvsMbZg6
         1nCpJykNga00/aXoFp3ifNOGg6c9IzyCPV/dOXe3USpWGktNaKWZ6S9KDlRpGlFyzi88
         7M2A==
X-Forwarded-Encrypted: i=1; AKwUvBxbbz3AmXnEKpu8XjXCmQBfnXl1RiN5PJyM5ZFqlUseYHJx02s+lCnn5LAA/AUHP0cq7PtKXzrvqJU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIckTLZJgGX2CDGeGAeVjKW1EAts/OBkOx87iYqp29h8yLShyUA
	SMzAGMYG4qx5iyRas5a6tO2DIKg5c0bdKR/kULpDpgnGo7zT1hwpSDpnt7GYqaUL9A==
X-Gm-Gg: AYBFou0ewpQ/DYijn0dBNtOlbPQqbw7FHn6lLq6eNzbaaDjmjGQGfA7LYXavD1rVcUC
	YGT6bGdcTEa4kfyw00YynnPqLPcyb9rTi+tY/JKqtQdC4t6Qh+OrJbB7pD9dgzkxwnI9LZudKj2
	CVrvY7akxIkIuHRpBQ9sTjnK8G3x2E1Av8M3amAC8AqPeYaAt0HAoKFVmK5BKkcHcQzOCVIhc9N
	erP0mjZFf1E1SCFL6hU+A4CVqqwOLJgTK+naV9PSVAsUsVH3UHTPgsqJD3L1hyXpKh7cDQ3EWVT
	+/MeIZF+T//94dzCizXN+5SYUD0sc3t4bktlwUz/t6Ei+FEllzEo0oGQ3NxfmpbpWT8/Ns7Erv1
	6gS2dbo9HwfdqPkceIvH36kaM5MFPYVcW4n2eLdMtm9jvyR4Z3YKLcMNEJegj0s5Sl14B91DBuF
	KRA+d4EfhGqAPFh8pA5CNf5zVij37ojL7sY1Z58oZeoXAHqrI+OikV/UQGAWC3/dcj8LY53/PvA
	sk+DCf/cAjhiwPurhdjVmChvnKyX9/TYVryq/+e23QBanoqUWLTt8VCoCdf2RntOi+INtUEYA==
X-Received: by 2002:a05:600c:4ecb:b0:4a1:6916:798 with SMTP id 5b1f17b1804b1-4a18e4a3f69mr368823125e9.14.1792059090326;
        Thu, 15 Oct 2026 03:11:30 -0700 (PDT)
Message-ID: <ac54df55-0b64-4981-91f2-edc33dba518d@suse.com>
Date: Thu, 15 Oct 2026 12:11:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] public/vcpu: Fix incorrect VCPUOP name in
 register_*_phys_area comment
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1792057791.8631fc262581453bbf619ec5b2062170.1a13ef7d4a80008425@vates.tech>
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
In-Reply-To: <1792057791.8631fc262581453bbf619ec5b2062170.1a13ef7d4a80008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1792059090-74E874E9-ACA8F625/10/78276251493
X-purgate-type: spam
X-purgate-size: 373

On 15.10.2026 11:48, Teddy Astie wrote:
> This part of the comment is actually about VCPUOP_register_runstate_phys_area
> and not VCPUOP_register_runstate_memory_area.
> 
> Fixes: d5df44275e7a ("domain: introduce GADDR based runstate area registration alternative")
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


