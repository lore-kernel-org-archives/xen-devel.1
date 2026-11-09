Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F745606A321
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 12:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XbKL1XGg
Received: from list by lists.xenproject.org with outflank-mailman.1479980.1683884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQOht-0001Zl-Qs; Mon, 09 Nov 2026 12:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479980.1683884; Mon, 09 Nov 2026 12:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQOht-0001Ze-OK; Mon, 09 Nov 2026 12:42:41 +0000
Received: by outflank-mailman (input) for mailman id 1479980;
 Mon, 09 Nov 2026 12:42:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yhlee@isslab.korea.ac.kr>) id 1xQOht-0001ZX-6y
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:42:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQOhs-007ZbR-Jv
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:42:40 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af1bfb4-bab6-0a2a0a5309dd-0a2a4506c0b8-26
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:42:39 +0100
Received: from [209.85.216.48] (helo=mail-pj1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af1bb49-195a-0a2a45060019-d155d830b04d-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:23:38 +0100
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-3b147e06befso282729a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 04:23:38 -0800 (PST)
Received: from yhlee-960QFG.Davolink
 ([2406:5900:1044:110c:3d70:1891:1a66:b169])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b127912d62sm6836905a91.11.2026.11.09.04.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 04:23:36 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i="@isslab-korea-ac-kr.20260707.gappssmtp.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794227016; x=1794831816; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vcgV08xYKH0g5nt/nWVsU3QDB7VewTUh+uDf63N1EY=;
        b=XbKL1XGg/Dm9BfquBIVJ30TiEpEEzPXffuIQMLwzbPgrLYTctbWA4s6C13zQPy49/b
         p1NPPQnidLYgTMotTQo/LMXipj9qbM/meFuNBZDLwew0D/mEkcfq45bHgSAqy+BgrGOl
         DlX9ToOV0prG62IcuPH+cbi8clUrPbq5rkPo1thlE8FZ1frzux2gQ9s6R9LW29DfyDf/
         WfHE2TnEAGfYvDkbEqNTRMQzZQ3L7wJaOzX7vitOwaTiPkRoELXtO4ZhJ1crYBllPFQ/
         +EBucASQxz6Nras0vec+VZegIR+U1Xpyf0aeoUn4/U8ipPOhx4dLneDjM4NnpU2APxKr
         Kuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227016; x=1794831816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1vcgV08xYKH0g5nt/nWVsU3QDB7VewTUh+uDf63N1EY=;
        b=R/Q2gPQlRZU29+NCfK5CxyOqgiD3z4r6sQbys9pv9W8cHbul1ZhKngyyj6k8ZsWHza
         Sl7asUGpXNq23RIqkrq0A7gv8YJfKZT+IaL9IeKXUr7aDNli5PzhVJ0bHmZTTZTsuRko
         x4kekORtt2sH09ZV9v6ojU6Rfe/Kr3DA3KIb7c5aVTO2AbSdYDhObu843CLhA1REc02+
         ODGEw4+12VDokepDLdSjiaG6Ca4XNUJo1Hnu9sDnFAlxdjZo40Zx7kTULCa8Bn17vMoY
         +oOOwiiUfVAHzYvD2yc/JHBECA2kDTIfNbQ0aN72gWoZjI8TW5tj5jT0Uoz5kbt/f8vF
         kVIQ==
X-Forwarded-Encrypted: i=1; AL+hErEfN4eK0hu3QfOgXqht7NqjikSYMwEPZegsolS3/+PAeHcWFO4bpV1FaAEiwc38LRKA7/0m1JhDCGQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8RdBp/iSH+8uE1U72h26/9kXGjZMvpPXSTVLphBIo/YaKmE+f4
	DabJS4yIZ8IaOAEWo2BmTivz06AKC2rWTZLle7gizNiouyKGWUVY12Imr8X008KAXEA=
X-Gm-Gg: AYBFou1EeklEn75orMnsynvB8ucW0sYs2Ka9X42ynMjiWPNNkxcfJxAdStlgOL7/EuR
	xIMPaUhFnDbGBFjLTz+b3PphOgUDa4xQZXi1FuYctdBCIwJjYTsB9QAzEaXsxH6fz0WFjjw3dmF
	RkRvsAGrVHZ5ivLs0kyiodasqkOPGpgZiebbO26NSOYXvDzIcudo3wg44uKbBztVBRcm9X/lueB
	ddCYijBgdKbQVZdJPHNoivlBA4RXSy6B8Ct29DAO6qVdftj6vcQNBmX+waKA3KmsuSDduNzzLSi
	axH2MvfeUhu0MLcn6xxEYJNhbFrEH1yRN47UohOUspagC70Xqnq41U4jE3xDh5c4kgBwNw7C2hy
	yuzSJQ1z6Ds/HqVJszvFgh17ePwGUfruOZIxn0XbiGwec5cSHSU/sVVuBWPuMnHlU11vFGZfmug
	8ngwxih+n6kehQQ1u67XL+hedSMc1KA0lYCR2KiRRQqsWqSs2teq4fsqHZInLEhLmqNDOC5ZuRS
	dLbUufPwhxjMZ+HZsB0eHDDNDQ4cm85w5PvgO4QeY8GLmFJwqF9pNGF+ow1j5lMVSQSwWJG9G9O
	CqxK3umfbBFOs86MmpGw7LEE1eAWH5ZOuw9jipRTbcFqDnpCMkYo9StLntaL12+B61dx0cN/IEj
	p+wX9w8UrSu7YpwGlLrFoOe5c5IzKis53Rj6zaA==
X-Received: by 2002:a17:90b:5285:b0:3ac:7c52:fb04 with SMTP id 98e67ed59e1d1-3b12d43b32dmr3413278a91.44.1794227016472;
        Mon, 09 Nov 2026 04:23:36 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] xen/pvcalls: unwind pvcalls_new_active_socket() step by step
