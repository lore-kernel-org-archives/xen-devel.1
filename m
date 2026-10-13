Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5E3CC6B15
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 22:44:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448372.1664408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGlEd-0002Gg-Qq; Tue, 13 Oct 2026 22:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448372.1664408; Tue, 13 Oct 2026 22:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGlEd-0002GZ-Nq; Tue, 13 Oct 2026 22:44:39 +0000
Received: by outflank-mailman (input) for mailman id 1448372;
 Tue, 13 Oct 2026 22:44:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3YLPOagcKCV8FOLDBOPDLLDIB.9LJUBK-ABSBIIFPQP.UBKMOLGB9Q.LOD@flex--irogers.bounces.google.com>)
 id 1xGlEc-0002Fs-K6
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 22:44:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGlEc-00A5xn-17
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 00:44:38 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3YLPOagcKCV8FOLDBOPDLLDIB.9LJUBK-ABSBIIFPQP.UBKMOLGB9Q.LOD@flex--irogers.bounces.google.com>)
 id 6aceb441-e002-0a2a0a5209dd-0a2a45088676-20
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 00:44:38 +0200
Received: from [74.125.82.71] (helo=mail-dl1-f71.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3YLPOagcKCV8FOLDBOPDLLDIB.9LJUBK-ABSBIIFPQP.UBKMOLGB9Q.LOD@flex--irogers.bounces.google.com>)
 id 6aceb364-f659-0a2a45080019-4a7d5247b464-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 00:40:37 +0200
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-1665200f4c2so4837985c88.0
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
        d=google.com; s=20251104; t=1791931235; x=1792536035; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gurzTkqqRagMZrBgJFBCVz7i93uSa3r8+lp0iuHqO9A=;
        b=BWmFxJzxUz7vC/efRk6VrtLsD1knKxkdFUm98UWWO2X9S6/2hE6fPjgmbxczbbMEd3
         7mYQG2/huk1DrZMOchPbMN5147owBZ0irLigfn6JJsQbbtsS/OmjZuOxTYkM9Ch+R9PA
         6SFB99UDSykCWXLmaD+1CRwvjasfHSityTg3WrlWtSGsBPo7ZAJryacqyJ3Td1Jajxb0
         nIG7uul4U8URZduDqlhRwOmlmR1jNkUz4nl9C/TmZW+5w1/41aL/kd2S8MIbip+ZafNg
         NwzGjLvywEO/WnsPCCFxk8VJFLtnoynIlA0lLRoMEoEUE8uz6RUZyu+xjAb/w7ojrHP7
         b8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931235; x=1792536035;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gurzTkqqRagMZrBgJFBCVz7i93uSa3r8+lp0iuHqO9A=;
        b=vEgaGaRBOGmvR/6FNsVfpIy6oC3LbhiPid5+D7CbMDz2p/Tym6J11AXFT4kWUIlf9q
         4rfh7uIt8z/jaH/S75Mcb/l1yAHsr1yXtRyW1mCCc5JX1viOU62DQAk3FJ5l/oE0AN8q
         F8V3Dao6x8sR8hfANt6ESKrSOR7styqgTUJPua1rFX5ZEu0Dep7HXIzpIBmtbFiIqJ1q
         Py26U0xs0TNYkAkDu8OhpXlJgNXp8Wc+DzvlVqRZoOA6FDwRHBjjOoBXwzGPBY6Yb2Uq
         oB/g03MET3dW5YyqXTob6GflJ82a2lrCJim4H+fZN9gGaVMv/ya+h1aZLvw68A/iUvUc
         8tuw==
X-Forwarded-Encrypted: i=1; AKwUvByFU4nCELaGfp3bqznzeBZ205oWcXC7dgE0kmtQeGG/ElMvrtIcFlEfBmXH7x/5DQ0IUTgF+5BTqXs=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIfh1L1jzA3czagOnww7LBFnDG3SQ+Q7XqEES/xjGfMsH6e/PNE
	8rr5NKHC+0q4gzSujW8PoaO4tD4PDGSg2jwYLoIK4zoc9mzEeKO/DWHIVBnnuBjJDJGtL0EXW9F
	+B1kcg3NUig==
X-Received: from dleg6-n1.prod.google.com ([2002:a05:701b:4306:10b0:160:bb23:390d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4586:20b0:169:b1b1:1445
 with SMTP id a92af1059eb24-16a5dbfe73dmr17947821c88.31.1791931232672; Tue, 13
 Oct 2026 15:40:32 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:44 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-10-irogers@google.com>
Subject: [PATCH 09/11] ubifs: sysfs: Use kset_create_and_add() for ubifs_kset
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
X-purgate-ID: tlsNG-c1860d/1791931237-CDD4887B-2C610901/0/0
X-purgate-type: clean
X-purgate-size: 1991

ubifs_kset was a static struct kset using a custom ubifs_ktype that
had no default_groups and no .release callback. With
CONFIG_DEBUG_KOBJECT_RELEASE=y, unloading the ubifs module while delayed
kobject release is pending causes a use-after-free on the static kset.

Replace the static ubifs_kset and empty ubifs_ktype with a dynamically
allocated kset via kset_create_and_add().

Fixes: 203a55f04f66 ("ubifs: Fix memory leak in ubifs_sysfs_init()")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 fs/ubifs/sysfs.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/fs/ubifs/sysfs.c b/fs/ubifs/sysfs.c
index dbf967dcf26e..e20931e3a62f 100644
--- a/fs/ubifs/sysfs.c
+++ b/fs/ubifs/sysfs.c
@@ -80,13 +80,7 @@ static const struct kobj_type ubifs_sb_ktype = {
 	.release	= ubifs_sb_release,
 };
 
-static const struct kobj_type ubifs_ktype = {
-	.sysfs_ops	= &ubifs_attr_ops,
-};
-
-static struct kset ubifs_kset = {
-	.kobj	= {.ktype = &ubifs_ktype},
-};
+static struct kset *ubifs_kset;
 
 int ubifs_sysfs_register(struct ubifs_info *c)
 {
@@ -107,7 +101,7 @@ int ubifs_sysfs_register(struct ubifs_info *c)
 		goto out_free;
 	}
 
-	c->kobj.kset = &ubifs_kset;
+	c->kobj.kset = ubifs_kset;
 	init_completion(&c->kobj_unregister);
 
 	ret = kobject_init_and_add(&c->kobj, &ubifs_sb_ktype, NULL,
@@ -139,18 +133,14 @@ void ubifs_sysfs_unregister(struct ubifs_info *c)
 
 int __init ubifs_sysfs_init(void)
 {
-	int ret;
+	ubifs_kset = kset_create_and_add("ubifs", NULL, fs_kobj);
+	if (!ubifs_kset)
+		return -ENOMEM;
 
-	kobject_set_name(&ubifs_kset.kobj, "ubifs");
-	ubifs_kset.kobj.parent = fs_kobj;
-	ret = kset_register(&ubifs_kset);
-	if (ret)
-		kset_put(&ubifs_kset);
-
-	return ret;
+	return 0;
 }
 
 void ubifs_sysfs_exit(void)
 {
-	kset_unregister(&ubifs_kset);
+	kset_unregister(ubifs_kset);
 }
-- 
2.56.0.385.gd3acb90ef8-goog


