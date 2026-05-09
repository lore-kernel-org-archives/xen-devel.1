Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00F2CD37BB
	for <xen-devel@archiver.kernel.org>; Sat,  9 May 2026 10:48:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1304601.1577515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLfEQ-0001fu-DX; Sat, 09 May 2026 10:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304601.1577515; Sat, 09 May 2026 10:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLfEQ-0001ez-7j; Sat, 09 May 2026 10:48:26 +0000
Received: by outflank-mailman (input) for mailman id 1304601;
 Sat, 09 May 2026 10:48:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>) id 1wLfEN-0001aS-Ej
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 10:48:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLfEM-0010Ja-SC
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 12:48:22 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>)
 id 69ff10a2-e002-0a2a0a5209dd-0a2a4504db1e-44
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 12:48:22 +0200
Received: from [49.212.243.89] (helo=www3579.sakura.ne.jp)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>)
 id 69ff10f3-1dec-0a2a45040019-31d4f359d5f0-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 12:48:21 +0200
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp
 [133.11.54.183]) (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 649AlY2K090834
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
DKIM-Signature: a=rsa-sha256; bh=+9TsdwOjpr1iHxskLt3f2EYt5zfwd9os5E2Yt8jChVM=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1778323681; v=1;
        b=aLv1AfwGALDvOFPckAZuQsHV3Iq6x1BBqVwrJH00u/XyCobZnIeo+UuTjIee/uF1
         CE7iaauZdwme0etKlR5JtF6nC0R4K2QjXjLnqSFPtJWk2ZWtRkDDChsSXeBDsQYL
         t4cz59uBHpJkYTCKhAXYsXzKJcJw1fxZKr9JE5pnHcjQV/zCZWpQq4uz5NqOuYUA
         6z35XYQLT0Y79u8LPa5ntwP90qqvy4sTBUAfjBYPNVktzrWr3HocC6rjxSB+UTXf
         dAYGRlX4aivYRczJu9IfluABueOT/ha6MU3Piq4vdmWISSPc6JXVQqkGpIhsq0Ym
         sxPNGql4PziyvN6QUjaK9A==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sat, 09 May 2026 19:34:31 +0900
Subject: [PATCH RFC 19/28] ui/input-barrier: Use Linux key codes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-input-v1-19-66f18d2edde6@rsg.ci.i.u-tokyo.ac.jp>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3193;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=c6O0syJR1NIU9Ef/YUHm+OV3aKIWUGDzhmEGlDmaM/E=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ+Z/gete29q+nqlp3CUa0eKVzCXTcqzHpGl5rly6/9OtT
 k8dj+7pKGVhEONikBVTZEkp2s2tEV37qTAhvgVmDisTyBAGLk4BmMiLBYwM7x9FPytacndF5S3l
 7K2H5K7nWFySMXwgGDir9kdN9TrZDEaGJ1VfTL5p89oVhZ4UyOF8ofTxs8amlCAF+a3TbXacLtj
 BBAA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-purgate-ID: tlsNG-ebf023/1778323702-42D643FF-654C105C/0/0
X-purgate-type: clean
X-purgate-size: 3195

QemuInputEvent now stores Linux key codes for key events. Use those
codes directly instead of translating between internal key code
representations.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 ui/input-barrier.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/ui/input-barrier.c b/ui/input-barrier.c
index 0a2198ca5003..eb7f0b952d51 100644
--- a/ui/input-barrier.c
+++ b/ui/input-barrier.c
@@ -84,11 +84,11 @@ static const char *cmd_names[] = {
 
 static kbd_layout_t *kbd_layout;
 
-static int input_barrier_to_qcode(uint16_t keyid, uint16_t keycode)
+static int input_barrier_to_linux(uint16_t keyid, uint16_t keycode)
 {
     /* keycode is optional, if it is not provided use keyid */
-    if (keycode && keycode <= qemu_input_map_xorgkbd_to_qcode_len) {
-        return qemu_input_map_xorgkbd_to_qcode[keycode];
+    if (keycode && keycode <= qemu_input_map_xorgkbd_to_linux_len) {
+        return qemu_input_map_xorgkbd_to_linux[keycode];
     }
 
     if (keyid >= 0xE000 && keyid <= 0xEFFF) {
@@ -99,10 +99,10 @@ static int input_barrier_to_qcode(uint16_t keyid, uint16_t keycode)
     if (kbd_layout) {
         keycode = keysym2scancode(kbd_layout, keyid, NULL, false);
 
-        return qemu_input_key_number_to_qcode(keycode);
+        return qemu_input_key_number_to_linux(keycode);
     }
 
-    return qemu_input_map_x11_to_qcode[keyid];
+    return qemu_input_map_x11_to_linux[keyid];
 }
 
 static int input_barrier_to_mouse(uint8_t buttonid)
@@ -431,23 +431,23 @@ static gboolean writecmd(InputBarrier *ib, struct barrierMsg *msg)
 
     /* keyboard */
     case barrierCmdDKeyDown:
-        qemu_input_event_send_key_qcode(NULL,
-                        input_barrier_to_qcode(msg->key.keyid, msg->key.button),
+        qemu_input_event_send_key_linux(NULL,
+                        input_barrier_to_linux(msg->key.keyid, msg->key.button),
                                         true);
         break;
     case barrierCmdDKeyRepeat:
         for (i = 0; i < msg->repeat.repeat; i++) {
-            qemu_input_event_send_key_qcode(NULL,
-                  input_barrier_to_qcode(msg->repeat.keyid, msg->repeat.button),
+            qemu_input_event_send_key_linux(NULL,
+                  input_barrier_to_linux(msg->repeat.keyid, msg->repeat.button),
                                             false);
-            qemu_input_event_send_key_qcode(NULL,
-                  input_barrier_to_qcode(msg->repeat.keyid, msg->repeat.button),
+            qemu_input_event_send_key_linux(NULL,
+                  input_barrier_to_linux(msg->repeat.keyid, msg->repeat.button),
                                             true);
         }
         break;
     case barrierCmdDKeyUp:
-        qemu_input_event_send_key_qcode(NULL,
-                        input_barrier_to_qcode(msg->key.keyid, msg->key.button),
+        qemu_input_event_send_key_linux(NULL,
+                        input_barrier_to_linux(msg->key.keyid, msg->key.button),
                                         false);
         break;
     default:

-- 
2.54.0


