Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC6E60A3806
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 19:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iH8cuMkU
Received: from list by lists.xenproject.org with outflank-mailman.1496844.1695183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU7lR-0002nF-9G; Thu, 19 Nov 2026 19:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496844.1695183; Thu, 19 Nov 2026 19:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU7lR-0002n8-6W; Thu, 19 Nov 2026 19:25:45 +0000
Received: by outflank-mailman (input) for mailman id 1496844;
 Thu, 19 Nov 2026 19:25:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3NU3_agcKCSwQZWOMZaOWWOTM.KWUfMV-LMdMTTQaba.fMVXZWRMKb.WZO@flex--irogers.bounces.google.com>)
 id 1xU7lQ-0002m3-30
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 19:25:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU7lP-00DAaF-Fq
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 20:25:43 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3NU3_agcKCSwQZWOMZaOWWOTM.KWUfMV-LMdMTTQaba.fMVXZWRMKb.WZO@flex--irogers.bounces.google.com>)
 id 6aff4d37-2eae-0a2a0a5409dd-0a2a450a88ee-0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 20:25:43 +0100
Received: from [209.85.214.197] (helo=mail-pl1-f197.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3NU3_agcKCSwQZWOMZaOWWOTM.KWUfMV-LMdMTTQaba.fMVXZWRMKb.WZO@flex--irogers.bounces.google.com>)
 id 6aff4d35-f2d2-0a2a450a0019-d155d6c5a819-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 20:25:43 +0100
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2ee2d612733so9929625ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 11:25:42 -0800 (PST)
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
        d=google.com; s=20260707; t=1795116341; x=1795721141; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALLBk8MdTkFwcPZqYQO+ZVSicu8jJEanZFGqZFoBPVY=;
        b=iH8cuMkUaR5CE+IVSf+Z7l3Z51+jTV/vht+1CF9QjTbWi4mbVn6q39zAoJlWMDRgrJ
         8RYbYOGp4h2ec03qZaWHXifYmYv7OLjE2M3gJj7FpAPQ974QXLRCuxNaC3w76J6DeiRP
         S+z/MpOIzwa0utCUBtcQUydWbjr197ewLQmj6CNfj6uH4jOpYkQIfqfXG3zz+YBCYe/9
         Tti0v6MdUrIk3p7cjrBMaZj0Kc/2Ha4GJUZlHSDyqe2Aq8w3YScWUtJHAYrrYKc1CX5b
         xGFkvRN8PxyBVXpnwTJefxDDf7lQpmRJcmxu3i3GrWooyGGG0VfkZkYD7FSBWlvDr0m0
         /KvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116341; x=1795721141;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALLBk8MdTkFwcPZqYQO+ZVSicu8jJEanZFGqZFoBPVY=;
        b=boLJWq+VWW51VXxx4upbS0TU2shkVvrw22UZPL3jajNA4LxYmzpYBuxY14ZT4BD87K
         nyYDQtdLYfn4S2ET9oRZZK3yXGCx9OCENOq0fHIvlwedmArf+ehyIlHixHadoCbfHu5a
         vji6k0tlYlLo6DvOqbFqPBo8C6HMU/e1qEIEctc4eY32IRVyidflsiM19a9eChfy9UD5
         N2TqBsV4IrOkJTOQtmKmARay0j3NRON/DTvudCC1x8ue3ScyQfLjHuIf2bp2C6kcpo3/
         h9jsv3HBc7J0352y39GY888WYHfp02TgTxo8lYj6yr93BLvAwrNzQl7AIvB0HtLgr7+u
         58fw==
X-Forwarded-Encrypted: i=1; AL+hErG1Nj6r+1gLYDHC0Rw7y5hLay2VNM243D0FdzzHBc/98AiWBS3QjWEjYnP8dtcg5MTe04EI75MJqGM=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8CwxZHSxT+gCn9Dba5+anfb3S3soIweaMXy7jXZm2CtIu/LWRI
	H9A2oEu+wFZ0jnHDRwAQ4y/80LnGwC/zlYKVIB0CGmnzmrDOY5nDRCfleLOwpAcNyYaVpsV+lvk
	O6EpRRUKKBA==
X-Received: from pleu15.prod.google.com ([2002:a17:903:41cf:b0:2ef:d860:1c85])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fda5:b0:2ed:fb0:bfd6
 with SMTP id d9443c01a7336-2f031e08699mr15736045ad.11.1795116341051; Thu, 19
 Nov 2026 11:25:41 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:14 -0800
In-Reply-To: <20261119192520.1983406-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119192520.1983406-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119192520.1983406-4-irogers@google.com>
Subject: [PATCH v4 3/9] sh: sq: Add missing kobject release callback to ktype_percpu_entry
From: Ian Rogers <irogers@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
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
X-purgate-ID: tlsNG-4011c0/1795116343-59BC0CFC-E1E6199E/0/0
X-purgate-type: clean
X-purgate-size: 1123
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In sq_dev_add(), sq_kobject[cpu] is dynamically allocated with
kzalloc_obj() and initialized with ktype_percpu_entry. When
sq_dev_remove() calls kobject_put(kobj), the kobject is never freed
because ktype_percpu_entry lacks a .release callback.

Provide a sq_kobj_release() callback that calls kfree(kobj).

Fixes: d7c30c682a27 ("sh: Store Queue API rework.")
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/sh/kernel/cpu/sh4/sq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/sh/kernel/cpu/sh4/sq.c b/arch/sh/kernel/cpu/sh4/sq.c
index 908a8e09113b..f33864958487 100644
--- a/arch/sh/kernel/cpu/sh4/sq.c
+++ b/arch/sh/kernel/cpu/sh4/sq.c
@@ -331,7 +331,13 @@ static const struct sysfs_ops sq_sysfs_ops = {
 	.store	= sq_sysfs_store,
 };
 
+static void sq_kobj_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static struct kobj_type ktype_percpu_entry = {
+	.release	= sq_kobj_release,
 	.sysfs_ops	= &sq_sysfs_ops,
 	.default_groups	= sq_sysfs_groups,
 };
-- 
2.56.1.708.g77570a6a1d-goog


