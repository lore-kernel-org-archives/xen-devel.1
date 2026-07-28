Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707BCC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 07:59:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372180.1619576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wociU-0001Ky-Ft; Tue, 28 Jul 2026 07:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372180.1619576; Tue, 28 Jul 2026 07:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wociU-0001Kr-DK; Tue, 28 Jul 2026 07:59:10 +0000
Received: by outflank-mailman (input) for mailman id 1372180;
 Tue, 28 Jul 2026 07:59:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wociS-0001JM-UK
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 07:59:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wociR-003oVB-5j
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 09:59:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68613f-e002-0a2a0a5209dd-0a2a450cd80c-18
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 09:59:07 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a686148-f479-0a2a450c0019-d1558031e123-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 09:59:04 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49554ebb87dso32230435e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 00:59:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957f9ae5c3sm395756935e9.3.2026.07.28.00.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 00:59:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1785225544; x=1785830344; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kNw43z49eToA5T4V8xwk3lsJGSM/6nZj1+mJKzDiZ8=;
        b=WBX6OyulcxwR5+PVmWwOZv0+aNug1N0asFd7K6ri/SDqTWd/dwPpuJR/HIgQdha3l/
         JQeB5Z8fBY9jNM93r3zFZUUOOKgnG6cBJcWqn/oVRiNE6LEjrU5M8k8zqQdUgRFqIojk
         3utGSZDpzWlP3lucpDZIAc6si4nHAefJg5D8eNu2iIj4cwPbNXygPhAJIKdwEcj02ebp
         T5Z7mtop157IFxUBmu4ghyMIku0fcFgA8DDaVJrYd3XrYDtosRhREuneM28SIB8ARMl4
         k6zP9XOIyquw6rVO/jnklytPOyZH0IHlpZa7zpCS+VyLC8XaJAAKB6BjFJEqP+WbeAYV
         Z0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785225544; x=1785830344;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4kNw43z49eToA5T4V8xwk3lsJGSM/6nZj1+mJKzDiZ8=;
        b=ku7Z9qCgHQB275bkmGTLNluWiG4i+9Ya+NN8Y9uozvhVqj8i01t2GwEdDWjfeML1gb
         uzQFXKrKG0tzh73QD6QXXjHQNjACJNpDp7YloQDJ73PwQoP0n+pdfUJ1GkJrsKS1gA7t
         QULnY3NMlSQYscPJLhU09L0m7yhCIlEsEFNm07cccIxho/n59Px0P0nupVT6HRXYlD3R
         Vm2RxYGDpteatuS6i2XI+8HHFxXR3JJx+5PGbtDiYqfUnxuIoDYl5S86LFaRtdIDcx93
         0KPK2Leh9UJsdYPaQxmvrvPTmsXQKR6w0z0gyMQFDup2gUa9KuOlyURUAkvs0iVey5m9
         Jbog==
X-Forwarded-Encrypted: i=1; AHgh+RpgtcEOkbD9UjD7EG1c1VSJ1BCz95D0P+/2PlNl6KT6oW1Ig6COapMEI1Ixx0TFYoPciMNCDvOkEE4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx64z9tZx5AG1fCff0qZ89vre/QuNWyd/oMKgu8TaMTK2XphSqJ
	fzVjhvfT6VAvAB7n0TCjzoZYuwA7GMPvE9iSMwZb3L4QA4nz35A3+4sKzESYlQ8wCA==
X-Gm-Gg: AR+sD12C+5CHFK1cC2H/doQVO+dU3EsbII3zNToZwbYK+cZHpqzMPrntuthyvfbFGHm
	BPi/gh4zsVNbgHOC+zbmcEho4qpHUTeEANara9C6yu5lejjXkpTT+vo5tQTNap/2+rav9RPLmac
	xW29O9bjzDHqKyDGkpJprkGla/PGd8FiEkqHgvHMLvWfnNaUrfisi9virhDaMpVb3lNzLGnrzWF
	R5ezLYirGCfBtGe9gLMd+Rcs7YTQyS2XAMRXaF5gDyLUsDi+OoxS2exCaHW94EdVLTzVRwH4xhx
	A2+/0c0wDNlMH8xir+ruJW4n4ISPoiaGbtIGNTrBuHANeNUFYHl9Ot53wHdrMzgawx77R82So3Q
	osah9tR5fvtZOefQcc3Od73Rg72T8QLfSl7qunycIzXDoI7mJP+uAag4cAeCQdM3HuhOEJVA+sa
	IUQ0DNA3Kdklwz46gVqZ6oV5Uc1btgbJhFuW9kL32fM4DNLF6YPLhMyZUdAmVohYwu8Mols0/9a
	WSc
X-Received: by 2002:a05:600c:8b2e:b0:495:4dd3:ca97 with SMTP id 5b1f17b1804b1-496c659f843mr14541765e9.29.1785225544425;
        Tue, 28 Jul 2026 00:59:04 -0700 (PDT)
Message-ID: <6ebc44f2-c7a3-4b33-9f6a-cd48be13ad27@suse.com>
Date: Tue, 28 Jul 2026 09:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/4] xen/acpi,device-tree: Introduce generic CPU
 topology support for ACPI and DT
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Mykyta_Poturai@epam.com, xen-devel@lists.xenproject.org
References: <20260728050642.411240-1-taka@valinux.co.jp>
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
In-Reply-To: <20260728050642.411240-1-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1785225545-51339A5B-0519C495/0/0
X-purgate-type: clean
X-purgate-size: 1107

On 28.07.2026 07:06, Hirokazu Takahashi wrote:
> Hello,
> 
> This patch series integrates CPU topology discovery into the Xen hypervisor
> for both ACPI and Device Tree platforms.
> 
> Changes in v9:
>  - Add bounds checking for the number of private resources in the PPTT
>    processor table.
>  - Verify the validity of entries when indexing into the map_cpu_acpiid table.
>  - Coding style adjustments (following Xen standards):
>    * Place logical operators ('||', '&&') at the end of lines when splitting
>      multi-line conditions.
>    * Place arithmetic operators ('+', '-') at the end of lines when wrapping
>      long assignment statements.
>    * Enclose bitwise operations in parentheses within conditional expressions
>      that combine logical operators.
>    * Combine variable declaration and initialization where applicable.

May I ask that you slow down your re-submission rate? Iirc Arm people haven't
really looked at the series so far, yet without them doing so none of this can
go in anyway. You may therefore rather want to ping for their feedback.

Jan

