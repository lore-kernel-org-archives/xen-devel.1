Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0795606A323
	for <xen-devel@archiver.kernel.org>; Sun,  8 Nov 2026 22:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PKXJu6Xa
Received: from list by lists.xenproject.org with outflank-mailman.1479089.1683164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQBYJ-00052r-3g; Sun, 08 Nov 2026 22:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479089.1683164; Sun, 08 Nov 2026 22:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQBYJ-00052i-0Z; Sun, 08 Nov 2026 22:39:55 +0000
Received: by outflank-mailman (input) for mailman id 1479089;
 Sun, 08 Nov 2026 22:39:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3NvrwagcKCU0x63vt67v33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@flex--irogers.bounces.google.com>)
 id 1xQBYH-0004zO-SL
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2026 22:39:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQBYH-001umh-9K
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2026 23:39:53 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3NvrwagcKCU0x63vt67v33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@flex--irogers.bounces.google.com>)
 id 6af0fa07-8faa-0a2a0a5109dd-0a2a450c92d6-16
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 23:39:53 +0100
Received: from [74.125.82.198] (helo=mail-dy1-f198.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3NvrwagcKCU0x63vt67v33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@flex--irogers.bounces.google.com>)
 id 6af0fa37-f479-0a2a450c0019-4a7d52c6d555-3
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 23:39:53 +0100
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-341eff9e381so790863eec.1
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 14:39:52 -0800 (PST)
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
        d=google.com; s=20260707; t=1794177591; x=1794782391; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1jLuLVTWvALNpXpZUUQEWDLYzqr+bz7MlMjOt9nJBI=;
        b=PKXJu6XaD5qSFk1S0bmI9QdYU5P/VcxUDIFeBzwtN0IzGaATvqRJYUXJimfHe7NO6V
         aR/eNwGNNnGD12fIsc1GV3e9owrjb4L04deKlZABdCoCJQpdXc5n69qft+kDLtsXxSHE
         iQUfQh/u/0/LO+Wo9TSYtmeaSI6kGhYKwuhYnpVTGU+Mfv3RfQuh0MObydJrnS0tytX9
         dNfGL0nf4a2FC4Rd76E7gCoFjVm8FJzrKjq3acHqCCNaEV3pBTbhQkk3nRHalSSR/umM
         8C+JGs+MZGiMTWIqJeHPjk1nLjNl98D+Hx/1DkvtXy3YH2mcUPDIKi1Gxatxqm/Bzzjq
         RseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177591; x=1794782391;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1jLuLVTWvALNpXpZUUQEWDLYzqr+bz7MlMjOt9nJBI=;
        b=g9E5xWzXNCxqLN6UU1Pk0linf9vJF4vd8NeCIY8Th2ZiRBX9aoN2dhV5RBAEP1CFc6
         c2iQDRgja9LReznG0pJPDQmwYqhpjVTlxNhZ2fucrKbil38AmWPPn4MFJwB5Xn9EEyR3
         qx/pmHIwEIbIti7sSkPi01ppNOKkOh9zBBPrKNlY1xs0m5w1F9J/HnKixZE3PeEVad96
         HI0v11wkLL8TJhTPQARAMH2YC8pYVBTr4lP+upcy7XmF7GLsfjzxL9RVZmyTlBEAidBr
         F2Vr/utMEVNIOW6fjpupiqbPsNz0ho4oEw1UgrUtBMgm6FDBiJCztQeJz4I50DLiHxac
         1Spw==
X-Forwarded-Encrypted: i=1; AL+hErGFGven6n8gGY8RXp+vL3L7gTM13AqmPvs6itD2MumzV93rdqDhbFs6tS9l2aipZw5QPGudpSbZ8Cs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z836F2b+r6pRTVEWVbY8GDEZS4evEt7KfRtqVk7/jxz8317WnZb
	kNavBNpF0HCooBldL9CRUcwX0SCXSG+YpZUKG3uQjN5l4GJQEulkovfLYH0GbEYsYdVB/FA+fO9
	GvoVfV/8IZA==
