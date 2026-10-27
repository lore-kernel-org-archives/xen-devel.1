Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4977C60A2609
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 22:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HZ9h/KBB
Received: from list by lists.xenproject.org with outflank-mailman.1462702.1673744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLppR-0002il-FM; Tue, 27 Oct 2026 22:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462702.1673744; Tue, 27 Oct 2026 22:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLppR-0002iS-95; Tue, 27 Oct 2026 22:39:37 +0000
Received: by outflank-mailman (input) for mailman id 1462702;
 Tue, 27 Oct 2026 22:39:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3JCjhagcKCVc7GD53GH5DD5A3.1DBM3C-23K3AA7HIH.M3CEGD831I.DG5@flex--irogers.bounces.google.com>)
 id 1xLppP-0002Zb-9i
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:39:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLppO-00BmpO-Mq
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 23:39:34 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3JCjhagcKCVc7GD53GH5DD5A3.1DBM3C-23K3AA7HIH.M3CEGD831I.DG5@flex--irogers.bounces.google.com>)
 id 6ae1281f-8faa-0a2a0a5109dd-0a2a4505c02c-8
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 23:39:34 +0100
Received: from [74.125.82.197] (helo=mail-dy1-f197.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3JCjhagcKCVc7GD53GH5DD5A3.1DBM3C-23K3AA7HIH.M3CEGD831I.DG5@flex--irogers.bounces.google.com>)
 id 6ae12825-4cb1-0a2a45050019-4a7d52c5dc58-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 23:39:34 +0100
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-359b81ad4e8so403043eec.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 15:39:34 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=google.com header.i="@google.com" header.h="Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793140772; x=1793745572; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTMJFM/nqHoym7HFBiG90k6OXEIlh5WHZZg+1coUz9A=;
        b=HZ9h/KBBjcX7LR7MrsmMhLcJA52iIOj+wmYstaKgzFJFQx/dQRt0mjyP2WR3/vY7Js
         svelE5YZ3GDF+jJ5k4I3PLMgEb/QelGKlkJK0uZu9E9XrBXIuSSPKQlqWX7OCtydB8V4
         yUAL8TTYZ5tYF7GwVXMq1JcKd+LKWaBzzmU8iGijxekax7Onj5V4FEPRYNhIoulGB78H
         HDY0yaJoBq2lJe3r82CCO6euoogEHcT6eNTE5yycrGjGTV1oqGsWz9El3pnqZIclnxEq
         HWRzf1NgA4NOZxIk2WK5C0IqtUzr+NOIVaHcP/qK1IHVrChogy8n1cq5VcnHFONe+zZb
         xCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140772; x=1793745572;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTMJFM/nqHoym7HFBiG90k6OXEIlh5WHZZg+1coUz9A=;
        b=ZWJL8t5zNrHEL1eaFPaO6eb1SrfAIcEIohawBUyVMixr0MNlLm917idhGnTQ5p57X+
         Y3NOcB3AKmvoFMTVGFVqIqmTJeuBUnmc8xbfAUO+bCTew5BlMYTfYZ9p2lhMlkj1K51q
         xfuyFLYPZnV8nvgjdN+ls4PfGn3lUDp1RbLL7So28rPQ046U/6sMIWFeUFlmILlke0Q5
         hATQTzopwJMnmeQ6nh5dKVotXpUG+Q3V3KQifhlda1tRSl6j+R7PwkrDy9bEVHoGkwpr
         QzBR5XsXzlO31HhQHGXs5vPWlfVBL+RrPyeQGwB2Bboh8LPZeZTCh526uZ0pZczyVvJy
         6EeA==
X-Forwarded-Encrypted: i=1; AKwUvBwgyLLo8eCssHdZCrbXwNn8Xx/SBcpMucllI+GySgZnfBquOkn4CnhGlcVcWqLFAtQTw4gjJd9/liI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK0oCDB6fNig1mi0YrD/tMgfMGWLPnHxfgbXPnU5VP3H1qH04sH
	Sk++VKQdHGwDEoDNxjlpnOx66y7pTPT+d++/f58YA50YCOYPRKjQMMxzeE9lEQeq+A6bG1BEGdX
	yRRG3nRJQGg==
X-Received: from dlea12-n1.prod.google.com ([2002:a05:701b:420c:10b0:1a4:c892:b166])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2813:b0:143:6525:f9f6
 with SMTP id a92af1059eb24-1a6cd3a1575mr630918c88.13.1793140772067; Tue, 27
 Oct 2026 15:39:32 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:38:43 -0700
In-Reply-To: <20261027223847.652884-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027223847.652884-9-irogers@google.com>
Subject: [PATCH v2 8/9] drm/amdkfd: Free queue in procfs_queue_type kobject
 release callback
From: Ian Rogers <irogers@google.com>
To: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Amber Lin <Amber.Lin@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c201ff/1793140774-738BE2A1-DF6C480E/0/0
X-purgate-type: clean
X-purgate-size: 2750
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

struct queue embeds a struct kobject (q->kobj) for procfs entries, but
procfs_queue_type had no .release callback and uninit_queue() freed q
immediately after kfd_procfs_del_queue() called kobject_put(&q->kobj).
With CONFIG_DEBUG_KOBJECT_RELEASE=y, this causes a use-after-free.

Add kfd_procfs_queue_release() to free struct queue from the kobject
release callback, change kfd_procfs_del_queue() to only remove the
kobject from sysfs via kobject_del(), and drop the final reference in
uninit_queue() via kobject_put(). Check q->kobj.state_in_sysfs before
calling kobject_del() in kfd_procfs_del_queue() to avoid warnings if
sysfs creation previously failed.

Fixes: 6d220a7e7971 ("drm/amdkfd: Add queue information to sysfs")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 12 +++++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c   |  5 ++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 226f52626e84..8e6136d52a50 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -512,7 +512,15 @@ static const struct sysfs_ops procfs_queue_ops = {
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
@@ -552,7 +560,6 @@ int kfd_procfs_add_queue(struct queue *q)
 	if (ret < 0) {
 		pr_warn("Creating proc/<pid>/queues/%u failed",
 			q->properties.queue_id);
-		kobject_put(&q->kobj);
 		return ret;
 	}
 
@@ -697,11 +704,10 @@ static void kfd_procfs_add_sysfs_files(struct kfd_process *p)
 
 void kfd_procfs_del_queue(struct queue *q)
 {
-	if (!q || !q->process->kobj)
+	if (!q || !q->process || !q->process->kobj || !q->kobj.state_in_sysfs)
 		return;
 
 	kobject_del(&q->kobj);
-	kobject_put(&q->kobj);
 }
 
 int kfd_process_create_wq(void)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_queue.c b/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
index ae3e7c54014a..4666110aebe0 100644
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
2.56.0.313.g2479322e68-goog


