Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82E4CC6B1C
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 03:44:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449826.1665391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHCNl-0003Ud-ND; Thu, 15 Oct 2026 03:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449826.1665391; Thu, 15 Oct 2026 03:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHCNl-0003UW-KO; Thu, 15 Oct 2026 03:43:53 +0000
Received: by outflank-mailman (input) for mailman id 1449826;
 Thu, 15 Oct 2026 03:43:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xHCNk-0003UQ-Fj
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 03:43:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHCNj-006O3p-7o
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 05:43:51 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad04b6d-2eae-0a2a0a5409dd-0a2a450ba33e-26
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 05:43:50 +0200
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad04bf3-b7e8-0a2a450b0019-9fe2fb15a0e0-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 05:43:50 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowAB3TvLuS9Bq1uDoCg--.1414S2;
 Thu, 15 Oct 2026 11:43:43 +0800 (CST)
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
Date: Thu, 15 Oct 2026 11:44:00 +0800
From: Zhang Zheng <zhangzheng@iscas.ac.cn>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	Baptiste Le Duc <baptiste.le-duc@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/2] xen/ns16550: detect and preserve UART_IER_UUE
Message-ID: <atBH6eJyJOHkr1po@iscas-ws>
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-2-zhangzheng@iscas.ac.cn>
 <1a6cdfbf-8116-48ca-b2cb-567e39fabe4f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a6cdfbf-8116-48ca-b2cb-567e39fabe4f@gmail.com>
X-CM-TRANSID:qwCowAB3TvLuS9Bq1uDoCg--.1414S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCFWDWr13Zr43AF15Jr17Awb_yoWruF4DpF
	W8KFnYyFZrtr10k3sIq3WUuFW0gan7Xa4akr4fG3y7Zr1ktr18uFyjqFy3J3Wvvr4ktF4j
	9F4jvryUJ398ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
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
X-purgate-ID: tlsNG-42698a/1792035830-ABCD79EA-3DC71FCC/0/0
X-purgate-type: clean
X-purgate-size: 4896

On Mon, Oct 12, 2026 at 11:20:22AM +0200, Oleksii Kurochko wrote:
> 
> 
> On 10/10/26 5:14 AM, Zhang Zheng wrote:
> > XScale-compatible UARTs require UART_IER_UUE to remain set.  Probe the
> > bit during setup and preserve it when enabling receive interrupts, so
> > the xscale/PXA UART remains operational after ns16550 takes over.
> > 
> > Signed-off-by: Zhang Zheng <zhangzheng@iscas.ac.cn>
> > ---
> >   xen/drivers/char/ns16550.c  | 12 +++++++++++-
> >   xen/include/xen/8250-uart.h |  1 +
> >   2 files changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> > index cdda28879e..c174465059 100644
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -64,6 +64,7 @@ static struct ns16550 {
> >       bool intr_works;
> >       bool force_polling;
> >       bool dw_usr_bsy;
> > +    bool xscale;
> >   #ifdef NS16550_PCI
> >       /* PCI card parameters. */
> >       bool pb_bdf_enable;     /* if =1, pb-bdf effective, port behind bridge */
> > @@ -352,6 +353,14 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
> >       /* No interrupts. */
> >       ns_write_reg(uart, UART_IER, 0);
> > +    uart->xscale = false;
> > +    if ( !(ns_read_reg(uart, UART_IER) & UART_IER_UUE) )
> > +    {
> > +        ns_write_reg(uart, UART_IER, UART_IER_UUE);
> > +        if ( ns_read_reg(uart, UART_IER) & UART_IER_UUE )
> > +            uart->xscale = true;
> > +    }
> > +
> 
> This probe only checks whether IER bit 6 is writable, which isn't
> specific to XScale. On UARTs with an EFR (e.g. ST16C650, TI TL16C752,
> Exar XR17V35x) the upper IER bits become writable once EFR[4] (ECB) is
> set, and bit 6 is then the RTS interrupt enable. If ECB is already set
> when the probe runs, it would report XScale, and the driver would then
> keep the RTS interrupt enabled.
> 
> Could the flag be derived from the compatible in ns16550_uart_dt_init()
> instead, the same way dw_usr_bsy is?
> 
>     uart->xscale = dt_device_is_compatible(dev, "intel,xscale-uart");
> 
> That compatible would also need adding to ns16550_dt_match[]. The
> SpacemiT K1 nodes, for example, have no "ns16550a" fallback.
> 
This UEE probe section was adapted from Linux's 8250.c `autoconfig_16550a()`.
Nevertheless, I think using the Device Tree compatible is a reasonable solution,
given your point that this bit may also be writable on other UARTs and could
therefore result in false positives.
> >       /* Handle the DesignWare 8250 'busy-detect' quirk. */
> >       handle_dw_usr_busy_quirk(uart);
> > @@ -446,7 +455,8 @@ static void ns16550_setup_postirq(struct ns16550 *uart)
> >                        UART_MCR, UART_MCR_OUT2 | UART_MCR_DTR | UART_MCR_RTS);
> >           /* Enable receive interrupts. */
> > -        ns_write_reg(uart, UART_IER, UART_IER_ERDAI);
> > +        ns_write_reg(uart, UART_IER,
> > +                     UART_IER_ERDAI | (uart->xscale ? UART_IER_UUE : 0));
> 
> It seems like not all cases are covered. For example, ns16550_interrupt()
> writes 0 to IER when it switches to polling, which would turn off the UART
> on XScale. Am I missing something? If not then something like:
> 
> static void ns_write_ier(const struct ns16550 *uart, uint8_t ier)
> {
>     if ( uart->xscale )
>         ier |= UART_IER_UUE;
> 
>     ns_write_reg(uart, UART_IER, ier);
> }
> 
> would be needed, used in ns16550_setup_preirq(), ns16550_setup_postirq()
> and ns16550_interrupt().
> 
Yes, i missed that path. I will add `ns_write_ier()` and use
it in `ns16550_setup_preirq()`, `ns16550_setup_postirq()`, and
`ns16550_interrupt()` so that UUE is preserved on every direct IER
write.
> ns16550_start_tx()/ns16550_stop_tx() do a read-modify-write of IER, so
> they read UUE back from the register and write it out again unchanged.
> They therefore work correctly without the wrapper. They could be
> switched to ns_write_ier() as well for consistency, but that isn't
> strictly necessary and likely could be left in way it looks like now.
> 
> ~ Oleksii
> 
Agreed. Since these paths already preserve UUE, I will leave them unchanged.

Thanks

Zhang
> >       }
> >       if ( uart->irq >= 0 )
> > diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
> > index d13352940c..358d264698 100644
> > --- a/xen/include/xen/8250-uart.h
> > +++ b/xen/include/xen/8250-uart.h
> > @@ -42,6 +42,7 @@
> >   #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
> >   #define UART_IER_ELSI     0x04    /* rx line status       */
> >   #define UART_IER_EMSI     0x08    /* MODEM status         */
> > +#define UART_IER_UUE      0x40    /* UART unit enable (XScale/PXA) */
> >   /* Interrupt Identification Register */
> >   #define UART_IIR_NOINT    0x01    /* no interrupt pending */


