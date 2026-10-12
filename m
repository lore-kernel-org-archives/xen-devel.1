Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA23FCA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 10:23:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446086.1662067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGDC0-00056u-TL; Mon, 12 Oct 2026 10:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446086.1662067; Mon, 12 Oct 2026 10:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGDC0-00056n-QY; Mon, 12 Oct 2026 10:23:40 +0000
Received: by outflank-mailman (input) for mailman id 1446086;
 Mon, 12 Oct 2026 10:23:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGDBz-00056h-Ly
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:23:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGDBy-00Fmmk-En
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:23:38 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accb528-8faa-0a2a0a5109dd-0a2a4509b2f0-10
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 12:23:38 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accb52a-be1a-0a2a45090019-d155802ed1d3-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 12:23:38 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a19cba5c14so10157575e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 03:23:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf31b83sm287559035e9.12.2026.10.12.03.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 03:23:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1791800618; x=1792405418; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ansDgR7RJt96a3kt/TMeDi3Mw9LXC4Q0H5qpIUi/wc=;
        b=MaRbJ87CCAN9OaH4XBpkiM+hamjTcP1XXGi2BYbkpOuwsTGDKErUbmsHMfx4ti9RDY
         pyTpvVzcO9rDP8lOh0qSh+nXs3VimPa76r/rqUQkmJRrRHRuavZYbNnYi9XQnMfmcv/b
         F8uMQy/gNyZSem7iGJcZmlTVTKt7ziHG2ENQW+pPLdhZVxaeC6MoKBWW8V2EJ0UPzcyR
         KswX3K5/t7BAKRQJDM1coDPoiRs9Hq60vF6/pBV1dcEBll/+IFM/Nw49c+pMnJ9K+FgK
         6LibC9bzYjmkbbc48Fj50WXhM35CY+O61MJBDTcro/sb8cgVMrl3W+CcHaqgloDM3PgX
         ZXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800618; x=1792405418;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ansDgR7RJt96a3kt/TMeDi3Mw9LXC4Q0H5qpIUi/wc=;
        b=BNANVcD3oitCj+LdGF1zK/sXD4ubX4NlXqImDYJ2a+J0Wzl6Oci552UZ1GgCrS/NWE
         yQuWpft+DuLdQlEaSSvPxt77bCR0K1L+/zTMMuTT+k4mzPiqNp2waieysxnFywv+DX+0
         DjDwOB79SmBeANoxIsEkGaDlfSN6l8yhSSroBTcbpv7m9aCHH8v0333BCxlTm5ecDMTq
         /z9LzNC2VslXBnd66ydGjj5YuMtsW11Ep1wT+llFxuRaCRKHrdwJgts0pKA7SgS6sYRf
         zhYSeXtzaJ4nMnviTGgeUnK5w5JAIP8wnmkk7U964RR5Ikiap1YOi5vrEwKM0lj7m/1G
         SuNg==
X-Gm-Message-State: AFq9FYIGe4r1pkwu5lw9PgfzcmsopyrEUpeLC8E8Hcy1XwHmOt0tK/4D
	b0SG4zhX0vKmVo3eyyIcNfWly6sbposXZmIOhKi+xzpPpmJ2JmsAtCdcxduewi7Orw==
X-Gm-Gg: AYBFou3neubCpJCvzAy/XlK4/YvV2p1GPVLR9SYXBNZODfgYCFCf84OntUasypJGv/J
	bJGoVTjcUmHpAywEIgN7ENz2lOJL4Re345/0GbCZ+X200dU/mRDtwXFT3H/nxnRxSkooj8T5TpC
	bn9CaG1M0iPdqheVF/zVBRVRphxJ7GD71e4rWhqBVZ2cyiN0CisEiz7yZLVKmrBoJb85FC4rLky
	HaImoScd9JY0y8W/qkZyYhVb896AiqAs9hZbLWn5UGZCWVkPwL7NbUU34QaYlEcb9wuXNc8LTgG
	Y0F3hBoaqCDlBS5Fl7PL3ZvwzjhMj1dl1Ewlv0FNgL6xLMQwxiwGgLHBRRn0CJtTjppzITO+lQ7
	Er5PevJnlXUjHymBOr/O4Sk75R73N36DRbW3bUAF2DJVDbUWYgHg+a5Wo5mvb+FZCAnfghDZtYL
	qJtER/q+j9QpV6V3BWZiEpDJR0FUc4GvO7OmfiOmmrYC+RlcHWzDBJuvmxbvzkJbpRPKjIS58FM
	K7CQHXoa/bcGpuF5pJZG45v/SCzpWCnCTAY0kyF2SiF3tz4moPWJzVQvHqIpXY=
X-Received: by 2002:a05:600c:4e11:b0:4a1:7f41:b9dc with SMTP id 5b1f17b1804b1-4a18e4d67famr175900485e9.23.1791800617610;
        Mon, 12 Oct 2026 03:23:37 -0700 (PDT)
Message-ID: <059a456c-9f84-40d3-8f88-7c9599abb04d@suse.com>
Date: Mon, 12 Oct 2026 12:23:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] x86/setup: break out E820_RAM accumulation
To: George Dunlap <gwd@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <d1a67360-838e-4d9b-8b91-1ebfd9e6f613@suse.com>
 <CAFLBxZbOTQ=BoAU6Q=kweUSTVi_MxnDANTKSVn7TSgZ+YZ6vgg@mail.gmail.com>
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
In-Reply-To: <CAFLBxZbOTQ=BoAU6Q=kweUSTVi_MxnDANTKSVn7TSgZ+YZ6vgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1791800618-FD06B034-999596D1/10/78276251493
X-purgate-type: spam
X-purgate-size: 414

On 12.10.2026 12:20, George Dunlap wrote:
> On Mon, Oct 12, 2026 at 9:20 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> We already have two instances of this, and we're about to gain a third.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: George Dunlap <gwd@laleolanguage.com>

Thanks, yet to double check - did you really mean to use this more private
email of yours?

Jan

