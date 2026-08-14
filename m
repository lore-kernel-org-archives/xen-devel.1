Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB0EC5CFCF
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 07:52:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390898.1631014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wumiA-0002rA-Ax; Fri, 14 Aug 2026 07:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390898.1631014; Fri, 14 Aug 2026 07:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wumiA-0002r3-6K; Fri, 14 Aug 2026 07:52:18 +0000
Received: by outflank-mailman (input) for mailman id 1390898;
 Fri, 14 Aug 2026 07:52:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wumi8-0002qx-FE
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 07:52:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wumi7-008mGh-S4
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 09:52:15 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7ec91a-bab6-0a2a0a5309dd-0a2a4506e2b8-48
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 09:52:15 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7ec92f-195a-0a2a45060019-d155dd2ee4e3-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 09:52:15 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47f703a9d05so466336f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 00:52:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f21a24esm6871979f8f.11.2026.08.14.00.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 00:52:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1786693935; x=1787298735; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFLNgY0JxYKIiTRaUMoV3Afc2p0SQXaOzr8uKvrRO8o=;
        b=VuoYyh+7er/xjfGuNx8MCFfVJl33JV4MmlPeC1rtGVfPB0q8jQ3NjFWtfTA0TBC/e8
         DSpFr/K0EagkY0lUOjzQAwPkudJqXfS4g/oSXIUvrFw9/Bnpr5vRofol/UD+5V3gfnio
         eyTeVfvYD7UPnYem5rJ58NHL5lhHxPBM7q7NSTRSye6IBnBEnYQrtACjlzTF87Ywmti8
         Y4ppJu2Y9G+An7YoxiRMp3qAioPPRePIB4URydYgFTUx9dTz312lmL/Oo+FpvYrOom/h
         Sp8wTqr9Rbp0e/16XQ9oOU3j0XSQGy8tl5IaTX7fOLgZeCoj6QSH7xJQteULzzNTGdFC
         i8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693935; x=1787298735;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZFLNgY0JxYKIiTRaUMoV3Afc2p0SQXaOzr8uKvrRO8o=;
        b=J5PMXMfzF0m3dbrYKczNRQ9RJ9HINXRlOlgOA2WG+F3W8X3Y2FOMfH+nnmVd8bWXYV
         NLFuuEBCxTe22HxaLRocX9CkY/ubeMZEITC5clcz9NFfHtFZfEWVqd5zB0vM0mdo5lKq
         Ml36OCk8YccuqSvoIzAE4IIrD2Tn7CaqLv7SKZdb7Eqcv08ErDFEu+sC1RtL4HKFVxGf
         anwkis9qR1aoTV5Jx3nHuyfZlPVbjAtFcWIiiM/3F0cRXtk7NDsx1Xh9cnlvxcCUo2uf
         5ApfactHnRD3g6imioxCFiPjEbOJ5mcWuVq3vmpoy9kDo6tC4fxzqmqEuxhCsMJxZpMN
         57kg==
X-Forwarded-Encrypted: i=1; AHgh+RrLNPL4xsfHIFKsA0+oI2pzWg/k3s/KVYxLB/t21ij637YP/jnARdaHeyIWBHvS31iiKLd1q6AOoQw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+Gs0uv763OqOv6QL+g467nTHFzy9b87+FM2ZVMHdVg1BWbtFG
	z3mDkC2TI5xS7Sh2FFE3FhO9mdG6vraTEIGEWjy3I79bxZs49swniWmAFOwdF63rez9WOqlLRE+
	LxezxFw==
