Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE63C43458
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 17:24:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347861.1605813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFiM-0005U0-4A; Mon, 29 Jun 2026 17:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347861.1605813; Mon, 29 Jun 2026 17:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFiL-0005Rh-CU; Mon, 29 Jun 2026 17:24:09 +0000
Received: by outflank-mailman (input) for mailman id 1347861;
 Mon, 29 Jun 2026 17:24:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14688d8c000701b@swg.vates.tech>)
 id 1weFiI-0004nI-U3
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:24:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weFiI-00FsZ2-A8
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:24:06 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14688d8c000701b@swg.vates.tech>)
 id 6a42aa23-bab6-0a2a0a5309dd-0a2a450be43e-44
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:24:06 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14688d8c000701b@swg.vates.tech>)
 id 6a42aa19-ac48-0a2a450b0019-b9ff1c128383-20
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:24:06 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f14688d8c000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 17:23:44 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7927C86C10;
 Mon, 29 Jun 2026 19:23:43 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=FvevOb+avCePNC2AXp3wN3a3driU5EWKRv49KgdpPsA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=X7xxfZV+XlMbj918WWxoSr994iVnKA2GnGiwZqBQ0TB8/+O0cQlclZ1S0srE1R28PSW3yFRRp
 delDxThGEExi6hiShM+IVYmE3Mj6CZ/d8xRXEx+xw/qHcbMxDBw+qMkDlfejnTKXI777/tdFlV9
 wr9D3th31itbToN61TTr9nsdwBYzZ42cu+tPbCb+c26FMrCOn1RTTDk6jA/SEtBTuS9TNl2l1mv
 b/tZTJwN0FIG1ivecPQ27a2ZxKZEvQi/mH+yyTVDNtljtc5RJJAcbfX6WFjbZvzAxUd8bKf/A/j
 uYwRvrvfLVWdNDpQL/TvwmxUXMfhyAtWr+qYGtw+le/g==
X-Zone-Loop: b63051e513338b3b53e7f69a8a72eb4b41e4a406d879
x-campaign-type: default
x-transaction-id: 0f9c1c5b-da14-4dcf-a92a-bd3a0faf8ff3
x-swg-uid: 01-8fe55683-3bc5-4786-b5bf-f8e48b1f3789
X-Mailer: Sweego
Message-ID:
 <1782753824.8631fc262581453bbf619ec5b2062170.19f14688d8c000701b@vates.tech>
x-swg-bid: 1782753824.8631fc262581453bbf619ec5b2062170.19f14688d8c000701b
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
Subject: [RFC PATCH v3 18/18]: docs: Document support for PCI segment in dbgp and comN parameter
Date: Mon, 29 Jun 2026 19:21:36 +0200
In-Reply-To: <cover.1782747421.git.teddy.astie@vates.tech>
References: <cover.1782747421.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.81d.fae55310681497d3.19f14688bd2.6295c36242107fd6=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782753823698
X-purgate-ID: tlsNG-42698a/1782753846-38B4D220-4B3F0D99/0/0
X-purgate-type: clean
X-purgate-size: 3120

---=Part.81d.fae55310681497d3.19f14688bd2.6295c36242107fd6=-
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
---=Part.81d.fae55310681497d3.19f14688bd2.6295c36242107fd6=---

