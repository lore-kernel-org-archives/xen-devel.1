Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7F3CA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 10:21:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446077.1662052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGD9K-0004Nz-CF; Mon, 12 Oct 2026 10:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446077.1662052; Mon, 12 Oct 2026 10:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGD9K-0004Nr-7s; Mon, 12 Oct 2026 10:20:54 +0000
Received: by outflank-mailman (input) for mailman id 1446077;
 Mon, 12 Oct 2026 10:20:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGD9J-0004Nd-3n
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:20:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGD9I-0092lo-Gr
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:20:52 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6accb479-8faa-0a2a0a5109dd-0a2a4503d9bc-36
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 12:20:52 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6accb484-fae8-0a2a45030019-d1558034b487-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 12:20:52 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a021c809e3so16844025e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 03:20:52 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19f318c31sm64121385e9.3.2026.10.12.03.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 03:20:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791800452; x=1792405252; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgT+fUwydFonMB/KjDSQ4h6GnJYJvqSigOfJvwJcRM4=;
        b=niOvr29YrBpVVtJRRN74pMSXuWXtkNvMhRq+vBA/68vTKjwJNRYfC+9k7By8A2MCF3
         xSLAa7Q3s5kdBIb5hcEAjgDD0932ZZODECLzHVOKvDRSI2Ogxe2OoWEv28eLcFSv6rNE
         QgCbUTP0MXa8eW9BcQ5BfsF89hbNZOz/aqGyg9lEB6OqEsKB8ZSYTgfX8YFaqKN+zyb8
         FvIN3b0RQwOusbVYYf1b9MsFLTU9uyInuVvNk2+WFVPgW4Mk9YWjnG6N8pH6Rl6UXGDB
         WH+ekEUklN1SNsOanvQbAKvveqT8Z2eK8N0jA6Sy4q0Lwofbi8Eb2gLdN4iDEUX+gM9z
         pSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800452; x=1792405252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgT+fUwydFonMB/KjDSQ4h6GnJYJvqSigOfJvwJcRM4=;
        b=bhOVny4ZQWR98ILz5sx5aCaNKaX6pyU9jIQucF6Uav4eM8g1Ry9GF24rJHvEJ5Ejht
         3nBfQ7PQWotwqiUE9OAdoFk4kdw9KpcAvTwH2xDhEidTyKYjvVlhGUB6AgeyVPi289y3
         l8Tw7m30Lb6Mp6Sfs62aAKm1X5g3UT9FycgkcgUHii44Rt+1kc6qSs1vSpz9NqH2Ihoe
         qbkRZGRjg68KcuByTbNPYoBd/mdUXT4CN0Ps/hO5o/n3+0U93w/WTnZ+vnQT4ZDntc5J
         PGp7s5khFL74kO9UqmqjSVcehXjHd5VY7tWFe//l75jNWvkkEW4/vIGSwL5IwF1+Par7
         nSdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzj9q51P5GfFAHoeonFfXl8m02ukKqZhCsw/AQ2NARvaRJyweT8wdU9U4EJDeTdVynuX8O8K8OiurU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIxWor4QxJlgxm7ktBsHIptEsY8WuckIPy81qNtZ3+6sxEK+8oY
	3arvUeisM826T8QE4/z0WSCYJdPPvkhSVFNwANQC3xOqhDIi7qLPt7qz
X-Gm-Gg: AYBFou3HnZ0utCHh5WuwWuaujpsGOYHA3IipUMPN+PNBQ1+0dibQ9DwQPNujsYV2W0p
	z+NFgPp8FxLaP6MJ7CEMoBGsmiX1sJvjkj+GC44Gu4gVGeTjruJaZhxSeIpHZz+06TsQ3TYVcUN
	bq8Y/yrH5yrI6iw2+iJnVrRfdqcritpmSxIezIct83QCY3h9xYAp5uv+Xqe3psnGEo6XA/JMlLz
	UK01kVkB8YIxvibzvSsJ5YILSpBmpCKlNa994CuIlpBMDyb6qtvD2ZHTUjow6Z5Tf8OyHBmVUAr
	TEs/zk8tJNCUwDCibnBoLt7WnFtsos8yrLJ2JieG+LpopddmkhUxEhFbF3aESdEHxxB6CPMuANm
	u17wGtITE+rE2HqroHjZOIbukyT92TqdL1S9tp4lx2/05gHRW6usqlWctDpH7TJ/PzIsCN+lo/J
	76GXNB2XTI9SL4nfcsVpWSJrFtS//KG5K1wxSDK4Kf9m1ftFctDObl9ygwVJ/S8v3JJUY5/HeG3
	qq96R94nFlyD6A+I11ONVuaZlqW3HJcFToBuQbDgDbb+nO6vw==
