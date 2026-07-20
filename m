Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505CFC44524
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 09:28:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366387.1616273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkI1-0000NR-FP; Mon, 20 Jul 2026 09:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366387.1616273; Mon, 20 Jul 2026 09:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkI1-0000NK-CW; Mon, 20 Jul 2026 09:27:57 +0000
Received: by outflank-mailman (input) for mailman id 1366387;
 Mon, 20 Jul 2026 09:27:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f7eda70d8000edb5@swg.vates.tech>)
 id 1wlkI0-0000NE-6J
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:27:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlkHz-00FHlF-JB
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 11:27:55 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f7eda70d8000edb5@swg.vates.tech>)
 id 6a5dea10-bab6-0a2a0a5309dd-0a2a45038ca2-40
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:27:55 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f7eda70d8000edb5@swg.vates.tech>)
 id 6a5dea1b-fae8-0a2a45030019-b9ff1c239f41-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:27:55 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f7eda70d8000edb5.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Jul 2026 09:27:52 +0000
Received: from localhost.localdomain (155.223.66.37.rev.sfr.net
 [37.66.223.155]) (Authenticated sender: ngoc-tu.dinh@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3C07882B46;
 Mon, 20 Jul 2026 11:27:52 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=W9gBYwCnJT627y0/cSN8Zprmcy1D9tWiELOnZLw6LTI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=mCQMv79f2hyho7bke7jhkRb1NqRxvvIIE3Fz395hcBElC95YauaGbGNLJasWUU5JZ5hE8d5ar
 kDIO4oTHh+coHTs6rDFJB8K02I1VzSMMV+LIxINyT1I6tJ5ZjqE1DgOK5S5YudubBnmuPdBZz2N
 NSS3ieZkOm9jeZlrt272GXNXCb7IGjXaLhuQXI+4G0cpZDpOpG7DINuRh6Rxb0iolwIX2FAuaKp
 EirsMbibyzSZ26BqdXblt29kQMTCNesI09tO2971KFpqRVKnH+rdGHsTBEEHQpn20NYUQ8zokMj
 hoaU6+FTn8BAbWG1PqpfO6OK5qsLsn1Z8LP2puXWgVGw==
X-Zone-Loop: 51349e90b186575762298e02b31a1fc37f431f958461
x-campaign-type: default
x-transaction-id: aa94129b-026d-4710-ae35-203e50290b0a
x-swg-uid: 01-2d7a7a83-8b37-4ad3-8523-9905239af3a0
X-Mailer: Sweego
Message-ID:
 <1784539672.8631fc262581453bbf619ec5b2062170.19f7eda70d8000edb5@vates.tech>
x-swg-bid: 1784539672.8631fc262581453bbf619ec5b2062170.19f7eda70d8000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Tu Dinh <ngoc-tu.dinh@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Tu Dinh <ngoc-tu.dinh@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/2] {libxl,xl}: Add xl trigger debug
Date: Mon, 20 Jul 2026 11:27:48 +0200
In-Reply-To: <1784539531.8631fc262581453bbf619ec5b2062170.19f7ed8472c000edb5@vates.tech>
References: <1784539531.8631fc262581453bbf619ec5b2062170.19f7ed8472c000edb5@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.d2d.aac6d2da37ade7ec.19f7eda6f06.8a4b1ea2cf2910ac=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784539672326
X-purgate-ID: tlsNG-33051d/1784539675-77CC34E9-2B1ED1EB/0/0
X-purgate-type: clean
X-purgate-size: 2310

---=Part.d2d.aac6d2da37ade7ec.19f7eda6f06.8a4b1ea2cf2910ac=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Use XEN_DOMCTL_SENDTRIGGER_DEBUG to allow printing diagnostics
information of a specific domain=2E

Signed-off-by: Tu Dinh <ngoc-tu=2Edinh@vates=2Etech>
---
 tools/libs/light/libxl_domain=2Ec  | 4 ++++
 tools/libs/light/libxl_types=2Eidl | 1 +
 tools/xl/xl_cmdtable=2Ec           | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_domain=2Ec b/tools/libs/light/libxl_do=
main=2Ec
index 37fcd92871=2E=2E2d8290dbfa 100644
--- a/tools/libs/light/libxl_domain=2Ec
+++ b/tools/libs/light/libxl_domain=2Ec
@@ -2190,6 +2190,10 @@ int libxl_send_trigger(libxl_ctx *ctx, uint32_t dom=
id,
     case LIBXL_TRIGGER_S3RESUME:
         domain_s3_resume(ao, egc, domid); /* must be last */
         return AO_INPROGRESS;
+    case LIBXL_TRIGGER_DEBUG:
+        rc =3D xc_domain_send_trigger(ctx->xch, domid,
+                                    XEN_DOMCTL_SENDTRIGGER_DEBUG, vcpuid)=
;
+        break;
     default:
         rc =3D -1;
         errno =3D EINVAL;
diff --git a/tools/libs/light/libxl_types=2Eidl b/tools/libs/light/libxl_t=
ypes=2Eidl
index a7893460f0=2E=2E4d53beab0e 100644
--- a/tools/libs/light/libxl_types=2Eidl
+++ b/tools/libs/light/libxl_types=2Eidl
@@ -179,6 +179,7 @@ libxl_trigger =3D Enumeration("trigger", [
     (4, "INIT"),
     (5, "RESET"),
     (6, "S3RESUME"),
+    (7, "DEBUG"),
     ])
=20
 libxl_tsc_mode =3D Enumeration("tsc_mode", [
diff --git a/tools/xl/xl_cmdtable=2Ec b/tools/xl/xl_cmdtable=2Ec
index 502244f683=2E=2Ee0594cd507 100644
--- a/tools/xl/xl_cmdtable=2Ec
+++ b/tools/xl/xl_cmdtable=2Ec
@@ -321,7 +321,7 @@ const struct cmd_spec cmd_table[] =3D {
     { "trigger",
       &main_trigger, 0, 1,
       "Send a trigger to a domain",
-      "<Domain> <nmi|reset|init|power|sleep|s3resume> [<VCPU>]",
+      "<Domain> <nmi|reset|init|power|sleep|s3resume|debug> [<VCPU>]",
     },
     { "sysrq",
       &main_sysrq, 0, 1,
--=20
2=2E55=2E0



-- 
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates =
solutions

web: https://vates=2Etech
---=Part.d2d.aac6d2da37ade7ec.19f7eda6f06.8a4b1ea2cf2910ac=---

