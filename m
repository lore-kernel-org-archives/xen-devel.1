Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E704CC6B12
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 22:42:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448360.1664391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGlCU-0001Lk-61; Tue, 13 Oct 2026 22:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448360.1664391; Tue, 13 Oct 2026 22:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGlCU-0001Ld-3B; Tue, 13 Oct 2026 22:42:26 +0000
Received: by outflank-mailman (input) for mailman id 1448360;
 Tue, 13 Oct 2026 22:42:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3VbPOagcKCVQ4DA20DE2AA270.yA8J09-z0H0774EFE.J09BDA50yF.AD2@flex--irogers.bounces.google.com>)
 id 1xGlCT-0001LU-6n
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 22:42:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGlCS-00GmGX-GR
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 00:42:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3VbPOagcKCVQ4DA20DE2AA270.yA8J09-z0H0774EFE.J09BDA50yF.AD2@flex--irogers.bounces.google.com>)
 id 6aceb3a0-bab6-0a2a0a5309dd-0a2a450294c8-28
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 00:42:24 +0200
Received: from [74.125.82.200] (helo=mail-dy1-f200.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3VbPOagcKCVQ4DA20DE2AA270.yA8J09-z0H0774EFE.J09BDA50yF.AD2@flex--irogers.bounces.google.com>)
 id 6aceb356-6ca4-0a2a45020019-4a7d52c8cd33-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 00:40:24 +0200
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-35d4538fd74so1600997eec.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 15:40:23 -0700 (PDT)
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
        d=google.com; s=20251104; t=1791931222; x=1792536022; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCnJ2cyf9mW8BNAz5Pcwsubr4iCDZba2S/P+mHJ/PnA=;
        b=vxc8wDk2AAiRnpHb/BA4v1H9q1W7PT0vplt5rDBjmuY7tGPDW6WVbAwQE8O8iIXDZ6
         ac7UqD7gSxswO0jMit0Exz+17VJTOp5Q8/BeNFdQX3WaMVL6C7VFBaUtZ3AhvjIfGebN
         7+gWylfY3EGkvK7Ry2E1ZS6eOrOb/5kpuhoOwO09LXxQc4SAK0HNuh4UNpf3aRLEHdoK
         IBtVAFiaWmTQgSaOUfMh5Ir/Syl+GdWCH2njz3hmQe9zgiAUoiwE7seepFiXL22f9d0J
         U5YeYqGjOlijXrT5m4dsX+VlWPgkRSsBPPtFlE6568DAULT/N2EJG17FEWpheEJeaX5P
         OiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931222; x=1792536022;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCnJ2cyf9mW8BNAz5Pcwsubr4iCDZba2S/P+mHJ/PnA=;
        b=wLlXk2ZiKwJ4JOEA+/8AG5f4HKZnMv4MMtBwUlvruQAJpaBPlvzEel6Wuu14lQFBnw
         P02RfKWwKGx9k0ALHe6ydPgEM41o1nYWDwLsj3zAfugjjpUP4cgNqXia768p6UolReGX
         +7NkZxLEEbGftoihMz5TbRKwsOWJJyKtaWj066OluTKty6tntB7rd/ZxuLv5bCwrMeMf
         ztAHsf6KHUF8WDGGTzDunQLeHk5msGp8DnOfYrUBAwoglzYcvrs0JwELpE0OAM1T/ych
         Kr/IZFpGylE5W9kAbEz5VXALeOjdWKPMT4Lf0g36xmrLwF85KEALS3xnXgk/pei3Il7g
         sp/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzKQQxv9YmxTbn5EhZImF4lkYW4BeXBcNoDP6yekz6acLzpasj43PSu7/VZBS7IY0UfomawVRTq620=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKxZwAwdA88r8qUWYvzFYcbTjreWpELu3GOXpSs3pKisy1uxeHv
	mtohlmQEpXFtbSn5YZLoK15wuDoa8wOFsQXWs2Nz87T+dCgjWzWsFZ05VashzgrxB2zOjnLzpsG
	pzQDQmv6RjA==
