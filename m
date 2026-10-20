Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A48C606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 10:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JaiHpW5p
Received: from list by lists.xenproject.org with outflank-mailman.1455404.1669390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ7Xd-0007Nt-BV; Tue, 20 Oct 2026 10:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455404.1669390; Tue, 20 Oct 2026 10:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ7Xb-0007D8-BS; Tue, 20 Oct 2026 10:57:59 +0000
Received: by outflank-mailman (input) for mailman id 1455404;
 Tue, 20 Oct 2026 10:52:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xJ7S1-0000RO-VR
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 10:52:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ7S1-00Cs6O-Bb
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 12:52:13 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ad747dd-e002-0a2a0a5209dd-0a2a45068648-0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 12:52:13 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ad747dc-195a-0a2a45060019-aa0a857cab35-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 12:52:13 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-7pgMjRlDPJm6ek2MrAPphA-1; Tue,
 20 Oct 2026 10:52:08 +0000
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0A12B1954ACE; Tue, 20 Oct 2026 10:52:04 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 81B4630000E7; Tue, 20 Oct 2026 10:52:01 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792493532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cht00yUtxWZgYYGvkiDrdQx2K2tPqKneM6BMi8EBSe8=;
	b=JaiHpW5pNptVTLB7kq5Loz5RYWsz0iErLrcBMQyuIH2NKRp/XtwXC0Fo8kcAcKMTa/GByy
	PXiWvaEOgXNT6N/xpromKLPXwbMAYgPHHoMCaJ9WvKZifDD4qmpMYHnULwOqwM7crvzIpE
	FkkBzsY6OxL878kJyet2CGiWhQwacI0=
X-MC-Unique: 7pgMjRlDPJm6ek2MrAPphA-1
X-Mimecast-MFC-AGG-ID: 7pgMjRlDPJm6ek2MrAPphA_1792493524
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Tue, 20 Oct 2026 14:46:22 +0400
Subject: [PATCH v7 65/65] tests/qmp-cmd-test: assert qapi-type resolves in
 query-qmp-schema
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261020-qom-qapi-v7-65-431a86b02b58@redhat.com>
References: <20261020-qom-qapi-v7-0-431a86b02b58@redhat.com>
In-Reply-To: <20261020-qom-qapi-v7-0-431a86b02b58@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Eric Blake <eblake@redhat.com>, 
 David Hildenbrand <david@kernel.org>, Igor Mammedov <imammedo@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
 kvm@vger.kernel.org, Alberto Garcia <berto@igalia.com>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Jonathan Cameron <jic23@kernel.org>, 
 Junjie Cao <junjie.cao@intel.com>, Anisa Su <anisa.su@samsung.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 Jagannathan Raman <jag.raman@oracle.com>, 
 John Levon <john.levon@nutanix.com>, 
 Thanos Makatos <thanos.makatos@nutanix.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-block@nongnu.org, 
 linux-cxl@vger.kernel.org, qemu-s390x@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>, 
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
 Song Gao <17746591750@163.com>, Bibo Mao <maobibo@loongson.cn>, 
 Xianglai Li <lixianglai@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Pedro Barbuda <pbarbuda@microsoft.com>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Amit Machhiwal <amachhiw@linux.ibm.com>, qemu-ppc@nongnu.org, 
 Zhang Chen <zhangckid@gmail.com>, Li Zhijian <lizhijian@fujitsu.com>, 
 Alistair Francis <alistair@alistair23.me>, Alexander Graf <graf@amazon.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 zhenwei pi <zhenwei.pi@linux.dev>, Ani Sinha <anisinha@redhat.com>, 
 Luc Michel <luc@lmichel.fr>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Samuel Tardieu <sam@rfc1149.net>, "Denis V. Lunev" <den@openvz.org>, 
 FangSheng Huang <FangSheng.Huang@amd.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Hao Wu <wuhaotsh@google.com>, Keith Busch <kbusch@kernel.org>, 
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>, 
 Aditya Gupta <adityag@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>, 
 Conor Dooley <conor@kernel.org>, 
 Sebastian Huber <sebastian.huber@embedded-brains.de>, 
 Halil Pasic <pasic@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Jason Herne <jjherne@linux.ibm.com>, Titus Rwantare <titusr@google.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>, Peter Xu <peterx@redhat.com>, 
 Chinmay Rath <rathc@linux.ibm.com>, 
 Hendrik Brueckner <brueckner@linux.ibm.com>, xen-devel@lists.xenproject.org, 
 Roman Bolshakov <rbolshakov@ddn.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Fam Zheng <fam@euphon.net>, 
 Farhan Ali <alifm@linux.ibm.com>, Alex Williamson <alex@shazbot.org>, 
 Tao Tang <tangtao1634@phytium.com.cn>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Fabiano Rosas <farosas@suse.de>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Yoshinori Sato <yoshinori.sato@nifty.com>, Jiri Pirko <jiri@resnulli.us>, 
 Eric Auger <eric.auger@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3522;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=d0AC/pqR2xkFHzouOcdpk0rfewmoRKNngAyjCDgTMl8=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBq10ZdBKSnHJPBpmcmbmASu7qOtoUGXTowk7yNX
 g+tgxS9nNCJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCatdGXQAKCRDa6OEJdZac
 5YaTD/9vG9jkAEkIZLFzUN64FilSwr9riDSC6dE2d/cUhX4cjMjxDVeEJE3fOoiBKvDHuHP6Fam
 eLESfFQfsqJcKbQZcC7fZwpUyYgAah0Te7HBf1dTcZEFTRvKN74njWw41ZqG0c7tTwK2RvnjIsK
 8fHHImBlQjy3IQpEa+tkvQUC4iH8rw0sZLyrCG2YcdoTu7W+WXDLexUk2cOs0ruBPuwoKzJNY0h
 kfSjtPXCqWAYW/CLE/XAxTIg0npoHuOEJsdHN2vFua1QGpata7fM9WvmMdkxxN/mTWXE368BfaR
 SefydRBG8ysGItK2Wa42Jka1iFQCJauQfgYfzHLKFuwYgNDhmVGREedy/FHX4FKrmlFt+/DTCBT
 WQqkUunveY9WHZTah8Oyc6HQu217yOg1Pu1mzdUOKA7L5efOGeeF2VXLU4xx8F0cI3x9n1w2m9S
 ZjD8AIg2GEOQSHZTOHmvLShHGgZeqbIHmzkuVPwP9Uu0Xvd4oFkSUdsv018jZzRlsuC1WZ19WVs
 HwVfX09lvPTKCeCW/MnPJHOy4Jz9YIZOrueZvIMglgwQcZOoG8zo20m3HJUDkc4M1fhIN0xN5GX
 +pxjl6niKchvnstVDhaDerpY/9nebfmNnSTV8sMRAPUBnvklXn1847TNA0iuqTN+Qp24h+XOk0a
 iSGRIgq7QkVJWcA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: QGr1tgqQxZy1zMlcyfZ_8mAsnv1CZVgTP_7M39yeS5A_1792493524
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1792493533-FE27077B-F57D7AFD/0/0
X-purgate-type: clean
X-purgate-size: 3524
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For every QOM type returned by qom-list-types, call qom-list-properties
and verify that each property's qapi-type value (when present) maps to
a valid entry in the query-qmp-schema introspection output.

