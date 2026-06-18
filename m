Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D31CD98F2
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jun 2026 14:56:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1341261.1601720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waE9y-0007Mb-ML; Thu, 18 Jun 2026 14:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341261.1601720; Thu, 18 Jun 2026 14:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waE9y-0007MT-IF; Thu, 18 Jun 2026 14:56:02 +0000
Received: by outflank-mailman (input) for mailman id 1341261;
 Thu, 18 Jun 2026 14:56:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b3411000701b@swg.vates.tech>)
 id 1waE9w-00079f-Kj
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:56:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waE9w-002MfF-1E
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:56:00 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b3411000701b@swg.vates.tech>)
 id 6a3406fe-2eae-0a2a0a5409dd-0a2a4502e5c8-4
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:55:59 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b3411000701b@swg.vates.tech>)
 id 6a3406fe-fdf1-0a2a45020019-b9ff1c12adcb-4
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:55:59 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19edb3b3411000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 14:55:50 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 29A5686962;
 Thu, 18 Jun 2026 16:55:50 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=bkdOZqrvjqr6flE5BYOE/roewt3QGKdGV2l97nCiJjY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=iampVMjIiFk6fpXi4g+lu0bmxgSdGj1vrd1B/9f6+cGBoZf46660SheSJbc29b69MYStadZ/S
 F805PuSkv7PxGVsrhYchGU+6dKzeSwfiUr8rXqVn23SqE78Bq/cFTLTCXhTy13j7AmQ3x6PTAOr
 9eqjHQoBWhK3pqBuZi54KkzIO77QZ83D5FEBHIArdZttoHrgDet0ZGS+mH8U3v8R/GJ+RKWoBjj
 pnTZSp1EIR+la1Pz29Znd2sbaThl3v+LU8NqsdG7GJ9n2HZG6VE9ayHUsl4yAowe7WOHlU+fiCG
 n50pCkoLt1nLnC5qSIEIS+l4gWG/eQ2y9QsMdfEf7txw==
X-Zone-Loop: cecc3d7d01b7eb8775fc467cccfc959236d52428ed3f
x-campaign-type: default
x-transaction-id: b826a65b-630e-429a-94c8-a87eddbcbf63
x-swg-uid: 01-75e6d2ec-825c-4c31-9421-3c10f4884461
X-Mailer: Sweego
Message-ID:
 <1781794550.8631fc262581453bbf619ec5b2062170.19edb3b3411000701b@vates.tech>
x-swg-bid: 1781794550.8631fc262581453bbf619ec5b2062170.19edb3b3411000701b
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
Subject: [PATCH v2 01/15] pci: Introduce parse_pci_sbdf{_seg}()
Date: Thu, 18 Jun 2026 16:50:25 +0200
In-Reply-To: <cover.1781790171.git.teddy.astie@vates.tech>
References: <cover.1781790171.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.688.a8c412ea6d9bc58b.19edb3b3260.4b4b09374cddeb99=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781794550368
X-purgate-ID: tlsNG-720697/1781794559-4F8783F3-F8589A63/0/0
X-purgate-type: clean
X-purgate-size: 2322

---=Part.688.a8c412ea6d9bc58b.19edb3b3260.4b4b09374cddeb99=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In many places, we're parsing a PCI string into individual
parts (seg, bus, dev, fn) and then transform it into a pci_sbdf_t
using PCI_SBDF macro=2E Rather than converting from parts to pci_sbdf_t
and vice versa, introduce a new function that parses a PCI string
into a pci_sbdf_t structure directly=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/pci/pci=2Ec | 18 ++++++++++++++++++
 xen/include/xen/pci=2Eh |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/xen/drivers/pci/pci=2Ec b/xen/drivers/pci/pci=2Ec
index 084be3880c=2E=2E1d06cb035b 100644
--- a/xen/drivers/pci/pci=2Ec
+++ b/xen/drivers/pci/pci=2Ec
@@ -202,3 +202,21 @@ const char *__init parse_pci_seg(const char *s, unsig=
ned int *seg_p,
=20
     return s;
 }
+
+const char *parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf)
+{
+    unsigned int seg, bus, dev, func;
+    const char *out =3D parse_pci(s, &seg, &bus, &dev, &func);
+
+    *sbdf =3D PCI_SBDF(seg, bus, dev, func);
+    return out;
+}
+
+const char *parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def=
_seg)
+{
+    unsigned int seg, bus, dev, func;
+    const char *out =3D parse_pci_seg(s, &seg, &bus, &dev, &func, def_seg=
);
+
+    *sbdf =3D PCI_SBDF(seg, bus, dev, func);
+    return out;
+}
diff --git a/xen/include/xen/pci=2Eh b/xen/include/xen/pci=2Eh
index afb6bbf50d=2E=2E7bfc59cd75 100644
--- a/xen/include/xen/pci=2Eh
+++ b/xen/include/xen/pci=2Eh
@@ -280,6 +280,9 @@ const char *parse_pci_seg(const char *s, unsigned int =
*seg_p,
                           unsigned int *bus_p, unsigned int *dev_p,
                           unsigned int *func_p, bool *def_seg);
=20
+const char *parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf);
+const char *parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def=
_seg);
+
 #define PCI_BAR_VF      (1u << 0)
 #define PCI_BAR_LAST    (1u << 1)
 #define PCI_BAR_ROM     (1u << 2)
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.688.a8c412ea6d9bc58b.19edb3b3260.4b4b09374cddeb99=---

