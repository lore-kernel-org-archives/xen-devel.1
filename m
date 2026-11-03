Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A015D606D826
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cueXa9Wr
Received: from list by lists.xenproject.org with outflank-mailman.1469361.1678185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOB8k-0000GD-MH; Tue, 03 Nov 2026 09:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469361.1678185; Tue, 03 Nov 2026 09:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOB8k-0000G6-J6; Tue, 03 Nov 2026 09:49:14 +0000
Received: by outflank-mailman (input) for mailman id 1469361;
 Tue, 03 Nov 2026 09:49:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOB8j-0000G0-Cx
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 09:49:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOB8i-006ZVU-Ib
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 10:49:12 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9ae0a-8faa-0a2a0a5109dd-0a2a4503c33c-26
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 10:49:12 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9ae18-fae8-0a2a45030019-d1558032b0b4-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 10:49:12 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso27705245e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 01:49:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b2ab010a66sm64506935e9.13.2026.11.03.01.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 01:49:11 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793699352; x=1794304152; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f0LBHMvs3wSXxDl8bE9YKTvwcmdC8ZOzEnuyDazQtk8=;
        b=cueXa9Wrx/Th4v9WDPsW+fyw/hAE9VzxMfeMEKWnFxLOVgnupInJL56E2dXsJkmFXK
         ocjq/rKzkwzymz7+NTSEUPAL3D/eK+GxRTFGSBr6oiUxYHnJxk7gnEhjWeCtwb9iWFQZ
         03z94z3BVIBuwlxDCkGfugl1MS5OwotDN5DBZ7WtCUfT5RFKTVnhRW9PcploYG4EPyZO
         EJOt5Zv2SD5RoJAvZq2PxpIajFODGoKvYQ2vKFPEfmVvdb4Q++asDeMoIYNVcrnKVKn0
         rR3/Dmu/YpaXA/PClQsyzv9qE7euDK9bAchlBEvPQP+eu5PlP8147zqbK+yQuxocSys/
         qmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699352; x=1794304152;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0LBHMvs3wSXxDl8bE9YKTvwcmdC8ZOzEnuyDazQtk8=;
        b=NnZgV2GaYIZqNpCDN0VknyyqTOf4g4d5n+mwAYpB2UDCdlIBRMPkESHx01Ufvbfq+y
         G/9RAGMPuP230euNYcRBp5thgPvMqQ97U5jNHPY0IOohBP5dcE4mCrmWamG79kNMntt4
         ppsXwBCtMZey3o95YICW+R51BIUJVpwzfiJfviZqt6YELR2KB223RCxKslr71HCYHjve
         4XVTEfTQwBHI9IYuW6HcnhCFhgnHT3sKZS6bFerExCupMlz3v7sLk7NvsOCgWLO0Wd7c
         wb+d9pjBeQbExg6Q9s/P1jIS1wE95k5fymAIDyP1gsPAHVBLQPYdaA4IQK87gJ26AztX
         dsLw==
X-Gm-Message-State: APuU4Z9LAAYYeuZMffkBbRd62kDkPSbhFTWW6teDEos8rK7ED4857gAp
	TyHiTTCJIKqRkaishAF0XmNobLCUcojNN82LLFhuq9WbpPw5iB8vnw0zJaOxb5e5tzDROyAxCPA
	ySDYPVQ==
X-Gm-Gg: AYBFou2t6MOjYRX4uHLvSRsUEDKa9Uezvpi+HgqoDH5iJDXpSSaYeEYT9GE6DfInK3t
	geZHUlgIuxBoiD6j1YHvimH1SAP9axnOEOIKPcrPPjDLR0t+wLPx6EbbM+2SVDA3suOlR39TRAG
	ECgWiiRWICGuCJh6Hhn0ChzcN1SQdMuuUtHvl2/gwzBqCEo8+AzrLzPkUeGmu9oSR+eW1hzMit2
	TTzKIWc2PbCcckH73rSb1kEEMq/WITkifNuS6UXWILW7n+VOor9WcuIUQL2LrXNI9ZLxQrgXT1v
	J//F6NIVHKeJU/j+/t9j58DhVbV+ncAxQkutGPYkorP9EUS1boM5LjNs2We3JpC81Mm6ug68pBc
	WP+9SQ9Ujw8QQ10xeIanA6S7o8oS2kHgfogszRwErEkUtratZDasCGNS0aTZ+7s1+wRDDNVlvv7
	OzNlxTWTxQFP/Ff9rQZlRqq+f9NGR+JVyCLkN86+wkSblTfp4TzytsfkwqLpk8vvA4h9PIJcoV6
	68J5Ri2OXnQd6z2eL6qPj8KlkDi3liTxSZoLCcknUflPOFwelcTkb0DWM9GQIXszT83zwXN+QiI
	GV7cmAH5EUJ3OHZlpBxUzmzX1A3SjJkoqFLQ7BC+5TvcIJuFmBbgdj0Szg+QZb6k5Aq6miTpJud
	eLqwrlWy865mX32cZ1cSqFCCCbzsIdnLXe5wP
X-Received: by 2002:a05:600c:3b8f:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4ac16acfdd5mr297536345e9.11.1793699351866;
        Tue, 03 Nov 2026 01:49:11 -0800 (PST)
Message-ID: <b0fd61a1-04b4-421e-bfaa-135ff70c18f4@suse.com>
Date: Tue, 3 Nov 2026 10:49:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/MCE: reduce redundant code
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
X-purgate-ID: tlsNG-33051d/1793699352-75A814E9-6D1C857F/10/78276251493
X-purgate-type: spam
X-purgate-size: 429
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Following the (so far not really explicable) observation in [1], plus
the fact that mca_rdmsr() isn't simply an RDMSR, patch 1 looked like
something we may want to have. While putting that together, another
inefficiency popped up, which patch 2 covers.

1: reduce number of MSR reads/lookups
2: drop redundant code from mcheck_mca_logout()

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2026-10/msg01825.html

