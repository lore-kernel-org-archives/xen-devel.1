Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CA0C9830E
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 11:55:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432142.1653646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9i2L-000205-3l; Thu, 24 Sep 2026 11:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432142.1653646; Thu, 24 Sep 2026 11:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9i2L-0001zy-0y; Thu, 24 Sep 2026 11:54:49 +0000
Received: by outflank-mailman (input) for mailman id 1432142;
 Thu, 24 Sep 2026 11:54:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@swg.vates.tech>)
 id 1x9i2J-0001zs-GT
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 11:54:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9i2I-006Fbl-Ds
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 13:54:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@swg.vates.tech>)
 id 6ab50f7f-2eae-0a2a0a5409dd-0a2a450baef2-16
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 13:54:46 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@swg.vates.tech>)
 id 6ab50f85-b7e8-0a2a450b0019-b9ff1c228301-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 13:54:46 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0d344933500072c4.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 24 Sep 2026 11:54:41 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 076E581BC9;
 Thu, 24 Sep 2026 13:54:41 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=9nmytw3SyN0uJE1H9g0dfnojus9AJSvcW73229Lph84=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=oo/96swOqlQtzUZVDwPZjyz3jiVjjnlxPB7JYyLuTd11LnnOWCt9Q4UhQkCS/3DHCVHxYvC4K
 cSe7acdTvnlxGA9viskcnLYSIY6YmdSvCFPYxeMrnHmsnbu6x94k4nJyH5M7klEnWVEYbICIIcl
 2hyuektzYA722Hhx4BCEAWOyA3NKXUnLtbrBEJyEwgkcKRnkA6qA9EeJiVEAX0x2KC1/W8dtq8v
 t/Mv8nG1mX7DKxsNaYBdWfSdn+UPfXcFtD7UO/ORyY8QKH9RSCjp3Pp1kcWqKSP3JA4CmcQ45Pl
 5scKkUpzjeGxpIgDioPrQOy8r+48NdloUDg3QMLbjUVQ==
X-Zone-Loop: 76d2d19d955bf664bd60fc2d2153dde482147a90a0a4
x-campaign-type: default
x-transaction-id: 9bdde316-c837-4c1c-9c14-959dfee3c746
x-swg-uid: 01-f81ed60b-c853-4883-a67e-62e78375b746
X-Mailer: Sweego
Message-ID:
 <1790250881.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@vates.tech>
x-swg-bid: 1790250881.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 0/3] vm_event: Fixes around MSR intercepts
Date: Thu, 24 Sep 2026 13:54:12 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3d4.e46ba96b59340f1b.1a0d34490a4.aa7cd6f9f9a4b691=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790250881188
X-purgate-ID: tlsNG-42698a/1790250886-A90CD9EA-17A2DA11/0/0
X-purgate-type: clean
X-purgate-size: 1341

---=Part.3d4.e46ba96b59340f1b.1a0d34490a4.aa7cd6f9f9a4b691=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fix Xen panics when trying to configure MSR intercepts in hypervisor range
(as hardware has no dedicated bitmap, since it's unconditionally intercept=
ed)=2E
(SVM all builds, and VMX debug builds)

Fix bogus monitored_msr() check in svm logic, which was checking for a
truncated MSR instead of the correct one=2E

Regarding intercepts in hypervisor range, I'm not sure if it would be pref=
erable
to move the check higher (i=2Ee in hvm_enable_msr_interception() to check =
if the
MSR is a hypervisor one, and if it is, to skip the architecture specific l=
ogic,
as it's not required at least on VMX/SVM)=2E

Teddy Astie (3):
  vm_event: svm: Don't BUG() when enabling intercept on hypervisor MSR
  vm_event: svm: Fix incorrect monitored_msr() check
  vm_event: vmx: Allow intercepting hypervisor MSRs in debug builds

 xen/arch/x86/hvm/svm/svm=2Ec  | 13 +++++++------
 xen/arch/x86/hvm/vmx/vmcs=2Ec |  2 +-
 2 files changed, 8 insertions(+), 7 deletions(-)

--=20
2=2E55=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.3d4.e46ba96b59340f1b.1a0d34490a4.aa7cd6f9f9a4b691=---

