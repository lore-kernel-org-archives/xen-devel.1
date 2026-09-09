Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EFBC79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 12:14:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412923.1643203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4HCB-0004cX-L7; Wed, 09 Sep 2026 12:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412923.1643203; Wed, 09 Sep 2026 12:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4HCB-0004cQ-I4; Wed, 09 Sep 2026 12:14:31 +0000
Received: by outflank-mailman (input) for mailman id 1412923;
 Wed, 09 Sep 2026 12:14:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a086174641000c4f3@swg.vates.tech>)
 id 1x4HCA-0004cH-Ha
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 12:14:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4HC9-007Pxf-T0
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:14:29 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a086174641000c4f3@swg.vates.tech>)
 id 6aa14d9b-e002-0a2a0a5209dd-0a2a4504d6b6-44
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:14:29 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a086174641000c4f3@swg.vates.tech>)
 id 6aa14da5-b57f-0a2a45040019-b9ff1c23a4e3-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:14:29 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a086174641000c4f3.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 09 Sep 2026 12:14:27 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8DF7B81D31;
 Wed,  9 Sep 2026 14:14:26 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=64t6DlOqM5oBcjLpnyKokKcO6pW+6+MyeV0F8Ibs75E=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=Ua0gCRnti2XirZLWwe2wV9P0RbXcee1SQXpSHqXvPDpyVzxXRWvNQMtQw9SOD9ghPNGFP6t1G
 PMSTXBccLQolZY8m7o7sg0QiEMSs5UtB/CMFVxPatmYyLIY74CUDyY2N9/d42LBvlGMQB+asWK0
 0pcfPUMxtLh+mrJ/wEeYMGHBuvqnZU4UAbdm8mvUJfW0SvHDAGc5CeQDd1e6iuRwCbmIDYyWIVs
 /JnmPX0dJWiN4S1lkDfg1i7sRaEbLcYH6TnouyMnnvXlMJvrQBeKn+4yTMwjUqP7KlT8zvJEfv2
 zBFbHcwM/aDnpGVz1UnDYj+828hLX4iBuK1u00/B4JSw==
X-Zone-Loop: a34b4a0410d78ebd248b70c52de1449c37237a01c9d5
x-campaign-type: default
x-transaction-id: 210a9964-ee39-40df-bc42-e6984d4378ec
x-swg-uid: 01-a2d3c175-c1e6-4107-ad60-399b8219d23b
X-Mailer: Sweego
Message-ID:
 <1788956067.8631fc262581453bbf619ec5b2062170.1a086174641000c4f3@vates.tech>
x-swg-bid: 1788956067.8631fc262581453bbf619ec5b2062170.1a086174641000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@xenproject.org,
	xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH v3] x86/vmx: Avoid pausing on HVM_PARAM_IDENT_PT in additional cases
Date: Wed,  9 Sep 2026 14:12:43 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.33.3b80ac56d6942fe5.1a0861743bb.7e3b699b805aa14=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788956066752
X-purgate-ID: tlsNG-ebf023/1788956069-C20D5B50-95E5652E/0/0
X-purgate-type: clean
X-purgate-size: 1678

---=Part.33.3b80ac56d6942fe5.1a0861743bb.7e3b699b805aa14=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When settings HVM_PARAM_IDENT_PT, skip domain pausing when :
- there is no vcpu
- unrestricted guest capability is used

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Regarding checking for hvm_paging_enabled(v) (proposed in v2 review), we c=
an't
as hvm_paging_enabled() is vCPU specific, and vCPU 0 may have a different =
value
to another one=2E

v3:
 - rebased patches with staging
 - adjusted formatting

v2:
 - rebased patches with staging

 xen/arch/x86/hvm/hvm=2Ec | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm=2Ec b/xen/arch/x86/hvm/hvm=2Ec
index 9a4147b62e=2E=2E2981a61cee 100644
--- a/xen/arch/x86/hvm/hvm=2Ec
+++ b/xen/arch/x86/hvm/hvm=2Ec
@@ -4237,11 +4237,14 @@ static int hvm_set_param(struct domain *d, uint32_=
t index, uint64_t value)
             rc =3D -EINVAL;
         break;
     case HVM_PARAM_IDENT_PT:
+        v =3D domain_vcpu(d, 0);
+
         /*
          * Only actually required for VT-x lacking unrestricted_guest
          * capabilities=2E  Short circuit the pause if possible=2E
          */
-        if ( paging_mode_shadow(d) || !using_vmx() )
+        if ( paging_mode_shadow(d) || !using_vmx() || !v ||
+             vmx_unrestricted_guest(v) )
             break;
=20
         /*
--=20
2=2E55=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.33.3b80ac56d6942fe5.1a0861743bb.7e3b699b805aa14=---

