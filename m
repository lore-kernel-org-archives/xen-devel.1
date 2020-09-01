Return-Path: <SRS0=dV6x=CK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A72C28E83
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2020 11:10:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8975620BED
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2020 11:10:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="GQ4bl+wr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8975620BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD4BM-0000V5-ES; Tue, 01 Sep 2020 11:10:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6GQ=CK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kD4BL-0000V0-Hw
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 11:10:31 +0000
X-Inumbo-ID: 4f8af014-6b99-4e85-a7ce-13ac907af306
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f8af014-6b99-4e85-a7ce-13ac907af306;
 Tue, 01 Sep 2020 11:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598958630;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xbl0tO3O62NU+q755WRaWLPcMqqY4FwIQgueELOiOtE=;
 b=GQ4bl+wrbl1xbHPq+XvuY1cqZgXQC4Y0Of09qKaS8tsL8hGBQJaP1bC6
 Lc0lPK2miYsjJej1VsyKriEBsusGXoreGaq7ODV4jnMTMJ1BeAjha30BE
 F7lC6ivuq7B//JmORmwWCGc5Npulpk1MgFb79dTEude66zK4pSaooagVQ g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 46BlCzHvu8ROcAlelm6JaACVTOKRNjwGK1bvl7Jkh2tW9Dpwn5tC/+i5FJyAL4lHjvCh4+pvwH
 iAf4Kx2D9yTrjo1ClCIHmLxs/deIw763Np9u1VI81LkebAOFrdAVMfqpg33ouigu2eEzaTiuZT
 NUabbcfdkUmHYbYic2zuegKFm8g/woQhI+9RwTz2N7qhNCUnPRYRJN5Kh9ESOffndYcdnXiNeQ
 HT0k3+o1Uz8CpO3gYTa0Loa/wzBOFHY+dUdgh8Qb4W49h8EiYZ4rU6z3xYV8MAh7t7k1XbgoWm
 Bs8=
X-SBRS: 2.7
X-MesageID: 26679909
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,378,1592884800"; d="scan'208";a="26679909"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: [PATCH v3 0/8] x86: switch default MSR behavior
Date: Tue, 1 Sep 2020 12:54:37 +0200
Message-ID: <20200901105445.22277-1-roger.pau@citrix.com>
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

http://logs.test-lab.xenproject.org/osstest/logs/153391/

Thanks, Roger.

Andrew Cooper (2):
  x86/hvm: Disallow access to unknown MSRs
  x86/msr: Drop compatibility #GP handling in guest_{rd,wr}msr()

Roger Pau Monne (6):
  x86/vmx: handle writes to MISC_ENABLE MSR
  x86/svm: silently drop writes to SYSCFG and related MSRs
  x86/msr: explicitly handle AMD DE_CFG
  x86/svm: handle BU_CFG and BU_CFG2 with cases
  x86/pv: allow reading FEATURE_CONTROL MSR
  x86/pv: disallow access to unknown MSRs

 xen/arch/x86/hvm/svm/svm.c     | 59 +++++++++++++++++++---------
 xen/arch/x86/hvm/vmx/vmx.c     | 31 ++++++---------
 xen/arch/x86/msr.c             | 72 +++++++++++++---------------------
 xen/arch/x86/pv/emul-priv-op.c | 18 +++++----
 4 files changed, 89 insertions(+), 91 deletions(-)

-- 
2.28.0