The test is gated behind g_test_slow() since it iterates all registered
QOM types.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/qtest/qmp-cmd-test.c | 55 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 279a8f5614e9..acb7b0dd6a9f 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -15,6 +15,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-visit-introspect.h"
 #include "qobject/qdict.h"
+#include "qobject/qlist.h"
 #include "qapi/qobject-input-visitor.h"
 
 const char common_args[] = "-nodefaults -machine none";
@@ -131,6 +132,8 @@ typedef struct {
     GHashTable *hash;
 } QmpSchema;
 
+static QmpSchema schema;
+
 static void qmp_schema_init(QmpSchema *schema)
 {
     QDict *resp;
@@ -343,9 +346,56 @@ static void test_object_add_failure_modes(void)
     qtest_quit(qts);
 }
 
+static void test_qapi_type(void)
+{
+    QTestState *qts;
+    g_autoptr(QDict) resp = NULL;
+    QList *types;
+    QListEntry *type_entry, *prop_entry;
+
+    qts = qtest_init(common_args);
+
+    resp = qtest_qmp(qts,
+                     "{ 'execute': 'qom-list-types',"
+                     "  'arguments': { 'abstract': true } }");
+    g_assert(qdict_haskey(resp, "return"));
+    types = qdict_get_qlist(resp, "return");
+
+    QLIST_FOREACH_ENTRY(types, type_entry) {
+        QDict *type = qobject_to(QDict, qlist_entry_obj(type_entry));
+        const char *name = qdict_get_str(type, "name");
+        g_autoptr(QDict) props_resp = NULL;
+        QList *props;
+
+        props_resp = qtest_qmp(qts,
+                               "{ 'execute': 'qom-list-properties',"
+                               "  'arguments': { 'typename': %s } }",
+                               name);
+        if (!qdict_haskey(props_resp, "return")) {
+            continue;
+        }
+        props = qdict_get_qlist(props_resp, "return");
+
+        QLIST_FOREACH_ENTRY(props, prop_entry) {
+            QDict *prop = qobject_to(QDict, qlist_entry_obj(prop_entry));
+            const char *qapi_type = qdict_get_try_str(prop, "qapi-type");
+            const char *propname = qdict_get_str(prop, "name");
+            const char *ty = qdict_get_str(prop, "type");
+
+            if (qapi_type) {
+                g_assert_nonnull(qmp_schema_lookup(&schema, qapi_type));
+            } else if (!g_str_has_prefix(ty, "child<") &&
+                       !g_str_has_prefix(ty, "link<")) {
+                g_test_message("%s.%s %s has no associated qapi-type",
+                               name, propname, ty);
+            }
+        }
+    }
+    qtest_quit(qts);
+}
+
 int main(int argc, char *argv[])
 {
-    QmpSchema schema;
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -355,6 +405,9 @@ int main(int argc, char *argv[])
 
     qtest_add_func("qmp/object-add-failure-modes",
                    test_object_add_failure_modes);
+    if (g_test_slow()) {
+        qtest_add_func("qmp/qapi-type", test_qapi_type);
+    }
 
     ret = g_test_run();
 

-- 
2.56.0.116.g6de20f6092dc


