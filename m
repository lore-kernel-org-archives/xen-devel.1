Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA05606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 03:45:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1455088.1668633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ0n4-0006nr-Mu; Tue, 20 Oct 2026 03:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455088.1668633; Tue, 20 Oct 2026 03:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ0n4-0006nk-K4; Tue, 20 Oct 2026 03:45:30 +0000
Received: by outflank-mailman (input) for mailman id 1455088;
 Tue, 20 Oct 2026 03:45:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xJ0n3-0006nZ-5s
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 03:45:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ0n2-00BZmn-Ff
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 05:45:28 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad6e3ca-bab6-0a2a0a5309dd-0a2a450abe5c-10
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 05:45:27 +0200
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad6e3d4-f2d2-0a2a450a0019-9fe2fb15a8cc-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 05:45:26 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowADXrvLN49ZqzdhHCw--.7730S3;
 Tue, 20 Oct 2026 11:45:20 +0800 (CST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Zhang Zheng <zhangzheng@iscas.ac.cn>
To: xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
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
Subject: [PATCH v3 1/2] xen/ns16550: identify XScale UARTs from device tree
Date: Tue, 20 Oct 2026 11:45:42 +0800
Message-ID: <3e8fac86f88d9d3d002b86469b87c20aea53fcef.1792467713.git.zhangzheng@iscas.ac.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1792467713.git.zhangzheng@iscas.ac.cn>
References: <cover.1792467713.git.zhangzheng@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADXrvLN49ZqzdhHCw--.7730S3
X-Coremail-Antispam: 1UD129KBjvJXoW3GF4UKF13Cw18Aw4Dtry3XFb_yoW7Gry3pF
	WxK3ZYyrWxtw18G3sIyF47Wa1Fgwn3u34Skrs3G393XF1UtrW8CFy5AF98JryDCrykJFyY
	kFZYyrWUCan8Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPEb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv
	6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
	Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjxUyVyIUUUUU
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-4011c0/1792467927-512C8CFC-7CEF4191/0/0
X-purgate-type: clean
X-purgate-size: 5393
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Identify XScale UARTs using intel,xscale-uart, since IER bit 6 has other
meanings on some UART variants. Keep UUE set when writing IER so the
UART stays enabled when switching to polling, and enable RTOIE along
with receive interrupts.

Signed-off-by: Zhang Zheng <zhangzheng@iscas.ac.cn>
---
 xen/drivers/char/ns16550.c  | 29 +++++++++++++++++++++--------
 xen/include/xen/8250-uart.h |  2 ++
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index be388c8e65..1f54155d67 100644
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
@@ -168,6 +169,14 @@ static void ns_write_reg(const struct ns16550 *uart, unsigned int reg, u8 c)
     }
 }
 
+static void ns_write_ier(const struct ns16550 *uart, u8 ier)
+{
+    if ( uart->xscale )
+        ier |= UART_IER_UUE;
+
+    ns_write_reg(uart, UART_IER, ier);
+}
+
 static int ns16550_ioport_invalid(struct ns16550 *uart)
 {
     return ns_read_reg(uart, UART_IER) == 0xff;
@@ -218,7 +227,7 @@ static void cf_check ns16550_interrupt(int irq, void *dev_id)
 
             /* Disable interrupt generation on the device and arm the timer. */
             uart->force_polling = true;
-            ns_write_reg(uart, UART_IER, 0);
+            ns_write_ier(uart, 0);
             set_timer(&uart->timer, now + MILLISECS(uart->timeout_ms));
             printk(XENLOG_WARNING
                    "uart interrupt taking more than %ums, switched to polling\n",
@@ -350,7 +359,7 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
     lcr = (uart->data_bits - 5) | ((uart->stop_bits - 1) << 2) | uart->parity;
 
     /* No interrupts. */
-    ns_write_reg(uart, UART_IER, 0);
+    ns_write_ier(uart, 0);
 
     /* Handle the DesignWare 8250 'busy-detect' quirk. */
     handle_dw_usr_busy_quirk(uart);
@@ -446,7 +455,8 @@ static void ns16550_setup_postirq(struct ns16550 *uart)
                      UART_MCR, UART_MCR_OUT2 | UART_MCR_DTR | UART_MCR_RTS);
 
         /* Enable receive interrupts. */
-        ns_write_reg(uart, UART_IER, UART_IER_ERDAI);
+        ns_write_ier(uart, UART_IER_ERDAI |
+                     (uart->xscale ? UART_IER_RTOIE : 0));
     }
 
     if ( uart->irq >= 0 )
