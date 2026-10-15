Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD19CC6B2F
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 03:22:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449800.1665383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHC34-0006Sr-7a; Thu, 15 Oct 2026 03:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449800.1665383; Thu, 15 Oct 2026 03:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHC34-0006Sg-1B; Thu, 15 Oct 2026 03:22:30 +0000
Received: by outflank-mailman (input) for mailman id 1449800;
 Thu, 15 Oct 2026 03:22:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xHC32-0006Sa-2h
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 03:22:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHC30-00FBFv-Sh
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 05:22:26 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad0469c-8faa-0a2a0a5109dd-0a2a4502907a-32
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 05:22:24 +0200
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad046ed-6ca4-0a2a45020019-9fe2fb15c156-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 05:22:24 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowABnOu7nRtBqrYPoCg--.185S2;
 Thu, 15 Oct 2026 11:22:16 +0800 (CST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Date: Thu, 15 Oct 2026 11:22:34 +0800
From: Zhang Zheng <zhangzheng@iscas.ac.cn>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/2] xen/ns16550: detect and preserve UART_IER_UUE
Message-ID: <atBEeMNxFV6_17WA@iscas-ws>
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-2-zhangzheng@iscas.ac.cn>
 <1791670290.8631fc262581453bbf619ec5b2062170.1a127df076400080d7@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1791670290.8631fc262581453bbf619ec5b2062170.1a127df076400080d7@vates.tech>
X-CM-TRANSID:qwCowABnOu7nRtBqrYPoCg--.185S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCryxWr4fWr4fXF4ftFyrZwb_yoW5Xw1Upr
	W8KF9Yyrs7tr18C3s0q3W2qFsIgFn3Za4akrWfGa9xZr4DJr40kFyUXFW3Gr4Duw18JF18
	uFWDArykGFZ8ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Cr0_Gr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07b8kskUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-720697/1792034544-66AB52AC-637016BA/0/0
X-purgate-type: clean
X-purgate-size: 3250

On Sun, Oct 11, 2026 at 12:11:27AM +0200, Baptiste Le Duc wrote:
> > diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> > index 593d208483..953d166314 100644
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -352,6 +353,14 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
> >      /* No interrupts. */
> >      ns_write_reg(uart, UART_IER, 0);
> Do we know of a UART where UUE reads back as 1 whatever is written? I
> could not find any such hardware, so I am not sure the check is needed
> but it might be wrong. If not, then we could drop this write but if so,
> then I propose to move it in a dedicated function:
> 
>         ```
>         static bool ns_is_xscale(const struct ns16550 *uart)
>         {
>             /*
>             * We're going to explicitly set the UUE bit to 0 before
>             * trying to write and read a 1 just to make sure it's not
>             * already a 1 and maybe locked there before we even start.
>             */
>             ns_write_reg(uart, UART_IER, 0);
> 
>             if ( !(ns_read_reg(uart, UART_IER) & UART_IER_UUE) ) {
>                 /* Now we are in a 0 state */
>                 ns_write_reg(uart, UART_IER, UART_IER_UUE);
>                 if ( ns_read_reg(uart, UART_IER) & UART_IER_UUE )
>                     return true;
>             }
>             return false;
>         }
>         ```
I agree with Oleksii's suggestion that the XScale quirk should be
derived from the Device Tree compatible for DT-described UARTs. Therefore,
I think will drop this register probe then.
> > +    uart->xscale = false;
> > +    if ( !(ns_read_reg(uart, UART_IER) & UART_IER_UUE) )
> 
> 
> > +    {
> > +        ns_write_reg(uart, UART_IER, UART_IER_UUE);
> > +        if ( ns_read_reg(uart, UART_IER) & UART_IER_UUE )
> > +            uart->xscale = true;
> > +    }
> > +
> >      /* Handle the DesignWare 8250 'busy-detect' quirk. */
> >      handle_dw_usr_busy_quirk(uart);
> >  
> > @@ -446,7 +455,8 @@ static void ns16550_setup_postirq(struct ns16550 *uart)
> >                       UART_MCR, UART_MCR_OUT2 | UART_MCR_DTR | UART_MCR_RTS);
> >  
> >          /* Enable receive interrupts. */
> > -        ns_write_reg(uart, UART_IER, UART_IER_ERDAI);
> > +        ns_write_reg(uart, UART_IER,
> > +                     UART_IER_ERDAI | (uart->xscale ? UART_IER_UUE : 0));
> >
> Every IER write has to keep UUE on an XScale UART, otherwise the UART is
> switched off. Open-coding the ternary at each call site makes it easy
> for a future caller to forget. Would it be better to add a helper, e.g.:
> 
>       static void ns_write_ier(const struct ns16550 *uart, unsigned int val)
>       {
>           ns_write_reg(uart, UART_IER,
>                        uart->xscale ? val | UART_IER_UUE : val);
>       }
> 
> and use it for all futures IER writes?
> 
> Thanks for contributing!
> 
> -- 
> Baptiste Le Duc <baptiste.le-duc@vates.tech>
Agreed. I will add an `ns_write_ier()` helper and use it for all IER
write paths, including `ns16550_setup_preirq()`,
`ns16550_setup_postirq()`, and `ns16550_interrupt()`.

Thanks for pointing this out.

Zhang


