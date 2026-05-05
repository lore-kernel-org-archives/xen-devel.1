Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F0AFF885A
	for <xen-devel@archiver.kernel.org>; Tue,  5 May 2026 08:22:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1300312.1574833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKB34-00087F-0Q; Tue, 05 May 2026 08:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300312.1574833; Tue, 05 May 2026 08:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKB33-000878-Sg; Tue, 05 May 2026 08:22:33 +0000
Received: by outflank-mailman (input) for mailman id 1300312;
 Tue, 05 May 2026 08:22:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tip-bot2@linutronix.de>) id 1wKB32-000872-2P
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 08:22:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKB31-00Bd9G-9s
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:22:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tip-bot2@linutronix.de>)
 id 69f9a8c1-2eae-0a2a0a5409dd-0a2a4508a534-16
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 10:22:31 +0200
Received: from [193.142.43.55] (helo=galois.linutronix.de)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <tip-bot2@linutronix.de>)
 id 69f9a8c6-63b5-0a2a45080019-c18e2b379026-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 10:22:30 +0200
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=2020 header.d=linutronix.de header.i="@linutronix.de" header.h="From:Sender:Reply-to:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"; dkim=permerror header.s=2020e header.d=linutronix.de header.i="@linutronix.de"
Date: Tue, 05 May 2026 08:22:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777969350;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NfJ1YduhltV+uaN4L6tWu1N+7FQbIUL59Zqc4X2ZkGQ=;
	b=BLC5MlbLbTtsTdDUzIrgvGle47013JfO2P/gEVbfxVRGNqTkmkoWfpuFBPyo8A2zvRwx3V
	pemz6g+A+NPc5JyB1R8Bjwqi6yzFBzlJHw84q5SxCgDxKOjZIfJSQbcIQct+T6VyvElDww
	HHlPE6rIYYWt8VzlQNE8unryG5ndPjS0HOivgYPoJq/fK4UdIsAcNPJ5NdQvx8l74M2Lxv
	KOWINWXnEYKVQSJtb7ytgRyZdIK+mB2t6SfsOanNI0UErzijCu1/1s/+DH2EOPJ25AnbS4
	AfRCnZXsR0Myknv/jI3vs5u5CG1I8o5KF8I63OcWtFnbiX48GuTdaCpmNu9vlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777969350;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NfJ1YduhltV+uaN4L6tWu1N+7FQbIUL59Zqc4X2ZkGQ=;
	b=S/w43rLBt5Tlyfy2AJR2F2D4w9Nnj9xNeQTvWXi6LzsE3IlB0iWK0QJRapaesXJcLpCvzi
	HeHF3ogJfKcy7ZBA==
From: "tip-bot2 for Juergen Gross" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/xen: Fix a potential problem in
 xen_e820_resolve_conflicts()
Cc: Juergen Gross <jgross@suse.com>, Ingo Molnar <mingo@kernel.org>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260505080653.197775-1-jgross@suse.com>
References: <20260505080653.197775-1-jgross@suse.com>
MIME-Version: 1.0
Message-ID: <177796934897.424702.11107616066849971102.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1777969351-C2975DB1-57E2DF78/0/0
X-purgate-type: clean
X-purgate-size: 1961

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     5f8719945244dd65b5fa06195f4600db62581610
Gitweb:        https://git.kernel.org/tip/5f8719945244dd65b5fa06195f4600db625=
81610
Author:        Juergen Gross <jgross@suse.com>
AuthorDate:    Tue, 05 May 2026 10:06:53 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 05 May 2026 10:17:00 +02:00

x86/xen: Fix a potential problem in xen_e820_resolve_conflicts()

When fixing a conflict in xen_e820_resolve_conflicts(), the loop over
the E820 map entries needs to be restarted, as the E820 map will have
been modified by the fix. Otherwise entries might be skipped by
accident.

Fixes: be35d91c8880 ("xen: tolerate ACPI NVS memory overlapping with Xen allo=
cated memory")
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: xen-devel@lists.xenproject.org
Link: https://patch.msgid.link/20260505080653.197775-1-jgross@suse.com
---
 arch/x86/xen/setup.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index ac8021c..bb95a05 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -695,17 +695,22 @@ static void __init xen_e820_resolve_conflicts(phys_addr=
_t start,
 		return;
=20
 	end =3D start + size;
-	entry =3D xen_e820_table.entries;
+	mapcnt =3D 0;
=20
-	for (mapcnt =3D 0; mapcnt < xen_e820_table.nr_entries; mapcnt++) {
+	while (mapcnt < xen_e820_table.nr_entries) {
+		entry =3D xen_e820_table.entries + mapcnt;
 		if (entry->addr >=3D end)
 			return;
=20
 		if (entry->addr + entry->size > start &&
-		    entry->type =3D=3D E820_TYPE_NVS)
+		    entry->type =3D=3D E820_TYPE_NVS) {
 			xen_e820_swap_entry_with_ram(entry);
+			/* E820 map has been changed, restart loop! */
+			mapcnt =3D 0;
+			continue;
+		}
=20
-		entry++;
+		mapcnt++;
 	}
 }
=20

