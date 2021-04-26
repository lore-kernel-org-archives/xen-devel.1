Return-Path: <SRS0=fknR=JX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CBCC433B4
	for <xen-devel@archiver.kernel.org>; Mon, 26 Apr 2021 17:55:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64F666101C
	for <xen-devel@archiver.kernel.org>; Mon, 26 Apr 2021 17:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64F666101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.117863.223812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb5Rb-0005nv-P8; Mon, 26 Apr 2021 17:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117863.223812; Mon, 26 Apr 2021 17:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb5Rb-0005nf-Ij; Mon, 26 Apr 2021 17:54:51 +0000
Received: by outflank-mailman (input) for mailman id 117863;
 Mon, 26 Apr 2021 17:54:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjXZ=JX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lb5RZ-0005es-LI
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 17:54:49 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2509d97-e291-4486-b22f-ee6565b601a7;
 Mon, 26 Apr 2021 17:54:47 +0000 (UTC)
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
X-Inumbo-ID: c2509d97-e291-4486-b22f-ee6565b601a7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619459687;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U+WoR/W6bembQjWIT6B8eKI+oOn2O6XV4PVMTKQwpn8=;
  b=eQukbDc4r6XsZd/L3AyEsjqpOYHo2/MX3L9ZFP78sj08Gx2rrLijE8nH
   /hmYau212b6t6XtLDCq+d4ryzb+BJ5WXApz5kM+l8wasaRXkwR7KBs+qj
   n1+O5/SF9R8svf7oLDbFCvazaRsmte8eoJX84s+AxsWbQUd3NbR75LbtW
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: iBVDQd1bj29weW1h2hyFJpLX+LSdPxMwZhebu2gV/b4NzPFZDILW+53yVsyIDPXEP5vDljUuIz
 8waaCfxSHBO4kx+JUjjz0tJJCeIM1B4nYLvu0DN4DWSOXxKNyceXO2g/SzOgTBgXjH/PuPHx2F
 zk1671X6cCQ/lJ8LN3/oi0/l0Hw/DyE8C+Am5kHS6xxvU+UcyZcxus1sjge/psEjiihQIBOcc7
 AHHHKRZX8e7oc4h0LydwmYBDlV73goNZUk6LzeSo0mE1JzknLY78sewhcDqGYA/aDChz542qbS
 2YI=
X-SBRS: 4.0
X-MesageID: 42818497
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:1B65kq3E0qULAibdA6WiVAqjBFYkLtp033Aq2lEZdDV+WKWj+f
 yGtvIdyBPylXItQ3kmg9+NI+2tRnnb+J5z7+AqTNCfdSPhv3alK5wn0Jv6z1TbaknD38NUyK
 sISchDIfLqC1wSt6rHyS2ZN/pl/9Wd6qCvgo7lvhJQZCVncbtp4Qs8KivzKDwUeCB8CZA0FI
 WR66N8zlLKExkqR/+2G2UfWKz7r8DL/aiWByIuPQIt6wWFkFqTiYLSLh7w5HgjegIK5b8j9G
 Tf+jaJhJmejw==
X-IronPort-AV: E=Sophos;i="5.82,252,1613451600"; 
   d="scan'208";a="42818497"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 0/3] x86: Initial pieces for guest CET support
Date: Mon, 26 Apr 2021 18:54:18 +0100
Message-ID: <20210426175421.30497-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Some initial pieces for guest support.  Everything will currently malfunction
for VMs which explicitly opt in to CET_SS/IBT.

Still TODO as a minimum:
 * Teach the pagewalk logic about shadow stack accesses and errors.
 * Emulator support for the new instructions.  WRUSS is an irritating corner
   case, requiring a change to how we express pagewalk inputs, as
   user/supervisor is no longer dependent on CPL.
 * Context switching of U/S_CET state.  Recommended way is with XSAVES, except
   the S_CET has broken sematics - it ends up as a mix of host and guest
   state, and isn't safe to XRSTOR without editing what the CPU wrote out.

The above ought to suffice for getting some XTF testing in place.  For general
guest support:
 * In-guest XSAVES support.  Windows is the only OS to support CET at the time
   of writing, and it cross-checks for XSAVES.  Linux expected to perform the
   same cross-check in due course.

Stretch features (not for initial support):
  * Adding EPT/NPT Supervisor Shadow Stack protections into mem_access, so
    introspection can block aliasing attacks.

Andrew Cooper (3):
  x86/hvm: Introduce experimental guest CET support
  x86/svm: Enumeration for CET
  x86/VT-x: Enumeration for CET

 xen/arch/x86/hvm/hvm.c                      | 18 ++++++++++++++++--
 xen/arch/x86/hvm/svm/svm.c                  |  1 +
 xen/arch/x86/hvm/svm/svmdebug.c             |  2 ++
 xen/arch/x86/hvm/vmx/vmcs.c                 |  6 ++++++
 xen/include/asm-x86/hvm/svm/svm.h           |  2 ++
 xen/include/asm-x86/hvm/svm/vmcb.h          | 10 ++++++++--
 xen/include/asm-x86/hvm/vmx/vmcs.h          | 11 ++++++++++-
 xen/include/public/arch-x86/cpufeatureset.h |  4 ++--
 8 files changed, 47 insertions(+), 7 deletions(-)

-- 
2.11.0


