Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454EBC79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 12:58:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412981.1643257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Hs9-0004aB-O4; Wed, 09 Sep 2026 12:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412981.1643257; Wed, 09 Sep 2026 12:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Hs9-0004a3-Kt; Wed, 09 Sep 2026 12:57:53 +0000
Received: by outflank-mailman (input) for mailman id 1412981;
 Wed, 09 Sep 2026 12:57:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4Hs8-0004Wj-Cd
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 12:57:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Hs7-007kK0-L8
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:57:51 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa157be-e002-0a2a0a5209dd-0a2a4504c4c4-46
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:57:51 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa157cf-b57f-0a2a45040019-4a7de14c8594-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:57:51 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-484366874b0so568600f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 05:57:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48594172546sm35614885f8f.15.2026.09.09.05.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 05:57:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1788958671; x=1789563471; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HnVr1jyQc0qSmMH+0ikdTdtbkkw9KPu6ZvDPravnleQ=;
        b=WkNP6Ulga1KqEUvv//U4myJTvW8zpKs9MfESyL5ErY0bMq5gDhubXcpC1vZrJkqG/F
         WjaaxvtOS80uaSYqMZiaCLhylGda17YzLkIDSAi+mkQtV5wh4H4Q4WKrcFDBN36XcRKW
         9m6tKGRO30j0UQyPaysCy+WtfNcW7ifon2RuiyuuKpXZxdLAeLeNq0qxJM2ZgyBKAaCZ
         Ki7j4ziwkvibuGVcVOyN75P1OFvjcQaHgA5ECCeEyKssxjKenZIQjN59t5Nkxg5YE720
         bzVDUHpSvPL/L5JYConmU+OZt1kM5y7QyUtAU7uWHKoKN7r+TJr136aI47dhxU9LAQUr
         VbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958671; x=1789563471;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnVr1jyQc0qSmMH+0ikdTdtbkkw9KPu6ZvDPravnleQ=;
        b=lM1jIlb/3w9xFgzDqCIZJqQTssaqCyrKfbc/drI6x7zmxayULrM1bhJBtM+qQLWvLx
         RpZAAdb3uxifwrxc1XPZqH4y1wcyk3jdSrawgbBzM7gHE0XabMk0lgs6MvoyeByjENz0
         PxM6hdIsNz4Ge1RHJrJQkuGCzNPPPN3vTZ39BjA577DZXwj2qULIGQzyoK4luU2WRJRM
         /TsPEe9VrFJmMpWXnA+4AaHeRxMCthidzPKNL/zYkDlpLrA2QNgPoJeK6f5S+NdwcWVY
         +gJqM0lrvBBuRHNBBFIFiPttHtvcniJHZKCiO38jNVySCuchW8uWCczozRuk8nLbD3o1
         /VmA==
X-Gm-Message-State: AFuF++mmEknnXYvOLrejBPbBIegBcIdznZ6NymSJ/w/I+Pn+gwIC0yzS
	+rapenzQtUehhet3DvvF9qCFrubBG+rK9xfDm5RLMmYU02xGYoS66zAwhTTx86CUsoTeH6lmhov
	nrVc42g==
X-Gm-Gg: AYBFou0pD/LnEs2LILGHwcYaz11hxtsheUPqS0GNOaLCa2UAx9wMQ8qTxb5UN0yW44p
	um5tz7awyoHaKApUBotccneGvmxOU+3gZT8cvMtUEbhSNoJmKcuMF8FZg//V2lXaHkB/nHkkFTn
	ZWDGx0LkdEzkXfDi867jNIu6Ul3gyEJELzzJiUhnaJPjGjCQoD7UWAtPLUbI7CamocCxpmtBpYk
	Lch56DP9Q6nO6JTTsN3fVFqJrsgOhs5T9hH7MsUijQ4kCCZXj55hGe80fI+x5wdQ9X7X/E8TAha
	4rwpNBbPA8LX1cHJgNVd43QSNmqfObgxYAh5Nz4MXuZ/39f2PXhdYDV2wtamrQiyV9qHtI67OPd
	5qG0SQI1zLUlsQmVa3ByMDJawDyzKFDdUHucrOAtEiKKuz5cvfIPgla3Hue5ZMpa6M89/Cp425g
	R7ISObMMU9YgvLFooj1yfQT+REfk8uxO570a3ekly6u1X6FmXuDEJzl2+3LARZOIN07J6/TUdZF
	zliYZShBSEaXe+NImVMsuFxlxSApltvBhM6XfyU2aSOqveE70hwQCVV6W9O5fk=
X-Received: by 2002:a5d:59c8:0:b0:484:3604:c7bd with SMTP id ffacd0b85a97d-485aadd2ca0mr12920147f8f.17.1788958670865;
        Wed, 09 Sep 2026 05:57:50 -0700 (PDT)
Message-ID: <c3614ea0-e5b3-4cfd-820b-9320ac327292@suse.com>
Date: Wed, 9 Sep 2026 14:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/6] x86: address remaining rule 18.2 violations and mark
 clean
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
X-purgate-ID: tlsNG-ebf023/1788958671-C3AC0B50-49217D01/0/0
X-purgate-type: clean
X-purgate-size: 558

Arm64 is already clean. And all four analysis jobs have already been clean
for rule 18.1.

1: PV: adjust APPEND_CALL() to comply to Misra rule 18.2
2: alternatives: adjust _apply_alternatives() to comply to Misra rule 18.2
3: EFI: adjust efi_multiboot2_prelude() to comply to Misra rule 18.2
4: cpufreq: annotate Eclair false-positives for rule 18.2
5: Viridian: annotate Eclair false-positives for rule 18.2
6: automation/Eclair: tag rules 18.1 and 18.2 as clean

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2832933871

Jan