Date: Mon,  9 Nov 2026 21:23:23 +0900
Message-ID: <20261109122324.30134-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109122324.30134-1-yhlee@isslab.korea.ac.kr>
References: <20261109122324.30134-1-yhlee@isslab.korea.ac.kr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1794227018-FD00977B-5E448DDA/10/78177266408
X-purgate-type: clean
X-purgate-size: 7003
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Every error path in pvcalls_new_active_socket() jumps to one shared label
that does list_del(&map->list) and then hands map to
pvcalls_back_release_active().  But map comes from kzalloc() and its
list_head is only published at the very end of the function, after the last
of those jumps:

	down(&fedata->socket_lock);
	list_add_tail(&map->list, &fedata->socket_mappings);
	up(&fedata->socket_lock);

so on the error path map->list is still {NULL, NULL} and __list_del()
writes through a NULL pointer.

A frontend gets there with one value it owns: the ring_order field of the
page it granted.  Anything above MAX_RING_ORDER takes the second goto, and
nothing else in the function has run by then.

The result is an oops in whichever context handled the request - the
pvcalls-back threaded IRQ handler for PVCALLS_CONNECT, mappass->wq for
PVCALLS_ACCEPT - and because it happens after down(&fedata->socket_lock)
that semaphore is never released, so every later operation on the frontend
blocks on it and the backend never completes backend_disconnect().  (With
CONFIG_DEBUG_LIST the list_del() only reports and returns, and
pvcalls_back_release_active() then runs on a map whose irq is still 0 and
whose bytes, ioworker.wq and saved_data_ready are all NULL.)

A frontend asking for ring_order 5, on a dom0 built with KASAN
(the request was issued by a test-only change to the frontend):

[  133.728877] pvcalls_new_active_socket frontend requested ring_order 5, which is > MAX (4)
[  133.732868] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
[  133.737910] KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
[  133.741666] CPU: 0 UID: 0 PID: 133 Comm: irq/39-pvcalls- Not tainted 7.3.0-kCTLblk2-15482-g21a7f44fd076-dirty #1 PREEMPT(full)
[  133.746986] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  133.751512] RIP: 0010:pvcalls_new_active_socket+0x821/0xb90
[  133.754237] Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 f6 01 00 00 48 8d 79 08 4c 8b 6b 08 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 14 02 00 00 4c 89 ea 4c 89 69 08 48 b8 00 00 00
[  133.763126] RSP: 0018:ffffc900004afb38 EFLAGS: 00010202
[  133.765861] RAX: dffffc0000000000 RBX: ffff88810886c900 RCX: 0000000000000000
[  133.769348] RDX: 0000000000000001 RSI: 0000000000000246 RDI: 0000000000000008
[  133.772787] RBP: 1ffff92000095f6b R08: 0000000000000001 R09: fffff52000095f58
[  133.776260] R10: 0000000000000003 R11: ffff888100077320 R12: ffff88810858b410
[  133.779823] R13: 0000000000000000 R14: ffff88810858b460 R15: ffff88810858b400
[  133.783382] FS:  0000000000000000(0000) GS:ffff8881b034c000(0000) knlGS:0000000000000000
[  133.787351] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  133.790308] CR2: 00000000006042c0 CR3: 0000000108400001 CR4: 0000000000770ef0
[  133.793822] PKRU: 55555554
[  133.795347] Call Trace:
[  133.796778]  <TASK>
[  133.798082]  ? __pfx_pvcalls_new_active_socket+0x10/0x10
[  133.800801]  ? security_socket_post_create+0x4d/0x60
[  133.803275]  ? release_sock+0x1a/0x1d0
[  133.805182]  pvcalls_back_event+0x1b09/0x23e0
[  133.807431]  ? __pfx_pvcalls_back_event+0x10/0x10
[  133.809814]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[  133.812251]  ? __pfx_pvcalls_back_event+0x10/0x10
[  133.814554]  irq_thread_fn+0x86/0x150
[  133.816468]  irq_thread+0x2da/0x580
[  133.818363]  ? __pfx_irq_thread_fn+0x10/0x10
[  133.820586]  ? __pfx_irq_thread+0x10/0x10
[  133.822670]  ? __kthread_parkme+0x88/0x170
[  133.824803]  ? __pfx_irq_thread+0x10/0x10
[  133.827153]  ? __pfx_irq_thread+0x10/0x10
[  133.829304]  kthread+0x2c8/0x3b0
[  133.831176]  ? recalc_sigpending+0x15c/0x1e0
[  133.833570]  ? __pfx_kthread+0x10/0x10
[  133.835572]  ret_from_fork+0x373/0x5b0
[  133.837581]  ? __pfx_ret_from_fork+0x10/0x10
[  133.839978]  ? __switch_to+0x3c4/0xb40
[  133.841984]  ? __pfx_kthread+0x10/0x10
[  133.843970]  ret_from_fork_asm+0x1a/0x30
[  133.846031]  </TASK>
[  133.847420] Modules linked in:
[  133.849240] ---[ end trace 0000000000000000 ]---

