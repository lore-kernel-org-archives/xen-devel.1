Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868B8CC6B2F
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 06:49:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449920.1665436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHFGU-0006ti-S3; Thu, 15 Oct 2026 06:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449920.1665436; Thu, 15 Oct 2026 06:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHFGU-0006ta-NF; Thu, 15 Oct 2026 06:48:34 +0000
Received: by outflank-mailman (input) for mailman id 1449920;
 Thu, 15 Oct 2026 06:48:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xHFGS-0006sP-IG
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 06:48:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHFGR-0069oh-Ne
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 08:48:31 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad07726-8faa-0a2a0a5109dd-0a2a4504b5bc-44
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 08:48:29 +0200
Received: from [159.226.251.25] (helo=cstnet.cn)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad0773a-b57f-0a2a45040019-9fe2fb19cc26-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 08:48:28 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-05 (Coremail) with SMTP id zQCowABXxD41d9BqQ3VxCw--.4124S2;
 Thu, 15 Oct 2026 14:48:22 +0800 (CST)
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
Date: Thu, 15 Oct 2026 14:48:40 +0800
From: Zhang Zheng <zhangzheng@iscas.ac.cn>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	Baptiste Le Duc <baptiste.le-duc@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/2] xen/ns16550: drain TX before reinitializing
Message-ID: <atB3OZfluh6Ceeni@iscas-ws>
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-3-zhangzheng@iscas.ac.cn>
 <ec65306d-ec1d-4c5a-93f8-b37f7dfea8b5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec65306d-ec1d-4c5a-93f8-b37f7dfea8b5@gmail.com>
X-CM-TRANSID:zQCowABXxD41d9BqQ3VxCw--.4124S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1rArWxJFWDWF4xAFyDtrb_yoW8WFW8pF
	WkK395tF4kKr45WwnFq3WxJw47trsxCayUCr1DJa9Fyrs8XrWxCrWfK3yagas0kr1xJw4j
	yF42gas7AasYvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Eb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr1j6F
	4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14
	v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5SXd5UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-ebf023/1792046909-C20D5B50-606DFD10/0/0
X-purgate-type: clean
X-purgate-size: 1767

On Mon, Oct 12, 2026 at 12:20:50PM +0200, Oleksii Kurochko wrote:
> 
> 
> On 10/10/26 5:14 AM, Zhang Zheng wrote:
> > An SBI console call may return before the UART finishes transmitting.
> > Wait for UART_LSR_TEMT before ns16550 reprograms the UART and clears its
> > FIFO, preserving pending early-console output and legacy SBI v0.1 support.
> 
> The problem isn't really specific to SBI: anything that wrote to the UART
> before ns16550 takes over (firmware, a bootloader, or Xen's own early
> console) can leave data in the TX FIFO or the shift register. I'd
> describe it in those terms.
Agreed.
> Could the comment say why the wait is needed at this point? Something
> like:
> 
>     /*
>      * Output written before ns16550 takes over (e.g. by firmware or the
>      * early console) may still be in the transmitter. Let it drain before
>      * ns16550_setup_preirq() reprograms the line settings and resets the
>      * FIFOs.
>      */
> 
Thanks, I will use it in next version.
> > +    while ( !(ns_read_reg(uart, UART_LSR) & UART_LSR_TEMT) )
> > +        cpu_relax();
> > +
> 
> IMO waiting for TEMT rather than THRE is the right choice: besides
> resetting the FIFOs, ns16550_setup_preirq() reprograms the divisor and
> LCR, which would corrupt a character still being shifted out. (Linux
> waits for UART_LSR_BOTH_EMPTY, i.e. THRE | TEMT, but on a 16550 TEMT
> already implies THRE.)
> 
Yes, I followed the Linux implementation, which waits in an unbounded loop
and theck UART_LSR_BOTH_EMPTY like you said:

for (;;) {
		status = serial8250_early_in(port, UART_LSR);
		if (uart_lsr_tx_empty(status)) /* checks UART_LSR_BOTH_EMPTY */
				break;
		cpu_relax();
}

So I didn't have timeout handling

Zhang


