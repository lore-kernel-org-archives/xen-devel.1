Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CBEC982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:51:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429084.1652025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91pg-0004uz-KL; Tue, 22 Sep 2026 14:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429084.1652025; Tue, 22 Sep 2026 14:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91pg-0004us-HC; Tue, 22 Sep 2026 14:50:56 +0000
Received: by outflank-mailman (input) for mailman id 1429084;
 Tue, 22 Sep 2026 14:50:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c99927a900072c4@swg.vates.tech>)
 id 1x91pf-0004uQ-Ls
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:50:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91pf-004s76-2p
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:50:55 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c99927a900072c4@swg.vates.tech>)
 id 6ab295be-bab6-0a2a0a5309dd-0a2a450c94b8-46
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:50:54 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c99927a900072c4@swg.vates.tech>)
 id 6ab295ce-f479-0a2a450c0019-b9ff1c229469-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:50:54 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0c99927a900072c4.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 22 Sep 2026 14:50:52 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id E526081F18;
 Tue, 22 Sep 2026 16:50:51 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=6eAo7c3MG+C8Ech4IV5+ANE4e8iZF0V92ih6APaMRjQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=VtxwEOWlZpXeHFNCFRKbPCEIoQP7ANYGz2BQ/QkxeyU3upwSv5sWgGVIT9192AIeUYzf9Hy/J
 UqjX0qoOpv9Tjkx47NjaP7gRtPG/2OwdEftFJmzuAVKLfihlFNmJCeIGcehwuRkR0ffBP2dkgqd
 Pbom58bjD6vji+kmeBkzs3jg14xGnczaGjBMkjjFTX5J43rleA/Mx/npUrrnCRzIAe1Vdsi5U5I
 2VSdw6awok2rW66psKxZjm9Ew0sSC0YFW00/2e6u7xfWE1c3uJqBxyL67yJwyaXd9dB08iDDhHv
 XEclZlMD3W0vTK8YSrVNDHA6aQzgs/Ast2AGAaJ2PTlg==
X-Zone-Loop: e0b49ee9af5f70e319e5ab6c82a81cf8e5f47b43d7fd
x-campaign-type: default
x-transaction-id: 6f8a17f6-adcb-4b38-a56f-61183e8e2d81
x-swg-uid: 01-f19ef4d7-e8b9-4d0b-83a9-3ece3b2af384
X-Mailer: Sweego
Message-ID:
 <1790088652.8631fc262581453bbf619ec5b2062170.1a0c99927a900072c4@vates.tech>
x-swg-bid: 1790088652.8631fc262581453bbf619ec5b2062170.1a0c99927a900072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH] vvmx: Handle INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL properly
Date: Tue, 22 Sep 2026 16:50:17 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.33b.b627ffca3605a2ed.1a0c999255e.5e92ecd46a17f789=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790088652131
X-purgate-ID: tlsNG-d25034/1790088654-02CDBA5B-60BFB5A5/0/0
X-purgate-type: clean
X-purgate-size: 1216

---=Part.33b.b627ffca3605a2ed.1a0c999255e.5e92ecd46a17f789=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The feature is already advertised in NVPID_CAP_BITS, yet the handling
in nvmx_handle_invvpid() was missing=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
Fixes: 9ccf55307868 ("nVMX: virutalize VPID capability to nested VMM")
---
 xen/arch/x86/hvm/vmx/vvmx=2Ec | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/vmx/vvmx=2Ec b/xen/arch/x86/hvm/vmx/vvmx=2Ec
index e2407f07c2=2E=2E9be8b0067f 100644
--- a/xen/arch/x86/hvm/vmx/vvmx=2Ec
+++ b/xen/arch/x86/hvm/vmx/vvmx=2Ec
@@ -2053,6 +2053,7 @@ static int nvmx_handle_invvpid(struct cpu_user_regs =
*regs)
     case INVVPID_INDIVIDUAL_ADDR:
     case INVVPID_SINGLE_CONTEXT:
     case INVVPID_ALL_CONTEXT:
+    case INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL:
         hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(current)=2Env_n2asid);
         break;
     default:
--=20
2=2E55=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.33b.b627ffca3605a2ed.1a0c999255e.5e92ecd46a17f789=---

