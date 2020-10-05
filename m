Return-Path: <SRS0=LTrL=DM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A965C4363A
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2020 14:08:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13B88205F4
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2020 14:08:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="BCPD4g4c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13B88205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3014.8670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPRA7-0000iq-Sj; Mon, 05 Oct 2020 14:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3014.8670; Mon, 05 Oct 2020 14:08:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPRA7-0000ij-Pc; Mon, 05 Oct 2020 14:08:23 +0000
Received: by outflank-mailman (input) for mailman id 3014;
 Mon, 05 Oct 2020 14:08:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GPX8=DM=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kPRA6-0000ie-3B
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 14:08:22 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea56f40b-9f0c-44bd-9d56-752744813c9a;
 Mon, 05 Oct 2020 14:08:20 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kPRA3-0006f0-Pn; Mon, 05 Oct 2020 14:08:19 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kPRA3-0000wo-Eg; Mon, 05 Oct 2020 14:08:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GPX8=DM=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kPRA6-0000ie-3B
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 14:08:22 +0000
X-Inumbo-ID: ea56f40b-9f0c-44bd-9d56-752744813c9a
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ea56f40b-9f0c-44bd-9d56-752744813c9a;
	Mon, 05 Oct 2020 14:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=MOoi/fIdE/N1b0HiPhwIxwEbGENOEIvnmQORtzBPKrc=; b=BCPD4g4cob9Cr49spAg5r6k5S+
	fDlMTtR7YWLvs0I+MrP1Dt+h2r46m6VOLRoR5VrM8QoWKUj2UEe3uXhDgNx6i6yRfEg+Axu0utKaW
	bULpO1X59X9qN72gxS5nFOmofjVWlR2x9JfhcL5tzJgfNb/VfVx0acwUiiOxVmhIxn2A=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kPRA3-0006f0-Pn; Mon, 05 Oct 2020 14:08:19 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kPRA3-0000wo-Eg; Mon, 05 Oct 2020 14:08:19 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] ioreq: cope with server disappearing while I/O is pending
Date: Mon,  5 Oct 2020 15:08:17 +0100
Message-Id: <20201005140817.1339-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Currently, in the event of an ioreq server being destroyed while I/O is
pending in the attached emulator, it is possible that hvm_wait_for_io() will
dereference a pointer to a 'struct hvm_ioreq_vcpu' or the ioreq server's
shared page after it has been freed.
This will only occur if the emulator (which is necessarily running in a
service domain with some degree of privilege) does not complete pending I/O
during tear-down and is not directly exploitable by a guest domain.

This patch adds a call to get_pending_vcpu() into the condition of the
wait_on_xen_event_channel() macro to verify the continued existence of the
ioreq server. Should it disappear, the guest domain will be crashed.

NOTE: take the opportunity to modify the text on one gdprintk() for
      consistency with others.

Reported-by: Julien Grall <julien@xen.org>
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/ioreq.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 1cc27df87f..e8b97cd30c 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -115,6 +115,7 @@ bool hvm_io_pending(struct vcpu *v)
 
 static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
 {
+    struct vcpu *v = sv->vcpu;
     unsigned int prev_state = STATE_IOREQ_NONE;
     unsigned int state = p->state;
     uint64_t data = ~0;
@@ -132,7 +133,7 @@ static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
             gdprintk(XENLOG_ERR, "Weird HVM ioreq state transition %u -> %u\n",
                      prev_state, state);
             sv->pending = false;
-            domain_crash(sv->vcpu->domain);
+            domain_crash(v->domain);
             return false; /* bail */
         }
 
@@ -145,23 +146,36 @@ static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
 
         case STATE_IOREQ_READY:  /* IOREQ_{READY,INPROCESS} -> IORESP_READY */
         case STATE_IOREQ_INPROCESS:
-            wait_on_xen_event_channel(sv->ioreq_evtchn,
-                                      ({ state = p->state;
-                                         smp_rmb();
-                                         state != prev_state; }));
+            /*
+             * NOTE: The ioreq server may have been destroyed whilst the
+             *       vcpu was blocked so re-acquire the pointer to
+             *       hvm_ioreq_vcpu to check this condition.
+             */
+            wait_on_xen_event_channel(
+                sv->ioreq_evtchn,
+                ({ sv = get_pending_vcpu(v, NULL);
+                   state = sv ? p->state : STATE_IOREQ_NONE;
+                   smp_rmb();
+                   state != prev_state; }));
+            if ( !sv )
+            {
+                gdprintk(XENLOG_ERR, "HVM ioreq server has disappeared\n");
+                domain_crash(v->domain);
+                return false; /* bail */
+            }
             continue;
 
         default:
-            gdprintk(XENLOG_ERR, "Weird HVM iorequest state %u\n", state);
+            gdprintk(XENLOG_ERR, "Weird HVM ioreq state %u\n", state);
             sv->pending = false;
-            domain_crash(sv->vcpu->domain);
+            domain_crash(v->domain);
             return false; /* bail */
         }
 
         break;
     }
 
-    p = &sv->vcpu->arch.hvm.hvm_io.io_req;
+    p = &v->arch.hvm.hvm_io.io_req;
     if ( hvm_ioreq_needs_completion(p) )
         p->data = data;
 
-- 
2.20.1


