Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9705C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 15:09:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366701.1616647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlpcW-0000LY-Ra; Mon, 20 Jul 2026 15:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366701.1616647; Mon, 20 Jul 2026 15:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlpcW-0000LR-Oi; Mon, 20 Jul 2026 15:09:28 +0000
Received: by outflank-mailman (input) for mailman id 1366701;
 Mon, 20 Jul 2026 15:09:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wlpcV-0000LL-Bw
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 15:09:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlpcT-009sHG-KR
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 17:09:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5e3a16-e002-0a2a0a5209dd-0a2a4503e8d8-44
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:09:25 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5e3a24-fae8-0a2a45030019-d155dd2fe59e-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:09:24 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47f707e5d75so960378f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 08:09:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e496ffsm30186835f8f.3.2026.07.20.08.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 08:09:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1784560164; x=1785164964; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zb1vNkLBdFCkrNLsS+pMSBjXT/0AYGorFJ2yERp/1w=;
        b=DrXh1ONU1503SH9BCCyUvV89o6UP8UALJborVH2yRMdgUv/xEd8sP/lu04Md5cKIb7
         ldSOHUNEUZL5Gjb/lOvYYD/5ftSbfy9Ni7Mo1G64sm6KiqTFIhCCj61NB3m7DhHA8Pdy
         yvb8zjRpdTkb1cdHTw8XRonA16yjsQsGeBbsD7htagurTVignZW4Xrt2Q6DUSFhdfE4J
         4EmjW1lJMADz1vna5tJOEcqgtQ2FKidT2sh6sosWJb2z04kUUNLOFky2O8J1iZ91wIz9
         KwOeUr7/NmZpfajjF5rKW364xbYdgTp3FsH2YA1QDTEsRBoaMwffIJrpYhlzz934k9+E
         7gEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784560164; x=1785164964;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zb1vNkLBdFCkrNLsS+pMSBjXT/0AYGorFJ2yERp/1w=;
        b=rBIMi7TuP3f4jgZLmRNpvmDNTAvHa8oUZshxPSKxM+zubjLaT8VDmOgJexcOdk5Qwo
         MeZQGpCfNunrYhdrCBLg3rqaK2VwDM8aTduK81jq7RDVMzoD3g4kOHZSE3SYiP5/gEnu
         2ROcw1l9D2a4m5zwkirJw4qufi3TUFI4Z8od2pMp1vgYhp7zynSMb4/ZIWQjY8ja2XxQ
         2HGEbG2qTdg5JZOf0dZiIow27ZSbQFKdAqJ4Z8jw7Xm1bH/Q3wvsdh9jcg5xmOAx82bg
         t2qCWg85t3qTGn2nlFrdc1d9k3pQWSgyPFHhN1V88EvQe9Qu3z17/RcR4yWEDOvX427I
         80/w==
X-Forwarded-Encrypted: i=1; AHgh+RqW4vG9etKXFCtYzpKdpBUDk7QF/DG7cIInzr40552pcF9P2Bbjo1BE8c7m2Ea7FSfcCFO9mMVQw7E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9h2/iY00JHRS5J4jUymhuy3KhcXL33SicJySde2PBp90fvMEB
	agQDHwGVXbsdmVx5vk/szZWXIdgW7Muj22jDElnFH0OvCbhWpueIhOzZxRXCQSdy+A==
