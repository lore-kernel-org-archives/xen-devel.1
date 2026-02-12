Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5214DEB4909
	for <xen-devel@archiver.kernel.org>; Thu, 12 Feb 2026 11:31:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1228802.1534906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUug-0004uI-BF; Thu, 12 Feb 2026 11:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228802.1534906; Thu, 12 Feb 2026 11:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUug-0004uB-72; Thu, 12 Feb 2026 11:31:14 +0000
Received: by outflank-mailman (input) for mailman id 1228802;
 Thu, 12 Feb 2026 11:31:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqUuf-0004u5-6o
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 11:31:13 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 553abd5b-0806-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 12:31:11 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-480142406b3so62590125e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 03:31:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d82a1c2sm278835535e9.9.2026.02.12.03.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 03:31:10 -0800 (PST)
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
X-Inumbo-ID: 553abd5b-0806-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770895871; x=1771500671; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J8HmZNx9218iZkLjU9tX+tOBAqyhFCsnxlPaW64ulcc=;
        b=ZSR7X6CEBk+nsbAMfzV7rDPh9mMgo4lHSK/eTUUgMpKGMU94PvkGtPKKX3EnVOQ5QA
         EcYr8ZckelMt8fQN51vMDYuFrb9MZ2KKffF3Y5DPvAmpCd3OL68AvIC8x00GVfSFRrYG
         3w+frGieI2VDC0bldlhUExD7rt3yQxRIIAX5it4spyFLuGN34ASuX9oN9Okvu0hwZ17x
         pielTLuRlzXa6qPcTPvN9w0X+xQ/AM6p8/FNDC8aIBMfcGaMh925Ve60HA9y/BFXD7l5
         58TsVwwBDB0g/+K2JcAHilx9/fcE/Gk4aEN7hl/EuC8KhKDmoH5000TRQCOZfO5tbbYw
         A5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770895871; x=1771500671;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8HmZNx9218iZkLjU9tX+tOBAqyhFCsnxlPaW64ulcc=;
        b=vFkBm9oCe+0K/OdtqAmfje1aRfhLBz279cx5TcZOv68IbY9ygQSJWRAfL/an86yXQ3
         qY2/RzM81Efm1xeIyxwspW8Fu8Yfwvw1JPFkhm2BuSo75fwOEu/b2RZv889kCu/LeXpH
         40qZY1XvwswXr4HxI+Nb/AhyTZSsSqaksJMUXE4lo7WAToqeKKUO/YPu+Ec39l1Vnev7
         WNQD1zn3PXrDltCxecjVNAtUVDI/AMn78wAQSin8/+ftbTMxXQbgLjfr8wCkF+j973UP
         Dbss1wFjFsr18noDn0S8fPEJ2V7H5yzauarZn/O5DKXRm0tBy3SPsoYniZYiVly7as5u
         LDpg==
X-Forwarded-Encrypted: i=1; AJvYcCUAPaj+PWzpkcABeRUfTt72ZKM6Fqq30wfxoUm8PB4nX41OLzlyC+KBE8SDeaUrP2A7KrV1A06A1dk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzNIhIwt1X2nb7N7Xh8MjPozaUWt3eQHGzP26UmhPNqLptoHmS
	sYRiQqnHGWozg3pm3q1RH9jYGiE92Ux1E0h4QmyF2E4l82NNlApwfwVeHbypMSDVaA==
X-Gm-Gg: AZuq6aJolZhN0t9M3oD/PESUOpohX/ZcMIX1elOnRpitkqXP6sgpdeMpVWROlHcvHys
	HPV3Jf2WCQrrAcaQb1rMjNDAqByilOsa1N1KNsv0KR0+e0tpNBIMAf5AeUb3ZfU7UhhEDoPGQzD
	pF6LfSBvDVpQ7lhiZDnSX+TIdF4uKIhYvv/nZb7/yZobVORmGyvLYFsjtfK6qf69QjpoMBebxLE
	HxIxEnyMSvO8WRfAsIxecxL0pgU0sItgJI1SXAlQTSXkDp030FzKThlNQYiHY537KIUXK/Pt7ga
	2O/a1au+GQdEBGF9RruExCe0x5236/M4dgpQ8wvVpKOyc0uU+WHLl4OapPGG0EdWRajeega+Njw
	gAprW9q81+y1R/82U62L/pv8Z+4SrF0QGCF4YgsVRqEm+APdKNqJVnzpHkKFppFeFeqXJ67jaYl
	g3Gq7OagLaly5E0qOMSyfH4Fra222ZNby3KUK920Z+Liv/L1xLT1nzGGxyU8pCzNLO8VSGSMGho
	WrH/h0q+xKzqMg=
X-Received: by 2002:a05:600c:4749:b0:47e:e20e:bb9c with SMTP id 5b1f17b1804b1-483656ae4b0mr34168865e9.8.1770895871238;
        Thu, 12 Feb 2026 03:31:11 -0800 (PST)
Message-ID: <f2abd192-27c7-4011-95a3-848e1c4e1427@suse.com>
Date: Thu, 12 Feb 2026 12:31:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] x86: Migrate x86_emulate/ to use cpu_vendor()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-9-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260206161539.209922-9-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2026 17:15, Alejandro Vallejo wrote:
> ... but keep the current behaviour of using the policy vendor when
> compiled for userspace, where cross-vendor configurations are expected.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Hmm, ...

> --- a/xen/arch/x86/x86_emulate/private.h
> +++ b/xen/arch/x86/x86_emulate/private.h
> @@ -15,6 +15,7 @@
>  # include <xen/kernel.h>
>  
>  # include <asm/cpu-user-regs.h>
> +# include <asm/cpufeature.h>
>  # include <asm/endbr.h>
>  # include <asm/msr-index.h>
>  # include <asm/stubs.h>
> @@ -30,8 +31,11 @@ void BUG(void);
>  #  define X86EMUL_NO_SIMD
>  # endif
>  
> +# define x86emul_cpu(cp) ({ (void)(cp); cpu_vendor(); })
> +
>  #else /* !__XEN__ */
>  # include "x86-emulate.h"
> +# define x86emul_cpu(cp) ((cp)->x86_vendor)
>  #endif

... this looked familiar, yet different at the same time. It was only after
some eyebrow raising that I noticed that patch 07/12 appears twice in the
series, with different titles.

Jan

