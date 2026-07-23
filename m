Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43484C531D4
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 14:12:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369218.1618083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmu9c-00014E-VZ; Thu, 23 Jul 2026 14:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369218.1618083; Thu, 23 Jul 2026 14:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmu9c-000147-Sz; Thu, 23 Jul 2026 14:12:04 +0000
Received: by outflank-mailman (input) for mailman id 1369218;
 Thu, 23 Jul 2026 14:12:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmu9b-000141-PT
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 14:12:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmu9b-007mGd-69
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 16:12:03 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a622123-bab6-0a2a0a5309dd-0a2a4505cad8-34
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 16:12:03 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a622132-4cb1-0a2a45050019-d1558029ec65-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 16:12:03 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4954dff6536so5873365e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 07:12:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956a4f2453sm159510405e9.3.2026.07.23.07.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 07:12:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1784815922; x=1785420722; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsHiJZWUvdwFOkZ/ut93ESlUN3xBc2w5R4pbty2/grc=;
        b=JJjNYt2jnTlGJ9txMTFDIFb0HseF/J0UQ6IEYel0WyJKG5gViuCK8+4OLYUCNCLq/v
         3Md7/Jl6h+TlOO8iA7uhRJL/URhDE6MOIJefVvnPJ1a1k5SAHmf+v+989m8x/kJnYJvn
         zmiYGuvvg8h0EES4OI0OiMq870mcT5G6nsV5aO+sxt56Xbwsz+bVtz6t+qZ7gmOaarB/
         DKmYwrb838dR+fez4EicFjA2Fv5B/9rujfsQ6CEqqzi9lp1NKCDBJKWS++ckp1v0f6eM
         0f/DtRaMP002i+NODlv1zHx7SQau4rAqvbE0RVDmntJWpF5d9pVQTSzRB+oHZk86kPfN
         TCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784815922; x=1785420722;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VsHiJZWUvdwFOkZ/ut93ESlUN3xBc2w5R4pbty2/grc=;
        b=K3pDgInMkLNpNPcdm/ERvk6Dmws2CHfPPvWQ8XNIEeC7citjX5OU8e4dW4sugM41qU
         ojQPA8ESUvXegfg9mjVM7u7FFoGZ2iK1vyV7YKvh+vn9k+0g7Y+RagM+X9wLlw8DuXjs
         k0Qn1Sn544cw9pxIBya76PrVeqcYaadmc0ueHgcMumznVPITv5xzAWadgwrQimoro2sz
         bw8Su6R+L8hgwXXZzJKZ1zLMyRPR/w+IzxdLt3vNT1FTslga8CT0rK6xHJTa/hxXTo7J
         n2BrIcKx45cm751YW5z/nPuXSNp1pkbSOiwgiwpWRuwRqseLoiKKoOTA91wfg2qd6ENv
         o8Bg==
X-Forwarded-Encrypted: i=1; AHgh+RqHiNaaXPd6Qhk+DuvK4IfIJqteBO74GUDJYYEV8mzaw63/6F1s1ZbRVMw1RdVc6GVxJnfsawlKNtI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYe1BgLu58IhSJqd2NC30V6CNxRE6ZLlKaK/9tfJVF4VDuGmHS
	RkS6+aDGBPiGH6D9fIebiTNIWkrvaLsIsGwKhu/YbVArzQ2xGOmTQ7LKTWzhn7nAsw==
X-Gm-Gg: AR+sD11O7sYXOCRFBmVYaYjOOF8pwvTyckJ1zDKBqW0m2Xfjg6ZTEYsqHyUcrm2w7NY
	9DXSftKO9oS26O/c64S4gZNoMwmsPdCxUoFwwmf4nYcwgdNrZAXp6V6BHTE4GNKMG8U1wD2Tdc0
	a8poxHIx2CS8Goaw2qK4n4aTrBUfNASkRp58xAU1CXwGuMpHFh2y4PIVvTdNM1Uu1wCZrl5mN1p
	9x0hgCNM3G2ZsJD9MYjU1w4VqJCXXuLfMJsqrw0lS4pGF1DKRmCi9txL5krcjoq8seTtJ+DSFf4
	qSnAI6TzBeLvv2SfQ29Nw94boeI8NXSdgPJos8NERw1SrbGb1beiHhWUMo7u70VWht61DqtrwhJ
	KZ4B8aTO7dfO5MAg9apxGdiA2Cu2s5QsQp5J+VIn367R9X6L5Q5SlKbCDDluFhQlHzP26ZnXlGG
	9BBuS3aNZg2ZGIx+5Dv/d3O2x2yJPcZ4XLHeNf6EBWHoaEUVoBRccyeHdJZkbOYuJ2oA==
X-Received: by 2002:a05:600c:3b2a:b0:492:68bc:3237 with SMTP id 5b1f17b1804b1-49573d1416fmr34915595e9.32.1784815922480;
        Thu, 23 Jul 2026 07:12:02 -0700 (PDT)
Message-ID: <a2ff4b34-6035-43ba-a8b1-b308e59eede9@suse.com>
Date: Thu, 23 Jul 2026 16:12:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] xen/sched: Link CPU topology to scheduler
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Mykyta_Poturai@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260720162819.308326-1-taka@valinux.co.jp>
 <20260720162819.308326-3-taka@valinux.co.jp>
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
In-Reply-To: <20260720162819.308326-3-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1784815923-736BD2A1-22C2160E/0/0
X-purgate-type: clean
X-purgate-size: 334

On 20.07.2026 18:28, Hirokazu Takahashi wrote:
> Make CPU topology information available to the Xen scheduler.
> Additionally, ensure that this topology information is displayed
> when executing the 'xl info -n' command.
> 
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>

Acked-by: Jan Beulich <jbeulich@suse.com>


