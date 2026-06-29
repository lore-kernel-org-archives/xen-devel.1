Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BF9C43327
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 17:24:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347826.1605751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFiA-0002lw-5E; Mon, 29 Jun 2026 17:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347826.1605751; Mon, 29 Jun 2026 17:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFi9-0002l0-TG; Mon, 29 Jun 2026 17:23:57 +0000
Received: by outflank-mailman (input) for mailman id 1347826;
 Mon, 29 Jun 2026 17:23:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14687ad3000701b@swg.vates.tech>)
 id 1weFi8-0002U1-N3
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:23:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weFi8-00FsZ2-3z
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:23:56 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14687ad3000701b@swg.vates.tech>)
 id 6a42aa23-bab6-0a2a0a5309dd-0a2a450be43e-26
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:56 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14687ad3000701b@swg.vates.tech>)
 id 6a42aa19-ac48-0a2a450b0019-b9ff1c128383-13
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:56 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f14687ad3000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 17:23:39 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id ABCCC80C54;
 Mon, 29 Jun 2026 19:23:38 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=+Ru5A3EFK617tKbIeIymHNUoj+X0zDdp2iGE6LEZ2D0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=GPmG7AMxNe9kOboxpNaTY4Xv5uZ/oh37kgMQySyMAc3/XGb53YQO3ACWfqlUHeefsobAYtUrp
 GVNc1MKOojqwh3EeB5JkMjiszRYtKmey2OkhQbc8iaiH/VpJ0VVwo7FfXvxw+uNsLldXq8iWE0Y
 jECaxYPDJf0icOXXSSQNBhIXo91lHQqb9iIUljrhSsEeewRMvVS3+wrjrNHw9xZibnDDNhp4qVl
 9izDMx8GieuMxfLyel0r09QZf0/QfoDkMeeh+YADvaDYq4S7caY2rVXJEJmPpez8Vso0/qZOoue
 tsV5WJrPuv0+uaIEjHCGcANnYzmCqAt9KcTSWMWjN6Og==
X-Zone-Loop: 85fff80f93e211141f4662d157812c74f9461c8b84e0
x-campaign-type: default
x-transaction-id: c9d8f482-57bd-4818-8303-e3ecf95d8244
x-swg-uid: 01-cac85885-c0b1-4357-a631-17b7d57f1713
X-Mailer: Sweego
Message-ID:
 <1782753819.8631fc262581453bbf619ec5b2062170.19f14687ad3000701b@vates.tech>
x-swg-bid: 1782753819.8631fc262581453bbf619ec5b2062170.19f14687ad3000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 11/18] drivers/char/xhci: Parse into pci_sbdf_t directly
Date: Mon, 29 Jun 2026 19:21:29 +0200
In-Reply-To: <cover.1782747421.git.teddy.astie@vates.tech>
References: <cover.1782747421.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.816.4718cf351aa5fd03.19f14687919.d509378fd3339795=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782753818905
X-purgate-ID: tlsNG-42698a/1782753836-A653B220-BF4B3957/0/0
X-purgate-type: clean
X-purgate-size: 1399

---=Part.816.4718cf351aa5fd03.19f14687919.d509378fd3339795=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/char/xhci-dbc=2Ec | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc=2Ec b/xen/drivers/char/xhci-dbc=2Ec
index 3f41aa7022=2E=2Ed4961b5f4d 100644
--- a/xen/drivers/char/xhci-dbc=2Ec
+++ b/xen/drivers/char/xhci-dbc=2Ec
@@ -1357,9 +1357,9 @@ static int __init cf_check xhci_parse_dbgp(const cha=
r *opt_dbgp)
     }
     else if ( strncmp(opt_dbgp + 4, "@pci", 4) =3D=3D 0 )
     {
-        unsigned int bus, slot, func;
+        pci_sbdf_t sbdf;
=20
-        e =3D parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
+        e =3D parse_pci(opt_dbgp + 8, &sbdf);
         if ( !e || (*e && *e !=3D ',') )
         {
             printk(XENLOG_ERR
@@ -1368,7 +1368,7 @@ static int __init cf_check xhci_parse_dbgp(const cha=
r *opt_dbgp)
             return -EINVAL;
         }
=20
-        dbc->sbdf =3D PCI_SBDF(0, bus, slot, func);
+        dbc->sbdf =3D sbdf;
     }
     opt =3D e;
=20
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.816.4718cf351aa5fd03.19f14687919.d509378fd3339795=---

