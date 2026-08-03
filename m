Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9569DC55179
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 12:35:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381444.1625022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqrsi-0003Oj-AD; Mon, 03 Aug 2026 12:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381444.1625022; Mon, 03 Aug 2026 12:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqrsi-0003Oc-7B; Mon, 03 Aug 2026 12:35:00 +0000
Received: by outflank-mailman (input) for mailman id 1381444;
 Mon, 03 Aug 2026 12:34:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wqrsh-0003NR-9R
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 12:34:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqrsg-005IeJ-M2
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 14:34:58 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a708aef-2eae-0a2a0a5409dd-0a2a450cc58e-22
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 14:34:58 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a708af2-f479-0a2a450c0019-d155802fe025-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 14:34:58 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4956242332dso18003175e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 05:34:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49808690ffbsm256801355e9.10.2026.08.03.05.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 05:34:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1785760498; x=1786365298; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=69n3Og5xkKdvFQyeK95WwlJPqVsgYp8WOb8rfW4Bplc=;
        b=HP9ThGxsiSh1MYpFH8qbApBaNOIDJhCPrw+KQn5N2x6QWQZF4EmzDdt7CftEohtDF5
         VRPbOJfgPjGR7oNe3TgIqqPYXoiDPdO9JSXBrqHxVSbkQBHdZL27jTU2tg5IA+KSqSZb
         FGbz2TGtQ3+6tAQ+yN9L8awbGYUznmtgyLSlmFvJE2+ERfpGdugS7K5/S1qPdF3v8B91
         KsynlmmVtgVW6HcaYGjuLv1djOOWiHHoeqqzePEF5DeMNWLdkGR50ADWY28DveAVOyEU
         oniI173F+Oj2pErDJRyu3vO0MYRoPkVntEJi+r5bGElKJJIWkVQFoQld/+Diy9kI4hj8
         tQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785760498; x=1786365298;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69n3Og5xkKdvFQyeK95WwlJPqVsgYp8WOb8rfW4Bplc=;
        b=oTVzMY4k7ck0FiNo57VHVAF5GQnnBkj+L1pBtUaJUJWNynsUc17gATXw0NkNrChLl5
         ukPn/Y5a7YJvX/FFdzFy2T9OnXDMx2cqHGb2v3QLNX25dmNqCv993j3atO6PKD33yZvW
         eyyT/nlWMtjR8pgi9W6f4tylgQhtLjgjMEIXsEA4m0lvkaFoAFR/oVlNzkD5BKjUoZQW
         DcIkZad9dSQOhKKDbKVCAf5cRRzxh+nvcIEhKIJuHf9x4z9uUUkjvvnVx0PupUXnqzJw
         zqP6d3rHOeENx4H2hjHyvZ+qWyLRtM3u4K0Y9k0l9wXWMs3JcDfC4tJf2QFKBKHx+YhZ
         G2Sw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3SaOuIywit3c2maQE/rlUEwIcbgGUx7mP0TJaojdx3IEfp02TnR/biJmzBMYJWYEMc8xDZuK09p8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw11lWxIroyrVad8wqTAcEZmq1PRyo5ZJrvWh9jV8sw9gxG/R/8
	LTfgiS44X6qxNboSemBbVKZr+xI1kKhvBhso1NK/p4qPbkpllHfQURvOW94oQYKvo0IOL9+buhF
	PWG/AvA==
X-Gm-Gg: AR+sD11OmaNxhZQ65FY6V34LBNj21A99Jdk+kIMiiSMZNZXJegNq/djxOAVLcC408pz
	XSOXoEc4175Pj3aiLF891qZu/BO2O2yFwRWW/BPh+SkBqZPVK9HIiFt2g+9ho3Axsa+WB5AAcyS
	/HwMiHGYFdFzb4DJM1XfEi+l0Aaiav3fWn4sWm92ddLo/SDVjTHGJAL1pBhPDqZMtglIrPxP3Pq
	ETzxKq43EnSQao4AT4S548RBv37dJBW3tCxbAcTm50g8fxZU9SQiCNkBjyg6PV0dmLwxAet2LaJ
	aZiPGico3stNhH5OAHfXfOM1S286eJJgqqCLcMojWciz196btEXRJA1oKPZGIMOOyqH275BBpfW
	H6zbgd9kO/W7akIQAI7v1t7ED5GP4Nf/xu5qRYfLxX7ZI/NNEp0O7E/g7vxp36GS7GgTaCMNot3
	3hZ61Iq78wprAMV37iCQeY0P9/KgaB3ezzIqCKySGy25D2BiNcx61F2t5inBDyxQ6aULfulmsGD
	mVtdyXtCCwu8/nq9cihWVMx9Mp+F6jJfqjswkC5sJfHuLhdRX9p
X-Received: by 2002:a05:600c:840f:b0:493:c42e:5be0 with SMTP id 5b1f17b1804b1-4980c60705amr202123705e9.0.1785760497947;
        Mon, 03 Aug 2026 05:34:57 -0700 (PDT)
Message-ID: <9ad2867a-3d01-4ff3-bb9f-d89cf9d4e96c@suse.com>
Date: Mon, 3 Aug 2026 14:34:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/mm: Alter get_outstanding_claims() to return
 information by value
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bernhard Kaindl <bernhard.kaindl@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260803121739.370951-1-andrew.cooper3@citrix.com>
 <20260803121739.370951-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260803121739.370951-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1785760498-004CFA5B-D56C6D9E/0/0
X-purgate-type: clean
X-purgate-size: 1281

On 03.08.2026 14:17, Andrew Cooper wrote:
> A void function with two output parameters is a weird choice.  Instead, return
> a two-element structure.

Hmm. Generally in reviews I'm trying to recommend against returning of structures
by value. I don't like this very much here either, and it is (slightly) harder to
use ...

> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -248,6 +248,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>      case XEN_SYSCTL_physinfo:
>      {
>          struct xen_sysctl_physinfo *pi = &op->u.physinfo;
> +        claim_info_t claim_info;
>  
>          memset(pi, 0, sizeof(*pi));
>          pi->threads_per_core =
> @@ -259,8 +260,11 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>          pi->max_node_id = MAX_NUMNODES-1;
>          pi->max_cpu_id = nr_cpu_ids - 1;
>          pi->total_pages = total_pages;
> -        /* Protected by lock */
> -        get_outstanding_claims(&pi->free_pages, &pi->outstanding_pages);
> +
> +        claim_info = get_outstanding_claims();
> +        pi->free_pages = claim_info.avail;
> +        pi->outstanding_pages = claim_info.claimed;

... here. If others think this is the way to go, so be it. But I'm not in favor.

Jan

