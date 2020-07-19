Return-Path: <SRS0=IGTQ=A6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75549C433DF
	for <xen-devel@archiver.kernel.org>; Sun, 19 Jul 2020 00:34:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42561208B3
	for <xen-devel@archiver.kernel.org>; Sun, 19 Jul 2020 00:34:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JJAwQuBa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42561208B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwxGm-00010K-3X; Sun, 19 Jul 2020 00:33:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UExf=A6=infradead.org=rdunlap@srs-us1.protection.inumbo.net>)
 id 1jwxGj-00010F-Kn
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2020 00:33:30 +0000
X-Inumbo-ID: 756fb076-c957-11ea-8496-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 756fb076-c957-11ea-8496-bc764e2007e4;
 Sun, 19 Jul 2020 00:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=ejhbUXRyUGcuxfHilbyRZHXTEvE6s41ebx55gOa3sr4=; b=JJAwQuBaSok0dLnO98Bcgkor9C
 vO8HkSOx6ZPvOn2dOFVTiS7E/yFQrdon8KXfn+O7hZPYPgtzRYOynx4TltF5G58lKDBX0BhhmDFo9
 16ZcOjrcvXVq6Bctnmah5JiGWDpOm2Fau3FS2JFaefCHUaJPIZEw8a2eaWmyH7RX/4svnfUt/u8ER
 RR5HjemBftX0T/6hfbHxIwW3imWhK3BX+xdbKoh7qUKaHo40cpKY41HebV/MjKGf2B5SIoDSFHPog
 NTo1eDaNsnNjtapMe96euBDZgE8QujB2v0rKE07Mx4X3DhhkipZ4ktiThra3yb7FmZgToVztSWbTa
 MLsiEENg==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwxGb-0003C7-Oe; Sun, 19 Jul 2020 00:33:22 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] xen/gntdev: gntdev.h: drop a duplicated word
Date: Sat, 18 Jul 2020 17:33:17 -0700
Message-Id: <20200719003317.21454-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Randy Dunlap <rdunlap@infradead.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Drop the repeated word "of" in a comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
---
 include/uapi/xen/gntdev.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200717.orig/include/uapi/xen/gntdev.h
+++ linux-next-20200717/include/uapi/xen/gntdev.h
@@ -66,7 +66,7 @@ struct ioctl_gntdev_map_grant_ref {
 
 /*
  * Removes the grant references from the mapping table of an instance of
- * of gntdev. N.B. munmap() must be called on the relevant virtual address(es)
+ * gntdev. N.B. munmap() must be called on the relevant virtual address(es)
  * before this ioctl is called, or an error will result.
  */
 #define IOCTL_GNTDEV_UNMAP_GRANT_REF \

