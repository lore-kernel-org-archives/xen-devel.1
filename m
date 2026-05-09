Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70277CD37B7
	for <xen-devel@archiver.kernel.org>; Sat,  9 May 2026 10:48:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1304603.1577542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLfER-0002Ql-Vu; Sat, 09 May 2026 10:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304603.1577542; Sat, 09 May 2026 10:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLfER-0002Qe-Se; Sat, 09 May 2026 10:48:27 +0000
Received: by outflank-mailman (input) for mailman id 1304603;
 Sat, 09 May 2026 10:48:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>) id 1wLfEQ-0001il-M6
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 10:48:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLfEQ-00FIIk-2o
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 12:48:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>)
 id 69ff10e4-bab6-0a2a0a5309dd-0a2a4505bea4-20
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 12:48:26 +0200
Received: from [49.212.243.89] (helo=www3579.sakura.ne.jp)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>)
 id 69ff10f7-aaa8-0a2a45050019-31d4f359d68d-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 12:48:25 +0200
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp
 [133.11.54.183]) (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 649AlY2L090834
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 9 May 2026 19:48:01 +0900 (JST)
 (envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=temperror header.s=rs20250326 header.d=rsg.ci.i.u-tokyo.ac.jp header.i="@rsg.ci.i.u-tokyo.ac.jp"
DKIM-Signature: a=rsa-sha256; bh=8DrbNDimPytD2Lqd2BsnuvqZLeFlu5Z+sunaR47ICfs=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1778323681; v=1;
        b=EZUG6OgWnMEi80mWOv2bjQh69KIzj095fUuL+GG0Y+Ocgqc0ySNqx21bn9jTgoBi
         gIOOXCAYQ6WtAM8ujVLEiqtd9gSR0j4rd4xO7o5RqI2XPMW3/UooD+7tSggeiP4L
         gE0NUbscSS8YA+Mx1Gfr2UylEtbic/4xW8GTk6m2P9EznvTyEH4iV/4IZA+UHNGx
         dUmXYXfrVKC7U3HU4oua43HgpUYTg1YNjbSpvneEbJ8jidGE8CTbWnEeqeiXZVip
         MXUMoqwQTbNunaDlZcL3/vUInNW0z7NbHiONGReOLeJaq1Zb585hY6sdxGHqBKgs
         ZyyMt54SD4C3BEJvhcbbUw==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sat, 09 May 2026 19:34:32 +0900
Subject: [PATCH RFC 20/28] ui/input-legacy: Use Linux key codes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-input-v1-20-66f18d2edde6@rsg.ci.i.u-tokyo.ac.jp>
References: <20260509-input-v1-0-66f18d2edde6@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260509-input-v1-0-66f18d2edde6@rsg.ci.i.u-tokyo.ac.jp>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
        Peter Maydell <peter.maydell@linaro.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony@xenproject.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Thomas Huth <th.huth+qemu@posteo.eu>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
        qemu-ppc@nongnu.org,
        =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-16047
X-Developer-Signature: v=1; a=openpgp-sha256; l=2048;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=Fw4LZt0Zxdxd+pp/aswa6uqQEJsaIMY4eIVuWOuDFDU=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ+Z/gRuRrFtN2E/2hy4vFXHjb+T9L3/4tGJiRbZhv8OPb
 n3ll5YdpSwMYlwMsmKKLClFu7k1oms/FSbEt8DMYWUCGcLAxSkAE7nAz/A/x8pUpe/X57bWK/cM
 bW+638299/u5v635S2aD3y8sV8SyMjIsmraO89bZEL2iixLlB53cTK4dZf/jVxn+dprRhGtK56R
 5AA==
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-purgate-ID: tlsNG-c201ff/1778323706-E338A443-BC534A78/0/0
X-purgate-type: clean
X-purgate-size: 2050

QemuInputEvent now stores Linux key codes for key events. Use those
codes directly instead of translating between internal key code
representations.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 ui/input-legacy.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/ui/input-legacy.c b/ui/input-legacy.c
index e2b48dd8f0aa..193c9ae2ef9f 100644
--- a/ui/input-legacy.c
+++ b/ui/input-legacy.c
@@ -71,23 +71,11 @@ int index_from_key(const char *key, size_t key_length)
     return i;
 }
 
-static KeyValue *copy_key_value(KeyValue *src)
-{
-    KeyValue *dst = g_new(KeyValue, 1);
-    memcpy(dst, src, sizeof(*src));
-    if (dst->type == KEY_VALUE_KIND_NUMBER) {
-        QKeyCode code = qemu_input_key_number_to_qcode(dst->u.number.data);
-        dst->type = KEY_VALUE_KIND_QCODE;
-        dst->u.qcode.data = code;
-    }
-    return dst;
-}
-
 void qmp_send_key(KeyValueList *keys, bool has_hold_time, int64_t hold_time,
                   Error **errp)
 {
     KeyValueList *p;
-    KeyValue **up = NULL;
+    unsigned int *up = NULL;
     int count = 0;
 
     if (!has_hold_time) {
@@ -95,15 +83,15 @@ void qmp_send_key(KeyValueList *keys, bool has_hold_time, int64_t hold_time,
     }
 
     for (p = keys; p != NULL; p = p->next) {
-        qemu_input_event_send_key(NULL, copy_key_value(p->value), true);
-        qemu_input_event_send_key_delay(hold_time);
         up = g_realloc(up, sizeof(*up) * (count+1));
-        up[count] = copy_key_value(p->value);
+        up[count] = qemu_input_key_value_to_linux(p->value);
+        qemu_input_event_send_key_linux(NULL, up[count], true);
+        qemu_input_event_send_key_delay(hold_time);
         count++;
     }
     while (count) {
         count--;
-        qemu_input_event_send_key(NULL, up[count], false);
+        qemu_input_event_send_key_linux(NULL, up[count], false);
         qemu_input_event_send_key_delay(hold_time);
     }
     g_free(up);

-- 
2.54.0


