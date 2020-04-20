Return-Path: <SRS0=l84g=6E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA25C54FCB
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2020 14:59:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFE35206F9
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2020 14:59:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Ue1dlznV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFE35206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQXtX-0000lt-IX; Mon, 20 Apr 2020 14:59:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQXtV-0000l9-DK
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 14:59:33 +0000
X-Inumbo-ID: 844a295e-8317-11ea-9e09-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 844a295e-8317-11ea-9e09-bc764e2007e4;
 Mon, 20 Apr 2020 14:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587394762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=edN7GW+FnWgdsna6bvvtPwReexh/+W7WgLmlAa4mlw8=;
 b=Ue1dlznVoAYdzgbKWaF0he6kpwx7SkC3z21jZPSGdnbAOaBRF4T5jVqz
 koUn9ejgXrYkSpRFdTh1ReSOHu2HbetQjx0KnxyELIxb1eYchTdkV/EH5
 zmOfv7ZcHaK5wUeWHMyhryz1673/oYFLXi+DmKDT/do1IGfcXUN29tRkL I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: h3SeV2TztS/EzUEhUx5OovT21RrHn+t17pyPaUkw0kN5AS/64lkQOghl6rXnGNwiEdZPhZjAmp
 g5OPIYZ4SIQrgpL0ikYgp/3aENhB6fi9gKiSrfGZC+WDBcuTqrF/NEuoj1eEEYVQPnlLUox8C8
 OqFZRUQtX/8dpotfHbtncvgLUZYaIWevg8Q5pud68Ba2iGrD28Xs7ZiWUsUIgW1nNCA0tCxoxV
 Qvex6RkThDdcWbZNqPidFIqWv62Hvzu5uOBNAd1oM0jp3ugKn+O7wdRQgQUsWuTsBZRNcgmSMZ
 N/I=
X-SBRS: 2.7
X-MesageID: 16191905
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,406,1580792400"; d="scan'208";a="16191905"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 0/3] x86: IST cleanup
Date: Mon, 20 Apr 2020 15:59:08 +0100
Message-ID: <20200420145911.5708-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Various bits of cleanup for !CONFIG_PV builds.

Andrew Cooper (3):
  x86/S3: Use percpu_traps_init() rather than opencoding SYSCALL/SYSENTER restoration
  x86/boot: Don't enable EFER.SCE for !CONFIG_PV builds
  x86/pv: Don't use IST for NMI/#MC/#DB in !CONFIG_PV builds

 xen/arch/x86/acpi/suspend.c     | 25 ++-----------------------
 xen/arch/x86/boot/trampoline.S  |  4 ++--
 xen/arch/x86/cpu/common.c       |  8 +++++---
 xen/arch/x86/efi/efi-boot.h     |  3 ++-
 xen/arch/x86/hvm/vmx/vmx.c      |  4 ++++
 xen/arch/x86/x86_64/traps.c     | 19 ++++++-------------
 xen/include/asm-x86/processor.h | 12 +++++++++++-
 7 files changed, 32 insertions(+), 43 deletions(-)

-- 
2.11.0


