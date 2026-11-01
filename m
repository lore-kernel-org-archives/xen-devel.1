Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABF4606A327
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 05:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t+qS3Kmr
Received: from list by lists.xenproject.org with outflank-mailman.1467332.1676719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNkw8-0002LL-4D; Mon, 02 Nov 2026 05:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467332.1676719; Mon, 02 Nov 2026 05:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNkw8-0002LE-0l; Mon, 02 Nov 2026 05:50:28 +0000
Received: by outflank-mailman (input) for mailman id 1467332;
 Sun, 01 Nov 2026 16:31:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <q.h.hack.winter@gmail.com>) id 1xNYSl-0000tZ-Rt
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 16:31:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNYSl-006pyT-8x
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 17:31:19 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <q.h.hack.winter@gmail.com>)
 id 6ae76940-2eae-0a2a0a5409dd-0a2a4503b2c2-16
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 17:31:19 +0100
Received: from [209.85.216.43] (helo=mail-pj1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <q.h.hack.winter@gmail.com>)
 id 6ae76955-fae8-0a2a45030019-d155d82b9ade-3
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 17:31:19 +0100
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-3ad0c2e71ebso397165a91.2
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 08:31:18 -0800 (PST)
Received: from localhost.localdomain ([113.102.236.131])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ae6e944ba9sm15038585a91.8.2026.11.01.08.31.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 01 Nov 2026 08:31:16 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1793550677; x=1794155477; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z1wgGnLaHoKZu2/+Ud078CAK3gozxrFVUFtZdHR2t7Q=;
        b=t+qS3KmrGZsUjv/mhney5ZVlDlj8OOOx3Auq1Pk2R3EDzUKVdVVhexbjm6WcQXSrin
         a0qiVScCcdELyx3tXO7T1KcH/ZJg7LTjLlsf+ic+GCI67yjAKFCVmxBBVd+0ryP8DvIO
         VGlNIEY9gTbcFYEdkrNYCg1bMMZWl57Vp/udKMycEYqbyeeLQ7Ldf/BecMdrKykiqORL
         HHFIxFe7Wvi/iuVezM+K/yM4vlK2taBaBwkrD9Vhww/ayzCe/9FpsPXeFCrgb/OzkNax
         1T1LqzYJdwg0Z+SMDxx75R9fnkXTj7Ce1+cuGh8Xh3ljwpHbgXpxLKi1PhCzfyZcTFeC
         TlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793550677; x=1794155477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1wgGnLaHoKZu2/+Ud078CAK3gozxrFVUFtZdHR2t7Q=;
        b=XlzAiB/pvTa3ZeLB//NOIxrPuuifDMt9w+CTOE8koDT70hqR79yZ7cq9UTe4ok7pGF
         Bq1KcMydKOR9XOIvOypyIteKze0m57yyQWuzxPCVJRV0cvCHQtjvLwbdpbXW0HvdOEbS
         6geM80YkzkJGtaXmfWwwinlg2RdWt3L60QMmR+aI7hyvQwjrFtb0Tv9zY7D/W8BjWHpH
         8sh6q51PUeiR8yA2/45VGpLQlnOWJLTzuudiBv3BQzTh3Ft4Gj3iT3xvB+nektFZD5GO
         QKf62MFebUkdiQ0lUdxmc+zehabC9G7CeqGb6VRN+1z7EUUyOxOAtQsfWzP9/QldVH0e
         brIg==
X-Forwarded-Encrypted: i=1; AKwUvBybdoC8CUu1DfRxOtbQDOT1nCBC41uJQFi7ybMEAAo4UXLWcfAGOTqUQtXA6fkMy8MvWKT4BrD2LAw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8puQY0GXWhzarzwzFTk7/vy4ekURnZ1zFkxzWY0kacupHPzhfT
	E0yslraz6MkwVLONUoULNAc0hAcxj1w6tV07cpDddGXFUXuNk/hu1fWr
X-Gm-Gg: AYBFou0wvSrlNo/MEWIqXEmizeMgudEA3/MUZBNTx2QbdE/IcMm0sSXZaVvrX3BYnSs
	uqujatb0PVxEIb7CJT3lq7Jr79bwvIIEi2MViTpi1LD36NNs9sFzvmSMPZUmE1mE9l9WZJOhbdJ
	E6OX7jjKdHSZ0OpE1HTOseOQOuHmVnsJZcZIL3d/5s4zVnwFSyIGH8bpAwIllSF6QAderQXqBpQ
	sf41v1WioSvUsLzCgNs1F75y6hqEUqSRF9ufRmdzGjiQTctnFq2tpH0cIjJQyFUorN6kKqAsKe8
	xZt8L0ACd7yXX2pVQuYzXHLkc3uWUuXZHSNINzz/bMivE3FMpXZc/OEGAu0/j0SpA7hP7KMBIZi
	Muj1B1T81aGdLSFuYQsMx7MgxuwgXeY12kPMeZW1emmnx3dgGrER9+AW5ljXTQFuRdt7J0TojYB
	MKiJSyqP0dfkUzXTEISLeeq9XGRz6iM5rbnSkZoS/mmzkxLybwJVTK2+5wbFSaFpFicsyTbdREV
	ixJxMj2G4rx/1VJBhCHAlOOk2WzF8FBgfETUkVZpHLDVANUVniyX4Ozp/3wXHVTXFhMWNv+m8xQ
	GzWo1Phw4VeVW6MBt7D+f9U8Z9juDNMaW1NAV5K8oRl3Hn/6OwHiFpH98BHqSN+W7NkWVcuSTNB
	vDlK40w8EmQRWt8CK3edLdFo=
X-Received: by 2002:a17:90b:2cc6:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3ae89292da7mr11229213a91.0.1793550676949;
        Sun, 01 Nov 2026 08:31:16 -0800 (PST)
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
Date: Mon,  2 Nov 2026 00:31:06 +0800
Message-ID: <20261101163107.55037-1-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1793550679-6ECCB4E9-D6AF225B/0/0
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


