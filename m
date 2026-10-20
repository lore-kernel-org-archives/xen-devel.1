Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D474606A32A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 16:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=FgOWvvIs
Received: from list by lists.xenproject.org with outflank-mailman.1456087.1669668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJD6A-0000z7-Bx; Tue, 20 Oct 2026 16:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456087.1669668; Tue, 20 Oct 2026 16:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJD6A-0000z0-7y; Tue, 20 Oct 2026 16:54:02 +0000
Received: by outflank-mailman (input) for mailman id 1456087;
 Tue, 20 Oct 2026 16:54:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15a3be15b000f79f@swg.vates.tech>)
 id 1xJD69-0000yr-7g
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 16:54:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJD68-00E2lu-KB
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 18:54:00 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15a3be15b000f79f@swg.vates.tech>)
 id 6ad79c90-e002-0a2a0a5209dd-0a2a4505d77e-26
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 18:54:00 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15a3be15b000f79f@swg.vates.tech>)
 id 6ad79ca8-4cb1-0a2a45050019-b9ff1c22b1f7-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 18:54:00 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a15a3be15b000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 16:53:56 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 491E881DEB;
 Tue, 20 Oct 2026 18:53:55 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=03U4Gp71EJX1XZmHAY2plSaL9UCiNO03ffGZko0HxOQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=FgOWvvIshurWgFvDIgAqNA17TifWNTemgrfwd47cp5JLmEHd1/F6m0pxR6DFYKKb7uluoA8sp
 TBp0pm3gtYPmatP52ZjAS0vrybtGW/To3NY1htr6XZJdeWlU9SxqCAifmrad5Yk1Fibvn7Uah7x
 VJrNP/VxXSL68RvCoWcelie1sBvCuClTgcwciLTRyoqADt4mRr3aMx4QK7UR41EFNwwI5wiPy6g
 swBEDNN7/sqfg3LUTcTRLN88QP4o5zkZ9qYbfsHI50neKpHkSvYnxjsLCyyfYKfxsBfcT8bEM6H
 wAFJNWQIqjBiKhTIJETozYx0UueOkh/bfDI5vBioKtsA==
X-Zone-Loop: 1622391ff852450dc242ad066e87b960b37b5f478dee
x-campaign-type: default
x-transaction-id: 04d8d709-5e17-49a3-ab3e-fefa59a0aad4
x-swg-uid: 01-a4266813-cbab-47c6-8ae9-0ad831c36169
X-Mailer: Sweego
Message-ID:
 <1792515236.8631fc262581453bbf619ec5b2062170.1a15a3be15b000f79f@vates.tech>
x-swg-bid: 1792515236.8631fc262581453bbf619ec5b2062170.1a15a3be15b000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH] x86/nestedhvm: Inline nestedhvm_vcpu_in_guestmode()
Date: Tue, 20 Oct 2026 18:53:27 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.6b.3b5b6858a03e0815.1a15a3bde67.cfa53d779037299e=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792515235431
X-purgate-ID: tlsNG-c201ff/1792515240-F72B32A1-9321703F/0/0
X-purgate-type: clean
X-purgate-size: 2050
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.6b.3b5b6858a03e0815.1a15a3bde67.cfa53d779037299e=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This function just returns vcpu_nestedhvm(v)=2Env_guestmode and would
be better inlined to improve codegen=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/arch/x86/hvm/nestedhvm=2Ec             | 7 -------
 xen/arch/x86/include/asm/hvm/nestedhvm=2Eh | 6 +++++-
 2 files changed, 5 insertions(+), 8 deletions(-)

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
index ea2c1bc328=2E=2E9e158bc5ce 100644
--- a/xen/arch/x86/include/asm/hvm/nestedhvm=2Eh
+++ b/xen/arch/x86/include/asm/hvm/nestedhvm=2Eh
@@ -28,11 +28,15 @@ static inline bool nestedhvm_enabled(const struct doma=
in *d)
     return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_nested_=
virt);
 }
=20
+static inline bool nestedhvm_vcpu_in_guestmode(struct vcpu *v)
+{
+    return vcpu_nestedhvm(v)=2Env_guestmode;
+}
+
 /* Nested VCPU */
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
---=Part.6b.3b5b6858a03e0815.1a15a3bde67.cfa53d779037299e=---

