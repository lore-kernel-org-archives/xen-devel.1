Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E32C624D6
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:14:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407256.1640345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28Cx-0005Uo-QC; Thu, 03 Sep 2026 14:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407256.1640345; Thu, 03 Sep 2026 14:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28Cx-0005Uf-LY; Thu, 03 Sep 2026 14:14:27 +0000
Received: by outflank-mailman (input) for mailman id 1407256;
 Thu, 03 Sep 2026 14:14:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed206000c4f3@swg.vates.tech>)
 id 1x28Cv-0005Re-Qd
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:14:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28Cu-006VeY-UU
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:14:24 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed206000c4f3@swg.vates.tech>)
 id 6a9980a0-bab6-0a2a0a5309dd-0a2a4506deb4-38
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:24 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed206000c4f3@swg.vates.tech>)
 id 6a9980c0-195a-0a2a45060019-b9ff1c238775-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:24 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0679ed206000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 03 Sep 2026 14:14:16 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 34BFC83FF2;
 Thu,  3 Sep 2026 16:14:16 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=r+KqnF8bmZ4P6mM47X2d2/6/TckhTEd5k85Fqf1f/Kw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=KIKtkYRM4wkHG3Sp+annclTs9TFxeAUHROUaO+uybfcMNAfpc99qNwhwrTIFo0eGh3TFtJ+ao
 M3nfpBHA/bOWAvPuvFAcwigagCwYaZtmaFGSA4eJ9IdwwxU5gHFmuEtQsUmamTMnSlKjankguOC
 16u+7EAURaQh04TUGf42k9gCZ2TIsIeOFsXbbiF9Ny8J7t+tJT6QxunSElDASB97UztOZ1sIYd6
 kEgWWDQ2jTOBTKDGsG4q/xfxucE26XFXNwQg8D2JweVcjQSxUX4I77a7Rb59UZB83bQXNzEI87y
 9NH+/PgX1kAd9uqaAe8CWBPnBth5VIGvyP1At24342/w==
X-Zone-Loop: ba365be1de0d39ba773c754a122acf6dbd1f56c3b1a4
x-campaign-type: default
x-transaction-id: c242f644-79e9-4583-b5e2-1a90ae0c0f8d
x-swg-uid: 01-0e9fb388-982f-4dd0-bc14-bc6d134075c2
X-Mailer: Sweego
Message-ID:
 <1788444856.8631fc262581453bbf619ec5b2062170.1a0679ed206000c4f3@vates.tech>
x-swg-bid: 1788444856.8631fc262581453bbf619ec5b2062170.1a0679ed206000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v5 02/11] x86/passthrough: Wrap pt_irq_create_bind() restart block in braces
Date: Thu,  3 Sep 2026 16:14:00 +0200
In-Reply-To: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
References: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.35a5.d06bb82c97bcd973.1a0679ed066.5d48df588f90c8dd=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788444856422
X-purgate-ID: tlsNG-16d1c6/1788444864-FC40377B-BB071CD8/0/0
X-purgate-type: clean
X-purgate-size: 4918

