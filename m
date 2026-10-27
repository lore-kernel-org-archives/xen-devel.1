Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A72C606A31F
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 22:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ouzbSD09
Received: from list by lists.xenproject.org with outflank-mailman.1462691.1673699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLppD-0001Dt-19; Tue, 27 Oct 2026 22:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462691.1673699; Tue, 27 Oct 2026 22:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLppC-0001Dm-Tj; Tue, 27 Oct 2026 22:39:22 +0000
Received: by outflank-mailman (input) for mailman id 1462691;
 Tue, 27 Oct 2026 22:39:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3FijhagcKCUkt2zrp23rzzrwp.nzx8py-op6pwwt343.8py02zupn4.z2r@flex--irogers.bounces.google.com>)
 id 1xLppB-0001CJ-IW
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:39:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLppA-00BmpO-OC
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 23:39:20 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3FijhagcKCUkt2zrp23rzzrwp.nzx8py-op6pwwt343.8py02zupn4.z2r@flex--irogers.bounces.google.com>)
 id 6ae127ef-8faa-0a2a0a5109dd-0a2a45059390-40
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 23:39:20 +0100
Received: from [209.85.210.197] (helo=mail-pf1-f197.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3FijhagcKCUkt2zrp23rzzrwp.nzx8py-op6pwwt343.8py02zupn4.z2r@flex--irogers.bounces.google.com>)
 id 6ae12817-4cb1-0a2a45050019-d155d2c5c09e-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 23:39:20 +0100
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-8a030e0f9c1so413668b3a.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 15:39:20 -0700 (PDT)
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
        d=google.com; s=20260707; t=1793140759; x=1793745559; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=beIsynJTUoVVYUibNrHvS9xq2J3rMWzpCblr3XGPomY=;
        b=ouzbSD09iwrlMUVncPRcU9lLmHAbyBRgF5YZnk/0TMk27UW4OZlTOxfdK3fwi6+zqX
         1UPsZo/92pg3ptgvRw95ZVLVweKrnYusSWRvlGQe/ClLywRIy39PBF7+6G0kALqyS6i0
         4Trh0ksf3HC1TQxCyltMbKwTAsollHd7HrJXLYbHNRxMCqlbXbr0LX7WC7Wr90VogyW1
         wUg8SlFZR4E1EoH/7EGSDWfb0XlhjzYmt51JuCL4rpCXwknCY5mItDiTj8Uo4MFrqkyO
         rZhFMsqrmKat41z7g0QX2zR872u9byyb7c/O4iSLtwQVqRVIz+zgsKMksP61PmShJjYW
         0yCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140759; x=1793745559;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=beIsynJTUoVVYUibNrHvS9xq2J3rMWzpCblr3XGPomY=;
        b=tQn3Ads0lqBX5b+9x6M5GZyP5eigKIJmQUCbjzlp0FeF7pSGplyrR0ei61umKVPD9t
         6YuHOycFqEHNyyRKY4D+kMbia1e1aPslS+bE0etH7YFZqxe/zNVRoh39qPxzDJVrDy6B
         wzn/lxuBLxhA0twLhBu9rg+xs4n33T0x3Poncuf1rpr7p8hzjWiaahxbv497iMIm82Vc
         LCO2izjEudcWeFJs7INEkn6SG2I98v/HOmtFLucIisMKP4+b/ZfQpgXTIkAtTtO9Qw9k
         OZWeOtK2POB1Qyu2YHeufs9CZ4ImqKIFWZrh/2LGXjwFMNfKodcmHsDknHRtTeQVugX0
         wH9w==
X-Forwarded-Encrypted: i=1; AKwUvByKKmlXam4HC9Q9SHqsxqY+fqn/B1kuY+iHrmW0etsdXLxsefmb1g5yMRDdwWWx+/GXIW5aapOe8kY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKapTSPE3Ye3kirgCyx5dma1rEQw2runHDe8IQcySYtjzzlegBu
	LBpiT712HP8z4OltlaVl+yTZOd2SxM8EG8ukw+h9zAH7O47JpgHrvwedspSORdi2WwxTmkvIrNy
	1Ty0+QcQ4eg==
X-Received: from pfbdw21.prod.google.com ([2002:a05:6a00:3695:b0:89f:827e:eb47])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4293:b0:876:194e:b8fe
 with SMTP id d2e1a72fcca58-8a6e70e832amr492696b3a.26.1793140758450; Tue, 27
 Oct 2026 15:39:18 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:38:38 -0700
In-Reply-To: <20261027223847.652884-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027223847.652884-4-irogers@google.com>
Subject: [PATCH v2 3/9] sh: sq: Add missing kobject release callback to ktype_percpu_entry
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
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Paul Mundt <lethal@linux-sh.org>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c201ff/1793140760-F54AC2A1-CECF191C/0/0
X-purgate-type: clean
X-purgate-size: 1055
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
2.56.0.313.g2479322e68-goog


