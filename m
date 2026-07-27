Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6351CC531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 12:23:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371653.1619136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woKMi-0005Xl-2v; Mon, 27 Jul 2026 12:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371653.1619136; Mon, 27 Jul 2026 12:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woKMi-0005Xe-0K; Mon, 27 Jul 2026 12:23:28 +0000
Received: by outflank-mailman (input) for mailman id 1371653;
 Mon, 27 Jul 2026 12:23:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woKMg-0005XU-67
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 12:23:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woKMe-0080Fr-Sd
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 14:23:24 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a674dbc-2eae-0a2a0a5409dd-0a2a4506e0e2-0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 14:23:24 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a674dbc-195a-0a2a45060019-d155dd36a9dd-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 14:23:24 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4720f3bf164so2136095f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 05:23:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c67339sm50945133f8f.31.2026.07.27.05.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 05:23:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1785155004; x=1785759804; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egNyHdNN2UvjznrPSLXfehphZBRnNfRmxXDWUw/tZNU=;
        b=O7s6f/QjgyPEPmiUUgSVLP2zmomIoLtMvSaugT9gmJtKe2quVA3IC6+oB/kCnC1rYA
         Z7RCHOorFB+sp+lXp6Yd98q1TooxJMlW5f1l0Vsjl9bvhVket0YW6+Fsf6hKIN6PVFwE
         DB+C0TJG05LZL47pPQr/cptQDJ6Edr4U1s3OEDfRrEtJDAXIIZ2tdg04N9JdSTnQm44p
         tDaC/3ZaPqyT2y0hJ5HF+H11lsMkplIAWxXtWFj32cTwNZtTa/B+RvmucDnklC57xaQb
         F+rVxlnFEmIhDsJw56ggfub0i8mwAlN6hn0gXiTBPokDqVQU3Vb5CvMNXJgtRbhI9DTe
         TqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155004; x=1785759804;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=egNyHdNN2UvjznrPSLXfehphZBRnNfRmxXDWUw/tZNU=;
        b=DAluK9uPhA0G9Kruu2ylTsNAZaQgRBHRp34lJPBKcrkccZUBk+Fe82yMS6sawm+mrM
         Mg69M1yTfqIFViJ8nLpwgXYI7wBhgPqmaxvdeii3LuWupQupE/9HQmii7diZdL7XrnC5
         jXo39QqfhHnL+FbdOCEajaL0M6mItI/Hrd9sO7jiqodHr77NlZgMf1heI0JG/gupu5sK
         /on7KsEgWahje+X9OTW5PdmDVRJN+S7ZVfjw6LCw2qRwpvmIdDi/U9eI+9fLnVGvOogy
         AuGZ322UZ/Gyoj98FVV9I6U0rz8DM3kIVYLH5PYkgkao1csyX5rs7UfOWU4vwLGXkrbz
         8bBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpV7hWfI7iKNsTdkl0ZExOciXObl44U7pzdtDNBuPWUwfbKKRHMpyUxUqTzMKmmKyJ1Q8BzdGsNh4g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzF2/Vz4v16TTgh3uOmsidKlJNXriHAypci8/H730MZ88WwSZ6n
	P4kIoyPpC89Dvok/pRxu7Ble4Xs3zQFkc6XQ+4W+0nlOKzDUElhrkv5qWpRs5agMDw==
X-Gm-Gg: AR+sD11gdDICHavHXziIddE9USjmCEjEjyhnozQRlbSs8FEtxWspLGDnfaoB0TJtsmq
	wXl395YRA6EepF5berJ1Qi2sqb39q+3HlGyZj2sWJ7qLQ4QPDV3B3wbkUvj0EpeAIj93gPaEtaD
	Z/tO4XOqcJiifZPBIE+DXQIY+d7j49MIzIhGIEgXPVWspwkmljgtQ2mZiPjSJge1C38KwOxmZfU
	B4XcL6w6HHM79R7JNKA8t/s10qRrSetg8h3GdJaNgNpH9BgL3MyJgr4d5JFeDzyCjpuzeirI2eh
	zEjNcnqk4yxbu4QA2qm+W6W5LWcvZC9dMt+29s7ZSACUOGlw0VzbNa4KawUusLfeB7s+h01lvhF
	anSrLocz6gWJGLaKyrWHJS9mrPUO2kF6sjS5aDJxLwa+aTAqY2QhtPV+lMpXMlSeB3JjYJBShD7
	92pspFFjE6KwXoHTkGPMrbjUKD/Ufg7toFBNinJnNsimZ87dyOBQFN6f5za+p1U5DE3w==
X-Received: by 2002:a05:6000:4013:b0:47f:8603:a879 with SMTP id ffacd0b85a97d-47f9fe901e9mr11428489f8f.11.1785155004162;
        Mon, 27 Jul 2026 05:23:24 -0700 (PDT)
Message-ID: <5b8b6a2e-b074-4dc4-adc0-d7c242d04710@suse.com>
Date: Mon, 27 Jul 2026 14:23:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/9] vpci: split vpci_process_pending()
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20260708210233.922275-1-stewart.hildebrand@amd.com>
 <20260708210233.922275-8-stewart.hildebrand@amd.com>
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
In-Reply-To: <20260708210233.922275-8-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1785155004-1F0C777B-E7E79EB0/0/0
X-purgate-type: clean
X-purgate-size: 805

On 08.07.2026 23:02, Stewart Hildebrand wrote:
> Create a new function to separate the mapping logic from the pdev
> validation and lock-acquiring logic. Slightly consolidate exit paths for
> hardware_domain and !hardware_domain.
> 
> No functional change.

Is this then just for the sake of splitting, perhaps indeed helping clarity some?
Or is this split also going to be leveraged later?

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -102,23 +102,12 @@ static int cf_check map_range(
>      return rc;
>  }
>  
> -bool vpci_process_pending(struct vcpu *v)
> +static int process_map_task(const struct pci_dev *pdev, bool map)

In the end it'll of course be Roger's call, yet I wonder: What's the significance
of "task" in the new function's name?

Jan

