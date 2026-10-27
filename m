Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F7D60A262B
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 22:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nptYGcBi
Received: from list by lists.xenproject.org with outflank-mailman.1462690.1673691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLpp9-0000yw-SP; Tue, 27 Oct 2026 22:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462690.1673691; Tue, 27 Oct 2026 22:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLpp9-0000yn-Ng; Tue, 27 Oct 2026 22:39:19 +0000
Received: by outflank-mailman (input) for mailman id 1462690;
 Tue, 27 Oct 2026 22:39:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3EyjhagcKCUYqzwomz0owwotm.kwu5mv-lm3mttq010.5mvxzwrmk1.wzo@flex--irogers.bounces.google.com>)
 id 1xLpp8-0000xz-Jr
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:39:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLpp8-0014Yn-0k
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 23:39:18 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3EyjhagcKCUYqzwomz0owwotm.kwu5mv-lm3mttq010.5mvxzwrmk1.wzo@flex--irogers.bounces.google.com>)
 id 6ae127f8-2eae-0a2a0a5409dd-0a2a4501a848-14
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 23:39:17 +0100
Received: from [74.125.82.69] (helo=mail-dl1-f69.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3EyjhagcKCUYqzwomz0owwotm.kwu5mv-lm3mttq010.5mvxzwrmk1.wzo@flex--irogers.bounces.google.com>)
 id 6ae12814-5984-0a2a45010019-4a7d5245d558-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 23:39:17 +0100
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-15c16792146so167206c88.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 15:39:17 -0700 (PDT)
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
        d=google.com; s=20260707; t=1793140756; x=1793745556; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZ/TSWTZAJNbAAfYXfetESQgQ8bp7xksXUAoJHJHiFs=;
        b=nptYGcBijIO1LE+GHkedrP2Vfh1/0grRyyFkE/tpCF1WLKxMbDONNB58liw03MHaWh
         87E/xjDI9N6XmM0jyz/N3jzWPr07GOj/dHxGmgBmRZ0EZeUFOPpYykio3L16gWDxlPIk
         ymSrTevh1QXPQ1DXEJOGK5BtzGGEKIKM/nuy0lGaX/fDAIE3G2VtnCu86We1dJgL7AEO
         6d3+mIaD7ZbNJ6UoPf2/weASTXQYu6FN9+QWsMRFXWoL9AWZQ91dWx3ejtQFh8qC50pT
         3sF7ipEOi/DeOUI6ECZPs2xBPURAYoyerayuNf+0lgyuaAVSoda+pJMLuAO6ksKDZx0s
         q1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140756; x=1793745556;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZ/TSWTZAJNbAAfYXfetESQgQ8bp7xksXUAoJHJHiFs=;
        b=nl5cP3iXi7TYSzwh/hN23SJux4GlAQc53wSrq2kkT+VIfibVUpl2DdH6n6xtWN7OKr
         3mFf+M/cinxAyR7b2tHOUBbcoRQnWhqTgfjP3dUO/hjsWWv+dRxXv1l9xRugOFOZ541q
         bf9yM9JtNr66AwErynIymwIJfsQHmf8sgy/EWzKBitiNNB9PdUyPE9xeGxEJz65/eJXd
         zvX0HQe8C4aAVTj02zK2E/1FaEwQendLIyvkT/IaIn8mGDhyP8AmGdI7BjGRvu5X0+EW
         7bHFEmYamCHf+bKnglzASA6g+9U9gtZ+T3KMY0nDA3eshIba225B5OQg7E6qIDhqwXy0
         3aBg==
X-Forwarded-Encrypted: i=1; AKwUvBxuNXaj0stHzUFZmwRHQGEjFI/LGa5fBwlPVii6f9d7fu7kBzCQuParu1Wjtc8yxHPKMM6pXV/CuVE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLopVSFJwdZa/0HgEuU3w34b8PcJ4d2YcYzguayIok7WH0nDb6D
	eqIXo5Se+tlSS1jzI/IYfFgX45/mBAeHMAiPP30tV4dJt5zTPnz/rU6vcOwbD7guo8NPFUa7CoG
	67gjyTVR6pA==
X-Received: from dlbrl28.prod.google.com ([2002:a05:7022:f51c:b0:192:91:5cc4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:618:b0:19f:527d:96da
 with SMTP id a92af1059eb24-1a6cdd3e006mr1194989c88.33.1793140755024; Tue, 27
 Oct 2026 15:39:15 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:38:37 -0700
In-Reply-To: <20261027223847.652884-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027223847.652884-3-irogers@google.com>
Subject: [PATCH v2 2/9] powerpc/secvar: Add missing kobject release callback
 to secvar_ktype
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
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Nayna Jain <nayna@linux.ibm.com>, Eric Richter <erichte@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d62444/1793140757-BF063757-B9CB074D/0/0
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
2.56.0.313.g2479322e68-goog


