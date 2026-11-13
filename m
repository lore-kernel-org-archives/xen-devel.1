Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98176606A330
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JbrDhJuy
Received: from list by lists.xenproject.org with outflank-mailman.1487721.1690012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWi-0002H9-MC; Fri, 13 Nov 2026 15:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487721.1690012; Fri, 13 Nov 2026 15:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWi-0002GG-HC; Fri, 13 Nov 2026 15:49:20 +0000
Received: by outflank-mailman (input) for mailman id 1487721;
 Fri, 13 Nov 2026 15:49:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWg-0001zw-SM
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWg-00AqPc-9H
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:18 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7316d-bab6-0a2a0a5309dd-0a2a4509c10a-30
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:18 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7317e-be1a-0a2a45090019-d155dd2cd0e8-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:18 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso1548880f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:18 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:16 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584958; x=1795189758; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EI8Ol9JSwzLX5do+5u17y7XlhvIzj8td+kbOlzgS1nA=;
        b=JbrDhJuy59bNjF9alp3zyVB0JlF1Emy5bWQ3aanfVCMahsUmxuwl9Yh3fJszUi73qH
         hPyeIQvGKYt+utwz1OozO+omJPB0uiIWeC1oPBWCAIeAm+ly7JO8t4bOMmAapOXTuH+c
         7PuANnOWrdbXTrmn/u8DDvx/wX6Ac27mnmRECLbNA7GK7X+36D2EfyTtf1qMDGWDF2fe
         g0HUCFN3cuVrwS6CSWs3pYf6SXMfRHlK4eERB6oi4Cycxthc5zqBjuphv68AjYWpxQeT
         SrUFwAA6wiUHXbmMPTKGWvMpFyJ08tTLS1G/y83mAvzl5Um4UUbVY84LDz+ioHGVZESW
         vygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584958; x=1795189758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EI8Ol9JSwzLX5do+5u17y7XlhvIzj8td+kbOlzgS1nA=;
        b=m+FgvrvxgFjX04ZBeRQG44Q8rMMGwAt0XyMAWDm/xqCHUg2GgzQCJ1TK+8Bn13/OFU
         Xpo+mIREGiL36xr8u9t/6Ds63inW6m/y6ldc0NPFqFBBWYJE5iGpYyZEqZsrmvQV2D+j
         qaka/Fup1HHRgxa+Wp3mTp3TuJJsHBnuAHlZQXbM7TQDG0/LPsv3lSldHLNfEC7v1pqb
         M9kP6fhH5T8/Fkx7KfSI8WmUghbS67LOZcJjXWGx130u1HFy2nrZoJAWkmrbPSgyq6UR
         R1HdUgDEE5orVPjFKW+IwVeTcpw2UZR+8vJsEgsFQzXDSJDhoCbRuzbyoQfwBHPWROKt
         CzUQ==
X-Gm-Message-State: APuU4Z96W5ePWz0V8s7VnyRmxDEnqU41/aE8tmCf5I7weVLYo1GaLmF4
	ntlWPCoqlY0yxOzeljoGs93EDSNcS8ipfGcm6ACE8AAklqipnSgXnPAofl60/w==
X-Gm-Gg: AYBFou3IdE8AtKTwqjrGN8EjJkwMd57U4Orf7BjUxAcRialnoznIx2OHzNO8BvxvZyL
	PwwbT8kM80Uctn567reKnKJi5qfJIFPrnjdUeg8tLeZwlOG9XEwlzagAwomyFs2l+Soxh8Dsqev
	aPG1b/lxBI2HyGhKY/9IUM+MS95IMIlhOowQ5O06EYDzZvJFdMBCu/TukKxRLKZi2XmicR0C8F0
	z1U/CEwqCQ6GlgXPdJRFlm5OT0epJsuP5KSX2AXZjY5J+RM7BnJXkbRG4snN6GyuFqtkE/OHggL
	16uel9bB5F5Gxey2WzWGAZo/Tc0fZArataXiWvTIXQBvkIm3h5npmC1lQnt618vdlFFSxJVwZgg
	ftfCEKn95sXQghE/pzYOAFEH7e0WBtA7WWcDUXZiCPMZGjTQrivqeNTNkWdTqagbKE/8DAb7Gyt
	UZcey7vNLTJgrKj5TvTtnWFY23R3hWstkQkZSW+sqgHQl4gjRyaRb23+EK8ZC2JnTxTXOMqd/9w
	qwd9JnsvAj5Z5sBXfGUlVybA07iVyxG3hCef/7KPtwKOqoly5INO2yOegJxsbkXH3KirccNpq5Z
	oo1h1ec7tPYhYfS7HPxoozxjVd+67tvqkXxBvEE+GJWphQnpn4/IMrvcaZV3SehCtR1e
X-Received: by 2002:a05:6000:2411:b0:48f:f26d:c5c with SMTP id ffacd0b85a97d-49c70b051d1mr6383842f8f.9.1794584957603;
        Fri, 13 Nov 2026 07:49:17 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 10/42] xen/riscv: leave the h/w source of an IRQ routed to a guest inactive
Date: Fri, 13 Nov 2026 16:48:31 +0100
Message-ID: <246887fb9762b1897dd81504f891fce84bef5f16.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1794584958-BC8C9034-24126427/10/73395122804
X-purgate-type: spam
X-purgate-size: 2053
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

intc_route_irq_to_guest() has set the h/w IRQ to the trigger type given
by the host DT. A guest configures its h/w sources itself, though:
vAPLIC passes the guest's writes to their sourcecfg[] through to the h/w
registers. So whatever Xen writes there at routing time gets
overwritten, and until then a source the guest hasn't configured yet
isn't in its reset state, Inactive.

Put the h/w source into Inactive instead, by IRQ_TYPE_NONE. That also
covers an IRQ an earlier domain has left configured, as nothing resets
the h/w source when the IRQ is released. desc->arch.type stays as it is,
and the guest learns the trigger type from its DT as before.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
This patch doesn't depend on the rest of the series, but what it
prevents only shows up later in it:
 - from "xen/riscv: introduce IMSIC h/w interrupt file attaching to
   vcpu" on, the h/w target register of a guest's h/w source points at a
   real guest interrupt file, so a source left active could deliver an
   MSI there before the guest has configured it;
 - "xen/riscv: emulate the pending bits and MSIs of virtual vAPLIC
   sources" reads the h/w pending bits of h/w sources as they are, and
   these stay in line with the guest's view of the source being
   Inactive only if the h/w source is Inactive as well.
---
Changes in v4:
 - New patch.
---
---
 xen/arch/riscv/intc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index ac9c798ec36b..cdbc039d0258 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -95,7 +95,7 @@ int intc_route_irq_to_guest(const struct domain *d, unsigned int virq,
     desc->handler = intc_hw_ops->guest_irq_type;
     desc->status |= IRQ_GUEST;
 
-    intc_set_irq_type(desc, desc->arch.type);
+    intc_set_irq_type(desc, IRQ_TYPE_NONE);
     intc_set_irq_priority(desc, priority);
 
     /* Connect @virq to the h/w IRQ: it isn't a virtual source. */
-- 
2.56.1


