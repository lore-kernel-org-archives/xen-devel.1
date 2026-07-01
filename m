Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72234C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 11:40:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1349828.1607464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wetIQ-00076p-GO; Wed, 01 Jul 2026 11:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349828.1607464; Wed, 01 Jul 2026 11:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wetIQ-00076G-Bq; Wed, 01 Jul 2026 11:40:02 +0000
Received: by outflank-mailman (input) for mailman id 1349828;
 Wed, 01 Jul 2026 11:40:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wetIP-0006su-Jh
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:40:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wetIO-002VSd-AA
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:40:00 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a44fc87-bab6-0a2a0a5309dd-0a2a4503bf78-18
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:40:00 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a44fc90-ec1a-0a2a45030019-d155802ee5e2-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:40:00 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-493ae59eca6so4128385e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 04:40:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bef183e7sm65447665e9.2.2026.07.01.04.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 04:39:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782905999; x=1783510799; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rYKAVaQuo8eKKWDrMgIyL4y5Aht7RlfTqBfK1xy4GQY=;
        b=Ep6++e/yG73TEZHMv10k5+vFmPgLdOGkkkG/KClO+U4ozE+0bfNy7+dfnp+pormJKy
         Q3VGxJezZ0JyHNTOx7KQj9fwrubz/iqiqQtkNxLjvrP6S4LPkIoaFY4nSIAfYu9+FJbw
         RKTjBC/henvZQV8vE5NLEqBXlUAm6x9SX/goT6Fb/iSJ9qXi3KrmFZE+zSo0XgR8tHYF
         qBu3J7LpgEiSMBn3UU+kKd591cLH+K5ha3YKePMKap+4uCX42khhQXF0K0qVpKlr9Fed
         6lPav/hcPgpmEF1AckesVAOhK3M6YCfkdaRN+gK3WyYvc397K2k/up2VhH5f2rLqmPTU
         sDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782905999; x=1783510799;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYKAVaQuo8eKKWDrMgIyL4y5Aht7RlfTqBfK1xy4GQY=;
        b=ni2adiMDXxkQLlwsCby6hQC5pYEpd1ZkQUU3ouek6bKnxKCYDkK8CBC3Z1THPSKI5W
         M8AFzyEyTkYisXrF2fUvG0tnGWBd35Ngz0Cc01cKwvS82L8kvIbzfi0y8YTEx7V8mstH
         CUke2ahYDq/RmUv1uZHwl5QmRt8T/eHvsyJP+4eJtafDbsF1VID2DFzKmhTwvvCTUQlG
         exbWaL8Xlr9RDse2K2EjXw+xLXGwdw61uck9CeparoKwacydGR/+EcwJ1Y5zFAQ7kniB
         7SRv2MPAhNeVAltO6ZktLPUTIlISIB39GnQNBihTT+wlA9PV+EbWmzT8goWN5ZGxsaak
         fbww==
X-Forwarded-Encrypted: i=1; AFNElJ/bMryzsC63Q3y6V2ZXQRN4quTwJ7Sf1eZYK43EW/PQTt4ybrNEpbwhHqi7+Fu345QCtiuBMdvTPkk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwW0AEBMJe9FG7RF0xZ0vrr/F5DBdjMOeC559Ri0PUsEv/Efan
	Delcto62BVOGsfdibwo1kBsv3GGs5jKdrCrxwn4n7FPRUPol0rt3I0x5IVw/IgInqw==
X-Gm-Gg: AfdE7ckDjSfByPs03F5+L/2BqzhrBaqQz67KUSsBhLvh3wKabCHLF7ACkUcJGloNfth
	PmrKxFAiKmKoLK/fZ9fOfnD4sGOwOWFMw35mHNZm78nR0hRYrZ6qGrtAlVAl5d2XthTv8vsHU/8
	ibhHofuuzVvJxndnQV7pmBJ5Lss7Yq0MnYZmlnn6cp/JkMQGNpbhQOay641dayrhATGOL16G7Xw
	G0EU3FzSH1o2Un22FNmocDLrNfYJOZId3csuvWmbxNkUpabr0CDNYCuSuom1PBBivkAMxw5Xe/J
	xuaReWuZQ8yHnmVn8niq4LNB5yaoZMk9cmkplA97EpYehqfh6ugSiZbMPZ+nvKa3toULvQPJuc+
	xN7dKBfQk509cnezq6/vJGz4C7+pg1lkBvx3VoHneCb9bhK/qExLSGSdA2lnKgdPPkdbnUJDAch
	ieHV3l8T6PXx92mpLG0TrHoCJS/pGSLy1mMbHf5zWh5KGpZbJwX15+movcY+USP3GFcux1XfZRo
	VWy
X-Received: by 2002:a05:600c:5292:b0:492:3754:15f2 with SMTP id 5b1f17b1804b1-493c3cfbc7amr2855425e9.32.1782905999644;
        Wed, 01 Jul 2026 04:39:59 -0700 (PDT)
Message-ID: <4e16c1eb-e1ff-4d7a-bfa8-223d357716ee@suse.com>
Date: Wed, 1 Jul 2026 13:39:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Change XEN_DOMCTL_setvcpuaffinity interface
To: Juergen Gross <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260701111606.4063972-1-jgross@suse.com>
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
In-Reply-To: <20260701111606.4063972-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782906000-0672E5D1-AE22DE4B/0/0
X-purgate-type: clean
X-purgate-size: 1140

On 01.07.2026 13:16, Juergen Gross wrote:
> Today the XEN_DOMCTL_setvcpuaffinity hypercall will not only change the
> affinity settings of a vcpu, it will return the new effective settings,
> too.
> 
> In case an error happens during this hypercall, the expectation of the
> caller is that the affinity of the vcpu didn't change. This isn't true,
> however, if passing the new effective affinity back to the user is
> failing.

That'll be the caller's fault though. Any -EFAULT coming back are an
indication that the caller needs fixing.

> Instead of making error handling in the hypervisor even more complex,
> just change the interface by NOT passing back the new affinity. It can
> easily be obtained by another XEN_DOMCTL_getvcpuaffinity call if
> needed.

At the expense of further increasing the pressure on the domctl lock.
When making the recent error code change in this area, I was actually
wondering in how far these two sub-ops might also be candidates for
moving out of the locked region. Yet with vcpu_affinity_domctl() not
using any locking that didn't look entirely straightforward to answer.

Jan

