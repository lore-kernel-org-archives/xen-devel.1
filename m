Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5183CD6E4A
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2026 12:18:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1324880.1590374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUO45-0006dv-9n; Tue, 02 Jun 2026 12:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324880.1590374; Tue, 02 Jun 2026 12:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUO45-0006do-6s; Tue, 02 Jun 2026 12:17:49 +0000
Received: by outflank-mailman (input) for mailman id 1324880;
 Tue, 02 Jun 2026 12:17:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUO44-0006di-7m
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:17:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUO43-00825j-KP
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:17:47 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ec9ea-2eae-0a2a0a5409dd-0a2a4501976a-2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:17:47 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ec9eb-c1f2-0a2a45010019-d1558029b53f-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:17:47 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4906869f0cbso105954185e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 05:17:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef358c07bsm33899381f8f.36.2026.06.02.05.17.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 05:17:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780402667; x=1781007467; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BQ3Qz6VUbtEc8b8Sa5o76DrtR8nIJMHN/jkW5wqD6Og=;
        b=bmsZJznn+Mh+/ui+y0IMSoYMBAlo1I2ehBNZsGAoVNcrigU7IVAwwY0HX6W3KCbtu2
         1HEKyaJBG5hngBVEuvYMQ2vBZTu7owLFMvOo4GAS8kcIfntyuU3CJS+XR3qKWb+0vh4g
         rGaoQORoAzM71nM9XmaImKowihx6GtDNX6wliJI8IHhehAlIk972Emsix/e8thiel2Y7
         oVtCsnY3wbBeDI4edllS7L/JF4Kubmkts5jDMFjKsWA2mQgzmlcmBvU6y8iZ8azUXTGr
         WoBgGB5ZvJnCHFgayq0gIkfUkYr4xCT8A42bKwzZTsrlnwOtOaDvp+IAXzBVJMTsmBE/
         oNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780402667; x=1781007467;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQ3Qz6VUbtEc8b8Sa5o76DrtR8nIJMHN/jkW5wqD6Og=;
        b=XEZhbrD22atFK0MzOQBKl/EFbILzuAnx+PXhRRs1stcqs641s0cJc8I/FjtffMCpmk
         VyN4T3mn5fcQ/MA0WX30qQU8tT1k3aqA5ATdkJdroeyUBROSqqPMPMrXXga4urIM/qBX
         Vk44n9d2U/osrB5D1GAwBez/30uT7b72Ct/XgHWxxt4VeD2sJiGooQvQYKDZcINbCktD
         E7EHWHK2WFhLnXzDz3HRPeJaXzkgk6ZA7/wITN2HTphh/OYM2bGTpJNderRf93QJQhu4
         6SKfGIbUb+MBqS9GmtdSqfttx1jhfCvYOfPQQH2nMeFxhl5LDTAFTDbwL4yLYF0gMeWJ
         Us0g==
X-Forwarded-Encrypted: i=1; AFNElJ8WxgInz14b1f4X/i72/miwr3LFgROJyNMM6/2rHGmQ1HYXfixVVNmhH/2LN+lhcQTkrEQnNkGQvOI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgxZ5tiFL9oLFwBKCfJZRcHlB0BNM4wFPLs3YtxPHCUpmt+48m
	ShGcnlUPmUOXB4rO8e8uIiJLKDs+C8KHW3gLl9EWGZlED7wkvwfyA/3Sgl13X0b5Aw==
X-Gm-Gg: Acq92OEfjMCbzAX7Ho1DIAmoeOrfpNQ07qCB9KTd1qMiv1UAdzaIgHjcBnr7ECUez6E
	xMB7xvTU7gkUrkwmX12lQG+Oefcv7NVhHRm+h8BvjDGJK6S1jYmX6fjkDk6gvfsqgSEOE+2BA9l
	Lp4sO7al8p0l0ypZdaw3BKyaX+LjRPyGC6ALPIN0tx+rwajRaxbapaBa4YPeTMXPc8qs9ffo1Z1
	TO1xnCNSqWNogaiefwofI2j/h9oXecRI2oluT9b6ZuBDstFAbjm+cR9bfxRSiRvQPuTZEunoMw5
	SLYSZP6v3pn6OK3qNU+xc7c9j2TecP5Q5bu+3zQl0VbvX66Q49No7O26TTzWcb6dCedFpT/UQ0D
	ZbEOifm7ggwM1IuJHuB+CrNnZ0JbXC+GA/G96QBNoa5Iv7Z5zgDg7D44AKYQGOFukGW+uGxoXpe
	XyBWtu7uuhOVoH1qajmKm6AYIU0u8BU2N6wxhI7hmxpl+2lSLyvNPluc1VissEKEhHr2h7gwG37
	SCzcB83WYlUSp4sXH6LrIg3bg==
X-Received: by 2002:a05:600c:8b53:b0:490:9d1b:f06a with SMTP id 5b1f17b1804b1-490a2916fd1mr283636475e9.10.1780402666911;
        Tue, 02 Jun 2026 05:17:46 -0700 (PDT)
Message-ID: <dea51228-0eaf-4e30-8ca4-fb4a5077a624@suse.com>
Date: Tue, 2 Jun 2026 14:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] x86/efi: discard multiboot related entry code for PE
 binary
To: Frediano Ziglio <freddy77@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-5-frediano.ziglio@cloud.com>
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
In-Reply-To: <20260529153531.1341542-5-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1780402667-AF555FF4-F551C46F/0/0
X-purgate-type: clean
X-purgate-size: 902

On 29.05.2026 17:35, Frediano Ziglio wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> The multiboot and PVH entry points are not used in the PE binary, hence
> discard them in the linker script when doing a PE build.
> 
> That removes some relocations that otherwise appear due to the entry point
> code in head.S not being position independent.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/boot/head.S | 3 ++-
>  xen/arch/x86/xen.lds.S   | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)

S-o-b issue again.

> @@ -200,6 +201,7 @@ SECTIONS
>         _sinittext = .;
>         *(.init.text)
>         *(.text.startup)
> +       *(.init.multiboot)
>         _einittext = .;

Aren't you making a needlessly big change to the final image by placing this
last rather than first?

Jan

