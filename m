Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE3E606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=NZQoQYB9
Received: from list by lists.xenproject.org with outflank-mailman.1476700.1682685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPLOH-0006qe-GN; Fri, 06 Nov 2026 14:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476700.1682685; Fri, 06 Nov 2026 14:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPLOH-0006qT-Cc; Fri, 06 Nov 2026 14:58:05 +0000
Received: by outflank-mailman (input) for mailman id 1476700;
 Fri, 06 Nov 2026 14:58:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b15dc430000403d@swg.vates.tech>)
 id 1xPLOF-0006qN-Tc
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 14:58:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPLOF-0041XK-5o
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 15:58:03 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b15dc430000403d@swg.vates.tech>)
 id 6aedeaf7-8faa-0a2a0a5109dd-0a2a4507c9f4-12
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 15:58:03 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b15dc430000403d@swg.vates.tech>)
 id 6aedeafa-b4ea-0a2a45070019-b9ff1c129299-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 15:58:02 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1b15dc430000403d.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 06 Nov 2026 14:57:54 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 74C7C81B6C;
 Fri,  6 Nov 2026 15:57:53 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=XdcJ4jFaa68uoYdaUyfdYZAzejo+UGLqoHgHy20wKy0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=NZQoQYB9tywpzxtacITkvDt6+ZhuR1/N9apraARH//lWtLWDwoarSlBVEiupZ6W5D+N4UgPUm
 wKgv3YRrNdYSpi9rLDdDU7HV4894WVceIc8GdHL7+fO1oBXYC+4zxWSiuiqnZuiH5yzfWk29QHP
 Y9XUvL7yHdDpZqzQWDUqVHMKgLv4PnkIkRzJZy9F9YghexQHconWcBal4uTVYrr5GaKv+4+p+Dx
 4Vj2wKOMGj4kahcctjtK3E43tZdb9HaF4mi+x4YJW2FEO4B45kLke1SsFOyLBzCznSDt7kG4h7L
 n8JVetX23Bmk1zOT/Olu8M5kS3roVx11Zpb8XG42qsQA==
X-Zone-Loop: be56381978996ca0f8f21b569ff49b840090bf24287e
x-campaign-type: default
x-transaction-id: 48a466be-985d-41ce-9fe5-2a3a3d98eb45
x-swg-uid: 01-27bb5538-8e92-4745-82dc-6ca83774d8bf
X-Mailer: Sweego
Message-ID:
 <1793977074.8631fc262581453bbf619ec5b2062170.1a1b15dc430000403d@vates.tech>
x-swg-bid: 1793977074.8631fc262581453bbf619ec5b2062170.1a1b15dc430000403d
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
Subject: [PATCH 0/2] Re-raise irq_work lost during Xen suspend
Date: Fri,  6 Nov 2026 15:57:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3b.3163fd9a7fa2d20e.1a1b15dc1a5.3017bf55e344f14b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793977074093
X-purgate-ID: tlsNG-ef75cf/1793977083-A52CCAE4-88E8566E/0/0
X-purgate-type: clean
X-purgate-size: 1675
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.3b.3163fd9a7fa2d20e.1a1b15dc1a5.3017bf55e344f14b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

We hit this issue with an Ubuntu 26=2E04 cloudimage guests (7=2E0 based
kernel with the 8250 as an nbcon console) on XCP-ng 8=2E3 / Xen 4=2E17=2E =
With
a kernel commandline adding two consoles, i=2Ee=2E, 'console=3DttyS1
console=3DttyS0'=2E During a live migration on that setup the printk()s fr=
om
gnttab_resume() and xen_irq_resume() queue nbcon_irq_work while the APIC
is disabled=2E Thus the list transitions from empty to non-empty, but
doesn't receive the IPI to empty the list again=2E Afterwards the list
stays non-empty, so the IPI never fires and all irq_work piles up=2E

The Commit 560f4deda327 ("printk/nbcon: Change nbcon_irq_work to
IRQ_WORK_LAZY") removed this particular issue because declaring the IRQ
work to be lazy, causes the timer interrupt to trigger the irq work
instead=2E But any other non-lazy irq_work queued in that window is still
lost the same way and will cause the list to fill up without being
handled=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Julian Vetter (2):
  irq_work: Add irq_work_raise_pending()
  xen/manage: Re-raise pending irq_work after suspend

 drivers/xen/manage=2Ec     |  3 +++
 include/linux/irq_work=2Eh |  2 ++
 kernel/irq_work=2Ec        | 10 ++++++++++
 3 files changed, 15 insertions(+)

--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.3b.3163fd9a7fa2d20e.1a1b15dc1a5.3017bf55e344f14b=---