X-Received: by 2002:a05:600c:34d0:b0:4a0:35c:8953 with SMTP id 5b1f17b1804b1-4a18e47aceamr173350695e9.7.1791800451475;
        Mon, 12 Oct 2026 03:20:51 -0700 (PDT)
Message-ID: <ec65306d-ec1d-4c5a-93f8-b37f7dfea8b5@gmail.com>
Date: Mon, 12 Oct 2026 12:20:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/ns16550: drain TX before reinitializing
To: Zhang Zheng <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-3-zhangzheng@iscas.ac.cn>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261010031406.2057735-3-zhangzheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1791800452-6C8DD4E9-970FA18E/10/73395122804
X-purgate-type: spam
X-purgate-size: 2805



On 10/10/26 5:14 AM, Zhang Zheng wrote:
> An SBI console call may return before the UART finishes transmitting.
> Wait for UART_LSR_TEMT before ns16550 reprograms the UART and clears its
> FIFO, preserving pending early-console output and legacy SBI v0.1 support.

The problem isn't really specific to SBI: anything that wrote to the 
UART before ns16550 takes over (firmware, a bootloader, or Xen's own 
early console) can leave data in the TX FIFO or the shift register. I'd
describe it in those terms.
> 
> Suggested-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Link: https://lore.kernel.org/xen-devel/8836d1e3-77c8-4447-b1ef-132620a71441@gmail.com/
> Signed-off-by: Zhang Zheng <zhangzheng@iscas.ac.cn>
> ---
>   xen/drivers/char/ns16550.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index c174465059..278d38822d 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -427,6 +427,10 @@ static void __init cf_check ns16550_init_preirq(struct serial_port *port)
>   #endif
>       }
>   
> +    /* Preserve output queued by firmware before taking over the UART. */
я'
Could the comment say why the wait is needed at this point? Something
like:

     /*
      * Output written before ns16550 takes over (e.g. by firmware or the
      * early console) may still be in the transmitter. Let it drain before
      * ns16550_setup_preirq() reprograms the line settings and resets the
      * FIFOs.
      */

> +    while ( !(ns_read_reg(uart, UART_LSR) & UART_LSR_TEMT) )
> +        cpu_relax();
> +

IMO waiting for TEMT rather than THRE is the right choice: besides
resetting the FIFOs, ns16550_setup_preirq() reprograms the divisor and
LCR, which would corrupt a character still being shifted out. (Linux
waits for UART_LSR_BOTH_EMPTY, i.e. THRE | TEMT, but on a 16550 TEMT
already implies THRE.)

The unbounded wait can hang early Xen boot if the UART never reports 
TEMT for some reason(?). Bounding the wait would make console 
initialization more robust, allowing boot to continue when the UART is 
unavailable

     for ( i = 0; i < 50000; i++ )
     {
         if ( ns_read_reg(uart, UART_LSR) & UART_LSR_TEMT )
             break;
         udelay(10);
     }

would need udelay() on RISC-V, which is still a BUG_ON() stub, so a
separate patch would be needed for that. On x86, udelay() doesn't delay
yet at this point (cpu_khz is only set by early_time_init()), so there
the loop would just be an iteration count. Perhaps someone has a better
idea of how to implement a timeout here.

~ Oleksii

>       ns16550_setup_preirq(uart);
>   
>       /* Check this really is a 16550+. Otherwise we have no FIFOs. */