X-Received: from dycmv11.prod.google.com ([2002:a05:693c:280b:b0:36b:c499:531f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2806:b0:36b:f09f:924a
 with SMTP id 5a478bee46e88-37256bef587mr4546874eec.14.1794177590507; Sun, 08
 Nov 2026 14:39:50 -0800 (PST)
Date: Sun,  8 Nov 2026 14:39:09 -0800
In-Reply-To: <20261108223913.3624571-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108223913.3624571-6-irogers@google.com>
Subject: [PATCH v3 5/9] dlm: Free dlm_ls in kobject release callback
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
X-purgate-ID: tlsNG-d25034/1794177593-018C5A5B-FCC4F543/0/0
X-purgate-type: clean
X-purgate-size: 4546
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

struct dlm_ls embeds a struct kobject (ls_kobj), but dlm_ktype lacked a
.release callback and dlm freed the lockspace structure directly via
kfree(ls). With CONFIG_DEBUG_KOBJECT_RELEASE=y, freeing ls before the
delayed kobject release runs causes a use-after-free, and unloading the
module while the delayed release is pending results in an instruction
page fault.

Add a completion ls_kobj_done and dlm_ls_release() to complete it when
the last kobject reference is dropped, waiting for it in free_lockspace()
before kfree(ls) and in the new_lockspace() error path before module_put().
Also delete the kobject via kobject_del() before stopping dlm_recoverd
to close the window where concurrent sysfs writes could wake the stopped
recovery task.

Fixes: 3514faca19a6 ("kobject: remove struct kobj_type from struct kset")
Acked-by: Alexander Aring <aahringo@redhat.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 fs/dlm/dlm_internal.h |  1 +
 fs/dlm/lockspace.c    | 26 ++++++++++++++++++++------
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 74c2e77d1b55..95b3bff0cb57 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -576,6 +576,7 @@ struct dlm_ls {
 	int			ls_create_count; /* create/release refcount */
 	unsigned long		ls_flags;	/* LSFL_ */
 	struct kobject		ls_kobj;
+	struct completion	ls_kobj_done;
 
 	struct xarray		ls_lkbxa;
 	rwlock_t		ls_lkbxa_lock;
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index a9c98b4f378f..2dccd080a10f 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -179,7 +179,15 @@ static const struct sysfs_ops dlm_attr_ops = {
 	.store = dlm_attr_store,
 };
 
+static void dlm_ls_release(struct kobject *kobj)
+{
+	struct dlm_ls *ls = container_of(kobj, struct dlm_ls, ls_kobj);
+
+	complete(&ls->ls_kobj_done);
+}
+
 static struct kobj_type dlm_ktype = {
+	.release        = dlm_ls_release,
 	.default_groups = dlm_groups,
 	.sysfs_ops     = &dlm_attr_ops,
 };
@@ -355,6 +363,8 @@ static void free_lockspace(struct work_struct *work)
 	 */
 	rhashtable_free_and_destroy(&ls->ls_rsbtbl, rhash_free_rsb, NULL);
 
+	kobject_put(&ls->ls_kobj);
+	wait_for_completion(&ls->ls_kobj_done);
 	kfree(ls);
 }
 
@@ -435,7 +445,10 @@ static int new_lockspace(const char *name, const char *cluster,
 	ls->ls_lvblen = lvblen;
 	atomic_set(&ls->ls_count, 0);
 	init_waitqueue_head(&ls->ls_count_wait);
+	init_completion(&ls->ls_kobj_done);
 	ls->ls_flags = 0;
+	ls->ls_kobj.kset = dlm_kset;
+	kobject_init(&ls->ls_kobj, &dlm_ktype);
 
 	if (ops && dlm_config.ci_recover_callbacks) {
 		ls->ls_ops = ops;
@@ -567,9 +580,7 @@ static int new_lockspace(const char *name, const char *cluster,
 	wait_event(ls->ls_recover_lock_wait,
 		   test_bit(LSFL_RECOVER_LOCK, &ls->ls_flags));
 
-	ls->ls_kobj.kset = dlm_kset;
-	error = kobject_init_and_add(&ls->ls_kobj, &dlm_ktype, NULL,
-				     "%s", ls->ls_name);
+	error = kobject_add(&ls->ls_kobj, NULL, "%s", ls->ls_name);
 	if (error)
 		goto out_recoverd;
 	kobject_uevent(&ls->ls_kobj, KOBJ_ADD);
@@ -582,7 +593,7 @@ static int new_lockspace(const char *name, const char *cluster,
 
 	error = do_uevent(ls, 1, 0);
 	if (error < 0)
-		goto out_recoverd;
+		goto out_kobj;
 
 	/* wait until recovery is successful or failed */
 	wait_for_completion(&ls->ls_recovery_done);
@@ -600,6 +611,8 @@ static int new_lockspace(const char *name, const char *cluster,
 	do_uevent(ls, 0, 0);
 	dlm_clear_members(ls);
 	kfree(ls->ls_node_array);
+ out_kobj:
+	kobject_del(&ls->ls_kobj);
  out_recoverd:
 	dlm_recoverd_stop(ls);
  out_callback:
@@ -615,6 +628,7 @@ static int new_lockspace(const char *name, const char *cluster,
 	rhashtable_destroy(&ls->ls_rsbtbl);
  out_lsfree:
 	kobject_put(&ls->ls_kobj);
+	wait_for_completion(&ls->ls_kobj_done);
 	kfree(ls);
  out:
 	module_put(THIS_MODULE);
@@ -740,6 +754,8 @@ static int release_lockspace(struct dlm_ls *ls, unsigned int release_option)
 	    dlm_user_daemon_available())
 		do_uevent(ls, 0, (release_option == DLM_RELEASE_RECOVER));
 
+	kobject_del(&ls->ls_kobj);
+
 	dlm_recoverd_stop(ls);
 
 	/* clear the LSFL_RUNNING flag to fast up
@@ -759,8 +775,6 @@ static int release_lockspace(struct dlm_ls *ls, unsigned int release_option)
 
 	dlm_delete_debug_file(ls);
 
-	kobject_put(&ls->ls_kobj);
-
 	xa_destroy(&ls->ls_recover_xa);
 	kfree(ls->ls_recover_buf);
 
-- 
2.56.0.455.g6c5a503b38-goog


