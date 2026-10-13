Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B9FCC6B12
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 22:45:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448381.1664428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGlFW-0003DZ-Bi; Tue, 13 Oct 2026 22:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448381.1664428; Tue, 13 Oct 2026 22:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGlFW-0003DS-73; Tue, 13 Oct 2026 22:45:34 +0000
Received: by outflank-mailman (input) for mailman id 1448381;
 Tue, 13 Oct 2026 22:45:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3XLPOagcKCVsBKH97KL9HH9E7.5HFQ7G-67O7EEBLML.Q7GIKHC75M.HK9@flex--irogers.bounces.google.com>)
 id 1xGlFU-0003CO-QL
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 22:45:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGlFU-00Gmem-5K
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 00:45:32 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3XLPOagcKCVsBKH97KL9HH9E7.5HFQ7G-67O7EEBLML.Q7GIKHC75M.HK9@flex--irogers.bounces.google.com>)
 id 6aceb48c-bab6-0a2a0a5309dd-0a2a450cdc52-0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 00:45:32 +0200
Received: from [74.125.82.197] (helo=mail-dy1-f197.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3XLPOagcKCVsBKH97KL9HH9E7.5HFQ7G-67O7EEBLML.Q7GIKHC75M.HK9@flex--irogers.bounces.google.com>)
 id 6aceb35e-f479-0a2a450c0019-4a7d52c5ccc8-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 00:40:31 +0200
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-3580c07911eso9020099eec.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 15:40:31 -0700 (PDT)
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
        d=google.com; s=20251104; t=1791931229; x=1792536029; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzuEQJa4uF6wSn0s7ZpxNvjcEHFt9KB4NkbiARikmlQ=;
        b=FzkhHr/FJ1gI/lJccZ4WlqGOBNhVB+JzECBpvhgYLDSw8O1fErtS0a7gULcVQAjmA/
         kc56ThccM6WrMMyViXcXz/teDGtJfBK4Q5FuTePJrYnmsxOR1jVlEuxMDVl30a6UnhlS
         o3zYa92V3c4ZaHp/xdY+9vwk82TrcHQj7uZ9IvISPL5hL9rfCsBkLIAWFyQl9yPXSAKZ
         35ur5vd7x0FX8Z7RYFqcEMbMdU83ssyv+70JwFyV2yWnKvvzziA/wRGHyEmqSMTJPDUr
         k6AhFdEHSMbKC9pwKKImM6RgWzjC6V2MkuOczq9bkOVhs5R0RaucjOC/Vn7hMoqNtv94
         E84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931229; x=1792536029;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzuEQJa4uF6wSn0s7ZpxNvjcEHFt9KB4NkbiARikmlQ=;
        b=VncM2+dxgcYmPzP5QVJK/uN/VnJNjD2fSBX6awWsBjLeiFvSbKYD/6N312s9fI0b+R
         z68pMw38bOnqLiBc4LQwB2x9ou/cTeINuYoni/HFkZc4+RJqpXH/64XfLbpl0060uvEy
         rPZsofzWCqz5+rmmRzYVHqwEVfv32hxJSrm2ka/3U9efH+fAJuk/KOGAQ2TsedZvW0ZB
         UZcF2yoohIG3GLhbXsQkIwfovY6iZ+NXq8mtZCdJJEkoaUu7ZVP+aAAssAeFa1Se6IWD
         se4mtKdcKz1xBvSIZGKNPvR5niuOF/LrR5xSAXQc5cD6MHKlZjj6/v1d7KcjdUfzbKEq
         EDkg==
X-Forwarded-Encrypted: i=1; AKwUvBzVMDJx3uWxp04n5ov8R5oFkEaZtSacHaCaHzvww9ANcNG+5m2hLRLJ3PK/hySGIbP2xLCTmp19GTg=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKfuXQtr2GgHXHbUV6myCbq5TfvMpFIOKDLgOhWxFwWIA/Xj41E
	fiVxAt6HIiThuGs/jKTzudC+UsgmOa7Krcu1SXQo5HwjxwzM/1bALN06dpJHHSQ5thcR6p5Fi+k
	oF1YTESEHlg==
X-Received: from dybmf44.prod.google.com ([2002:a05:7301:92c:b0:358:41fa:f46f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c8c2:b0:35a:8dad:6724
 with SMTP id 5a478bee46e88-35a8dad7ec8mr9213311eec.22.1791931228757; Tue, 13
 Oct 2026 15:40:28 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:42 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-8-irogers@google.com>
Subject: [PATCH 07/11] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
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
X-purgate-ID: tlsNG-d25034/1791931231-022C0A5B-ABF9157D/13/0
X-purgate-type: clean
X-purgate-size: 1197

hypervisor_init() in drivers/base/hypervisor.c creates hypervisor_kobj
with kobject_create_and_add() (which allocates a dynamic kobject using
dynamic_kobj_ktype), and hypervisor_subsys_init() in
drivers/xen/sys-hypervisor.c then overwrites hypervisor_kobj->ktype with
&hyp_sysfs_kobj_type, which had no .release callback.

Add hyp_sysfs_release() calling kfree(kobj) to preserve the dynamic
kobject release behavior.

Fixes: cff7e81b3dd7 ("xen: add /sys/hypervisor support")
Assisted-by: Antigravity:gemini-3.1-pro
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
2.56.0.385.gd3acb90ef8-goog


