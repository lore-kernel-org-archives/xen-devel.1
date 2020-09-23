Return-Path: <SRS0=1HVP=DA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D5FC2D0A8
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2020 11:04:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 832FE20725
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2020 11:04:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="UV8BQRa1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 832FE20725
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL2Zh-0003ps-R1; Wed, 23 Sep 2020 11:04:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R4EU=DA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kL2Zg-0003pn-Gc
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 11:04:36 +0000
X-Inumbo-ID: 0db72009-7e60-4bb4-ad83-b140ad64e5b7
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0db72009-7e60-4bb4-ad83-b140ad64e5b7;
 Wed, 23 Sep 2020 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600859075;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lX7mdqYYdpd7vIbpWme5ezs+xGmJm1ZWzKO9Dfq4pJI=;
 b=UV8BQRa1AeProNKo9iW+BYFQkCQcKoo6IFbrD6SLwQrwI0Peye/LovqZ
 O9GcuelzEVu9YfUYQgDbEGV+qu0NaibOrxxmJD6IrTTglQGxmWQ/s9ech
 VX5l0gMuZvJRMrypBNCimi6JoPc6kR6RVIAd9L0nDeRIHEsARFC5uEKFg U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: soLdDUUyYssFVJPPcqgcfqVQS2BeUxBzsEfFIfKEtA4OxxpeUaD/VMHo6Um+T4zOz2x+K4WPTz
 xye3PZpQnuU+Bt06kZqmswuGgHA2EEEevVOYk7If+22TFBySrFAhMVEA9Xzf/MQIQw1YsC0UNB
 qoPsS+ukiywI7VoAbzFP2093A6TCY3BBkqY9jfK1KTCM9bBO86w/uHJ36Bk4IKWULEd3I0Rmo0
 QbbrTGmAYXcbeYT4qJf/F9+CEov706V6IZ3ZZuMt6Z1KixVqkwqfTbXKMTT8CKzImUZiL5mIuU
 VRg=
X-SBRS: 2.7
X-MesageID: 27364818
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,293,1596513600"; d="scan'208";a="27364818"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH] tools: Fix configure of upstream QEMU
Date: Wed, 23 Sep 2020 12:03:23 +0100
Message-ID: <20200923110323.1980725-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QEMU as recently switch its build system to use meson and the
./configure step with meson is more restrictive that the step used to
be, most installation path wants to be within prefix, otherwise we
have this error message:

    ERROR: The value of the 'datadir' option is '/usr/share/qemu-xen' which must be a subdir of the prefix '/usr/lib/xen'.

In order to workaround the limitation, we will set prefix to the same
one as for the rest of Xen installation, and set all the other paths.

For reference, a thread in qemu-devel:
    "configure with datadir outside of --prefix fails with meson"
    https://lore.kernel.org/qemu-devel/20200918133012.GH2024@perard.uk.xensource.com/t/

And an issue in meson:
    "artificial limitation of directories (forced to be in prefix)"
    https://github.com/mesonbuild/meson/issues/2561

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

---

I've tested the change with an oldish QEMU, qemu-xen-4.12, and the
layout of the tarball generated by osstest doesn't change.
---
 tools/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/Makefile b/tools/Makefile
index 198b239edcc1..ff21f1125f66 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -238,7 +238,7 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
 	$$source/configure --enable-xen --target-list=i386-softmmu \
 		$(QEMU_XEN_ENABLE_DEBUG) \
 		$$enable_trace_backend \
-		--prefix=$(LIBEXEC) \
+		--prefix=$(prefix) \
 		--libdir=$(LIBEXEC_LIB) \
 		--includedir=$(LIBEXEC_INC) \
 		--extra-cflags="-DXC_WANT_COMPAT_EVTCHN_API=1 \
@@ -274,6 +274,10 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
 		--bindir=$(LIBEXEC_BIN) \
 		--datadir=$(SHAREDIR)/qemu-xen \
 		--localstatedir=$(localstatedir) \
+		--docdir=$(LIBEXEC)/share/doc \
+		--mandir=$(LIBEXEC)/share/man \
+		--libexecdir=$(LIBEXEC)/libexec \
+		--firmwarepath=$(LIBEXEC)/share/qemu-firmware \
 		--disable-kvm \
 		--disable-docs \
 		--disable-guest-agent \
-- 
Anthony PERARD


