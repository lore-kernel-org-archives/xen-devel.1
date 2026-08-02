Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AB5C55171
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:17:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380749.1624457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqW4J-0003Qe-Su; Sun, 02 Aug 2026 13:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380749.1624457; Sun, 02 Aug 2026 13:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqW4J-0003QX-P6; Sun, 02 Aug 2026 13:17:31 +0000
Received: by outflank-mailman (input) for mailman id 1380749;
 Sun, 02 Aug 2026 13:17:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqW4I-0003QO-FV
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:17:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqW4H-0084CP-Kx
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:17:29 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f4336-2eae-0a2a0a5409dd-0a2a450ce7a6-36
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:17:29 +0200
Received: from [46.105.63.230] (helo=7.mo575.mail-out.ovh.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41c4-f479-0a2a450c0019-2e693fe6d995-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:10:28 +0200
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.231.104])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4hCgCS41Xgz5x9r
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:10:28 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-4j9th (unknown [10.110.164.1])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D7F99C076B;
 Sun,  2 Aug 2026 13:10:27 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.106])
 by ghost-submission-7d8d68f679-4j9th with ESMTPSA
 id uj/0KMNBb2pAxRsAfFlxhA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:10:27 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-106R00637ba2a53-4aa7-4a04-ab4f-2f442dba9a54,
                    A7BD45287BC66A7121136900083CD01C39616B1D) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.215
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v4 15/23] x86/hvm: check for VMX in SMX if Slaunch is active
Date: Sun,  2 Aug 2026 16:09:31 +0300
Message-ID: <239c0018e4c51a00bf4134971d3e15bf73947042.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4738912709584758204
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEO37Lm1soAj3J6HJwxZueJ91jNrKiCMD9VOxO+7S6oZcwX5ZhHy/rf+u1q3gsSFBR0MQ0G/W66mTSt5xumJoxY/EyDpxdVBT5aAA1fHupbW88f/IumzeClwwf3PGe5NCfIC4rAkaw9D49zl0L3FOqYw1yebY9XQZPEoEgqOhxU7iAITzoi4rSZJugXTxFrfgz5z3QYtYzrLSr0w464iDE2Jv+mfsQyDLbPqlC9XEGpFu9KBxFx07+KPXWsR6kr02Tgk2fJ3ulvjdiKijPJd2EPMcqID96OcOqj/uCF/V+6MYDFkW6NlVR5eWMFf+caoPBoCiQxHguJ/BWn2Nt+/d7LATLWy5uqTTYj8J0/VIlB7Zr0UhD/TGfijKUeNyIPDm3FNpzp7pAf5HCApOpKHKQAb3AHHyNlWfRyCdBrl2KexZBO+lUhUJhvSDWOvNVAM86kgUGxIbclAGz/zqAY8mQPB9gRquoFl/TJil04BBnx7enN7C2vdr+VA815b7S7rnOfIG1HRCwa53xu7oq5j8Jrk6vjnkxNemCkv1uxLGicCXcqfnOKl7UWejOh2fCFkM3x91o+8ufujVu7FXL6cKL0E5t+EbdHc11s/FCv80dpUD+DaiQWKUwGAij4tcrP/hC6VUH4U7N30B6kSSAEkw8VGa5RLTdAF0hBUqrFdxCBnw
DKIM-Signature: a=rsa-sha256; bh=CxIu903ncrohvbZGr5K789lKkzZuj0GGkRH1KVPxQwk=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676228; v=1;
 b=M/JtvsIAXXQ+z1xjEV7S+QcPMQ8cv+B9mCdM49UNJ7PO3qHZsIsQf5hIP8CkEQuh6tx0mJMp
 iPEH7wt3pzETmgdpBwSDECGzxOfXdGB9pp6CrHN9q8y9xCiZ/w7y6D46uPDgmTcDcYrKiUhqs85
 rYqHpuazZgH7ocDhT+dOWgj/3+o9q+R+I7pVjsZQEYEFpjRXICz6jxPbmjIZZCzPRWTDopqAGM4
 r1Wbaf+jncSkp/xPV+3PNIQSCUwRS5lby1+R9RtrO0nYnXyatw2lSrnm71ztFCkA/6An7qkYDr7
 LOWRPHpotE5JwY/jdO1Ll5JLIwZBq8wgxZPGvzZPgewVg==
X-purgate-ID: tlsNG-d25034/1785676229-766DEA5B-9E11368F/0/0
X-purgate-type: clean
X-purgate-size: 1271

From: Michał Żygowski <michal.zygowski@3mdeb.com>

Check whther IA32_FEATURE_CONTROL has the proper bits enabled to run
VMX in SMX when slaunch is active.

Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v4: added Acked-by

 xen/arch/x86/hvm/vmx/vmcs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 8e52ef4d49..3c5dfd7c1b 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -30,6 +30,7 @@
 #include <asm/msr.h>
 #include <asm/processor.h>
 #include <asm/shadow.h>
+#include <asm/slaunch.h>
 #include <asm/spec_ctrl.h>
 #include <asm/tboot.h>
 #include <asm/xstate.h>
@@ -742,7 +743,7 @@ static int _vmx_cpu_up(bool bsp)
     bios_locked = !!(eax & IA32_FEATURE_CONTROL_LOCK);
     if ( bios_locked )
     {
-        if ( !(eax & (tboot_in_measured_env()
+        if ( !(eax & (tboot_in_measured_env() || slaunch_active
                       ? IA32_FEATURE_CONTROL_ENABLE_VMXON_INSIDE_SMX
                       : IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX)) )
         {
-- 
2.55.0


