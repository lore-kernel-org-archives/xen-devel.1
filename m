Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D44C79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 14:51:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413217.1643437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Jdl-0005Wb-Fb; Wed, 09 Sep 2026 14:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413217.1643437; Wed, 09 Sep 2026 14:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Jdl-0005WU-Co; Wed, 09 Sep 2026 14:51:09 +0000
Received: by outflank-mailman (input) for mailman id 1413217;
 Wed, 09 Sep 2026 14:51:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4Jdk-0005VJ-LD
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:51:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Jdk-0039a4-1b
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 16:51:08 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa1724b-8faa-0a2a0a5109dd-0a2a4503aac8-24
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 16:51:02 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa17256-fae8-0a2a45030019-d1558035d8d9-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 16:51:02 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49b0d78a801so59275265e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 07:51:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7740d44sm1037476305e9.15.2026.09.09.07.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 07:51:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1788965462; x=1789570262; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUYQi1MVI1FsspeqjeqM6EEgqL7Bgt2IUomotef3ofI=;
        b=RuYuh3ubU6Epm5IQcJ5aBgJvxkfyAlvimnpNjUlXiNn6XxQhnWiydxp7K456xGyT/M
         46YJJy/PsqboYe1QJwdzYHggwyexhyRBXRLRmR+tCeHOFlH8ocggsRWrm+6sV3b9ICud
         RBKOzEbzLPwyaJgHEybXmgHBCsOdF5pfZfvHWPAEdlSdRp9MooR+sph02sTSZOW+qCVL
         0lQFdcl8bgcmKrvbDEKZkWeF+XX7Du8bJAkFTL7+Xz2Rnc8r/53QtF8NHqcNAlqAiyi/
         NH07s/rm8AfJEE0idOhbB08ekX31dII9nZpsr6OOFPn53mXbmCF8nDCfDsZic3O7ccLA
         k/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965462; x=1789570262;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUYQi1MVI1FsspeqjeqM6EEgqL7Bgt2IUomotef3ofI=;
        b=A0fFpGs9H0QlhhYq5ej8toGbpimJrw8y5yp7yCIU5ULewNvk0ND+Ib270oe4AK5bTa
         M+44h+h+H9Q0gHt0BdsWX5JI3wdi2NXNrVfndmCZYVpaPrXV0WYHwFCRY0XaIQQTxJf9
         KCob02zgCFMtBpYAWWpR0XhcPV+H9F8/gOkptPL2mKNMpMIGWWoVE6AOn/9A2XTQ26M3
         qA1BJb5+rsuWHlXZZ1SF/nQPUgNjjzr0g9SgS1MDqYU0F3HWTvqRfL+NCg1KBAZ+X/Wf
         1KcPiikpztRDUAMRrKr8saw4kJA1f21G6D8jQ7geAnDTZUoUQsjFU/U9QSwMdM324b5a
         IYBA==
X-Gm-Message-State: AFuF++lACA4gLjTI4Swd893yZ/17VtKDg0RMH+wTTxcEAyG4Bg4N1dMc
	gBABCjZ6/RHjKk/AvdTGXOuB0oFb/WbcVO8yLptT5/ukwm/Bzp24EqzXeG4BRRtUJg==
X-Gm-Gg: AYBFou2R88bun00fPu5/AVXsJKdVwUnrU06Dmt02ko4TYLWXruR/HBrmLLeBA97u9M8
	MKz+TS7e9+t/zQly6yACF4wQfaWGqvH7XfH1iUxZjW0YmvXQtKYnSK1nBsUMkS+KXEmHkuyQRV0
	NnxwZM+cTwtX+73rQd1R//504/4K8GIwj+A9Fl4FHSBn3ZDsQi2fWdzuVSI3NSxXOWfEvmrWpmS
	7EM540kNrquRLDQnfet3700m42JlkEOD51/TKtNRVD94zznH2huwnq3pwTE0WB2YL5WtJc5Dtie
	ScfKj/v71FM9TVQHKz4HYgq4pP6qz4NFIvctI8MwW1AsH82WYm6Fzdrb7x7L+yXcdB2qdDs7+L7
	WhnaZvuyoQhYPOvkoDuQn84pvT2IDSOWv40H12CY36y8ecBY46D9IyW9su5f5SgSey5Qx+Ye3uY
	tYViHstSYI++X0PWRtNMqNRdM/KFGjzDE5UtXcLv3a3Jln605MNm384kHPCBFD1Taj4kwr1ESiD
	N6Vu2xd2aA2fjvPuptNGQoo17APn8aDhqXryFRkcuPOX/Ntdh8sV/LBxmF9LNA=
X-Received: by 2002:a05:600c:6098:b0:49c:fc6c:be05 with SMTP id 5b1f17b1804b1-49cfc6cbfdbmr379845445e9.28.1788965462046;
        Wed, 09 Sep 2026 07:51:02 -0700 (PDT)
Message-ID: <e11bcc01-7a5b-4138-b5d8-8856ff4aa977@suse.com>
Date: Wed, 9 Sep 2026 16:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/39] xen/riscv: build the target hart index via
 aplic_hart_field()
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <3c7418d64a730ec5e4b2cfd0ecfbbbc6fe0bf7d8.1787838835.git.oleksii.kurochko@gmail.com>
 <1788510380.8631fc262581453bbf619ec5b2062170.1a06b869ff7000c4f3@vates.tech>
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
In-Reply-To: <1788510380.8631fc262581453bbf619ec5b2062170.1a06b869ff7000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1788965462-77AF14E9-C1051B53/10/73395122804
X-purgate-type: spam
X-purgate-size: 808

On 04.09.2026 10:26, Baptiste Le Duc wrote:
> On Thu, 27 Aug 2026 17:20:54 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
>> aplic_set_irq_affinity() open-coded the packing of the group and hart
>> indices into the target register, and got two things wrong along the
>> way:
>>
>>  - imsic_config.msi[] is indexed by logical CPU id, but the index was
>>    run through cpuid_to_hartid() first. On any platform where the two
>>    spaces differ this picks another CPU's interrupt file, or reads past
>>    the array;
>>
>> [...]
> 
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

I'm puzzled by this being unconditional, considering the naming comment
you gave on patch 09. With the (aiui now agreed upon) renaming:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

