Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DD0606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 15:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=HumwHu07
Received: from list by lists.xenproject.org with outflank-mailman.1461535.1672567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMnA-000433-HI; Mon, 26 Oct 2026 15:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461535.1672567; Mon, 26 Oct 2026 15:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMnA-00042w-EQ; Mon, 26 Oct 2026 15:39:20 +0000
Received: by outflank-mailman (input) for mailman id 1461535;
 Mon, 26 Oct 2026 15:39:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178ddb234000f79f@swg.vates.tech>)
 id 1xLMn9-00042q-9e
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:39:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLMn8-00HJiQ-FE
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:39:18 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178ddb234000f79f@swg.vates.tech>)
 id 6adf741f-bab6-0a2a0a5309dd-0a2a4508b600-12
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:39:18 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178ddb234000f79f@swg.vates.tech>)
 id 6adf7426-f659-0a2a45080019-b9ff1c2294b9-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:39:18 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a178ddb234000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 15:39:17 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6A66582E5C;
 Mon, 26 Oct 2026 16:39:16 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=W9cgPuSnp07sqtpr6b1HIev5P/fXUAKXUDQbiH6pCjk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=HumwHu07t01mlJLs5kgW1CZdMkXGahoMiSH1Ode+BFfQ+kngx5wEXa+4TIRcFje/wyUGBqUyV
 zlNFhiFSGekU9QiF7YEk0e3tkv3dM9N85968HGt5Qspa4W5D3YL10RzL/KOqxocVfeVqvyKUAOf
 akObij6IFcSfRI8yTP7K2yQmMazRj2NfK6MHT0/k7+Y6OCg0oc8N0MW1FW3GJ+qr27qYULd1hdL
 hgqLe4kKu4RV+Ssvcy9kZo+6YB8jy5QWwcAXY4dfQ3ehDbGZWiswNVAog0/2FOmJovCRiqEmFro
 OFUo85Zrcd0El7HYdsrMyagj1jeA4vXpFeJWOChExdOg==
X-Zone-Loop: ae3a0b935d09a42b17fe36e8469aa5274c6015090df5
x-campaign-type: default
x-transaction-id: bfd348b4-d08c-46a4-9aec-6f74a87729ac
x-swg-uid: 01-847c607d-7c8a-4aef-b33f-bce16f3c4efa
X-Mailer: Sweego
Message-ID:
 <1793029157.8631fc262581453bbf619ec5b2062170.1a178ddb234000f79f@vates.tech>
x-swg-bid: 1793029157.8631fc262581453bbf619ec5b2062170.1a178ddb234000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH v2] x86/nestedhvm: Inline nestedhvm_vcpu_in_guestmode()
Date: Mon, 26 Oct 2026 16:38:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.200.1a5b3fe219041a6.1a178ddaed4.db010e8b2648ab06=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793029156564
X-purgate-ID: tlsNG-c1860d/1793029158-CFCD387B-4D3766D1/0/0
X-purgate-type: clean
X-purgate-size: 2115
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.200.1a5b3fe219041a6.1a178ddaed4.db010e8b2648ab06=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This function just returns vcpu_nestedhvm(v)=2Env_guestmode and would
be better inlined to improve codegen=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
v2:
 - make vcpu const
 - remove non useful comments

 xen/arch/x86/hvm/nestedhvm=2Ec             | 7 -------
 xen/arch/x86/include/asm/hvm/nestedhvm=2Eh | 7 +++++--
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/hvm/nestedhvm=2Ec b/xen/arch/x86/hvm/nestedhvm=
=2Ec
index bddd77d810=2E=2E3205277e81 100644
--- a/xen/arch/x86/hvm/nestedhvm=2Ec
+++ b/xen/arch/x86/hvm/nestedhvm=2Ec
@@ -15,13 +15,6 @@
=20
 static unsigned long *shadow_io_bitmap[3];
=20
-/* Nested VCPU */
-bool
-nestedhvm_vcpu_in_guestmode(struct vcpu *v)
-{
-    return vcpu_nestedhvm(v)=2Env_guestmode;
-}
-
 void
 nestedhvm_vcpu_reset(struct vcpu *v)
 {
diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm=2Eh b/xen/arch/x86/inc=
lude/asm/hvm/nestedhvm=2Eh
index ea2c1bc328=2E=2E8a2a0fbb3c 100644
--- a/xen/arch/x86/include/asm/hvm/nestedhvm=2Eh
+++ b/xen/arch/x86/include/asm/hvm/nestedhvm=2Eh
@@ -28,11 +28,14 @@ static inline bool nestedhvm_enabled(const struct doma=
in *d)
     return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_nested_=
virt);
 }
=20
-/* Nested VCPU */
+static inline bool nestedhvm_vcpu_in_guestmode(const struct vcpu *v)
+{
+    return vcpu_nestedhvm(v)=2Env_guestmode;
+}
+
 int nestedhvm_vcpu_initialise(struct vcpu *v);
 void nestedhvm_vcpu_destroy(struct vcpu *v);
 void nestedhvm_vcpu_reset(struct vcpu *v);
-bool nestedhvm_vcpu_in_guestmode(struct vcpu *v);
 #define nestedhvm_vcpu_enter_guestmode(v) \
     vcpu_nestedhvm(v)=2Env_guestmode =3D 1
 #define nestedhvm_vcpu_exit_guestmode(v)  \
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.200.1a5b3fe219041a6.1a178ddaed4.db010e8b2648ab06=---

