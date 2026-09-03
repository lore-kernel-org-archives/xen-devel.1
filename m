Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF97DC624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:42:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406897.1640058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25pg-0000mQ-SF; Thu, 03 Sep 2026 11:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406897.1640058; Thu, 03 Sep 2026 11:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25pg-0000mJ-O2; Thu, 03 Sep 2026 11:42:16 +0000
Received: by outflank-mailman (input) for mailman id 1406897;
 Thu, 03 Sep 2026 11:42:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x25pf-0000mD-Uu
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:42:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x25pe-007F76-3j
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:42:14 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995d04-2eae-0a2a0a5409dd-0a2a450c9990-44
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:42:13 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995d15-f479-0a2a450c0019-d155802bb0f2-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:42:13 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49b0dbfbf7bso15419765e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 04:42:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee80eda4sm64236985e9.15.2026.09.03.04.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 04:42:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1788435733; x=1789040533; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=npp0ub55aNlc3rwTuV4j9Tb9YtvYLeH4AVh1wcRfluk=;
        b=ebBu9BYOdNtF/sQHSrFqIlPzg5laSMBZ8OCLwbPjcflHkxY8mCRyz3R2YAGPOaFY/L
         yj/WQsE510Ud1gMMISXExT3FR0mTMFZ743UyoQMnpoU0n4cFVxmpnoQMF9Uur57Dif0m
         qBPZl7dijAX56CQtp6I6cXXpKQ6e8czY08YNwgq+88CZtU1AffceA3amnDUr6Rh27DY+
         2VxnhJBPhZKamfZWKneYxmQuw6L+dO5Kl0s4E5IxuKgkerZHdn/191TzZZan12Wnq7ym
         ZIUXUqiZRllCfbOe4tIJuVKJy0HhFzkwGD3YYhvTZ9HvldgzltePWVa9YYrzG93ptdbB
         e/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788435733; x=1789040533;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=npp0ub55aNlc3rwTuV4j9Tb9YtvYLeH4AVh1wcRfluk=;
        b=Iy2p+3jJwL8MZzSX2zbUICqm6j29mEHtcJkZEBD+bra1drllXOuSMEnK+OUKluUHOq
         tv45h7RweZ7bS3PJgdsErextxGUqTBqcYsnmdr36wm1w5Xjxci+SHA6+u2+02BtxB1iT
         bkJ/gvsDr+KRFS8IiGmxptBoTA4EuCXCvE2fOJlXeF93o4/gRw7DWglhE2wpeAK5/DNH
         1URM3O3dBW6XSLO1Nfgt9B8bc76IibMwcJZyGpXBIILAEshO1DV5V5oXTiGH20P3SpE4
         LhhiPqiiGJx0k6VKxGrI8SLbt6Ikgw1D7ifdyGo8FNMXs9dv2aOJ1CtLiCR7dkRBv8ex
         QUSg==
X-Gm-Message-State: AFuF++nbCego4a4taOdUCWDy0s/TO852LMT1INdDisCi/cYH3CjsFfOy
	Pcg0AnvjCPG4i4iQz8cGMw0pSDr2+7z3KN180+T3lwCyR1TIDQzEJrwurHtazHw5tRNy153WDFQ
	d6Vv4Jw==
X-Gm-Gg: AYBFou0c52DUAa5FbpQqpGXsQlKwfvJC4LxvEjf22Gg59/n33ZLhSjLb4kigsEowOED
	4q5emcRALd5AvPq2/hb5uN8rHW+7KGzgkGT0nKDnikHU2NOEIjOF9KIXH4/Mx9a/ZUnYTa3dYoS
	G70gs78ua9604j5mk9HBLLyuNv1fgSaGqFj7LgdDCMjEvGPUEyc41qlrt6HLpoJ+73i58DtVcIM
	tll6lF13qxmy1gkCtaaKms1V5vyLPkdHidO0IliyTFAmLzqyrllQr/lx6MaOW+ZiJm8pjWGrAQL
	KRS9zNoobGqLjksDSR23TDmU8UIDToR1C/tjtc0KKGRX5iRvyzZSdnlEl68CDR2xO72buNo14Th
	GnBu5J0H4IBx2onxmz+DXevbb/xVWuQ4jYTHwp1uvEwVGAeeLD4NKq9VHqxiHxbGBSpiDsiyR3P
	JtG3/b6HkGTSm/0DhQWYpKG07KXjuVOs/9mD5e0r5ZIQQ3mdxc8QrlSzuEH0uxtsJiGz8KgHsuq
	x33Jzdq1ihkqBizWZdWOc2aDmBE7DdgJ8o732dhOZI8OII6fFGi
X-Received: by 2002:a05:600c:524f:b0:49b:8c63:dfdf with SMTP id 5b1f17b1804b1-49ce584c87bmr179613625e9.15.1788435732844;
        Thu, 03 Sep 2026 04:42:12 -0700 (PDT)
Message-ID: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
Date: Thu, 3 Sep 2026 13:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/4] address most remaining rule 11.1 violations
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
X-purgate-ID: tlsNG-d25034/1788435733-00ECAA5B-65F4F93C/0/0
X-purgate-type: clean
X-purgate-size: 535

"Conversions shall not be performed between a pointer to a function and
any other type"

The few ones left (x86_64-allcode:1, x86_64-amd:1, ARM64-allcode:2,
ARM64-amd:0) likely need dealing with by tweaking patch 3; see remarks
there.

1: x86/domain: address Misra rule 11.1 violation in reset_stack_and_call_ind()
2: Eclair: relax long <-> function-pointer conversion deviation
3: Eclair: relax "noreturn" function-pointer conversion deviation
4: x86/kexec: address Misra rule 11.1 violation in machine_kexec_load()

Jan

