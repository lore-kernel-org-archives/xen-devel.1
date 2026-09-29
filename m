Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C12C9832A
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 06:52:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436301.1655036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBRhS-0007l7-Jc; Tue, 29 Sep 2026 06:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436301.1655036; Tue, 29 Sep 2026 06:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBRhS-0007l0-Gl; Tue, 29 Sep 2026 06:52:26 +0000
Received: by outflank-mailman (input) for mailman id 1436301;
 Tue, 29 Sep 2026 06:52:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1xBRhR-0007ku-If
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 06:52:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBRhQ-001xfg-3H
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 08:52:24 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abb601d-bab6-0a2a0a5309dd-0a2a4501cd54-38
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 08:52:23 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abb6027-5984-0a2a45010019-4a7de18d98f4-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 08:52:23 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e721b5503so36090825e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 23:52:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00d10cb7dsm22667695e9.0.2026.09.28.23.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 23:52:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1790664743; x=1791269543; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmI1Zh6FMfvKYDLJnlPfHK7JTmlcfSeOLA4xkGboDbk=;
        b=O+JSCQIVfaDE9ilkR/w+kUNtfuki0CqJKEln/sMS99EicG2GQXu3aY1gzKeWjxQsHc
         KPB4zJXXU4DhGl+CSpWFzs5aKGTcrDQt/uK0h+RUu89ao9g4g8JqhgjU9ul0UBhysOCg
         xFiuQG3S7TC6bP47W6roHq2zutpHUEFk4vBOWpnux5cWX7ntFkYjGrtAF14+ePm4S+7b
         vUL6wSXk2OWcUmMDrLJjpcpdTOGNH55Sd09K5O/a+IyYs9WVakodLEamJa6mAp7ELR/S
         HX6FA+iqRCzZjfvYoN60gvIEFPfOtYhEvbSItzyY/1s82v/ef1f89vE4JOZrg4myUIpG
         uxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664743; x=1791269543;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmI1Zh6FMfvKYDLJnlPfHK7JTmlcfSeOLA4xkGboDbk=;
        b=Egvm5aRQixnYGek6e3w7iGsvwk2o0mV46VvjgCWLbGXSMXhotR6KEAM/Up95UKvEKf
         4Kqek6z61GfSUR+/ye7BOASFPkl08VX9TjXFhpB+ycLpYlRfFfunBwNwvv3f5PfjN93D
         wCp/PTJOjwXKF01mbLL6es7j1R+H1Af8wVYFeFpl8ekBHgs/Qyfi2X2YiHdZ/bfP0Xgk
         1yuKvCE2XPej+BsBoRWuPeP5y3+HY11solJWFrA9E03vUB2vBck7XxgVmv015QnUHTtG
         7nBShuWrGviL19lW7SYZ0krhgbB/60f8Ij5mzGwU3sGAijt8ThQZyX9M4AjHzUc55Z3C
         P/Mg==
X-Forwarded-Encrypted: i=1; AKwUvBwwExCmgS9DNTJdh/eeu0shjlfgObAVB8ubpR/b5wq7h0ZqAGA1/7e7DtNMgBK6BF85+qTLOdUYAjI=@lists.xenproject.org
X-Gm-Message-State: AFuF++kqQsCvsucOrATLJsdAq8s4jlTFx8brW9oRjg1sCGcdNx3MdbJ8
	23I1wGkKKTw+68ArowBxj/F9q9qCft6YcAIlIV7eeYSBlm9aC3607r7bU+zkVMgAAw==
X-Gm-Gg: AYBFou1t7Ab7wvfhx6f8GIFK4fm5PWa6f/LlrMCgFUY71fAYj4wFL75l2VK80aUlyxL
	XgeQ84xmATFt+4Ug8Hiy4cc8NXZQ66IXZqOi9txr+mLnSGWvml/PXFZmNwEk28aNmbeUVPTSkWY
	edVc1Sa/YF4kPQutjGz9f0KkJQ4bDDIhdpo/Rynn/WgtNkj6cyUkuPa2bQQQCmCIHx0KMxHb+oi
	6DxQkGfrncV5QvzN1DOmlrmCOUiGdU5yihFG0Mr7oxiDVbeGoD8IosijP3D4HmrOXSWKduTW1Zm
	2o/0O30cf+V9ObgwdHtwtazREF4UqwsLGAwgCB80sgFfWVPT91RRKLF9ku+nBlogzhEoxcxp3fU
	ywV9SIQJ0rZZ5z8Y/yYYy64FcixvBaIvMojDhAtGNMlgQJJYcpcqDiCdiMtYUOGRte5QduNHtlF
	LrF8JJLu9tBZJzyb9DD4zfH1wIjQUnfigJCbF+cGpSgMDa1moOgEzHhJpoQV3VYlOWT89eJdaDp
	5kbb587tXekhKSNcMEDJZ5/wZ5LIfM6bDLE015Kx/iAL4c5+O+anoPNihuaJyE=
X-Received: by 2002:a05:600c:c177:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-49fe67080b1mr277977555e9.31.1790664743329;
        Mon, 28 Sep 2026 23:52:23 -0700 (PDT)
Message-ID: <79de1bea-7e1a-4d15-b7d2-8390ab5bdef2@suse.com>
Date: Tue, 29 Sep 2026 08:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] misra: add Rule 5.5 deviations for macro clashes
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1790661461.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <cover.1790661461.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1790664743-BF46D757-A844DFE8/0/0
X-purgate-type: clean
X-purgate-size: 469

On 29.09.2026 08:21, Dmytro Prokopchuk1 wrote:
> This series adds deviations for function/macro name clashes where
> the macro is used as a wrapper around an existing function name.
> 
> With these three patches all ARM Rules 5.5 became clean.
> 
> Changes in v3:
> - update wording with specifying file (constrains)
> - add Jan's ack for the first patch in the list

I.e. you took my reply to Bastian's comment as sufficient to address his
concern?

Jan

