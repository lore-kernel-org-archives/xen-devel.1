Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20DD606A321
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=plLT6Eg5
Received: from list by lists.xenproject.org with outflank-mailman.1461399.1672400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLLJ9-0005Dv-TS; Mon, 26 Oct 2026 14:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461399.1672400; Mon, 26 Oct 2026 14:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLLJ9-0005Do-Qf; Mon, 26 Oct 2026 14:04:15 +0000
Received: by outflank-mailman (input) for mailman id 1461399;
 Mon, 26 Oct 2026 14:04:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178869cb4000f79f@swg.vates.tech>)
 id 1xLLJ8-0005Di-J9
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 14:04:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLLJ7-00DUjC-5v
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:04:13 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178869cb4000f79f@swg.vates.tech>)
 id 6adf5ddc-2eae-0a2a0a5409dd-0a2a4502ec76-2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 15:04:12 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178869cb4000f79f@swg.vates.tech>)
 id 6adf5ddc-6ca4-0a2a45020019-b9ff1c129969-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 15:04:12 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a178869cb4000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 14:04:10 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 740E7821B9;
 Mon, 26 Oct 2026 15:04:09 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=WGhq4g4rSrDWDVfqAZMue0dtY75qGL7ROykWVYh7cCA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=plLT6Eg50HSoBCoM6GemAkMaBp9T2crMlYGxTzkaYH6FgeS/DAPA5p0JcwgbrfDRDegh6t0fw
 DaBlBphIdkTt/5hKrI6DeqmoPnmFY7F2CW6lx9vL7ww1c7wGU+mEyns6JuvBuRf9Osc6Ev+1z8n
 re39/2eephJg3KnHhF7gelXpZlSDHL52q9ozK6kLbrNORW4qSqSjcMR8aN2ej4ZRT7I0S89rPnp
 uh5Mee9wtjpwVXCrrHfL9sKIYQxlWsgoqIk8V82Exj8YNPrg5qoVHeL4U0Jj5+uDzc+M1M3A2wi
 GtBUd89DaVC8hv3sT5vLwPR4fQTfENa7eRry7QOUw62w==
X-Zone-Loop: 1a784bf09fc48d749180fc623575353443dd217353e4
x-campaign-type: default
x-transaction-id: 681b8edf-8b9f-44ee-a907-4df23e0212a2
x-swg-uid: 01-8bcdb3c5-2372-4b11-a5cf-7788ffb469c2
X-Mailer: Sweego
Message-ID:
 <1793023450.8631fc262581453bbf619ec5b2062170.1a178869cb4000f79f@vates.tech>
x-swg-bid: 1793023450.8631fc262581453bbf619ec5b2062170.1a178869cb4000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH v2] x86/vlapic: Don't change ICR on x2APIC SELF_IPI write
Date: Mon, 26 Oct 2026 15:03:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1f7.52f58276526bd76a.1a178869a09.d31f7ca2ca9038a6=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793023449615
X-purgate-ID: tlsNG-720697/1793023452-F22A92AC-C08B0402/0/0
X-purgate-type: clean
X-purgate-size: 2959
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.1f7.52f58276526bd76a.1a178869a09.d31f7ca2ca9038a6=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Intel SDM (Vol 3A-13=2E12=2E11, June 2026) says

> The semantics of sending a self-IPI via the SELF IPI register
> are identical to sending a self targeted edge triggered fixed
> interrupt with the specified vector=2E

However, this doesn't require altering the ICR register=2E
On most Intel processors (at least Core/P-Core), it does alter ICR,
but it's not the case on AMD and Atom/E-Core ones, and APICv Self-IPI
appears to follow a similar behavior=2E

For consistency, adjust the Xen behavior to send the Self-IPI
directly instead of emulating it by modifying ICR register=2E

It also clarify the logic=2E

Assisted-by: Claude Fable 5=2E1
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
I haven't check if APICv Self-IPI doesn't alter the ICR, this is
mostly based on what suggest Andrew's comment [1]=2E Intel SDM doesn't
actually tell much if ICR is modified by APICv Self-IPI but
behavior pseudo-code suggest that ICR is not considered at all,
hence Self-IPI is done differently=2E

[1] https://lore=2Ekernel=2Eorg/xen-devel/b236e564-c2fd-44d1-93ee-8bb87e2e=
2c0f@citrix=2Ecom/

v2:
 - adjust commit message, drop Fixes
 - drop vlapic_self_ipi() function
 - reorganize vlapic_apicv_write()
---
 xen/arch/x86/hvm/vlapic=2Ec | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic=2Ec b/xen/arch/x86/hvm/vlapic=2Ec
index 885f5d304b=2E=2E7d6b1a6e0d 100644
--- a/xen/arch/x86/hvm/vlapic=2Ec
+++ b/xen/arch/x86/hvm/vlapic=2Ec
@@ -970,11 +970,13 @@ int vlapic_apicv_write(struct vcpu *v, unsigned int =
offset)
=20
     if ( vlapic_x2apic_mode(vlapic) )
     {
-        if ( offset !=3D APIC_SELF_IPI )
-            return X86EMUL_UNHANDLEABLE;
+        if ( offset =3D=3D APIC_SELF_IPI )
+        {
+            vlapic_ipi(vlapic, APIC_DEST_SELF | (val & APIC_VECTOR_MASK),=
 0);
+            return X86EMUL_OKAY;
+        }
=20
-        offset =3D APIC_ICR;
-        val =3D APIC_DEST_SELF | (val & APIC_VECTOR_MASK);
+        return X86EMUL_UNHANDLEABLE;
     }
=20
     vlapic_reg_write(v, offset, val);
@@ -1050,9 +1052,8 @@ int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr,=
 uint64_t val)
     case APIC_SELF_IPI:
         if ( val & ~APIC_VECTOR_MASK )
             return X86EMUL_EXCEPTION;
-        offset =3D APIC_ICR;
-        val =3D APIC_DEST_SELF | (val & APIC_VECTOR_MASK);
-        break;
+        vlapic_ipi(vlapic, APIC_DEST_SELF | (val & APIC_VECTOR_MASK), 0);
+        return X86EMUL_OKAY;
=20
     case APIC_EOI:
     case APIC_ESR:
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.1f7.52f58276526bd76a.1a178869a09.d31f7ca2ca9038a6=---

