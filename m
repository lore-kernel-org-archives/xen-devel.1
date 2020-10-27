Return-Path: <SRS0=J13s=EC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A8EC55179
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 14:12:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD8C32072D
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 14:12:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="WnLJiyel"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD8C32072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.12898.33367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXPhl-0005El-Us; Tue, 27 Oct 2020 14:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12898.33367; Tue, 27 Oct 2020 14:12:05 +0000
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
	id 1kXPhl-0005Ee-QK; Tue, 27 Oct 2020 14:12:05 +0000
Received: by outflank-mailman (input) for mailman id 12898;
 Tue, 27 Oct 2020 14:12:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OCGY=EC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kXPhl-0005EU-42
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 14:12:05 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59c09a57-d156-4a7a-a13c-46552d1189e0;
 Tue, 27 Oct 2020 14:12:03 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OCGY=EC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kXPhl-0005EU-42
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 14:12:05 +0000
X-Inumbo-ID: 59c09a57-d156-4a7a-a13c-46552d1189e0
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 59c09a57-d156-4a7a-a13c-46552d1189e0;
	Tue, 27 Oct 2020 14:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603807923;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aa/4vWnGY2t+XfGcpzdER28PO2XLmOedn3YHehVXRLo=;
  b=WnLJiyelaAFlMG5zIUJj/ySROi5HZB8MJJe3dwqecWJzzHEdQyYVmJeK
   qliwqVPAteBdeOgtkc+o0HblhhmXM+3vKog6bGLphu51RLAoreNyRIIb3
   bnTDa9FXkylPftTeHI251QRLXsRKxvtsJ4Yb+7Yvpot+w/gXvGteilIPX
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: v/+EfdVrloK5LeCEzi/Fv1PLsbcad73XHtmN4+2W+ispExyB9W5lmOK/e9gwkbVYN0GkAajM+l
 Wa8d54ST17aNpIswZLmcAQbVARFvwT6o6ROdZhHm3523vEiAUPEim8t7QxO7QA1G1eeksmYt5u
 7JpNKWXKeh7rJrUJQx6tX8m2pyB4cWwOCCJB1U4flrvrUqqLUw1pqoRD+LltDwNmmkNgsbqpZv
 FUEWgLE4Jrs+L8xoEWA95NLkALP2n0Kr0lYElvdvhIyhRr1QFrnrNRJkuUuLCsCRI7cY+SnIzq
 008=
X-SBRS: None
X-MesageID: 29875501
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,424,1596513600"; 
   d="scan'208";a="29875501"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/2] x86/pv: Alternative XSA-286 fix
Date: Tue, 27 Oct 2020 14:10:35 +0000
Message-ID: <20201027141037.27357-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Alternative XSA-286 fix, with far less of a performance hit.

v3:
 * Split into two patches, to try and make the TLB flushing in do_mmu_update()
   a tractable problem to solve.

Andrew Cooper (2):
  x86/pv: Drop FLUSH_TLB_GLOBAL in do_mmu_update() for XPTI
  x86/pv: Flush TLB in response to paging structure changes

 xen/arch/x86/mm.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 10 deletions(-)

-- 
2.11.0


