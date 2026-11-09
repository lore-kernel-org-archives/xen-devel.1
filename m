Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA11B606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 12:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lyNBKbNc
Received: from list by lists.xenproject.org with outflank-mailman.1479992.1683918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQOlI-0002Lm-Gu; Mon, 09 Nov 2026 12:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479992.1683918; Mon, 09 Nov 2026 12:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQOlI-0002Lf-DU; Mon, 09 Nov 2026 12:46:12 +0000
Received: by outflank-mailman (input) for mailman id 1479992;
 Mon, 09 Nov 2026 12:46:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yhlee@isslab.korea.ac.kr>) id 1xQOlG-0002LZ-Ne
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:46:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQOlF-003tJt-T9
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:46:09 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af1c08e-e002-0a2a0a5209dd-0a2a4502901c-16
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:46:09 +0100
Received: from [209.85.214.179] (helo=mail-pl1-f179.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af1bc17-6ca4-0a2a45020019-d155d6b3bc9a-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:27:04 +0100
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2ea7987517aso4147685ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 04:27:04 -0800 (PST)
Received: from yhlee-960QFG.Davolink
 ([2406:5900:1044:110c:3d70:1891:1a66:b169])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ed81734d95sm9934985ad.65.2026.11.09.04.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 04:27:01 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i="@isslab-korea-ac-kr.20260707.gappssmtp.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794227222; x=1794832022; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=auUowkHUVqWY9moHr++cNLc5S5EI9m+OJlbauxvV4NY=;
        b=lyNBKbNcz565ax5RgSTtO1MJVlC7cyTNskqs1NRVq07TpJs7yoiUMTMJATHWkMuSi5
         2BlVqQTkDcBUQP3AC+9vKg8i5Mc59IyBLUYI2Gk54iCqwLlF+45nsM/PyjGgKA1KvaJ3
         xKpBNGZMN7Y135xqXKSDAAsSSJulXIW/7iVRyzbsWd2eZT3kCktASrPaN2ajaXS9BPIy
         ZUfFPt4OqDtcWG64wuZRk0zXOPq3luD9370iIXXi/WLzlBgMupfnqRuU6Q4pit2MQGIN
         h7LwdHK6KiCP1SM/OEokRdsqLgajg6n53IvZwQhI+eo33owpQhQbDgzeuqcNTYa54s7d
         TJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227222; x=1794832022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auUowkHUVqWY9moHr++cNLc5S5EI9m+OJlbauxvV4NY=;
        b=ib28LRB5DFCPHmxinB8OZyc+KMrlbp+ubK/k81c+BoVUvKbiTppGFauWxuyz/rV3qM
         Voi6XGq8Wn0S4SGGsI45A6ZNQsTghPTgeJzNngy2FRgQYBgmNOESqhl5aAMvgvPgGTRR
         9nIRGbjm6c1az0ZAdVDkf0edoXeQD1aELrzvlHIJl1C7jX0Bd5X9PLgwlxAY1l1KbLco
         95Nn2Awcb4BmEeVDbA559qqxCw19R4ed4IsO+YmeTi08OErkztLWL8dajBL8BKakirhH
         qgoPPT+o4KQNcBUQ7dOagNSHsiTyUC8gEicNziwRP49n22P1DOQN/IezFvdqPGUm0M6h
         Djpg==
X-Forwarded-Encrypted: i=1; AL+hErEXY07lpo0kdxq5aGC349w9EZOVzheIkVrbcWk9F6LNzbL6woQN/NnW59/OhCXNpIbd4k2Rl5UlkUw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z90zfiP2LUOPZUJUrckYXBsK3/9kebarsf3czn0x4zGIPRHRVSa
	FMkfCTdLSoZxLhRmarEUMIYrUt1Y/wlHt4uZG6aOTVfnQ4R6XwdjV8qss7bMdxRvnjM=
X-Gm-Gg: AYBFou29xvyVAVxlD9VaF7aurJ9F70/BGVUl/sSVFvi47nxdNqqUNz4XPJXka+/agNg
	Z+4B6e9nBuK57dUvYYdAPrDLtlWW2hJPEXY9OiYqiA3ZX8iICQENwlel4Zkk+bNlj7OJklw0sDn
	x8O0naZ4hPM0lg7isCHPEd9pvMT8g7QnmYMm2WQhRxfDbK9zWzeD9bpGjFlPTMEPnuo1mzKw0GN
	GvYc7zJyoKUjoJaAGmNqkyYEbux53tRHuBsL5VAQQ6XYo9m3qewFrZHyX0T/uMN3HZbNKbZi/NH
	mz/y0CM59AXnV5l29qqnqLX1Pr11VDd4Ne3X03IxarNUBpyewuMh3dIoN0T7aVFfRTEsFdj+GoW
	IevATInESrIPY3/woIECt6w6evSAuYxQvHwTBjlj4xmSwFwEOKEZrmbjDXsNQC2N6OjUnEFwqbW
	vt4eoUmMXvD5rbrOLNAOrsXGpvZrcp2Wj4uS3o79NLrCu+Ti0kxWUO/JQh0Qh26IQkg+umMCqcy
	3DHGDORJDCExAcxG5F36zWITDe5ULlGQsrIc63M4lVxpbg5MZGTMCPlmNWg/rpBFQU2nclUHWi7
	8AH8hHKyKVAyRSAYnEBr6+79mEYmR0vBisHLqDtVqqkT7iuofaQOpMHsxX6mg2xc4F8a1O1W30s
	NRYrc5gj/rH5hiOL+ZSyU20Y/e/AUBmyvQ5hSz6zpdk+/yMXCmjlyMwG22hs=
X-Received: by 2002:a17:902:d547:b0:2ed:2305:5244 with SMTP id d9443c01a7336-2ed8379d007mr36355115ad.46.1794227222400;
        Mon, 09 Nov 2026 04:27:02 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com
Cc: sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	martin.petersen@oracle.com,
	stable@vger.kernel.org
Subject: [PATCH] xen/scsiback: unbind the IRQ before draining in-flight requests
Date: Mon,  9 Nov 2026 21:26:54 +0900
Message-ID: <20261109122654.30859-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1794227224-67EBB2AC-8640F6A0/10/78177266408
X-purgate-type: clean
X-purgate-size: 8623
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

scsiback_disconnect() drains the in-flight count before stopping the only
thing that can raise it.  scsiback_cmd_exec() (xen-scsiback.c:426) runs in
the backend's threaded IRQ handler, so a request can be admitted just after
wait_event() has seen zero, and its response is written later from target
core context by scsiback_send_response() (:347) - after the ring has been
unmapped, and on the scsiback_remove() path (:1268-1280) after kfree(info).

xen-blkback and xen-netback stop their request processing first:
kthread_stop() before reading ring->inflight
(xen-blkback/xenbus.c:290-304), and the kthreads and napi before
unbinding and unmapping (xen-netback/interface.c:673-700).

Unbind and clear info->irq before the drain: nothing is admitted once the
handler is gone, and the ring stays mapped until the drain finishes.  The
notify at the end of scsiback_send_response() is then a no-op, because
notify_remote_via_irq() resolves irq 0 through evtchn_from_irq() to port 0,
which VALID_EVTCHN() rejects (events_base.c:539-545, :411-421).

Reproduced in a nested-Xen lab with KASAN.  Reaching the window needed two
test-only usleep_range() delays, one after wait_event() returns and one at
the top of scsiback_do_resp_with_sense() once the teardown has started.
With both off neither arm produced anything in 4 rounds each; with both on
the unpatched driver crashed in 6 of 6 valid cells, the patched in 0 of 7:

[  168.546709] BUG: KASAN: vmalloc-out-of-bounds in scsiback_send_response+0x516/0x5d0
[  168.551012] Write of size 4 at addr ffffc900000230a4 by task kworker/0:1/11
[  168.554757]
[  168.555908] CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 7.3.0-kCTLblk2-15482-g21a7f44fd076-dirty #10 PREEMPT(full)
[  168.555914] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  168.555918] Workqueue: target_completion target_complete_ok_work
[  168.555939] Call Trace:
[  168.555946]  <TASK>
[  168.555949]  dump_stack_lvl+0x64/0x80
[  168.555958]  print_report+0xd0/0x630
[  168.555966]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[  168.555978]  ? scsiback_send_response+0x516/0x5d0
[  168.555983]  kasan_report+0xce/0x100
[  168.555988]  ? scsiback_send_response+0x516/0x5d0
[  168.555992]  scsiback_send_response+0x516/0x5d0
[  168.555997]  ? __pfx_scsiback_send_response+0x10/0x10
[  168.556001]  scsiback_do_resp_with_sense+0x87/0x230
[  168.556007]  scsiback_cmd_done+0xc0/0x290
[  168.556011]  ? update_cfs_rq_load_avg+0x5a/0x560
[  168.556023]  scsiback_queue_status+0xd3/0x100
[  168.556028]  target_complete_ok_work+0x467/0xc30
[  168.556032]  ? __pfx_target_complete_ok_work+0x10/0x10
[  168.556036]  ? put_prev_task_fair+0x44d/0xa30
[  168.556039]  ? finish_task_switch.isra.0+0x1d9/0xa70
[  168.556047]  process_one_work+0x697/0x1060
[  168.556052]  ? __pfx___schedule+0x10/0x10
[  168.556058]  ? __pfx_process_one_work+0x10/0x10
[  168.556061]  ? _raw_spin_lock_irq+0x86/0xe0
[  168.556065]  ? __pfx_target_complete_ok_work+0x10/0x10
[  168.556069]  ? assign_work+0x11d/0x370
[  168.556074]  worker_thread+0x45b/0xd10
[  168.556078]  ? __pfx_worker_thread+0x10/0x10
[  168.556081]  ? __pfx_worker_thread+0x10/0x10
[  168.556083]  kthread+0x2c8/0x3b0
[  168.556090]  ? recalc_sigpending+0x15c/0x1e0
[  168.556094]  ? __pfx_kthread+0x10/0x10
[  168.556098]  ret_from_fork+0x373/0x5b0
[  168.556104]  ? __pfx_ret_from_fork+0x10/0x10
[  168.556107]  ? __switch_to+0x3c4/0xb40
[  168.556115]  ? __pfx_kthread+0x10/0x10
[  168.556120]  ret_from_fork_asm+0x1a/0x30
[  168.556127]  </TASK>
[  168.556129]
[  168.639704] The buggy address belongs to a vmalloc virtual mapping
[  168.642324] Memory state around the buggy address:
[  168.644439]  ffffc90000022f80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
[  168.647698]  ffffc90000023000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
[  168.650951] >ffffc90000023080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
[  168.669199]                                ^
[  168.671056]  ffffc90000023100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
[  168.674050]  ffffc90000023180: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
[  168.676974] ==================================================================

