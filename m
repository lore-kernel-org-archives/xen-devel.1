Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58276606A33D
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 18:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=G00D1RLZ
Received: from list by lists.xenproject.org with outflank-mailman.1501386.1697488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVvA5-0005p0-VT; Tue, 24 Nov 2026 18:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501386.1697488; Tue, 24 Nov 2026 18:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVvA5-0005nt-Nh; Tue, 24 Nov 2026 18:22:37 +0000
Received: by outflank-mailman (input) for mailman id 1501386;
 Tue, 24 Nov 2026 17:31:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <rnunez@baylibre.com>) id 1xVuMs-00050i-US
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:31:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVuMs-004J4Q-Ap
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 18:31:46 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <rnunez@baylibre.com>)
 id 6b05c9f2-bab6-0a2a0a5309dd-0a2a4504e6cc-42
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 18:31:46 +0100
Received: from [209.85.222.42] (helo=mail-ua1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <rnunez@baylibre.com>)
 id 6b05ca01-b57f-0a2a45040019-d155de2abca8-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 18:31:46 +0100
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-9905d61449cso1286184241.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 09:31:45 -0800 (PST)
Received: from [127.0.0.1] ([2804:7f0:7543:4532:5471:ddc9:4fc9:5])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5ee8b6641d6sm14760703e0c.17.2026.11.24.09.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 09:31:44 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=baylibre.com header.i="@baylibre.com" header.h="Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795541505; x=1796146305; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GkLo8KNHatVyEzmy+WAcfcbrVOPUa6Auy0tec9083fg=;
        b=G00D1RLZrL/kjIGtkgNidzItDbfK2pJcncU2p1wZufXBltsxpsfo23XxWsCoQ1az9N
         ZL56k7vRFdDC50gKS4ngFQicTlMuiTKCmuzcSVRjgJ/RQQ4zhiPYufuE+sdQgXDGioti
         qAi0fuOEMVUaB7uzBf2lVLdPCvVHRJGxc/BBzkec9LMpI29bTFmrM57/Dj9+HhY269oK
         GVPvRs/HOAQJ5UnruStkm5Mflera8omDDk0AMq9UZmvvCqHELiA27XfwdROXa9Fv4MX+
         WIMqj02Jr7IVnMjo9HeS3BwQ4wsuVitWMfGzylG/9uF1GGFwZ/NrKpLjGc64S7Q1E3N3
         1DwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541505; x=1796146305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkLo8KNHatVyEzmy+WAcfcbrVOPUa6Auy0tec9083fg=;
        b=UvEk+01Oc11DPknRIUS6MkQ7sNh5loB9cib5SuVExfi0cb3ms9bypvM0AQz3TvuhYs
         33T+6FMJ0w4i3hvkNJYcHyXCJlk12gjpjubcWJc+ycFwVNx/KTxte7fIOnZlWyBStENC
         e/wlF+Qhs0O2H1RxF6wGFX6YdlBLGVZnYMG9u2PACX39nB5FTlsIVoZTsFl+Z2faPkQY
         /0QbOOSJsSpcnFAO8V16WKpv5GX1reu2uEMtvYVFqOkXNwdtA02abhzKIUvZRyGoUVG9
         vU86ca2/afuAv0vvjDQDOUTJsNgmk5E2SkB6LPUEbDfrBgOUedrA/msj8aF7M6fRLOrT
         7LRA==
X-Gm-Message-State: APuU4Z/nRFF9WYXO4hVYJMOkCv4TkV+ZShArc0O8juu1ErF5wdEQJMWI
	RqE2SbDfNQ5m+LAs8OjB2cyju9mvq8+5yMi7OxUWrptv+adSvS/8P0HnT9esdEghViY=
X-Gm-Gg: AZFdTZdFuIcRdTvcyFDuxztx2GyAuYK1TyeVN6oNIc1A6z+cUhbfmGR2BVYtqJEFqpA
	BrZcSw3YRX/zpfxOxEHATbhnNL1eGvWDRf87A5TSNfkdcgC89phZesSNWyfw0cYSbdNfepz2e2U
	7H8DtMUSJfZVqz2BfQEHUYEkWM8v5nRIB0dY50jCX4iZhjOZLj7U8ESnJCiRJJJA5aONpBF6vH0
	3mWmudKqB08IE2tHosBaFfV5Jh1tRwBmEhrl5tbJOaq3XkGk00iEc9BM5YfuoLpRqMGrGHueSAV
	CmBHcphh+7eqtp5tyyesdYuWz41inYqg3x2X0Oz54H9pTTi7JasevAuClpfOTbEgPrny03xeoey
	d9gMdRV+9L4pM8f5WNro5VYdZxJgUAotyNlhvYZJzJBT1ZVz7+nD4yUs+Cn2tlmAu7erSc8rxQQ
	gT45M0fNm0ObQFe+tlYo1anYeOer35NS6NxlD5BNn4xMSYMZn2JOHmXOZnXpojWwHEgylnjNpHz
	aPTrSNMRHH+QJYN38OJP4YBFJa5ay0rAVuh9HszLCEcLS1QZEk7WRsNkKKkujETyyhATFJjqrjR
	rTcY2LOuzNpN3A8SESWizGw1bg==
