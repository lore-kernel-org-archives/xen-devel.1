Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753AEC44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366712.1616658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlq6m-0005Tk-5W; Mon, 20 Jul 2026 15:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366712.1616658; Mon, 20 Jul 2026 15:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlq6m-0005Td-1n; Mon, 20 Jul 2026 15:40:44 +0000
Received: by outflank-mailman (input) for mailman id 1366712;
 Mon, 20 Jul 2026 15:40:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wlq6l-0005TV-1j
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 15:40:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlq6k-001kTk-01
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 17:40:42 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5e4163-5cb7-0a2a0a5109dd-0a2a4508b5ec-12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:40:41 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5e4179-f659-0a2a45080019-d155dd30b05f-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:40:41 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-472326ca506so7942356f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 08:40:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f6b85970esm24675928f8f.15.2026.07.20.08.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 08:40:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1784562041; x=1785166841; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2X8mR/1VAWx9xNH27DUHchiHZDckXmTuxhRcRPJdEeA=;
        b=NhQe4sJMD4qJe2Sr/o6P65Kf2sQWCp/CUPSjLqgS86RmpvzmUzwWeRm9oqq+Qjv7uN
         6griCh3lYu7JpElHGOnlVrVGkggZc8MQVcgT2Aw+Zi2McMat+VdP0RiCwpgm19zUtyt9
         KAiv6LoZxrh153xovKEzja+0BFRfAVSOp95Vv1hRzCdVab1hSGOwLLpTs2UIfe/THke1
         uRdbRWxlHXBHfOQEW7VORkVXLChczkh2rxHgvEbNSgFIYjPupS+9GdlZqjehZAyDa6ZV
         VJZzOGnBiUrE8IvMMJ520uJBhnf1fRi/7nGLHWzR00GY8vvaqEtzA3i+gy+6vx4bvoTR
         AwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562041; x=1785166841;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2X8mR/1VAWx9xNH27DUHchiHZDckXmTuxhRcRPJdEeA=;
        b=Zk6y7WM6CwbGuMPrtMHEabvrtQrDovAqe8Vh5MuOLAfruHJigRU0TKyEGNlKGXUkuV
         QAI4F0G0bcfguvMvFYYM3lhKZHLKYHPLqH1UZR+J4XhgwyAdluJ+t4i9kM6cuicaJ43H
         d1bGeW5WPRy1OZt/Bm2LfPOmbm1j2aRWuDp88VU40b7MWxOfSVLfHfdVQDWGwnPzseNZ
         v3CyOq+CPlh3+9dpb7KBZjpGrdJg9CDo8a3lwKOOyN2PQPD2lMvVUCs/ExA1qg8DDwTv
         52PtA9V6q2FO+nOR/GaHD9TG5Flnz0buIWCJ6oXBAH3DY2uHUZ2BdLgsNqaAoFQe+kLh
         cqTg==
X-Forwarded-Encrypted: i=1; AHgh+RrV2SnVjMunhaHeaQ87XVR7j4yxjW6jTb6HUFriTVyym/hJ0QGbVxR1h/m9ZdwzsCrVxQ0FfECqHfQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFJTYvbsFCZj8W4Ss5cdz69sqn7yXZouN7tnqtK9gpmuHy5COQ
	uQ7njh39cYYAo+UuUIe9EB7xjdVQv/rVLW5hIBSEK/SLAMo8NL517jF8FBsHdEpe1A==
X-Gm-Gg: AR+sD1212dHvj5U90jEyp0h9KQPhf5VTcvk8kIVZHzDxvkqYtdBpzW83OGoQpz06Fjl
	vBZUGzBnWvSuQfy+QKov8pLyXaJw1LHeRqt5T/lJJ3Iutxvjc3jB2TlKtmQGv+wMLPv7kOTFYaS
	n8MmmKtX83qKzHIl2NHMPQtZLX67byWz9EBTNP2DvDFaNh+Q3AHvKu4H/6rET8NW3SvOEaxsOV6
	GKvDF+vn/LJLZXetFuJo8Zvzz9aGGnr8u/+3y/17yf4P+511RgyYPQhoNhPrIyUQXCJDJxZNfFt
	B6zgqi4792wyCIOJDskltvuLmmkimxajQbKsyf+YDW7EzCEPKfzhNPzBCMY0puy52Rd4NMiO/c0
	EdGX46LGFElGwZWdeCt77uebqE/4X68asTv8mOscGupFW35q2nii6rLNVDPZHwN6wW53G50a/Bu
	SxDNHjjA/GSpMNbk+DtzuiT6yU7enbk+F8GS2qKn7Y0L1hDFhvWYyfR7ik+5xCsxIokg==
X-Received: by 2002:a05:6000:4a01:b0:47a:b86f:3ed1 with SMTP id ffacd0b85a97d-47f623060bemr18223846f8f.21.1784562041348;
        Mon, 20 Jul 2026 08:40:41 -0700 (PDT)
Message-ID: <330e8bd1-c00b-470c-97af-fb273e11cf73@suse.com>
Date: Mon, 20 Jul 2026 17:40:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/7] xen/serial: drop stale SERIAL_NEVER_DROP_CHARS
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260713181619.672176-1-dmukhin@ford.com>
 <20260713181619.672176-6-dmukhin@ford.com>
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
In-Reply-To: <20260713181619.672176-6-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1784562041-D694287B-888BC1E1/0/0
X-purgate-type: clean
X-purgate-size: 824

On 13.07.2026 20:16, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

It would have helped if the origin of it being stale was identified right
away. Looks like 275485700163 ("Bring back console_start_log_everything()
as a milder alternative to") dropped the sole use only a few weeks after
its introduction.

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/drivers/char/serial.c
> +++ b/xen/drivers/char/serial.c
> @@ -15,9 +15,6 @@
>  
>  #include <asm/processor.h>
>  
> -/* Never drop characters, even if the async transmit buffer fills. */
> -/* #define SERIAL_NEVER_DROP_CHARS 1 */
> -
>  unsigned int __ro_after_init serial_txbufsz = CONFIG_SERIAL_TX_BUFSIZE;
>  size_param("serial_tx_buffer", serial_txbufsz);
>  


