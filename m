Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3A5C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:18:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430415.1652917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mrl-0000ww-Eg; Wed, 23 Sep 2026 13:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430415.1652917; Wed, 23 Sep 2026 13:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mrl-0000wO-BX; Wed, 23 Sep 2026 13:18:29 +0000
Received: by outflank-mailman (input) for mailman id 1430415;
 Wed, 23 Sep 2026 13:18:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Mrk-0000qi-JD
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:18:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Mrj-00BPR0-WF
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:18:28 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d196-e002-0a2a0a5209dd-0a2a4509cd0a-40
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:18:27 +0200
Received: from [74.125.229.170] (helo=mail-dl2-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d19e-be1a-0a2a45090019-4a7de5aab093-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:18:24 +0200
Received: by mail-dl2-f42.google.com with SMTP id
 a92af1059eb24-144df39b6cfso669980c88.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:18:23 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:18:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169502; x=1790774302; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqkLIHs8nht5THiWcj2P453LN93rHp/TnF9wI3rp1V4=;
        b=IZTi+iUqgq2UzgTCIfTNo53ZA8cS+pSLDrThfPnF1Jp0aeoUgqbudlXceH+so0mATG
         ApfwhCo9jXzJhii0csXAYjNh68Y8FAqRAO38q+R/W075y6SBpfnnkmRlsaCALghqv+0m
         LuKPTAHe1rAkyjs2HQn3dkABWlrOt6e5XCI5EIQN05NmnMh70S0n8sQSoCTHbiXJnkKK
         LfidcI5+EvxJHW6QhVNChcjsr4VSqVMu0Il/jI7q/ewYoW2hyLdxC3ELfKUxXssFxymL
         xmJXUfjPjBhp2gJoJJJ5XWGLlay37BBk5Av3wdBsTRhFe9c2qPAOL7MA8NGE1DaTQ4o/
         9Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169502; x=1790774302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqkLIHs8nht5THiWcj2P453LN93rHp/TnF9wI3rp1V4=;
        b=erLIeOawmRgXCjaKyXSgpnnOqge5oagAt1H0KmwVxs/CqmToiXgtjwl039kFNY6vN0
         fLRUXYKvgceb3+FDEa7r7j8XbdnMywy6VAvL3n0pDvokO7WVDdFl5RwGkupsondAphZ+
         Bf0bqYRDN6kFg9K5jIqXV4xIUlIiGFQGdn3uhZvKB7JC/mNM8TPbzKplJ+Wjtt7ShvC2
         rhA2p3BvcirW7t/pEJ+vX/AmsdtqIHNcrx7MkNitCamVWy3BFaJaCYfNNDQBNxEIruGs
         aCh1/p0StgQvvIEtD1JdvoTAsXaxL299rGxb2qLN1FwMTRPjGZ5I5j9bdxfcg3x5syg1
         MSuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwppuoJNJJGS3YeQY+kfjPc7w27qrKCe3sZP3J1CCzKpGYJT4DnAL4Bo/UTkwR1yXXtMQPB7IDNVV0=@lists.xenproject.org
X-Gm-Message-State: AFuF++nuWjmgb9RCM07FCr3B8GxeZiVGvpHPx8jMKuO5iaHJPqkviV/I
	qef5JHAtS3am1l6wmqABQx2+BwSpihZjpLLcHICi3vvoDo8FMmb9cyUy
X-Gm-Gg: AYBFou3QUIUf0g4GR7Qo36EdCaId8kwGmPpNtArfpCYc1FwBFmFQ8L7myuykNSnzupm
	1XdbznjKjrC7+a3wVcle896QvxVUWB2Y0G7Eu4cmIz3GOlxvDQrhQYBcbQHcPYXOx3ciRQZ4LX1
	gnfKkeJNKfMg9dy47gwWNlMfOSeHANDz/3QmuTf2BnFs2OaM19m4OskUDs9AHCLgKUlyiGE0M11
	dqPkDatp+P5NFA3L5n+OvldVYunLT2vLsFP2KSfLFHj43dsrHSiMJWrEMyqC0ouEBdWeldYVSYM
	iYA4aUR4PRSfExLDsyVvGNrm7fOKWjon/cyhcLKKDWOFaZdwSBWLIR/twsn4biwr6g8vV3q3eYg
	nq21J1KGvQsr16fA+oMF74HtLzCt2fv90fNXBYV9OjTrCQBt1mcA2u76wC/RBKZmZOWsAkbE0xd
	B+RkFO5c8pk/4oUwKS0JeRs2AsW2ekl/THz7NHQEQC04yG+VK2Sf588ll7dYacD0V50m4vKqxOS
	NRseajLahHCP86OGhGGCntF3dpnvPOpR6YUpo1i/w==
X-Received: by 2002:a05:7022:fa9:b0:143:2719:a501 with SMTP id a92af1059eb24-144f9173969mr4195539c88.40.1790169493859;
        Wed, 23 Sep 2026 06:18:13 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
	xen-devel@lists.xenproject.org,
	Chao Liu <chao.liu@processmission.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
	Peter Xu <peterx@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Fabiano Rosas <farosas@suse.de>,
	Xianglai Li <lixianglai@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bibo Mao <maobibo@loongson.cn>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	David Hildenbrand <david@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	qemu-riscv@nongnu.org,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stafford Horne <shorne@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Song Gao <17746591750@163.com>,
	qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 009/114] tests/unit: add test-target-info
