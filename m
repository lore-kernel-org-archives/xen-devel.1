Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE12CC5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 06:32:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393447.1632252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwDNE-0000BU-Vg; Tue, 18 Aug 2026 06:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393447.1632252; Tue, 18 Aug 2026 06:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwDNE-0000BN-Sl; Tue, 18 Aug 2026 06:32:36 +0000
Received: by outflank-mailman (input) for mailman id 1393447;
 Tue, 18 Aug 2026 06:32:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwDND-0000BH-S7
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 06:32:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwDND-001Wv1-8c
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:32:35 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a83fc77-2eae-0a2a0a5409dd-0a2a450cb4f0-34
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:32:35 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a83fc82-f479-0a2a450c0019-d1558035aca8-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:32:35 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-495590dde14so52164075e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 23:32:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999cfcee58sm91103835e9.0.2026.08.17.23.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 23:32:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1787034754; x=1787639554; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCzGeGrBfNdLbR53WnF25TEaZVj3ZU6HK7gPFLSGJuk=;
        b=cMQXHHTq4lNMCDYVdgyjVsCFVNedDsbgczw5fyc4FN7zdjX46oifq5FiZ+Bepk4pZh
         VpFvWACdb3NVo2rKDge0LWzSgB+dj1NKOv8YWrxeJUBzc10F/q31tjTjKqQiW76Sjcb3
         +Pi+cmalt2F9fEGZv6NmzJv2vtyJ+47aJ3sUEKy9q/FxbeHoOVAx8SRUlvVGMaOEdsPV
         +QSBgeMx76sj2zNRtfd9lEdGYAUIJZf8VAzozD6r4yHcgutjwDVHtOoDWJLjq72zXoR8
         8HrhLFqJjIAyYH2FrKT/EsWmtCvMtudQl9k2/39EJYGVMaUlyDegZAEhVLGQVAHs3hDo
         PxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787034754; x=1787639554;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCzGeGrBfNdLbR53WnF25TEaZVj3ZU6HK7gPFLSGJuk=;
        b=NhOBmiCG9aZjLi9ryd6jxZYbU+ObdR4gsONxXspT43NlZzDnfDM3qroOh2JBuJSMHJ
         oQ2enTzgnzd8SqaHgsq+GJqgiLucoWBl2UcPnX59TlvwL1GKJCjd+YxUHCCWiMWPjnn+
         VMjvt7XBqH0Nm3YPFLSsicvbfAOOwMceju704xLoFv2sDqWga4OcsvIx2BvbPpFLNPs7
         ppqFN/JcXZ6x4loQqM6+o1JH1K2ehGzCP/uHzG2F2hLArmgV+qFnd2ke+sXHDhIjfFPB
         Aydaf4OsR/rQp8HDt2M5uVVtCkoeBz6eTgFhG5Uclz6/cnNh4HKmDzZXMFbD02yrLxfw
         rQ1w==
X-Forwarded-Encrypted: i=1; AHgh+RoTsiweZd62c9c1CTq/pmZBj8R5XC8OffxuzhfkrCwZe7JMc8bhSXpgGXpBbHZCJcQ+6zGZ6OO0148=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdrQyNyWr/1a9TakLyVcrI+2l508R7H+nHf5QQmhH+pEtBI3gm
	UXT53iDkvNe45//5nEvu1JnC0BJGC6zEKf0Ij0XE2Le2jQ5+N3Vyot7tu8jmg22Tbw==
X-Gm-Gg: AR+sD13DyX5FDHsmpCtzWh9/zTXyRDnsoqWTrc/eVcnJ2AlMZg3wYacTgXa7iHwYKi9
	/2XvKrJYV+12T6rrBywMaiXTEJIJ3MaBRKM9x61a/AMFwrrc6rdJSth8Go22X/28B0iFyJRelEW
	fNzsvLnPDboPBO1cn5aSBh+T1YfR8NblBDqLG2MLU1R/LZ6F2D10Zdxb1UXGd4+Lg7nNMfoNRtg
	PhLzzM2c0ZTALsQQDmsjTlzqgeY/9dTQLOnjBt6sHfyPNydkqKwaelUye0zo44WZh2IOhazXmaP
	MSab8nAUgbmLBH+mSQUwSlsxWf23LVogMfd8cqQP1hxjYNsvdwftT+v6lhDNEPTsP4OO3oXNxl4
	DuCOWgEf04nhr7dBSSvTCnLZGq8Abspnj8TcE+aA1zN/63xVlrd/LqGgq+ezrSrsWc+rj6fUU+/
	72ZSP/uF7XG97r1UWEY6xJ2UqowG59/Yq34NhwnmRurjGT4728ICwDurcS9U3PKeHfI2dKgbzi+
	bEb3/dGy/lhKP40sz1Wnn2h/KX1Oo5+evIbcsZ9ZaWAqH0T11yo
X-Received: by 2002:a05:600c:1d20:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-4999fb98421mr91025205e9.14.1787034754551;
        Mon, 17 Aug 2026 23:32:34 -0700 (PDT)
Message-ID: <f322c95e-3eb1-4533-81f9-ab7fc3a18111@suse.com>
Date: Tue, 18 Aug 2026 08:32:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2.5/5] x86/nmi: Remove logic for pre-64bit Pentium 4 CPUs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260805124525.105457-3-andrew.cooper3@citrix.com>
 <20260817162432.1833803-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260817162432.1833803-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1787034755-03AD4A5B-B117B028/0/0
X-purgate-type: clean
X-purgate-size: 295

On 17.08.2026 18:24, Andrew Cooper wrote:
> Model 3 was the first 64bit-capable P4.  Xen won't be booting on anything
> older, so remove the condition.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


