Return-Path: <SRS0=Kfrc=CS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFE8C433E2
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2020 10:49:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D735521582
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2020 10:49:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="SDrS+2iP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D735521582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFxf2-0006Aa-6J; Wed, 09 Sep 2020 10:49:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M6/y=CS=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kFxf0-0006AV-PL
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 10:49:07 +0000
X-Inumbo-ID: 20136c82-9ac5-4024-a34b-244c5f63d6d1
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20136c82-9ac5-4024-a34b-244c5f63d6d1;
 Wed, 09 Sep 2020 10:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1599648544;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=1fYpIjG0AQfhCfBBZ+j3QuIlMk3+OpsKIKDdP2Leotk=;
 b=SDrS+2iP0QitIk7KCrjAz11WIlSTFnmj2YfeAQwIOp9Yb6oMpZpDNgSMvJmP53IyJ5
 Vey5Hi7x7T/YwVP9VYX0YFxB/deRT24QMu+taueJrGSoIoOVc0m1kpimEmI7XWoMosKK
 erJaSnKrkqHe3RpNhevEMgVAFkXvJnLxHoriQ6ll4S3kcrETtO8w6YQ0zC8PJDZUO9rN
 wSHP5rbZsR4tCh9rmTLuSIroMyeDyFA3YKmjvOsv2ZKjSPhGONmtojCQvY2xgcYEAEys
 uf6MZWeufQCvgoV7zCl+bbaaP1tiK1Sb+f++W+GRN9AjtlESZdYdItRtANBM3Fgc071K
 MznQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS32hIjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.7 SBL|AUTH)
 with ESMTPSA id 60ad29w89AmrLPI
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 9 Sep 2020 12:48:53 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v1] docs: remove bridge-utils from requirements
Date: Wed,  9 Sep 2020 12:48:49 +0200
Message-Id: <20200909104849.22700-1-olaf@aepfle.de>
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

Having the latest Xen, but an obsolete iproute package, is an unusual
combination.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 README | 1 -
 1 file changed, 1 deletion(-)

diff --git a/README b/README
index 0e4787c1a6..ce580d3029 100644
--- a/README
+++ b/README
@@ -57,7 +57,6 @@ provided by your OS distributor:
     * Development install of GLib v2.0 (e.g. libglib2.0-dev)
     * Development install of Pixman (e.g. libpixman-1-dev)
     * pkg-config
-    * bridge-utils package (/sbin/brctl)
     * iproute package (/sbin/ip)
     * GNU bison and GNU flex
     * GNU gettext

