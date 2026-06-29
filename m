Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF34C43458
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 17:24:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347839.1605780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFiF-0003zV-RV; Mon, 29 Jun 2026 17:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347839.1605780; Mon, 29 Jun 2026 17:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFiF-0003v3-AT; Mon, 29 Jun 2026 17:24:03 +0000
Received: by outflank-mailman (input) for mailman id 1347839;
 Mon, 29 Jun 2026 17:24:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f146885bb000701b@swg.vates.tech>)
 id 1weFiD-0003P4-5V
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:24:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weFiC-00FsZ2-I5
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:24:00 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f146885bb000701b@swg.vates.tech>)
 id 6a42aa23-bab6-0a2a0a5309dd-0a2a450be43e-36
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:24:00 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f146885bb000701b@swg.vates.tech>)
 id 6a42aa19-ac48-0a2a450b0019-b9ff1c128383-17
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:24:00 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f146885bb000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 17:23:42 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7D1EE80C54;
 Mon, 29 Jun 2026 19:23:41 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=guGLBRd+TjYNueCdi4mp11MnFH+zHOeJkqTxbMRKI18=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Wt22cpQzo17kYrk53+353Bhn/nfdje8Th1gX+ReQMEAcO3iQQ8WlIuGZUNV0/hmvArMjif3LZ
 uRSI3m7znQSR3FIuJ1+RvuSIwl22IlDQNxa5YLcFEh4LGsWKpmieh6BDtyMBebHcQ7b3T9prJmU
 7N0ZeP/LX1HoN++Rd1mc+snLgQeyLUAMKuQ7ARbZQRYNxxxBlD5x/uda7CS9OOxVUu7J6ukM8K9
 5t1M7zMGg/vAR9aanTVAuDp0kP0Mh8AEL8AVGpuB+kJeM/AHPB+8KgmP+hzFIzn7OxwipATuF0x
 LrbcKLVGGftyLIQoIR28CMC92mLDVGdWw7Jr6NADt3dQ==
X-Zone-Loop: ed6b1ddb29bbc8c323fe72edab27744daa8989a6f1a3
x-campaign-type: default
x-transaction-id: a5a66aa9-73ff-476b-9715-9324feaa129e
x-swg-uid: 01-91c238d0-6c73-41c1-a088-a4ef6fce3169
X-Mailer: Sweego
Message-ID:
 <1782753822.8631fc262581453bbf619ec5b2062170.19f146885bb000701b@vates.tech>
x-swg-bid: 1782753822.8631fc262581453bbf619ec5b2062170.19f146885bb000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 15/18] pci: Allow ommiting func when parsing with parse_pci_sbdf()
Date: Mon, 29 Jun 2026 19:21:33 +0200
In-Reply-To: <cover.1782747421.git.teddy.astie@vates.tech>
References: <cover.1782747421.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.81a.8ea919d2b3e0e6c8.19f14688413.60b092e7a7c5a4fc=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782753821715
X-purgate-ID: tlsNG-42698a/1782753840-A4F2E220-AAC3370A/0/0
X-purgate-type: clean
X-purgate-size: 2995

---=Part.81a.8ea919d2b3e0e6c8.19f14688413.60b092e7a7c5a4fc=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Allow parsing PCI SBDF with the function part omitted (i=2Ee XXXX:YY:ZZ),
in such case, the parsed PCI function is zero=2E

Then use pci_sbdf_t variant of parse_pci() in parse_phantom_dev()=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/passthrough/pci=2Ec | 10 +++++-----
 xen/drivers/pci/pci=2Ec         | 12 ++++--------
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/passthrough/pci=2Ec b/xen/drivers/passthrough/pci=
=2Ec
index 621537f3cc=2E=2E69c529459c 100644
--- a/xen/drivers/passthrough/pci=2Ec
+++ b/xen/drivers/passthrough/pci=2Ec
@@ -148,7 +148,7 @@ static unsigned int nr_phantom_devs;
 static int __init cf_check parse_phantom_dev(const char *str)
 {
     const char *s;
-    unsigned int seg, bus, slot;
+    pci_sbdf_t sbdf;
     struct phantom_dev phantom;
=20
     if ( !*str )
@@ -156,13 +156,13 @@ static int __init cf_check parse_phantom_dev(const c=
har *str)
     if ( nr_phantom_devs >=3D ARRAY_SIZE(phantom_devs) )
         return -E2BIG;
=20
-    s =3D parse_pci(str, &seg, &bus, &slot, NULL);
+    s =3D parse_pci(str, &sbdf);
     if ( !s || *s !=3D ',' )
         return -EINVAL;
=20
-    phantom=2Eseg =3D seg;
-    phantom=2Ebus =3D bus;
-    phantom=2Eslot =3D slot;
+    phantom=2Eseg =3D sbdf=2Eseg;
+    phantom=2Ebus =3D sbdf=2Ebus;
+    phantom=2Eslot =3D sbdf=2Edev;
=20
     switch ( phantom=2Estride =3D simple_strtol(s + 1, &s, 0) )
     {
diff --git a/xen/drivers/pci/pci=2Ec b/xen/drivers/pci/pci=2Ec
index 743e2fd263=2E=2E793545ae49 100644
--- a/xen/drivers/pci/pci=2Ec
+++ b/xen/drivers/pci/pci=2Ec
@@ -164,7 +164,7 @@ const char *__init parse_pci_split_seg(const char *s, =
unsigned int *seg_p,
                                  unsigned int *bus_p, unsigned int *dev_p=
,
                                  unsigned int *func_p, bool *def_seg)
 {
-    unsigned long seg =3D simple_strtoul(s, &s, 16), bus, dev, func;
+    unsigned long seg =3D simple_strtoul(s, &s, 16), bus, dev, func =3D 0=
;
=20
     if ( *s !=3D ':' )
         return NULL;
@@ -179,14 +179,10 @@ const char *__init parse_pci_split_seg(const char *s=
, unsigned int *seg_p,
         seg =3D 0;
         *def_seg =3D true;
     }
-    if ( func_p )
-    {
-        if ( *s !=3D '=2E' )
-            return NULL;
+
+    if ( func_p && *s =3D=3D '=2E' )
         func =3D simple_strtoul(s + 1, &s, 0);
-    }
-    else
-        func =3D 0;
+
     if ( seg !=3D (seg_p ? (u16)seg : 0) ||
          bus !=3D PCI_BUS(PCI_BDF(bus, 0)) ||
          dev !=3D PCI_SLOT(PCI_DEVFN(dev, 0)) ||
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.81a.8ea919d2b3e0e6c8.19f14688413.60b092e7a7c5a4fc=---

