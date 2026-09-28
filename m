Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBD6C9832F
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 02:39:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435631.1654435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB1GM-0001N0-T8; Mon, 28 Sep 2026 02:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435631.1654435; Mon, 28 Sep 2026 02:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB1GM-0001Mo-NT; Mon, 28 Sep 2026 02:38:42 +0000
Received: by outflank-mailman (input) for mailman id 1435631;
 Mon, 28 Sep 2026 02:38:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xB1GM-0001Mc-4a
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 02:38:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB1GJ-007jIb-TE
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 04:38:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ab9d2ae-bab6-0a2a0a5309dd-0a2a4502cc52-32
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 04:38:37 +0200
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ab9d32a-6ca4-0a2a45020019-9fe2fb15aa0c-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 04:38:37 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowAAH3fAl07lqgMQ+CQ--.323S2;
 Mon, 28 Sep 2026 10:38:29 +0800 (CST)
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
From: Zhang Zheng <zhangzheng@iscas.ac.cn>
To: xen-devel@lists.xenproject.org
Cc: Zhang Zheng <zhangzheng@iscas.ac.cn>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 0/1] [RISC-V] replace SBI early console with 8250 UART
Date: Mon, 28 Sep 2026 10:38:52 +0800
Message-ID: <20260928023857.1030884-1-zhangzheng@iscas.ac.cn>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAH3fAl07lqgMQ+CQ--.323S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4xCr4rWF4kCry8ArW3GFg_yoW8uw4fpF
	4DCFn8Gr15AFn3G34fJa4qgr43C395Ww1YqFy3Cry5W3yUArWUCrn8J3yFkw17AFy5Xw1x
	CF1rGFyrC3WUGwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfU5dgADUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-720697/1790563117-F3CBA2AC-D6311A29/0/0
X-purgate-type: clean
X-purgate-size: 2375

The legacy SBI console extension is planned for deprecation. Replace the
RISC-V early printk backend with direct access to 8250 UART MMIO.

This also addresses truncated output observed on SpacemiT K3 when
switching from early printk to dtuart. Direct UART access lets early
printk flush the UART after each string before the dtuart driver takes
over and clear it's FIFO, which cause the truncated uart output.

The truncated uart looks like:

  (XEN) Command line: dtuart=/soc/uart@d4017000:115200/921600 console=dtuart sync_console
  (XEN) Domain heap initialised
  (XEN) Booting using Device Tree
  (XEN) /home/zz/dev/git/xen_stuff/xen/xen/arch/riscv/cpufeature.c:710: SSTC detected; supported for Xen use, but not for guests
  (XEN) Looking for dtuart at "/soc/uart@d40 __  __            _  _    ____  _____                    _        _     _
   \ \/ /___ _ __   | || |  |___ \|___ /    _   _ _ __  ___| |_ __ _| |__ | | ___
    \  // _ \ '_ \  | || |_   __) | |_ \ __| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
    /  \  __/ | | | |__   _| / __/ ___) |__| |_| | | | \__ \ || (_| | |_) | |  __/
   /_/\_\___|_| |_|    |_|(_)_____|____/    \__,_|_| |_|___/\__\__,_|_.__/|_|\___|

  (XEN) Xen version 4.23-unstable (zz@) (riscv64-linux-gnu-gcc (GCC) 15.1.0) debug=y ubsan=y Sat Sep 26 14:50:31 CST 2026
  (XEN) Latest ChangeSet: Fri Sep 18 10:11:27 2026 +0800 git:77544a69ea

Zheng Zhang (1):
  xen/riscv: replace SBI early console with 8250 UAR

 xen/arch/riscv/Kconfig.debug              | 53 ++++++++++++++++++++--
 xen/arch/riscv/configs/tiny64_defconfig   |  2 +
 xen/arch/riscv/early_printk.c             | 37 +++++++---------
 xen/arch/riscv/include/asm/early_printk.h | 12 +++++
 xen/arch/riscv/include/asm/fixmap.h       |  6 ++-
 xen/arch/riscv/include/asm/sbi.h          |  7 ---
 xen/arch/riscv/mm.c                       | 41 +++++++++++++----
 xen/arch/riscv/riscv64/Makefile           |  1 +
 xen/arch/riscv/riscv64/debug-8250.inc     | 51 +++++++++++++++++++++
 xen/arch/riscv/riscv64/debug.S            | 54 +++++++++++++++++++++++
 xen/arch/riscv/sbi.c                      |  5 ---
 11 files changed, 223 insertions(+), 46 deletions(-)
 create mode 100644 xen/arch/riscv/riscv64/debug-8250.inc
 create mode 100644 xen/arch/riscv/riscv64/debug.S

base-commit: 4c1aba82cff95ab11f7fe4af8965a06703537288
-- 
2.54.0


