Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82797C9832F
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 08:40:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435774.1654569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB6uD-0007eT-PU; Mon, 28 Sep 2026 08:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435774.1654569; Mon, 28 Sep 2026 08:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB6uD-0007eK-Mz; Mon, 28 Sep 2026 08:40:13 +0000
Received: by outflank-mailman (input) for mailman id 1435774;
 Mon, 28 Sep 2026 08:40:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xB6uC-0007eE-P3
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 08:40:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB6uB-00Gdvq-98
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 10:40:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6aba27e2-bab6-0a2a0a5309dd-0a2a4501a568-36
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 10:40:09 +0200
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6aba27e6-5984-0a2a45010019-9fe2fb15ceba-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 10:40:08 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowAA3C+_hJ7pqLQRFCQ--.32003S2;
 Mon, 28 Sep 2026 16:40:02 +0800 (CST)
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
Date: Mon, 28 Sep 2026 16:40:31 +0800
From: Zhang Zheng <zhangzheng@iscas.ac.cn>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	Baptiste Le Duc <baptiste.le-duc@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 0/1] [RISC-V] replace SBI early console with 8250 UART
Message-ID: <aronfcYWtc1CHQgH@iscas-ws>
References: <20260928023857.1030884-1-zhangzheng@iscas.ac.cn>
 <5919f1f2-e24c-4b0e-a7dd-126ac6fbe38f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5919f1f2-e24c-4b0e-a7dd-126ac6fbe38f@gmail.com>
X-CM-TRANSID:qwCowAA3C+_hJ7pqLQRFCQ--.32003S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFWrZr1kZr43Aw1kAF13Arb_yoW5Ar17pF
	4DCFn5Cr45JFnIk3WfWa4Uur43Cws5Ga4YvFy3CryYg3yUZrW7Arn8J34FkwnrJFy5Xw10
	kF1rWF15u3WUJ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWxJVW8Jr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU54T5tUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-d62444/1790584809-1F063757-67A87719/0/0
X-purgate-type: clean
X-purgate-size: 3239

On Mon, Sep 28, 2026 at 09:38:14AM +0200, Oleksii Kurochko wrote:
> 
> 
> On 9/28/26 4:38 AM, Zhang Zheng wrote:
> > The legacy SBI console extension is planned for deprecation. Replace the
> > RISC-V early printk backend with direct access to 8250 UART MMIO.
> 
> Won't it better just to start to add support of newer SBI? It provides
> pretty good support + faster as it supports passing of string instead of one
> char.
> 

Using the newer SBI DBCN extension would indeed result in a smaller change. At
the time, I mainly followed the direction suggested by the TODO and referred
directly to the arm64 implementation, from which most of the code was adapted.

> Also, I think it will lead to lesser changes.
> 

If falling back to SBI console putchar is acceptable, DBCN should work
well here.

> ~ Oleksii
> 
> > 
> > This also addresses truncated output observed on SpacemiT K3 when
> > switching from early printk to dtuart. Direct UART access lets early
> > printk flush the UART after each string before the dtuart driver takes
> > over and clear it's FIFO, which cause the truncated uart output.>
> > The truncated uart looks like:
> > 
> >    (XEN) Command line: dtuart=/soc/uart@d4017000:115200/921600 console=dtuart sync_console
> >    (XEN) Domain heap initialised
> >    (XEN) Booting using Device Tree
> >    (XEN) /home/zz/dev/git/xen_stuff/xen/xen/arch/riscv/cpufeature.c:710: SSTC detected; supported for Xen use, but not for guests
> >    (XEN) Looking for dtuart at "/soc/uart@d40 __  __            _  _    ____  _____                    _        _     _
> >     \ \/ /___ _ __   | || |  |___ \|___ /    _   _ _ __  ___| |_ __ _| |__ | | ___
> >      \  // _ \ '_ \  | || |_   __) | |_ \ __| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
> >      /  \  __/ | | | |__   _| / __/ ___) |__| |_| | | | \__ \ || (_| | |_) | |  __/
> >     /_/\_\___|_| |_|    |_|(_)_____|____/    \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
> > 
> >    (XEN) Xen version 4.23-unstable (zz@) (riscv64-linux-gnu-gcc (GCC) 15.1.0) debug=y ubsan=y Sat Sep 26 14:50:31 CST 2026
> >    (XEN) Latest ChangeSet: Fri Sep 18 10:11:27 2026 +0800 git:77544a69ea
> > 
> > Zheng Zhang (1):
> >    xen/riscv: replace SBI early console with 8250 UAR
> > 
> >   xen/arch/riscv/Kconfig.debug              | 53 ++++++++++++++++++++--
> >   xen/arch/riscv/configs/tiny64_defconfig   |  2 +
> >   xen/arch/riscv/early_printk.c             | 37 +++++++---------
> >   xen/arch/riscv/include/asm/early_printk.h | 12 +++++
> >   xen/arch/riscv/include/asm/fixmap.h       |  6 ++-
> >   xen/arch/riscv/include/asm/sbi.h          |  7 ---
> >   xen/arch/riscv/mm.c                       | 41 +++++++++++++----
> >   xen/arch/riscv/riscv64/Makefile           |  1 +
> >   xen/arch/riscv/riscv64/debug-8250.inc     | 51 +++++++++++++++++++++
> >   xen/arch/riscv/riscv64/debug.S            | 54 +++++++++++++++++++++++
> >   xen/arch/riscv/sbi.c                      |  5 ---
> >   11 files changed, 223 insertions(+), 46 deletions(-)
> >   create mode 100644 xen/arch/riscv/riscv64/debug-8250.inc
> >   create mode 100644 xen/arch/riscv/riscv64/debug.S
> > 
> > base-commit: 4c1aba82cff95ab11f7fe4af8965a06703537288


