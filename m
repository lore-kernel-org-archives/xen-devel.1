Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30231C9833F
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 12:53:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436008.1654766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBAqj-0000zj-GD; Mon, 28 Sep 2026 12:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436008.1654766; Mon, 28 Sep 2026 12:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBAqj-0000zc-Br; Mon, 28 Sep 2026 12:52:53 +0000
Received: by outflank-mailman (input) for mailman id 1436008;
 Mon, 28 Sep 2026 12:52:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xBAqi-0000zU-IR
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 12:52:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBAqh-004QVP-Vb
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 14:52:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6aba6319-bab6-0a2a0a5309dd-0a2a45068454-16
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 14:52:50 +0200
Received: from [159.226.251.25] (helo=cstnet.cn)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6aba631f-195a-0a2a45060019-9fe2fb19898c-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 14:52:49 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-05 (Coremail) with SMTP id zQCowAC36EIYY7pqBZ2UCQ--.12125S2;
 Mon, 28 Sep 2026 20:52:41 +0800 (CST)
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
Date: Mon, 28 Sep 2026 20:53:13 +0800
From: Zhang Zheng <zhangzheng@iscas.ac.cn>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	Baptiste Le Duc <baptiste.le-duc@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 0/1] [RISC-V] replace SBI early console with 8250 UART
Message-ID: <arpi6szfHazQg07N@iscas-ws>
References: <20260928023857.1030884-1-zhangzheng@iscas.ac.cn>
 <5919f1f2-e24c-4b0e-a7dd-126ac6fbe38f@gmail.com>
 <aronfcYWtc1CHQgH@iscas-ws>
 <3152e70f-881f-4a58-9b2d-df661887dc80@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3152e70f-881f-4a58-9b2d-df661887dc80@gmail.com>
X-CM-TRANSID:zQCowAC36EIYY7pqBZ2UCQ--.12125S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGrWftr4xGryUJF17uF1rZwb_yoWrZryfpF
	W8C3ZYkr45Jr1ak34Sg3WUurWak3ykGa4UXasxCrWYgrZ0vrWUAry3t34F9asrXF15Xry0
	kF10gry3W3WUA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26F4j6r4UJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUqFdyDUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-16d1c6/1790599970-F70C777B-54046F54/0/0
X-purgate-type: clean
X-purgate-size: 4937

