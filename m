Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC54D606A330
	for <xen-devel@archiver.kernel.org>; Sun,  8 Nov 2026 22:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nJOx9GII
Received: from list by lists.xenproject.org with outflank-mailman.1479085.1683137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQBYD-0004LS-8V; Sun, 08 Nov 2026 22:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479085.1683137; Sun, 08 Nov 2026 22:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQBYD-0004LI-58; Sun, 08 Nov 2026 22:39:49 +0000
Received: by outflank-mailman (input) for mailman id 1479085;
 Sun, 08 Nov 2026 22:39:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3L_rwagcKCUYqzwomz0owwotm.kwu5mv-lm3mttq010.5mvxzwrmk1.wzo@flex--irogers.bounces.google.com>)
 id 1xQBYB-00049z-9W
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2026 22:39:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQBYA-001uiE-ML
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2026 23:39:46 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3L_rwagcKCUYqzwomz0owwotm.kwu5mv-lm3mttq010.5mvxzwrmk1.wzo@flex--irogers.bounces.google.com>)
 id 6af0f998-e002-0a2a0a5209dd-0a2a4501b036-12
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 23:39:46 +0100
Received: from [74.125.82.69] (helo=mail-dl1-f69.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3L_rwagcKCUYqzwomz0owwotm.kwu5mv-lm3mttq010.5mvxzwrmk1.wzo@flex--irogers.bounces.google.com>)
 id 6af0fa31-5984-0a2a45010019-4a7d5245e55e-3
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 23:39:46 +0100
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-1b0d864826cso1320315c88.1
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 14:39:46 -0800 (PST)
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
        d=google.com; s=20260707; t=1794177584; x=1794782384; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kX4Ed3A+P912IudIYmkHnIS6SHmJhWXUKLWP4ZNJ5k=;
        b=nJOx9GIIt5rhsfzfKka6ooWclB4ShMBLHUBLN1Vxnyy+F6WiHrpSzmbj4BeE1HWDdZ
         1x6tzycFEljlRFSUrW0v4GhxDIOo5RfZ6OxYTECG0B99rDE2UzqjMRJMnsZPaFRTcK4j
         yp+aH0udoTaMpDMpUyh58Vt7+LKK7J7UXLrgPcl0g6GKId3ovO5CBS5uCHUAhAKqvaLm
         AS/muVTK4lOcwl2o8eHpvaLkzOkNlIFlmHxK3m7ZBCS1EtLkHasnu3d/X8dacRnl0mwn
         TdJTaR1R0SWHVfqOqT4z4eNi5J+faKTgHwP0ruwwWl++M/Po86u648Y1AU/VRSHmciBP
         r5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177584; x=1794782384;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4kX4Ed3A+P912IudIYmkHnIS6SHmJhWXUKLWP4ZNJ5k=;
        b=l2fZyCVs6531srhTehvACDxdJDWzkOWAIxA3p4Nn8wzSisndw1ZOx83MTUIWvdOIDU
         L2tHQfqpicqjEv438x0Gi0UYPrenphp7IiOVUzN8FJTXQWfq+0qIJj+Qtr9WcHKRLQly
         FOfCrDqoTWILh4cZ/d6xhZLPM3eCfJcO1ZLcA0TkDZIInYVYwFsD7ezt80nebw7D2ljg
         4TN1yqP61ZNMnbYAYZTsqrDQG/5FEXBJWIMzkoWQCkDzHXKsnIwMhV95mDM4zknZToA3
         y3ksHAzeJ7vFPjG1og8BK3GyIW/UMZB3qsuspHYI/sG6agU36cAzbX6+8xvUWAB6WvZO
         Qwfw==
X-Forwarded-Encrypted: i=1; AL+hErHvTDpyOPGOOFj6CasHd8lPAAI//LS1ztpmGTg81lEq3S7jYcHeE7vUIgTL86kmd5rGt+H/xznXsKI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8K4QFkJD53u63tB5YJWwbe6GHc67PFU6kPZRIqgI2CcOoON1Bk
	CuWlgEU75Ea5/y2H1cqY3dppdPA6j6sWc39DBQ1GyBMgbKkLJ19RfOYYcG6Cg9tpQNd5+210uaP
	jihAhqJh1yQ==
X-Received: from dlad1.prod.google.com ([2002:a05:701b:2201:b0:1b2:6421:f4fb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea8a:b0:163:bee9:b250
 with SMTP id a92af1059eb24-1b39fedbec2mr3348910c88.22.1794177583902; Sun, 08
 Nov 2026 14:39:43 -0800 (PST)
Date: Sun,  8 Nov 2026 14:39:06 -0800
In-Reply-To: <20261108223913.3624571-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108223913.3624571-3-irogers@google.com>
Subject: [PATCH v3 2/9] powerpc/secvar: Add missing kobject release callback
 to secvar_ktype
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
X-purgate-ID: tlsNG-d62444/1794177586-1F66C757-69BF243C/0/0
X-purgate-type: clean
X-purgate-size: 1283
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In add_var(), a struct kobject is dynamically allocated with
kzalloc_obj() and initialized with secvar_ktype. If kobject_add() or
sysfs_create_file() fails, kobject_put(kobj) is called to clean up.
However, secvar_ktype does not define a .release callback, which results
in a memory leak of kobj (and a pr_debug warning in kobject_cleanup()
when CONFIG_DEBUG_KOBJECT_RELEASE is enabled).

Provide a secvar_release() callback that calls kfree(kobj).

Fixes: bd5d9c743d38 ("powerpc: expose secure variables to userspace via sysfs")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/powerpc/kernel/secvar-sysfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index 395399bbab2c..f3f6ac25ea78 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -126,7 +126,13 @@ static const struct attribute_group secvar_attr_group = {
 };
 __ATTRIBUTE_GROUPS(secvar_attr);
 
+static void secvar_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static const struct kobj_type secvar_ktype = {
+	.release	= secvar_release,
 	.sysfs_ops	= &kobj_sysfs_ops,
 	.default_groups = secvar_attr_groups,
 };
-- 
2.56.0.455.g6c5a503b38-goog


