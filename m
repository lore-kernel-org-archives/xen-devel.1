Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C89606A32E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 16:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=Zzl3LVmM
Received: from list by lists.xenproject.org with outflank-mailman.1501266.1697383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk6-0000jF-8K; Tue, 24 Nov 2026 16:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501266.1697383; Tue, 24 Nov 2026 16:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk5-0000hx-Tj; Tue, 24 Nov 2026 16:51:41 +0000
Received: by outflank-mailman (input) for mailman id 1501266;
 Tue, 24 Nov 2026 16:51:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVtk2-00007E-Ux
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:51:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVtk2-002XqQ-A6
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:51:38 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e78469c0001cf5@swg.vates.tech>)
 id 6b05c075-bab6-0a2a0a5309dd-0a2a4506b284-48
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:38 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e78469c0001cf5@swg.vates.tech>)
 id 6b05c095-195a-0a2a45060019-b9ff1c23ad3d-5
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:38 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a20e78469c0001cf5.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Nov 2026 16:51:33 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9449C830A3;
 Tue, 24 Nov 2026 17:51:32 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=c7kiqm0j40OeDAPhPWBHWXyJ895jJRlh88EENHWXY08=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Zzl3LVmMJfyTPPOTc2IuR96R8bO4Gm4c78TnQE65jxFg/oQb4k2XJ1CSpgzbVQGBtY3/+s+CP
 rlesTzZYeGhgSzgYCu4dGDRy2bqefalv3VQ4dKk80HhuHFr2uXpoUg738EarlMG+JGwxM11l5/p
 YPzSVONnIMt4yXZ6MPaV9AF5gdH2IJi3ym9wzVkNrAN8rbETpiDcMJXf4499llF1AKOxWTSmAKs
 NMgmCKRGorG2N8mgUuDJ7Nn+76QxS9/m3Z9GzfwQLzBPlaarXkoXzSjzmd2yna/WC3kXK+LwcAY
 U3jqzy2YS6UFOHihS594aGxYQ7H8JdmtaG4QnC73ISsg==
X-Zone-Loop: a252cc7a3877a6f44c18dfef9365f46808248beadc0a
x-campaign-type: default
x-transaction-id: 0659c467-7d22-4472-b1c4-ff6ba7b0fe5c
x-swg-uid: 01-3576b407-0165-403c-8cc0-041fbc31d72b
X-Mailer: Sweego
Message-ID:
 <1795539093.8631fc262581453bbf619ec5b2062170.1a20e78469c0001cf5@vates.tech>
x-swg-bid: 1795539093.8631fc262581453bbf619ec5b2062170.1a20e78469c0001cf5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [RFC PATCH v2 10/13] x86/fastabi: Expose to guest by default
Date: Tue, 24 Nov 2026 17:50:38 +0100
In-Reply-To: <20261124165041.653941-2-teddy.astie@vates.tech>
References: <1795538976.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5@vates.tech>
 <20261124165041.653941-2-teddy.astie@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.136.b15eedfa89539d21.1a20e78451a.e5cf9b594545431d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795539092763
X-purgate-ID: tlsNG-16d1c6/1795539098-F687577B-7A1D1D3E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1218
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.136.b15eedfa89539d21.1a20e78451a.e5cf9b594545431d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Now that we have all the logic there=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Cc: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
Cc: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>

Logic to hide the feature to a guest is not implemented yet=2E

 xen/arch/x86/cpuid=2Ec | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/cpuid=2Ec b/xen/arch/x86/cpuid=2Ec
index a9aeb2d268=2E=2E53e78783df 100644
--- a/xen/arch/x86/cpuid=2Ec
+++ b/xen/arch/x86/cpuid=2Ec
@@ -154,6 +154,9 @@ static void cpuid_hypervisor_leaves(const struct vcpu =
*v, uint32_t leaf,
          */
         res->a |=3D XEN_HVM_CPUID_UPCALL_VECTOR;
=20
+        if ( IS_ENABLED(CONFIG_FASTABI) && is_hvm_vcpu(v) )
+            res->a |=3D XEN_HVM_CPUID_FASTABI;
+
         break;
=20
     case 5: /* PV-specific parameters */
--=20
2=2E56=2E1



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.136.b15eedfa89539d21.1a20e78451a.e5cf9b594545431d=---

