Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19166606A334
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 18:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ihgR9sv9
Received: from list by lists.xenproject.org with outflank-mailman.1501388.1697493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVvA6-0005t0-3z; Tue, 24 Nov 2026 18:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501388.1697493; Tue, 24 Nov 2026 18:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVvA5-0005sL-V1; Tue, 24 Nov 2026 18:22:37 +0000
Received: by outflank-mailman (input) for mailman id 1501388;
 Tue, 24 Nov 2026 17:32:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <rnunez@baylibre.com>) id 1xVuN7-00051a-7r
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:32:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVuN6-004J7s-Kc
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 18:32:00 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <rnunez@baylibre.com>)
 id 6b05ca04-bab6-0a2a0a5309dd-0a2a450ccea6-30
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 18:32:00 +0100
Received: from [209.85.160.178] (helo=mail-qt1-f178.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <rnunez@baylibre.com>)
 id 6b05ca0f-f479-0a2a450c0019-d155a0b2a465-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 18:32:00 +0100
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-53639b8903bso58493131cf.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 09:32:00 -0800 (PST)
Received: from [127.0.0.1] ([2804:7f0:7543:4532:5471:ddc9:4fc9:5])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5ee8b6641d6sm14760703e0c.17.2026.11.24.09.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 09:31:47 -0800 (PST)
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
        d=baylibre.com; s=google; t=1795541519; x=1796146319; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sWRLgfQRkqBL4w9rJ+jG6ILf7KQHCHvGFt9ZwCqlp9g=;
        b=ihgR9sv9uk5lWyOUcf7JWvHcrMIESYvNvUnHuxRjv85/Pn4jAYN1IqzHfPDhcVq02t
         1dkV+qVXpZ92M0MjyK1AbRh5o8Vq+e7B7SQ/aPaCRPsWIW81geMtu1PzrwDXDUFQgNe3
         YvfSVtJI/JVrO2y+GZyNuFVhTb8SJEcddB/3tVS6+gKMwSxKihWO6ekfvfIf+vT7JjE7
         TwlFWccDYTjo8dEcy6T/A6TxvPVQIl2ZMq77A+Xg0HipSkj0+GC5TVG/7+0IjSpJ8LTe
         Nhd8W2vNJljrTx2pecJBCcRn7gzReam4L1UC8UKbDoTDGBW2Gnpe5HK8OchbCTR/d/NU
         P7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541519; x=1796146319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sWRLgfQRkqBL4w9rJ+jG6ILf7KQHCHvGFt9ZwCqlp9g=;
        b=mcUb52x09hEKv8sOERf8opWILTEK99C/PdPFzGiF8sGjveN6OThza690fQhauzT/vT
         g7DmfEMHhcQLe/vmNqhkz7YValbXb5pDDvyuka58Kusqeos2mxmK2uuDWVcl7lodeBmN
         GIHsbPz01nU8gODeGFZm7mTVSoz57MmMNkG2cfKxJTbZazsIKAOoyKG5KM8s7mGdhNGP
         +DDaJMJUilbArUAKuJcxIOpUDvhk4L/CM5oSYoQrTWDzeD8Lm6/nG3PPbYuH39RpDrxP
         KxdX8ShgYFelQJfm4iKBKfmn0DWxf8vP6BlpxCulaUcERekqufHUTmH3ugrazXoMaabu
         qJFw==
X-Gm-Message-State: APuU4Z8mWNoyU/vseHNV35ufhdhfvKt0J0jpgU+msSfN1FIUYjWn1OrI
	lZIfvg1Feu/Tfo3WjVNzv/2Tsuz6Qyvy1bbOoJSbx/V0PxWlshLivZ6YPjr0c7xSAt+IdIgTnGu
	2uY6vP64=
X-Gm-Gg: AZFdTZchYj7LxGSuR8l3y0ydoMW7w2S9dh95SMeMNi+6v6QIqNfCb9GvIUlrBROoiFK
	9cuRxpI6/z4knlc/PKeMwCfalLeoTlx6yo5kMdyNAoxy1is2WdPTOcIT7eE+I1HKv+xnZBtzm/e
	glh8JI9b3oc0O3+Rp4AokUddEK1TPcrMShNpW+BaM2OSCEgWfAKqZxkS05hmzFSmg1AhMmM94Cb
	dcdA4oHThU/u4MCVTVKkCpaGmrs/vQryAs7ws8f3f6fpHbYL4CPQG25oMqUWUz7Dy2zpj6mJn5/
	Hl+N2yL/ERMJs2McLTE5YJQ2V4GlJZeC71mczYJZyqEzP8Uh4x5bbshplHYguGw49EBALBum4Np
	2bguPNK2SGO7uM+INlsppstNSBHutOWwS8WF4MynJGiGoanlnMwpBZeO+NfuC4DvUldTZRo5Ov3
	uajFO9NVSciiZ/zkj3nde6YvENCJiDGEDKyIzNHSKhCEPnOitxxe0tviP9L56f1u1CPEhi4WsqG
	6Zw7tjOtJ5zzQeTn7kh0JKyfe3m3B3zG5xnvGMcFkd5T12BFuU0PgOfiiFPu11yl/a3xkcLV1Ih
	khj+j/nAZatyj7zPb2+z/xmfFw==
X-Received: by 2002:a05:6122:4681:b0:5e9:6d96:a7cc with SMTP id 71dfb90a1353d-5ee8af52ee6mr5666070e0c.9.1795541507974;
        Tue, 24 Nov 2026 09:31:47 -0800 (PST)
From: Ronaldo Nunez <rnunez@baylibre.com>
Date: Tue, 24 Nov 2026 14:30:55 -0300
Subject: [PATCH v4 2/2] xen/ns16550: drain TX before reinitializing UART
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-v4-uart-harndover-v4-2-90c4412cb95e@baylibre.com>
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
X-purgate-ID: tlsNG-d25034/1795541520-018C5A5B-8DD06CB0/0/0
X-purgate-type: clean
X-purgate-size: 1981
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhang Zheng <zhangzheng@iscas.ac.cn>

Drain pending output before resetting FIFOs. Bound the wait to avoid
hanging boot if the UART never reports empty.

Wait for TEMT (which already implies THRE on a 16550) to ensure
transmission has finished before reconfiguration. uart->lsr_mask normally
checks only THRE, which indicates room for more output.

Signed-off-by: Zhang Zheng <zhangzheng@iscas.ac.cn>
Co-developed-by: Ronaldo Nunez <rnunez@baylibre.com>
Signed-off-by: Ronaldo Nunez <rnunez@baylibre.com>
---
 xen/drivers/char/ns16550.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 01a55d2737d18b1985ba10488e98ac82ef8a9c8c..6ac5e7c97c446ef2fe8122bc4ed4f368072450ed 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -411,6 +411,12 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
 static void __init cf_check ns16550_init_preirq(struct serial_port *port)
 {
     struct ns16550 *uart = port->uart;
+    cycles_t start;
+    /*
+     * Assume system time counters (CSR for RISC-V and CNTPCT for ARM) running
+     * at 50MHz and waits for 50 million ticks (~1-5s on typical hardware).
+     */
+    cycles_t timeout_ticks = 50ULL * 1000 * 1000;
 
 #ifdef CONFIG_HAS_IOPORTS
     /* I/O ports are distinguished by their size (16 bits). */
@@ -428,6 +434,15 @@ static void __init cf_check ns16550_init_preirq(struct serial_port *port)
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
2.53.0


