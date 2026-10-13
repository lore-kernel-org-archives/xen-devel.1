Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A1ECC6B12
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 22:40:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448337.1664372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGlAm-0007tN-AS; Tue, 13 Oct 2026 22:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448337.1664372; Tue, 13 Oct 2026 22:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGlAm-0007tG-7i; Tue, 13 Oct 2026 22:40:40 +0000
Received: by outflank-mailman (input) for mailman id 1448337;
 Tue, 13 Oct 2026 22:40:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3Y7POagcKCWIIROGERSGOOGLE.COMXEN-DEVELLISTS.XENPROJECT.ORG@flex--irogers.bounces.google.com>)
 id 1xGlAk-0007pR-SP
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 22:40:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGlAk-009GuA-2U
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 00:40:38 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3Y7POagcKCWIIROGERSGOOGLE.COMXEN-DEVELLISTS.XENPROJECT.ORG@flex--irogers.bounces.google.com>)
 id 6aceb34e-8faa-0a2a0a5109dd-0a2a4509c84a-12
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 00:40:38 +0200
Received: from [74.125.82.70] (helo=mail-dl1-f70.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3Y7POagcKCWIIROGERSGOOGLE.COMXEN-DEVELLISTS.XENPROJECT.ORG@flex--irogers.bounces.google.com>)
 id 6aceb364-be1a-0a2a45090019-4a7d5246c420-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 00:40:37 +0200
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-1663fb7e005so4564876c88.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 15:40:37 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931236; x=1792536036; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5eLIAAx2L+9DvCRKYW0jDBbtdiyv3jUNIhafttj/B0g=;
        b=WVfjU86RK8GWjB2A/gzsaiso4A+6/lpvBTmjDqf9xL/Jo1Yf3xtV1qdwwC16D9v95N
         3WBf9pGGAKr1f15dS/OGqx2D6FAVDTUepiAW3o+S8VLIobLDnQ3YOK8GOPBCQokSnGEM
         aKkvHoiznv9cioAXQAhNyZMMevlFPSH9wctxnJCq4LCeM5nSPHLYd5K6CZVDxwk59NeR
         eXxNhJ8t2VnN8DehSJhxapF96YxV7BbinPz5FTdjOYgkoyERRlRMqzKNEV/r7M7YdakE
         /eSq73Ay9yFv5AogZDZlETMDncH1cr/dcloTNwfK0B5LDHDrLsg5wGgmaG5vGbaxtVdx
         T04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931236; x=1792536036;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5eLIAAx2L+9DvCRKYW0jDBbtdiyv3jUNIhafttj/B0g=;
        b=s2OpxmNm6VhYRfulJ3RFitgOojvkNhopJxisotRipOx3cfxxPM6b9e5QhsLGnAm63B
         aZcEPD1WIjdFGi9E58X68PKzvPTiZ5t2Q8mbMxdDJ7v4UQ90Rq5jmFMVB5YAvwJaz2vJ
         +59ucrm0O6os8SLVUX51drP6feRUsn1UwrFNRXpgoe93xrNS1sc0GzpHN25r5XG1GaIb
         hlh4mknT7Y5ND8TCG6KPrHdhaLSRkCwfMYVc55atJIe1OkGkJItXchRsBWPwHP9p1dlq
         bMTHp1jVjJNH4Iv5vBT12tIbqhwznns1WDyRAzd4S19H9Rsl5ysYIk7mzOupMwIK9sXh
         Y2uQ==
X-Forwarded-Encrypted: i=1; AKwUvBw32FTv72yeIZ/4UJkJRzZ35A6JXZbGjr+n/fKzym+0+cjt825gqv8oR85tBp4r1MLLadcB31yCa/8=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLPhwBiEsPv7VOFVB2pZw6U7yvM5bl4HHGgf75Q/2IEtl1LKLGr
	QAU4MeVLhE6V+RMOLSrfR0+1Rj9mBqFN4vYKBuxXItO6y+4Zhx5cn9FFNQgnGEP2Og8HpBopV4O
	btHKNxpaXyQ==
X-Received: from dlbuu9.prod.google.com ([2002:a05:7022:7e89:b0:16c:bd18:1ee2])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:231b:b0:165:55e2:2d69
 with SMTP id a92af1059eb24-16a640fcc35mr21018967c88.46.1791931235508; Tue, 13
 Oct 2026 15:40:35 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:45 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-11-irogers@google.com>
Subject: [PATCH 10/11] drm/amdkfd: Free queue in procfs_queue_type kobject
 release callback
From: Ian Rogers <irogers@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-bad1c0/1791931238-BDEC6034-B6F97FF2/0/0
X-purgate-type: clean
X-purgate-size: 2469

struct queue embeds a struct kobject (q->kobj) for procfs entries, but
procfs_queue_type had no .release callback and uninit_queue() freed q
immediately after kfd_procfs_del_queue() called kobject_put(&q->kobj).
With CONFIG_DEBUG_KOBJECT_RELEASE=y, this causes a use-after-free.

Add kfd_procfs_queue_release() to free struct queue from the kobject
release callback, change kfd_procfs_del_queue() to only remove the
kobject from sysfs via kobject_del(), and drop the final reference in
uninit_queue() via kobject_put().

Fixes: 6d220a7e7971 ("drm/amdkfd: Add queue information to sysfs")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 10 ++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c   |  5 ++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 0a7c1900da95..6099cb893573 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -510,7 +510,15 @@ static const struct sysfs_ops procfs_queue_ops = {
 	.show = kfd_procfs_queue_show,
 };
 
+static void kfd_procfs_queue_release(struct kobject *kobj)
+{
+	struct queue *q = container_of(kobj, struct queue, kobj);
+
+	kfree(q);
+}
+
 static const struct kobj_type procfs_queue_type = {
+	.release = kfd_procfs_queue_release,
 	.sysfs_ops = &procfs_queue_ops,
 	.default_groups = procfs_queue_groups,
 };
@@ -550,7 +558,6 @@ int kfd_procfs_add_queue(struct queue *q)
 	if (ret < 0) {
 		pr_warn("Creating proc/<pid>/queues/%u failed",
 			q->properties.queue_id);
-		kobject_put(&q->kobj);
 		return ret;
 	}
 
@@ -699,7 +706,6 @@ void kfd_procfs_del_queue(struct queue *q)
 		return;
 
 	kobject_del(&q->kobj);
-	kobject_put(&q->kobj);
 }
 
 int kfd_process_create_wq(void)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_queue.c b/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
index 15eeaaebbbcd..8d1afc5b47e2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
@@ -83,7 +83,10 @@ int init_queue(struct queue **q, const struct queue_properties *properties)
 
 void uninit_queue(struct queue *q)
 {
-	kfree(q);
+	if (q && q->kobj.state_initialized)
+		kobject_put(&q->kobj);
+	else
+		kfree(q);
 }
 
 #if IS_ENABLED(CONFIG_HSA_AMD_SVM)
-- 
2.56.0.385.gd3acb90ef8-goog


