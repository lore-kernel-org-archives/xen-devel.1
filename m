Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06B7606A322
	for <xen-devel@archiver.kernel.org>; Sun,  8 Nov 2026 22:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fjV4tvdv
Received: from list by lists.xenproject.org with outflank-mailman.1479086.1683143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQBYD-0004Qk-M7; Sun, 08 Nov 2026 22:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479086.1683143; Sun, 08 Nov 2026 22:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQBYD-0004Pv-Gu; Sun, 08 Nov 2026 22:39:49 +0000
Received: by outflank-mailman (input) for mailman id 1479086;
 Sun, 08 Nov 2026 22:39:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3MfrwagcKCUgs1yqo12qyyqvo.myw7ox-no5ovvs232.7oxz1ytom3.y1q@flex--irogers.bounces.google.com>)
 id 1xQBYC-0004L8-Uj
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2026 22:39:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQBYC-001uiE-Bb
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2026 23:39:48 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3MfrwagcKCUgs1yqo12qyyqvo.myw7ox-no5ovvs232.7oxz1ytom3.y1q@flex--irogers.bounces.google.com>)
 id 6af0f998-e002-0a2a0a5209dd-0a2a4501b036-14
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 23:39:48 +0100
Received: from [74.125.82.197] (helo=mail-dy1-f197.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3MfrwagcKCUgs1yqo12qyyqvo.myw7ox-no5ovvs232.7oxz1ytom3.y1q@flex--irogers.bounces.google.com>)
 id 6af0fa32-5984-0a2a45010019-4a7d52c5a446-3
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 23:39:48 +0100
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-36cec75d8caso401606eec.0
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 14:39:47 -0800 (PST)
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
        d=google.com; s=20260707; t=1794177586; x=1794782386; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwXDua19Tz/IicJklctcGTeEqQvEHLiE8QZruqc+WN4=;
        b=fjV4tvdvbzTG3Ck3c1xXAzWicejVf6DyRh7Bg4WFVXBE1Xt+jLEiLKwirDBpk9fNKu
         FTp3HHkk61EEtTwxEqR27TcdCCzv9J+SM7OO77vJFqrBJI3GQy1aZeR5USfb7NhX+fwc
         VGzT11trMfN/xuJQf/MYNklVNKV/v79jsRjtOpNws6JYKvw14Bjl03rymmLiVwPGddMd
         NnRIeHVY1m7JMowot7tUzRSY2wWRRN51yeIsB3IhpWvPlndAY0YfX2WM5nfq4m7RNLwB
         tqwamWoVczf8rJbE8HBcYOpshxJ1XNXyU1Vsx/UrgXYpnCPR24T3D1g6zVpkOY0ZyDBt
         TsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177586; x=1794782386;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwXDua19Tz/IicJklctcGTeEqQvEHLiE8QZruqc+WN4=;
        b=pCOg/rR8QZdPoHnJab+zsTHua2gy96sCJ9j+ewb+WUiwRz6CAMXm+Gzhzc/VghbwAk
         bLI3BHRnYf80Fu/4Dg3kwo3bK+lezAe/OfdhsCDQGpEYTZiX50GL6EV0c4x7HvjyO3wy
         8DN1iQzbkwnT0jUbZqMj+P59I4bfc6YJwSqjPJQkPSNKyddnXjSpB8ga3aE9RZn4+twj
         nRE1AXnDsqj8dw/45QKEk0Zesr4a3DsTUTmVW6gfeP2gdI1K1vhNQpelCwQuekQvBoye
         sfDlR+h0Vt0+yo/U5ra4QdQX+JM0mssekKaw2x9bKVuSHq8O5NZdGAERkUgnCskPle6V
         uqkQ==
X-Forwarded-Encrypted: i=1; AL+hErFMW50HI0tmW3+PeyNiYWI1MFP3/Hg9SyHayUYvpcGkeMtD2S7FGbfQTyp9Oletgw6DpqCTMys6Muo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+K2u9sbBccPinZgZPEtY/YZcnYJSAoy+n5onOOMcgcbWyEn4sH
	XJ0ucoXL0DDttMrZz4rsMUkh/tS/oK1ZzM0Tazb0LxEuKl8fJ+Ovje9E5wM38nhSNrOslLdFQvb
	3z4nAYWrhOQ==
X-Received: from dyx10.prod.google.com ([2002:a05:693c:820a:b0:36a:eec:f68c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c00c:10b0:36d:dcdb:70c5
 with SMTP id 5a478bee46e88-370f7b8f918mr9710009eec.20.1794177585797; Sun, 08
 Nov 2026 14:39:45 -0800 (PST)
Date: Sun,  8 Nov 2026 14:39:07 -0800
In-Reply-To: <20261108223913.3624571-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108223913.3624571-4-irogers@google.com>
Subject: [PATCH v3 3/9] sh: sq: Add missing kobject release callback to ktype_percpu_entry
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
X-purgate-ID: tlsNG-d62444/1794177588-BE465757-809DDBA9/0/0
X-purgate-type: clean
X-purgate-size: 1055
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
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
2.56.0.455.g6c5a503b38-goog


