Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F383F589DB
	for <xen-devel@archiver.kernel.org>; Thu, 23 Apr 2026 14:51:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1292212.1570757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvOO-0006C1-3C; Thu, 23 Apr 2026 14:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292212.1570757; Thu, 23 Apr 2026 14:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvON-0006B6-Qi; Thu, 23 Apr 2026 14:50:59 +0000
Received: by outflank-mailman (input) for mailman id 1292212;
 Thu, 23 Apr 2026 14:50:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad29220000f373@swg.vates.tech>)
 id 1wFvOM-00068B-Hv
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 14:50:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFvOL-00F6TN-Uw
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 16:50:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad29220000f373@swg.vates.tech>)
 id 69ea31c9-5cb7-0a2a0a5109dd-0a2a450ab676-16
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 16:50:57 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad29220000f373@swg.vates.tech>)
 id 69ea31d1-56b3-0a2a450a0019-b9ff1c2297ab-4
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 16:50:57 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dbad29220000f373.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 23 Apr 2026 14:50:55 +0000
Received: from xps13-debian.gpn.vates.fr
 (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr [90.48.233.120])
 (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id E0F3F860B1;
 Thu, 23 Apr 2026 16:50:54 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=2WxqC/7NDyEsVp5x99Nl9oXXPdTNIp1S8YTZI5ZJbF8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=D3uTwvshadj9pwDd0Op//RUzAJcG+WoCNd+Sit8erp2UzsFQgxFdHHfThbm577EH4kPTbYYX4
 wMx/7MWUvZjK0wcb2ZWmM4y2EDp4HYnBXS9vDd0P3qq7Lrlqt5dpLdtbTGyCAYMRSPiuOmh9wF+
 JpsvJZHHqkXhfKnGWvCFCWL2krhzjTbFnbjDGgvP7VTxw/wyu7LoQjq585J18LW7Qdpup/NBZgH
 RkQFWjHADnEapKUATTb0EtfpjgNNNTedUG/KZxRmvIJUheflsnypFJbN7n836quWNiVqlACaY94
 eFxxR3B5lRNJBfpTAJkSvphRlw+AY82UjYMuEYJAaooA==
X-Zone-Loop: c7871ee5573226db0411b0d5c46a7216be9db6eec7aa
x-campaign-type: default
x-transaction-id: 38361317-4f1f-42b1-9ee4-7288d10deb3c
x-swg-uid: 01-523f3e71-0f87-4311-ad55-fa29c2f674b1
X-Mailer: Sweego
Message-ID:
 <1776955855.8631fc262581453bbf619ec5b2062170.19dbad29220000f373@vates.tech>
x-swg-bid: 1776955855.8631fc262581453bbf619ec5b2062170.19dbad29220000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Thierry Escande <thierry.escande@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Thierry Escande <thierry.escande@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [RFC PATCH v4 4/6] libxl: Extend libxl__json_object_to_json() prototype
Date: Thu, 23 Apr 2026 16:50:29 +0200
In-Reply-To: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
References: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
MIME-Version: 1.0
Content-Transfert-Encoding: 8bit
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2740.c5deada9ef7a8812.19dbad290c4.414c53236d9cbe01=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776955855045
X-purgate-ID: tlsNG-4011c0/1776955857-46D708B7-FA9CBAE9/0/0
X-purgate-type: clean
X-purgate-size: 3323

---=Part.2740.c5deada9ef7a8812.19dbad290c4.414c53236d9cbe01=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The function libxl__json_object_to_json() returns a json object as
string in a pretty format=2E With support for the new PCI device
passthrough option hotplug=3D0, the function will be used to generate the
json string passed to qemu -device command line parameter, but the
string needs to be in plain format, i=2Ee=2E without carriage return or ta=
b
characters=2E

This patch adds a 'pretty' parameter to the function to control the
output string format=2E

Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
---
v4: new patch
---
 tools/libs/light/libxl_internal=2Eh |  5 +++--
 tools/libs/light/libxl_json=2Ec     | 11 +++++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/tools/libs/light/libxl_internal=2Eh b/tools/libs/light/libxl_=
internal=2Eh
index b6d764ad00=2E=2Eb87959e44a 100644
--- a/tools/libs/light/libxl_internal=2Eh
+++ b/tools/libs/light/libxl_internal=2Eh
@@ -2270,10 +2270,11 @@ _hidden libxl__json_object *libxl__json_parse(libx=
l__gc *gc_opt, const char *s);
=20
 /* `args` may be NULL */
 _hidden char *libxl__json_object_to_json(libxl__gc *gc,
-                                         const libxl__json_object *args);
+                                         const libxl__json_object *args,
+                                         bool pretty);
 /* Always return a valid string, but invalid json on error=2E */
 #define JSON(o) \
-    (libxl__json_object_to_json(gc, (o)) ? : "<invalid-json-object>")
+    (libxl__json_object_to_json(gc, (o), true) ? : "<invalid-json-object>=
")
=20
   /* Based on /local/domain/$domid/dm-version xenstore key */
 _hidden int libxl__device_model_version_running(libxl__gc *gc, uint32_t d=
omid);
diff --git a/tools/libs/light/libxl_json=2Ec b/tools/libs/light/libxl_json=
=2Ec
index 68f36901c2=2E=2Ec566ec83ff 100644
--- a/tools/libs/light/libxl_json=2Ec
+++ b/tools/libs/light/libxl_json=2Ec
@@ -1527,7 +1527,8 @@ out:
 #endif
=20
 char *libxl__json_object_to_json(libxl__gc *gc,
-                                 const libxl__json_object *args)
+                                 const libxl__json_object *args,
+                                 bool pretty)
 {
 #ifdef HAVE_LIBJSONC
     const char *buf;
@@ -1542,7 +1543,9 @@ char *libxl__json_object_to_json(libxl__gc *gc,
     if (rc)
         goto out;
=20
-    buf =3D json_object_to_json_string_ext(root, JSON_C_TO_STRING_PRETTY)=
;
+    buf =3D json_object_to_json_string_ext(root, pretty ?
+                                               JSON_C_TO_STRING_PRETTY :
+                                               JSON_C_TO_STRING_PLAIN);
     if (!buf)
         goto out;
=20
@@ -1566,6 +1569,10 @@ out:
     if (!hand)
         return NULL;
=20
+#if HAVE_YAJL_V2
+    yajl_gen_config(hand, yajl_gen_beautify, pretty);
+#endif
+
     rc =3D libxl__json_object_to_yajl_gen(gc, hand, args);
     if (rc)
         goto out;
--=20
2=2E53=2E0



-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.2740.c5deada9ef7a8812.19dbad290c4.414c53236d9cbe01=---

