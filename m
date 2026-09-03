Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA6EC624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:50:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406964.1640130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25xh-00063p-9B; Thu, 03 Sep 2026 11:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406964.1640130; Thu, 03 Sep 2026 11:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25xh-00063i-5Y; Thu, 03 Sep 2026 11:50:33 +0000
Received: by outflank-mailman (input) for mailman id 1406964;
 Thu, 03 Sep 2026 11:50:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x25xf-00063W-Ix
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:50:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x25xe-003X5g-Vo
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:50:30 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995f01-8faa-0a2a0a5109dd-0a2a45088776-22
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:50:30 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995f06-f659-0a2a45080019-d155802acc25-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:50:30 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49b8f86c6deso14395385e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 04:50:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee5e589bsm60672885e9.13.2026.09.03.04.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 04:50:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788436230; x=1789041030; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k9h9oHU+S36j2cjWBvNjUlTULYo/gLK7sSNoA04XtJY=;
        b=djmyUrJ5HVEerDzRtSNQL4wClG2motAz9K+7EDYl9Rjv6GjWScHqMM6hPAyrs7n/2I
         7ry1uViP5guu6w9yMUnlEU3TxnV8qdbQKUO5feWoVPzHxi/EZbkvN3eav8H0utCF96dc
         emCpCej+IyfzSPSKTIG7771s20MTCiJP5oO6CbCsQiqppPHXzvg9Srj/G1Fexqmk8UM4
         LnRdkN2gEfKNWDsbQuWgFeBApvT/h/eo8ARhGCjCfvwjdPgkRb5JboLYjjJ0paYT23ts
         saN3vyfLZHr+mmcpQE7Zrm3bbuzvQLDhXhDf4JKyl5L3L2eqmiSqNhk8joZKkPu6uXYW
         FLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436230; x=1789041030;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k9h9oHU+S36j2cjWBvNjUlTULYo/gLK7sSNoA04XtJY=;
        b=koNX/q4ySnlXIdvQYOICRW3/AEeMnhhsFMkMqQEPpqHzb7yxASf6kF6iHLKLLkIgGJ
         IVT7GB8fhY8znO9vAU3cCvhvArPn0v5bo9bvJr83N7dHmYc7G1fFTM/8IfRdYx4gDY7C
         AjxKXOQH9HewxcyRk0x5wynAfoJYNrGAGaa3/pWrUrWaAucgX9gHlxJ/7OaVIWLO6pP8
         eXPBi9y9Q8ppaKX6Nm2dnNVdg9zqrWeUoUwwyburgie3Rnkp0dkwbI9E0zK8wuwQ4qqr
         Afqr7LnPUej6MmpDxitOxQc/omVUOXanHppE0JQCvQbWezUng/KVCJI52wPifbW3d6mE
         Y69w==
X-Gm-Message-State: AFuF++lQvEFDcoyD5Js+qx24z9Zv+ijZRGFttmUoUCVf3gzddVMlzv6B
	TyJfuI8Sk4LGPJzhmxDvidlT4NXOluxCXJ+gBF8x/knhW5fHaL/xrf550VLVzN6EzQjvpdE+uw4
	3VGa62A==
X-Gm-Gg: AYBFou2KBH04oE7vEjRupROYlhScwBdS17/1R4cc9WYdNazZeJPxFcJwPWe1VadCja6
	Z8GF0xT+Ru77qc9mNkzNHTDcFr2i51kOmd4KgvlZMJdpoIiCSL/MtVEe+s6NduHAYMpjFG7bzkU
	Sfyk4Eg/Lp7dEfv1gKQSxJIGdMWkU7e6YGPRuM26fGP9zmstxmakm1uCMZMNazMxEWkbrpLi/cB
	DbeZkp/WfFzcbttB3pQgRL+DYKIw4Imtpayl5y0ZXXs0CTSbmNpQYto9Y6ed474cGFY/0ymgMaM
	NwV6g2Crm+/QIms62dbpz/Gq0i7+FMJFmLvkW2u11RfyFqcGEMteAtJ+ZWdWopw3ePv7x4jVCeJ
	130tUkdPJHXq0XI85uwc9/+N9edtRtXiiY5A38+2hrrh06wwQlfQARADZE+1PPRvvxSNhBbH11C
	lM2oYvGvb4k9pbGTcdoUGyNQKXGdnb4MfPeYtT2YjW0AtFt9p7NRqnzg7JKz8Tl4UxG1l9VlyZc
	weYSflswrW7dW5ByFx68foVYlsI247q9JUt9dGg74ZfN0HFnzxy
X-Received: by 2002:a05:600c:530e:b0:49c:d618:e341 with SMTP id 5b1f17b1804b1-49ce584bb4amr232397715e9.14.1788436230391;
        Thu, 03 Sep 2026 04:50:30 -0700 (PDT)
Message-ID: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
Date: Thu, 3 Sep 2026 13:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/4] address remaining rule 13.1 violations; mark clean
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1788436230-CEB4187B-B298C9AE/0/0
X-purgate-type: clean
X-purgate-size: 300

"Initializer lists shall not contain persistent side effects"

1: x86/pagewalk: avoid ACCESS_ONCE() in compound literals
2: Arm/guestcopy: avoid use of "current" in compound literals
3: sched/core: avoid use of "current" in initializer lists
4: automation/Eclair: tag rule 13.1 as clean

Jan

