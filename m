Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00119CC6B2E
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 04:41:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449844.1665401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHDGs-0002gj-Oh; Thu, 15 Oct 2026 04:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449844.1665401; Thu, 15 Oct 2026 04:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHDGs-0002gc-Kb; Thu, 15 Oct 2026 04:40:50 +0000
Received: by outflank-mailman (input) for mailman id 1449844;
 Thu, 15 Oct 2026 04:40:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xHDGr-0002gW-88
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 04:40:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHDGq-005oSq-LQ
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 06:40:48 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad0591b-8faa-0a2a0a5109dd-0a2a450ac2bc-42
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 06:40:46 +0200
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad0594c-f2d2-0a2a450a0019-9fe2fb15a460-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 06:40:46 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowAAn__JGWdBqSv7pCg--.2109S2;
 Thu, 15 Oct 2026 12:40:39 +0800 (CST)
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
Date: Thu, 15 Oct 2026 12:40:56 +0800
From: Zhang Zheng <zhangzheng@iscas.ac.cn>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Baptiste Le Duc <baptiste.le-duc@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] xen/ns16550: detect and preserve UART_IER_UUE
Message-ID: <atBVo8O91QHtxPFI@iscas-ws>
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-2-zhangzheng@iscas.ac.cn>
 <5bc2e923-4265-484f-9236-25a56560e2c3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5bc2e923-4265-484f-9236-25a56560e2c3@suse.com>
X-CM-TRANSID:qwCowAAn__JGWdBqSv7pCg--.2109S2
X-Coremail-Antispam: 1UD129KBjvJXoWruFyrGr4UuF15JF48Jr15twb_yoW8Jry7p3
	yxKF1vyrsrt3W8Ca9Iq3WDZF4Sg3Z7X34SkrWfG3yfZF15ArWF9F13JFsIqF1Du3W0yF1U
	uF4Y9347Jas8Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB0b7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VCY1x0262k0Y48FwI0_Jr
	0_Gr1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vI
	r41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2Vc_DUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-4011c0/1792039246-593C4CFC-7EA99349/0/0
X-purgate-type: clean
X-purgate-size: 1369

On Mon, Oct 12, 2026 at 02:52:06PM +0200, Jan Beulich wrote:
> On 10.10.2026 05:14, Zhang Zheng wrote:
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -64,6 +64,7 @@ static struct ns16550 {
> >      bool intr_works;
> >      bool force_polling;
> >      bool dw_usr_bsy;
> > +    bool xscale;
> >  #ifdef NS16550_PCI
> >      /* PCI card parameters. */
> >      bool pb_bdf_enable;     /* if =1, pb-bdf effective, port behind bridge */
> > @@ -352,6 +353,14 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
> >      /* No interrupts. */
> >      ns_write_reg(uart, UART_IER, 0);
> >  
> > +    uart->xscale = false;
> > +    if ( !(ns_read_reg(uart, UART_IER) & UART_IER_UUE) )
> > +    {
> > +        ns_write_reg(uart, UART_IER, UART_IER_UUE);
> > +        if ( ns_read_reg(uart, UART_IER) & UART_IER_UUE )
> > +            uart->xscale = true;
> > +    }
> 
> Linux'es detection is a little more involved, plus: It doesn't clobber the
> value originally present in the other 7 bits.
> 
> Jan

I noticed that Linux saves the original IER value and clears only UUE:

iersave = serial_in(up, UART_IER);
serial_out(up, UART_IER, iersave & ~UART_IER_UUE);

Xen clears IER immediately before this probe, so I think there is no previous
IER state to preserve. So I did not add `iersave` here.


