Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B617C5CFEB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 15:07:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390182.1630711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuX1q-0001Sd-Bx; Thu, 13 Aug 2026 15:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390182.1630711; Thu, 13 Aug 2026 15:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuX1q-0001SW-96; Thu, 13 Aug 2026 15:07:34 +0000
Received: by outflank-mailman (input) for mailman id 1390182;
 Thu, 13 Aug 2026 15:07:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuX1o-0001SP-Ra
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 15:07:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuX1o-003Z4Q-7t
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 17:07:32 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7ddda2-bab6-0a2a0a5309dd-0a2a450bcfb4-46
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 17:07:32 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7dddb3-b7e8-0a2a450b0019-d155802bb5d1-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 17:07:32 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49557167508so205735e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 08:07:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499820c2897sm134876285e9.0.2026.08.13.08.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 08:07:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1786633651; x=1787238451; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wR38hHyS68/61PMDdPsBtmYQNagF/8h/0Ls5CFsUM7g=;
        b=e/mTLoVRqpHcJo1GLkqB7serJHh7EQgQLF8N2Z9qekyug4SItBJFXykS5kHOJ5Cm/t
         rlXqgNFuIQHGdrK+aXBwXodrgJSLP37Q7mjHUCD8Rfpw7Q7VPbRn3tnE/WhXv1EyIxKV
         sy8YjvKV3yu+kPRiT7ZWnqkA5RmCqxZ7FFHb2rtVgw5uN1fj5/uSZGHojeJusLkGfHYo
         dfTpqTx9eys5DCIVCyy32C8hhD7GVbTlDALwQVjTWZTRrz0MKR4PbqO01DXNWhqg8kLw
         5P3XAsOSb4A0z17OBNva7tR/LKmWMLl660bcpJsDMoKF9SC21rxzVmbmOPUfi3bGYHZA
         DqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786633651; x=1787238451;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wR38hHyS68/61PMDdPsBtmYQNagF/8h/0Ls5CFsUM7g=;
        b=Y7j23ZXcNH5BvSIDVljiT1hswQJwYfyCrrZXnCFF2g+ckxHtsb4vuVSAC2JCgfHKlX
         xuv7gVCah0YoWyHYyclGz8ZeVxNR/qJnyaOF6ZW6+DJao8DUkIdRWjYBOFNZB4UxeqcK
         aU62QtkJnSj8kNIqBbAMdvpqGEcUdHYbocJuIjiGcRuFGGwHTd1duSuUsbHjP/DlbLYP
         KJX5svgMA2FmCH1SZ/Q4j1ZIN7j2JwRSbPJvcNlXAHhFMk/9gaSF55NehrWdkG/qhZ1O
         l2gphrYPIrFqxl8cwYWWNUvM1vNyVQEjaZHkDRjLWAIBUmrPKeCsIbMDHhHCpoBKnGDZ
         EXGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrsyfA6Pd53B5mvmAbnFbEFF2DOjQj3Cme0cNmAqdYq3Scf5sw89v5Lpc0JKf00KhkX8E7/sqHmH18=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx010yliwkdoaRYV2/CZnRI7NMetnqZx3tkC+jFKJei0LF1BpFo
	nZuTT5uI5s+x7R+HgKJCLMWJsXo75XrjZ7F2bofUsprgLcBzQB0LV4xgxW9jjIBV+g==
X-Gm-Gg: AR+sD10VhXXxoUM9Rti5KaUf96d8JlRA3HQI7T8VniW6l/gnOXkjIOy2VgsT2MchvIe
	BNzPZ6b9Xm73HxVnQtNyhqyzixVnobYs4j1sFevwh0/OOlAFkWelGAi2q3+7iJSUhmZhm1KYbHJ
	pNr/ePJQ3zdO9bl9Dbice6bul0oxHPoxwJSFX73AeqfqB2hT+jmT3OVGJMSZiWNjdQl1Dcw2Qlv
	fmt+TxPAzPXs76v5Jde+ZUTJbltnJQYqaYpJ3JIa+aDtl4RxJ4iTkQi1yEVR+UoPi9Oq+GgdyJV
	8quzXtYSR+QiYZRLzDf0PkB3CQ/UkhczVnaW1OlycTdknpj1CbtHnTKiJNvT/sZNL7wAYSMgKmj
	JZcs1YdoquUrQxFjrp/27yR8ajgRBc1+trgTM6fHpEO8Qg+LGDzR+h4Ai+OeOpjFohsqK/DJlfD
	kqTnNwTkUZawMyJrXCK7+Xorr4VLd0g43OSlNeH7LDwY2e6LHtYhZKHVH3vu8hLYR6QVgmwIJ6w
	KaGJvMI+GxU4NKHXqcmPF3hqvc3tUypIVJyv4NteCpVEV80YiZcpK6phg==
X-Received: by 2002:a05:600c:1f91:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-499821f0030mr67756155e9.12.1786633651506;
        Thu, 13 Aug 2026 08:07:31 -0700 (PDT)
Message-ID: <90c76782-c44f-4f0e-a187-0625373c8d2a@suse.com>
Date: Thu, 13 Aug 2026 17:07:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu: Rewrite initialize_cpu_data() for clarity
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260813145349.1656699-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260813145349.1656699-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1786633652-1BED69EA-52BF1EB4/0/0
X-purgate-type: clean
X-purgate-size: 638

On 13.08.2026 16:53, Andrew Cooper wrote:
> Without passing opinion on the behaviour of this function, it is deceptive to
> read (I've twice now mistaken it for resetting boot_cpu_data), and
> inefficient.
> 
> Instead of having a 256 byte object on the stack and a double copy, copy
> boot_cpu_data directly, then reset parts of cpu_data[cpu] in place.  Leave
> some comments behind explaining what's happening.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

While I think it was good enough before, I also don't mind the change:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