Give each failure its own label, so that only resources that were actually
acquired are released and the list the map was never added to is left
alone.  The map is not published anywhere at that point, so the error path
needs no socket_lock at all.  sock_release() stays in the callee on every
error path, the way
commit 8fafac202d18 ("xen/pvcalls-back: fix double frees with pvcalls_new_active_socket()")
arranged it.

Fixes: 5db4d286a8ef ("xen/pvcalls: implement connect command")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/xen/pvcalls-back.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
index ba62651a7f338b..dcefa91a40cd05 100644
--- a/drivers/xen/pvcalls-back.c
+++ b/drivers/xen/pvcalls-back.c
@@ -337,7 +337,7 @@ static struct sock_mapping *pvcalls_new_active_socket(
 
 	ret = xenbus_map_ring_valloc(fedata->dev, &ref, 1, &page);
 	if (ret < 0)
-		goto out;
+		goto out_map;
 	map->ring = page;
 	map->ring_order = map->ring->ring_order;
 	/* first read the order, then map the data ring */
@@ -345,19 +345,19 @@ static struct sock_mapping *pvcalls_new_active_socket(
 	if (map->ring_order > MAX_RING_ORDER) {
 		pr_warn("%s frontend requested ring_order %u, which is > MAX (%u)\n",
 				__func__, map->ring_order, MAX_RING_ORDER);
-		goto out;
+		goto out_unmap_ring;
 	}
 	ret = xenbus_map_ring_valloc(fedata->dev, map->ring->ref,
 				     (1 << map->ring_order), &page);
 	if (ret < 0)
-		goto out;
+		goto out_unmap_ring;
 	map->bytes = page;
 
 	ret = bind_interdomain_evtchn_to_irqhandler_lateeoi(
 			fedata->dev, evtchn,
 			pvcalls_back_conn_event, 0, "pvcalls-backend", map);
 	if (ret < 0)
-		goto out;
+		goto out_unmap_bytes;
 	map->irq = ret;
 
 	map->data.in = map->bytes;
@@ -365,7 +365,7 @@ static struct sock_mapping *pvcalls_new_active_socket(
 
 	map->ioworker.wq = alloc_ordered_workqueue("pvcalls_io", 0);
 	if (!map->ioworker.wq)
-		goto out;
+		goto out_unbind;
 	atomic_set(&map->io, 1);
 	INIT_WORK(&map->ioworker.register_work,	pvcalls_back_ioworker);
 
@@ -381,11 +381,16 @@ static struct sock_mapping *pvcalls_new_active_socket(
 	write_unlock_bh(&map->sock->sk->sk_callback_lock);
 
 	return map;
-out:
-	down(&fedata->socket_lock);
-	list_del(&map->list);
-	pvcalls_back_release_active(fedata->dev, fedata, map);
-	up(&fedata->socket_lock);
+
+out_unbind:
+	unbind_from_irqhandler(map->irq, map);
+out_unmap_bytes:
+	xenbus_unmap_ring_vfree(fedata->dev, map->bytes);
+out_unmap_ring:
+	xenbus_unmap_ring_vfree(fedata->dev, (void *)map->ring);
+out_map:
+	sock_release(sock);
+	kfree(map);
 	return NULL;
 }
 
-- 
2.43.0


