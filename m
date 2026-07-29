Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5142BC54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 07:13:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375190.1622408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woyTC-0003Yr-5a; Wed, 29 Jul 2026 07:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375190.1622408; Wed, 29 Jul 2026 07:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woyTC-0003Yk-2w; Wed, 29 Jul 2026 07:12:50 +0000
Received: by outflank-mailman (input) for mailman id 1375190;
 Wed, 29 Jul 2026 07:12:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woyTA-0003Ye-BR
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 07:12:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woyT9-00GVrT-Jj
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 09:12:47 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a69a7ec-bab6-0a2a0a5309dd-0a2a450bd480-18
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 09:12:46 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a69a7ee-b7e8-0a2a450b0019-d155dd34d013-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 09:12:46 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-4799b3f7c83so435512f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 00:12:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4976bd83fabsm35555545e9.15.2026.07.29.00.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 00:12:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1785309166; x=1785913966; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2hL52lnp9gqaLZUAYsO8OIwtkTJek9qYOqyta5glYfo=;
        b=BTEO0kucNwl+UDOC8b8YDEY64lQbwjVJ/5cFzdKlBem3BCPf20qcFasc9nKwEE0aDa
         qrYc4HQPu1lazU7Vv5QgYcSJvi0Pyl+BPT8hctrzO+EEyyk5AgX76FwDsqVqvnKbKjS4
         mW808K6r8X4tljaIaszOWI2UA65sWbjyfRlkFT8VU+8ppGObshxahZAYyPLtS0fSevFa
         41PZYcG1rmHE7xiT9QxxwITn7EaH3j3aqF10ViDNMhxTObv5CJwkY3SS3zf087LNsemt
         HV/OM4zjlE7yFsz13bA18IP3mn1PWUkW80c39SP1QyFZRKXTuX5FZIsoHI9AHnxvH+jz
         CHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785309166; x=1785913966;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hL52lnp9gqaLZUAYsO8OIwtkTJek9qYOqyta5glYfo=;
        b=j5Ppr6DA+lyy2PJvYbNKfMXhzghLLJ5TWEgJlhNul07FusF/OLziHMsCIz5C/0Ykdp
         UGnpAvWNGXJv8B0cr3InRwU7Vj+9HTumxYhh6UcW91Ux+9HngRkz/m5nNB3zZDH0c0TZ
         ZlcxN8/oCwaPrifih2GTMim3O0bfgc4qIBWejd3Qeaf5kmdfujymhQOtpSWtXtgRbiWJ
         4MkDK7+FAfmYM5Oggzr7PbGfb4phHK5gFtTDmTNeUgUA4vSjSSqUeElm/TXBZpMVs8BO
         ON+NwKUIB9466Gry7esOhHHs3bYSRPj+0XjLNSKHLNEu/IqQWwopzGEclnMHu8pXs4u+
         UI7w==
X-Gm-Message-State: AOJu0YwEYxpqi3wlx4d1SJKTENHH/N1Rc7RciZzROrRCj4J/l0LB9FFC
	5OHYUr5EC3F2+nHLCt0E5CiSS5Jofc56dOy0sA5TIakL4Q+JA5HxE5/mKxLtmr9zSg==
X-Gm-Gg: AR+sD11UpQU+Gpc4D605weB0q6c8yeBvFT8a90OhPqskCMGC/ZOvmjzDQhX13kYYl3y
	4qbvFpBBdZWOrmXwz7dJW7bkdz9XaZPYyTQ4f1ArjoNbyoQ9KxQjSaD3+ItS1wogiJI8sEeHTaT
	fwj0icEihUpjNeopELIyFkvR1/VKS80hShfwPxBKhII1OeW7nkoVe1Vt2+eChB0UQogkQSqVCrk
	QQ1loO/cDAa+Ee5OiwF3jzAxAdTxBbswBjR5EJw+h2lGFZiFTh33laZ9tipA7NjTlSl3KiGrYDP
	GYOUynNmDGGeL/4VE2un1XXvc76bkzLaZmyw1Qm24xVYwlBuvngXfxQjM4HBWqEuBStHgP8iFLa
	SYQJge/Vw/sI9H1Nl0UlnfnLXqGp3RkyhZuUVjpdM6wJni9RDdZIjSEktM56aBfjctQANicAY3G
	5ua5cMyExC9h2OkYm0ixHCopbLRtn7EYrzrqC/37GRrX5WzL4kUD8/cKzU/lI6IzbDqH1mqI7rE
	qvsdiLc2lHpdXu5WtINUyZqttZbXRxgjxCsRuX/BfMr+Ep0A9lUs1TGD7fjrZA=
X-Received: by 2002:a05:600c:4744:b0:495:4c74:6a14 with SMTP id 5b1f17b1804b1-496c6438e91mr58230785e9.14.1785309166340;
        Wed, 29 Jul 2026 00:12:46 -0700 (PDT)
Message-ID: <bb802772-c960-4c9d-bd90-78979d7c7fc4@suse.com>
Date: Wed, 29 Jul 2026 09:12:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] xen/arm: Device Tree based CPU topology support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Hirokazu Takahashi <taka@valinux.co.jp>
References: <20260709220552.646462-1-taka@valinux.co.jp>
 <07327966-7E81-44CA-A1EA-F227C1C9EA51@arm.com>
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
In-Reply-To: <07327966-7E81-44CA-A1EA-F227C1C9EA51@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1785309166-192CC9EA-41B6E884/0/0
X-purgate-type: clean
X-purgate-size: 398

On 29.07.2026 08:47, Bertrand Marquis wrote:
> Please use the add_maintainers.pl script before sending to make sure the right maintainers
> are in copy of your patches otherwise some might miss your patches.

The Cc list on this cover letter is pretty short, yes, but the individual patches
look to have appropriate Cc lists, and I guess that's what matters for not missing
anything?

Jan