Date: Wed, 23 Sep 2026 21:14:43 +0800
Message-ID: <20260923131635.1894-10-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1790169504-3B0DD034-5014A523/0/0
X-purgate-type: clean
X-purgate-size: 3224

Collect each target-info-def.c object in target_info_def_objects,
keyed by target dir. Link every value so constructors fill the
list. Assert target_info() is not NULL and target_info_list() has
one entry per linked object.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build                   |  6 +++++-
 tests/unit/meson.build        |  4 ++++
 tests/unit/test-target-info.c | 38 +++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 tests/unit/test-target-info.c

diff --git a/meson.build b/meson.build
index 9a6a80fd0c8..776d38c5afd 100644
--- a/meson.build
+++ b/meson.build
@@ -4260,6 +4260,8 @@ endif
 
 traceable = []
 emulators = {}
+target_info_def = files('target-info-def.c')
+target_info_def_objects = {}
 foreach target : target_dirs
   config_target = config_target_mak[target]
   target_name = config_target['TARGET_NAME']
@@ -4331,7 +4333,7 @@ foreach target : target_dirs
     endif
   endif
 
-  arch_srcs += files('target-info-def.c')
+  arch_srcs += target_info_def
 
   if target_base_arch in target_arch
     t = target_arch[target_base_arch].apply(config_target, strict: false)
@@ -4409,6 +4411,8 @@ foreach target : target_dirs
                  c_args: c_args,
                  build_by_default: false)
 
+  target_info_def_objects += {target: lib.extract_objects(target_info_def)}
+
   if target.endswith('-softmmu')
     execs = [{
       'name': 'qemu-system-' + target_name,
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index e47bc7225ab..dc980a35955 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -43,6 +43,10 @@ tests = {
   'test-qgraph': ['../qtest/libqos/qgraph.c'],
   'check-qom-interface': [qom],
   'check-qom-proplist': [qom],
+  'test-target-info': [qom, declare_dependency(
+    objects: target_info_def_objects.values(),
+    compile_args: ['-DTARGET_INFO_DEF_COUNT=@0@'.format(
+      target_info_def_objects.values().length())])],
   'test-qemu-opts': [],
   'test-keyval': [testqapi],
   'test-logging': [],
diff --git a/tests/unit/test-target-info.c b/tests/unit/test-target-info.c
new file mode 100644
index 00000000000..e6de9b259e8
--- /dev/null
+++ b/tests/unit/test-target-info.c
@@ -0,0 +1,38 @@
+/*
+ * TargetInfo unit tests
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/target-info.h"
+#include "qemu/target-info-def.h"
+
+static int target_info_list_count(void)
+{
+    TargetInfoNode *node;
+    int n = 0;
+
+    QLIST_FOREACH(node, target_info_list(), next) {
+        n++;
+    }
+    return n;
+}
+
+static void test_target_info_not_null(void)
+{
+    g_assert_nonnull(target_info());
+}
+
+static void test_target_info_list_count(void)
+{
+    g_assert_cmpint(target_info_list_count(), ==, TARGET_INFO_DEF_COUNT);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    g_test_add_func("/target-info/not-null", test_target_info_not_null);
+    g_test_add_func("/target-info/list-count", test_target_info_list_count);
+    return g_test_run();
+}
-- 
2.52.0.windows.1


