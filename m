Return-Path: <SRS0=FDQh=L6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8946DC07E9C
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 11:24:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ED4E61E04
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 11:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ED4E61E04
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.151118.279314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jB2-00050f-9s; Tue, 06 Jul 2021 11:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151118.279314; Tue, 06 Jul 2021 11:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jB2-00050Y-4j; Tue, 06 Jul 2021 11:23:44 +0000
Received: by outflank-mailman (input) for mailman id 151118;
 Tue, 06 Jul 2021 11:23:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rBn=L6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0jB0-00050M-Cy
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 11:23:42 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a4cc33c-4b80-4dc0-affa-8b563e0cf091;
 Tue, 06 Jul 2021 11:23:41 +0000 (UTC)
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
X-Inumbo-ID: 8a4cc33c-4b80-4dc0-affa-8b563e0cf091
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625570621;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=QsH0+y6D6qV1Pp7qa0sdDbIpnq4xmX2j2Z45+j/tNi0=;
  b=HOjttrgxJyCBWvyHeW9h2BvnXp1Om7eHnsUY+XszKI5g9Z+Ruyp/lYEn
   ZQdK0AcA6C8jKGcxv/sx3hVI3hlK7CGohrJ7eiALQyO+hwX5XRqjut5Yy
   JGJq5tdcReYDV7LhoCQxO8R+Fu62c/A/xlGk2BVGQd6G8aBtwiQCe7gGv
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: WerrGfCHoSw3WHlnGEfpRYbYCVrCO9MazVUHRd3jOfarxEYYq/ETqTF5XSbP4kzv8R2Pa90gqs
 uSCW/b7uAx98+VwGE9+TAhz58kDb4b/PT6SKVhhxLaoxAZkKNhoziph0PV3Qydfb1dQO5qCyyD
 UM+OMzSYTXYHeoJ4j02ZyfRKku1Oknr5sWZ/DwYpbo07fYvxXII5cBHruU6M+PhPLTJ+VTMchS
 KgybUEgS/9V8TC2farg5SWxd1ADpvqBUl3cmHTtpXSPpjnvYy7IwsfHH4AuKSKlQDtHx0QZpbV
 Sss=
X-SBRS: 5.1
X-MesageID: 47339750
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:f0JsCa7IbW+wiKT74gPXwN7XdLJyesId70hD6qhwISY6TiX4rb
 HIoB1173/JYVoqNE3I+urwXJVoI0mslqKdiLN5VdzJMTUO0FHYSb2KhrGC/9SPIULDH5ZmpM
 VdT5Q=
X-IronPort-AV: E=Sophos;i="5.83,328,1616472000"; 
   d="scan'208";a="47339750"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Jan Beulich <JBeulich@suse.com>, Olaf Hering <olaf@aepfle.de>
Subject: [PATCH 0/2] tools/migration: Fixes in send_checkpoint_dirty_pfn_list()
Date: Tue, 6 Jul 2021 12:23:30 +0100
Message-ID: <20210706112332.31753-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

These are a prerequisite to all currently on-list patches touching the
function.

Andrew Cooper (2):
  tools/migration: Fix iovec handling in send_checkpoint_dirty_pfn_list()
  tools/migration: Fix potential overflow in send_checkpoint_dirty_pfn_list()

 tools/libs/guest/xg_sr_restore.c | 48 ++++++++++++++--------------------------
 1 file changed, 17 insertions(+), 31 deletions(-)

-- 
2.11.0


