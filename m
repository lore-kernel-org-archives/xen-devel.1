Return-Path: <SRS0=oDxe=CE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B04C433DF
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2020 13:52:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FAD4208E4
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2020 13:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="GiHbyJDu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FAD4208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAvqa-000520-S6; Wed, 26 Aug 2020 13:52:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dzo7=CE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kAvqZ-00051v-Nv
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 13:52:15 +0000
X-Inumbo-ID: 0f6a8b7f-d588-4c64-af2f-5d04e8d881ee
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f6a8b7f-d588-4c64-af2f-5d04e8d881ee;
 Wed, 26 Aug 2020 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598449934;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8WgNBll9Y6rzHECKbGGU1Ka7eVx8eusApzLOMpZLbG4=;
 b=GiHbyJDuo6uCc1fFRWERhnYWLPVpdmGbx/wf6Z3+ck1Vay5QhC2WjPFz
 sCbT8PVgvSRhpovdS7fW0orHWxKntSt0DifWsCd3I7XHX234tLf+wJsk1
 DqLp3JxfM3YTajK7okbbKiLqX6ZzX37OhRbFueuljkvLtBK/g+lFDdFEa Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: OLukaG2S5K5FigtpVie7v8uq6NSTruDyl9YEFhuApxF2NgX8jY6OR6iVy5qd+MF3FnGV4PNbL3
 s9g2Qz3TogeoTVyKQYK1k5/WI1A0gOdfYmOqXpIVY2zl4L3dlIBr3zlb9qfTXSDFCx7JuyNm4d
 ul2eT/ivGqMSiA/pcAovRCfibBeD544otdAvSE/vkLV4mS4+GICwKed10P4BF33IA7t7Me/HEP
 lHowDkCESH+3/UEUZDyq4XeG8+JvisK4G2DDXZFrwUFfbHHxxdu3h+mRhJ78kz3uYlvKMaq5ZJ
 mPg=
X-SBRS: 2.7
X-MesageID: 25645116
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,355,1592884800"; d="scan'208";a="25645116"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86: use constant flags for section .init.rodata
Date: Wed, 26 Aug 2020 15:51:59 +0200
Message-ID: <20200826135159.20436-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

LLVM 11 complains with:

<instantiation>:1:1: error: changed section flags for .init.rodata, expected: 0x2
.pushsection .init.rodata
^
<instantiation>:30:9: note: while in macro instantiation
        entrypoint 0
        ^
entry.S:979:9: note: while in macro instantiation
        .rept 256
        ^

And:

entry.S:1015:9: error: changed section flags for .init.rodata, expected: 0x2
        .section .init.rodata
        ^

Fix it by explicitly using the same flags and type in all the
instances.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/x86_64/entry.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 8b57a00040..1e880eb9f6 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -967,7 +967,7 @@ GLOBAL(trap_nop)
 GLOBAL(autogen_entrypoints)
         /* pop into the .init.rodata section and record an entry point. */
         .macro entrypoint ent
-        .pushsection .init.rodata
+        .pushsection .init.rodata, "a", @progbits
         .quad \ent
         .popsection
         .endm
@@ -1012,5 +1012,5 @@ autogen_stubs: /* Automatically generated stubs. */
         vec = vec + 1
         .endr
 
-        .section .init.rodata
+        .section .init.rodata, "a", @progbits
         .size autogen_entrypoints, . - autogen_entrypoints
-- 
2.28.0


