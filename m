Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8FFC44500
	for <xen-devel@archiver.kernel.org>; Thu, 22 Jan 2026 09:49:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1210658.1522287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virJi-0003Vq-46; Thu, 22 Jan 2026 09:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210658.1522287; Thu, 22 Jan 2026 09:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virJi-0003Vj-1W; Thu, 22 Jan 2026 09:49:30 +0000
Received: by outflank-mailman (input) for mailman id 1210658;
 Thu, 22 Jan 2026 09:49:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1virJg-0003Vd-EM
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 09:49:28 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a35bff41-f777-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 10:49:26 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-4359a16a400so658115f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 01:49:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470bfe42sm53188735e9.9.2026.01.22.01.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 01:49:25 -0800 (PST)
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
X-Inumbo-ID: a35bff41-f777-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769075366; x=1769680166; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q4fCqo5ONabOxDETkRzIQs/C9xZZRh/QiADKln5rAdU=;
        b=E9vR/c8PQbfQIVu3g8VY5Kfvwa9x62gifQRUwzk8jCEcMRRXpnnMMCgL7wME3tyYqI
         0q6BFPynfwGmn7vkKFW5S4HtlHk4D/a0ikBcDZOSFJzkYHyJ8UhsWsQwQPY8ceE1QY9m
         ipaDlXm/PMD35DMW5Umjjw192CtTAkwluXqVgo0NEtJrAGBQN9/i9+c/VmRakqe7OgW0
         gYXyBmZugyrlat/m1FgrurqUWXNoMM9IvNI8uP/eUnk0h/8DBMbM5AgWHP2RA/HaVKBO
         pNib3Nha9rfxJvEc5KMegpaLWXxw6SlQezpqSTL3a5V/4b015dEp2weJvAKGp6Cjwzqk
         066A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769075366; x=1769680166;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4fCqo5ONabOxDETkRzIQs/C9xZZRh/QiADKln5rAdU=;
        b=Td+lumt+Luob4B+/vSu5VaDX5a+SErV4YmX71ZeMPzapi4GKL4HW0YMh1oVbKS95hE
         xRn/qX4qgnDyzTEoUlpiFLKZAcQRJ5wHW4ORbdi9n/yJ1OsG4EzNj0ixTDiMQH8yntBv
         f3XEvcYioYY4UWUWkq45uouDFPuavFS7WO4/w5Ghfr5j+M7o6b5XVRSh0f7UpICq/CaA
         /U+/yB6SRK7FZUEJNrZv7jlcOz+shZj1rqO30rzIvRtJOocMhQpiO3VKVS32DfGAGL+M
         4fOBxSuCeGOmUUcToPPrCGzLpkK1duiiT/T9xMMu6/0xgANFxPtjoUmz5h9Xy/mE8IjF
         iGwA==
X-Forwarded-Encrypted: i=1; AJvYcCVRLzvrmtEJq7ENLlQW7748JJ0pUOQ/Wy5Vk50fTFTZL2TNuE6b7ZgF8Ezj7eC7ZxU7UiiLWU6N7EE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YylfQ/6J98Rij0Xo9f1/sLs07pJYHvGNf/WmE/hR3MZ+xbRlTMY
	v2SwhgzWVjvdRzTHrHRma5DM9JyEZKCrXSiBV3dXUKzXXWMWnEFT5bd2qtpe8lZo1w==
X-Gm-Gg: AZuq6aLxKsBPX/CsQjdZ7L7eTMcRxpfzztXgbmiDxRPpQZoZaNV2x8J7BZBrIhMptUs
	UKvwjn7WWeZZ5NAleXKA4Zf4Gr4/RaRfmZWwWYR6XfBHKPVXooNiNVeEifEqkEZPYJmqeiUMlci
	OXyml53k9EqvYV56mTDJMNOLb4BlP0Exd0LlQFDtDukLdMybNu/WAf7eK2SXvizuLHWe8iNSuKr
	1ABvqjwOGa67BE1vViJ+M9gQHeLYjnW40oFEsvqJGFfrhqI669eHcuyqCzIB6s23jYsB7idiThd
	srPkOVwr0sEQR7NfnADISjkfz1DV9841jWgPaGgoVdTV1eBtnOJyrKOVVF7kOU700UGH9zSX6Wx
	R/Bb6hZ8CJWjIOgK+FfoiakfvkIJ2u8jQSQs1iB737EjGQLpnl+mVfcHB+aprJWcE2Cn2oaMjcX
	u6Bz1QpOrpzQsiFcX94t+chIvhAvDFgmoeTeTFEKrTS0KeY1IyN/RPqLPZmuSrWnJGcuHwwnpom
	cdHei1aJaBwFg==
X-Received: by 2002:a05:600c:4fcb:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-4803e7900c5mr121624285e9.4.1769075365721;
        Thu, 22 Jan 2026 01:49:25 -0800 (PST)
Message-ID: <526ef477-0730-4e22-a82f-4c598ad78e0a@suse.com>
Date: Thu, 22 Jan 2026 10:49:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] xen: Allow lib-y targets to also be .init.o
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
 <20260121154757.44350-2-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260121154757.44350-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.01.2026 16:47, Alejandro Vallejo wrote:
> There's some assumptions as to which targets may be init-only. But
> there's little reason to preclude libraries from being init-only.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I can't tell (yet) what it is, but as per CI something's clearly wrong with this
change. Both xilinx-smoke-dom0less-arm64-* and qemu-smoke-dom0*-debug* fail with
it in place. qemu-smoke-dom0-arm64-gcc (no "debug") was fine, suggesting it may
be an early assertion triggering. Nothing in the logs though.

Jan

