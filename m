Return-Path: <SRS0=VfOS=5W=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA8FC2BA80
	for <xen-devel@archiver.kernel.org>; Mon,  6 Apr 2020 16:43:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADE8224990
	for <xen-devel@archiver.kernel.org>; Mon,  6 Apr 2020 16:43:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Fn6yir0x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADE8224990
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLUpx-00051k-Vn; Mon, 06 Apr 2020 16:43:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=06X9=5W=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jLUpx-00051f-BP
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 16:43:01 +0000
X-Inumbo-ID: ac08d493-7825-11ea-8009-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac08d493-7825-11ea-8009-12813bfff9fa;
 Mon, 06 Apr 2020 16:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586191380;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V0pcs+DTT828lXmv+zTuLlbM/UljVqclagyv2mraHC4=;
 b=Fn6yir0xdEDpKS/DIU2lK7ev/lErUvTaMstJrkMRZSv32u8kcMgBPIPN
 m1m8rF1cRhKpA13rzdsH+Ux6+cSCU4P2Cqnw7WgsdPvuVyBM7KTi/n7hS
 KyZUsfr+Vc14n5UG6LTFea8iKYqmqceBD6kxzgDo9AIiwkKF1e3nqCPqY M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GcdWCG7OfnvmLebgWzrPsAFm5ZmqvOKQ5DO+Eo4/ijuUCD7RxgrZCc3T+Sfol/kqgkVx7hPlMt
 KvzwoZ3n+mEu7vtQJaWDHZLCxDScLg1tGCiaUsRa4yOo9KskD2FFqsFp+QpVcIMh03y9S3gN/K
 o6ooAZVdlEAjGJPrYVvFhgqdtcYqP2vwKc9M1PGeakLa5vcJ6ID044Gap3v6zvuvTMxcCt02Nw
 mabpmtNqrOmOVJnZvJiuvpH6o1pXnQLOPuTNBisVZlXRFVkt6BIz1EbKyWrmVbHn+rOkz2eeDT
 AGY=
X-SBRS: 2.7
X-MesageID: 15654926
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,351,1580792400"; d="scan'208";a="15654926"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-5.0] xen-block: Fix uninitialized variable
Date: Mon, 6 Apr 2020 17:42:07 +0100
Message-ID: <20200406164207.1446817-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 Max Reitz <mreitz@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Since 7f5d9b206d1e ("object-add: don't create return value if
failed"), qmp_object_add() don't write any value in 'ret_data', thus
has random data. Then qobject_unref() fails and abort().

Fix by initialising 'ret_data' properly.

Fixes: 5f07c4d60d09 ("qapi: Flatten object-add")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/block/xen-block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 07bb32e22b51..99cb4c67cb09 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -860,7 +860,7 @@ static XenBlockIOThread *xen_block_iothread_create(const char *id,
     XenBlockIOThread *iothread = g_new(XenBlockIOThread, 1);
     Error *local_err = NULL;
     QDict *opts;
-    QObject *ret_data;
+    QObject *ret_data = NULL;
 
     iothread->id = g_strdup(id);
 
-- 
Anthony PERARD


