Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D3ACA5FEC
	for <xen-devel@archiver.kernel.org>; Sun,  4 Oct 2026 10:27:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440282.1657951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDJQO-0007vS-Hg; Sun, 04 Oct 2026 10:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440282.1657951; Sun, 04 Oct 2026 10:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDJQO-0007vG-C6; Sun, 04 Oct 2026 10:26:32 +0000
Received: by outflank-mailman (input) for mailman id 1440282;
 Sun, 04 Oct 2026 10:26:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xDJQO-0007vA-0b
 for xen-devel@lists.xenproject.org; Sun, 04 Oct 2026 10:26:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDJQN-004Ezj-Dw
 for xen-devel@lists.xenproject.org; Sun, 04 Oct 2026 12:26:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ac22953-bab6-0a2a0a5309dd-0a2a4503d802-40
 for <xen-devel@lists.xenproject.org>; Sun, 04 Oct 2026 12:26:31 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6ac229d5-fae8-0a2a45030019-aa0a857cdff3-3
 for <xen-devel@lists.xenproject.org>; Sun, 04 Oct 2026 12:26:30 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-442-TlmWfE4SMRG4aIAdNINZ6Q-1; Sun,
 04 Oct 2026 06:26:26 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1C571195FCD0; Sun,  4 Oct 2026 10:26:25 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 10A8630000E5; Sun,  4 Oct 2026 10:26:23 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791109589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gXJO7banlPNaWvQpKTCq/gTnTWMwrS/tryCeQOKlZyU=;
	b=XDIaAWc+7qsS7peUCW4sbYWoYtY/ND8znTYuLNiRi1W1L8I3VijoUVM5zmszA6hQaUMDuD
	dwmq6uRiDEfphjG6ukG4bX0ZZSIu601OXTQjQeHvz6cDmS22DTa/opP2y8GzYgA6cgOZpa
	Tcpm3YIOTlng+eP6KtrdwTXry261wSU=
X-MC-Unique: TlmWfE4SMRG4aIAdNINZ6Q-1
X-Mimecast-MFC-AGG-ID: TlmWfE4SMRG4aIAdNINZ6Q_1791109585
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Sun, 04 Oct 2026 14:24:01 +0400
Subject: [PATCH 47/63] hw/display/xenfb: fix 24-bit pixel read in BLT macro
MIME-Version: 1.0
Message-Id: <20261004-issue-4560-v1-47-ccbef537cbeb@redhat.com>
References: <20261004-issue-4560-v1-0-ccbef537cbeb@redhat.com>
In-Reply-To: <20261004-issue-4560-v1-0-ccbef537cbeb@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 Pavee Hui <phui@google.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 xen-devel@lists.xenproject.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=3382;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=zPjYLwlhuI6ZQ9yvZpvzI4AvCIHAUk5mFH0I3g1TZjg=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqwikk7HNFX7afDB5DABXPRs5rbBsffV7svWPPq
 UApayLs6IyJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCasIpJAAKCRDa6OEJdZac
 5VqYEACkAao9kDJ5SI46eSyZjrxK9IdIbft6+yD34ZFDLvDEv+vce2KlbA2KR6V6FdnBWVkpani
 y+AmaJlYRP26Wq7AzshR6YcwhrH0xyiIkMlYWM7UQfdTloxhYB7dHwunCUO55ipjfCgaDsTq0QX
 MpoScVV8xMOfWXYcaAnCatguc7lHg8+/Ztd7VWVfPETHFUbTT7hFLgD3zHayjDaIFJofKLLQvDS
 Y9w1XQWd4mHmPQknUbjivURRm76xk3DTsxydFtVCOTU7cwTOayfxZkfAZr29yUc+wHigK+y2znA
 2nJZGiAbEXGjEfxhvn0+1MKdVDc4NI3qT9rqyF8qGZ6jDtzLkZbrGFgZWuRuuJU8DsA7bfHH1en
 MFS1orVH17BL0/taT4k/t7FeMb0ZBQefvm63AkNvlDN09C67AO3q+arVNSe+SFsLqOJ6JFSiVej
 GrfYmZNFvGoNJ+Ze2bZ5ReS5tVhgIAyDR/+futNGDV/lTc+ObDtkfaA/m5TPWJ146IP1q7hvk+Q
 xVPQOKwNdXnPlWCB0xSh3ILGyNUeqOjgHAc+RZEketKHRQqy3Xz+l8/5P2q14MM1ungyK2bn8Bb
 8P4WoFNg24hImRnQLlsBe2a98IAWdxkuMImDHLTjD+0DXDFqQlu+ZLkA8IzntM5xWATdS7hhfQ8
 AdjVZ3y2eGM5VZw==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: ttdl83Wqw9cPQ74srvhpgQj5-vIN0sj_aD6lTkhcI7U_1791109585
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1791109591-6C2E04E9-E3F0B58F/0/0
X-purgate-type: clean
X-purgate-size: 3384

