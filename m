Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5562EC43458
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jul 2026 15:40:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1358277.1612472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whqqu-0002ms-5j; Thu, 09 Jul 2026 15:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358277.1612472; Thu, 09 Jul 2026 15:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whqqu-0002ml-2k; Thu, 09 Jul 2026 15:39:52 +0000
Received: by outflank-mailman (input) for mailman id 1358277;
 Thu, 09 Jul 2026 15:39:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whqqs-0002md-FI
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 15:39:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whqqq-00CW8e-C8
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 17:39:48 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4fc0b0-2eae-0a2a0a5409dd-0a2a45059f88-18
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 17:39:48 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a4fc0c4-4f1d-0a2a45050019-d155dd2ee56b-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 17:39:48 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4759b4f0897so30969f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 08:39:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0f2186bsm50814686f8f.36.2026.07.09.08.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 08:39:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1783611588; x=1784216388; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zy6MWa5cL8mpChn2SlqXnPzWrdI6KBorU03V7xTT+lw=;
        b=NbklZMPcHlcXYthOfg8ElzXrKHjjGPp91w3NuPtyGGRmojtW2D7SaD8YxZm/zIh3bs
         JcGq5pGgYSl5FBbayp7ddPp89QfNBHy+lrTNptWuKjowD0bhwBJa0AMy6/TFbeIvgy37
         loq3OGOWGpqnjWf8Ht78+PHLYvbt1rD/4P9NlnJerivDpkSnt357XirGNjemxAGoorM4
         tnHp37YWxVMfDPd1CL01ytDiS4hX99ngT1dlV0zmjuHqTvf2/SPnioCDzcxSNhB07tL3
         9FM7RnyVo93p5rB6BYpV7xrMqvI8HUMJdAdclEAV9Vry1HxlWfHHtJDjgSDjPhgYPEBG
         otHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783611588; x=1784216388;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zy6MWa5cL8mpChn2SlqXnPzWrdI6KBorU03V7xTT+lw=;
        b=dlbAjnlikrM4sRA9uYzxkpn1trASFQOrIuLefnhdWCTpeVlQK8XPg9YjQFA5CzCkRY
         OeVJBXfxyGHXTHYK4WgbJRPT6cEXJYOHCDauZ8/3Yd6+3Lo0E3b4k0e8h3Jakimk21eL
         j9orCux4WBJXi+bzy73eLCnm1uZ7IYiLepb3QUlurrCXLJxSvvLX84jETnVhReEtPUU2
         yXFEvLXuTbLYiWhA3a8v1MBZ0wKAG7ONMcuAtwL7sSIRZ6Ka3oIIWocVoJcsv9dYeapZ
         /qcYGZPyN82OiMrqI2YAHmEMRqvBdaJz4PZDzM0/VhV9NupkXPzXguogd9Khu0VNzhi7
         2kIw==
X-Forwarded-Encrypted: i=1; AHgh+RpCaKH/ykR1oOVIo9/rIZeukWgtVY9zMzMIosf6eIbfc/TDMqOlrJwUYRV1z9OeIoghITXolZqakVM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyw0SI5UCJ8yYjxPDJ9ElldDCwvtmOpDRZe/6ZUwnF+WTs+W6TZ
	JwLP5MNC2h9NetJrq6U7V97uK3ZmBFjHNv7gXLbNl6tAi/F5KOr0ytG352+PTk1pAQ==
X-Gm-Gg: AfdE7cn4vonx++bjAKAD5ic18zrypMNxYq5YN4QzRr6wown4BE8/gRzKD1VtdvanCt4
	T/KAjTu/8h+I6KlzxX+8zFJ7M+/X8/QFXynVRCmgXpsrWNw3JbPE7gO2Cq+nk+UkI4ovxyCllDj
	0XAnwUfjyLY0XqELdFikjXm9DwUUy4Z4+xvMJlLcpWxUxK+2x+sSzRtTWiQyamMFPLqob7+Qjjq
	LDbO5rr1DeubvYUR6UXl8i6TDRjU/PmEu9KA12TR8GTIZrP36okgz8dBkrVMsVZ9pJZ9eQupy4q
	VRM6WBx94qRTV0e5u8sDdO4Jd4x5jl7init7rEhrs1qEWAF/5laoZH2Wt5sYixZKp1b7a3PwVyA
	Ypa19xAJbqMG/Oe1ipWL9iuEYCbzL6svr4gQ0f5O27/c6hPN3KU2WHpv+GnE5aJHOP0W6c+u5ju
	h+6MkoNK/ERCmK2KJhkSEumxXhNBXQ7MEf25byiygkCOto5nQaGs9QIZ04925ORdM02DIFpwRr4
	lSn
X-Received: by 2002:a05:6000:455c:b0:47d:f43d:8947 with SMTP id ffacd0b85a97d-47df43d8a02mr4429256f8f.47.1783611587700;
        Thu, 09 Jul 2026 08:39:47 -0700 (PDT)
Message-ID: <6a4adfa7-ec9a-4cbd-a9e2-571293cbb1ed@suse.com>
Date: Thu, 9 Jul 2026 17:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/26] xen/riscv: introduce minimal virtual APLIC
 (vAPLIC) infrastructure
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <1f51410c080599a5c80173398d9db837b8718356.1783331040.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1f51410c080599a5c80173398d9db837b8718356.1783331040.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1783611588-62F4112E-ADA8F5B0/0/0
X-purgate-type: clean
X-purgate-size: 1087

On 06.07.2026 17:57, Oleksii Kurochko wrote:
> At the current development stage, only domain vINTC init and deinit
> operations are required, so implement those first.
> 
> Initialize vAPLIC's domaincfg to with the interrupt-enable bit set and
> MSI delivery mode selected as the current solution is exepcted to have
> always IMSIC, and initialize vintc->ops.

How would domaincfg be initialized on real hardware? I can see that maybe
firmware would have to set DM suitably (and you may mean to take firmware's
role here). But isn't setting at least IE entirely the OSes responsibility?

> --- a/xen/arch/riscv/include/asm/aplic.h
> +++ b/xen/arch/riscv/include/asm/aplic.h
> @@ -15,6 +15,8 @@
>  
>  #include <asm/imsic.h>
>  
> +/* domaincfg bits 31:24 are read-only 0x80 */
> +#define APLIC_DOMAINCFG_RO      (0x80U << 24)

Bit 7 is also documented as read-only 0. Wouldn't the comment better reflect
that as well?

>  #define APLIC_DOMAINCFG_IE      BIT(8, U)
>  #define APLIC_DOMAINCFG_DM      BIT(2, U)

Wouldn't you better spell out BE as well?

Jan

