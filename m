Return-Path: <SRS0=/9Q0=HT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92B3C433E9
	for <xen-devel@archiver.kernel.org>; Wed, 17 Feb 2021 16:43:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9284D64E28
	for <xen-devel@archiver.kernel.org>; Wed, 17 Feb 2021 16:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9284D64E28
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.86353.162102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPvA-0003d1-AA; Wed, 17 Feb 2021 16:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86353.162102; Wed, 17 Feb 2021 16:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPvA-0003cs-6S; Wed, 17 Feb 2021 16:43:24 +0000
Received: by outflank-mailman (input) for mailman id 86353;
 Wed, 17 Feb 2021 16:43:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n2sW=HT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lCPv8-0003Xr-Sd
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 16:43:22 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24364b36-9608-4611-8e6a-3e4b241f46c7;
 Wed, 17 Feb 2021 16:43:18 +0000 (UTC)
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
X-Inumbo-ID: 24364b36-9608-4611-8e6a-3e4b241f46c7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613580198;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=hQzng0cFb39JNB90gro8hw3unlKdNOE3YEmb8ba439E=;
  b=QJLXwOsWUIa9AobFGJhjSx1zue+wXXMmBDWFFIDjUA/sN4xoCf46L9dx
   lWN0zzkVvswtUDZKNPcipbZo7DYDFgp4U2WqNCkPVfqL3LwESegeSFgqE
   P5k93E9jq+E55vp3PATjE4ZSzZxICe7vt0Vs4otjaNW0eVIjK8v4ed281
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Vyes8em4VtOVJla2FF8K4DXvfh9SPL5ZsNLcAMvlFKEs4OWv9lEz4u7BaoUrapy20mw5RQCbzz
 3J+nk1QRYUCMA9c6dT/9N/rbDDS+h3DTzGGGGxJcKloshLuwLzF52gdAd8IOMMxkOwRI0tX9WJ
 XSUhe8zfqBb0+s+mBbL3IYun84sfgX3WFaRIL3zAFZIghhL2//Xn0AI9MVQSub3D5uMneKUe1V
 i7UeYeHRfEUCX69AhQTMj/v58hFncOa4ex61chF4/qU5FXUBbRrqK3juF/zQ4yHXy1VVZiONqD
 T2M=
X-SBRS: 5.1
X-MesageID: 37456609
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,184,1610427600"; 
   d="scan'208";a="37456609"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.15 0/3] tools/libxl: -Og fixes for libxl__domain_get_device_model_uid()
Date: Wed, 17 Feb 2021 16:42:48 +0000
Message-ID: <20210217164251.11005-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Split out of previous series, and split up for clarity.

Andrew Cooper (3):
  tools/libxl: Split out and err paths in libxl__domain_get_device_model_uid()
  tools/libxl: Simplfy the out path in libxl__domain_get_device_model_uid()
  tools/libxl: Rework invariants in libxl__domain_get_device_model_uid()

 tools/libs/light/libxl_dm.c | 58 ++++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 27 deletions(-)

-- 
2.11.0


