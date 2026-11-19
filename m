Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AB3606A326
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 19:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M8grnIPM
Received: from list by lists.xenproject.org with outflank-mailman.1496857.1695210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU7lj-0003yS-32; Thu, 19 Nov 2026 19:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496857.1695210; Thu, 19 Nov 2026 19:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU7li-0003y2-Ut; Thu, 19 Nov 2026 19:26:02 +0000
Received: by outflank-mailman (input) for mailman id 1496857;
 Thu, 19 Nov 2026 19:26:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3Rk3_agcKCT0hqnfdqrfnnfkd.bnlwdm-cdudkkhrsr.wdmoqnidbs.nqf@flex--irogers.bounces.google.com>)
 id 1xU7lh-0003rE-M5
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 19:26:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU7lh-009Gtq-2c
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 20:26:01 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3Rk3_agcKCT0hqnfdqrfnnfkd.bnlwdm-cdudkkhrsr.wdmoqnidbs.nqf@flex--irogers.bounces.google.com>)
 id 6aff4d00-bab6-0a2a0a5309dd-0a2a4501bb7a-46
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 20:26:01 +0100
Received: from [209.85.210.199] (helo=mail-pf1-f199.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3Rk3_agcKCT0hqnfdqrfnnfkd.bnlwdm-cdudkkhrsr.wdmoqnidbs.nqf@flex--irogers.bounces.google.com>)
 id 6aff4d47-5bcc-0a2a45010019-d155d2c7ec54-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 20:26:00 +0100
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-8a0522cdaf3so128907b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 11:26:00 -0800 (PST)
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
        d=google.com; s=20260707; t=1795116359; x=1795721159; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCKguj/vcFyjyUsBFpEVwvA/Ew8DwdobaKTpU+d8I2Y=;
        b=M8grnIPML6ii9Yu3gnxkle744qJYZfA598Iq4AswY5uJlNHpTTSaqO1cjcZiyunD8N
         nj8IWoBQYS7ajgPw1Q4VTUMbm2VdNpNpfQck+clmBQ+ctkkV1rlfpMwbd+bmWoVYL8eD
         8JktL0BU70L6jIvQswEUJP/UfVuyqfyw/hvHlHDwnrtz/sUTEn7T8yehkgseYNEL2rkc
         9LvM35wUZdTp5OoT7nm7yZQJYooh5wBxS0Tzqz/DBR9DwirYRC9MGT2ONikD0NgH1mr7
         jM0VJCZNZXRJ4f5BG7ab99y2K67wAOlUhHzFGdX/1BeEAiCeJcteUgA+LUyz+bTnPrCH
         X71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116359; x=1795721159;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCKguj/vcFyjyUsBFpEVwvA/Ew8DwdobaKTpU+d8I2Y=;
        b=vLb/SpOUCDRrMIeOQL2pEw5WM138jcgq4nnaaosxWGLb/uv+6T4e7PjssnNPkDsc4V
         W7UN88Dk5jN6b/PQVjfYdx7DYqq1CBY3UiIY5jmrR4fVLuPdkO1S3OhO5DhwGq22u7io
         358DS48GjtwkY7yiZJBmqJZyiAIVqtIvpgUhXA/i4Mq3i4GpzgYsjuLwB2alFlDC1H/r
         HjJX0Y/Z5AcNeLKxw4W7bpBjWTPJrfpCgjl8qqKUqTaFusrwd02KLszM7t+UVV7DEJdf
         ez94czSNRcjiDGRqg3K9o+hA3kiv5+sANjjFYZxa37smlxoIpaQShqGmgU3Gnf0UaAfB
         K3rA==
X-Forwarded-Encrypted: i=1; AL+hErFuXJom9BMuct0lu2yscm3rvy2zaan+Og8fzlvGcjAq2QAt2mO1g6M1tnaLCWMXLMRpZ8zxmVbfK0o=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+kpEtcSiofFyH/9UTWGxB6xMACVRR2B/ZDDzEHRTjz9ttn0mYj
	HNTF3YPygBstn7b1M7H0aJSdzpdcWIZMDjok+ODXS1AKik7JizTdRm/U0FoKRbW1x2z/MSu+xiK
	AIqaueLe+qQ==
X-Received: from pgjk11-n2.prod.google.com ([2002:a05:6a02:81cb:20b0:cd6:1fc4:6199])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9191:b0:3fb:1bfb:ff29
 with SMTP id adf61e73a8af0-4014e74d624mr589862637.69.1795116358583; Thu, 19
 Nov 2026 11:25:58 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:17 -0800
In-Reply-To: <20261119192520.1983406-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119192520.1983406-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119192520.1983406-7-irogers@google.com>
Subject: [PATCH v4 6/9] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
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
X-purgate-ID: tlsNG-d62444/1795116361-4C5555FD-B969FD0E/0/0
X-purgate-type: clean
X-purgate-size: 1202
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
Reviewed-by: Juergen Gross <jgross@suse.com>
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
2.56.1.708.g77570a6a1d-goog