---=Part.35a5.d06bb82c97bcd973.1a0679ed066.5d48df588f90c8dd=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Enclose the restart/retry block in pt_irq_create_bind() in an explicit
compound statement to prepare for its extraction into a helper function
("x86/passthrough: Extract pt_irq_dpci_setup() from
pt_irq_create_bind()")=2E Reflow the two comments inside the block that no
longer fit in 80 columns at the increased indentation, and fix an
unbalanced parenthesis in the second one=2E No functional change=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v5:
- Fixed two comments to fit 80-columns (and fixed unbalanced-parenthesis
  in comment)
- Commit message now names the follow-up patch correctly=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 xen/drivers/passthrough/x86/hvm=2Ec | 81 ++++++++++++++++---------------
 1 file changed, 42 insertions(+), 39 deletions(-)

diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrough=
/x86/hvm=2Ec
index b73bb55055=2E=2E1d5b1fb0f8 100644
--- a/xen/drivers/passthrough/x86/hvm=2Ec
+++ b/xen/drivers/passthrough/x86/hvm=2Ec
@@ -229,52 +229,55 @@ int pt_irq_create_bind(
         return -EINVAL;
=20
  restart:
-    write_lock(&d->event_lock);
-
-    hvm_irq_dpci =3D domain_get_irq_dpci(d);
-    if ( !hvm_irq_dpci && !is_hardware_domain(d) )
     {
-        unsigned int i;
+        write_lock(&d->event_lock);
=20
-        /*
-         * NB: the hardware domain doesn't use a hvm_irq_dpci struct beca=
use
-         * it's only allowed to identity map GSIs, and so the data contai=
ned in
-         * that struct (used to map guest GSIs into machine GSIs and perf=
orm
-         * interrupt routing) is completely useless to it=2E
-         */
-        hvm_irq_dpci =3D xzalloc(struct hvm_irq_dpci);
-        if ( hvm_irq_dpci =3D=3D NULL )
+        hvm_irq_dpci =3D domain_get_irq_dpci(d);
+        if ( !hvm_irq_dpci && !is_hardware_domain(d) )
+        {
+            unsigned int i;
+
+            /*
+             * NB: the hardware domain doesn't use a hvm_irq_dpci struct
+             * because it's only allowed to identity map GSIs, and so the
+             * data contained in that struct (used to map guest GSIs into
+             * machine GSIs and perform interrupt routing) is completely
+             * useless to it=2E
+             */
+            hvm_irq_dpci =3D xzalloc(struct hvm_irq_dpci);
+            if ( hvm_irq_dpci =3D=3D NULL )
+            {
+                write_unlock(&d->event_lock);
+                return -ENOMEM;
+            }
+            for ( i =3D 0; i < NR_HVM_DOMU_IRQS; i++ )
+                INIT_LIST_HEAD(&hvm_irq_dpci->girq[i]);
+
+            hvm_domain_irq(d)->dpci =3D hvm_irq_dpci;
+        }
+
+        info =3D pirq_get_info(d, pirq);
+        if ( !info )
         {
             write_unlock(&d->event_lock);
             return -ENOMEM;
         }
-        for ( i =3D 0; i < NR_HVM_DOMU_IRQS; i++ )
-            INIT_LIST_HEAD(&hvm_irq_dpci->girq[i]);
-
-        hvm_domain_irq(d)->dpci =3D hvm_irq_dpci;
-    }
-
-    info =3D pirq_get_info(d, pirq);
-    if ( !info )
-    {
-        write_unlock(&d->event_lock);
-        return -ENOMEM;
-    }
-    pirq_dpci =3D pirq_dpci(info);
+        pirq_dpci =3D pirq_dpci(info);
=20
-    /*
-     * A crude 'while' loop with us dropping the spinlock and giving
-     * the softirq_dpci a chance to run=2E
-     * We MUST check for this condition as the softirq could be scheduled
-     * and hasn't run yet=2E Note that this code replaced tasklet_kill wh=
ich
-     * would have spun forever and would do the same thing (wait to flush=
 out
-     * outstanding hvm_dirq_assist calls=2E
-     */
-    if ( pt_pirq_softirq_active(pirq_dpci) )
-    {
-        write_unlock(&d->event_lock);
-        cpu_relax();
-        goto restart;
+        /*
+         * A crude 'while' loop with us dropping the spinlock and giving
+         * the softirq_dpci a chance to run=2E
+         * We MUST check for this condition as the softirq could be sched=
uled
+         * and hasn't run yet=2E Note that this code replaced tasklet_kil=
l
+         * which would have spun forever and would do the same thing (wai=
t
+         * to flush out outstanding hvm_dirq_assist calls)=2E
+         */
+        if ( pt_pirq_softirq_active(pirq_dpci) )
+        {
+            write_unlock(&d->event_lock);
+            cpu_relax();
+            goto restart;
+        }
     }
=20
     switch ( pt_irq_bind->irq_type )
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.35a5.d06bb82c97bcd973.1a0679ed066.5d48df588f90c8dd=---

