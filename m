Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA72EC624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:14:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407257.1640354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28Cy-0005ik-VA; Thu, 03 Sep 2026 14:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407257.1640354; Thu, 03 Sep 2026 14:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28Cy-0005iZ-SB; Thu, 03 Sep 2026 14:14:28 +0000
Received: by outflank-mailman (input) for mailman id 1407257;
 Thu, 03 Sep 2026 14:14:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed358000c4f3@swg.vates.tech>)
 id 1x28Cx-0005UD-JW
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:14:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28Cx-006VeY-05
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:14:27 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed358000c4f3@swg.vates.tech>)
 id 6a9980a0-bab6-0a2a0a5309dd-0a2a4506deb4-44
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:26 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed358000c4f3@swg.vates.tech>)
 id 6a9980c0-195a-0a2a45060019-b9ff1c238775-4
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:26 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0679ed358000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 03 Sep 2026 14:14:17 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8310284007;
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
 q=dns/txt; s=selector1; bh=h3ZP4W9g2bPX9SP7yYh6igBoYL0cy5yX8xSLc9mKgjs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=pc3tqOqL+2ALS7GtUGitfMGPn+lgB2hMuVe0+XIbMQ0eQ+8xYp193La6bSgmV+qWDHt5GGsT8
 rTqckfJXiYK1wdRdcK3488NORCO3E0og2JLHKmIEOGp++O/IAjw9fLUhfmgmGdukiT8fGi6zOYM
 Xxf0ONj8AVCKWstPgpzn5GuuqTUcQsUsZU3GvD5rfth6ZFsDCrz1Jb5E4HOPwCEzFSnH0VyONTO
 ewzMjyn4vyS5UgScTIfSpIcMAb1+DHhtz7swEQRfMiA7izC/zmCaOpPU4Od8zprkY4SjAPoDIM6
 fzGLNTd0CkaHStc5fCiXFDhjXBHO7EUtKpu+gSL5MLcA==
X-Zone-Loop: f15ddafbb473f4cd2d2f3b01ccba6975d4de71124084
x-campaign-type: default
x-transaction-id: 306bf369-c149-4751-98d5-927e2ae20227
x-swg-uid: 01-f1e1b78d-ce97-44a8-9869-e35e8147fb31
X-Mailer: Sweego
Message-ID:
 <1788444857.8631fc262581453bbf619ec5b2062170.1a0679ed358000c4f3@vates.tech>
x-swg-bid: 1788444857.8631fc262581453bbf619ec5b2062170.1a0679ed358000c4f3
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
Subject: [PATCH v5 03/11] x86/passthrough: Replace pt_irq_create_bind() goto restart with a loop
Date: Thu,  3 Sep 2026 16:14:01 +0200
In-Reply-To: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
References: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.35a6.f864c585202bbc2b.1a0679ed1a8.584221bc86a559c0=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788444856744
X-purgate-ID: tlsNG-16d1c6/1788444866-F607177B-E1B4D181/0/0
X-purgate-type: clean
X-purgate-size: 1883

---=Part.35a6.f864c585202bbc2b.1a0679ed1a8.584221bc86a559c0=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Change "goto restart" retry in pt_irq_create_bind() into a "for ( ; ;)"
loop with continue/break, so that the following patch extracting the
block into a helper is only a code move without a label crossing a
function boundary=2E No functional change=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v5:
- New patch, split out of v4's "Extract pt_irq_dpci_setup()"=2E It only
  converts the "goto restart" retry into a "for ( ; ; )" loop, so the
  following commit's extraction is only a code move with no label
  crossing a function boundary=2E
- Use "for ( ; ; )" rather than v4's "do { } while ( true )"=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 xen/drivers/passthrough/x86/hvm=2Ec | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrough=
/x86/hvm=2Ec
index 1d5b1fb0f8=2E=2Ea74521fb57 100644
--- a/xen/drivers/passthrough/x86/hvm=2Ec
+++ b/xen/drivers/passthrough/x86/hvm=2Ec
@@ -228,7 +228,7 @@ int pt_irq_create_bind(
     if ( pirq < 0 || pirq >=3D d->nr_pirqs )
         return -EINVAL;
=20
- restart:
+    for ( ; ; )
     {
         write_lock(&d->event_lock);
=20
@@ -276,8 +276,10 @@ int pt_irq_create_bind(
         {
             write_unlock(&d->event_lock);
             cpu_relax();
-            goto restart;
+            continue;
         }
+
+        break;
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
---=Part.35a6.f864c585202bbc2b.1a0679ed1a8.584221bc86a559c0=---