[  168.682117] BUG: unable to handle page fault for address: ffffc900000230a4
[  168.684784] #PF: supervisor write access in kernel mode
[  168.686797] #PF: error_code(0x0002) - not-present page
[  168.688797] PGD 100000067 P4D 100000067 PUD 10019c067 PMD 1001a1067 PTE 0
[  168.691319] Oops: Oops: 0002 [#1] SMP KASAN NOPTI
[  168.693246] CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Tainted: G    B                7.3.0-kCTLblk2-15482-g21a7f44fd076-dirty #10 PREEMPT(full)
[  168.699142] Tainted: [B]=BAD_PAGE
[  168.700896] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  168.705056] Workqueue: target_completion target_complete_ok_work
[  168.707701] RIP: 0010:scsiback_send_response+0x1b6/0x5d0
[  168.710147] Code: 48 89 f8 83 e0 07 83 c0 03 40 38 f0 7c 09 40 84 f6 0f 85 60 03 00 00 48 89 d8 48 c1 e0 06 48 29 d8 48 c1 e0 02 48 8d 7c 01 40 <89> 94 01 a4 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1
[  168.718883] RSP: 0018:ffffc900000bfaa0 EFLAGS: 00010046
[  168.721447] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffc90000023000
[  168.724785] RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffffc90000023040
[  168.727913] RBP: ffff88810a4a7238 R08: 0000000000000246 R09: fffffbfff0de2638
[  168.730938] R10: ffffffff86f131c7 R11: ffff888100077320 R12: 1ffff92000017f59
[  168.733902] R13: 0000000000000000 R14: 0000000000000000 R15: ffff88810a6de200
[  168.736874] FS:  0000000000000000(0000) GS:ffff8881b034d000(0000) knlGS:0000000000000000
[  168.740171] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  168.742490] CR2: ffffc900000230a4 CR3: 0000000103271005 CR4: 0000000000770ef0
[  168.745350] PKRU: 55555554
[  168.746577] Call Trace:
[  168.747772]  <TASK>
[  168.748872]  ? __pfx_scsiback_send_response+0x10/0x10
[  168.751022]  scsiback_do_resp_with_sense+0x87/0x230
[  168.753109]  scsiback_cmd_done+0xc0/0x290
[  168.754847]  ? update_cfs_rq_load_avg+0x5a/0x560
[  168.756782]  scsiback_queue_status+0xd3/0x100
[  168.758630]  target_complete_ok_work+0x467/0xc30
[  168.760556]  ? __pfx_target_complete_ok_work+0x10/0x10
[  168.762644]  ? put_prev_task_fair+0x44d/0xa30
[  168.764512]  ? finish_task_switch.isra.0+0x1d9/0xa70
[  168.766584]  process_one_work+0x697/0x1060
[  168.768282]  ? __pfx___schedule+0x10/0x10
[  168.769973]  ? __pfx_process_one_work+0x10/0x10
[  168.771880]  ? _raw_spin_lock_irq+0x86/0xe0
[  168.773599]  ? __pfx_target_complete_ok_work+0x10/0x10
[  168.775721]  ? assign_work+0x11d/0x370
[  168.777324]  worker_thread+0x45b/0xd10
[  168.778899]  ? __pfx_worker_thread+0x10/0x10
[  168.780648]  ? __pfx_worker_thread+0x10/0x10
[  168.782415]  kthread+0x2c8/0x3b0
[  168.783877]  ? recalc_sigpending+0x15c/0x1e0
[  168.785697]  ? __pfx_kthread+0x10/0x10
[  168.787218]  ret_from_fork+0x373/0x5b0
[  168.788752]  ? __pfx_ret_from_fork+0x10/0x10
[  168.790500]  ? __switch_to+0x3c4/0xb40
[  168.792029]  ? __pfx_kthread+0x10/0x10
[  168.793555]  ret_from_fork_asm+0x1a/0x30
[  168.795180]  </TASK>
[  168.796205] Modules linked in:
[  168.797596] CR2: ffffc900000230a4
[  168.799084] ---[ end trace 0000000000000000 ]---

Fixes: d9d660f6e562 ("xen-scsiback: Add Xen PV SCSI backend driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
Reported to the Xen security team first; xen-scsiback is not security supported, so posting here as suggested.

 drivers/xen/xen-scsiback.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/xen-scsiback.c b/drivers/xen/xen-scsiback.c
index c7036e0e41bda1..647a3c7e2a2b39 100644
--- a/drivers/xen/xen-scsiback.c
+++ b/drivers/xen/xen-scsiback.c
@@ -603,11 +603,13 @@ static int scsiback_gnttab_data_map(struct vscsiif_request *ring_req,
 
 static void scsiback_disconnect(struct vscsibk_info *info)
 {
+	/* Stop admitting requests before draining the in-flight ones. */
+	unbind_from_irqhandler(info->irq, info);
+	info->irq = 0;
+
 	wait_event(info->waiting_to_free,
 		atomic_read(&info->nr_unreplied_reqs) == 0);
 
-	unbind_from_irqhandler(info->irq, info);
-	info->irq = 0;
 	xenbus_unmap_ring_vfree(info->dev, info->ring.sring);
 }
 

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0


