Return-Path: <SRS0=u2kx=KG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B17C433ED
	for <xen-devel@archiver.kernel.org>; Tue, 11 May 2021 09:28:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 411FC6161F
	for <xen-devel@archiver.kernel.org>; Tue, 11 May 2021 09:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 411FC6161F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.125665.236558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgOgs-0004xt-3n; Tue, 11 May 2021 09:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125665.236558; Tue, 11 May 2021 09:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgOgr-0004wM-Tf; Tue, 11 May 2021 09:28:33 +0000
Received: by outflank-mailman (input) for mailman id 125665;
 Tue, 11 May 2021 09:28:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiF3=KG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lgOgp-0003CS-QC
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 09:28:31 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 627edbc2-2b6a-4689-8328-0edac7c00d06;
 Tue, 11 May 2021 09:28:21 +0000 (UTC)
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
X-Inumbo-ID: 627edbc2-2b6a-4689-8328-0edac7c00d06
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620725300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZLCUuRpfeTD/8ZQ8pXbTB6NvDUzollCddxfo249yUko=;
  b=er9QO5AdnoO5JqY3T+AUdZZmw1WQjaFle+Y10oMeVuS/8Sj8h0Hnc2zR
   HylGI8MDUhZZXJwgrsISEDqIVwjxjyG3YOz/vtovZ7hSw/QNF3SkR4e9U
   0GjfU4yX4ZlzfV67Elu5tk//IZs2/qbhWeQ2HNH+ImKQuyMzzeTmPiged
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: sUJkmyKG96ytKhXu42Cn4ZJVXWTJ2rqAnIg9NjRaqokqlG/UoqralpEXCl3kFSUi0tVPvdLmtI
 Ro1NeCtspzBCEj73eOzoJ+eWn3zknUDRIdYtt/+AiQCcKM+DMeSjz8eH6BhNezTEFo4IXEUZhX
 dCfJ5QILn8yq4BjfrQu5SkaAPtiVC5e9hpsMyT+JX+c6DAkuPj/GWk33SmrSvxrYUYOEe0GOOm
 FxK6mZSAHBtTBZmaxSi05zVqJL3fT/NEnOL9SR70yGoOKXblfvIA0sY+9m42SCArtEhB6cQXt1
 Xo8=
X-SBRS: 5.1
X-MesageID: 43624001
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:VToBzqzH7LkEfRr1sUt0KrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-IronPort-AV: E=Sophos;i="5.82,290,1613451600"; 
   d="scan'208";a="43624001"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 5/8] libxl: Assert qmp_ev's state in qmp_ev_qemu_compare_version
Date: Tue, 11 May 2021 10:28:07 +0100
Message-ID: <20210511092810.13759-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511092810.13759-1-anthony.perard@citrix.com>
References: <20210511092810.13759-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We are supposed to read the version information only when qmp_ev is in
state "Connected" (that correspond to state==qmp_state_connected),
assert it so that the function isn't used too early.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_qmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/libs/light/libxl_qmp.c b/tools/libs/light/libxl_qmp.c
index 9b638e6f5442..d0967c9f029f 100644
--- a/tools/libs/light/libxl_qmp.c
+++ b/tools/libs/light/libxl_qmp.c
@@ -292,6 +292,8 @@ static int qmp_handle_response(libxl__gc *gc, libxl__qmp_handler *qmp,
 static int qmp_ev_qemu_compare_version(libxl__ev_qmp *ev, int major,
                                        int minor, int micro)
 {
+    assert(ev->state == qmp_state_connected);
+
 #define CHECK_VERSION(level) do { \
     if (ev->qemu_version.level > (level)) return +1; \
     if (ev->qemu_version.level < (level)) return -1; \
-- 
Anthony PERARD


