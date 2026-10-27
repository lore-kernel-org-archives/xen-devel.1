Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11743606A325
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 22:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ioo9vNsO
Received: from list by lists.xenproject.org with outflank-mailman.1462699.1673735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLppO-0002Mp-4l; Tue, 27 Oct 2026 22:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462699.1673735; Tue, 27 Oct 2026 22:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLppO-0002Mb-0u; Tue, 27 Oct 2026 22:39:34 +0000
Received: by outflank-mailman (input) for mailman id 1462699;
 Tue, 27 Oct 2026 22:39:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3ISjhagcKCVQ4DA20DE2AA270.yA8J09-z0H0774EFE.J09BDA50yF.AD2@flex--irogers.bounces.google.com>)
 id 1xLppM-0002Iq-MB
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:39:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLppM-004ylB-30
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 23:39:32 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3ISjhagcKCVQ4DA20DE2AA270.yA8J09-z0H0774EFE.J09BDA50yF.AD2@flex--irogers.bounces.google.com>)
 id 6ae127f5-bab6-0a2a0a5309dd-0a2a450ce220-20
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 23:39:32 +0100
Received: from [74.125.82.70] (helo=mail-dl1-f70.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3ISjhagcKCVQ4DA20DE2AA270.yA8J09-z0H0774EFE.J09BDA50yF.AD2@flex--irogers.bounces.google.com>)
 id 6ae12822-f479-0a2a450c0019-4a7d5246acfa-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 23:39:31 +0100
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-1a5005fd0f8so277494c88.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 15:39:31 -0700 (PDT)
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
        d=google.com; s=20260707; t=1793140770; x=1793745570; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aItLXVgOXAbsJZn2OZIWl+3TQwb1N1Woum6UsPYCRPI=;
        b=Ioo9vNsOIbzyq6RGky4VaneEVyGRZpLB4XhuZZlhRvY7B1btTIBLA+MIX1yDToaF3v
         I03oDUrL2kidXj93Y4KVFr7S3i/R8loJ4ELFQRtByayLxUA6GXy0xPzj34qwghFTDKRc
         4pWA6qDLnolpDSHmlCO0aWeg6fkox0erCdGsZ81BElayR058PoJDoY0nF07X35asgPOt
         zop9jauvg34TVlgHeHIiRFeThHaqrNufkbgXYyy0RZgGXmXqnAx3JdXOW7ZLSOL28kOT
         n5WXakkgxnU4u+L97wptT/4KiRviqAvXMaIhRfh9U+agCHcUd4K84Q8VOLIUS5n3WrzE
         OJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140770; x=1793745570;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aItLXVgOXAbsJZn2OZIWl+3TQwb1N1Woum6UsPYCRPI=;
        b=Ckve+TnYreSqE97O/Ur36Q9cQ86xp+l4XhKEqWeAmbyUt44CzGoHEhxkDzjbL/+bUo
         GiVeMgL2cNyNqqSywXCJ5wfK+jn8BPiof8i5niykmFjDeur7eRFxyupLnqRiAJsZNBQf
         350yvzxXYxj8whOEPM2C5bDZsF/ajNFARt7owM+BHcvlc44Ik7sscFEhkiFXzPbJEilb
         n/puDvTiX6FU0nXYUDk8jTbQYwIZRU0JQAz7D/ma4fJekfYuGQLcBSkamgOXVcMimpOJ
         fEUB581sNbdFszBaJ1lmqbyKYV1REE8gvVMTZDRhGslLTTTVzuci+fyLFwpK31oQxC43
         rBYA==
X-Forwarded-Encrypted: i=1; AKwUvBxGxw/fpxC/iiYFlSRAaD/fl/b/9mhvDjm8PpIFgFLfAq+hpoeLDSP9jmgZ2TyJA0fjAdI+fURPQXY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIdJwXWmaqww3nE/niIgbQLxubX7qnVkm8ekMooijd2+pD/5oxw
	BgoSQGlgShcooOurhWIaoBhky0M81P7+qeUdBvb7LyJMc5utmbA3gFSPboBYWbh2s/Zg5JvVi0h
	DNC613dPgAA==
X-Received: from dld12.prod.google.com ([2002:a05:7022:30c:b0:191:45cb:f8d3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:607:b0:166:af48:a2ba
 with SMTP id a92af1059eb24-1a6c2c71125mr1317138c88.0.1793140769446; Tue, 27
 Oct 2026 15:39:29 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:38:42 -0700
In-Reply-To: <20261027223847.652884-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027223847.652884-8-irogers@google.com>
Subject: [PATCH v2 7/9] ubifs: sysfs: Use kset_create_and_add() for ubifs_kset
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
	Richard Weinberger <richard@nod.at>, Liu Shixin <liushixin2@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d25034/1793140772-00ACCA5B-6150469B/0/0
X-purgate-type: clean
X-purgate-size: 2054
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ubifs_kset was a static struct kset using a custom ubifs_ktype that
had no default_groups and no .release callback. With
CONFIG_DEBUG_KOBJECT_RELEASE=y, unloading the ubifs module while delayed
kobject release is pending causes a use-after-free on the static kset.

Replace the static ubifs_kset and empty ubifs_ktype with a dynamically
allocated kset via kset_create_and_add().

Fixes: 203a55f04f66 ("ubifs: Fix memory leak in ubifs_sysfs_init()")
Tested-by: Zhihao Cheng <chengzhihao1@huawei.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
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
2.56.0.313.g2479322e68-goog


