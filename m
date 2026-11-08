Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F37606A320
	for <xen-devel@archiver.kernel.org>; Sun,  8 Nov 2026 22:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HNcrJQCI
Received: from list by lists.xenproject.org with outflank-mailman.1479096.1683191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQBYP-0005pw-0X; Sun, 08 Nov 2026 22:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479096.1683191; Sun, 08 Nov 2026 22:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQBYO-0005pn-Tt; Sun, 08 Nov 2026 22:40:00 +0000
Received: by outflank-mailman (input) for mailman id 1479096;
 Sun, 08 Nov 2026 22:39:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3PPrwagcKCVM3C91zCD19916z.x97Iz8-yzGz663DED.Iz8AC94zxE.9C1@flex--irogers.bounces.google.com>)
 id 1xQBYN-0005fZ-GV
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2026 22:39:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQBYM-008sfu-TZ
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2026 23:39:58 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3PPrwagcKCVM3C91zCD19916z.x97Iz8-yzGz663DED.Iz8AC94zxE.9C1@flex--irogers.bounces.google.com>)
 id 6af0fa3e-2eae-0a2a0a5409dd-0a2a4509d77c-0
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 23:39:58 +0100
Received: from [74.125.82.200] (helo=mail-dy1-f200.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3PPrwagcKCVM3C91zCD19916z.x97Iz8-yzGz663DED.Iz8AC94zxE.9C1@flex--irogers.bounces.google.com>)
 id 6af0fa3d-be1a-0a2a45090019-4a7d52c8a572-3
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 23:39:58 +0100
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-3724667bc16so320826eec.1
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 14:39:58 -0800 (PST)
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
        d=google.com; s=20260707; t=1794177597; x=1794782397; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmJ3SdTe6uZnhzgZJuKjeaRKDfWwuPiS9sl/mhr3vm4=;
        b=HNcrJQCIl3w6qNW1TBLAg80f76cAhykuEn8nWkucOtzqdD/cIa8aGokSX7rsoOfNr6
         9URi2u+RdnoHA6xIZ1xk1Dv9rAg86lWK0NIjyCgQ6W0n95hR2sh3Y0pWjnc5Ffnowl//
         SvCJnWB7TwldqW431/gEo3q0Ia7UgSqAq8G4XIXNbPnfeAzil1Oejo40tJ5rgFI8B/PX
         rvkq+MxZacbPG1V1TsbBvakgIeg+AxDQfCyfR2OgJJ+ywA7eHbB3BQK1jpWBauxaNZc4
         yWEEqY2RnpRJF+408i91qJ1TmJfH8Ia2wYkkXRqwJ2ktzvdiX99m+ueaeyr+eFtdUcgk
         CdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177597; x=1794782397;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmJ3SdTe6uZnhzgZJuKjeaRKDfWwuPiS9sl/mhr3vm4=;
        b=hTMbHOjfpSXpdh+yhdsEDoU1bhRrV3DHPalATqNBzE8Iq7B7CA/pRvINz0tr+Tg+sS
         zJ+YVfdx6TE2j0p0qAgPLNEMhRh2/I/aDJ1xMgeKOVrTPuA+Ccg4y/CXubS8Sg8pd3Su
         7JYtElxHXXSDww7NpChIIeMytStEzqvApXPZAMdBztAtr3DRNWaoLu125qMsqZtS7cTK
         0zC4s0DwzRu3j7+FxnvouBxfdbrrH9mj0Ssu971Erx8+ccbxIoDrZR/UO6OZPqjRzour
         +B5eraqn5LMOQ/5HOryDl5dQyeixoiIEbY/9ZH34Tmw9NZiR3NjUllLnOKtcA9Zf7KT8
         CGqQ==
X-Forwarded-Encrypted: i=1; AL+hErGklJI/8fBo5oYGcXhZF3GOa32s5EuTj7USg0SUPESc3E5xanQqNrySC8DS47tDbSUj5DP+V758niE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+qCLBq9+a/uI3unHPxiygsDUWvpuj2Od11iLwCC1CgQ8ljauYi
	LCwwYZ314wlxWAOpIDf48RZzHaX1G1pE1m6esPt1FZDKz1iI5Pb45MkxyQnmGReuyHCGVOWBvi9
	BcdyOPnOReg==
X-Received: from dyz23.prod.google.com ([2002:a05:693c:4097:b0:369:7ef0:57b0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:9a90:b0:36d:38e0:79f3
 with SMTP id 5a478bee46e88-370f8170ddamr8689075eec.25.1794177596308; Sun, 08
 Nov 2026 14:39:56 -0800 (PST)
Date: Sun,  8 Nov 2026 14:39:12 -0800
In-Reply-To: <20261108223913.3624571-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108223913.3624571-9-irogers@google.com>
Subject: [PATCH v3 8/9] drm/amdkfd: Free queue in procfs_queue_type kobject
 release callback
From: Ian Rogers <irogers@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-bad1c0/1794177598-FC212034-AAA936D3/0/0
X-purgate-type: clean
X-purgate-size: 2804
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
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 12 +++++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c   |  5 ++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 6663718fb83c..b349e0d8d47b 100644
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
index 6010a5d7a7eb..f7413d651620 100644
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
2.56.0.455.g6c5a503b38-goog


