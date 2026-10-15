Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B464CC6B2E
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 04:51:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449859.1665418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHDQX-0006Dy-Pw; Thu, 15 Oct 2026 04:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449859.1665418; Thu, 15 Oct 2026 04:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHDQX-0006Dr-N4; Thu, 15 Oct 2026 04:50:49 +0000
Received: by outflank-mailman (input) for mailman id 1449859;
 Thu, 15 Oct 2026 04:50:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xHDQW-0006Cz-2c
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 04:50:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHDQV-003OKm-8i
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 06:50:47 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad05b9d-bab6-0a2a0a5309dd-0a2a4507af4c-6
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 06:50:46 +0200
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad05ba3-b4ea-0a2a45070019-9fe2fb15d268-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 06:50:46 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowAAn+eyeW9BqISvqCg--.26715S2;
 Thu, 15 Oct 2026 12:50:39 +0800 (CST)
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
Date: Thu, 15 Oct 2026 12:50:55 +0800
From: Zhang Zheng <zhangzheng@iscas.ac.cn>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	Baptiste Le Duc <baptiste.le-duc@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] xen/ns16550: detect and preserve UART_IER_UUE
Message-ID: <atBax8lbkNl1qCa6@iscas-ws>
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-2-zhangzheng@iscas.ac.cn>
 <1a6cdfbf-8116-48ca-b2cb-567e39fabe4f@gmail.com>
 <f5d4bb6c-69cd-45cc-badc-797ef9fbc96f@suse.com>
 <5d012ec1-60f8-43b9-a1cf-1bd0d0d133ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d012ec1-60f8-43b9-a1cf-1bd0d0d133ee@gmail.com>
X-CM-TRANSID:qwCowAAn+eyeW9BqISvqCg--.26715S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCFW7KrW3KF1DtFW8Jry7ZFb_yoWruFy7pF
	W8KFnYyrsrtr10kr9Fq3WUWFsagF1kX34akryfG34fXrn8tF18CFW2qFW7ua4vvr4vqF1U
	uF4jqry3WF98ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VCY1x0262k0Y48FwI0_Jr
	0_Gr1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAK
	I48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5P-
	PUUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-ef75cf/1792039846-A74D3AE4-E52286E3/0/0
X-purgate-type: clean
X-purgate-size: 4999

