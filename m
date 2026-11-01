Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA38606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 05:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MY61aasJ
Received: from list by lists.xenproject.org with outflank-mailman.1467334.1676723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNkw8-0002Nf-BK; Mon, 02 Nov 2026 05:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467334.1676723; Mon, 02 Nov 2026 05:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNkw8-0002NT-7f; Mon, 02 Nov 2026 05:50:28 +0000
Received: by outflank-mailman (input) for mailman id 1467334;
 Sun, 01 Nov 2026 16:31:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <q.h.hack.winter@gmail.com>) id 1xNYSp-0000tl-Io
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 16:31:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNYSo-00213o-Od
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 17:31:22 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <q.h.hack.winter@gmail.com>)
 id 6ae768f5-bab6-0a2a0a5309dd-0a2a45058324-42
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 17:31:22 +0100
Received: from [209.85.216.51] (helo=mail-pj1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <q.h.hack.winter@gmail.com>)
 id 6ae76959-4cb1-0a2a45050019-d155d8339651-3
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 17:31:22 +0100
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-3acb1224533so366602a91.2
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 08:31:22 -0800 (PST)
Received: from localhost.localdomain ([113.102.236.131])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ae6e944ba9sm15038585a91.8.2026.11.01.08.31.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 01 Nov 2026 08:31:20 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1793550681; x=1794155481; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1wgGnLaHoKZu2/+Ud078CAK3gozxrFVUFtZdHR2t7Q=;
        b=MY61aasJ/D2mj0YjaIgM61I7E1yyzpNwrhKsDH9Q2kIzciSVuyMX85MxDN8UdlStBi
         sH9quG1xJM7bOPtO5DlFwMm3M9rsGmFw+LD9NX62nPgrXGUzngL5++QDjyhZgDiau0UQ
         KSVAMhSWwNM6zEwh/Ycs2zC8fRbTx1MpbNYEiuMFEgxa8u8IlDyEfmy8OpZXZ/1Z+oup
         eiQMDw9bGn5yPGPBbDtDoTEDNulDCvtz2xkeVOKjS5mf+2qxsm1KkjP/iAWnZ1IT1FtK
         U2FcSHU+2JZ8AA4pDkzTDo+dlWkCazcC3urZwl4gjXJZ2oMjYbYZtCQYn7wDtUK9a3T/
         BeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793550681; x=1794155481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z1wgGnLaHoKZu2/+Ud078CAK3gozxrFVUFtZdHR2t7Q=;
        b=Qd7OS6uTm1b+z6j4JdlUbYiOBr0RAiflx3CC5aPLJj7pFvlD5PCE/9ldnY+nazpfig
         LSzT/U5BHnLlQi9a43kzoLSBfmr19oQiVYZJg2VD3i6Ef8++jvzV/AlnqNn9inYYH5Tr
         kKu3FIxPa4M0D8SqzvPoSkeYS4e6YDcd1U3R16OZO/nQKf97X7GWQEA6FV/QhSZbrn3c
         /bSYK/yzQGSifmQMa0dmXHNojd4QK2WxQ7MdbNAJFWMr35wlggX4bhTU/p+RawIq0GDd
         2qOqb+6O4LNZmae9L++hPfD7pYW/R2nEOhKdxd04wBiAxr2HzidopmecUNx8xE1bYyAT
         VoxA==
X-Forwarded-Encrypted: i=1; AKwUvBwGf34UJmTmnPaUDt5GA5ST4AjzXdPdAVn/sW3WfFH3kZzCc+q7acvsYizM75Fh760mtf4CsnbT+PU=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/gLYudMXB7mtkFKX5rJDeYGIEBJoC6oJBxcdJAVwzfOk+kWthN
	xEUf1Pkeku7mJyPIGVX3U+2DgNHuy3pUw+WatK4/wAyNULdrnTQCiEt5
X-Gm-Gg: AYBFou0oV+wK+nMAS+FmIPMdcFKbDaAc05jDWiaT/wmathr/1jWDZj6PNm6vn8mkWwH
	zEIt94tb0osqKrQ8kQGCpzveQqo8dXi2q4LaOPpwVpwBAUUzYtZQGhgajs5MLJ+GBPoctn62Kil
	mNoBXJsKdP69dV1EKAA2r85rqjQIk1g1Wc/zvA3Qr4kVwIX5p/wDUKVJalPF8prmoDLzYgMHT55
	IcCSr6SvoMAWJNTefbPzxUyRjvxI+RExMSGRjdsIPm3H6O4hQALWI71am8dK0/wn33VPzgqHaG8
	Ek/dUGOaQJtbeX2L+JR8pI4ZO76O2OwUGf2AynbygjsMU/qDJDJHfivbM8NKvAwgqGsNjn50u0Z
	adE0DDYnkcxurXZZlNJ/irYEiwEOhfn9SPwtWjIIIA7ZGx+UB1TK1f5qZfUkMpFPB73y6YeWXjc
	PNe1lTlS+3gzDwro/AfLKCIjJJEiEgqEBEklUHrrYB80BFWpLGMr3ekJQDnv6NygA2qgktC3gA2
	Ih0djHerAoCR/s7/kuWvDztD9mY3bnbbvvAQaDevsYdkH1NmUHj5HVGmnYIZh37h1gnJD8scbWG
	DFkJLrJDATUxwdTYTQ0vQI9MDAXjzqUGe4nw9S1LBYa05Gz8tm/pdjx1F01EcHJCaT3t4PIpjj+
	lFJuk5btMGtilytJnmf6lFA0=
