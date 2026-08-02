Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0530BC55171
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:18:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380765.1624510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqW4k-0005ZC-Mm; Sun, 02 Aug 2026 13:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380765.1624510; Sun, 02 Aug 2026 13:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqW4k-0005Z5-In; Sun, 02 Aug 2026 13:17:58 +0000
Received: by outflank-mailman (input) for mailman id 1380765;
 Sun, 02 Aug 2026 13:17:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqW4j-0005S2-7S
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:17:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqW4i-004dxe-Kg
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:17:56 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f4339-e002-0a2a0a5209dd-0a2a45049482-46
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:17:56 +0200
Received: from [188.165.56.177] (helo=19.mo582.mail-out.ovh.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41df-b57f-0a2a45040019-bca538b1e9cd-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:55 +0200
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.231.29])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4hCgCy6f3Lz5yDC
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:54 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-zgxq6 (unknown [10.110.178.25])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id F0D1BC0F59;
 Sun,  2 Aug 2026 13:10:53 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.98])
 by ghost-submission-7d8d68f679-zgxq6 with ESMTPSA
 id uCqTMN1Bb2oVAxsAmLjjbA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:10:53 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ovhmo3617313-selector1 header.d=3mdeb.com header.i="@3mdeb.com" header.h=From
Authentication-Results:garm.ovh; auth=pass (GARM-98R002ead41966-a0ae-48e8-ac73-de1d09aa3230,
                    A7BD45287BC66A7121136900083CD01C39616B1D) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.215
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v4 23/23] MAINTAINERS: add a section for TrenchBoot Slaunch
Date: Sun,  2 Aug 2026 16:09:39 +0300
Message-ID: <f73cbcb2df9a00b8a281d8c75526e8a92213380e.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4746231058255652284
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTF70AoUNTuq0lE163/HHHmITb2k71K2uLoI2ZNhSgyl66wu8n/QJYzc+NLLaUb0uP1TrkyCR/9L8Ilu8caNGFiWNKPhk8LryKkv9xxZSrEN1zqyUGrQN6nXky3jMJxzdN9g/O0CtTLwNhHfleReQxYNqzRPBHWIFmbNp+cZCBU9E3JqDvY2G2n8Fq8vuRNzFdlGIcwMaDxCbm3ZzhQ1uRn2km7gAWfvABUN0yPDoQrFrCjLaFwKnQdy3a/cfWa0gHDTshjKSe3BdNtt7392P9RjMTs2j3tG0nmovZ410v/2dE5urrhoo3isYDb0H1B5YfdyZsu/PJWc0DbUySgFmJKBTwglKriq0gRMo1PkDd+xpWGLikl+rCGY83aL//Ruy+v/Mbj+0ZQsS8vdQI51LmzJzowkH1FGK9Z/4lYtIhngAxkTZCHoLGrmjs6snH8aiEvzdH3eGN/lNIqA4na2G+WgTW6ogNPO38BfcpkFZW1g9nmrbYYZ94Ah1ERH3PwZuFNYG/O1viBVOjdlrbn08mtWY9cFI2Ip+UV3QOWEvXvmV9rVR9CGSKGI3lBu76WftB73RKTJFT9HXgsnN0EeP/3/Wz/Zw1Q4jjyp9RXGBzAuAjIaBxP0asvu0zNdezWDGFBBZHDV56W2fOUJ1ZciSUxT/veWKpAUrtOhunw4sZRMEQ
DKIM-Signature: a=rsa-sha256; bh=v4IOVEJofe0j1YxPJgQI553fOjaIdjsxp1gURHV2leg=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676254; v=1;
 b=GYK1oxgVKJNi1aeOLTTwHscO9lEmKDNgG+soSTQH+gPXT52aNsi2DEneiC9mNWTL95wnDy0T
 KaczshOcgzqWDw2NEdT7uwFFiFODqT0vWAQUwiA2/6uf7bMZW+LRIB+h8CaEr9wTnA0kfGxDYp8
 /4vtboAgGX7aVCfkyHCxlVmX9OgUHsKZUw3i0zGxTScB8L4XsbZIUq45Xn8oMCLqpr6F61M4pr0
 8sQXivfjcuT0XgY7W6qOPdnDblMp4FMLw+uJSbPwKm4Nu9LAHyBCc+0J8BmhSzTzCx7ze3/UXpp
 DX7HNqDkM4hZGjn1L2+V73m0MTYy1puGBGS+VGwXz2MZA==
X-purgate-ID: tlsNG-ebf023/1785676255-522D4B50-F23E0C30/0/0
X-purgate-type: clean
X-purgate-size: 1139

Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: updated list of files to match this patchset

 MAINTAINERS | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ed0ffa608f..54c0428f8d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -565,6 +565,25 @@ F:	*/configure
 F:	*/*.ac
 F:	tools/
 
+TRENCHBOOT SECURE LAUNCH
+R:	Daniel P. Smith <dpsmith@apertussolutions.com>
+R:	Ross Philipson <ross.philipson@gmail.com>
+R:	Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
+S:	Supported
+F:	xen/arch/x86/boot/slaunch-early.c
+F:	xen/arch/x86/efi/fixmlehdr.c
+F:	xen/arch/x86/include/asm/intel-txt.h
+F:	xen/arch/x86/include/asm/slaunch-tpm.h
+F:	xen/arch/x86/include/asm/slaunch.h
+F:	xen/arch/x86/include/asm/tpm.h
+F:	xen/arch/x86/include/asm/tpm1.h
+F:	xen/arch/x86/include/asm/tpm2.h
+F:	xen/arch/x86/intel-txt.c
+F:	xen/arch/x86/slaunch-tpm.c
+F:	xen/arch/x86/slaunch.c
+F:	xen/arch/x86/tpm.c
+F:	xen/include/xen/slr-table.h
+
 VM EVENT, MEM ACCESS and MONITOR
 M:	Tamas K Lengyel <tamas@tklengyel.com>
 S:	Supported
-- 
2.55.0


