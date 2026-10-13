Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045E3CC6B20
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 22:40:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448331.1664354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGlAV-000789-TO; Tue, 13 Oct 2026 22:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448331.1664354; Tue, 13 Oct 2026 22:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGlAV-000781-QX; Tue, 13 Oct 2026 22:40:23 +0000
Received: by outflank-mailman (input) for mailman id 1448331;
 Tue, 13 Oct 2026 22:40:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3U7POagcKCVI2B80yBC08805y.w86Hy7-xyFy552CDC.Hy79B83ywD.8B0@flex--irogers.bounces.google.com>)
 id 1xGlAU-00075Q-NB
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 22:40:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGlAU-00Egyf-47
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 00:40:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3U7POagcKCVI2B80yBC08805y.w86Hy7-xyFy552CDC.Hy79B83ywD.8B0@flex--irogers.bounces.google.com>)
 id 6aceb34f-2eae-0a2a0a5409dd-0a2a4508863a-6
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 00:40:22 +0200
Received: from [74.125.82.197] (helo=mail-dy1-f197.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3U7POagcKCVI2B80yBC08805y.w86Hy7-xyFy552CDC.Hy79B83ywD.8B0@flex--irogers.bounces.google.com>)
 id 6aceb354-f659-0a2a45080019-4a7d52c5e4ef-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 00:40:21 +0200
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-35c5aef2a74so1454375eec.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 15:40:21 -0700 (PDT)
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
        d=google.com; s=20251104; t=1791931220; x=1792536020; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4r3hXDLd6Bqk9XmcFR/JS5uHIdkPs2TN+2FSnsngXIE=;
        b=v2BCIsZXqZkc3e2l1NKlbMzOHnzFe1G88P7l7HKXL3KDTEeQftWRY3qe63dnfQMD97
         Jg3LFGXvaDFAmSWf1GI/+JIA/c9/cm7ozOwD137EUqVCOvTvISFU0CoBaJP1GLe8YVSo
         7r3ZMCuJ3GHfoP1CNONqSU8CZCjxoNUfm5wyajEs6W2ZnCQgSWYb0vDKUY7pIvzfNxRw
         i1NvxKVKSaitlMKY7MjO1ZJoSDLInDEFXMOFzHLOUBbFcw0prtUL3OCcRHvOrzVlvsva
         +fXeYwQ9DVfg0q+tr5yiv2dHwbcryE5KlZq5LjXaEbIgJR7TDvzXsrihvPKE6jzFInLo
         1kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931220; x=1792536020;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4r3hXDLd6Bqk9XmcFR/JS5uHIdkPs2TN+2FSnsngXIE=;
        b=Y/i6o1SrLfOpWWHkGOgoQgOCwXjHm7bcTd2QRYlniTdiQHsj9/xLnWTg3+5wIAZNbg
         PLhVaG4rEBA4HqPmlxAniIMdni7Kx3ygUyGZyeuKdYR7KhS3yIAJzbr1C+U3aA5zjyaJ
         kT6g5RaPOeu9O6MZLM2IRVH1EV9UnSOCw4kTUc4i/zjRQGpECmRGB0wTc2ju168BUV4D
         dkGKIAgvByI8KHj+qdopKlWr2bVhmanG5Yg1shtHm8D+JKl2JUNxJWm6a5PAzYWesgc1
         0BRT+A0kfzjq55dtmM1+1SlYbX/cFZvoHinSqacRTguhIbtUM0XIC0lPRjkNMKhAwtie
         QPHw==
X-Forwarded-Encrypted: i=1; AKwUvBxeIS9i68ku7ymrzMmrGuBp+CKUI5HzMlJZA304zgQDwvsaP0k85VzLWcDkPbZb4X+rjCuX8rd7DtQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIt5EMTF94E8MI/MsGyk0oWzWv+Y+06mufzFn0cmtFYuClrJBUs
	8urQt1TeR/hZ9scQZ7nA/4305DXQpVTswe6gyR3+GPTSAnKbYCmiNK25LdNhQ1Xj5UsoGZa0sb8
	63gcFxsgs1g==
X-Received: from dyu6.prod.google.com ([2002:a05:693c:8106:b0:352:94e:a8c9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:71a8:b0:358:f717:ff61
 with SMTP id 5a478bee46e88-358f717ff90mr13337962eec.6.1791931219210; Tue, 13
 Oct 2026 15:40:19 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:38 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-4-irogers@google.com>
Subject: [PATCH 03/11] sh: sq: Add missing kobject release callback to ktype_percpu_entry
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
X-purgate-ID: tlsNG-c1860d/1791931221-D6D4087B-A52753D5/0/0
X-purgate-type: clean
X-purgate-size: 1096

In sq_dev_add(), sq_kobject[cpu] is dynamically allocated with
kzalloc_obj() and initialized with ktype_percpu_entry. When
sq_dev_remove() calls kobject_put(kobj), the kobject is never freed
because ktype_percpu_entry lacks a .release callback.

Provide a sq_kobj_release() callback that calls kfree(kobj).

Fixes: d7c30c682a27 ("sh: Store Queue API rework.")
Assisted-by: Antigravity:gemini-3.1-pro
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
2.56.0.385.gd3acb90ef8-goog


