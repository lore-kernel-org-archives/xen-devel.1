Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63C4F3C248
	for <xen-devel@archiver.kernel.org>; Mon,  9 Mar 2026 12:31:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1249405.1546863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZlM-0005S9-DL; Mon, 09 Mar 2026 12:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249405.1546863; Mon, 09 Mar 2026 12:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZlM-0005S2-A1; Mon, 09 Mar 2026 12:31:08 +0000
Received: by outflank-mailman (input) for mailman id 1249405;
 Mon, 09 Mar 2026 12:31:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XX/Q=BJ=bounce.vates.tech=bounce-md_30504962.69aebd86.v1-5eefd4314b3e45ecbcba532335bdac2c@srs-se1.protection.inumbo.net>)
 id 1vzZlK-0005Rg-C0
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 12:31:06 +0000
Received: from mail133-21.atl131.mandrillapp.com
 (mail133-21.atl131.mandrillapp.com [198.2.133.21])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d65fa84b-1bb3-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 13:31:04 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fTxFL73SNz1XLF70
 for <xen-devel@lists.xenproject.org>; Mon,  9 Mar 2026 12:31:02 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5eefd4314b3e45ecbcba532335bdac2c; Mon, 09 Mar 2026 12:31:02 +0000
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
X-Inumbo-ID: d65fa84b-1bb3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773059463; x=1773329463;
	bh=LPUSRZy9qbQfIjlYcjFoK4c3M47t8H8Qjn7lVPwxHIc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=IlK72gfVVI0bjEt0VlLAGDMNP0Ak+ZFY1zcNbV9VvcZpV0PDto5Sb8wQ9txK7om6d
	 Uu6jfuuqF/rM99GlgGJExbilrzM3L5DTRQ/0nFW6ADUilgB/jf8BDwPYT2wik8oan9
	 Qzaix2tre1Nwe5CjjfoF5qpvD6D9JAfSFaR4zNJ2LXScWjvGi5j/ghveRVNQbEx5VY
	 XU8BQ5pgZ9/9YxO6ERNWKRUJ8vJ3D/SxRFxLnQBFIOQQHkYKNLbKFL9FCCWo9xRjs2
	 MxSxO5mc+cXAZa5eG40cFias3JOxA98rYEo1Ky3Wy4ohDeX5mLTKUSTpGwYop+QKiY
	 fg6OwyOEtQWgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773059463; x=1773319963; i=julian.vetter@vates.tech;
	bh=LPUSRZy9qbQfIjlYcjFoK4c3M47t8H8Qjn7lVPwxHIc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=t7VofPXt+WCaTpPamHs+teK68iMvC1j5UYKHBUnZOo65YBWj5wLgE0Wyj+srdDxIq
	 WrKJiwRUv48qHBMgE7Vzmq/F2v34yAh9UmMK4F7yg8GyJexWoop44ud2W18JZDVD3c
	 AsGL1Sc+0920gsHYq2BEClHipC0lod0cn+VSjT4bSXLLUb3zf+f9ICbCc2I6J6rGB9
	 0GJP2wkqFNJm38YjeYF19mT770BRjPbPdL0G1lXNbFjwiR+Xbk9mpcZM1vlx1PAXo5
	 RP38njTYdJIdu17BW8Sj/XODekSh16Vn51JBt0dVnrLSPnIJYP8vVw59VTGTd8dO4O
	 ZWNuQBmKszp5g==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3=201/7]=20x86/vioapic:=20Add=20ioapic=5Fcheck()=20to=20validate=20IO-APIC=20state=20before=20restore?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773059461627
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, "Julien Grall" <julien@xen.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260309123055.880050-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5eefd4314b3e45ecbcba532335bdac2c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260309:md
Date: Mon, 09 Mar 2026 12:31:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Register a check callback for the IOAPIC HVM save/restore entry,
following the pattern established by vpic_check() for the virtual PIC.
The function first verifies the target domain actually has a virtual
IO-APIC, returning -ENODEV otherwise. It then iterates all redirection
table entries and rejects any saved state where reserved bit fields are
non-zero, ensuring the state being loaded, represents actually reachable
hardware state before the restore is committed.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in V3:
- As suggested by Jan, added new patch that does a generic check of the
  vIOAPIC state before migration
---
 xen/arch/x86/hvm/vioapic.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 7c725f9e47..b9acdd8af6 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -594,6 +594,35 @@ int vioapic_get_trigger_mode(const struct domain *d, unsigned int gsi)
     return vioapic->redirtbl[pin].fields.trig_mode;
 }
 
+static int cf_check ioapic_check(const struct domain *d, hvm_domain_context_t *h)
+{
+    const HVM_SAVE_TYPE(IOAPIC) *s;
+    unsigned int i;
+
+    if ( !has_vioapic(d) )
+        return -ENODEV;
+
+    s = hvm_get_entry(IOAPIC, h);
+    if ( !s )
+        return -ENODATA;
+
+    for ( i = 0; i < ARRAY_SIZE(s->redirtbl); i++ )
+    {
+        const union vioapic_redir_entry *e = &s->redirtbl[i];
+
+        /*
+         * Check to-be-loaded values are within valid range, for them to
+         * represent actually reachable state.
+         */
+        if ( e->fields.reserve ||
+             e->fields.reserved[0] || e->fields.reserved[1] ||
+             e->fields.reserved[2] || e->fields.reserved[3] )
+            return -EINVAL;
+    }
+
+    return 0;
+}
+
 static int cf_check ioapic_save(struct vcpu *v, hvm_domain_context_t *h)
 {
     const struct domain *d = v->domain;
-- 
2.51.0



--
 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