X-Received: from dybsc14.prod.google.com ([2002:a05:7301:4b0e:b0:351:7270:d79a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:f60a:b0:359:2edc:e1d8
 with SMTP id 5a478bee46e88-3592edcf44bmr18703370eec.5.1791931221247; Tue, 13
 Oct 2026 15:40:21 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:39 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-5-irogers@google.com>
Subject: [PATCH 04/11] cpufreq: Initialize kobj_type release callback in
 ondemand and conservative governors
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
X-purgate-ID: tlsNG-720697/1791931224-F32B12AC-4502ED77/0/0
X-purgate-type: clean
X-purgate-size: 3423

Export cpufreq_dbs_data_release() and set .kobj_type.release in the
ondemand and conservative governors so their gov_attr_set kobjects have
a valid release callback, matching cpufreq_ governor_dbs.

This prepares for annotating struct kobj_type::release with
__require_explicit_initialization.

Fixes: c4435630361d ("cpufreq: governor: New sysfs show/store callbacks for governor tunables")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/cpufreq/cpufreq_conservative.c | 5 ++++-
 drivers/cpufreq/cpufreq_governor.c     | 3 ++-
 drivers/cpufreq/cpufreq_governor.h     | 1 +
 drivers/cpufreq/cpufreq_ondemand.c     | 5 ++++-
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
index 0b32ae28ec85..38c3bd5bf75a 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -316,7 +316,10 @@ static void cs_limits(struct cpufreq_policy *policy)
 
 static struct dbs_governor cs_governor = {
 	.gov = CPUFREQ_DBS_GOVERNOR_INITIALIZER("conservative"),
-	.kobj_type = { .default_groups = cs_groups },
+	.kobj_type = {
+		.release = cpufreq_dbs_data_release,
+		.default_groups = cs_groups,
+	},
 	.gov_dbs_update = cs_dbs_update,
 	.alloc = cs_alloc,
 	.free = cs_free,
diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufreq_governor.c
index 710d93ec89b5..97b64985927d 100644
--- a/drivers/cpufreq/cpufreq_governor.c
+++ b/drivers/cpufreq/cpufreq_governor.c
@@ -404,7 +404,7 @@ static void free_policy_dbs_info(struct policy_dbs_info *policy_dbs,
 	gov->free(policy_dbs);
 }
 
-static void cpufreq_dbs_data_release(struct kobject *kobj)
+void cpufreq_dbs_data_release(struct kobject *kobj)
 {
 	struct dbs_data *dbs_data = to_dbs_data(to_gov_attr_set(kobj));
 	struct dbs_governor *gov = dbs_data->gov;
@@ -412,6 +412,7 @@ static void cpufreq_dbs_data_release(struct kobject *kobj)
 	gov->exit(dbs_data);
 	kfree(dbs_data);
 }
+EXPORT_SYMBOL_GPL(cpufreq_dbs_data_release);
 
 int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
 {
diff --git a/drivers/cpufreq/cpufreq_governor.h b/drivers/cpufreq/cpufreq_governor.h
index 73b8ed7cfaae..c03d067f42eb 100644
--- a/drivers/cpufreq/cpufreq_governor.h
+++ b/drivers/cpufreq/cpufreq_governor.h
@@ -148,6 +148,7 @@ static inline struct dbs_governor *dbs_governor_of(struct cpufreq_policy *policy
 }
 
 /* Governor callback routines */
+void cpufreq_dbs_data_release(struct kobject *kobj);
 int cpufreq_dbs_governor_init(struct cpufreq_policy *policy);
 void cpufreq_dbs_governor_exit(struct cpufreq_policy *policy);
 int cpufreq_dbs_governor_start(struct cpufreq_policy *policy);
diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index 9942dbb38dae..7386d043c665 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -374,7 +374,10 @@ static struct od_ops od_ops = {
 
 static struct dbs_governor od_dbs_gov = {
 	.gov = CPUFREQ_DBS_GOVERNOR_INITIALIZER("ondemand"),
-	.kobj_type = { .default_groups = od_groups },
+	.kobj_type = {
+		.release = cpufreq_dbs_data_release,
+		.default_groups = od_groups,
+	},
 	.gov_dbs_update = od_dbs_update,
 	.alloc = od_alloc,
 	.free = od_free,
-- 
2.56.0.385.gd3acb90ef8-goog