For depth == 24, each pixel is 3 bytes, but the BLT macro was using
uint32_t as the source type, reading 4 bytes per pixel. The last pixel
on the last row would read 1 byte past the framebuffer.

Read 24-bit pixels byte-by-byte instead, so the access stays within
the 3-byte pixel boundary.

Reported-by: Pavee Hui <phui@google.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/display/xenfb.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index ae302b217fe9..10785e6843ae 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -560,8 +560,13 @@ static int xenfb_configure_fb(struct XenFB *xenfb, size_t fb_len_lim,
     return 0;
 }
 
+static inline uint32_t read_pixel24(const uint8_t *p)
+{
+    return p[0] | (p[1] << 8) | (p[2] << 16);
+}
+
 /* A convenient function for munging pixels between different depths */
-#define BLT(SRC_T,DST_T,RSB,GSB,BSB,RDB,GDB,BDB)                        \
+#define BLT(SRC_T,DST_T,READ_PIX,RSB,GSB,BSB,RDB,GDB,BDB)               \
     for (line = y ; line < (y+h) ; line++) {                            \
         SRC_T *src = (SRC_T *)(xenfb->pixels                            \
                                + xenfb->offset                          \
@@ -584,7 +589,7 @@ static int xenfb_configure_fb(struct XenFB *xenfb, size_t fb_len_lim,
         const uint32_t GDM = (~0U) << (32 - GDB);                       \
         const uint32_t BDM = (~0U) << (32 - BDB);                       \
         for (col = x ; col < (x+w) ; col++) {                           \
-            uint32_t spix = *src;                                       \
+            uint32_t spix = READ_PIX(src);                              \
             *dst = (((spix << RSS) & RSM & RDM) >> RDS) |               \
                 (((spix << GSS) & GSM & GDM) >> GDS) |                  \
                 (((spix << BSS) & BSM & BDM) >> BDS);                   \
@@ -593,6 +598,8 @@ static int xenfb_configure_fb(struct XenFB *xenfb, size_t fb_len_lim,
         }                                                               \
     }
 
+#define READ_DEREF(p) (*(p))
+
 
 /*
  * This copies data from the guest framebuffer region, into QEMU's
@@ -612,18 +619,18 @@ static void xenfb_guest_copy(struct XenFB *xenfb, int x, int y, int w, int h)
         switch (xenfb->depth) {
         case 8:
             if (bpp == 16) {
-                BLT(uint8_t, uint16_t,   3, 3, 2,   5, 6, 5);
+                BLT(uint8_t, uint16_t, READ_DEREF, 3, 3, 2,  5, 6, 5);
             } else if (bpp == 32) {
-                BLT(uint8_t, uint32_t,   3, 3, 2,   8, 8, 8);
+                BLT(uint8_t, uint32_t, READ_DEREF, 3, 3, 2,  8, 8, 8);
             } else {
                 oops = 1;
             }
             break;
         case 24:
             if (bpp == 16) {
-                BLT(uint32_t, uint16_t,  8, 8, 8,   5, 6, 5);
+                BLT(uint8_t, uint16_t, read_pixel24, 8, 8, 8,  5, 6, 5);
             } else if (bpp == 32) {
-                BLT(uint32_t, uint32_t,  8, 8, 8,   8, 8, 8);
+                BLT(uint8_t, uint32_t, read_pixel24, 8, 8, 8,  8, 8, 8);
             } else {
                 oops = 1;
             }

-- 
2.56.0.rc0.29.g47ce80527c56


