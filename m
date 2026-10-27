Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F3B60731B0
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 22:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PX/O+NbU
Received: from list by lists.xenproject.org with outflank-mailman.1462697.1673726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLppK-00022T-R5; Tue, 27 Oct 2026 22:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462697.1673726; Tue, 27 Oct 2026 22:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLppK-00022M-NV; Tue, 27 Oct 2026 22:39:30 +0000
Received: by outflank-mailman (input) for mailman id 1462697;
 Tue, 27 Oct 2026 22:39:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3HijhagcKCVE1A7zxABz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@flex--irogers.bounces.google.com>)
 id 1xLppJ-0001wi-Iq
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:39:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLppI-009736-W1
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 23:39:29 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3HijhagcKCVE1A7zxABz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@flex--irogers.bounces.google.com>)
 id 6ae1281b-e002-0a2a0a5209dd-0a2a4507cfa8-8
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 23:39:28 +0100
Received: from [74.125.82.72] (helo=mail-dl1-f72.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3HijhagcKCVE1A7zxABz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@flex--irogers.bounces.google.com>)
 id 6ae1281f-b4ea-0a2a45070019-4a7d5248cd11-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 23:39:28 +0100
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-147be78cd56so953103c88.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 15:39:28 -0700 (PDT)
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
        d=google.com; s=20260707; t=1793140767; x=1793745567; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zou/7CSV4h/YwAlF7A1OL9kEnFb2HIoLHCAQS8LrD8=;
        b=PX/O+NbUYP0xNm7jIc7VkjgbhjklmQO26J/JapSTWjZW/WJVUgHAcfzxu1DMG/PRkh
         rkYK8Y9tFY2noeH9OjFeIf6FHiYG2nUqEsWMu4B7eJEr/6xrxOdVoz/uD5p4fu/dPd0E
         m4h1NY44rbEwHzCXxuTEchuc1j4Els9XM6Os6hcY38K8W0ZoJnbS4LcxS+Wu/VBBmKXK
         uMq0Sz6Q7W3DOzWT1MWCJ2kwMqExQCgSPT2XItnxK+zP+KLBxRUOd+dm5eznCjtp9GLo
         Vbpf1+br8ii0vYahdrJhAHMdCh7xC+svpKwCXu45UWEd6pJfXsNATMSLwcFSGHrE+H2D
         MN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140767; x=1793745567;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zou/7CSV4h/YwAlF7A1OL9kEnFb2HIoLHCAQS8LrD8=;
        b=gRyry8ztGABLlgWgtGli5jviUy+uJMHGjYC6YLnzmIj4wP/F/B0CwRloc6ZQBNJpEa
         QLFBTL17UCqDZxew+rzUUab5tJomzA2KiLXCLINiNISf8FBl5E0jPyBlXBX70/CCEluj
         L75kdgih5kS//Q2mc1t+h/6EAvg3KH9pGl4LNDu8F+5s4BZaz8UVVWYhvimqpldapxLa
         kl7CrI0geXkaCpvb0TUna/GNBvLh6+k967Zinyw7XjL+a65k78uWn7xHgGMuIBN3rKjX
         M0jojvfaKgNdLaGqhLYqsLKnOPzJ3QGRy72oADGkTSoq7DZq3mZ3C4CeQFaIbKvZBGtQ
         Ys2w==
X-Forwarded-Encrypted: i=1; AKwUvBwZeuwARHbQgf917Pbwa0VAhAqLd3Uy9RjugnzAEYYwuQn0IO2BPOsnGvlYQ2zEuyAbRRqU5NqWU6E=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJ52GWssCSLdZ4dPKqHacczzlVLHVRryYYMF9fJKKlVSe7Ou1eM
	lXFqBCrA37KMm3hX7kK621cJsHCE/r5ezHK+/XHi3nGPwdMHrB6jpb7KGvtcYWKHKZa+gS/bYI0
	yUR6v4Dwn+A==
X-Received: from dlbqq10.prod.google.com ([2002:a05:7022:ed0a:b0:1a0:a0b4:204c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f115:b0:1a3:6040:bf78
 with SMTP id a92af1059eb24-1a6cc34d07bmr917417c88.11.1793140766453; Tue, 27
 Oct 2026 15:39:26 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:38:41 -0700
In-Reply-To: <20261027223847.652884-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027223847.652884-7-irogers@google.com>
Subject: [PATCH v2 6/9] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
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
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ef75cf/1793140768-A62C4AE4-CF504562/0/0
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
2.56.0.313.g2479322e68-goog


