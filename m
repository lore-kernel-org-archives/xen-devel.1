Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C1B606A331
	for <xen-devel@archiver.kernel.org>; Sun,  8 Nov 2026 22:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SYfAcFOA
Received: from list by lists.xenproject.org with outflank-mailman.1479090.1683175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQBYL-0005Ia-D8; Sun, 08 Nov 2026 22:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479090.1683175; Sun, 08 Nov 2026 22:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQBYL-0005IP-8F; Sun, 08 Nov 2026 22:39:57 +0000
Received: by outflank-mailman (input) for mailman id 1479090;
 Sun, 08 Nov 2026 22:39:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3OPrwagcKCU8z85xv89x55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--irogers.bounces.google.com>)
 id 1xQBYJ-00058y-Le
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2026 22:39:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQBYJ-001umh-2e
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2026 23:39:55 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3OPrwagcKCU8z85xv89x55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--irogers.bounces.google.com>)
 id 6af0fa07-8faa-0a2a0a5109dd-0a2a450c92d6-18
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 23:39:55 +0100
Received: from [74.125.82.200] (helo=mail-dy1-f200.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3OPrwagcKCU8z85xv89x55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--irogers.bounces.google.com>)
 id 6af0fa39-f479-0a2a450c0019-4a7d52c8bd04-3
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 23:39:54 +0100
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-33c35f5ca6cso849399eec.1
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 14:39:54 -0800 (PST)
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
        d=google.com; s=20260707; t=1794177593; x=1794782393; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=noN8ey05POi7MkRY5IldCk9pju5ZMENfN/kneqqJ3/c=;
        b=SYfAcFOAT8tuyHEpMOqB/g00hFhJdr/UPz+6Gpj0y09p815eGDPgjqLTCt+oMZUcMw
         ZBZ3IUTB2vofdG3xgVR3V279q6herGR6ddrHCc1xJEAd+6b12blE2Oe9F0H9NAFG9S4+
         YwyCzlA9AkDv2FxOKDdxyOWmSnVJhKq4rFZnFFw+s+5xTqEpjSy7uway2J8bUYcSo3A7
         QjVQ2czR1w1l1+fp7bewaPsARYT5eiu0Tzre0/AjONbXtDvhPR0Wn2MVGxJ50ga89wnN
         pC7spdJQRtvD22pkrop0zBaU194HpOdKUp5hRLV0BCACFIHf4vR2Tgav9ZDROIvI94i1
         SACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177593; x=1794782393;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=noN8ey05POi7MkRY5IldCk9pju5ZMENfN/kneqqJ3/c=;
        b=h9z3pp5tNWY/ozVrOq07av/o01XEHLs7RQIdhpBR/Pvs/deLKtS9Cyzkd5NiDWqyrh
         gjNLaVse7txMJC3wyrsDJXQKvMUwACRvjU807618BBjvW5rTRVG9fE8Bg3nz5lsAB15I
         XJ58R368bt4zk8Wu36Ytu6KkdMgEAOpJ0YuAkzjJWs1P+HYiCcfIspkktKrr7ik6bb3j
         wBq0FD69XOqCiWsfUJdRFB/TfxyEGJxOPfV9Nq98DeZM8bRDQtflKHbrUdNL9R6fiQfd
         Y7dXV5SO8vMMfD8VgXo1tllJAppBlfNEgDubOF3t76DKX394sGI9dbaGeJ3apwlFFVkB
         Ho8A==
X-Forwarded-Encrypted: i=1; AL+hErEk9RZarmOzi0a2XHHB6gunvaG4oQZdimdirn+pj3A2VCYc8F5HqjuExHRmaDOQk3KiHoIr0np5z6k=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+QsUk7m+HsJfWQ7rZjsAJ7W8amuQpXKbnZk2ZCLef+V2Z566qU
	2YwNMbsZyOQtJE4wJeBGzzo1neoLwmgkTURZAzHP0lsSjq6k5KUKhcX3AcUYDOx/eYjG6XFQAuu
	PrkqwPBDAjg==
X-Received: from dlam9-n1.prod.google.com ([2002:a05:701b:2089:10b0:195:beb6:14cc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:28b:10b0:1b0:430d:d81c
 with SMTP id a92af1059eb24-1b39feab6a4mr3897188c88.25.1794177592505; Sun, 08
 Nov 2026 14:39:52 -0800 (PST)
Date: Sun,  8 Nov 2026 14:39:10 -0800
In-Reply-To: <20261108223913.3624571-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108223913.3624571-7-irogers@google.com>
Subject: [PATCH v3 6/9] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
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
X-purgate-ID: tlsNG-d25034/1794177595-50520A5B-F1872E5C/0/0
X-purgate-type: clean
X-purgate-size: 1156
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hypervisor_init() in drivers/base/hypervisor.c creates hypervisor_kobj
with kobject_create_and_add() (which allocates a dynamic kobject using
dynamic_kobj_ktype), and hypervisor_subsys_init() in
drivers/xen/sys-hypervisor.c then overwrites hypervisor_kobj->ktype with
&hyp_sysfs_kobj_type, which had no .release callback.

Add hyp_sysfs_release() calling kfree(kobj) to preserve the dynamic
kobject release behavior.

Fixes: cff7e81b3dd7 ("xen: add /sys/hypervisor support")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/xen/sys-hypervisor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.c
index 91923242a5ae..0e8a2cd69fd6 100644
--- a/drivers/xen/sys-hypervisor.c
+++ b/drivers/xen/sys-hypervisor.c
@@ -659,7 +659,13 @@ static const struct sysfs_ops hyp_sysfs_ops = {
 	.store = hyp_sysfs_store,
 };
 
+static void hyp_sysfs_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static const struct kobj_type hyp_sysfs_kobj_type = {
+	.release = hyp_sysfs_release,
 	.sysfs_ops = &hyp_sysfs_ops,
 };
 
-- 
2.56.0.455.g6c5a503b38-goog


