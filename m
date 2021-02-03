Return-Path: <SRS0=08Yz=HF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279E8C433E6
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 17:36:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3D0C64F84
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 17:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3D0C64F84
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.80999.148818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7M4e-00006x-DL; Wed, 03 Feb 2021 17:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80999.148818; Wed, 03 Feb 2021 17:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7M4e-00006k-97; Wed, 03 Feb 2021 17:36:16 +0000
Received: by outflank-mailman (input) for mailman id 80999;
 Wed, 03 Feb 2021 17:36:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0lb=HF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7M4c-0008Tu-G1
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:36:14 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0a5488c-c076-4082-9369-f2956828899f;
 Wed, 03 Feb 2021 17:36:09 +0000 (UTC)
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
X-Inumbo-ID: a0a5488c-c076-4082-9369-f2956828899f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612373769;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iWbegkhTjcNGUgdqrYfEshcnIaVsgGnEz2AcHo7KIcY=;
  b=dKnUUku5tD558XMnKtqYFR/yWgpORCxlgd5cmicMt+a2WacXzsdJ8VnZ
   BT4xDcMSqulSCtfoFSSJx8OE4sZCONk0j2S5LF5Dt3CFBcPMN0txFJHAd
   ncqyUHU34UymYQB5kspHkLEEs+AKvJ/dqPtyJgJMxp52P13SGdFnaXOCL
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: r32Bzh2LpWWAZ/gaiDa31aRZLbOBH++7daewSEVhnMNKhqNahmiNye6xlvnoCzRBknZer2IpQK
 hcEK48uQm3BS4Nm9eainJwLBP3PCkmiQZBBkQXkcqBxo0pvgXMfPsy4+bQD1J1u9O+VLVc3xNJ
 Lz0HbvjqamrM68n9AaDdEPjjcST734fxuVLmW0oPdX0kz0nhnm2D1IEviqPIfiBUUsWsKogXK6
 BaU8/gv0lE2n8i6XAY5gDPAvEItv5YW5KXaEgYQRrb9/uP2arfCfe6r4cm0iUlNaRRUYpwRfuX
 DSo=
X-SBRS: 4.0
X-MesageID: 36863743
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,399,1602561600"; 
   d="scan'208";a="36863743"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH for-4.15 0/3] tools/oxenstored bugfixes
Date: Wed, 3 Feb 2021 17:35:46 +0000
Message-ID: <20210203173549.21159-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All of these been posted before, but were tangled in other content which is
not appropriate for 4.15 any more.  As a consequence, I didn't get around to
committing them before the code freeze.

They were all found with unit testing, specifically fuzzing the
serialising/deserialising logic introduced for restartiblity, asserting that
the tree before and after was identical.

The unit testing/fuzzing content isn't suitable for 4.15, but these bugfixes
want backporting to all releases, and should therefore be considered for 4.15
at this point.

Edwin Török (3):
  tools/oxenstored: Fix quota calculation for mkdir EEXIST
  tools/oxenstored: Reject invalid watch paths early
  tools/oxenstored: mkdir conflicts were sometimes missed

 tools/ocaml/xenstored/connection.ml  | 5 ++---
 tools/ocaml/xenstored/connections.ml | 4 +++-
 tools/ocaml/xenstored/store.ml       | 1 +
 tools/ocaml/xenstored/transaction.ml | 2 +-
 4 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.11.0


