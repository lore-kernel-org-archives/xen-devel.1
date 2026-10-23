Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3A3606A319
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 01:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=kB6v+5+5
Received: from list by lists.xenproject.org with outflank-mailman.1458740.1670799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK3pp-0005SR-FF; Fri, 23 Oct 2026 01:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458740.1670799; Fri, 23 Oct 2026 01:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK3pp-0005SK-Ba; Fri, 23 Oct 2026 01:12:41 +0000
Received: by outflank-mailman (input) for mailman id 1458740;
 Fri, 23 Oct 2026 01:12:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a166511467000f79f@swg.vates.tech>)
 id 1xK3po-0005SE-2w
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 01:12:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK3pn-006VAe-G2
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 03:12:39 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a166511467000f79f@swg.vates.tech>)
 id 6adab402-2eae-0a2a0a5409dd-0a2a450b92d2-42
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 03:12:39 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a166511467000f79f@swg.vates.tech>)
 id 6adab481-b7e8-0a2a450b0019-b9ff1c2397e9-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 03:12:34 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a166511467000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 23 Oct 2026 01:12:32 +0000
Received: from localhost.localdomain (142.220.66.37.rev.sfr.net
 [37.66.220.142]) (Authenticated sender: ngoc-tu.dinh@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0B9F082AFC;
 Fri, 23 Oct 2026 03:12:31 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=UpzAsBL3BaDQJfl8w3oCa9ArcpkjvtzVZuOJOHge0/8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=kB6v+5+5cC4VmN4Ha6ikh6LrlL/bYKGQXJqOq26aEoxeuX5eqxcnXZJgfqFzZ78VDGjZiTVq1
 I8gBJ+EwT/QAdurGqTbAppkKBS3Kzspd+bW1kpbLZELJJmZjFPBA09AJiPaWL6RE6/giPNy34wC
 XqISu/DGYFud74uEcKKq+mWRn9lAdJ23ltUJNo1ssYLgYfesO4g5gR5rGik3NjeqL7dlno0fcMD
 JGuQCLTS/xfXn+bEPst3q3qhDXuc2DtwKcOdSuhFOAwPAVOCcOy9JCbjx83cbm7I8i3dYWJswzY
 5VJCXk6G38MinMalbudygImzytDKls8aYycoQa43EELg==
X-Zone-Loop: 633eca05b336fd2e6cbe33ae48dc76d37611608504e3
x-campaign-type: default
x-transaction-id: eef00c42-7d88-4d54-a551-d71c2fe88b73
x-swg-uid: 01-9f0a2a20-ce52-44d9-85bb-65df19ae3ce5
X-Mailer: Sweego
Message-ID:
 <1792717952.8631fc262581453bbf619ec5b2062170.1a166511467000f79f@vates.tech>
x-swg-bid: 1792717952.8631fc262581453bbf619ec5b2062170.1a166511467000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Tu Dinh <ngoc-tu.dinh@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Tu Dinh <ngoc-tu.dinh@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/vpt: Validate timer object with generation number
Date: Fri, 23 Oct 2026 03:12:28 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.14f.8573d86700e65843.1a1665110b1.4206c985e7a761a4=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792717951153
X-purgate-ID: tlsNG-42698a/1792717959-AB2DC9EA-958AB1A5/0/0
X-purgate-type: clean
X-purgate-size: 3151
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.14f.8573d86700e65843.1a1665110b1.4206c985e7a761a4=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The remote completion path of pt_update_irq removes timers from tm_list
by checking that their addresses match the previous iteration=2E However,
if the guest rearms a timer during the gap between two list iterations,
the resulting timer object is no longer the same, even if their
addresses match=2E Removing the timer from the list will then lose the
armed timer object=2E

Record a generation number in each timer object upon arming, and check
that the generation number matches before removing it from the list=2E

Signed-off-by: Tu Dinh <ngoc-tu=2Edinh@vates=2Etech>
---
 xen/arch/x86/hvm/vpt=2Ec             | 6 ++++++
 xen/arch/x86/include/asm/hvm/vpt=2Eh | 1 +
 2 files changed, 7 insertions(+)

diff --git a/xen/arch/x86/hvm/vpt=2Ec b/xen/arch/x86/hvm/vpt=2Ec
index 50ed738998=2E=2Edce365f137 100644
--- a/xen/arch/x86/hvm/vpt=2Ec
+++ b/xen/arch/x86/hvm/vpt=2Ec
@@ -318,6 +318,7 @@ int pt_update_irq(struct vcpu *v)
     struct list_head *head =3D &v->arch=2Ehvm=2Etm_list;
     struct periodic_time *pt, *temp, *earliest_pt;
     uint64_t max_lag;
+    uint64_t generation;
     int irq, pt_vector =3D -1;
     bool level;
=20
@@ -356,6 +357,7 @@ int pt_update_irq(struct vcpu *v)
     }
=20
     earliest_pt->irq_issued =3D 1;
+    generation =3D earliest_pt->generation;
     irq =3D earliest_pt->irq;
     level =3D earliest_pt->level;
=20
@@ -411,6 +413,9 @@ int pt_update_irq(struct vcpu *v)
                 list_for_each_entry ( pt, &v->arch=2Ehvm=2Etm_list, list =
)
                     if ( pt =3D=3D earliest_pt )
                     {
+                        if ( pt->generation !=3D generation )
+                            break;
+
                         pt_irq_fired(v, pt);
                         cb =3D pt->cb;
                         cb_priv =3D pt->priv;
@@ -550,6 +555,7 @@ void create_periodic_time(
     set_timer(&pt->timer, pt->scheduled);
=20
     pt_vcpu_lock(v);
+    pt->generation++;
     pt->on_list =3D 1;
     list_add(&pt->list, &v->arch=2Ehvm=2Etm_list);
     pt_vcpu_unlock(v);
diff --git a/xen/arch/x86/include/asm/hvm/vpt=2Eh b/xen/arch/x86/include/a=
sm/hvm/vpt=2Eh
index f6bcec8090=2E=2E8914ed6d5c 100644
--- a/xen/arch/x86/include/asm/hvm/vpt=2Eh
+++ b/xen/arch/x86/include/asm/hvm/vpt=2Eh
@@ -34,6 +34,7 @@ struct periodic_time {
     u8 irq;
     struct vcpu *vcpu;          /* vcpu timer interrupt delivers to */
     u32 pending_intr_nr;        /* pending timer interrupts */
+    u64 generation;             /* distinguish two armings of the same ti=
mer */
     u64 period;                 /* frequency in ns */
     s_time_t scheduled;         /* scheduled timer interrupt */
     u64 last_plt_gtime;         /* platform time when last IRQ is injecte=
d */
--=20
2=2E56=2E0



-- 
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates =
solutions

web: https://vates=2Etech
---=Part.14f.8573d86700e65843.1a1665110b1.4206c985e7a761a4=---

