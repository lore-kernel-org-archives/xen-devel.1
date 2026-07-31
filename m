Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947F0C54F54
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 14:48:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379228.1623967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpoXE-00078v-Nb; Fri, 31 Jul 2026 14:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379228.1623967; Fri, 31 Jul 2026 14:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpoXE-00078o-KP; Fri, 31 Jul 2026 14:48:28 +0000
Received: by outflank-mailman (input) for mailman id 1379228;
 Fri, 31 Jul 2026 14:48:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a5db67000e099@swg.vates.tech>)
 id 1wpoXD-00078i-9d
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 14:48:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpoXC-003Mpg-In
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 16:48:26 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a5db67000e099@swg.vates.tech>)
 id 6a6cb59a-2eae-0a2a0a5409dd-0a2a4506ece0-38
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:48:26 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a5db67000e099@swg.vates.tech>)
 id 6a6cb5b9-195a-0a2a45060019-b9ff1c229fe9-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:48:26 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fb8a5db67000e099.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 31 Jul 2026 14:48:25 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9040C82040;
 Fri, 31 Jul 2026 16:48:24 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=yJ+VN37+/pdQ5OC+km6YRlY//u/jDZCfr0NxThUf+18=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=DCffqbhkJFfa6gfxZVpeaBbJb6I+WqwhTN/jMdPriP8q/mSJJP+qgRcotE21heC9jTRJCQ9JS
 vrzZJNzytM6/DUkYcHmcNAPPPAKC0s5KsfQXfu6HT12QiLvoUnGF+S6jwT51a4/9+aCdTzeBKhz
 qU8Us80ELkayihulEbtEY1XNaoWFq9jQUxO8GIvZ+SgJNKNUaSg2Zeh/RsznIJD00FyvklX1uix
 RwmsZDzHG9eloJNrHHCHtnP2EaITqsLvO+jRv3sFRfvXr1owiIAQR0IQr2BYlaaaWRnXcb9hwa3
 p7B6UlKPdnLTsyzwQOSTlyyMJoRVfXJZBwUKVpeqJgZg==
X-Zone-Loop: 5883793c859492cb0970e8ead640b63868f7c390caac
x-campaign-type: default
x-transaction-id: 73a6db4d-f263-4d9e-baac-1759b323db72
x-swg-uid: 01-d5432d90-1c80-49f0-8ebc-7b61b02a8cd4
X-Mailer: Sweego
Message-ID:
 <1785509305.8631fc262581453bbf619ec5b2062170.19fb8a5db67000e099@vates.tech>
x-swg-bid: 1785509305.8631fc262581453bbf619ec5b2062170.19fb8a5db67000e099
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
Subject: [PATCH v2 1/5] vmx: Refactor vpid_sync_vcpu_gva()
Date: Fri, 31 Jul 2026 16:46:19 +0200
In-Reply-To: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
References: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.18ff.71101933f68cc749.19fb8a5d996.f3f5bee82a807134=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785509304727
X-purgate-ID: tlsNG-16d1c6/1785509306-1F8CB77B-8B60FC19/0/0
X-purgate-type: clean
X-purgate-size: 1708

---=Part.18ff.71101933f68cc749.19fb8a5d996.f3f5bee82a807134=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Reorganize the logic to drop the use of goto=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
v2: Introduced

 xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh b/xen/arch/x86/inclu=
de/asm/hvm/vmx/vmx=2Eh
index da04752e17=2E=2Efe2cb4be0e 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh
@@ -460,19 +460,16 @@ static inline void vpid_sync_vcpu_gva(struct vcpu *v=
, unsigned long gva)
      * If individual address invalidation is not supported, we escalate t=
o
      * use single context invalidation=2E
      */
-    if ( likely(cpu_has_vmx_vpid_invvpid_individual_addr) )
-        goto execute_invvpid;
-
-    type =3D INVVPID_SINGLE_CONTEXT;
+    if ( unlikely(!cpu_has_vmx_vpid_invvpid_individual_addr) )
+        type =3D INVVPID_SINGLE_CONTEXT;
=20
     /*
      * If single context invalidation is not supported, we escalate to
      * use all context invalidation=2E
      */
-    if ( !cpu_has_vmx_vpid_invvpid_single_context )
+    if ( unlikely(!cpu_has_vmx_vpid_invvpid_single_context) )
         type =3D INVVPID_ALL_CONTEXT;
=20
-execute_invvpid:
     __invvpid(type, v->arch=2Ehvm=2En1asid=2Easid, (u64)gva);
 }
=20
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.18ff.71101933f68cc749.19fb8a5d996.f3f5bee82a807134=---

