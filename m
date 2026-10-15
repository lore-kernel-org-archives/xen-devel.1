Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B596CC6B2F
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 08:50:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450055.1665561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHH9x-0000p5-GO; Thu, 15 Oct 2026 08:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450055.1665561; Thu, 15 Oct 2026 08:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHH9x-0000oy-Co; Thu, 15 Oct 2026 08:49:57 +0000
Received: by outflank-mailman (input) for mailman id 1450055;
 Thu, 15 Oct 2026 08:49:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xHH9w-0000os-IQ
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 08:49:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHH9v-006ZYe-NX
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 10:49:55 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad093a7-2eae-0a2a0a5409dd-0a2a45059d64-20
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:49:54 +0200
Received: from [159.226.251.81] (helo=cstnet.cn)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad093af-4cb1-0a2a45050019-9fe2fb51b9a8-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:49:53 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-03 (Coremail) with SMTP id rQCowAD3AkGpk9BqbRbUCg--.1928S2;
 Thu, 15 Oct 2026 16:49:46 +0800 (CST)
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
Date: Thu, 15 Oct 2026 16:49:52 +0800
From: Zhang Zheng <zhangzheng@iscas.ac.cn>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	Baptiste Le Duc <baptiste.le-duc@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/2] xen/ns16550: drain TX before reinitializing
Message-ID: <atCTKJXUnYfxz2rE@iscas-ws>
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-3-zhangzheng@iscas.ac.cn>
 <ec65306d-ec1d-4c5a-93f8-b37f7dfea8b5@gmail.com>
 <atB2HqxU_D481PBk@iscas-ws>
 <f7dd6f51-ac42-4487-9f9f-cf0d3ba64455@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7dd6f51-ac42-4487-9f9f-cf0d3ba64455@gmail.com>
X-CM-TRANSID:rQCowAD3AkGpk9BqbRbUCg--.1928S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1UuF1fZrWkKr47ur4rZrb_yoW8uFyfpF
	W5KFZ0kr4DJr42gw12q3WIq3y2qr15Ca4UWrn5G3ySvFWqkr45AF1agrWY9FWkZr4kJr12
	yF1I9asxXw1Yvw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4UJVWxJr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07befHbUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-c201ff/1792054194-71EA92A1-722A38DE/0/0
X-purgate-type: clean
X-purgate-size: 2338

On Thu, Oct 15, 2026 at 09:54:46AM +0200, Oleksii Kurochko wrote:
> 
> 
> On 10/15/26 8:44 AM, Zhang Zheng wrote:
> > On Mon, Oct 12, 2026 at 12:20:50PM +0200, Oleksii Kurochko wrote:
> > > > --- a/xen/drivers/char/ns16550.c
> > > > +++ b/xen/drivers/char/ns16550.c
> 
> [...]
> 
> > > > +    while ( !(ns_read_reg(uart, UART_LSR) & UART_LSR_TEMT) )
> > > > +        cpu_relax();
> > > > +
> > > 
> > > IMO waiting for TEMT rather than THRE is the right choice: besides
> > > resetting the FIFOs, ns16550_setup_preirq() reprograms the divisor and
> > > LCR, which would corrupt a character still being shifted out. (Linux
> > > waits for UART_LSR_BOTH_EMPTY, i.e. THRE | TEMT, but on a 16550 TEMT
> > > already implies THRE.)
> > > 
> > Yes, I followed the Linux implementation, which waits in an unbounded loop
> > and theck UART_LSR_BOTH_EMPTY like you said:
> > 
> > for (;;) {
> > 		status = serial8250_early_in(port, UART_LSR);
> > 		if (uart_lsr_tx_empty(status)) /* checks UART_LSR_BOTH_EMPTY */
> > 				break;
> > 		cpu_relax();
> > }
> > 
> > So I didn't have timeout handling
> > > The unbounded wait can hang early Xen boot if the UART never reports TEMT
> > > for some reason(?). Bounding the wait would make console initialization more
> > > robust, allowing boot to continue when the UART is unavailable
> > > 
> > >      for ( i = 0; i < 50000; i++ )
> > >      {
> > >          if ( ns_read_reg(uart, UART_LSR) & UART_LSR_TEMT )
> > >              break;
> > >          udelay(10);
> > >      }
> > > 
> > > would need udelay() on RISC-V, which is still a BUG_ON() stub, so a
> > > separate patch would be needed for that. On x86, udelay() doesn't delay
> > > yet at this point (cpu_khz is only set by early_time_init()), so there
> > > the loop would just be an iteration count. Perhaps someone has a better
> > > idea of how to implement a timeout here.
> > > 
> > > ~ Oleksii
> > > 
> > Leaving aside the unavailability of udelay() at this point, is a timeout
> > considered necessary here?
> 
> In the way Jan B. mentioned here: https://lore.kernel.org/xen-devel/20261010031406.2057735-1-zhangzheng@iscas.ac.cn/T/#meaf24c3bb039dc6aaecffab752d2b107581816e0
> 
> I think we still can have timeout check.
> 
> ~ Oleksii

I saw it afterwards. Thanks.

Zhang


