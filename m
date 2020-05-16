Return-Path: <SRS0=f/Dy=66=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5B1C433E0
	for <xen-devel@archiver.kernel.org>; Sat, 16 May 2020 10:20:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A998E20728
	for <xen-devel@archiver.kernel.org>; Sat, 16 May 2020 10:20:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="R//ORzht"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A998E20728
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZtvF-0006ce-Is; Sat, 16 May 2020 10:20:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2yaN=66=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jZtvE-0006bA-36
 for xen-devel@lists.xenproject.org; Sat, 16 May 2020 10:20:00 +0000
X-Inumbo-ID: caa26082-975e-11ea-a637-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id caa26082-975e-11ea-a637-12813bfff9fa;
 Sat, 16 May 2020 10:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M7gjsTUXtdXblxF+pv6oq7jdPrbDZAREuVCENqwOAtU=; b=R//ORzhthvvPSFGwENQGztxSgx
 6TW6cgns925P0UiN0ojpQDXQMztPvblURL2H6r3+QStOSkdRLaf5h1wvC97gJ3gikLa45RE4c51m7
 I1BwxhHOKDEViT08vJAltvpO9O934dmj1vEbFItzxyiEG9sBi904V510sfPkA/1Wo2Vc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jZtvA-0004Nv-NJ; Sat, 16 May 2020 10:19:56 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jZtvA-0000c2-DP; Sat, 16 May 2020 10:19:56 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] pvcalls: Document correctly and explicitely the padding for
 all arches
Date: Sat, 16 May 2020 11:19:53 +0100
Message-Id: <20200516101953.1235-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Julien Grall <jgrall@amazon.com>, julien@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

The documentation of pvcalls suggests there is padding for 32-bit x86
at the end of most the structure. However, they are not described in
in the public header.

Because of that all the structures would be 32-bit aligned and not
64-bit aligned for 32-bit x86.

For all the other architectures supported (Arm and 64-bit x86), the
structure are aligned to 64-bit because they contain uint64_t field.
Therefore all the structures contain implicit padding.

The paddings are now corrected for 32-bit x86 and written explicitly for
all the architectures.

While the structure size between 32-bit and 64-bit x86 is different, it
shouldn't cause any incompatibility between a 32-bit and 64-bit
frontend/backend because the commands are always 56 bits and the padding
are at the end of the structure.

As an aside, the padding sadly cannot be mandated to be 0 as they are
already present. So it is not going to be possible to use the padding
for extending a command in the future.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - It is not possible to use the same padding for 32-bit x86 and
        all the other supported architectures.
---
 docs/misc/pvcalls.pandoc        | 18 ++++++++++--------
 xen/include/public/io/pvcalls.h | 14 ++++++++++++++
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/docs/misc/pvcalls.pandoc b/docs/misc/pvcalls.pandoc
index 665dad556c39..c25412868f5d 100644
--- a/docs/misc/pvcalls.pandoc
+++ b/docs/misc/pvcalls.pandoc
@@ -246,9 +246,9 @@ The format is defined as follows:
     			uint32_t domain;
     			uint32_t type;
     			uint32_t protocol;
-    			#ifdef CONFIG_X86_32
+			#ifndef CONFIG_X86_32
     			uint8_t pad[4];
-    			#endif
+			#endif
     		} socket;
     		struct xen_pvcalls_connect {
     			uint64_t id;
@@ -257,16 +257,18 @@ The format is defined as follows:
     			uint32_t flags;
     			grant_ref_t ref;
     			uint32_t evtchn;
-    			#ifdef CONFIG_X86_32
+			#ifndef CONFIG_X86_32
     			uint8_t pad[4];
-    			#endif
+			#endif
     		} connect;
     		struct xen_pvcalls_release {
     			uint64_t id;
     			uint8_t reuse;
-    			#ifdef CONFIG_X86_32
+			#ifndef CONFIG_X86_32
     			uint8_t pad[7];
-    			#endif
+			#else
+			uint8_t pad[3];
+			#endif
     		} release;
     		struct xen_pvcalls_bind {
     			uint64_t id;
@@ -276,9 +278,9 @@ The format is defined as follows:
     		struct xen_pvcalls_listen {
     			uint64_t id;
     			uint32_t backlog;
-    			#ifdef CONFIG_X86_32
+			#ifndef CONFIG_X86_32
     			uint8_t pad[4];
-    			#endif
+			#endif
     		} listen;
     		struct xen_pvcalls_accept {
     			uint64_t id;
diff --git a/xen/include/public/io/pvcalls.h b/xen/include/public/io/pvcalls.h
index cb8171275c13..590c5e9e41aa 100644
--- a/xen/include/public/io/pvcalls.h
+++ b/xen/include/public/io/pvcalls.h
@@ -65,6 +65,9 @@ struct xen_pvcalls_request {
             uint32_t domain;
             uint32_t type;
             uint32_t protocol;
+#ifndef CONFIG_X86_32
+            uint8_t pad[4];
+#endif
         } socket;
         struct xen_pvcalls_connect {
             uint64_t id;
@@ -73,10 +76,18 @@ struct xen_pvcalls_request {
             uint32_t flags;
             grant_ref_t ref;
             uint32_t evtchn;
+#ifndef CONFIG_X86_32
+            uint8_t pad[4];
+#endif
         } connect;
         struct xen_pvcalls_release {
             uint64_t id;
             uint8_t reuse;
+#ifndef CONFIG_X86_32
+            uint8_t pad[7];
+#else
+            uint8_t pad[3];
+#endif
         } release;
         struct xen_pvcalls_bind {
             uint64_t id;
@@ -86,6 +97,9 @@ struct xen_pvcalls_request {
         struct xen_pvcalls_listen {
             uint64_t id;
             uint32_t backlog;
+#ifndef CONFIG_X86_32
+            uint8_t pad[4];
+#endif
         } listen;
         struct xen_pvcalls_accept {
             uint64_t id;
-- 
2.17.1


