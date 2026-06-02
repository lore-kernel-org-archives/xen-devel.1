Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80896CD6E4A
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2026 12:23:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1324894.1590392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUO9l-0000Fy-3C; Tue, 02 Jun 2026 12:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324894.1590392; Tue, 02 Jun 2026 12:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUO9l-0000Fr-0C; Tue, 02 Jun 2026 12:23:41 +0000
Received: by outflank-mailman (input) for mailman id 1324894;
 Tue, 02 Jun 2026 12:23:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUO9j-0000Fh-02
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:23:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUO9i-003GWK-D4
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:23:38 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ecb43-5cb7-0a2a0a5109dd-0a2a4506c19a-18
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:23:38 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ecb49-7371-0a2a45060019-d1558034b98b-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:23:38 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4906238c62eso92579395e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 05:23:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef358c07bsm33938051f8f.36.2026.06.02.05.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 05:23:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1780403017; x=1781007817; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f+8PSoE4u637YPK0NNw5iFwrdq8bd56YU23NtvSj/Bg=;
        b=cksLHLZYdOUUO/1PSwGcEPgG6tEMx4fE4uhkhWVaDQN52VE9BFKBQK2xyu/3fS8gS2
         ilB1Va1I8pBsmbzalU2nYGOYmGYNYyWxbiYLiUsxCAkAdFEvHhqMu8OfnXx4D3lpxk4x
         rT1tFEJdK/5qHfXLUkc6c4akQWyK5S7b5MNRXxO3q3u7W2LQD3CDBSOBi/agzyAbz7RO
         rNRLUDDvdJtVR9vFfz7Zavdj5+4fk0d84DkTJpyuAwfuxpkpu3npi7YzoQZUK9iPBvPr
         lFqNfl27XqblUs1cnzJ9+mp4pJA3YY4KiS4IclnxLLPRB8ZmRNhe0vam9ZgjeP6zLCyN
         TKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780403017; x=1781007817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+8PSoE4u637YPK0NNw5iFwrdq8bd56YU23NtvSj/Bg=;
        b=R71qnuAnp/ri4mUXpDk8WKlW6k2cy9vlmIAJZEF2dBuJEjy0fnuCqMebFBhFefIWdI
         uyM4e8MHnfSEMOBHIpIGuIE8ICpaLd8DPbi8rWbctEa58RIyJNDaAUCK/ga7e0OvOIWK
         WDQ2EwDYRQFDEQy3FeHrIrDYBWneFXv4f19WutlpiFrTE1VCFTm0wtUyRgKWN6l+DTsb
         fWBD8as1NS9gZc2FPkUkTuIhxAoRp8QmX4wXg/sa3EpihSgk5WVmPaYxV7uhkBf3xm2I
         bmCx5YSDZt3uvA7FkbcGOybk3Xo4mHlW3PafZqJ/Q5mA0XuXNyB/loI2JMbAGmHGZeFJ
         6oag==
X-Forwarded-Encrypted: i=1; AFNElJ+O9X6w8tgVp3nDFkdaU+sj32YmrYW8vdnosm/JD3Gh93vMKTSmuE9RRPMLKxsQHmU3v0DnLX4gS+Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGfUM7ntcxhBWditGqTpKXL2sB29Y83l4nLwVx6Lh3sxQitYrZ
	80QCIpss/daY1LoE8L9l8To2CdnA8ZwgejcFlM5VDGlb3JfUGq40Mm02tz3Bx8Ii7A==
X-Gm-Gg: Acq92OFidRdg4YW1cHgYVKIGz+91MBMiMw3120hXND55izepqZpKQhMFX+zVzU9T85m
	vYatZQcC0ZonU8ANzZloP5S6EV5oy53UyG2OtTmt40QLIn5GFPkfShhNNgM0C2PWfEu/GBs5nAc
	//xrb+2X17tRHR9Y9HonOkwAwuqNUBgUqguDiJn/CnNk0h31GlhY2UQckLPmKXuAtmqDbrO0cnm
	nyklvnO5vgEeNNqNJWfh1lcNmHZJDhxAi2AF3QH98bzgtQJhJ2TH5aQc0pvGZZlzlBVjenqLOXE
	YPh2jsQIzNM1R2tAn+LqXNM0upjeKHKVId1ois/7br3NdF2n8qA2fMMsiZna5bIM6Qev2Cxq3Ov
	CK9Zono2Jn7OTiOl33JVTHDN+8RVsVZEleHp8sElxKEu5MH/Hg6x6NfKwnArJcF9Vmn3KzJ5OKz
	e6flMthxSNW4uE2Mnei0E359dEl0SlowL6e1T3ln65r6m8ofelqXF+Z3GI0EIG0ga/eoPL5g1L5
	cwbXxjVOTFtqMU2XobbCqR4gw==
X-Received: by 2002:a05:600c:34cf:b0:490:6869:46d2 with SMTP id 5b1f17b1804b1-490a28d3b0fmr282601705e9.0.1780403017488;
        Tue, 02 Jun 2026 05:23:37 -0700 (PDT)
Message-ID: <ddf972f5-fab2-4833-99a7-d008f4d2c7e4@suse.com>
Date: Tue, 2 Jun 2026 14:23:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/efi: avoid a relocation in
 efi_arch_post_exit_boot()
To: Frediano Ziglio <freddy77@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-6-frediano.ziglio@cloud.com>
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
In-Reply-To: <20260529153531.1341542-6-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780403018-8C67DD75-E6668B69/0/0
X-purgate-type: clean
X-purgate-size: 554

On 29.05.2026 17:35, Frediano Ziglio wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Instead of using the absolute __start_xen address, calculate it as an
> offset from the current instruction pointer.  The relocation would be
> problematic if the loader has acknowledged the Xen image section
> attributes, and mapped .init.text with just read and execute permissions.

How can the loader respect what .init.text wants when it sees only .init,
prior to the subsequent patch? Was the series meant to be ordered
differently?

Jan

