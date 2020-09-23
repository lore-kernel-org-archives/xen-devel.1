Return-Path: <SRS0=1HVP=DA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A259CC4363D
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2020 06:49:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 068FD20739
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2020 06:49:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="Gbh1+8CD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 068FD20739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKyaF-0001tk-SJ; Wed, 23 Sep 2020 06:48:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9vII=DA=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kKyaE-0001tc-3U
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 06:48:54 +0000
X-Inumbo-ID: fb2612e8-393a-44ab-bd28-1aca5824a909
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.221])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb2612e8-393a-44ab-bd28-1aca5824a909;
 Wed, 23 Sep 2020 06:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600843730;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=70NQBtnCds9RVjZBOorsiSnh6sI7ia3Cj7jUZrUWUHQ=;
 b=Gbh1+8CDWECHDIujdc16vNW8uMpCVpkbfIBUGxfivSWFIdNsbJM/1JdK+GVztV9Q+i
 4Y4Pu/HoCKzJZce/v5FOeqlxk7mM7R7PR/GFk8N0gugW2B9NrL66xN+is5ScH1xRZTJI
 p6OhnwJHoUZDcbT5VLFZUl3vmy2LwlK2KzTSwK+JTBAnJK6RDnzDOYZEvBTkRdrmYQhV
 LTHqFWoFZ9IHdkvxUDqgqer+jW7rqxg/kTfzSkmVci9RpqadyJ97Senurd2h8hlFbnkO
 NUpfR78jiDPl5CSbSQpKSr0klQoBk9SbW8KR43DtK8Ix7Ujuq3dPHFf/PNCKvdM/vheE
 E7Rg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G5Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
 with ESMTPSA id 60ad29w8N6miGua
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 23 Sep 2020 08:48:44 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v1] tools/libxc: report malloc errors in writev_exact
Date: Wed, 23 Sep 2020 08:48:40 +0200
Message-Id: <20200923064840.13834-1-olaf@aepfle.de>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The caller of writev_exact should be notified about malloc errors
when dealing with partial writes.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---


I think this is a backport candidate...


 tools/libs/ctrl/xc_private.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
index 8af96b1b7e..3fab94f9c0 100644
--- a/tools/libs/ctrl/xc_private.c
+++ b/tools/libs/ctrl/xc_private.c
@@ -721,6 +721,7 @@ int writev_exact(int fd, const struct iovec *iov, int iovcnt)
                     if ( !local_iov )
                     {
                         saved_errno = ENOMEM;
+                        rc = -1;
                         goto out;
                     }
 

