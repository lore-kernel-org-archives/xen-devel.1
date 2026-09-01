Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63408C61DE4
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 06:36:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404447.1638122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1I6N-0001Bz-V1; Tue, 01 Sep 2026 06:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404447.1638122; Tue, 01 Sep 2026 06:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1I6N-0001Bs-SH; Tue, 01 Sep 2026 06:36:11 +0000
Received: by outflank-mailman (input) for mailman id 1404447;
 Tue, 01 Sep 2026 06:36:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1I6M-0001Bh-M5
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 06:36:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1I6M-00H4xo-2n
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 08:36:10 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a967252-8faa-0a2a0a5109dd-0a2a4508bf9a-12
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 08:36:10 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a967258-f659-0a2a45080019-d155802bc515-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 08:36:08 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49b8ce9b733so29945385e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 23:36:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce1025asm42904865e9.6.2026.08.31.23.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 23:36:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1788244568; x=1788849368; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqrJdKWIw6zoDRGWnhwZfLuJsTxCwJNCeEEC5eWASrI=;
        b=BjJ3s8nGWV2M66/dnUblK2SzlNVwkc0RqsA/KC2WyBf1JPUkdA0dquQ8etFuzShIBk
         BaKofPPLGXSSzc4veETytPNCKk+7FDJFxhmIM4l1Ltqq8Gc1smoge397KgVJjhCOz4vT
         bu2vohgeopbiOTBH1FwpJhLMs2CecLu22nEmdD/apNH+cK4gM+R3sEkVuThWWSNH/Qo8
         8B8o3/jBrWvKb1paO0vCtVrazGWBQK4FjwGtdsl1R7XSQXhUFA1M9pUDFQCW4jPw2Enj
         3JvcmKIvuSjl7ODkOne8zgTt9QOr9TF/PDQZtQZ5kcvkvUK9NPch220HsTIdAkD/ZL4W
         neTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244568; x=1788849368;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqrJdKWIw6zoDRGWnhwZfLuJsTxCwJNCeEEC5eWASrI=;
        b=XhA/+pcxesPlphIzjzeXT8sZsq4HPggsMvfL06x7A3Y88L8QCLG00HGXCE4PjcO/Ur
         0FKQdkiTuHEZ8JfSTVc9k3eIkPE3llx7osn362o3ao7Bco1r35syd+PXwF58SxA12pmp
         vy1E8YMpuUVk9+nwKTAxEYbOM0ym4PPb9ixPkc22lXxMhoYoq3uaCWSvTFqBTjZKHTCl
         TZcoGp+vbhvpK5WkwbkM1I0459cawf5YWE8dhvBrQ0sTAL3UuDF5CtDOoX4/rY6xIxRf
         HDP+iwciXntpzydov1cCIJOrrgbT+ECSiFmgvT3HUezlWuGW+mSWQ++L6GTuoRex+QSA
         CoMA==
X-Gm-Message-State: AFuF++lPoFATFVdC8A2V5OFoHhVSvhP1MMobew+qbbD0ScjU6/4JcaVM
	HDIHeB5N9gXoOapGi5lWUwUSz5znnf0Xjv6H/FgIZy8NJ+7AEcHeFYmRI5SVo+W2Vw==
X-Gm-Gg: AR+sD13dZd75Qq2xVEaqJfZunSKgp2s6br70vBTiqM+tNTOQ5wJL5qIDN5RSz9JTPCi
	nUSD+eRkDmxuwLNgsNY/GKRLP5z2mIXo5bIAU350sfrZnnpWvjmBcOpmFhRSwogwoH3bUKqGl1g
	zqt3FZlwm+k/XbpxtjzTPk89pF1O6hoHlTTVxzCTSw3ax0Ax+pAf/M/EDNtCnVQAtZmn2X/mefc
	aeWfGZbsx+E0LFWBjgwZHT7JlpOJeT6vQyl8GvY+rETq3GKQaf52+RxHL+rpyVCENAREqA3FLnc
	GofCNN2n4nYcK31nNgQ8rixr7AXcTidhcBVP5pHdQUVRFVZByKLes1FXe94fzIrWjMjFzvXdHyq
	covXG/pY11kHFA8uY1nGEgeYvm//9Oa4aUp7yxzHWcV9hn+x0DH6L6M1tiRBG9f+awlkDzhz9t+
	6C7xTBa7FFX8RNZvWpBfSv2psXRsg/lQAOB/U14MH+Cowz0W/WNh/3+CjLH5IPgu+E4Il+Xp4Hr
	FdhcAR9Taxm71chM1ZmwhU74GEK66N7bx77WyOJkCTCoGTOYC4U
X-Received: by 2002:a05:600c:1d0c:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-49b91c3e67fmr447976695e9.9.1788244568228;
        Mon, 31 Aug 2026 23:36:08 -0700 (PDT)
Message-ID: <99c30685-549d-4118-87bc-41d441ffcc3d@suse.com>
Date: Tue, 1 Sep 2026 08:36:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] Eclair: deviate BUILD_ERROR() wrt rule 2.1 and
 introduce variants
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <06c5efc0-e130-417f-8333-b8eacd1c6d77@suse.com>
 <99c8a63920c37dafdfeb2a2a4333df72@bugseng.com>
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
In-Reply-To: <99c8a63920c37dafdfeb2a2a4333df72@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1788244568-CC97287B-50A4FCE8/0/0
X-purgate-type: clean
X-purgate-size: 1072

On 29.08.2026 16:04, Nicola Vetrini wrote:
> On 2026-08-28 09:04, Jan Beulich wrote:
>> BUILD_ERROR() is even stronger a guard than assertions in general, and
>> ASSERT_UNREACHABLE() (or BUG()) in particular. Deviate it just like 
>> those
>> to allow use for marking unreachable portions of code.
>>
>> In some cases code being unreachable is dependent upon configuration.
>> Introduce two variants, as constructs like
>>
>>     if ( IS_ENABLED(CONFIG_...) )
>>         BUILD_ERROR("...");
>>
>> results in the if() still being reported as unreachable. Sadly these 
>> two
>> new macros introduce a new 20.12 violation each, which hence also needs
>> deviating.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Thanks.

> Presumably you did not fold at least one of the following patches where 
> the construct is actually used into this one to separate concerns?

Partly for that, partly to keep subsequent patches possible to go in
independently, i.e. in any order.

Jan