X-Gm-Gg: AR+sD101ZVyRq8PkvFUUyiZ1M7GzaE233x8VIwmSnkapIvIdLnFD1Ebok6HrBCPUKH6
	yq6Aq3ELs0nVxfZFLuHBgd1cZiakcab+uKFquv4huP4P+s1RJD69AUBofNv+ADSLzVUjpUhl97e
	6beXSYjE/FG+Cj6gb32gs/78VW00aLA9PLEXsDI1wzDLwPwKkxRBAJXd1OsxDXrHEEqzf6F71C4
	WwzJ4IICG4TOzSGd/mSDFvAmk0zK76trS7RQKXwzeT3py8kzvPXs3hVq20DvfGVtDcdo5Put/op
	C4kgXgjFg3mLCG2Yx8mRTGoyR08ESTlYTZDn1mhlShKKwWB06QoCrsoBvFmakU+3Qm8a7obI84m
	MlZasQ/JKvdjx8hCfSOoPxlNZ7hvtccOOHVk5TXEvYnGH+/5V0No9AIJt8Pb+YssnPLJZ6B+kXm
	bLP2X+Rf2E1xspeQlIlkhNkZjTMJPq6gvNzUuh+Vd1xIx5iwdSr3dEHKiu8ng7ikmiXKHCIerqF
	a42MyIHPEQANb1xojVnTkmTNm+1UCh8LKSNGFY14Clco6WXMfs+
X-Received: by 2002:a05:600c:4f56:b0:499:7312:2d5f with SMTP id 5b1f17b1804b1-4998799eb7dmr51887875e9.19.1786693935258;
        Fri, 14 Aug 2026 00:52:15 -0700 (PDT)
Message-ID: <a34ad4ec-28dc-4494-8798-f2a6b0fe7bae@suse.com>
Date: Fri, 14 Aug 2026 09:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] tools/console/daemon: fix log_dir memory leak in
 xenconsoled
To: Andrew Mbugua <andrewprecious388@gmail.com>
Cc: anthony.perard@vates.tech, xen-devel@lists.xenproject.org
References: <20260813212724.2607832-1-andrewprecious388@gmail.com>
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
In-Reply-To: <20260813212724.2607832-1-andrewprecious388@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1786693935-F560A77B-02A071B9/0/0
X-purgate-type: clean
X-purgate-size: 1809

On 13.08.2026 23:27, Andrew Mbugua wrote:
> Valgrind reports that 21 bytes are "still reachable" from the (XEN_LOG_DIR "/console") allocation:
> 
> HEAP SUMMARY:
>     in use at exit: 21 bytes in 1 blocks
>     total heap usage: 9 allocs, 8 frees, 4,799 bytes allocated
> 
> Since the dynamic memory allocation for the default log directory path happens before the process
> forks into the background, the parent and intermediate processes exit during daemonize()
> with the memory still reachable.
> 
> Move the strdup() allocation down below the daemonize() block. This ensures only the final
> background daemon allocates the default path, matching the lifetime of the free(log_dir)
> cleanup loop at the exit of main().
> 
> With this change, Valgrind reports a clean heap summary
> 
> HEAP SUMMARY:
>     in use at exit: 0 bytes in 0 blocks
>     total heap usage: 8 allocs, 8 frees, 4,778 bytes allocated
> 
> Signed-off-by: Andrew Mbugua <andrewprecious388@gmail.com>

Looks all plausible (albeit a little unnecessary, as memory is freed at
program exit anyway), except that ...

> --- a/tools/console/daemon/main.c
> +++ b/tools/console/daemon/main.c
> @@ -181,10 +181,6 @@ int main(int argc, char **argv)
>  		}
>  	}
>  
> -	if (!log_dir) {
> -		log_dir = strdup(XEN_LOG_DIR "/console");
> -	}
> -
>  	if (geteuid() != 0) {
>  		fprintf(stderr, "%s requires root to run.\n", argv[0]);
>  		exit(EPERM);
> @@ -201,6 +197,10 @@ int main(int argc, char **argv)
>  		daemonize(pidfile ? pidfile : XEN_RUN_DIR "/xenconsoled.pid");
>  	}
>  
> +	if (!log_dir) {
> +                log_dir = strdup(XEN_LOG_DIR "/console");
> +        }
... can you please not screw up indentation? All you want is to move the
code, without converting tabs to blanks.

Jan

