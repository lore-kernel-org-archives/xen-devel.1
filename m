Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8679ECA5FAB
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 03:10:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436264.1654991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBOE0-0003YO-QM; Tue, 29 Sep 2026 03:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436264.1654991; Tue, 29 Sep 2026 03:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBOE0-0003YD-Lc; Tue, 29 Sep 2026 03:09:48 +0000
Received: by outflank-mailman (input) for mailman id 1436264;
 Tue, 29 Sep 2026 03:09:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xBOE0-0003Y7-5K
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 03:09:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBODy-000XXb-T5
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 05:09:46 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6abb2bcf-2eae-0a2a0a5409dd-0a2a450383a6-14
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 05:09:44 +0200
Received: from [159.226.251.25] (helo=cstnet.cn)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6abb2bf6-fae8-0a2a45030019-9fe2fb19b02c-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 05:09:44 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-05 (Coremail) with SMTP id zQCowAAXSELvK7tqBySjCQ--.2628S2;
 Tue, 29 Sep 2026 11:09:36 +0800 (CST)
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
Date: Tue, 29 Sep 2026 11:10:09 +0800
From: Zhang Zheng <zhangzheng@iscas.ac.cn>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	Baptiste Le Duc <baptiste.le-duc@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 0/1] [RISC-V] replace SBI early console with 8250 UART
Message-ID: <arsr7FV_KDQpyTcS@iscas-ws>
References: <20260928023857.1030884-1-zhangzheng@iscas.ac.cn>
 <5919f1f2-e24c-4b0e-a7dd-126ac6fbe38f@gmail.com>
 <aronfcYWtc1CHQgH@iscas-ws>
 <3152e70f-881f-4a58-9b2d-df661887dc80@gmail.com>
 <arpi6szfHazQg07N@iscas-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arpi6szfHazQg07N@iscas-ws>
X-CM-TRANSID:zQCowAAXSELvK7tqBySjCQ--.2628S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGrWftr4fAF4fZr1xAFyDGFg_yoW5KF43pF
	W7Ka18tan5tFWa9wnFvw48ZFW8t3yrtw4UWr95J3yjgwnYyr1rJrW3tF4Y9a4DJr1kJr1j
	va1Y9a43Wa4UZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUgD5rDUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-33051d/1790651384-75EFF4E9-FD163318/0/0
X-purgate-type: clean
X-purgate-size: 3825

On Mon, Sep 28, 2026 at 08:53:15PM +0800, Zhang Zheng wrote:
> On Mon, Sep 28, 2026 at 11:31:06AM +0200, Oleksii Kurochko wrote:
> > 
> > 
> > On 9/28/26 10:40 AM, Zhang Zheng wrote:
> > > On Mon, Sep 28, 2026 at 09:38:14AM +0200, Oleksii Kurochko wrote:
> > > > 
> > > > 
> > > > On 9/28/26 4:38 AM, Zhang Zheng wrote:
> > > > > The legacy SBI console extension is planned for deprecation. Replace the
> > > > > RISC-V early printk backend with direct access to 8250 UART MMIO.
> > > > 
> > > > Won't it better just to start to add support of newer SBI? It provides
> > > > pretty good support + faster as it supports passing of string instead of one
> > > > char.
> > > > 
> > > 
> > > Using the newer SBI DBCN extension would indeed result in a smaller change. At
> > > the time, I mainly followed the direction suggested by the TODO and referred
> > > directly to the arm64 implementation, from which most of the code was adapted.
> > 
> > I think TODO was written at that way because I missed DBCN (or it wasn't
> > ratified at that moment). Considering that it is ratified now ...
> > 
> > > 
> > > > Also, I think it will lead to lesser changes.
> > > > 
> > > 
> > > If falling back to SBI console putchar is acceptable, DBCN should work
> > > well here.
> > 
> > ... I prefer to use SBI functionality (in the current case DBCN) as maximum
> > as possible so if there is no any reason (and I don't see at the moment it)
> > which doesn't allow us to use DBCN here, I would prefer to use DBCN.
> > 
> 
> Given that Xen on RISC-V is expected to target relatively recent RVA23 hardware,
> which should ship with a recent version of OpenSBI, I think you are right that
> there is no real need to provide a fallback here.
> 
> > If you still want to in the way suggested by TODO then some parts which are
> > common between Arm and RISC-V should be moved to common instead of
> > introducing them in RISC-V specific folder.
> >
> 
> I also tried to make the current patch as minimal as possible, but it would
> still end up touching quite a few places.
> 
> > Let me know which approach you are going to follow. If the current one you
> > already introduced then I will start to review it, if you will go SBI-way
> > then I prefer to wait for your v2.
> > 
> > ~ Oleksii
> > 
> 
> I misunderstood the TODO comment, I thought that would be the preferred
> implementation. Therefore, I will switch to using DBCN and send a v2.
> 
> Best regards,
> 
> Zhang
> 

Hi Oleksii,

I initially assumed that the DBCN console-write call would wait until the
whole string had been transmitted. After checking the SBI specification
and the Linux implementation, I found that this is not the case.

The DBCN Console Write function is explicitly non-blocking. Linux uses DBCN
through the HVC console driver, so the DBCN backend remains the owner of the
console and the 8250 driver does not subsequently reinitialize the same UART
or clear its FIFO.

On the other hand, when Linux uses an 8250 earlycon, it accesses the UART
directly and waits for UART_LSR_TEMT before the regular 8250 driver takes
over.

The current Xen setup combines these two paths: early printk uses the SBI
console, while the later 8250 driver initializes the same UART. During this
handover, the 8250 driver clears the TX FIFO, which can discard characters
that were accepted by SBI but have not yet been transmitted by the UART.

Therefore, if Xen is going to use the 8250 driver after early printk, I
think the early console should use the same 8250 MMIO path, as Linux does
with 8250 earlycon. This keeps the early-console backend consistent with
the driver that takes ownership of the UART and allows Xen to wait for
UART_LSR_TEMT before reinitialization.

BR

Zhang


