Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B14C44512
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 15:49:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364322.1615593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkOLG-0006kw-Io; Thu, 16 Jul 2026 15:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364322.1615593; Thu, 16 Jul 2026 15:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkOLG-0006kp-Fa; Thu, 16 Jul 2026 15:49:42 +0000
Received: by outflank-mailman (input) for mailman id 1364322;
 Thu, 16 Jul 2026 15:49:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkOLF-0006kf-9b
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 15:49:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkOLE-008L02-FI
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 17:49:40 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58fd72-bab6-0a2a0a5309dd-0a2a45058618-34
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 17:49:37 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58fd91-4cb1-0a2a45050019-d155dd34c8d4-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 17:49:37 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-475417f010dso3519376f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 08:49:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f4634e0e4sm26669397f8f.4.2026.07.16.08.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 08:49:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1784216977; x=1784821777; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RlfVTDPJJLJrXyj4G1qVW2wDKeCcBC8qeWz9AgrYJ6E=;
        b=M4UlgtDCBwBxudx+GtXkf3L6ZCiHO8X7UbtrB5zdR9dOE0wSDoj/SRbwvLWrmBBNZx
         gATc9WadhR7WSQink7qr9K4r/cnmwG3pSZR8t4BwPmqScnVJPcAD6tTXfrh6ZunlyGSu
         FfNECsEt7Ibraalo74K/Y28KfRsSW11TQPqRfsVh4CcS5DPkpksG1N1MzlorkrEvRvEr
         OPDRI40r1w0UuzyRbkGVoZgEDorzS1cxMRLQNIBDYjcFsBF7MI0n5+aYprpkHmzNPoSb
         aZSkxoWAMCwaHQC3Y87VTzrUKNBFC5xFTE+rNPtrlmIWIvgO8iZbtKjDkStosGuS7G65
         f16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784216977; x=1784821777;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlfVTDPJJLJrXyj4G1qVW2wDKeCcBC8qeWz9AgrYJ6E=;
        b=F/9zl73H6HrswKj6vJCWlF3wBjiSovahJMMIK3U5T+gCp7dQRYxwDOLuAts4xKYAFx
         gQF15nbZ5OboYcjTYhIUU2FShp6smmIOUKpsxJgazpDzum53vYzLg9PX02rMrnNISFBB
         QD6BiVm7CrFLPxMVA6haQUlMrLQzv61ZTP46LaDX4HeYWJCNpFzFXVmm0FtqbS9UAUm9
         idw3+VQfvufXtAWh/poqB9BxPXSlxYouU2pzT8diwj7QA9GVs/IDx06x8ElbT2pK5QDq
         LX+MCHDWsT0OKu40Rr79sPfb5TyXTMnwxfv9TH0WFhSfb+3MkZfRQHAh0NZQTj8xv/sU
         5xXw==
X-Forwarded-Encrypted: i=1; AHgh+RrV/rnJs+cg82ijBDouFmscG+f2CJPK8DJ+MifYQgDxOn9zP6hr59ACRGRpfn+bjjQjemKpNGX1+Q0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5lzM2OfhO8daUmW7rwa2Wlk/NEyGZyxsEHuNcCEfj03LVpewY
	qXL2mxmY9E6GDf5lqQwpg1p+G1Ba3iWjtiV43GDsf2HWxnpb8v/f/y0MdQwYYygl3g==
X-Gm-Gg: AfdE7cly4mF58OWg54gao5VEzicIMNwl8e/R1oOU2QfK2NGHolWV2P217fxNB/rKTYk
	gjNyQD7BoZUyxv/c3+aX4gae+qRGfJ4PjACSZyFV4/BIyguzop5aTD2vwyCFaZn6GT3PlfZ0CLM
	5vXlJyVGYtowSz8HxyDjaEMHtO6pFfznjWTnLSi0FVQSoFyFVGQYLyhapMSRuduOfcQ6RRLkEQO
	XMUb590Qf4djW4wELxB/B2/g0wFye4Zri43JeGnkIUSxN9k2hDPTdiuTWr7W4ApS0sEzezk/v3i
	9U1bPKKdLKdcooKWwt4cv/f/UpSV38HX5L+SA9V+bpHePKDUWYctAVJjb26hg3XmA1A2igQdHRK
	NAV4diHHOeYH8jgugqE5yu2B3+TY6q9+nIowpBsKXRQ/QippprTlq5uf1lAer+exCc4NRKZEwdS
	rQeu3HNfUXi9TrmU8OS7/zp1JsNQDkTjxxZqbORDMEwSEGNNpnLZSLYUQDW7F3R4L31A==
X-Received: by 2002:a05:600c:8115:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-4953c14f78dmr84277505e9.2.1784216977017;
        Thu, 16 Jul 2026 08:49:37 -0700 (PDT)
Message-ID: <020cfca3-5558-422f-b267-e498bfdf36bf@suse.com>
Date: Thu, 16 Jul 2026 17:49:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] xen/console: reduce number of printouts in
 __printk_ratelimit()
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260715201902.2984407-1-dmukhin@ford.com>
 <20260715201902.2984407-5-dmukhin@ford.com>
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
In-Reply-To: <20260715201902.2984407-5-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1784216977-F6CB02A1-1085730F/0/0
X-purgate-type: clean
X-purgate-size: 1444

On 15.07.2026 22:19, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Fold several __putstr() calls into one around notification of how many
> messages have been rate-limited.
> 
> Not a functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Hmm, the upsides and downsides aren't being discussed at all. You're ...

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -1303,15 +1303,15 @@ bool __printk_ratelimit(unsigned int ratelimit_ms,
>          spin_unlock(&ratelimit_lock);
>          if ( lost )
>          {
> -            char lost_str[10];
> +            char msg[64];
> +
> +            snprintf(msg, sizeof(msg),
> +                     "printk: %u messages suppressed\n", lost);
>  
> -            snprintf(lost_str, sizeof(lost_str), "%u", lost);
>              /* console_lock may already be acquired by printk(). */
>              rspin_lock(&console_lock);
>              printk_start_of_line(CONSOLE_PREFIX);
> -            __putstr("printk: ");
> -            __putstr(lost_str);
> -            __putstr(" messages suppressed.\n");
> +            __putstr(msg);
>              rspin_unlock(&console_lock);
>          }
>          local_irq_restore(flags);

... trading slightly smaller code size + slightly better performance for
slightly bigger stack utilization. It's not entirely obvious that this is
a good deal.

Jan

