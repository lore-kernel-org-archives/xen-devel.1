Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F51C88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 13:28:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416761.1645694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51Iz-0003PT-CG; Fri, 11 Sep 2026 13:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416761.1645694; Fri, 11 Sep 2026 13:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51Iz-0003PM-8H; Fri, 11 Sep 2026 13:28:37 +0000
Received: by outflank-mailman (input) for mailman id 1416761;
 Fri, 11 Sep 2026 13:28:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a090a7c48d000c4f3@swg.vates.tech>)
 id 1x51Iy-0003PG-6M
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:28:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51Ix-00BcRZ-3H
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:28:35 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a090a7c48d000c4f3@swg.vates.tech>)
 id 6aa40202-bab6-0a2a0a5309dd-0a2a4505856a-4
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:28:34 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a090a7c48d000c4f3@swg.vates.tech>)
 id 6aa40202-4cb1-0a2a45050019-b9ff1c229df1-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:28:34 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a090a7c48d000c4f3.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 13:28:29 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0BADD81CCC;
 Fri, 11 Sep 2026 15:28:28 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=gILvdQMSYRS6c8VUbb8G9YOQACGoymeHx2mqae/ISsk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:feedback-id;
 b=k1pOc0f1dBlja3ZwRDum8FZX0Nv8kE+ib5S8nB5iegTpR0yPlQMrBatnglY8oOcY4V1mcvX4S
 fqGCYHpWo/kdXrcsq7OUlhgMkIZ3Z59+gSymroe6AOZC06+FB0wkT2jQ0ah71y8H/KAZb+noY+7
 v6ovkrWrdCqmZxcitLOoA2b9poTc389XdUzS1O/N010lVMlPSDlnfXyDhSpKaqnlrXQMXY/Nfv9
 3sj469ABR8XJZDOxbkMNObfJhrlUyLD96Gqt0dn9GsgEArKfT9FXg0dJdcIhkNReP0xXLW37/Wu
 hio+iXZ7nsIlHveVqg3LwYenNYURAcDkAEkQ5WWrmE0Q==
X-Zone-Loop: 6c902e853bb77121b1975c560b95015ef1f270e44843
x-campaign-type: default
x-transaction-id: 5e09d256-faea-4e2d-823d-33208c3e8e00
x-swg-uid: 01-725301e9-b3e5-4ffa-983f-8d0b85eed88e
X-Mailer: Sweego
Message-ID:
 <1789133309.8631fc262581453bbf619ec5b2062170.1a090a7c48d000c4f3@vates.tech>
x-swg-bid: 1789133309.8631fc262581453bbf619ec5b2062170.1a090a7c48d000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Date: Fri, 11 Sep 2026 15:28:19 +0200
Subject: [PATCH] Add basic b4 config file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBBFr0Jm7UQoYoJXMSym7bSMi0I6YEwId
 7fV5fv57x2gnIUVHs0Bmd+isqQC3aUBN1OKjOILg2nNvR27Dsl7tDd0SwoScWQbKAwD9aaH4qy
 Zg3x+vef0Z93ti91WI/VhSRltpuTmOu3rVTeKkiKc5xdF+LUhjgAAAA==
X-Change-ID: 20260911-add-b4-config-9ebfaf55a323
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789133302; l=1513;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=vIahPKKLQN+/d9nrSLfeD32Mhu3vC7Ny/dnFzc9Y3eM=;
 b=CaqAMYneS46aLwTRsCiri7IKpU5ly0Reb9Vq+FaUW2apKfYqd3YS0I9ynfFLM3sD/F8djPPra
 JbFBoGBRxHGCzvrQAc5M+AqjjDesCefrEb/WFVg1RfCqLuBnZD/Ja30
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789133308181
X-purgate-ID: tlsNG-c201ff/1789133314-2551A2A1-50EDBA76/0/0
X-purgate-type: clean
X-purgate-size: 1515

b4[1] is a convenient tool for mail-based contribution. A config file[2]
tracked in the tree lets the project ship a few defaults that match the Xen
patch submission rules.

This aims to help new contributors who have never used a mailing list avoid
mistakes when sending their patch series.

The tree has no scripts/checkpatch.pl or equivalent, so there is nothing
for b4 to run per patch. Disable the needs-checking pre-flight check so a
series can be sent without first running b4 prep --check.

[1] https://pypi.org/project/b4/
[2] https://b4.docs.kernel.org/en/latest/config.html

Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 .b4-config | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 0000000000..1ca1f0625e
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,13 @@
+#
+# Common b4 settings for sending patches to the Xen Project upstream.
+# https://b4.docs.kernel.org/
+#
+# See docs/process/sending-patches.pandoc for the patch submission rules
+# these settings implement.
+#
+
+[b4]
+	send-series-to = xen-devel@lists.xenproject.org
+	send-auto-to-cmd = echo
+	send-auto-cc-cmd = ./scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback
+	midmask = https://lore.kernel.org/xen-devel/%s

---
base-commit: acd87f99ac65ff9426dd52f9b7a6ef9db45cc735
change-id: 20260911-add-b4-config-9ebfaf55a323

Best regards,
--  
Baptiste Le Duc <baptiste.le-duc@vates.tech>


