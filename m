Return-Path: <SRS0=BFXa=NH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FF1C4320A
	for <xen-devel@archiver.kernel.org>; Mon, 16 Aug 2021 11:20:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A16561CF3
	for <xen-devel@archiver.kernel.org>; Mon, 16 Aug 2021 11:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A16561CF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.167274.305310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFaeo-00036I-Qg; Mon, 16 Aug 2021 11:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167274.305310; Mon, 16 Aug 2021 11:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFaeo-00036B-NU; Mon, 16 Aug 2021 11:19:54 +0000
Received: by outflank-mailman (input) for mailman id 167274;
 Mon, 16 Aug 2021 11:19:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJmv=NH=citrix.com=Jane.Malalane@srs-us1.protection.inumbo.net>)
 id 1mFaen-00035f-H4
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 11:19:53 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e01af9f0-fe83-11eb-a455-12813bfff9fa;
 Mon, 16 Aug 2021 11:19:52 +0000 (UTC)
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
X-Inumbo-ID: e01af9f0-fe83-11eb-a455-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629112792;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eZGCsi9t1GABGryHezRKz32WbdimWXysSFPvtFDYCSE=;
  b=TikO7SPokLLpu/QhxOHDgDYek+fDoddWGnz71gkNmVulYPX4zALPE1cs
   s/BlN2Q2liVNcwQYpMtdwv5h1qc7sKzS+bEj0vMFj5v4moFurlLSEuEdT
   xWDO29ZOrCiuarsJSiFQUB6TVVR2ZLyJeZSZyN00YTHnI97kdRl+5Fx7O
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jDIadCDHANfFkp2+vmqpho2R7NyLPdQ9ETwrJku1Wi4H9F6yOUIxbfwbXN5IAXSEkqbNTVDHrT
 DhcMMy9TslGG4D7Q4HAAprJcwOm8Pq6uVn1NJbKB+vNZUm0RuJfdfNJtLrZKMBDvyYP5G3JBmI
 VhcjXHLMlLxUUnBh0AN/Kgt4mO4YKCDV6IBDfNhgQApQ4oF3ARmnZBnbRShD9OurzrEOkGkpqa
 gY7F7v6urugvOFShCbgfWbcUCFyOTiGTaxI6Rfv+Bh8oNQiSaoHIUo2yRlZQNbR2a4bFJ702md
 87GmHcNLp7IZQ7TRTwVQn/58
X-SBRS: 5.1
X-MesageID: 52241875
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:NyTIcqhgwymo1Fkgle9mYdOo3nBQXtYji2hC6mlwRA09TySZ//
 rBoB19726StN9xYgBFpTnuAsm9qB/nmaKdgrNhWItKPjOW21dARbsKheCJrgEIcxeOkNK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.84,324,1620705600"; 
   d="scan'208";a="52241875"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 0/2] xen/pv: Improvements to construct_dom0()
Date: Mon, 16 Aug 2021 12:19:25 +0100
Message-ID: <20210816111927.16913-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Jane Malalane (2):
  x86/pv: remove unnecessary use of goto out in construct_dom0()
  x86/pv: Provide more helpful error when CONFIG_PV32 is absent

 xen/arch/x86/pv/dom0_build.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

-- 
2.11.0


