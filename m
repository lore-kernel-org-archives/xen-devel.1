Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B394606A326
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 05:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N0DudzoL
Received: from list by lists.xenproject.org with outflank-mailman.1467337.1676729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNkw8-0002Ry-Kb; Mon, 02 Nov 2026 05:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467337.1676729; Mon, 02 Nov 2026 05:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNkw8-0002QZ-FN; Mon, 02 Nov 2026 05:50:28 +0000
Received: by outflank-mailman (input) for mailman id 1467337;
 Sun, 01 Nov 2026 16:33:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <q.h.hack.winter@gmail.com>) id 1xNYUd-0000vU-B9
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 16:33:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNYUc-008AOd-Kn
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 17:33:14 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <q.h.hack.winter@gmail.com>)
 id 6ae769c9-8faa-0a2a0a5109dd-0a2a4508e26e-4
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 17:33:14 +0100
Received: from [209.85.216.54] (helo=mail-pj1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <q.h.hack.winter@gmail.com>)
 id 6ae769c9-f659-0a2a45080019-d155d83694ac-3
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 17:33:14 +0100
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-3ac7a053626so299089a91.0
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 08:33:14 -0800 (PST)
Received: from localhost.localdomain ([113.102.236.131])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cdb0981c5desm2063394a12.27.2026.11.01.08.33.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 01 Nov 2026 08:33:11 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793550792; x=1794155592; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z1wgGnLaHoKZu2/+Ud078CAK3gozxrFVUFtZdHR2t7Q=;
        b=N0DudzoLzvEvhmUa69QzvvAg+oRZAWzhCFZ0kBIOMZWPy+2XcLfxE77rPtN5xA7VIC
         2Jd8d8rAiUCWgA3BrZ/yWfMvcccA67SoB6Y4EPg7vW2+U6JMk9wcB5lACvtqFtRdUZ9/
         02rLUiPxdwBeajrg1gaxlq7RgFgSpMydMAXGnrXGMmxfwOTgReYzWhXh8C3tUrnONjIj
         len+rMP/436mjiEUqwqT90eOvlkTcyK5Yk5oNbOWxZ8Ryy5vTwEqCyf025gO9ZCy6zUH
         DeB8A1CxxfeGfR7+CuslyKrdVBJ/U82LlmJ56bGkUKiOQPuwtuHDxbhDMS7aykGwQP5w
         FV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793550792; x=1794155592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1wgGnLaHoKZu2/+Ud078CAK3gozxrFVUFtZdHR2t7Q=;
        b=ovaeKCFZ95DwuJTlP5mUxphnJAHJQkd6uKUDIfIU3e7f4bed4u2Rf1YnsVT60KNjc9
         xTOGZm6/xAYxSkSj/QhmukbBqkAgJ1hBSqxZT8jT2fIGaYzKNLetKmEBsI67gIQnjcHu
         bF/x8jSUXKYFdlEqk/ogu/mbIvRDp+qiwRGSJt2AK69ycdK+vdA/XxMSQJwf9mhUtrie
         PwQGCXXUoH5UxW03Kb1KPBfYNwNJjvXWXLdkA7lKQxU31USsq7NEftPKBvdXqIS3v9eT
         gPoIlv7uh88vCHw6PqNSpOIdOLQixmxrZCev24zcO/3nkUwMQbXtNEGEqM/d3u03jS9Q
         YUuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuoOmhKcGZeFrCwKy7v5Dj21CNiUCJQu8FW1RtXGcsdkfFyVso+zsTUuNtvWmzaxfuyKiwJXJ89Hg=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9dYseak/X5FQIQM3BaqGUGE+OHyz7+qNHteIU+FMYbN0H/amS7
	WfkjtLMR6BdRWfIVtbIDrjGnyHAL456Pl9rKNGU1WwOW3yxplwVfeunj
X-Gm-Gg: AYBFou2iDDpb3J7TDrvMDh0KAq/luk1XbL6QbvcBNIJEPm/wM9GZw6yE8MAsUlR0J6S
	hR/wNVaomRKO9yiApJbu7yOqZG/OzbIB40h+nRaZfnqJ6/tioK+N8iMzbEcqxwVmpHPDH7HDcjB
	W+U0/padeych0R2yEV+PwguJnuHHuSv5QpfTVs1wvNE/PDAPVkXRspBxeFJKU8lauGcBZTTybWT
	lNCZdpirLs88NFMxjxUJTwi6EGttNHWaJbnMTS1L3Xd0zUrNzttxXXdrh77p/SDPBO8httqRBjo
	u8QI1XyDqXR1SDZZiDV12VacLpgypuOKGG+D3Bv1pvcdNtMSEj/Tcyv9Z0WMkEA2ae90LbiWpUs
	UP8YjU14b3+07blZDBQZUsPmwQlLV3oobHrUZaXtvJl2SCIbR7VbfGf4fcEiodn+U3EivY+8V4K
	1gjCuDE9OXpOTvFPm8LbbmEuAE/wwQSYlipyvQwgT+1NnWz/M/HVGMVv7gw9QQ7hqL2tJVto032
	43iBFBD5PTNpekRKijlIIgP2eiQ2CgldjO7J3OCwwdJ2sJB8Rr2h5sJ9zVYbTcjAj2T+UP+T63h
	vNMtnuRhol7urIPUF1+nrMWw1/p2zwdBeh+XzXGDrZppE91KaL31PdatLVkKNoNWpkAx7HyE6kY
	fKIPJudAmRvS+XiLsSzKOdyw=
X-Received: by 2002:a17:90b:1808:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3ae895f8623mr10840887a91.2.1793550792550;
        Sun, 01 Nov 2026 08:33:12 -0800 (PST)
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
Date: Mon,  2 Nov 2026 00:32:50 +0800
Message-ID: <20261101163251.55099-1-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793550794-DFED287B-71E345AD/0/0
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


