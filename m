Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31245F589DB
	for <xen-devel@archiver.kernel.org>; Thu, 23 Apr 2026 14:51:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1292217.1570774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvOT-0006mY-PS; Thu, 23 Apr 2026 14:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292217.1570774; Thu, 23 Apr 2026 14:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvOT-0006m0-JN; Thu, 23 Apr 2026 14:51:05 +0000
Received: by outflank-mailman (input) for mailman id 1292217;
 Thu, 23 Apr 2026 14:51:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad2afcd000f373@swg.vates.tech>)
 id 1wFvOS-0006hX-Rn
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 14:51:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFvOS-00F6TN-8O
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 16:51:04 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad2afcd000f373@swg.vates.tech>)
 id 69ea31cb-5cb7-0a2a0a5109dd-0a2a4507892a-40
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 16:51:04 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbad2afcd000f373@swg.vates.tech>)
 id 69ea31d7-229c-0a2a45070019-b9ff1c2288dd-4
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 16:51:04 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dbad2afcd000f373.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 23 Apr 2026 14:51:02 +0000
Received: from xps13-debian.gpn.vates.fr
 (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr [90.48.233.120])
 (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7FAD287363;
 Thu, 23 Apr 2026 16:51:02 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=ekNR1/eBd9VQKAzJYZOyOmAkA2MA78ZmCGizisZKN0M=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=C3PVivYSKPbRBKJNckmf7OY89A4QHKYhJKt8lwoqIB0Ut8UDzwOR2MYKSjCMx4Uz5C7vJ48NG
 RNfewvskrxW+RavVx0H7fBBIRiXzhL/JApXOk8rSWUGrCrB7FnMnbCADFfU1QkKrAl4sP8hszA/
 0BVQD1ZIZwTKit5DtsAIZH6bvpsoDyjSA6kDJEg5+WopJqDbIqUtGYxMbOT8QFZbD1WG+ZOG0Gy
 tJxMTSlOfPss5N7XcpQqkscmsY7ZU4EweXK6/0z48mM4Memu5gjXuRQDZ+QIOyhcghtbucLtzQ4
 4jKOj9BK7EfJbQ+BgPUzh+NrXmM1S0by22zR9HwXYmyw==
X-Zone-Loop: da510dc4bdea08aa68329b8112877095630cd5904ffc
x-campaign-type: default
x-transaction-id: 2fcc7fec-678c-437b-9538-7259920244f3
x-swg-uid: 01-82fc978a-d581-44e4-9ea4-7620336eb78e
X-Mailer: Sweego
Message-ID:
 <1776955863.8631fc262581453bbf619ec5b2062170.19dbad2afcd000f373@vates.tech>
x-swg-bid: 1776955863.8631fc262581453bbf619ec5b2062170.19dbad2afcd000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Thierry Escande <thierry.escande@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Thierry Escande <thierry.escande@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [RFC PATCH v4 6/6] docs: provide description for pci hotplug option
Date: Thu, 23 Apr 2026 16:50:31 +0200
In-Reply-To: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
References: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
MIME-Version: 1.0
Content-Transfert-Encoding: 8bit
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2742.424e6f0f84fb42ae.19dbad2ae7d.85e0adc7420a1022=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776955862653
X-purgate-ID: tlsNG-ef75cf/1776955864-AD165C48-992AB3EE/0/0
X-purgate-type: clean
X-purgate-size: 2304

---=Part.2742.424e6f0f84fb42ae.19dbad2ae7d.85e0adc7420a1022=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch adds description for the 'hotplug' PCI option, allowing
devices to be attached to the guest using the legacy QMP hotplug
mechanism or by passing them to the Qemu command line using '-device'=2E

Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
---
v2: no change
v3: no change
v4: no change
---
 docs/man/xl-pci-configuration=2E5=2Epod | 17 +++++++++++++++++
 docs/man/xl=2Ecfg=2E5=2Epod=2Ein            |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/docs/man/xl-pci-configuration=2E5=2Epod b/docs/man/xl-pci-con=
figuration=2E5=2Epod
index 0691f06ad3=2E=2E8b664173cb 100644
--- a/docs/man/xl-pci-configuration=2E5=2Epod
+++ b/docs/man/xl-pci-configuration=2E5=2Epod
@@ -166,6 +166,23 @@ dom0 without confirmation=2E  Please use with care=2E
=20
 =3Dback
=20
+=3Ditem B<hotplug>=3DI<BOOLEAN>
+
+=3Dover 4
+
+=3Ditem Description
+
+Tells L<xl(1)> to use QMP hotplug mechanism to attach assignable device t=
o
+the guest, or to pass it via Qemu command line using
+'B<-device xen-pci-passthrough,=2E=2E=2E>'=2E The default is to use the l=
egacy QMP
+mechanism=2E
+
+=3Ditem Default Value
+
+1
+
+=3Dback
+
 =3Ditem B<power_mgmt>=3DI<BOOLEAN>
=20
 =3Dover 4
diff --git a/docs/man/xl=2Ecfg=2E5=2Epod=2Ein b/docs/man/xl=2Ecfg=2E5=2Epo=
d=2Ein
index 2f77016ecf=2E=2E09f59f9b9c 100644
--- a/docs/man/xl=2Ecfg=2E5=2Epod=2Ein
+++ b/docs/man/xl=2Ecfg=2E5=2Epod=2Ein
@@ -1236,6 +1236,12 @@ B<(HVM only)> Changes the default value of B<power_=
mgmt> for all PCI
 devices passed through to this VM=2E See B<power_mgmt>
 above=2E
=20
+=3Ditem B<pci_hotplug=3DBOOLEAN>
+
+B<(HVM only)> Changes the default value of B<hotplug> for all PCI
+devices passed through to this VM=2E See L<xl-pci-configuration(5)> for
+more details=2E
+
 =3Ditem B<gfx_passthru=3DBOOLEAN|"STRING">
=20
 Enable graphics device PCI passthrough=2E This option makes an assigned
--=20
2=2E53=2E0



-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.2742.424e6f0f84fb42ae.19dbad2ae7d.85e0adc7420a1022=---