X-Received: by 2002:a05:6122:488e:b0:5ec:2c33:f782 with SMTP id 71dfb90a1353d-5ee8af71019mr8362715e0c.22.1795541504703;
        Tue, 24 Nov 2026 09:31:44 -0800 (PST)
From: Ronaldo Nunez <rnunez@baylibre.com>
Date: Tue, 24 Nov 2026 14:30:54 -0300
Subject: [PATCH v4 1/2] xen/ns16550: preserve XScale UUE bit in IER writes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-v4-uart-harndover-v4-1-90c4412cb95e@baylibre.com>
References: <20261124-v4-uart-harndover-v4-0-90c4412cb95e@baylibre.com>
In-Reply-To: <20261124-v4-uart-harndover-v4-0-90c4412cb95e@baylibre.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Zhang Zheng <zhangzheng@iscas.ac.cn>, Ronaldo Nunez <rnunez@baylibre.com>
X-Mailer: b4 0.14.2
X-purgate-ID: tlsNG-ebf023/1795541506-536C2B50-0283CB20/0/0
X-purgate-type: clean
X-purgate-size: 5188
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhang Zheng <zhangzheng@iscas.ac.cn>

XScale-like UARTs are enabled by setting UART unit enable (UUE) bit
in the IER register. Clearing IER to mask interrupts therefore also
disables the UART, breaking both interrupt-driven and polled operation,
and prevents Xen from taking control of the UART from the SBI (RISC-V
IP variants).

Introduce ns_write_ier() to set UART_IER_UUE whenever the port is
flagged as an XScale device, and route all XScale-related IER writes
through it. The flag is determined by matching "intel,xscale-uart", and
that compatible is added to the DT match table so such UARTs are probed.

Signed-off-by: Zhang Zheng <zhangzheng@iscas.ac.cn>
Co-developed-by: Ronaldo Nunez <rnunez@baylibre.com>
Signed-off-by: Ronaldo Nunez <rnunez@baylibre.com>
---
 xen/drivers/char/ns16550.c  | 23 ++++++++++++++++++-----
 xen/include/xen/8250-uart.h |  1 +
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index be388c8e6582ec7f28a5926baae2c397fc984e77..01a55d2737d18b1985ba10488e98ac82ef8a9c8c 100644
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
@@ -168,6 +169,15 @@ static void ns_write_reg(const struct ns16550 *uart, unsigned int reg, u8 c)
     }
 }
 
+static void ns_write_ier(const struct ns16550 *uart, u8 ier)
+{
+    /* XScale-like UART IP depends on the UUE bit being set */
+    if ( uart->xscale )
+        ier |= UART_IER_UUE;
+
+    ns_write_reg(uart, UART_IER, ier);
+}
+
 static int ns16550_ioport_invalid(struct ns16550 *uart)
 {
     return ns_read_reg(uart, UART_IER) == 0xff;
@@ -218,7 +228,7 @@ static void cf_check ns16550_interrupt(int irq, void *dev_id)
 
             /* Disable interrupt generation on the device and arm the timer. */
             uart->force_polling = true;
-            ns_write_reg(uart, UART_IER, 0);
+            ns_write_ier(uart, 0);
             set_timer(&uart->timer, now + MILLISECS(uart->timeout_ms));
             printk(XENLOG_WARNING
                    "uart interrupt taking more than %ums, switched to polling\n",
@@ -350,7 +360,7 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
     lcr = (uart->data_bits - 5) | ((uart->stop_bits - 1) << 2) | uart->parity;
 
     /* No interrupts. */
-    ns_write_reg(uart, UART_IER, 0);
+    ns_write_ier(uart, 0);
 
     /* Handle the DesignWare 8250 'busy-detect' quirk. */
     handle_dw_usr_busy_quirk(uart);
@@ -446,7 +456,7 @@ static void ns16550_setup_postirq(struct ns16550 *uart)
                      UART_MCR, UART_MCR_OUT2 | UART_MCR_DTR | UART_MCR_RTS);
 
         /* Enable receive interrupts. */
-        ns_write_reg(uart, UART_IER, UART_IER_ERDAI);
+        ns_write_ier(uart, UART_IER_ERDAI);
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
index d13352940c13c50bac17d4cdf2f3bf584380776a..a9b567cb2e0cf00dc4804251824e07a00ea9e022 100644
--- a/xen/include/xen/8250-uart.h
+++ b/xen/include/xen/8250-uart.h
@@ -42,6 +42,7 @@
 #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
 #define UART_IER_ELSI     0x04    /* rx line status       */
 #define UART_IER_EMSI     0x08    /* MODEM status         */
+#define UART_IER_UUE      0x40    /* UART unit enable (XScale) */
 
 /* Interrupt Identification Register */
 #define UART_IIR_NOINT    0x01    /* no interrupt pending */

-- 
2.53.0


