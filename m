Return-Path: <SRS0=Kz/T=JU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BE2C43460
	for <xen-devel@archiver.kernel.org>; Fri, 23 Apr 2021 16:16:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74B6A61445
	for <xen-devel@archiver.kernel.org>; Fri, 23 Apr 2021 16:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74B6A61445
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.116488.222367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTa-0008Hn-8d; Fri, 23 Apr 2021 16:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116488.222367; Fri, 23 Apr 2021 16:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTa-0008Hc-4V; Fri, 23 Apr 2021 16:16:18 +0000
Received: by outflank-mailman (input) for mailman id 116488;
 Fri, 23 Apr 2021 16:16:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6bT=JU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lZyTY-0008Fb-Be
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 16:16:16 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 611e6a7d-8878-4bc2-86a4-10aa49b0445f;
 Fri, 23 Apr 2021 16:16:15 +0000 (UTC)
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
X-Inumbo-ID: 611e6a7d-8878-4bc2-86a4-10aa49b0445f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619194575;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gTP2NPKwMvvcEW6tAfQV5J2/0JC2fRKLgq5+MXRr9rA=;
  b=gY/5BTvcH+20FyBiAhIUwNChGkhn6AlvQsGSwa93BmeZO3DXrOa+hqVM
   uxzJb95PnIE3anpgp1EcKNR1LeyXN/QhixCWBeDk1PqviaRntUJrVbEJa
   Yf7HbuBMnxwJxpNFYu8EQZSK21xEd4LDRpLWNbfbSWx/j27rKn3yIimt1
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: o6XDtXjQNm2tlxCbQW/75Utq2npQ+oWMTBUrnheQn/YfNJENnS7atFefdkM18jkhZAv9YjglQ6
 3NXdJ+C7IGJlWDZJJ/7aKVp/polQs+h/19wM5Xy6udvSYdUuCClzdnbcl7Sf/l8JAQGFCdz3Rb
 lCze5mVW7alNxhh2KK+Iusge+84RNuwA+5ybYMPMTsB73j3FU48AcDzhj1x6iqiV5RrX3dUoLU
 F5MERxXXvBIgkkjtb6yMAVo7Q7tyti8wsi7XFEdfGF7tR+JAbtDli/o3ucbBN0bTgujSTQqKma
 l5c=
X-SBRS: 5.1
X-MesageID: 42410027
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:iO0EZqut0LjoOZQ9DII56uer7skD9dV00zAX/kB9WHVpW+az/v
 rAoN0w0xjohDENHEw6kdebN6WaBV/a/5h54Y4eVI3SOzXOkm2uMY1k8M/e0yTtcheOj9J1+K
 98f8FFaeHYIkN9ia/BjTWQM9Fl+9Wf9bDtuOG29QYOcShPS4VNqzh0ERyaFEoefngjObMcGI
 CH7sRK4xqMEE52Uu2BCnMIX/fOqrTw/fqMCyIuPBIp5BKDijml8tfBYn2l9ywTTi9VxvMa+X
 XF+jaJgJmLie2xyRPXygbogah+pd2J8Ld+Lf3JrsAULzn24zzYB7hcZw==
X-IronPort-AV: E=Sophos;i="5.82,246,1613451600"; 
   d="scan'208";a="42410027"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 5/8] libxl: Assert qmp_ev's state in qmp_ev_qemu_compare_version
Date: Fri, 23 Apr 2021 17:15:55 +0100
Message-ID: <20210423161558.224367-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423161558.224367-1-anthony.perard@citrix.com>
References: <20210423161558.224367-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We are supposed to read the version information only when qmp_ev is in
state "Connected" (that correspond to state==qmp_state_connected),
assert it so that the function isn't used too early.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
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


