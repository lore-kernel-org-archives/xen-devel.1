Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769C1C88E53
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 09:07:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421544.1647339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6P7v-0004vD-AA; Tue, 15 Sep 2026 09:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421544.1647339; Tue, 15 Sep 2026 09:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6P7v-0004v6-6Y; Tue, 15 Sep 2026 09:06:55 +0000
Received: by outflank-mailman (input) for mailman id 1421544;
 Tue, 15 Sep 2026 09:06:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0a4519d3d000c4f3@swg.vates.tech>)
 id 1x6P7t-0004v0-1J
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 09:06:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6P7s-006NKI-9O
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 11:06:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0a4519d3d000c4f3@swg.vates.tech>)
 id 6aa90aaa-8faa-0a2a0a5109dd-0a2a450bbe3c-14
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 11:06:52 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0a4519d3d000c4f3@swg.vates.tech>)
 id 6aa90aab-b7e8-0a2a450b0019-b9ff1c12869f-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 11:06:51 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0a4519d3d000c4f3.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 15 Sep 2026 09:06:47 +0000
Received: from leducb-2.local (155.89.66.37.rev.sfr.net [37.66.89.155])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id E487C80F92;
 Tue, 15 Sep 2026 11:06:45 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=TWb1Pi/xe8T33qSa6iB7iWKAUcrFfU+7ZlQtCxdnF1Q=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:feedback-id;
 b=RfVQcWw6JIB4IIVYWziz22xR8n/TUszX7DYNA+clVIQCg33AujPyHc3u0TFM0FrAb6B+Udohc
 G3cVrzRiq8GjW9Ha0woDyWKzJUNZIkh5pJcH7SVNCAyFhNk4ZQFJ9OYJv5dW4chmgcyhDNnHYmm
 RQruSW097jaPjlVWsf7MMqdniF7DclsuwGa501S0TU+Pr48qcLX5JZgvObMKAS7G5vS4gBEvfzA
 qbrP/w7Jua4+2u3TQEHS2RNJvLITjzfCZWjva9prz3F3OWu4GGONmVchr2wzeV9mBgG/UnCjD1Z
 Z/FYjgYkR6TeyS4Lz5TIwBYq5SqAmfFSuKzzuxKaljRQ==
X-Zone-Loop: 897cb62e1b3c49f16ccc13e6743e829971b0c7f4d9b9
x-campaign-type: default
x-transaction-id: faed4c69-370c-4449-862c-d13c819a5d1b
x-swg-uid: 01-f8a9a391-a777-4d8e-8442-97fd406cce11
X-Mailer: Sweego
Message-ID:
 <1789463207.8631fc262581453bbf619ec5b2062170.1a0a4519d3d000c4f3@vates.tech>
x-swg-bid: 1789463207.8631fc262581453bbf619ec5b2062170.1a0a4519d3d000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Date: Tue, 15 Sep 2026 11:06:43 +0200
Subject: [PATCH v2] Add basic b4 config file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOuw7DIAxFfyViLm0gD4lO/Y8qgwFD6EAiIKhVl
 H8vpHPHc22f651EDA4juTc7CZhddIsvwC8NUTN4i9TpwoS3fGwFYxS0prKnavHGWSpQGjDDAB3
 vSLlZAxr3Pn3P6cdxky9UqUrqhoSIVAbwaq7Rtt5iAuu8rcPZxbSEz/lNZlXyrzgzyqiAHhTTX
 A+jeGRIGK8Ji3c6juMLtDgo/9oAAAA=
X-Change-ID: 20260911-add-b4-config-9ebfaf55a323
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789463204; l=1641;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=bXamDHTWjbeAwiLKmMPva03Iv8OiLO5TKjT+IaM4des=;
 b=YwsRKZwxfLe+ZQ30vdJe5F2CJyFbUPZBYRsOwihRpKeE+nB5xAjBcllyKjUICtiZ4tJN4xkFk
 hz1sUlup7xkAoG3WJTZZS/O3ftDO4t7KIcdJgLZinC9eqf9ZXoiuPhR
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789463206667
X-purgate-ID: tlsNG-42698a/1789463212-188C99EA-D6831E0E/0/0
X-purgate-type: clean
X-purgate-size: 1643

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
Changes in v2:
- Drop Xen's patches submission rules from comment
- Drop flags that are not supported by get_maintainer.pl script, --nogit is
  supported but is a default so drop it also.
- Link to v1: https://patch.msgid.link/20260911-add-b4-config-v1-1-9a4ac1d2d569@vates.tech
---
 .b4-config | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 0000000000..e5e2435ec4
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,10 @@
+#
+# Common b4 settings for sending patches to the Xen Project upstream.
+# https://b4.docs.kernel.org/
+#
+
+[b4]
+	send-series-to = xen-devel@lists.xenproject.org
+	send-auto-to-cmd = echo
+	send-auto-cc-cmd = ./scripts/get_maintainer.pl
+	midmask = https://lore.kernel.org/xen-devel/%s

---
base-commit: acd87f99ac65ff9426dd52f9b7a6ef9db45cc735
change-id: 20260911-add-b4-config-9ebfaf55a323

Best regards,
--  
Baptiste Le Duc <baptiste.le-duc@vates.tech>


