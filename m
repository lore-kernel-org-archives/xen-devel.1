Return-Path: <SRS0=LFwY=LW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E63C2B9F4
	for <xen-devel@archiver.kernel.org>; Mon, 28 Jun 2021 10:02:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84C246121E
	for <xen-devel@archiver.kernel.org>; Mon, 28 Jun 2021 10:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84C246121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.147772.272726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxo6D-0006Lv-6a; Mon, 28 Jun 2021 10:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147772.272726; Mon, 28 Jun 2021 10:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxo6D-0006Lo-2Z; Mon, 28 Jun 2021 10:02:41 +0000
Received: by outflank-mailman (input) for mailman id 147772;
 Mon, 28 Jun 2021 10:02:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPZa=LW=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lxo6B-0005wp-Gv
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 10:02:39 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef78c4ea-94b6-4a83-90a9-67fc60d55536;
 Mon, 28 Jun 2021 10:02:34 +0000 (UTC)
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
X-Inumbo-ID: ef78c4ea-94b6-4a83-90a9-67fc60d55536
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624874554;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UFTvpVdfNxrP+bv4AAuRgBxIwdYxDQVjcOfg33auNmM=;
  b=SPrxiYJ/2NRLD/c1MVWnAm0GakSn4oiEYTE8FPb5yiqv059TqXasGUX3
   lSBZiMlfzimG9HJmSK7hwNk9+HprKx2d/MbtIQRgTABRF0BcwUV8TnMQ8
   DtVfeIaI6aOUdayssaovIuRLCRZyAK1M1KdJfnfOMQNB36fSJ43j2BBa6
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4EIA5kcW1I6IqWbB+qeCtYNw3oo2Q9HJXNiY2CMTTgZnDDEBM/SV7FaV2HZJ+QYny5PXW8Mg9u
 80tq3JTLTo+MI3tw7fY9RxlYYOT8A1JuChY+OxJCMvv8bYnptTOpeJ6UR4BGSRjz6qR/1xSTKI
 K/T/Zg310ZGzxbnRaDtDFCVY5pUJpZnRuJ1qo72owudqVogHXZWQk9MeiSPZS8INyYbt+qkG+T
 fDWZuJZj83Gx1snThFk3/Mv3569pUL38t7Lb4JmIMn1FXoNP/2Z0h27C5kEUe7xpK9ipXhhrOf
 1YU=
X-SBRS: 5.1
X-MesageID: 46798714
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:UPF/eatQEQe/qgrHq7XYEzf+7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpHnJYVcqKQkdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyIMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.83,305,1616472000"; 
   d="scan'208";a="46798714"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 2/2] libxl: Fix QEMU cmdline for scsi device
Date: Mon, 28 Jun 2021 11:01:57 +0100
Message-ID: <20210628100157.5010-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210628100157.5010-1-anthony.perard@citrix.com>
References: <20210628100157.5010-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Usage of 'scsi-disk' device is deprecated and removed from QEMU,
instead we need to use 'scsi-hd' for hard drives.
See QEMU 879be3af49 (hw/scsi: remove 'scsi-disk' device)

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 7670e403a90f..dbd3c7f278f9 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1972,7 +1972,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                                                         &drive_id),
                     flexarray_vappend(dm_args,
                         "-drive", drive,
-                        "-device", GCSPRINTF("scsi-disk,drive=%s,scsi-id=%d",
+                        "-device", GCSPRINTF("scsi-hd,drive=%s,scsi-id=%d",
                                              drive_id, disk),
                         NULL);
                     continue;
-- 
Anthony PERARD


