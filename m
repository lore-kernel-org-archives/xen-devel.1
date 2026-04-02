Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625FDD3943C
	for <xen-devel@archiver.kernel.org>; Thu,  2 Apr 2026 15:00:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1272073.1559967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8JWp-0004As-IC; Thu, 02 Apr 2026 15:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272073.1559967; Thu, 02 Apr 2026 15:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8JWp-0004Al-FT; Thu, 02 Apr 2026 15:00:15 +0000
Received: by outflank-mailman (input) for mailman id 1272073;
 Thu, 02 Apr 2026 15:00:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w8JWo-0004Af-QY
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 15:00:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8JWo-00G7KA-4v
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 17:00:14 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce8479-5cb7-0a2a0a5109dd-0a2a45078f18-16
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 17:00:14 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce847d-ba2d-0a2a45070019-d155802ad47a-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 17:00:14 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so8248825e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 08:00:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e967badsm260400105e9.14.2026.04.02.08.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 08:00:13 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775142013; x=1775746813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3SX0trmUDpZkTT/c+gJcovk9TCylzBwm7jeXYqJ5JR4=;
        b=A+v/N0nSkzRN/JNloxWMQmFUX/8jAPBGIJsVamdgHMs4tD/OMjgoBS76IZQbWLLBo3
         ldLqw18TSO0ldf2vaQE5isF+TtjQgPWfGGond4dqpUmIQQ3Qa65Pr1UZsEnuSog87r5K
         5j5zI1UcLCAYBuLez6gZ0Lk53Fj24yhbiqhsO3TllwPoekVZIaHAFu84knnSfHKHf46v
         wtzX+0pMvwKtxZbtCHPl5acRdrXKo8Tegdifwg6w8w2Q7psiMgbZOiIWTLQg6fyjelHq
         +X6ykoifQhod1VXuh8MehOwl5Riy6+BFzG/HOawHk5BTKPI7IIcju09pW2ZThFxZfGot
         yboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775142013; x=1775746813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SX0trmUDpZkTT/c+gJcovk9TCylzBwm7jeXYqJ5JR4=;
        b=PtUl8t+pAqmLmuIgIA13VwU0PmDF7+tuZKDW3HjvAY7dzTYg661WCNxE/CqKudNv2s
         gXaQE14J7mJ6mFK1+PTxdtNlhY3yqLj+Armo1T4RXGoNC3XoNQxcGQr7Kl1vMi1o7+Op
         ZnWNLdOwQtST2b+zu0LGqwfPWewHWDZC4QQtRFQOwy1IuqjP2pGuahpjc5vLxVncb4RD
         K+SJYMkwBhNPrw3DRBXRxqdT4PK2lMufz1ACXXv7lPCJOaZ/aNZisX9fN32O2uXfpEHN
         eick9l10OKtI3bXxRhWj1WLQTVb/I9p6js7S9QvR7QfuoLzgf/+II7SEcFGuSIUNIFWH
         6whQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHLs49z2RxD+PJvI7MpRLAk8WmHbSWFA3qAN8R0aY7pPKx0bzv4/JFF759DsD4kGSXQgXw1AdlZjk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxccMiDTO4OVkVbqI2XZ2PibPWFieU/s0Wmpb3+2Su47BWRHpj+
	cPTFDH/ywtq49VSDBtvBF11ilknOzbPdjIv1KOrBAbBZEOv96evBlhngfdpLqUeCnQ==
X-Gm-Gg: ATEYQzxELoQLJnUc7E5SOoZDnzGC/3gbl8u1oI9Fo9twMZNmm3RwWdAdvdn9IEQU5Az
	rtHknXeYjzJOQuV9gbpCcZdlnuRz15Mv3Tqm0HDp9L1BvBmV8UuuQSBpKrV+DDocKMGNu6BuPil
	2TLyxFASdeGKQS3t0Yo30QEZAP2CIpugiF7VVwDV1KB6CCoMZV+KECxTfquSRukQZxscEB5Rr54
	aK195U6ag9akPbTKz4iHdynhYgwei0izYdfGCEZTZa5gcRMH52bndtsQQjqWJePp3evJlngEeCY
	oKSvh1o0oWy5noTf2KmTWc1GUltB2Rv5FxdD+jXZj2uiZikGLgS7WTb8OdsI7YEAYIndOzWYhpJ
	mD99n8dVfl2VTcWwtevYezgaVcWk+JFdd4ka5NRXzwGuask46wzuifrVHfQBrVnMV0bcWAm1mka
	inwcBzre4O4r5V0QXow5FiaGtHshiTwbNwQ+d4XlvilBLcUUfj1Fzp1rliN3Bbccr3rPAtFRyd7
	QT9Xa+9U5B+9EU=
X-Received: by 2002:a05:600c:8488:b0:486:f4d2:eac6 with SMTP id 5b1f17b1804b1-488835682c8mr140731245e9.13.1775142013481;
        Thu, 02 Apr 2026 08:00:13 -0700 (PDT)
Message-ID: <e033cae3-b158-414b-9360-67b42edd6b81@suse.com>
Date: Thu, 2 Apr 2026 17:00:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 22/27] xen/riscv: implement init_intc_phandle()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <b0669c89d963c31426acb239bc7c436c13d6ba45.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b0669c89d963c31426acb239bc7c436c13d6ba45.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1775142014-8A74A41E-99739340/10/73395122804
X-purgate-type: spam
X-purgate-size: 396

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> Implement init_intc_phandle() to read phandle of interrupt controller
> node and save it in kernel->phandle_intc for the future usage during
> creation of guest interrupt controller node.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

On the basis that it matches Arm's:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

