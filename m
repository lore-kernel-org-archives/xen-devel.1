Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90261C982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:20:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430477.1652990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mt7-0005RF-SZ; Wed, 23 Sep 2026 13:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430477.1652990; Wed, 23 Sep 2026 13:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mt7-0005R8-P2; Wed, 23 Sep 2026 13:19:53 +0000
Received: by outflank-mailman (input) for mailman id 1430477;
 Wed, 23 Sep 2026 13:19:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Mt7-0005QF-7k
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:19:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Mt6-00Dqoq-Ko
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:19:52 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d1f4-bab6-0a2a0a5309dd-0a2a4506c18e-16
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:19:52 +0200
Received: from [74.125.229.12] (helo=mail-dy2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d1f7-195a-0a2a45060019-4a7de50c91e6-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:19:52 +0200
Received: by mail-dy2-f12.google.com with SMTP id
 5a478bee46e88-32dbbe82e13so792389eec.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:19:51 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:19:44 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169590; x=1790774390; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kG8T0B41yOsfKs7+mPQWY4VwYoc5DWh5xeT8YOfa6ig=;
        b=OZKuO9doxlu4czHwgw4/o9yxizw54tDVfoSTRmNCGzO1qrpTRqGDERPoTwCwUv1QSW
         dabFP8NRH70EWJTrjhAkub2nkVpG6HDiVkcEVv6zh38wmJCJmywv3ihIyASfkX4a2yZa
         X9DIK2mEGHi25o4VCcilsGcSpEaMV9Cj8uLa6Aqr39+ppDSpFHkhNhQrDfji+y+yWqGm
         j5gaw7C0XNRW9UHdLI+ikiztboR1FtFCOwQD/VyFbqiLTbRwbMK8qxu46ZpYBnNPQH/s
         3Vo11vBiI0iyevLKrj4u2wUVtskZ897bR/dN9StqilY2VGjW9LIDVp1IYGO8o6INa0kB
         2+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169590; x=1790774390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kG8T0B41yOsfKs7+mPQWY4VwYoc5DWh5xeT8YOfa6ig=;
        b=OT0ijt4RF7gCCAkbMLqypyiQA/pOxkNqQVrETsow/M6VQgmcRLTKPuE4s2OiLMxg6D
         XAGd19yNHHwUus/xGKRQ3ku5EO1fGG02ARG/YjSYwR2rPKj+gV1lQU82v6yVM/igUcjj
         Ro7uqsu2q2JIMiybn08IbBvuW/FvIAPnGR9qbCxy7JeFmhjc1jRz883EkKCn4ocqrp8y
         ZPVmWo24nFQL5U9ejtjnI27qkEqzYdG29hdQWRi4WRQTGUDYcWsKAJq29ZR0l+rauvtP
         LysKBWDtFCE4Em9tV4qBsREURuz82XHouyGyHM2rj9CU7MROAn+mdeq13/sDCrYNe8HS
         oV0Q==
X-Forwarded-Encrypted: i=1; AKwUvByw7iAjXtIa355Im0zpjMJ6fAOfelaaUFOZ/WwUuak/iZ2+OQGjqKDvUHnE+NEUrp4qFkYC5IQ1TqM=@lists.xenproject.org
X-Gm-Message-State: AFuF++kxyRXfNwtNjyPLwuop4gfa4xKG066n8cfzP0OvzsxCRsxb4s/d
	trm4NEqgKEDqIEM6RdA477al52vATJXJFOIXy2V5P66dMxGKbVabOYjp
X-Gm-Gg: AYBFou1ImXor6wrPbh6ClIFO4E2gASDBzFyV5TRXHQQl+US+HybxubgGIi5oIRtBPBk
	BkSYvbUZ1iXrGoHgijn5RD6Z8oWY7OEjrqQsI/Lh10HanIeMwW/yXmtTS0vFnfsmMzeF7n3EJg0
	7LHdsv+IGBo/zwTfcrkxAVQ6JB4CzkwE7QPKizEGB6vCpmL+ZqtrkXc54kuhHyPgX6K2nlvGx0u
	ytC4qxkwfWeZ2rIhR/UR2zke0/t9sOnzexQ8MeC158ENcWEnmiRDa+HREF5Awr5OFlX25J4YFOT
	39pMPrzj6iLwYPg3VQ+zj49+0wkxrA+TE3C168gHW/zsNePj6aZkHJVa/Eh/Zo1RYAL02E36ElM
	QIYAfq7LEvyOqZXqYFYXJDBuPIDkGQNhZMRqhWew46Aot1eX+PfH6rdHRmwjc1znOt9st6SGUZJ
	mG7qEewDTsRAFyMYkx2T18zegwyeCj3KK4UdB/0KzURwUIJWF+gpLz88dzEWd0DwOnC6TVheMC0
	pERiF2hDZZ5F7IZrAHcX5Pnt0U39AE=
X-Received: by 2002:a05:693c:87ce:20b0:33e:5cb6:249e with SMTP id 5a478bee46e88-33e8ddc761cmr2337090eec.39.1790169589850;
        Wed, 23 Sep 2026 06:19:49 -0700 (PDT)
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
Subject: [PATCH v3 017/114] module: add before/after hooks and module_call_init_fn
Date: Wed, 23 Sep 2026 21:14:51 +0800
Message-ID: <20260923131635.1894-18-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1790169592-F6A7477B-EC12C471/0/0
X-purgate-type: clean
X-purgate-size: 5164

module_call_init just walks the list. Add register_module_hooks
so one init type can wrap that walk with before and after
ModuleInitHook callbacks, and add module_call_init_fn so a single
function takes the same path.

module_call_init passes MODULE_INIT_PHASE_ON. A DSO or
module_call_init_fn passes DSO_BEFORE until module_call_init
finishes, then DSO_AFTER.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/module.h | 18 +++++++++++
 util/module.c         | 70 ++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 84 insertions(+), 4 deletions(-)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index 34e05c75348..c10e32731fa 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -60,6 +60,20 @@ typedef enum {
 
 typedef void (ModuleInitFn)(void);
 
+/*
+ * Where one module_init_run sits relative to module_call_init().
+ * DSO_BEFORE: a DSO or module_call_init_fn before module_call_init().
+ * ON: module_call_init() itself.
+ * DSO_AFTER: a DSO or module_call_init_fn after module_call_init().
+ */
+typedef enum ModuleInitPhase {
+    MODULE_INIT_PHASE_DSO_BEFORE,
+    MODULE_INIT_PHASE_ON,
+    MODULE_INIT_PHASE_DSO_AFTER,
+} ModuleInitPhase;
+
+typedef bool (ModuleInitHook)(ModuleInitPhase phase, Error **errp);
+
 typedef struct ModuleEntry {
     ModuleInitFn *init;
     QTAILQ_ENTRY(ModuleEntry) node;
@@ -82,6 +96,10 @@ void register_module_init(ModuleEntry *e, module_init_type type);
 void register_dso_module_init(ModuleEntry *e, module_init_type type);
 
 void module_call_init(module_init_type type);
+void module_call_init_fn(module_init_type type, ModuleInitFn *init, Error **errp);
+
+void register_module_hooks(module_init_type type,
+                           ModuleInitHook *before, ModuleInitHook *after);
 
 /*
  * module_load: attempt to load a module from a set of directories
diff --git a/util/module.c b/util/module.c
index 6c5980542f6..a007ecb53a6 100644
--- a/util/module.c
+++ b/util/module.c
@@ -32,6 +32,8 @@ typedef QTAILQ_HEAD(, ModuleEntry) ModuleEntryList;
 typedef struct ModuleInit
 {
     module_init_type type;
+    ModuleInitHook *before;
+    ModuleInitHook *after;
     ModuleEntryList list;
     ModuleEntryList dso_list;
     bool done;
@@ -88,14 +90,54 @@ void register_dso_module_init(ModuleEntry *e, module_init_type type)
     module_init_add(&find_type(type)->dso_list, e);
 }
 
-static void module_init_run(ModuleInit *m, ModuleEntryList *list)
+/**
+ * register_module_hooks:
+ * @type: init list
+ * @before: runs before every registered init for @type
+ * @after: runs after every registered init for @type
+ *
+ * One ModuleInit holds both callbacks so before and after stay 1:1.
+ * module_call_init(@type) passes MODULE_INIT_PHASE_ON. A DSO or
+ * module_call_init_fn passes DSO_BEFORE if module_call_init() has not
+ * finished, otherwise DSO_AFTER.
+ */
+void register_module_hooks(module_init_type type,
+                           ModuleInitHook *before, ModuleInitHook *after)
+{
+    ModuleInit *m = find_type(type);
+
+    g_assert(before);
+    g_assert(after);
+    g_assert(!m->before && !m->after);
+
+    m->before = before;
+    m->after = after;
+}
+
+static bool module_init_run(ModuleInit *m, ModuleEntryList *list, bool is_dso,
+                            Error **errp)
 {
     ModuleEntry *e;
+    ModuleInitPhase phase;
+
+    if (!is_dso) {
+        phase = MODULE_INIT_PHASE_ON;
+    } else if (m->done) {
+        phase = MODULE_INIT_PHASE_DSO_AFTER;
+    } else {
+        phase = MODULE_INIT_PHASE_DSO_BEFORE;
+    }
 
-    (void)m;
+    if (m->before && !m->before(phase, errp)) {
+        return false;
+    }
     QTAILQ_FOREACH(e, list, node) {
         e->init();
     }
+    if (m->after && !m->after(phase, errp)) {
+        return false;
+    }
+    return true;
 }
 
 void module_call_init(module_init_type type)
@@ -106,10 +148,27 @@ void module_call_init(module_init_type type)
         return;
     }
 
-    module_init_run(m, &m->list);
+    module_init_run(m, &m->list, false, &error_abort);
     m->done = true;
 }
 
+/*
+ * Run a single init through @type's before/after hooks with is_dso=true.
+ * May run before or after module_call_init.
+ */
+void module_call_init_fn(module_init_type type, ModuleInitFn *init, Error **errp)
+{
+    ModuleInit *m = find_type(type);
+    ModuleEntry e = {
+        .init = init,
+    };
+    ModuleEntryList list;
+
+    QTAILQ_INIT(&list);
+    QTAILQ_INSERT_TAIL(&list, &e, node);
+    module_init_run(m, &list, true, errp);
+}
+
 #ifdef CONFIG_MODULES
 
 static const QemuModinfo module_info_stub[] = { {
@@ -201,7 +260,10 @@ static bool module_load_dso(const char *fname, bool export_symbols,
             continue;
         }
 
-        module_init_run(m, &m->dso_list);
+        if (!module_init_run(m, &m->dso_list, true, errp)) {
+            empty_dso_lists();
+            return false;
+        }
     }
     trace_module_load_module(fname);
     empty_dso_lists();
-- 
2.52.0.windows.1


