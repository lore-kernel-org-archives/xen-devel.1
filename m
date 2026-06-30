Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1013EC43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 14:05:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1348991.1606777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZ4y-00055K-55; Tue, 30 Jun 2026 14:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348991.1606777; Tue, 30 Jun 2026 14:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZ4y-00055D-0x; Tue, 30 Jun 2026 14:04:48 +0000
Received: by outflank-mailman (input) for mailman id 1348991;
 Tue, 30 Jun 2026 14:04:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weZ4x-000553-5I
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 14:04:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weZ4t-004i6K-Gr
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 16:04:43 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43ccf2-5cb7-0a2a0a5109dd-0a2a4502b822-18
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 16:04:43 +0200
Received: from [209.85.167.50] (helo=mail-lf1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43ccfb-5a27-0a2a45020019-d155a732d1bb-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 16:04:43 +0200
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5aea9d606f0so3881867e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 07:04:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47567979eafsm7894204f8f.34.2026.06.30.07.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 07:04:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1782828283; x=1783433083; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZcOAlBpFp1uV5ukROrRc2ePZRsnF5Urz+vBxuRHz/00=;
        b=RV+EJw1Kfao5I6wa3Q9tpA0YPLaJHv1qktcEOtNblWsZQj1xy9LZ7CqaWPncP1e3yo
         DgLPF1YWso3ZTs6RyjMy9BJGs8NECWJObVhiN0clbhxQeMCEeX2l+m0N9sdv0lq6Rbtg
         m1SN6jEc+WxHu0RnHH6+Xyq+yjRs8DrU8utLCxOztUfRjfNw+x+9Hh5yURAPAlhic6JT
         UVL/185zhnrA+rYSew+7wVvTAcwae50vzaza/cNw/MxxR4MZ10ZnD63aUhJysqZV96Fa
         zCB7ZSLDwomrqGcNYeQSSWpjc7r35jClhSh+/q2ZlntQroaqvuYvwOIuu9Uwv5Gdwzms
         mYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828283; x=1783433083;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcOAlBpFp1uV5ukROrRc2ePZRsnF5Urz+vBxuRHz/00=;
        b=omIdbsP+1x/ZFJq/bEf4y3Q6T7yR8skvDuc5WYjL+Azr91HB+w8rYnazgjHc7p3/pQ
         fcd/6Uvbci1H8dyXqfSslrBxXj6Cidr/Bsgxp11YUCkHWSkdopsVario8NamS19hRKO9
         vqjl93e6/TLoWEKSrrCX3/tMIPXbIKTV4hHSgu1LhTCey/gsun6nLo3BYjpXbko5AMd2
         21RJJOObkVJfXZEINf/b5Kf8WhVJGP0U0JG4z+Vs2QOTl7RTqEVETrRhnPx86WCQ32Pq
         5K2BflHfBZrQ4tvvkTtKq1BAQaZuZyakQB82Lo1QEbRc1bzRZ9x+KLgn6wATJHTOH9Es
         fLpg==
X-Gm-Message-State: AOJu0YzMttxQJx6x/4BGikZABiIJ0FoTwc+sStbpaMKPrVs8qpicaPkA
	9BNqUenbiB0phExxanggnVmpYVik/tkUN04hlG7LVXr47tt3DQlTFIJWafPaw7yLTNLulYL1NQU
	7kP7iHw==
X-Gm-Gg: AfdE7ckbnyG0LirrIVUDtqME8FjEierz47PPesJJuhEpqUUPQ7regQGIR6in6391Q+c
	UnKCorCRCV6ZHCT86zd0SMuXiVYtLYL3lpDuDZ/ZjJ28LbKd3HOpOc5mLvB1pMBBFOZXPNZ6hIA
	Rc9htHAzWeKvdvOzRPrcekV9mKE+jgWnK496+nmZEFB/t7oC41yotZsBDkhJxe1Kwl7Oc/kSqUg
	f+hnGYsY1C1QHEzVWla8pu5m1R2c2OD4Bp95fAUBUEnr/X0JeVgQMp05tEAqNLwlclo5xK+Ca54
	VS90sbJPXqNOPp0PHhcqP4fEErD0WclgDmKvl6oxiTmOh5wIu/eOS362CqRbIgKHuHF3fF31B8+
	RWlaLVxJuCs8i8xKCjf/ZKid9HQvmx2LmmO7me3/vrLXAARzpFu6/toI7qOzKJE7P91mVpXoaT9
	wKgvH+B0DM3hrSS86xPCUYWqN1KH++cSlV2SkAffl7yMsFDX5SOMvxScgc9JaG7Z7Q01WBYpt8B
	uaZ
X-Received: by 2002:a05:6512:8341:b0:5ae:b7a8:17c3 with SMTP id 2adb3069b0e04-5aec10bc96bmr243027e87.37.1782828282613;
        Tue, 30 Jun 2026 07:04:42 -0700 (PDT)
Message-ID: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
Date: Tue, 30 Jun 2026 16:04:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/3] x86/time: avoid early uses of NOW() to return zero
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
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
X-purgate-ID: tlsNG-720697/1782828283-76D107C5-D9D2524E/0/0
X-purgate-type: clean
X-purgate-size: 176

1: time: add "NOW() good" indicator
2: x86/Intel: split model-specific freq calculation off of intel_log_freq()
3: x86/time: avoid early uses of NOW() to return zero

Jan

