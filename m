Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FDEE99071
	for <xen-devel@archiver.kernel.org>; Fri, 10 Apr 2026 10:09:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1278637.1563401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8np-0006gh-LI; Fri, 10 Apr 2026 10:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278637.1563401; Fri, 10 Apr 2026 10:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8np-0006ga-IQ; Fri, 10 Apr 2026 10:09:29 +0000
Received: by outflank-mailman (input) for mailman id 1278637;
 Fri, 10 Apr 2026 10:09:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d8cc55.v1-57e3b21e68b746dea0983682dfb4ce71@bounce.vates.tech>)
 id 1wB8no-0006gM-1d
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 10:09:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB8nn-00CX8f-CM
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:09:27 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d8cc55.v1-57e3b21e68b746dea0983682dfb4ce71@bounce.vates.tech>)
 id 69d8cc4a-5cb7-0a2a0a5109dd-0a2a4506d2aa-12
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:09:27 +0200
Received: from [198.2.187.1] (helo=mail187-1.suw11.mandrillapp.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d8cc55.v1-57e3b21e68b746dea0983682dfb4ce71@bounce.vates.tech>)
 id 69d8cc56-0df0-0a2a45060019-c602bb014028-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:09:27 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-1.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4fsXb93mt8zBsTy7b
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 10:09:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 57e3b21e68b746dea0983682dfb4ce71; Fri, 10 Apr 2026 10:09:25 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1775815765; x=1776085765;
	bh=kX9OrGYxdeKETyoInb6c8nVi60+Bkczuz40aX8nsNxw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=jW/774AQlEnpr/zmbDT/FiHmtZOCphtfXDEtEgA2+cLux61InUw2kX8oWHfCEtymA
	 Zl6eu1IKZzzXMJwzwcnJ1EN1gkbHtG3a/QY+fWetKivc+uX3NxMdO02377gaXV0DzQ
	 Z0HV4Id84mZNWpFiCj4ydJtEttV8nhM6F8YEd6VujttP+8Hkp3H0XPwqIi+t/QHgOd
	 I45NGrf/ghDPyJvTBaRh+w74o7Gka0Ml9fDYX+rXQhIlxOQeBUXPLtUG0Q9xAISu0F
	 hJgdRbazztS4NaELsLpkjL/kdf0egO7PGAbI5S/Kiyb4CrNmgKahQKIM9HisN2gi5M
	 MdtuQIb+djDVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775815765; x=1776076265; i=teddy.astie@vates.tech;
	bh=kX9OrGYxdeKETyoInb6c8nVi60+Bkczuz40aX8nsNxw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=YHzdK3/k8X0Ob3H5zG0tn51qchfOrsINDiwez1e08JrgcPXrCOaWbsvwblqhkHQ3z
	 a9uB8R20hiVn6OazO2pslsxPf/afluYNlJ+AS8feSbfOCEyQw780bZNiDTjAvydk+w
	 by733MWIrD9pv7OSR3Bcvz/UviB6A38nynLkaVEX6XoFocIBLMmdWU0whEzg3koOga
	 AsYBv0Idel79UOCwRTAjY7IfTacjEPyV5lj0PD6T0QVtgHIAhz1qqc6iPMXGEdzAAS
	 Q7yw6LzQqQo5ukQVVDFis8ncLwsz4VciA7jCVEEkAFiT0b6ZcK8aZ/SIxKsYx20k/w
	 d3SSZuxibFGfA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=201/2]=20vtd:=20Drop=20dead=20check=20for=20permissions=20in=20lookup=5Fpage?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775815764539
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <815edfd0db90859a4ce270d833d9d721ff66e31c.1775814143.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.57e3b21e68b746dea0983682dfb4ce71?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260410:md
Date: Fri, 10 Apr 2026 10:09:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1775815767-5EF353D8-3686972D/0/0
X-purgate-type: clean
X-purgate-size: 1381

`val` comes from `addr_to_dma_page_maddr()` which is a pagetable
paddr and doesn't leak the PTE flags in it.

Rather than returning entries without any permissions, assume they
are always r/w.

Fixes: dd93d54fef0b2 ("vtd: add lookup_page method to iommu_ops")
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
This doesn't really matter since the lookup ops are not used currently
(and not implemented on the AMD side), hence it's not a problem in practice.
Perhaps we want to drop the function for the time being, and reintroduce it
when it gets useful ?

 xen/drivers/passthrough/vtd/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 3d6f787b3c..cf97469957 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2293,8 +2293,8 @@ static int cf_check intel_iommu_lookup_page(
         return -ENOENT;
 
     *mfn = maddr_to_mfn(val);
-    *flags = val & DMA_PTE_READ ? IOMMUF_readable : 0;
-    *flags |= val & DMA_PTE_WRITE ? IOMMUF_writable : 0;
+    /* TODO: Populate flags from pte */
+    *flags = IOMMUF_readable | IOMMUF_writable;
 
     return 0;
 }
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