On Mon, Oct 12, 2026 at 03:24:20PM +0200, Oleksii Kurochko wrote:
> 
> 
> On 10/12/26 2:50 PM, Jan Beulich wrote:
> > On 12.10.2026 11:20, Oleksii Kurochko wrote:
> > > On 10/10/26 5:14 AM, Zhang Zheng wrote:
> > > > XScale-compatible UARTs require UART_IER_UUE to remain set.  Probe the
> > > > bit during setup and preserve it when enabling receive interrupts, so
> > > > the xscale/PXA UART remains operational after ns16550 takes over.
> > > > 
> > > > Signed-off-by: Zhang Zheng <zhangzheng@iscas.ac.cn>
> > > > ---
> > > >    xen/drivers/char/ns16550.c  | 12 +++++++++++-
> > > >    xen/include/xen/8250-uart.h |  1 +
> > > >    2 files changed, 12 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> > > > index cdda28879e..c174465059 100644
> > > > --- a/xen/drivers/char/ns16550.c
> > > > +++ b/xen/drivers/char/ns16550.c
> > > > @@ -64,6 +64,7 @@ static struct ns16550 {
> > > >        bool intr_works;
> > > >        bool force_polling;
> > > >        bool dw_usr_bsy;
> > > > +    bool xscale;
> > > >    #ifdef NS16550_PCI
> > > >        /* PCI card parameters. */
> > > >        bool pb_bdf_enable;     /* if =1, pb-bdf effective, port behind bridge */
> > > > @@ -352,6 +353,14 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
> > > >        /* No interrupts. */
> > > >        ns_write_reg(uart, UART_IER, 0);
> > > > +    uart->xscale = false;
> > > > +    if ( !(ns_read_reg(uart, UART_IER) & UART_IER_UUE) )
> > > > +    {
> > > > +        ns_write_reg(uart, UART_IER, UART_IER_UUE);
> > > > +        if ( ns_read_reg(uart, UART_IER) & UART_IER_UUE )
> > > > +            uart->xscale = true;
> > > > +    }
> > > > +
> > > 
> > > This probe only checks whether IER bit 6 is writable, which isn't
> > > specific to XScale. On UARTs with an EFR (e.g. ST16C650, TI TL16C752,
> > > Exar XR17V35x) the upper IER bits become writable once EFR[4] (ECB) is
> > > set, and bit 6 is then the RTS interrupt enable. If ECB is already set
> > > when the probe runs, it would report XScale, and the driver would then
> > > keep the RTS interrupt enabled.
> > > 
> > > Could the flag be derived from the compatible in ns16550_uart_dt_init()
> > > instead, the same way dw_usr_bsy is?
> > > 
> > >       uart->xscale = dt_device_is_compatible(dev, "intel,xscale-uart");
> > > 
> > > That compatible would also need adding to ns16550_dt_match[]. The
> > > SpacemiT K1 nodes, for example, have no "ns16550a" fallback.
> > 
> > Are you suggesting that Linux'es XScale detection is flawed then, too?
> 
> I looked at it quickly and not flawed as such, but Linux uses that test only
> as a last-resort heuristic, which isn't how it would be used here.
> 
> In Linux the bit 6 test sits at the end of autoconfig_16550a(). That
> only runs for ports whose type isn't known up front (legacy/PnP/PCI
> autoprobing), and only with CONFIG_SERIAL_8250_16550A_VARIANTS or
> UPF_FULL_PROBE. It also comes after the EFR probes, so ST16C65x /
> TL16C75x style parts are classified and return before reaching it.
> Even so, the comment there says "this is probably one of the Xscale
> platform's internal UARTs", and a part whose EFR already has ECB set
> would fall through the EFR check and be reported as XScale. So yes,
> the same corner case exists there.
> 
> Where the type is known, Linux doesn't probe at all: 8250_of maps
> "intel,xscale-uart" to PORT_XSCALE and sets UPF_FIXED_TYPE, so
> autoconfig() (where it is happening the probing in a similar to suggested
> above way) never runs for DT ports. 8250_exar sets UPF_FIXED_TYPE as well.
> 
I agree that it is better to drop the UUE probe and identify the XScale UART
directly from its compatible.

Zhang
> > 
> > > > @@ -446,7 +455,8 @@ static void ns16550_setup_postirq(struct ns16550 *uart)
> > > >                         UART_MCR, UART_MCR_OUT2 | UART_MCR_DTR | UART_MCR_RTS);
> > > >            /* Enable receive interrupts. */
> > > > -        ns_write_reg(uart, UART_IER, UART_IER_ERDAI);
> > > > +        ns_write_reg(uart, UART_IER,
> > > > +                     UART_IER_ERDAI | (uart->xscale ? UART_IER_UUE : 0));
> > > 
> > > It seems like not all cases are covered. For example,
> > > ns16550_interrupt() writes 0 to IER when it switches to polling, which
> > > would turn off the UART on XScale. Am I missing something? If not then
> > > something like:
> > > 
> > > static void ns_write_ier(const struct ns16550 *uart, uint8_t ier)
> > > {
> > >       if ( uart->xscale )
> > >           ier |= UART_IER_UUE;
> > > 
> > >       ns_write_reg(uart, UART_IER, ier);
> > > }
> > > 
> > > would be needed, used in ns16550_setup_preirq(), ns16550_setup_postirq()
> > 
> > Yes, the more that as per Linux'es driver source, bit 4 may also need keeping
> > permanently set (not only for XScale, but apparently also for Tegra).
> 
> Good point.
> 
> ~ Oleksii


