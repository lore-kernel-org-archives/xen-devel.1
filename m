Return-Path: <SRS0=1JDs=B6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9996AC433E8
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2020 15:09:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 651C1208C7
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2020 15:09:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Jp/jXHXB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 651C1208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8mBw-0003ll-Ue; Thu, 20 Aug 2020 15:09:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00F7=B6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8mBw-0003lg-84
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 15:09:24 +0000
X-Inumbo-ID: f1917742-2aa1-4be3-b516-971bce180aa2
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1917742-2aa1-4be3-b516-971bce180aa2;
 Thu, 20 Aug 2020 15:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597936162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wiZ0iNtUz8Uj2XL5L9742gj0111CrDtbYBS4ycUdLXU=;
 b=Jp/jXHXBlxWXvHNKBj9QNuACGladRnnHF16UfDByvOCpW73PL5EsWemK
 bSvxJGDpxvlEoKICMCzPom/sNQOiFpX2DfdXGRdDqi4pRE6ELu1xRbgUr
 jdHLmFKGdFiUaXqEKyGWSErkW+OwlksMSG+W45QVMGONSXvl4xkP88EDA s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: p9pcAjzD5bVOJg0JuvvvRjMFNP9gH4/sSZG4aWX5I96GaH3yKTkO9uroBENPArZdCHmIKTSo+0
 E1uBtMlcbW8a8WHRrWDlv3Qusb2yrFfC/DrqL9MuXv4IPNK2ozjGEDrXemBOci0mBtQTq80K4q
 67lwTiZcq0I+zsODlQTXffUb8RwqwfrNAuavxDTfH3pyyUK9L1Uj4NfxM/fP1IXw9yyiiq5Z+v
 /PQHucfZZi4q0J6RFi0QYxKEi2Tw/0qQifSlyQjUqOheg/bbKD43EMuw5ulRWgFnVkHhsO87VA
 +0U=
X-SBRS: 2.7
X-MesageID: 25266651
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,333,1592884800"; d="scan'208";a="25266651"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: [PATCH v2 0/8] x86: switch default MSR behavior
Date: Thu, 20 Aug 2020 17:08:27 +0200
Message-ID: <20200820150835.27440-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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

Hello,

The current series attempts to change the current MSR default handling
behavior, which is to silently drop writes to writable MSRs, and allow
reading any MSR not explicitly handled.

After this series access to MSRs not explicitly handled will trigger a
#GP fault. I've tested this series with osstest and it doesn't introduce
any regression, at least on the boxes selected for testing:

http://logs.test-lab.xenproject.org/osstest/logs/152630/

Thanks, Roger.

Andrew Cooper (2):
  x86/hvm: Disallow access to unknown MSRs
  x86/msr: Drop compatibility #GP handling in guest_{rd,wr}msr()

Roger Pau Monne (6):
  x86/vmx: handle writes to MISC_ENABLE MSR
  x86/svm: silently drop writes to SYSCFG and related MSRs
  x86/msr: explicitly handle AMD DE_CFG
  x86/svm: drop writes to BU_CFG on revF chips
  x86/pv: allow reading FEATURE_CONTROL MSR
  x86/pv: disallow access to unknown MSRs

 xen/arch/x86/hvm/svm/svm.c     | 38 ++++++++++++++----
 xen/arch/x86/hvm/vmx/vmx.c     | 31 ++++++---------
 xen/arch/x86/msr.c             | 71 +++++++++++++---------------------
 xen/arch/x86/pv/emul-priv-op.c | 18 +++++----
 4 files changed, 79 insertions(+), 79 deletions(-)

-- 
2.28.0


