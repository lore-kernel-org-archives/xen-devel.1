Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F1DCA9EC5
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 22:12:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445415.1661624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFfI1-0000dz-4J; Sat, 10 Oct 2026 22:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445415.1661624; Sat, 10 Oct 2026 22:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFfI0-0000dr-Vj; Sat, 10 Oct 2026 22:11:36 +0000
Received: by outflank-mailman (input) for mailman id 1445415;
 Sat, 10 Oct 2026 22:11:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a127df076400080d7@swg.vates.tech>)
 id 1xFfHy-0000dl-R8
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 22:11:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFfHx-00C1X3-IS
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2026 00:11:33 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a127df076400080d7@swg.vates.tech>)
 id 6acab814-e002-0a2a0a5209dd-0a2a4501bf32-2
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2026 00:11:33 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a127df076400080d7@swg.vates.tech>)
 id 6acab814-5984-0a2a45010019-b9ff1c1285ff-3
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2026 00:11:33 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a127df076400080d7.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 10 Oct 2026 22:11:30 +0000
Received: from leducb.local (213.40.31.93.rev.sfr.net [93.31.40.213])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1575981FCC;
 Sun, 11 Oct 2026 00:11:29 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=1MAI2QqfgN2yo0slA4ww5wNdXSNQc6My1P2h7nd5f2w=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=ExlyZ3QeReL0xFcZcr6lrKbdtyyF/1F11QdR9+BxJnXJs1nC9y869nPGtlLiwO8L7l7nqz8Sc
 lEXSxgwJkJ35A4VQ4ujCeBNlP+ndzmtKZB2z9WH/7eZzeFcE+mekbGxYltsggJdi/OMlPb1Nxph
 DWcnEA0lmL0DMmq0Lb2veSXs4TBeg3Sz33rmh1l4vxqnm4Sl0XdC1hekdGiEDEndXVCg648reQT
 QmiRq0U1APk8M84/ljNUDSfNvUA0Tujqr4+AlqMngKpELk+gYHaha7IYujV/JtpDdjgR9Wz3tQR
 GXSaJplsPEgQTCj9991Nqi+JBbXsSWrABnm27EmByMuw==
X-Zone-Loop: f965ad316f0f786b6f5700e6fd263c6ddbd9b349eadd
x-campaign-type: default
x-transaction-id: 2f668421-3225-464b-8acf-33c6b638bb66
x-swg-uid: 01-68cf55e6-81cc-49fb-819d-e290ad239085
X-Mailer: Sweego
Message-ID:
 <1791670290.8631fc262581453bbf619ec5b2062170.1a127df076400080d7@vates.tech>
x-swg-bid: 1791670290.8631fc262581453bbf619ec5b2062170.1a127df076400080d7
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/2] xen/ns16550: detect and preserve UART_IER_UUE
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Zhang Zheng <zhangzheng@iscas.ac.cn>
Cc: xen-devel@lists.xenproject.org, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <20261010031406.2057735-2-zhangzheng@iscas.ac.cn>
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-2-zhangzheng@iscas.ac.cn>
Date: Sun, 11 Oct 2026 00:11:27 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791670288; l=2641;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=rcqIVlD1jsQOGAsTxlqeRiT5qSgxGa6V81/f8bVyIZs=;
 b=4wnftcPCZhbdR6juEgXcXfeJ4Zkt5YiWkYugLWuHiLWnft8rrztO8TpHLEJDQaiP6gGk3pjuo
 r6zxj7pinL7DDJbl5fxfFlXB9gxtZ2hxFb877nLQ+JJS7e03YA7C6xV
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791670289249
X-purgate-ID: tlsNG-d62444/1791670293-BE664757-33DA9322/0/0
X-purgate-type: clean
X-purgate-size: 2641

> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 593d208483..953d166314 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -352,6 +353,14 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>      /* No interrupts. */
>      ns_write_reg(uart, UART_IER, 0);
Do we know of a UART where UUE reads back as 1 whatever is written? I
could not find any such hardware, so I am not sure the check is needed
but it might be wrong. If not, then we could drop this write but if so,
then I propose to move it in a dedicated function:

        ```
        static bool ns_is_xscale(const struct ns16550 *uart)
        {
            /*
            * We're going to explicitly set the UUE bit to 0 before
            * trying to write and read a 1 just to make sure it's not
            * already a 1 and maybe locked there before we even start.
            */
            ns_write_reg(uart, UART_IER, 0);

            if ( !(ns_read_reg(uart, UART_IER) & UART_IER_UUE) ) {
                /* Now we are in a 0 state */
                ns_write_reg(uart, UART_IER, UART_IER_UUE);
                if ( ns_read_reg(uart, UART_IER) & UART_IER_UUE )
                    return true;
            }
            return false;
        }
        ```
> +    uart->xscale = false;
> +    if ( !(ns_read_reg(uart, UART_IER) & UART_IER_UUE) )


> +    {
> +        ns_write_reg(uart, UART_IER, UART_IER_UUE);
> +        if ( ns_read_reg(uart, UART_IER) & UART_IER_UUE )
> +            uart->xscale = true;
> +    }
> +
>      /* Handle the DesignWare 8250 'busy-detect' quirk. */
>      handle_dw_usr_busy_quirk(uart);
>  
> @@ -446,7 +455,8 @@ static void ns16550_setup_postirq(struct ns16550 *uart)
>                       UART_MCR, UART_MCR_OUT2 | UART_MCR_DTR | UART_MCR_RTS);
>  
>          /* Enable receive interrupts. */
> -        ns_write_reg(uart, UART_IER, UART_IER_ERDAI);
> +        ns_write_reg(uart, UART_IER,
> +                     UART_IER_ERDAI | (uart->xscale ? UART_IER_UUE : 0));
>
Every IER write has to keep UUE on an XScale UART, otherwise the UART is
switched off. Open-coding the ternary at each call site makes it easy
for a future caller to forget. Would it be better to add a helper, e.g.:

      static void ns_write_ier(const struct ns16550 *uart, unsigned int val)
      {
          ns_write_reg(uart, UART_IER,
                       uart->xscale ? val | UART_IER_UUE : val);
      }

and use it for all futures IER writes?

Thanks for contributing!

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