X-Received: by 2002:a17:90b:28c7:b0:3a0:238b:db4d with SMTP id 98e67ed59e1d1-3ae897f82c4mr10848258a91.5.1793550680657;
        Sun, 01 Nov 2026 08:31:20 -0800 (PST)
From: Qihang <q.h.hack.winter@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-kernel@vger.kernel.org,
	Qihang <q.h.hack.winter@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] xen/privcmd: fix double free when an irqfd is shut down twice
Date: Mon,  2 Nov 2026 00:31:07 +0800
Message-ID: <20261101163107.55037-2-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261101163107.55037-1-q.h.hack.winter@gmail.com>
References: <20261101163107.55037-1-q.h.hack.winter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1793550682-F66B52A1-24A86375/0/0
X-purgate-type: clean
X-purgate-size: 3803
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

irqfd_deactivate() takes the irqfd off irqfds_list and queues
irqfd_shutdown().  queue_work() is not a once-only gate: it refuses to
enqueue a work item only while WORK_STRUCT_PENDING is set, and
process_one_work() clears that bit before it calls the work function.  So
nothing records that the shutdown work has already been queued, and
nothing protects the window between the start of irqfd_shutdown() and the
kfree() at its end.

Two paths call irqfd_deactivate() for the same irqfd:

  - privcmd_irqfd_deassign(), from the PRIVCMD_IRQFD_FLAG_DEASSIGN ioctl;

  - irqfd_wakeup(), with EPOLLHUP set, when the last reference to the
    eventfd file goes away, which runs wake_up_poll(&ctx->wqh, EPOLLHUP)
    from eventfd_release().

irqfds_lock serialises the two calls, but it does not make the second one
a no-op, and eventfd_ctx_fdget() takes a reference to the eventfd_ctx,
not to the struct file, so the last fd can still be closed while the
ioctl is running:

  CPU0                                 CPU1

  eventfd_ctx_fdget()
  spin_lock(irqfds_lock)
  list_del_init(&kirqfd->list)
  queue_work(&kirqfd->shutdown)        close(fd)
                                         eventfd_release()
                                           wake_up_poll(EPOLLHUP)
                                         irqfd_wakeup()
                                         spin_lock(irqfds_lock)
                                         irqfd_deactivate() again

If the work item has already started by then, its pending bit has been
cleared and the second queue_work() succeeds.  irqfd_shutdown() then runs
twice, so eventfd_ctx_remove_wait_queue(), eventfd_ctx_put() and kfree()
each hit the same object a second time; and when the second queue_work()
lands after the irqfd has been freed, the workqueue list operations write
to freed memory.

virt/kvm/eventfd.c has the same two callers and has had this guard since
the original irqfd support (721eecbf4fe99): irqfd_wakeup() calls
irqfd_deactivate() only if irqfd_is_active().  The comment there explains
why that is enough: the other side deactivates the irqfd before it takes
it off the waitqueue, and irqfd_shutdown() needs the waitqueue lock,
which this callback holds, so the irqfd cannot be freed under it.

Do the same here.  list_del_init() leaves the list head empty and the
irqfd stays off the list until kfree(), so it serves as a one-way
"active" flag.  The test is in irqfd_deactivate() rather than in
irqfd_wakeup() because privcmd_irqfd_deassign() walks irqfds_list and can
therefore never reach an inactive irqfd; only the wakeup path can, and a
single test covers both callers.

Fixes: f8941e6c4c712 ("xen: privcmd: Add support for irqfd")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
 drivers/xen/privcmd.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 5e56fbc934478..221b31611343e 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -901,10 +901,25 @@ struct privcmd_kernel_irqfd {
 	poll_table pt;
 };
 
+static bool irqfd_is_active(struct privcmd_kernel_irqfd *kirqfd)
+{
+	lockdep_assert_held(&irqfds_lock);
+
+	return !list_empty(&kirqfd->list);
+}
+
 static void irqfd_deactivate(struct privcmd_kernel_irqfd *kirqfd)
 {
 	lockdep_assert_held(&irqfds_lock);
 
+	/*
+	 * Both the deassign ioctl and the eventfd wakeup path can reach
+	 * this function.  list_del_init() marks the irqfd inactive, so
+	 * only the first caller may queue the shutdown work.
+	 */
+	if (!irqfd_is_active(kirqfd))
+		return;
+
 	list_del_init(&kirqfd->list);
 	queue_work(irqfd_cleanup_wq, &kirqfd->shutdown);
 }
-- 
2.54.0 (Apple Git-157)


