Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3761606A332
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 15:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=knJ6SpP6
Received: from list by lists.xenproject.org with outflank-mailman.1476719.1682702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPLS7-0000gV-87; Fri, 06 Nov 2026 15:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476719.1682702; Fri, 06 Nov 2026 15:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPLS7-0000gO-5K; Fri, 06 Nov 2026 15:02:03 +0000
Received: by outflank-mailman (input) for mailman id 1476719;
 Fri, 06 Nov 2026 15:02:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b1616f85000403d@swg.vates.tech>)
 id 1xPLS6-0000gI-R8
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 15:02:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPLS6-000Nho-7s
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 16:02:02 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b1616f85000403d@swg.vates.tech>)
 id 6aedebdf-e002-0a2a0a5209dd-0a2a4503bc5e-30
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 16:02:02 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b1616f85000403d@swg.vates.tech>)
 id 6aedebe9-fae8-0a2a45030019-b9ff1c22b1d9-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 16:02:02 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1b1616f85000403d.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 06 Nov 2026 15:01:55 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1836A81169;
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
 q=dns/txt; s=selector1; bh=HcS7Wx1laP6tiPacb1Hf+gduLCdPWiMZ+f17krnHkEM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=knJ6SpP6j3iONdNvSjOUvIAUguKAi8Q4LhYYH/7O5WpqSL0J/FZBKMy9AxX668najBI98GouO
 U8H5r5gedgtsUTIOn8uh30yMtEvdvzXZPpSw8zvZpDaOPY8fsoe4daDk5gfnDoSl+rl8HXhOVPA
 U5ZMEaRpo1LMTbwmb1cRZLXixdyIfUV2NCGeIvGAOG6/0YIivhR42qOLpmZ5hc+gs5KbMZI/Thd
 fuM82dcL1O3gMeUOTw7h2/SQP7/NDE09eDQtaDnfTddm4PwBqcwwPpwUYNTAME1Y2lmHzxrH/Vm
 MB7iWiK/HfHSOS+ADERI1K/BHhNiR5u6MSaF2wVE79RA==
X-Zone-Loop: 8eaba596b66a797b3c85f384b4c698cd7dccbb67b70b
x-campaign-type: default
x-transaction-id: 9ed4ec70-ce6c-4ac4-b568-f73cf2105318
x-swg-uid: 01-70bcb356-a602-4ff3-b650-101fc9a60b71
X-Mailer: Sweego
Message-ID:
 <1793977315.8631fc262581453bbf619ec5b2062170.1a1b1616f85000403d@vates.tech>
x-swg-bid: 1793977315.8631fc262581453bbf619ec5b2062170.1a1b1616f85000403d
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
Subject: [PATCH 1/2] irq_work: Add irq_work_raise_pending()
Date: Fri,  6 Nov 2026 16:01:37 +0100
In-Reply-To: <1793977074.8631fc262581453bbf619ec5b2062170.1a1b15dc430000403d@vates.tech>
References: <1793977074.8631fc262581453bbf619ec5b2062170.1a1b15dc430000403d@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3d.696c5d20722f4023.1a1b1616d7a.7ba72b838a78e8bd=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793977314682
X-purgate-ID: tlsNG-33051d/1793977322-770F64E9-65D05C4E/0/0
X-purgate-type: clean
X-purgate-size: 2825
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.3d.696c5d20722f4023.1a1b1616d7a.7ba72b838a78e8bd=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

irq_work_queue() only raises the irq_work interrupt when the per-CPU
list transitions from empty to non-empty=2E Later queuers rely on that
interrupt to also run their work=2E

If that interrupt gets lost, nothing runs the raised list on that CPU
anymore=2E On architectures with an irq_work interrupt irq_work_tick()
skips the raised list, and further irq_work_queue() calls find the list
non-empty and don't raise the interrupt again=2E All irq_work on that CPU
is stuck=2E

This happens when irq_work is queued while the local interrupt
controller is disabled, e=2Eg=2E a self-IPI is dropped when sent while the
x86 local APIC is software-disabled=2E

Add irq_work_raise_pending(), which re-raises the irq_work interrupt if
work is pending on the current CPU=2E Code which disables the local
interrupt controller can call it once interrupts are accepted again=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 include/linux/irq_work=2Eh |  2 ++
 kernel/irq_work=2Ec        | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/irq_work=2Eh b/include/linux/irq_work=2Eh
index 7184e1273965=2E=2E712a92ead4a5 100644
--- a/include/linux/irq_work=2Eh
+++ b/include/linux/irq_work=2Eh
@@ -62,12 +62,14 @@ void irq_work_run(void);
 void irq_work_run_cpu(unsigned int cpu);
 bool irq_work_needs_cpu(void);
 void irq_work_single(void *arg);
+void irq_work_raise_pending(void);
=20
 void arch_irq_work_raise(void);
=20
 #else
 static inline bool irq_work_needs_cpu(void) { return false; }
 static inline void irq_work_run(void) { }
+static inline void irq_work_raise_pending(void) { }
 static inline void irq_work_run_cpu(unsigned int cpu) { }
 static inline void irq_work_single(void *arg) { }
 #endif
diff --git a/kernel/irq_work=2Ec b/kernel/irq_work=2Ec
index 73eabcbdcd50=2E=2E1720a07f12bf 100644
--- a/kernel/irq_work=2Ec
+++ b/kernel/irq_work=2Ec
@@ -112,6 +112,16 @@ static void __irq_work_queue_local(struct irq_work *w=
ork)
 		irq_work_raise(work);
 }
=20
+/* Re-raise the irq_work interrupt on this CPU */
+void irq_work_raise_pending(void)
+{
+	lockdep_assert_irqs_disabled();
+
+	if (!llist_empty(this_cpu_ptr(&raised_list)) ||
+	    (tick_nohz_tick_stopped() && !llist_empty(this_cpu_ptr(&lazy_list)))=
)
+		arch_irq_work_raise();
+}
+
 /* Enqueue the irq work @work on the current CPU */
 bool irq_work_queue(struct irq_work *work)
 {
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.3d.696c5d20722f4023.1a1b1616d7a.7ba72b838a78e8bd=---

