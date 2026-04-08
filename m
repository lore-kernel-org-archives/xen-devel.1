Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B851073CB0
	for <xen-devel@archiver.kernel.org>; Wed,  8 Apr 2026 13:11:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1276098.1561699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wASgK-0000b4-EF; Wed, 08 Apr 2026 13:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276098.1561699; Wed, 08 Apr 2026 13:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wASgK-0000ax-AY; Wed, 08 Apr 2026 13:10:56 +0000
Received: by outflank-mailman (input) for mailman id 1276098;
 Wed, 08 Apr 2026 13:10:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wASgJ-0000ak-HB
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 13:10:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wASgI-005LQL-TP
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 15:10:54 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d653c9-bab6-0a2a0a5309dd-0a2a4505adcc-34
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 15:10:54 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d653de-3760-0a2a45050019-d155802db8a5-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 15:10:54 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so50971605e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 06:10:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d282esm58133102f8f.18.2026.04.08.06.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 06:10:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775653854; x=1776258654; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/EqXdAz4Z1r0fJ2IUFEFv5ntaUz0uYkqQDuLdrMcrSo=;
        b=JL7J3StYdYbIZakCkXbksjnuCN5Do61v+51QhURC23iW6R6Smz4tk0LM/TNG+DULmb
         m1DmfMCR3Czydd0bRW/XD8JcYkCglMZJ5iBI972yU0x2le/Au+ezE/Isozyw00Vu0hu7
         sOQT46GZmU9zorPiqf8pSkL/ewcZ+nFTNbP+3KjD8nxVN1GBJSec0T8N0uoESqC+6pUg
         HVeaWtY/9qfpIeWDN5F8LILr+7zyM5k5NP1qCkKoqMOfRC622yISfe4tlb5kRgGmFXk7
         SV1XtrKW7KTqxomiHfh1XQJhBz4+m4cj3I+SICV4wpuUPN0So5IXLDrYavh1oy4CJZsn
         ZTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653854; x=1776258654;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/EqXdAz4Z1r0fJ2IUFEFv5ntaUz0uYkqQDuLdrMcrSo=;
        b=M8FEP12JS6ovDdah5bkYZHk2jP4beC86RgmFsF/y3Vz9IbPYh6JulZQwXTDNQbfs0I
         5Sl4/nffvHRqvCoAsQC9e1s3QxMy9ff8VoNZSkhVOQOFglnyp9hMXfRESnZQpBUaZb4M
         r6hKHVNYLc5MQDosFkyBrXTwxWcNg96gwaD8rjoedWicc2KKvWPkWZa8/a1m7LzLZ0i4
         2WeIj1Yrsle3Ctn1Ue25SGibc63Wfsy8NpJLF2CnEjoWrksGh5ZzSgyzD0++j8azlehP
         3tz1+iBkYnhdoZZRlmib7eORQmDupU3alrHUICJkvn6DbzNosKtmANI/im6XhSWR3Suv
         MenQ==
X-Gm-Message-State: AOJu0Yy4nPU0iJyvlk7zyiJnEOZRsmi11f79lKJZFERGNO7hPFECt5ih
	fhj4wBEnpBPYJ5mXLY7evINIpzaZZsaDPfMYK6F5XkRXnTOLqMdDf0xq/BQfnxqcHA==
X-Gm-Gg: AeBDieu92FE/GCoO0LRyRYMOTvSveini+/0MD3M+0EJboxUcu7yIA/AFpK4CsD4oY48
	F3UU0jNiDKhrIPXfrQOzvHHACOaE8Ndf3HsywhXnb6qFIb8QlvqXwL/Bghxxm4z4ooItuTbMspA
	wISA40ZA71Xw8MjAdE0Odv06XZfqD4PABxyUcVrmmrmiYHUlhPtfY2X6Iu/eaIhFL9KQ2SC+uMR
	aUoVm2JWxlnZiAgCjrjOFomh+U8e/ajpbkOhINbbP/e4pATgebUAxhwJcsAJYtMBGBrqmJOfus6
	Fao78rm91Xzlb7ffhN9QGgJ8saAxARaApY1czVXjHF5La2F0PS91COnf5afyjgAjBHE9uhycCEJ
	P3nfwIaz+bQ0SP8H/PJ6AXH4byrgOI6/xtfUm63zfajBIO5YjS0f2vlMWrhCGIvggAc+PwrJf7a
	uGMHIUJjYN0HrxPonK8yRUGWKPI3vEGAAOKloritzW2eLldjr2UFJlmfPCs07ZIsSTddl/3TPTx
	Kvmj6UXqn54sKeXlu6va0ujDA==
X-Received: by 2002:a05:600c:4593:b0:485:33ad:3c9f with SMTP id 5b1f17b1804b1-488997de1c6mr325627405e9.25.1775653854286;
        Wed, 08 Apr 2026 06:10:54 -0700 (PDT)
Message-ID: <13f9a1c9-5722-44cc-b044-6bdbc7e845a9@suse.com>
Date: Wed, 8 Apr 2026 15:10:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.21.1 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
X-purgate-ID: tlsNG-c201ff/1775653854-2233C96F-1AF07233/0/0
X-purgate-type: clean
X-purgate-size: 449

All,

we're pleased to announce the release of another bug fixing Xen version. (A
little late, sorry.)

Xen 4.21.1 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.21
(tag RELEASE-4.21.1) or from the XenProject download page
https://xenproject.org/resources/downloads/.

We recommend all users of the 4.21 stable series to update to this first
point release.

Regards, Jan

