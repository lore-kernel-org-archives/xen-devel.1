Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3274CA6007
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 14:36:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443428.1660739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEpEa-0003ls-K3; Thu, 08 Oct 2026 14:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443428.1660739; Thu, 08 Oct 2026 14:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEpEa-0003ll-H0; Thu, 08 Oct 2026 14:36:36 +0000
Received: by outflank-mailman (input) for mailman id 1443428;
 Thu, 08 Oct 2026 14:36:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEpEZ-0003lf-Hz
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 14:36:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEpEY-003zGN-Ut
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 16:36:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7aa61-2eae-0a2a0a5409dd-0a2a4504bfcc-46
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 16:36:34 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7aa72-b57f-0a2a45040019-d155dd34d975-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 16:36:34 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48afcd7ba9bso1840165f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 07:36:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71d04c0fsm11497458f8f.10.2026.10.08.07.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 07:36:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1791470194; x=1792074994; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5uMleNFgQuIv1PK7feFhdNwrJNvYuYO1HHmx6TRacQE=;
        b=N3hilyTT4+f0Uon4ERYU23hwDB4fUCruh07jukck/k1Y1sAXgT4FS9AC38p8THoUSK
         e2Y0AyhjpLG+t6TK7LgZfWWBaa0+RlM3So7z1qAhjlbD2xqgP3Z4RwyL0tmdnmczdBjp
         AgVb4zH71uSOXS54tk37VmqbaHWDpnj69hDZPxmVA5k48yb4IDz2prdu5ONmD58jd6Ft
         PW8owyYX4HauWUdNwTXKQCDT9Vg/wkBTIoOd1tAkxI8JYuwHztRwQs67wKrI7W346RPQ
         ue8al9K7QfljpWz9ZNEQONRXtUzHFpwuTApzAGluv68jQhKoFY3ZpLCmq89OhbxQSIjF
         bZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791470194; x=1792074994;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5uMleNFgQuIv1PK7feFhdNwrJNvYuYO1HHmx6TRacQE=;
        b=nr+lrXRfSQ/EwHhY1VIgY/Hw8Na1Orl5WYM3gNkAJ2/n23aL8J1QFxq2wSkZgw0rCr
         fhe712oCI+EcZ1TFUay8INRbrS3d2JicH/glfKjH8xpNk/0V6nE4ud4b62IpDR0e+/8x
         N2pDZAbmAQcI9AGhwNaUAYp1O+xnZLREk7DWOWUDz0vRTWVVz+jeSwE1ZUW6xhxkq0Lz
         6OvQAMwAsqWmSzOcv66zn/ymeQkEbRMvQDGXPbh1Pz3C0lfInSFtq4PgpMJe1CEvdi7z
         AX2l5I7yDoO/sk173+jpcF3apWkSBri9cR9uLUKKqBizPWEYtWqqKQtTVaw+1OTkuhWx
         U9Cg==
X-Gm-Message-State: AFq9FYKl/aJpSVQa87Oo5Spgv24cK2wN3AqK4qUBy7o6rcN3qunMz/JU
	2ikAPrLm7rwE63HD3Azog8uPOwEf8NQEsGKkdrloY6tX1Zt/bOzwsZ61NE1AVD3KITCZbyhwPde
	0Ah4Sqw==
X-Gm-Gg: AYBFou3B8Pvo2CJ9F1XCO/8omM2LYyVl7gJmzW1Z+ij1+3fiiXj0rMPTkc/jhMrat0u
	cwmG6NlK7gpeEcq+N6fcJLf5OLo813U4ncZAFtsCLPRZPCPY3eXPwSiJxPyS49MK0HNsHVcEKhp
	2237K4fTFDiLV2uxuz/dsudQVM8gOeA4yQw3y9uKsh07GnKLAlUXEeRTUGyKespEcAc5ZSxPu1U
	jqJyZeUoxMO2TLyO80xPsQu6cQ7Rh1kFRmw0rBoqHzxprSYk04oySIt3AMbChRh0974K47w2C7c
	pWSrTRTPQuaIw/sE+8v3AY9eqd0Wx3YxnN6Wrd/wOvmc1t6nJb0T8d1J7MEbfFdw3OhvraZu2lu
	l8/fuuiUO0tDWjZusqDow/YW3emgRT6HfxtRrORvGCEatpU+B84Lq9QTVLSInUl3Lc4vttgS6qb
	OOLE/jQqLKsO1NSC8/lL1N4V3jDP88zqm7Onc/rLT/9Yyq8osCcwiUvNr+JT8B5vSRR6ingvU4T
	DAvMKEPDG0SJG4wM0KRG8qIzOqiBfRw3GHy5Jerc/POn5FZbVgvkrcSBCMerQ==
X-Received: by 2002:a05:6000:24c3:b0:48c:7386:af18 with SMTP id ffacd0b85a97d-48c7386b121mr9751068f8f.8.1791470194279;
        Thu, 08 Oct 2026 07:36:34 -0700 (PDT)
Message-ID: <e4a9499c-ae1b-414e-bfcd-25a42c53c4f8@suse.com>
Date: Thu, 8 Oct 2026 16:36:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/39] xen/riscv: set the domain type for 64-bit kernel
 images
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <bd072fd8e2406a80aa783b1b81c41d4fe8739eeb.1790779209.git.oleksii.kurochko@gmail.com>
 <1791194530.8631fc262581453bbf619ec5b2062170.1a10b8381180003f66@vates.tech>
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
In-Reply-To: <1791194530.8631fc262581453bbf619ec5b2062170.1a10b8381180003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1791470194-C34C3B50-452569AE/10/78276251493
X-purgate-type: spam
X-purgate-size: 580

On 05.10.2026 12:01, Baptiste Le Duc wrote:
> On Wed, 30 Sep 2026 18:18:44 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
>> kernel_image64_probe() never set info->type, so every domain kept the
>> DOMAIN_32BIT value a zeroed KERNEL_INFO_INIT leaves behind, even though
>> Xen on RISC-V is only built for RV64 and accepts nothing but a 64-bit
>> Image.
>>
>> Nothing consumes d->type on RISC-V yet, so there is no functional change.
>>
>> [...]
> 
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


