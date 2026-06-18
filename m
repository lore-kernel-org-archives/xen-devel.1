Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BD9CD98F2
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jun 2026 14:56:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1341288.1601840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAN-000317-WB; Thu, 18 Jun 2026 14:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341288.1601840; Thu, 18 Jun 2026 14:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEAN-0002zp-O1; Thu, 18 Jun 2026 14:56:27 +0000
Received: by outflank-mailman (input) for mailman id 1341288;
 Thu, 18 Jun 2026 14:56:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b5d89000701b@swg.vates.tech>)
 id 1waEAM-0002fb-Un
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:56:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waEAM-002Mnm-Ah
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:56:26 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b5d89000701b@swg.vates.tech>)
 id 6a34071a-2eae-0a2a0a5409dd-0a2a4502dd68-2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:26 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19edb3b5d89000701b@swg.vates.tech>)
 id 6a3406fe-fdf1-0a2a45020019-b9ff1c12adcb-18
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:56:26 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19edb3b5d89000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 14:56:01 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id C5D1C869EE;
 Thu, 18 Jun 2026 16:56:00 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=fRXMaPeHOTuWlIP0v2b1JaYKKB7FB37YvQSUSsGNDqE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=JgIHWLoCu+O46wvh7+cHPSUv2hqzD4HiYSiDR4tJSe+TubtFoS54rcNjKdCKjxMMwwekrB4vd
 n8DyhBLK1NXqp7dAkgPIVZv6/SpKN+VDBhZAuxw6Df9NWPDK/JRGS1grHbiYlW+DSxdaA6u5MP3
 9BbqbTn+iTQrXgT8F4r/BjXlThztij0FC++iyIbUKWJyUntaW5Rt8r3x98jWbDb+PI9F3jg/z9c
 YJk608KRERkdgHdjablZevDeiPI+cm3K5FuxDQugzajFfkjuopUHT/72K2RJ1IaBkjTZhjOUy5p
 wtuKxMMWdGdnSIt5wSym7Lqezwjuel0lks7V2hIbhCtQ==
X-Zone-Loop: d2e82ef63d5983737220f029feb7452e993ba78d11bc
x-campaign-type: default
x-transaction-id: deb5d271-f86f-4b7c-82fb-2287fdbb1a19
x-swg-uid: 01-3293f81d-489e-47ef-83df-4fdd94796a0a
X-Mailer: Sweego
Message-ID:
 <1781794561.8631fc262581453bbf619ec5b2062170.19edb3b5d89000701b@vates.tech>
x-swg-bid: 1781794561.8631fc262581453bbf619ec5b2062170.19edb3b5d89000701b
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
Subject: [RFC PATCH v2 15/15] docs: Document support for PCI segment in dbgp and comN parameter
Date: Thu, 18 Jun 2026 16:50:39 +0200
In-Reply-To: <cover.1781790171.git.teddy.astie@vates.tech>
References: <cover.1781790171.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.696.eddf84f40497af9f.19edb3b5bf3.6f892e792d2421b9=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781794561011
X-purgate-ID: tlsNG-720697/1781794586-460643F3-C6F86228/0/0
X-purgate-type: clean
X-purgate-size: 3120

---=Part.696.eddf84f40497af9f.19edb3b5bf3.6f892e792d2421b9=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Now that we accept full PCI SBDF (with segments), update the documentation
accordingly=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
In principle, it's correct, but I don't think ECAM is usable
at the moment EHCI dbgp is initialized, which would prevent
the device from being probed correctly if it's not on segment 0=2E

Same remark for comN=2E
---
 docs/misc/xen-command-line=2Epandoc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/docs/misc/xen-command-line=2Epandoc b/docs/misc/xen-command-l=
ine=2Epandoc
index 1c711fa980=2E=2E3b35a1962c 100644
--- a/docs/misc/xen-command-line=2Epandoc
+++ b/docs/misc/xen-command-line=2Epandoc
@@ -349,7 +349,7 @@ ACPI indicating none to be there=2E
=20
 ### com1 (x86)
 ### com2 (x86)
-> `=3D <baud>[/<base-baud>][,[DPS][,[<io-base>|pci|amt][,[<irq>|msi][,[<p=
ort-bdf>][,[<bridge-bdf>]]]]]]`
+> `=3D <baud>[/<base-baud>][,[DPS][,[<io-base>|pci|amt][,[<irq>|msi][,[<p=
ort-sbdf>][,[<bridge-sbdf>]]]]]]`
=20
 Both option `com1` and `com2` follow the same format=2E
=20
@@ -371,10 +371,10 @@ Both option `com1` and `com2` follow the same format=
=2E
   registers=2E
 * `<irq>` is the IRQ number to use, or `0` to use the UART in poll
   mode only, or `msi` to set up a Message Signaled Interrupt=2E
-* `<port-bdf>` is the PCI location of the UART, in
-  `<bus>:<device>=2E<function>` notation=2E
-* `<bridge-bdf>` is the PCI bridge behind which is the UART, in
-  `<bus>:<device>=2E<function>` notation=2E
+* `<port-sbdf>` is the PCI location of the UART, in
+  `[<seg>:]<bus>:<device>=2E<function>` notation=2E
+* `<bridge-sbdf>` is the PCI bridge behind which is the UART, in
+  `[<seg>:]<bus>:<device>=2E<function>` notation=2E
 * `pci` indicates that Xen should scan the PCI bus for the UART,
   avoiding Intel AMT devices=2E
 * `amt` indicated that Xen should scan the PCI bus for the UART,
@@ -731,11 +731,11 @@ for the `all` value=2E If that isn't intended, raise
 the `sched_credit2_max_cpus_runqueue` value=2E
=20
 ### dbgp
-> `=3D ehci[ <integer> | @pci<bus>:<slot>=2E<func> ]`
-> `=3D xhci[ <integer> | @pci<bus>:<slot>=2E<func> ][,share=3D<bool>|hwdo=
m]`
+> `=3D ehci[ <integer> | @pci[<seg>:]<bus>:<slot>=2E<func> ]`
+> `=3D xhci[ <integer> | @pci[<seg>:]<bus>:<slot>=2E<func> ][,share=3D<bo=
ol>|hwdom]`
=20
 Specify the USB controller to use, either by instance number (when going
-over the PCI busses sequentially) or by PCI device (must be on segment 0)=
=2E
+over the PCI busses sequentially in segment 0) or by PCI device=2E
=20
 Use `ehci` for EHCI debug port, use `xhci` for XHCI debug capability=2E
 XHCI driver will wait indefinitely for the debug host to connect - make s=
ure
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.696.eddf84f40497af9f.19edb3b5bf3.6f892e792d2421b9=---

