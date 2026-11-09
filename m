Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDCA606A323
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 05:55:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1479507.1683454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQILI-0008GG-HD; Mon, 09 Nov 2026 05:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479507.1683454; Mon, 09 Nov 2026 05:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQILI-0008G9-CO; Mon, 09 Nov 2026 05:54:56 +0000
Received: by outflank-mailman (input) for mailman id 1479507;
 Mon, 09 Nov 2026 04:41:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mam47@cmpt.sfu.ca>) id 1xQHBw-0006OV-BH
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 04:41:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQHBv-0081dx-EG
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 05:41:11 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mam47@cmpt.sfu.ca>)
 id 6af14ece-8faa-0a2a0a5109dd-0a2a450bdab4-16
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 05:41:11 +0100
Received: from [142.58.10.48] (helo=cs-arch-srv04.cmpt.sfu.ca)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mam47@cmpt.sfu.ca>)
 id 6af14ee5-b7e8-0a2a450b0019-8e3a0a30811c-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 05:41:10 +0100
Received: by cs-arch-srv04.cmpt.sfu.ca (Postfix, from userid 662374)
 id 7F21B5A000D; Sun,  8 Nov 2026 20:41:08 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Mahmoud Abumandour <mam47@sfu.ca>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH] x86/nestedhvm: don't give L2 instructions L1 did not enable
Date: Sun,  8 Nov 2026 20:41:06 -0800
Message-Id: <20261109044106.2830619-1-mam47@sfu.ca>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1794199270-1BCD79EA-E51C3D32/0/0
X-purgate-type: clean
X-purgate-size: 1470
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mahmoud Abumandour <ma.mandourr@gmail.com>

nvmx_update_secondary_exec_control() ORs Xen's own secondary controls
for L1 into those L2 runs with, among them "enable RDTSCP", "enable
INVPCID" and "enable XSAVES", which L1 is not offered. L2 then executes
these instructions where L1's VMCS makes them raise #UD, and when L1 sets
"INVLPG exiting", L2's INVPCID exits with reason 58, which
nvmx_n2_vmexit_handler() does not handle. Xen crashes L1's domain.

Fixes: 729186073765 ("Nested VMX: Extend VMCS control fields for n2 guest")
Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>
---
 xen/arch/x86/hvm/vmx/vvmx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 29e48387a1..79f5c00ba6 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -650,6 +650,13 @@ void nvmx_update_secondary_exec_control(struct vcpu *v,
 
     host_cntrl &= ~apicv_bit;
     host_cntrl &= ~SECONDARY_EXEC_ENABLE_VMCS_SHADOWING;
+    /*
+     * Whether L2 may execute RDTSCP, INVPCID and XSAVES is L1's choice. L2
+     * gets #UD as on hardware.
+     */
+    host_cntrl &= ~(SECONDARY_EXEC_ENABLE_RDTSCP |
+                    SECONDARY_EXEC_ENABLE_INVPCID |
+                    SECONDARY_EXEC_XSAVES);
     shadow_cntrl = get_vvmcs(v, SECONDARY_VM_EXEC_CONTROL);
 
     /* No vAPIC-v support, so it shouldn't be set in vmcs12. */
-- 
2.25.1


