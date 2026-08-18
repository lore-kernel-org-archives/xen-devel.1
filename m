Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4087DC5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 07:31:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393560.1632378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwEI8-0006uG-A7; Tue, 18 Aug 2026 07:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393560.1632378; Tue, 18 Aug 2026 07:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwEI8-0006u9-7K; Tue, 18 Aug 2026 07:31:24 +0000
Received: by outflank-mailman (input) for mailman id 1393560;
 Tue, 18 Aug 2026 07:31:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwEI6-0006u3-H3
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 07:31:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwEI5-005rAp-BQ
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:31:21 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a840a3f-bab6-0a2a0a5309dd-0a2a4504a1aa-30
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:31:21 +0200
Received: from [209.85.208.45] (helo=mail-ed1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a840a49-b57f-0a2a45040019-d155d02dc5a5-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:31:21 +0200
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-6a0a4a17f91so6450177a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 00:31:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b81748sm9925960f8f.37.2026.08.18.00.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 00:31:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1787038280; x=1787643080; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXpZsmJ61FrDBmxfTHEIMZ42vT/kI2HLZ6xI/PR5zvo=;
        b=PT4oltyiE3eSBHOWQDkK7jRIG+cj7z1sJT8hWrogQWLXsNAKKgH+gajE4fGcOYJXxH
         0i7ZIjRis6UnEIJX7dog4kwAHSZDCq2rZv8TJ60hu1aE2/adfaM510DZYVR6GzQwKX1d
         2mq/XWTF2NAK9KNmj3hldCUBQyeaDsyvW4KjK70YFfSooZ6EXvtsEWDNDLFNRA9Ezcr2
         V/7x6+JewlTnSXyq53t+D5QabvyhoXHgfFXaZWkkxN4+peMVERflxeUxz25C5Ie/ZE98
         T4tlWTEB7hAoftG4seUHiRa7RQQWW7mMd30CaGXlv/P6wdX92otzOcuSU7dXQIVNo7aJ
         VcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787038280; x=1787643080;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXpZsmJ61FrDBmxfTHEIMZ42vT/kI2HLZ6xI/PR5zvo=;
        b=rxWbJbVOE22thnqiHDJqsrsqOXRdhjqadr2qrBhdEOkslEqUvvjoNBiGTvp4at7S79
         /KQ6PagKts7n6JQgUyb4eE/155igD/FKEe+uRjSNz1MpLUyvEZGEcDRZGnstw559eTtx
         ixqM5KX52K0tQ74G5BlsyXmhmcwUD7uBNvtFPxs68AuluOK6+9w6Xvxf6owqr4M3CWoo
         75aL9MdDfNEmfl6Pcey9XWyl7Goh9Ix79dMHLrTuvc7ZK7sEUa0J4tGWfi8ImtwzcdAb
         N4ZN9q3TKMHqe8/Z0m6vIA7iuTuYtEJGJIbMCDa43x/tuj82epMvE5Sz3Iw0O5nfQPRW
         QrZw==
X-Forwarded-Encrypted: i=1; AHgh+RrmwV/KkRiYortFXy4RnBBbUk39sbpBpqsDLS2BYrENj8Sgf4SqyznC9V0Yu3d5AwphltPWDvTDaBE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8gMXKFumfs8RDqyTTeowcZC4rqohjDD8yHB9x6ikqvDqJPfiX
	sUhIdoob+BHvRIHqx0zWI4NFCb3hnXod1xIJ7LTD7EdNAY6Q4cFR7I+mCbqhdVLIHlbvsL7/f8H
	JvkuwDg==
X-Gm-Gg: AR+sD103po1FnK19YUE4PbA5XofxhecXDOUyyaBHsnFnihrfBDxyRThU2OR7KiXCIwL
	1i4F6mkNWuHx5DZvsmbwxB8lKCaAzuyfaIgw5BVEeU13fBpRB1e3jGnAOXmyB12rEgxeIIfZWCp
	vyyLyURs1y1zuLcJlFmO+6NDATZpyU1Vcp4770rcOQwEJUqLWNH5CphOzLVKHUcDsXsdEQ6MdiD
	tzVj8TP7qfcdF8WDJrB43ezdZleYVcp2B9Z2rWAqfOYmdJ20JhQSfRdioEdguUmtoJYZZL297VG
	qaLGaw8vqZXRR+vhqfU78oUW/9JIPsBab9SXO4fijhwfyrx1eON8UgbU08OzqWwAFD9szdcamhg
	KmWxfHuZAJDC7Y2b76oRGHJZ5XdDu64btGrl0zmrDGHQHZ+S8r58YtInIDloDU7owKFCv7GtyVe
	5ErjuYn6b9kwykgOUc6kwk9gFB+MjZi/HNWEm/o04YhaMQJzooWmde0IuF6TLQtCZ+L1rZbRmby
	WHuleDMpU9JwSqq2OzYPahXKaVBUXZUUpxCYpUs0VDkjSmkO10w
X-Received: by 2002:a17:907:fd18:b0:c16:4df6:176b with SMTP id a640c23a62f3a-c212a126a7emr1357477666b.20.1787038279183;
        Tue, 18 Aug 2026 00:31:19 -0700 (PDT)
Message-ID: <253d3fc1-fb38-4e22-b5e0-6e2c9f27afed@suse.com>
Date: Tue, 18 Aug 2026 09:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/5] x86/nmi: Support watchdogs on Intel Fam18/19 CPUs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260805124525.105457-6-andrew.cooper3@citrix.com>
 <20260817172348.1839547-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260817172348.1839547-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1787038281-52ECEB50-9F18C1D8/0/0
X-purgate-type: clean
X-purgate-size: 1971

On 17.08.2026 19:23, Andrew Cooper wrote:
> It is the Pentium 4 (Fam15) which is the odd-one-out.  The counter indicies
> used in the P6 went on to be declared architectural, and Fam18/19 continue
> using the architectural indices.

Do you really mean P6? The code in hunk context uses both
P6_EVENT_CPU_CLOCKS_NOT_HALTED, CORE_EVENT_CPU_CLOCKS_NOT_HALTED, and
I'm pretty sure that if anything became architectural, it would be what
Core uses.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger@xenproject.org>
> CC: Teddy Astie <teddy.astie@vates.tech>
> 
> This wants backporting to 4.21.  So does "Check MSR_MISC_ENABLE for all Intel
> platforms" on which it texturally depends.

Sure; that other one first has to go in though.

For both - why do you say specifically 4.21? Stuff to support newer
families may be reasonably natural to go onto the most recent major
release. If it was to also go further back, I then wouldn't quite see
why to stop at 4.21. Surely the MSR_MISC_ENABLE one I intend to put onto
everything back to 4.20.

> --- a/xen/arch/x86/nmi.c
> +++ b/xen/arch/x86/nmi.c
> @@ -329,17 +329,12 @@ void setup_apic_nmi_watchdog(void)
>              break;
>          }
>  
> -        switch ( boot_cpu_data.family )
> -        {
> -        case 6:
> +        if ( boot_cpu_data.family == 15 )
> +            setup_p4_watchdog(misc);
> +        else
>              setup_p6_watchdog((boot_cpu_data.model < 14)

This model check surely applies to family 6 only? Hence why we may be
better off sticking to the use of switch().

Jan

>                                ? P6_EVENT_CPU_CLOCKS_NOT_HALTED
>                                : CORE_EVENT_CPU_CLOCKS_NOT_HALTED);
> -            break;
> -        case 15:
> -            setup_p4_watchdog(misc);
> -            break;
> -        }
>          break;
>      }
>  


