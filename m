Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434E7CC6B0F
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 22:40:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448330.1664346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGlAT-0006uV-Nn; Tue, 13 Oct 2026 22:40:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448330.1664346; Tue, 13 Oct 2026 22:40:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGlAT-0006uN-Je; Tue, 13 Oct 2026 22:40:21 +0000
Received: by outflank-mailman (input) for mailman id 1448330;
 Tue, 13 Oct 2026 22:40:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3ULPOagcKCU8z85xv89x55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--irogers.bounces.google.com>)
 id 1xGlAS-0006ok-1k
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 22:40:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGlAR-00Eh2E-F4
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 00:40:19 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3ULPOagcKCU8z85xv89x55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--irogers.bounces.google.com>)
 id 6aceb34b-e002-0a2a0a5209dd-0a2a4504ec56-10
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 00:40:19 +0200
Received: from [74.125.82.198] (helo=mail-dy1-f198.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3ULPOagcKCU8z85xv89x55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--irogers.bounces.google.com>)
 id 6aceb351-b57f-0a2a45040019-4a7d52c6ad83-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 00:40:19 +0200
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-3552883bd19so4648261eec.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 15:40:18 -0700 (PDT)
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
        d=google.com; s=20251104; t=1791931217; x=1792536017; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qdtOvNbLAOJ9idJnmqNXkxs2lXj3bNW1pL8KRmE6mUU=;
        b=Wz7acxh6o+z2wyEmHNrLoz1mE/INm8whAF5mARrCcpSvDitm7A7TieK924Ma7cMQ13
         BIY+hAorqX28OlYgJRIz7Os40GccznSYbtPOFQTLW0HJagD5OQn4taaM/kiN43kCx+oS
         VWv8yge+Fzt0fk2BKeg6z/tq2okunylh1pOOUWN6NcjBsAu1yxiurSUL+pgviWmITXtQ
         LbInEW4s9pSLjFVIrA6qrB1eRrcMQWAeDCWk1V1jFuaIEPeZQbD62vhqYj57tPZxA2u/
         bF0lo5ZoEEWUz4QD05gASUo9xkr7gPc0MO+CpaVbKkLmnjFzMmKC4LsGdc++lAbsNdZH
         eVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931217; x=1792536017;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdtOvNbLAOJ9idJnmqNXkxs2lXj3bNW1pL8KRmE6mUU=;
        b=M4zO9ayC0adcdQUH32AseCsdHLvbwMQjDEA3bsVnF5FwGKIewGdp3aOQ4TKPMc3S1m
         94wn8H0YisQEg6AwuGUkOQ8eexLDWuHBPitpLFgGOGcaMQAgg8D0Vc1jxdd8xHJZSb3X
         d0Sz8upIMpvmnh5rtWEH6bFr0P9slH8JCjFcfmuFqxwBDozDXMJImiu5+05H3Pev5DJU
         KjnlqXmVSoNtIu5flfL5pCd/fBvm/F9fXmYYcsLjQDj25y+8PVbFTnCiMdkPZBV1GY/b
         /ZiBCcfqZiJn2Kp38lp95hLObYaNxUdO/90GBOcNTpHYIBcxUw0HhbKzpf2SvaAVLxxK
         ZO/A==
X-Forwarded-Encrypted: i=1; AKwUvBzIbaBBe5ChsCkaLEom4BXs57CQGGT2bQudqsrtLNyfHmOFKmRrFf/N8zH9r5D4QYYEYscXCS9R47I=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJXAI6wOOAmVTcrkvwfJZpIY5PL3P3ntX6C12falr0H3dC8ujxh
	AYoXoE20Ll7Z3pEhn1KR7DWKg3yPDyGJxSTJeHM3KHQB7eRnP58NTZvPLU1/r/NIu+lU5u9w/D/
	eJhJ0EsHm7g==
X-Received: from dycrm16.prod.google.com ([2002:a05:693c:2a10:b0:358:f250:485f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:4141:20b0:35c:8d1f:5634
 with SMTP id 5a478bee46e88-35c8d1f58e8mr4713972eec.12.1791931216820; Tue, 13
 Oct 2026 15:40:16 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:37 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-3-irogers@google.com>
Subject: [PATCH 02/11] powerpc/secvar: Add missing kobject release callback to secvar_ktype
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
X-purgate-ID: tlsNG-ebf023/1791931219-C10DDB50-FCBCE6D1/0/0
X-purgate-type: clean
X-purgate-size: 1324

In add_var(), a struct kobject is dynamically allocated with
kzalloc_obj() and initialized with secvar_ktype. If kobject_add() or
sysfs_create_file() fails, kobject_put(kobj) is called to clean up.
However, secvar_ktype does not define a .release callback, which results
in a memory leak of kobj (and a pr_debug warning in kobject_cleanup()
when CONFIG_DEBUG_KOBJECT_RELEASE is enabled).

Provide a secvar_release() callback that calls kfree(kobj).

Fixes: bd5d9c743d38 ("powerpc: expose secure variables to userspace via sysfs")
Assisted-by: Antigravity:gemini-3.1-pro
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
2.56.0.385.gd3acb90ef8-goog


