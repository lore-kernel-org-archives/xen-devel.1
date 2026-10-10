Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C4ECA6017
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 03:14:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444824.1661399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFNX2-0007W8-PX; Sat, 10 Oct 2026 03:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444824.1661399; Sat, 10 Oct 2026 03:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFNX2-0007W0-KW; Sat, 10 Oct 2026 03:13:56 +0000
Received: by outflank-mailman (input) for mailman id 1444824;
 Sat, 10 Oct 2026 03:13:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xFNX1-0007Vu-O6
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 03:13:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFNX0-0001Wg-JB
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 05:13:54 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ac9ad31-8faa-0a2a0a5109dd-0a2a4506cc7e-14
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 05:13:53 +0200
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ac9ad6e-195a-0a2a45060019-9fe2fb158db6-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 05:13:52 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowACXa+9prclqNfdpCg--.21498S2;
 Sat, 10 Oct 2026 11:13:46 +0800 (CST)
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
Subject: [PATCH v2 0/2] xen/ns16550: preserve UART operation across firmware handover
Date: Sat, 10 Oct 2026 11:14:04 +0800
Message-ID: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACXa+9prclqNfdpCg--.21498S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtryUZF1DKF45trykJw1kXwb_yoWkCrX_uw
	4vkrWDGryDGFs8AF98tF4UCFZ5CrW5Wrn2vay0qF1ayw10yrs3uFW5Gry5Zrn8C3yqyF1k
	CFyYyrWSq3929jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUba8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VU11rW7UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-16d1c6/1791602033-F7ACA77B-CFA12F4F/0/0
X-purgate-type: clean
X-purgate-size: 1156

V1 replaced the RISC-V SBI early console with direct 8250 MMIO access.
Following review, v2 keeps the generic SBI console and instead fixes the
handover in ns16550.

K3 testing exposed two issues during this handover: clearing IER disables
its XScale-compatible UART, and resetting the FIFO can discard output
still pending after an SBI console call.  I originally planned to submit
the XScale support separately, but both fixes are needed for the same
handover, so they are included here as two patches.

Tested with QEMU 11.0.0/OpenSBI 1.7 and on SpacemiT K3 hardware.

Changes in v2:
  - Keep the SBI early console and legacy SBI v0.1 support.
  - Preserve UART_IER_UUE and drain TX before ns16550 reinitialization.

v1: https://lore.kernel.org/xen-devel/20260928023857.1030884-1-zhangzheng@iscas.ac.cn/

Zhang Zheng (2):
  xen/ns16550: detect and preserve UART_IER_UUE
  xen/ns16550: drain TX before reinitializing

 xen/drivers/char/ns16550.c  | 16 +++++++++++++++-
 xen/include/xen/8250-uart.h |  1 +
 2 files changed, 16 insertions(+), 1 deletion(-)


base-commit: 0d3bb3c98bc99ec1c84ebb3df71b6e18daebff4f
-- 
2.54.0


