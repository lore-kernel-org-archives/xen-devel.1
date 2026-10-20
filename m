Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A54606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 03:45:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1455090.1668651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ0n6-0007CZ-3f; Tue, 20 Oct 2026 03:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455090.1668651; Tue, 20 Oct 2026 03:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ0n6-0007CS-0s; Tue, 20 Oct 2026 03:45:32 +0000
Received: by outflank-mailman (input) for mailman id 1455090;
 Tue, 20 Oct 2026 03:45:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xJ0n5-0006pm-8h
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 03:45:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ0n4-00DbTG-Df
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 05:45:30 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad6e3c8-2eae-0a2a0a5409dd-0a2a4503d780-12
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 05:45:28 +0200
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad6e3d5-fae8-0a2a45030019-9fe2fb159eae-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 05:45:27 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowADXrvLN49ZqzdhHCw--.7730S4;
 Tue, 20 Oct 2026 11:45:22 +0800 (CST)
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
Subject: [PATCH v3 2/2] xen/ns16550: drain TX before reinitializing the UART
Date: Tue, 20 Oct 2026 11:45:43 +0800
Message-ID: <938aadfc32c531f934291fdff3763cdefd5849e6.1792467713.git.zhangzheng@iscas.ac.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1792467713.git.zhangzheng@iscas.ac.cn>
References: <cover.1792467713.git.zhangzheng@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADXrvLN49ZqzdhHCw--.7730S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWUKryUAw4DGryxAry7ZFb_yoW8WFWkpF
	48KwnYyrWDGa1UGaySyayxGayYqF95uFWfKrykCwnIvrs8Gw1xursxJFyYqrWDArW8Xry3
	KFsIvF4DCFWkAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPEb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
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
	UjIFyTuYvjxUqWrWDUUUU
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-33051d/1792467928-776F34E9-E988E6E9/0/0
X-purgate-type: clean
X-purgate-size: 1761
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drain pending output before resetting FIFOs. Bound the wait to avoid
hanging boot if the UART never reports empty.

Wait for TEMT (which already implies THRE on a 16550) to ensure
transmission has finished before reconfiguration. uart->lsr_mask normally
checks only THRE, which indicates room for more output.

Signed-off-by: Zhang Zheng <zhangzheng@iscas.ac.cn>
---
 xen/drivers/char/ns16550.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 1f54155d67..29f784280e 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -410,6 +410,12 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
 static void __init cf_check ns16550_init_preirq(struct serial_port *port)
 {
     struct ns16550 *uart = port->uart;
+    cycles_t start;
+    /*
+     * Too early for proper time calibration, assume a 5GHz CPU and let it wait
+     * about 1s, with still reasonable timeout on a slower CPU.
+     */
+    cycles_t timeout_ticks = 5UL * 1000 * 1000 * 1000;
 
 #ifdef CONFIG_HAS_IOPORTS
     /* I/O ports are distinguished by their size (16 bits). */
@@ -427,6 +433,15 @@ static void __init cf_check ns16550_init_preirq(struct serial_port *port)
 #endif
     }
 
+    /*
+     * Drain firmware/early-console output before changing line settings or
+     * resetting FIFOs. Wait for TEMT so the shift register is empty too.
+     */
+    start = get_cycles();
+    while ( !(ns_read_reg(uart, UART_LSR) & UART_LSR_TEMT) &&
+            get_cycles() - start < timeout_ticks )
+        cpu_relax();
+
     ns16550_setup_preirq(uart);
 
     /* Check this really is a 16550+. Otherwise we have no FIFOs. */
-- 
2.54.0


