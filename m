Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08E1CD343F
	for <xen-devel@archiver.kernel.org>; Sat,  9 May 2026 10:48:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1304599.1577509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLfEQ-0001cK-5H; Sat, 09 May 2026 10:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304599.1577509; Sat, 09 May 2026 10:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLfEQ-0001bU-0D; Sat, 09 May 2026 10:48:26 +0000
Received: by outflank-mailman (input) for mailman id 1304599;
 Sat, 09 May 2026 10:48:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>) id 1wLfEN-0001aR-8o
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 10:48:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLfEM-007lJU-M4
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 12:48:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>)
 id 69ff10e2-5cb7-0a2a0a5109dd-0a2a45079184-8
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 12:48:22 +0200
Received: from [49.212.243.89] (helo=www3579.sakura.ne.jp)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>)
 id 69ff10f3-229c-0a2a45070019-31d4f359d5ec-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 12:48:21 +0200
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp
 [133.11.54.183]) (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 649AlY2G090834
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 9 May 2026 19:48:00 +0900 (JST)
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
DKIM-Signature: a=rsa-sha256; bh=uJTvyFxVV0KiKR88wATfRrbdCU5rpbZH8pTJ+9EpZgo=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1778323680; v=1;
        b=ck991oxPhvCSI7vlQnQmqDhO8qPNpIzbu7vQgVPPFIogHVvJJp6FOUtEbLRQs7Wq
         rJybWJpAWrQKHDhTosWtzhajw2VXe/kw3fqKqiG2UhS9trsPHRXw5t29i1L3Pa2s
         +j0bnxv4lZ7iKLJ+RSnx/Fk6fV06j1QEd0f2DZaYOkH+hIvabREPjGBGXAfix4UT
         u5sxCXEef9jdvlJ4+vb2i2Iaa1BR1/88G7zSBM9FftH39xA9FNW9i9w0sJwKTfQE
         R8iErBOQm5A6UBQcyPdBjMiMgsjAiy42tAkuW960cpjVozRZs7xwxt+nafvBV0Ls
         pc6J3r84Hg0rUW0OzLGetw==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sat, 09 May 2026 19:34:27 +0900
Subject: [PATCH RFC 15/28] replay: Use Linux key codes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-input-v1-15-66f18d2edde6@rsg.ci.i.u-tokyo.ac.jp>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2453;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=VN8yQ5lgMxcp3qE4EJjzPaXZLmpoeQItNok0BraEMYc=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ+Z/gautArYL7NVW29YU/82Suvbv1+mU9UyamRs3sy+8c
 O1P+/W5HaUsDGJcDLJiiiwpRbu5NaJrPxUmxLfAzGFlAhnCwMUpABOZZM3wz26v8oI5qjXvGxZy
 vDj3JaP5tf5XTkkXuTjpzYxcrldXaTIyXGPb6Kos+3ROQNmxc851LwXPL1cJKFylWjyxeb+YNMN
 ETgA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-purgate-ID: tlsNG-ef75cf/1778323702-0B374C48-FF672CCC/0/0
X-purgate-type: clean
X-purgate-size: 2455

QemuInputEvent now stores Linux key codes for key events. Use those
codes directly instead of translating between internal key code
representations.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 replay/replay-input.c | 20 +++-----------------
 replay/replay.c       |  2 +-
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/replay/replay-input.c b/replay/replay-input.c
index acf0993c7285..c86e00af0efd 100644
--- a/replay/replay-input.c
+++ b/replay/replay-input.c
@@ -23,8 +23,7 @@ void replay_save_input_event(QemuInputEvent *evt)
 
     switch (evt->type) {
     case INPUT_EVENT_KIND_KEY:
-        replay_put_dword(KEY_VALUE_KIND_QCODE);
-        replay_put_dword(qemu_input_linux_to_qcode(evt->key.key));
+        replay_put_dword(evt->key.key);
         replay_put_byte(evt->key.down);
         break;
     case INPUT_EVENT_KIND_BTN:
@@ -55,25 +54,12 @@ void replay_save_input_event(QemuInputEvent *evt)
 QemuInputEvent *replay_read_input_event(void)
 {
     QemuInputEvent *evt = g_new(QemuInputEvent, 1);
-    int qcode;
 
     evt->type = replay_get_dword();
     switch (evt->type) {
     case INPUT_EVENT_KIND_KEY:
-        switch (replay_get_dword()) {
-        case KEY_VALUE_KIND_NUMBER:
-            qcode = qemu_input_key_number_to_qcode(replay_get_qword());
-            evt->key.down = replay_get_byte();
-            break;
-        case KEY_VALUE_KIND_QCODE:
-            qcode = (QKeyCode)replay_get_dword();
-            evt->key.down = replay_get_byte();
-            break;
-        default:
-            g_assert_not_reached();
-        }
-        evt->key.key = qcode < qemu_input_map_qcode_to_linux_len ?
-                       qemu_input_map_qcode_to_linux[qcode] : 0;
+        evt->key.key = replay_get_dword();
+        evt->key.down = replay_get_byte();
         break;
     case INPUT_EVENT_KIND_BTN:
         evt->btn.button = (InputButton)replay_get_dword();
diff --git a/replay/replay.c b/replay/replay.c
index 2e5c6fa82eaa..14437b32566b 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -22,7 +22,7 @@
 
 /* Current version of the replay mechanism.
    Increase it when file format changes. */
-#define REPLAY_VERSION              0xe0200d
+#define REPLAY_VERSION              0xe0200e
 /* Size of replay log header */
 #define HEADER_SIZE                 (sizeof(uint32_t) + sizeof(uint64_t))
 

-- 
2.54.0


