Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FECCA6004
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 03:14:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444825.1661409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFNX4-0007iY-Uu; Sat, 10 Oct 2026 03:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444825.1661409; Sat, 10 Oct 2026 03:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFNX4-0007iO-Qo; Sat, 10 Oct 2026 03:13:58 +0000
Received: by outflank-mailman (input) for mailman id 1444825;
 Sat, 10 Oct 2026 03:13:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xFNX3-0007ew-PD
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 03:13:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFNX3-0001Y0-6T
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 05:13:57 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ac9ad71-e002-0a2a0a5209dd-0a2a4503dc34-2
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 05:13:55 +0200
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ac9ad70-fae8-0a2a45030019-9fe2fb15c5f4-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 05:13:54 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowACXa+9prclqNfdpCg--.21498S3;
 Sat, 10 Oct 2026 11:13:47 +0800 (CST)
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
Subject: [PATCH v2 1/2] xen/ns16550: detect and preserve UART_IER_UUE
Date: Sat, 10 Oct 2026 11:14:05 +0800
Message-ID: <20261010031406.2057735-2-zhangzheng@iscas.ac.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACXa+9prclqNfdpCg--.21498S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uFWxGry7Jry3CFW7Kw18Grg_yoW8uw17pF
	WxKFnYyrWDtr10kr9Iq3Wjga1xWas3X34FkrZ3u39xXr1kJw40kF4UJF17Xr4kur4ktr4U
	uFs2yrWUAF98Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7VUjhFxUUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-33051d/1791602035-778C54E9-F3C38F06/0/0
X-purgate-type: clean
X-purgate-size: 2347

XScale-compatible UARTs require UART_IER_UUE to remain set.  Probe the
bit during setup and preserve it when enabling receive interrupts, so
the xscale/PXA UART remains operational after ns16550 takes over.

Signed-off-by: Zhang Zheng <zhangzheng@iscas.ac.cn>
---
 xen/drivers/char/ns16550.c  | 12 +++++++++++-
 xen/include/xen/8250-uart.h |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index cdda28879e..c174465059 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -64,6 +64,7 @@ static struct ns16550 {
     bool intr_works;
     bool force_polling;
     bool dw_usr_bsy;
+    bool xscale;
 #ifdef NS16550_PCI
     /* PCI card parameters. */
     bool pb_bdf_enable;     /* if =1, pb-bdf effective, port behind bridge */
@@ -352,6 +353,14 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
     /* No interrupts. */
     ns_write_reg(uart, UART_IER, 0);
 
+    uart->xscale = false;
+    if ( !(ns_read_reg(uart, UART_IER) & UART_IER_UUE) )
+    {
+        ns_write_reg(uart, UART_IER, UART_IER_UUE);
+        if ( ns_read_reg(uart, UART_IER) & UART_IER_UUE )
+            uart->xscale = true;
+    }
+
     /* Handle the DesignWare 8250 'busy-detect' quirk. */
     handle_dw_usr_busy_quirk(uart);
 
@@ -446,7 +455,8 @@ static void ns16550_setup_postirq(struct ns16550 *uart)
                      UART_MCR, UART_MCR_OUT2 | UART_MCR_DTR | UART_MCR_RTS);
 
         /* Enable receive interrupts. */
-        ns_write_reg(uart, UART_IER, UART_IER_ERDAI);
+        ns_write_reg(uart, UART_IER,
+                     UART_IER_ERDAI | (uart->xscale ? UART_IER_UUE : 0));
     }
 
     if ( uart->irq >= 0 )
diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
index d13352940c..358d264698 100644
--- a/xen/include/xen/8250-uart.h
+++ b/xen/include/xen/8250-uart.h
@@ -42,6 +42,7 @@
 #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
 #define UART_IER_ELSI     0x04    /* rx line status       */
 #define UART_IER_EMSI     0x08    /* MODEM status         */
+#define UART_IER_UUE      0x40    /* UART unit enable (XScale/PXA) */
 
 /* Interrupt Identification Register */
 #define UART_IIR_NOINT    0x01    /* no interrupt pending */
-- 
2.54.0