@@ -654,7 +664,7 @@ static void cf_check ns16550_start_tx(struct serial_port *port)
 
     /* Unmask transmit holding register empty interrupt if currently masked. */
     if ( !(ier & UART_IER_ETHREI) )
-        ns_write_reg(uart, UART_IER, ier | UART_IER_ETHREI);
+        ns_write_ier(uart, ier | UART_IER_ETHREI);
 }
 
 static void cf_check ns16550_stop_tx(struct serial_port *port)
@@ -664,7 +674,7 @@ static void cf_check ns16550_stop_tx(struct serial_port *port)
 
     /* Mask off transmit holding register empty interrupt if currently unmasked. */
     if ( ier & UART_IER_ETHREI )
-        ns_write_reg(uart, UART_IER, ier & ~UART_IER_ETHREI);
+        ns_write_ier(uart, ier & ~UART_IER_ETHREI);
 }
 
 #ifdef CONFIG_ARM
@@ -749,16 +759,16 @@ static int __init check_existence(struct ns16550 *uart)
      * there's no point trying anything else.
      */
     scratch = ns_read_reg(uart, UART_IER);
-    ns_write_reg(uart, UART_IER, 0);
+    ns_write_ier(uart, 0);
 
     /*
      * Mask out IER[7:4] bits for test as some UARTs (e.g. TL
      * 16C754B) allow only to modify them if an EFR bit is set.
      */
     scratch2 = ns_read_reg(uart, UART_IER) & 0x0f;
-    ns_write_reg(uart,UART_IER, 0x0F);
+    ns_write_ier(uart, 0x0f);
     scratch3 = ns_read_reg(uart, UART_IER) & 0x0f;
-    ns_write_reg(uart, UART_IER, scratch);
+    ns_write_ier(uart, scratch);
     if ( (scratch2 != 0) || (scratch3 != 0x0F) )
         return 0;
 
@@ -2034,6 +2044,8 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
 
     uart->dw_usr_bsy = dt_device_is_compatible(dev, "snps,dw-apb-uart");
 
+    uart->xscale = dt_device_is_compatible(dev, "intel,xscale-uart");
+
 #ifdef CONFIG_ARM
     uart->vuart.base_addr = uart->io_base;
     uart->vuart.size = uart->io_size;
@@ -2055,6 +2067,7 @@ static const struct dt_device_match ns16550_dt_match[] __initconst =
     DT_MATCH_COMPATIBLE("ns16550"),
     DT_MATCH_COMPATIBLE("ns16550a"),
     DT_MATCH_COMPATIBLE("snps,dw-apb-uart"),
+    DT_MATCH_COMPATIBLE("intel,xscale-uart"),
     DT_MATCH_COMPATIBLE("brcm,bcm2835-aux-uart"),
     { /* sentinel */ },
 };
diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
index d13352940c..5709a6c91b 100644
--- a/xen/include/xen/8250-uart.h
+++ b/xen/include/xen/8250-uart.h
@@ -42,6 +42,8 @@
 #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
 #define UART_IER_ELSI     0x04    /* rx line status       */
 #define UART_IER_EMSI     0x08    /* MODEM status         */
+#define UART_IER_RTOIE    0x10    /* Receive timeout interrupt enable (XScale) */
+#define UART_IER_UUE      0x40    /* UART unit enable (XScale) */
 
 /* Interrupt Identification Register */
 #define UART_IIR_NOINT    0x01    /* no interrupt pending */
-- 
2.54.0