On Mon, Sep 28, 2026 at 11:31:06AM +0200, Oleksii Kurochko wrote:
> 
> 
> On 9/28/26 10:40 AM, Zhang Zheng wrote:
> > On Mon, Sep 28, 2026 at 09:38:14AM +0200, Oleksii Kurochko wrote:
> > > 
> > > 
> > > On 9/28/26 4:38 AM, Zhang Zheng wrote:
> > > > The legacy SBI console extension is planned for deprecation. Replace the
> > > > RISC-V early printk backend with direct access to 8250 UART MMIO.
> > > 
> > > Won't it better just to start to add support of newer SBI? It provides
> > > pretty good support + faster as it supports passing of string instead of one
> > > char.
> > > 
> > 
> > Using the newer SBI DBCN extension would indeed result in a smaller change. At
> > the time, I mainly followed the direction suggested by the TODO and referred
> > directly to the arm64 implementation, from which most of the code was adapted.
> 
> I think TODO was written at that way because I missed DBCN (or it wasn't
> ratified at that moment). Considering that it is ratified now ...
> 
> > 
> > > Also, I think it will lead to lesser changes.
> > > 
> > 
> > If falling back to SBI console putchar is acceptable, DBCN should work
> > well here.
> 
> ... I prefer to use SBI functionality (in the current case DBCN) as maximum
> as possible so if there is no any reason (and I don't see at the moment it)
> which doesn't allow us to use DBCN here, I would prefer to use DBCN.
> 

Given that Xen on RISC-V is expected to target relatively recent RVA23 hardware,
which should ship with a recent version of OpenSBI, I think you are right that
there is no real need to provide a fallback here.

> If you still want to in the way suggested by TODO then some parts which are
> common between Arm and RISC-V should be moved to common instead of
> introducing them in RISC-V specific folder.
>

I also tried to make the current patch as minimal as possible, but it would
still end up touching quite a few places.

> Let me know which approach you are going to follow. If the current one you
> already introduced then I will start to review it, if you will go SBI-way
> then I prefer to wait for your v2.
> 
> ~ Oleksii
> 

I misunderstood the TODO comment, I thought that would be the preferred
implementation. Therefore, I will switch to using DBCN and send a v2.

Best regards,

Zhang

> > > > 
> > > > This also addresses truncated output observed on SpacemiT K3 when
> > > > switching from early printk to dtuart. Direct UART access lets early
> > > > printk flush the UART after each string before the dtuart driver takes
> > > > over and clear it's FIFO, which cause the truncated uart output.>
> > > > The truncated uart looks like:
> > > > 
> > > >     (XEN) Command line: dtuart=/soc/uart@d4017000:115200/921600 console=dtuart sync_console
> > > >     (XEN) Domain heap initialised
> > > >     (XEN) Booting using Device Tree
> > > >     (XEN) /home/zz/dev/git/xen_stuff/xen/xen/arch/riscv/cpufeature.c:710: SSTC detected; supported for Xen use, but not for guests
> > > >     (XEN) Looking for dtuart at "/soc/uart@d40 __  __            _  _    ____  _____                    _        _     _
> > > >      \ \/ /___ _ __   | || |  |___ \|___ /    _   _ _ __  ___| |_ __ _| |__ | | ___
> > > >       \  // _ \ '_ \  | || |_   __) | |_ \ __| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
> > > >       /  \  __/ | | | |__   _| / __/ ___) |__| |_| | | | \__ \ || (_| | |_) | |  __/
> > > >      /_/\_\___|_| |_|    |_|(_)_____|____/    \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
> > > > 
> > > >     (XEN) Xen version 4.23-unstable (zz@) (riscv64-linux-gnu-gcc (GCC) 15.1.0) debug=y ubsan=y Sat Sep 26 14:50:31 CST 2026
> > > >     (XEN) Latest ChangeSet: Fri Sep 18 10:11:27 2026 +0800 git:77544a69ea
> > > > 
> > > > Zheng Zhang (1):
> > > >     xen/riscv: replace SBI early console with 8250 UAR
> > > > 
> > > >    xen/arch/riscv/Kconfig.debug              | 53 ++++++++++++++++++++--
> > > >    xen/arch/riscv/configs/tiny64_defconfig   |  2 +
> > > >    xen/arch/riscv/early_printk.c             | 37 +++++++---------
> > > >    xen/arch/riscv/include/asm/early_printk.h | 12 +++++
> > > >    xen/arch/riscv/include/asm/fixmap.h       |  6 ++-
> > > >    xen/arch/riscv/include/asm/sbi.h          |  7 ---
> > > >    xen/arch/riscv/mm.c                       | 41 +++++++++++++----
> > > >    xen/arch/riscv/riscv64/Makefile           |  1 +
> > > >    xen/arch/riscv/riscv64/debug-8250.inc     | 51 +++++++++++++++++++++
> > > >    xen/arch/riscv/riscv64/debug.S            | 54 +++++++++++++++++++++++
> > > >    xen/arch/riscv/sbi.c                      |  5 ---
> > > >    11 files changed, 223 insertions(+), 46 deletions(-)
> > > >    create mode 100644 xen/arch/riscv/riscv64/debug-8250.inc
> > > >    create mode 100644 xen/arch/riscv/riscv64/debug.S
> > > > 
> > > > base-commit: 4c1aba82cff95ab11f7fe4af8965a06703537288
> > 
> 
> 


