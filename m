Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3432CD6E55
	for <xen-devel@archiver.kernel.org>; Wed,  3 Jun 2026 05:46:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1325618.1590914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUeQT-0000Rc-Rr; Wed, 03 Jun 2026 05:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325618.1590914; Wed, 03 Jun 2026 05:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUeQT-0000RU-Nx; Wed, 03 Jun 2026 05:46:01 +0000
Received: by outflank-mailman (input) for mailman id 1325618;
 Wed, 03 Jun 2026 05:46:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUeQS-0000RO-MT
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 05:46:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUeQS-00EQZn-3J
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 07:46:00 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fbf88-bab6-0a2a0a5309dd-0a2a4504b0fe-48
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 07:45:59 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fbf97-1dec-0a2a45040019-d1558032dde8-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 07:45:59 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490a765d410so36601345e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 22:45:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351d69sm7409731f8f.29.2026.06.02.22.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 22:45:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1780465559; x=1781070359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=00QWD6g6cgqzTL5wMljjNuOcrJ2EPqZ23l3Q/RTos00=;
        b=PD2gFNsu06GKd+lCC4XuZ/TdnkKX8e6yp4+W58AYXE4MdEUeRig4kXrgF7eR/xW3+c
         H1ThT3aJ6bDBa5EPSAm+rwTOYfOL1pVfis8Kippy538U/6GBWLLIUp4ZySAy8UIdFmYH
         0zKf4dcxrnQkNFjoCR46/7VJzQMlmOlvuR+GxlTFEDMJWAGSjGZ8yCFNQXAm5VnWGVvh
         dw8d9IKSYssp5OMqRLAOWm+SuaT3CBUAaBObxzCWH5B9V5vi8wgdYwHP9cUMb/tPYHg7
         HbWBdK2TQzrmW8IXdXL8zarRDce+ICWDYll3pp46EMMlajvNz87ivv7EKbZsifPasSO9
         mN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780465559; x=1781070359;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00QWD6g6cgqzTL5wMljjNuOcrJ2EPqZ23l3Q/RTos00=;
        b=cfvTiW4xHt7yGXNPgPPxJu01gsdK0R5ptLNxxTmwQDQyTggAAsdSBm4Q25O5r+czoS
         czu0DFjunoU4Il/ho5CWxEsBqHaALtt4ZD9CSHKwPh/Xmcyb35cx99UwtxsE4NzA+fwY
         H/zpcaFno1Nz1UJ3JzuTr0+Y7mfN9rShIO7W5oRaSDF5dr12uGDlHCpqoHKatjzxMtsc
         xY5XlRWU2jChp/nwmn1tuWKn3xdlHCGn5jBMLRONXMhTFkKalSiWzybuUw7rhxeURTxh
         gMTLuf339siD5TLD79TL8j1R/C16wJn0nE+fsASe8wn/YS+rUvO30Z1a6iemnBmxRlTA
         7A0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9RacubYXJYCLLg9ZmCaPNCHzU0/GWG5nd3hBG5rGoD8eeZGtsy25SPe/OFO+YNT2eisdRxda3bzfE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwL0osHI96J2i/HGLPS+fQ7y+g+CJfnq6s0Yn4UxSZc3CcDTyAs
	lqKrJihT86VqBkyfgbOTx02boUD/lJGXgSXSOVBO3nLUChLBn85LR9Umaq9aezJNSw==
X-Gm-Gg: Acq92OGLvIK3YqL35/5QVLYRRNGsNnfOZS0q+akfvRgootLePVWm+XFqWgmJsV6RcG+
	/PHs6/Rr6GmXkWpqKdwrs3oxdfRJTs0WnTXFBxcAMPspQj22H6Kj4LoX+rFFxt1LtgD3ZhxjjXu
	8UHGDdRH1pMnAP0JAfTW70N1S5gEmiEdro0s4DI9TSrBkHvvLz6uhTs3AP28FyEszN5xLvRQoBn
	pQyk5pgLCGQ1Lxx5jvJOj4L0jz2zD0jDWA8Re/v9bRMr0dLnCGK/Rn0lM5Dy21xEI55b2dj7x/I
	+Z/2wwwP1xL3Uui/aYhshXGZ4LhkcNqn7Tjp0QzqBZQ93tlpTMCDqmMVRijsHMw/xYYQqLYBthV
	IR87khozmWxlnwCK4CD0XvPhxZzrFptHqatb0ElRAK9y7zSEJ189GAhe38IOwOA8gMaDSYp4sN7
	GbJfUpUvBv9RvPZBMLwsrcxwyxuda9T6n3Jbu7EjXjLeL/Rf57OSROm8+LRsCxMLbbOfG3IQgZK
	P9AtLKFRE/o2L4rhByo0Nj0lQ==
X-Received: by 2002:a05:600c:4fcc:b0:490:ae94:a7e6 with SMTP id 5b1f17b1804b1-490b5ebfc5amr29115165e9.24.1780465559356;
        Tue, 02 Jun 2026 22:45:59 -0700 (PDT)
Message-ID: <2fceaa79-91cc-4b9d-a894-0698cf756778@suse.com>
Date: Wed, 3 Jun 2026 07:45:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ns16550: properly initialize booleans in
 uart_param[]
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>,
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260602161322.1039349-1-Zhao.Jiaqing@amd.com>
 <20260602161322.1039349-2-Zhao.Jiaqing@amd.com>
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
In-Reply-To: <20260602161322.1039349-2-Zhao.Jiaqing@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1780465559-411763FF-4594CB3A/0/0
X-purgate-type: clean
X-purgate-size: 291

On 02.06.2026 18:13, Jiaqing Zhao wrote:
> .bar0 and .mmio in struct ns16550_config_param are booleans, hence they
> should be initialized with "true", not "1". No functional change.
> 
> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


