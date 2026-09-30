Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FBCCA5FAC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 11:41:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437082.1655839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsgD-0002jl-LN; Wed, 30 Sep 2026 11:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437082.1655839; Wed, 30 Sep 2026 11:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsgD-0002je-Io; Wed, 30 Sep 2026 11:40:57 +0000
Received: by outflank-mailman (input) for mailman id 1437082;
 Wed, 30 Sep 2026 11:40:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBsgC-0002jY-Rx
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 11:40:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBsgB-00FrNB-Hj
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:40:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcf547-bab6-0a2a0a5309dd-0a2a450be2be-0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:40:55 +0200
Received: from [74.125.225.106] (helo=mail-wr2-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcf547-b7e8-0a2a450b0019-4a7de16a809b-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:40:55 +0200
Received: by mail-wr2-f42.google.com with SMTP id
 ffacd0b85a97d-4888598e4f9so3694855f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 04:40:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0175208e0sm47057405e9.7.2026.09.30.04.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 04:40:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790768455; x=1791373255; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BKv25W+wNFvUZ40YVGcxbcz6QStRfSo1tSFyZ8FSdCU=;
        b=EQGBlYVvoKDn+9rJqoKoR8TE8CPO50yyUZOiD5WTuvrmn4pWCG/FtMxCf9A8bWXeKM
         xwH2tAodDRCetvA9NkPp4emwvp6x98X1Hlh2cjV0eN37W+fSxU4HIg5crTmRYmfGwwaO
         4w7qclAbrd6Ny2eQLPSsbgk4xFePnNt/pYx0XkCFjZy2OhNilk43OfwvSjrbJl4R4+Aq
         xJPyxqAo8md6RC89F0vkrBqMME1buxdqXVhkLnheMA0YnxURspIIG0cYv98FYZX/ykeL
         OoLv2sFEFhm1ewjWZanlDYyml2sihaAJkw73JWLhY+vcMeE/4mkAYojDGe3MHByzGh4w
         HoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768455; x=1791373255;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BKv25W+wNFvUZ40YVGcxbcz6QStRfSo1tSFyZ8FSdCU=;
        b=Dd8S4fp+AMFi9xfdnimbYMrYq6JKvc8qjk7dLXY/ILSe8x8TKmhdu7uB+fboQV0oEO
         CXsS6xxGXLJpDj0UosqZ2FGP7/ALb47JlC0RKSUGiQe6t49Chk5a+Uw1yYYmAfeSI2sl
         c4F9n3DqFykXJV579HTT3bSRc0vrN3chmpYTpOGHqL879WvI9yoZvjjl2wv4ALDtFJa5
         uAQT6WXPRSCusZm5xLCDm6N8bPmqTNCBrAhRZLt7rv7Y+54reqQBnWWV7ntmss/VpCtt
         VjF09VDrFfr6FTa2IB+Q9NWEHq8xIxC+AlxYB8mck3SzfqKD5CftdZB/5eDNzuCZcNaB
         b18w==
X-Gm-Message-State: AFuF++ncXR6vD313xHZ0ZX0kSbfvVIw9nmJvYHKpVY6LI+kKqhhaDJEk
	KMj/eV27iSS9sunoaTA2dsmAP6oaG2k5lFQQoLnuQClxendKPs3E8Ht56TbBnSarpEy0vrZsqwz
	WaQTC8g==
X-Gm-Gg: AYBFou0iqM2nTWWfIyAz4sh5+6tW8OjQrZLisYZDAgBNqx1LFZ6FsB4CcvP6jSk0fD7
	eDyEo/lKZkXw8hWscFPrKtcKEPVrd6YCpRl/DypU62AJqtyY8A7Ei8pSJehKey8vc8L5LrOn/eB
	LBUsiXxko7LOjLs8zXfQBRZJHtB9jJmflI55rXLonlju9gMGiDfBUtdXUml2rIyvyk8HVH6ivbp
	k/pI6Dy0lP6VczVPYBOKeOI60w8eGzBHjft3sJW19+vVITG1PKpiyB/9xefDAqSu6YRa9jHGvhP
	Opjjc3/t8tluieJfRpYZhN+RUTWHxW/UJOZlwUsCSdMnfEfZG9eYDbI/aWooM38dSeb4pHxHb5v
	njHH7B0LjR+pULvCh755AN5GjWRY9UrJNd1uLS3LdCg21fjDRMc9J3Jo4XL3GgG+JGZi6BKwP/3
	F0++ViAblFclUE0otmdp+zPdP5MGpgfrBAQ9pD4R9wakRbenzPjbzb+2siXSMbtHo6yUltAPTD6
	VRQn/ZjjH4l6yPuZ3ykr/5+aIxVB3CN+ZuTz+E3Il1cwC3SPMwLRwlCrJFowG3PyFd6ElIl
X-Received: by 2002:a05:600c:8b88:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a01ad98373mr18682815e9.4.1790768454825;
        Wed, 30 Sep 2026 04:40:54 -0700 (PDT)
Message-ID: <e34484a9-03f8-40f7-8627-7d5e668dbd63@suse.com>
Date: Wed, 30 Sep 2026 13:40:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/5] x86: pass-through / {,v}PCI locking
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Content-Language: en-US
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
X-purgate-ID: tlsNG-42698a/1790768455-A9CC79EA-70EBD1E7/10/78276251493
X-purgate-type: spam
X-purgate-size: 442

Now that XSA-509 went out, here's what actually caused the issue to be
noticed, plus some follow-on cleanup.

1: x86/pass-through: alter locking around pt_irq_{create,destroy}_bind()
2: x86/vPCI: tighten locking assertions
3: x86/pass-through: use simpler locking primitives in pt_irq_{create,destroy}_bind()
4: x86/vPCI: make better use of "pdev" in vpci_msix_arch_print()
5: x86/vMSI: avoid "goto" in msixtbl_pt_unregister()

Jan

