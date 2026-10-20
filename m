Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC36606A32E
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=PliB0PuT
Received: from list by lists.xenproject.org with outflank-mailman.1455878.1669529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJAHq-0001Zg-1c; Tue, 20 Oct 2026 13:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455878.1669529; Tue, 20 Oct 2026 13:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJAHp-0001XF-Rr; Tue, 20 Oct 2026 13:53:53 +0000
Received: by outflank-mailman (input) for mailman id 1455878;
 Tue, 20 Oct 2026 13:53:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996f611000f79f@swg.vates.tech>)
 id 1xJAHn-0001Bp-TU
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 13:53:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJAHn-00DPue-A1
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 15:53:51 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996f611000f79f@swg.vates.tech>)
 id 6ad7726f-bab6-0a2a0a5309dd-0a2a4504e5d0-0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 15:53:51 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996f611000f79f@swg.vates.tech>)
 id 6ad7726b-b57f-0a2a45040019-b9ff1c239605-5
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 15:53:51 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a15996f611000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 13:53:48 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7FE0182974;
 Tue, 20 Oct 2026 15:53:47 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=LhwuiXoRm7FVm1qXUDZ2mXBabDFJ1lqje8dUpkbOgZU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=PliB0PuTwt0yAFnxTQh7zRongHmtp+zYR4ojgtrAuQx04BwaCgw0gNlswd4QO5SMtG/wFP+VU
 KcqQNAJLgxZCvZzmzSrCi9hlh8/pPb7k8p18A3rQ1bdifExtbpguUWvnmjds1K9UZK8uq4uCn5g
 dq4vUP2YWSkJ0RiJZYtXhk0+sH2CVjKWKiOWxxkGHxKV9tLM25DkoVuhoLVjYgcEZy00lzfjOnv
 jNsZ/svo75DaBOKxjHsyAQkr5IeSOkTJZHoOp1eoSYuBD62/UsO7/kdeL2OrlhEZ34++oGW7NpM
 Vh4C5tmttE8HT5RM7mggjuPYiQ3dJTjIr/uMAV3uFFoQ==
X-Zone-Loop: ca72812a9000b0c2908c4a75bc63ce8d9f05baafb266
x-campaign-type: default
x-transaction-id: dc3d1a55-3d3d-4797-8931-07896c8acd9b
x-swg-uid: 01-6da38972-d4f6-4a79-a76d-9ae108883a66
X-Mailer: Sweego
Message-ID:
 <1792504428.8631fc262581453bbf619ec5b2062170.1a15996f611000f79f@vates.tech>
x-swg-bid: 1792504428.8631fc262581453bbf619ec5b2062170.1a15996f611000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH 6/6] vmx/apicv: Don't defer RVI update when an event is pending injection
Date: Tue, 20 Oct 2026 15:53:33 +0200
In-Reply-To: <20261020135333.38064-2-teddy.astie@vates.tech>
References: <1792504313.8631fc262581453bbf619ec5b2062170.1a1599536d8000f79f@vates.tech>
 <20261020135333.38064-2-teddy.astie@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.55.a4e302a0791dab0c.1a15996f47d.9b5b6e8e0fa63e90=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792504427645
X-purgate-ID: tlsNG-ebf023/1792504431-C14D3B50-9A59B25A/0/0
X-purgate-type: clean
X-purgate-size: 2896
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.55.a4e302a0791dab0c.1a15996f47d.9b5b6e8e0fa63e90=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

With virtual interrupt delivery, vmx_intr_assist() bails out early when
VM_ENTRY_INTR_INFO already holds an event to inject (e=2Eg=2E a re-injecte=
d
exception, or a #DB from single-stepping an emulated instruction)=2E For
PIC, NMI and MCE sources it arms the interrupt window, so Xen gets
another go once the event has been delivered=2E For LAPIC sources it
does nothing, leaving RVI stale=2E

Hardware only delivers virtual interrupts based on RVI, so a LAPIC
vector which became pending in the same VM exit (synced from the PIR,
or raised by the emulated instruction itself) isn't seen by the guest
until some unrelated VM exit runs vmx_intr_assist() again=2E  That can
take an arbitrary amount of time if the guest doesn't exit; up to
~10ms was observed in testing=2E

There is no need to wait: an event in VM_ENTRY_INTR_INFO doesn't
prevent RVI from being updated, and hardware evaluates pending virtual
interrupts once the injected event has been delivered=2E Only skip the
early exit for LAPIC sources; the others still need VM_ENTRY_INTR_INFO
themselves=2E

Fixes: 25b81a7941d7 ("xen: enable Virtual-interrupt delivery")
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
Assisted-by: Claude Fable 5=2E1
---
 xen/arch/x86/hvm/vmx/intr=2Ec | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/intr=2Ec b/xen/arch/x86/hvm/vmx/intr=2Ec
index 6c220c4c2e=2E=2E85d8bfa31d 100644
--- a/xen/arch/x86/hvm/vmx/intr=2Ec
+++ b/xen/arch/x86/hvm/vmx/intr=2Ec
@@ -274,8 +274,17 @@ void asmlinkage vmx_intr_assist(void)
                 goto out;
             }
=20
+            /*
+             * An event already queued for injection only gets in the way=
 of
+             * interrupts which need VM_ENTRY_INTR_INFO themselves=2E  LA=
PIC
+             * interrupts are delivered by hardware based on RVI, which c=
an be
+             * updated regardless: the virtual interrupt is then recognis=
ed
+             * once the injected event has been delivered, without needin=
g a
+             * further VM exit for Xen to notice the pending vector=2E
+             */
             __vmread(VM_ENTRY_INTR_INFO, &intr_info);
-            if ( intr_info & INTR_INFO_VALID_MASK )
+            if ( (intr_info & INTR_INFO_VALID_MASK) &&
+                 intack=2Esource !=3D hvm_intsrc_lapic )
             {
                 if ( (intack=2Esource =3D=3D hvm_intsrc_pic) ||
                      (intack=2Esource =3D=3D hvm_intsrc_nmi) ||
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.55.a4e302a0791dab0c.1a15996f47d.9b5b6e8e0fa63e90=---

