Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B530ECC6B2F
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 04:52:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449865.1665427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHDSO-0006yL-4Q; Thu, 15 Oct 2026 04:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449865.1665427; Thu, 15 Oct 2026 04:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHDSO-0006yE-1p; Thu, 15 Oct 2026 04:52:44 +0000
Received: by outflank-mailman (input) for mailman id 1449865;
 Thu, 15 Oct 2026 04:52:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xHDSM-0006x3-3F
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 04:52:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHDSL-000th4-Cd
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 06:52:41 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad05bfd-e002-0a2a0a5209dd-0a2a45088e32-32
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 06:52:40 +0200
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad05c15-f659-0a2a45080019-9fe2fb1598d2-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 06:52:40 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowAB3T_MQXNBqtjTqCg--.2548S2;
 Thu, 15 Oct 2026 12:52:33 +0800 (CST)
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
Date: Thu, 15 Oct 2026 12:52:50 +0800
From: Zhang Zheng <zhangzheng@iscas.ac.cn>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	Baptiste Le Duc <baptiste.le-duc@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] xen/ns16550: drain TX before reinitializing
Message-ID: <atBb535gz9t7yWt3@iscas-ws>
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-3-zhangzheng@iscas.ac.cn>
 <ec65306d-ec1d-4c5a-93f8-b37f7dfea8b5@gmail.com>
 <be9c9f29-e211-4b84-a3b1-fd65f3b52315@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be9c9f29-e211-4b84-a3b1-fd65f3b52315@suse.com>
X-CM-TRANSID:qwCowAB3T_MQXNBqtjTqCg--.2548S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1UZr43Wr4DCr1DCFy8Krg_yoW8uFW3pF
	WDK3ZYyr4kJr4UKw13tw18Wa1jgF93ua45Grn5X34Sv3Z0gry3KrWIqF4Y9F98AF48Jw1Y
	yF4F9F93ZF1YvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VCY1x0262k0Y48FwI0_Jr
	0_Gr1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAK
	I48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5P-PUUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-c1860d/1792039960-D534D87B-B169CF46/0/0
X-purgate-type: clean
X-purgate-size: 2371

On Mon, Oct 12, 2026 at 02:56:56PM +0200, Jan Beulich wrote:
> On 12.10.2026 12:20, Oleksii Kurochko wrote:
> > On 10/10/26 5:14 AM, Zhang Zheng wrote:
> >> --- a/xen/drivers/char/ns16550.c
> >> +++ b/xen/drivers/char/ns16550.c
> >> @@ -427,6 +427,10 @@ static void __init cf_check ns16550_init_preirq(struct serial_port *port)
> >>   #endif
> >>       }
> >>   
> >> +    /* Preserve output queued by firmware before taking over the UART. */
> > я'
> > Could the comment say why the wait is needed at this point? Something
> > like:
> > 
> >      /*
> >       * Output written before ns16550 takes over (e.g. by firmware or the
> >       * early console) may still be in the transmitter. Let it drain before
> >       * ns16550_setup_preirq() reprograms the line settings and resets the
> >       * FIFOs.
> >       */
> > 
> >> +    while ( !(ns_read_reg(uart, UART_LSR) & UART_LSR_TEMT) )
> >> +        cpu_relax();
> >> +
> > 
> > IMO waiting for TEMT rather than THRE is the right choice: besides
> > resetting the FIFOs, ns16550_setup_preirq() reprograms the divisor and
> > LCR, which would corrupt a character still being shifted out. (Linux
> > waits for UART_LSR_BOTH_EMPTY, i.e. THRE | TEMT, but on a 16550 TEMT
> > already implies THRE.)
> > 
> > The unbounded wait can hang early Xen boot if the UART never reports 
> > TEMT for some reason(?). Bounding the wait would make console 
> > initialization more robust, allowing boot to continue when the UART is 
> > unavailable
> > 
> >      for ( i = 0; i < 50000; i++ )
> >      {
> >          if ( ns_read_reg(uart, UART_LSR) & UART_LSR_TEMT )
> >              break;
> >          udelay(10);
> >      }
> > 
> > would need udelay() on RISC-V, which is still a BUG_ON() stub, so a
> > separate patch would be needed for that. On x86, udelay() doesn't delay
> > yet at this point (cpu_khz is only set by early_time_init()), so there
> > the loop would just be an iteration count. Perhaps someone has a better
> > idea of how to implement a timeout here.
> 
> Whatever it is, it's going to be more or less crude. See e.g. Marek's
> solution for a similar issue (yet to be committed):
> https://lists.xen.org/archives/html/xen-devel/2026-10/msg00439.html
> 
> Jan

Thanks for the pointer. I will follow Marek's approach for the bounded
wait.

Zhang