X-Gm-Gg: AR+sD13qVCpOkD/lGIUZVTAI2NC2qjhNKf3yQjXBzPGcAzK7kUZuFu8ce5pBBk9wmuf
	uRUvFAwvzc/0c/ozyFaJfwd6Ve3ZodHz8hueCXMvIiJ8ZzpIJAhh4mkLcqzShkA6YAwu6jzc+Iz
	FpAOgo52fNnpJWuIRU0pwEfpRKJrs77u9ePpaQTi7GdhOwX1WNu/6+hlrPxDk+gwvQsS6+c37MW
	ufB3Fmvl88RmQZRRt5e8TPlv/PUkH55TMWeHNoKdOz56BIm2zZLG1CLsVkiXfxeeE59GUD4gBI9
	2PMWataApmxdmgoooeufCFBsA7XuAn9a3WTLT7GcTUT6lreL2bMfoceiPadr7E+zWrpZ/tH70B8
	UAS9feB4HHcAMO9hPMMLVXdnAt1/ZX8pIO3mIp7zgWssdsf6zvY9r/Fhz7HRuIi9yHflqLWu/3g
	hoDzE0pToRuIyO9A5Gf81CpFWO4ysqhw/siV1QwXN25OI8CK7HQ/kln2WdYRiqNl++IQ==
X-Received: by 2002:a05:6000:4615:b0:473:1ccc:15bf with SMTP id ffacd0b85a97d-47f62334c16mr17230718f8f.42.1784560164316;
        Mon, 20 Jul 2026 08:09:24 -0700 (PDT)
Message-ID: <89029dbd-df1f-45d4-8a02-720cd6a42cab@suse.com>
Date: Mon, 20 Jul 2026 17:09:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/7] xen/serial: harden serial_tx_buffer checks
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260713181619.672176-1-dmukhin@ford.com>
 <20260713181619.672176-7-dmukhin@ford.com>
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
In-Reply-To: <20260713181619.672176-7-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1784560164-6C6DE4E9-B29DD7A9/0/0
X-purgate-type: clean
X-purgate-size: 2730

On 13.07.2026 20:16, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Ensure the user-defined value never crosses 2GB boundary and always
> rounded to the next power of 2 to align with console driver conring
> buffer management code.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v6:
> - new patch
> ---
>  docs/misc/xen-command-line.pandoc |  2 ++
>  xen/drivers/char/serial.c         | 21 ++++++++++++++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 1c711fa98086..2be8772b329a 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2396,6 +2396,8 @@ accidentally leaking secrets by releasing pages without proper sanitization.
>  
>  Set the serial transmit buffer size.
>  
> +The value provided will be rounded down to the nearest power of 2.
> +
>  ### serrors (ARM)
>  > `= diverse | panic`
>  
> --- a/xen/drivers/char/serial.c
> +++ b/xen/drivers/char/serial.c
> @@ -16,7 +16,26 @@
>  #include <asm/processor.h>
>  
>  unsigned int __ro_after_init serial_txbufsz = CONFIG_SERIAL_TX_BUFSIZE;
> -size_param("serial_tx_buffer", serial_txbufsz);

Before making this change, surely you did look at the difference between
size_param() and integer_param()? You should have noticed that you regress
behavior by ...

> +static int __init cf_check parse_serial_txbufsz(const char *s)
> +{
> +    long long val;
> +
> +    if ( parse_signed_integer("serial_tx_buffer", s, NULL, &val) )
> +        return 0;

... using this function. It's additionally unclear why a signed value
would want parsing here: What's a ring of negative size?

> +    if ( val < KB(16) || val > GB(2) )
> +    {
> +        printk(XENLOG_WARNING "'serial_tx_buffer=%lld' value out of range, "
> +               "falling back to default\n", val);
> +        val = CONFIG_SERIAL_TX_BUFSIZE;

In the earlier patch you used the upper bound for too large a value. Why
does it become the default size here in such a case?

> +    }
> +
> +    serial_txbufsz = PAGE_SIZE << get_order_from_bytes(val);
> +
> +    return 0;
> +}
> +custom_param("serial_tx_buffer", parse_serial_txbufsz);

Overall you're duplicating behavior that serial_async_transmit() provides.
Why would we need such duplication? The more that there everything up from
PAGE_SIZE is permitted, while you require at least 16k. If you want to add
useful extra checks, put them there. Bonus would be to also replace the
alloc_xenheap_pages() there (unless there's a hidden reason for it to
remain physically contiguous).

Jan

