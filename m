Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C322CCA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 11:29:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446176.1662242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGED7-0002mX-Jy; Mon, 12 Oct 2026 11:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446176.1662242; Mon, 12 Oct 2026 11:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGED7-0002mQ-Gt; Mon, 12 Oct 2026 11:28:53 +0000
Received: by outflank-mailman (input) for mailman id 1446176;
 Mon, 12 Oct 2026 11:28:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGED6-0002mK-Mu
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 11:28:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGED6-00FCNG-3c
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:28:52 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accc464-e002-0a2a0a5209dd-0a2a4507ad70-20
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 13:28:48 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accc470-b4ea-0a2a45070019-d155dd36c0c7-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 13:28:48 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48b042c0759so1291418f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 04:28:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18c198134sm281873115e9.15.2026.10.12.04.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 04:28:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1791804528; x=1792409328; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvG4uFbxyMBQZHqSDuK9l64EmZUsssHbs9zC8VGLI9o=;
        b=Sg2S9mWtKV7mdrwmYHiBJPigXP3vCMYHgg3oIzyrnDfmS7KP9RpQWRrom3nih6JOrc
         s+hNKLAiKPkQq5HVlqjMTingAl1hqvBcZ44bEIcgvai6CwZBh79WDE9lqT/rjEiylC8l
         exxiOYFQqLybJzSlN1zDw+LvuWJZKU3ayjdOEfBXFdGPaBaQaULjhrr5AE5R6IZdtRbg
         3nNlU2mzQPoegXOEyO7++QTRfUTK3NMypui4RuRXofRguvUoZh+Fz5+TIOzva3ySRzKv
         +5yx5NFMkFeBzuhlaO5N7lGUefPqIto8rlnL44woqcBcZg9XYrgtmVcGJcfdTlaYokIE
         oDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804528; x=1792409328;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DvG4uFbxyMBQZHqSDuK9l64EmZUsssHbs9zC8VGLI9o=;
        b=lydChGFfT1eSy/X8xixqzHdiN/Nxu2JR35849CD7ZDMPGWnRqm/oZQ2oU14dGrhJaL
         GhBI4WomD2kJTLztDyb75SxEIcb+AmiUTUEHwJovMWV+KrostZFBjKFqNVS/f17RZM/v
         c4nDYNTJdCDUA0QfT1sqzr4jbrMWNXb5+S8KAp8GPg1gYue9LPGxNqB6Hp9JzbT3YWBg
         c5ktJqJnGRV8qibw//1gbfIWbIUKvq4lo5ZebPvR1BSiUpsONln6t0qhDc1rRPK3ld/e
         D3THv+i5XZY0FvMO12z09qeyWCsUNrEHwl+TqyhmeQVHeR7LhuchVm8AlE62N5jh+Pt2
         TTVw==
X-Forwarded-Encrypted: i=1; AKwUvBxExlbav71ukyz8hezUEPj3p5tsgrW0KqBg9U0CbQE4vT5rWLd5FtOws7OXszwDiI5zmv6YOSkhhBo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIX08dhjMhu+OEr7cuSeunF71CRL6yNx1rQ+nHtDI3lLe23l0L+
	r5XpANV5UJfgTtmNdeI9mjLa7D70nANZZ325I++bT/ku7IQQX74A2GjBmYI2eVJZS4sASCOw7tv
	Obxl7Qw==
X-Gm-Gg: AYBFou2pTlNnbrF6sfZ8nbuEmppbNLf5BrEw/BUjhq/kOQt6kuNZW4X6Kv6K96jOnvy
	N3SH9hZ/lxYSL88Ui26SyfTf6fG35kBc9wMgCMbuxaW2pNLxxvpgwv2Z9MShQUMuW/QEPxPk6PN
	bDoAPfQWKFpY+RY93s9+loIozuIP7YWWqCgQYlw2B9NgFyNxbpraOMOr+WNDBkMXHKOxBWL7fYg
	GL+juY5nec+ycM03xazRvLApDMsjdbsZTa8R/touvV5yBA2odx90glT5qJ5GQfsXAdkTOvkciCd
	Co+7xY7KbepScXG0GTBpVHg99uMCIatg+xBd2SA+PQPXdobSb1Q6WTVidJMd07gCkPkNM8fuv5k
	gAzHbc8UAa7hOxh5go18Vh11NZAyj30tLJlCLSUmJLi+1oL62vzdRAKUTSssFf/bIUHsIS+yq5q
	TwS4nFGTRJF0W44kvbjd+OfV8BYXch+tOSfr/c5/zrkE0LA3vyzfw8L7jRtfZWwN1TjzzezXGQP
	jJ2v334ySiLH2uZjMfUg9v2CbpKVlyRbCX1HwzJ2OyRFLnGEXNUqTuEIkLrEg==
X-Received: by 2002:a05:600c:3b87:b0:4a0:1b15:8852 with SMTP id 5b1f17b1804b1-4a18e4a977fmr219566305e9.16.1791804527667;
        Mon, 12 Oct 2026 04:28:47 -0700 (PDT)
Message-ID: <b98261e6-5257-4cf6-9037-3b5cb6cead88@suse.com>
Date: Mon, 12 Oct 2026 13:28:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] x86: extend do_mmu_update() to support returning
 the old PTE value
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
 <20261001174749.2275245-5-kevin.lampis@citrix.com>
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
In-Reply-To: <20261001174749.2275245-5-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1791804528-A5AC0AE4-C630DB0C/10/78276251493
X-purgate-type: spam
X-purgate-size: 749

On 01.10.2026 19:47, Kevin Lampis wrote:
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -349,6 +349,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
>  #define MMU_PT_UPDATE_PRESERVE_AD  2 /* atomically: *ptr = val | (*ptr&(A|D)) */
>  #define MMU_PT_UPDATE_NO_TRANSLATE 3 /* checked '*ptr = val'. ptr is MA.      */
>                                       /* val never translated.                 */
> +#define MMU_PT_UPDATE_SWAP         4 /* Update and return the old value. */
Imo "atomically" wants adding here, or else the operation isn't going to be
of much value to callers (due to the lack of guarantee of atomicity).

Also, spotting only now: Is there a reason the entire series wasn't Cc-ed
to Roger?

Jan

