Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92794606D83B
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=j1qYmRoV
Received: from list by lists.xenproject.org with outflank-mailman.1476720.1682712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPLSF-0000th-Fb; Fri, 06 Nov 2026 15:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476720.1682712; Fri, 06 Nov 2026 15:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPLSF-0000ta-Ce; Fri, 06 Nov 2026 15:02:11 +0000
Received: by outflank-mailman (input) for mailman id 1476720;
 Fri, 06 Nov 2026 15:02:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b161726c000403d@swg.vates.tech>)
 id 1xPLSE-0000tC-1F
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 15:02:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPLSD-000Nho-CP
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 16:02:09 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b161726c000403d@swg.vates.tech>)
 id 6aedebf1-e002-0a2a0a5209dd-0a2a4501d8f0-0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 16:02:09 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b161726c000403d@swg.vates.tech>)
 id 6aedebf0-5984-0a2a45010019-b9ff1c23b6af-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 16:02:09 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1b161726c000403d.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 06 Nov 2026 15:01:55 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id E6ED081A63;
 Fri,  6 Nov 2026 16:01:54 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=wHHvi3hBR4r+9APsqtUvDD87Ym1BNhY3X703ylm8Qyw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=j1qYmRoV8gTjKVD2zGfnYtkSPKWdpHSSVTrMSLKoukGnuOWYqJR+wAopGSmVRths4Y46SvTwx
 eMZ8OqNUvQFNbvGyU3NET0jM9A/1AAWuQ3LaRa8efWJAnISqz6whRjqzZ6R3UlgHJ9Jk4wHm2eO
 qGmvSqPGpnQTJkCAsS+Mi840Mq8oHSEvPVEdpcETJ+gSZuDQ+FHaQaxcfBJtkcPUnrGRI+Qb2Gc
 M/urp2+jgxc2P0LXZR/T6viI+G8b+2SH8CnAsQenWtVGwWOORkDMHeJvZGjhmP580fwQo/xzUu7
 bfsb6IUbNqYGW29PnVQzwG4YlEpJdTKy+USUGKuOT0Yw==
X-Zone-Loop: 421a4d0a402fe47186c6b38243650f29e1e461c3535f
x-campaign-type: default
x-transaction-id: 32875009-4875-4d3c-9d00-34efde578f7a
x-swg-uid: 01-2b6e033f-775e-4059-9040-9249c2aed5a3
X-Mailer: Sweego
Message-ID:
 <1793977316.8631fc262581453bbf619ec5b2062170.1a1b161726c000403d@vates.tech>
x-swg-bid: 1793977316.8631fc262581453bbf619ec5b2062170.1a1b161726c000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	"Vineeth Pillai (Google)" <vineeth@bitbyteword.org>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH 2/2] xen/manage: Re-raise pending irq_work after suspend
Date: Fri,  6 Nov 2026 16:01:38 +0100
In-Reply-To: <1793977074.8631fc262581453bbf619ec5b2062170.1a1b15dc430000403d@vates.tech>
References: <1793977074.8631fc262581453bbf619ec5b2062170.1a1b15dc430000403d@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3e.4ed4c3bce91e9c03.1a1b16170c2.c742e2ef938736bc=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793977315523
X-purgate-ID: tlsNG-d62444/1793977329-BE664757-78A7B694/0/0
X-purgate-type: clean
X-purgate-size: 1846
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.3e.4ed4c3bce91e9c03.1a1b16170c2.c742e2ef938736bc=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

xen_suspend() calls syscore_suspend(), which on x86 disables the APIC,
and only re-enables it in syscore_resume()=2E But, in between,
gnttab_resume() and xen_irq_resume() call printk()=2E

With an nbcon console, e=2Eg=2E the 8250, printk() queues irq_work, which
sends a self-IPI=2E As the APIC is disabled, the IPI is dropped=2E The
irq_work stays on the raised list, and no later irq_work_queue() on that
CPU raises the IPI again=2E All irq_work on that CPU is dead after resume=
=2E

Commit 560f4deda327 ("printk/nbcon: Change nbcon_irq_work to
IRQ_WORK_LAZY") removed this particular issue, but any other non-lazy
irq_work queued in this window would cause the irq_work to stall in the
same way=2E

To fix the issue, re-raise pending irq_work once syscore_resume() has
re-enabled the APIC=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 drivers/xen/manage=2Ec | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/xen/manage=2Ec b/drivers/xen/manage=2Ec
index 05d7de128e71=2E=2E5054fcb25337 100644
--- a/drivers/xen/manage=2Ec
+++ b/drivers/xen/manage=2Ec
@@ -13,6 +13,7 @@
 #include <linux/stop_machine=2Eh>
 #include <linux/suspend=2Eh>
 #include <linux/freezer=2Eh>
+#include <linux/irq_work=2Eh>
 #include <linux/syscore_ops=2Eh>
 #include <linux/export=2Eh>
=20
@@ -86,6 +87,8 @@ static int xen_suspend(void *data)
=20
 	syscore_resume();
=20
+	irq_work_raise_pending();
+
 	return 0;
 }
=20
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.3e.4ed4c3bce91e9c03.1a1b16170c2.c742e2ef938736bc=---

