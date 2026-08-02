Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58522C55171
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:17:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380753.1624485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqW4U-0004DF-NA; Sun, 02 Aug 2026 13:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380753.1624485; Sun, 02 Aug 2026 13:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqW4U-0004D6-Ig; Sun, 02 Aug 2026 13:17:42 +0000
Received: by outflank-mailman (input) for mailman id 1380753;
 Sun, 02 Aug 2026 13:17:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqW4T-0004AU-Mx
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:17:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqW4T-00Bn6b-3r
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:17:41 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f431e-bab6-0a2a0a5309dd-0a2a4505b1b4-44
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:17:40 +0200
Received: from [178.33.253.26] (helo=3.mo582.mail-out.ovh.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41cf-4cb1-0a2a45050019-b221fd1ab33f-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:40 +0200
Received: from director11.ghost.mail-out.ovh.net (unknown [10.110.43.238])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4hCgCg58b5z5yC2
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:39 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-t7wcg (unknown [10.108.42.75])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 13768C28DA;
 Sun,  2 Aug 2026 13:10:38 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.100])
 by ghost-submission-7d8d68f679-t7wcg with ESMTPSA
 id 2d6ZLs5Bb2o8SwgAPH/TWw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:10:38 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-100R00335e8ac6c-444d-4ca3-86c0-9dcadff2c860,
                    A7BD45287BC66A7121136900083CD01C39616B1D) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.215
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v4 19/23] x86/acpi: disallow S3 on Secure Launch boot
Date: Sun,  2 Aug 2026 16:09:35 +0300
Message-ID: <92105cb825fd258f9236291c3dadb64a20c8e325.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4742008934594782652
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTF70AoUNTuq0lE163/HHHmITb2k71K2uLoI2ZNhSgyl66wu8n/QJYzc+NLLaUb0uP1TrkyCR/9L8Ilu8caNGFiWNKPhk8LryKkv9xxZSrEN1zqyUGrQN6nXky3jMJxzdN9g/O0CtTLwNhHfleReQxYNqzRPBHWIFmbNp+cZCBU9E3JqDvY2G2n8Fq8vuRNzFdlGIcwMaDxCbm3ZzhQ1uRn2km7gAWfvABUN0yPDoQrFrCjLaFwKnQdy3a/cfWa0gHDTshjKSe3BdNtt7392P9RjMTs2j3tG0nmovZ410v/2dE5urrhoo3isYDb0H1B5YfdyZsu/PJWc0DbUySgFmJKBWyyZ4p7OpoRv65vjlPO59tPusQpx1aMuOo83eyN3/z2B2mBiu7FmwCv1GODqRHfVtGZspfbAWPCRt62XbVidum0ZJIV0fYl/IHNBD8BUtjMSCMxbE8xP+IoIAB6AEBNnCJpQ8Reiks6gAi4SokCBCRjJAL8Ju7Z+ZniFrpo8t3NQwgY5XgQW+2XwxfGK9/D/OQMB9UIgonZzSfT00gHF/Mq1II2sJU7M79UXISx7I+ivnTh/ezcYTErqNAmQ4cRQUijC/g5UXHPihvDoRinLYRWPkve8j9wxolh7pjw7M3oq2pNO0quutIfljaMyHE+i04tIHFhyIQ+1NyntYDA96w
DKIM-Signature: a=rsa-sha256; bh=6fGDnMoWwU0eNwEZq3/rY7JMw/amuue+vbvojSoNGps=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676239; v=1;
 b=XAVgBwBn3mcCQLaaRUrWtcsnk5+PL7bcDzCnNyqRC689m+c5P7ieywqkIr0HVV/dsZAUgBqQ
 qDYeyZOSagve3H1tNTRoqk4TBiw0HK0yEhpcuX+u78mbPiMdX7TrThipYiBWstS3KN/zjcXNPdR
 w/l8MBPeItTfYAUYt/zEWBtUmDyGfWhbHRoKPgH4Mqno3EyXG3cxf4csjSjF+J+2dkcEcoH86RH
 24vCj06k8NAHiRTXEgDITKI2lgTlFu5KxPsZwzxZ++M20RG8sAX6mbm7vZEkcR83XwTyn4gb20h
 GFhbEYemj1iQpYISq4nbLEDlRAgHa+CDkAL3cF/2yyPZg==
X-purgate-ID: tlsNG-c201ff/1785676240-72AB72A1-BA984278/0/0
X-purgate-type: clean
X-purgate-size: 1335

Secure Launch won't initiate DRTM on S3 resume (the code for starting
DRTM is not part of Xen), so abort a request to perform S3 suspend to
not lose the state of DRTM PCRs.

Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: return EACCES instead of EPERM

 xen/arch/x86/acpi/power.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 3452650a61..8428766f82 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -30,6 +30,7 @@
 #include <asm/microcode.h>
 #include <asm/mwait.h>
 #include <asm/prot-key.h>
+#include <asm/slaunch.h>
 #include <asm/spec_ctrl.h>
 #include <asm/tboot.h>
 #include <asm/trampoline.h>
@@ -335,6 +336,13 @@ int acpi_enter_sleep(const struct xenpf_enter_acpi_sleep *sleep)
            PAGE_SIZE - acpi_sinfo.vector_width / 8)) )
         return -EOPNOTSUPP;
 
+    /* Secure Launch won't initiate DRTM on S3 resume, so abort S3 suspend. */
+    if ( sleep->sleep_state == ACPI_STATE_S3 && slaunch_active )
+    {
+        printk(XENLOG_INFO "SLAUNCH: refusing switching into ACPI S3 state.\n");
+        return -EACCES;
+    }
+
     if ( sleep->flags & XENPF_ACPI_SLEEP_EXTENDED )
     {
         if ( !acpi_sinfo.sleep_control.address ||
-- 
2.55.0


