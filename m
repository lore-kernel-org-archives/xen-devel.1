Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619BECD5BB5
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2026 12:34:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1316743.1586088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQP4f-0007kh-Jl; Fri, 22 May 2026 12:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316743.1586088; Fri, 22 May 2026 12:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQP4f-0007ka-H1; Fri, 22 May 2026 12:33:57 +0000
Received: by outflank-mailman (input) for mailman id 1316743;
 Fri, 22 May 2026 12:33:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fad80e4000f373@swg.vates.tech>)
 id 1wQP4e-0007kU-4L
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 12:33:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQP4d-00Eggc-GK
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 14:33:55 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fad80e4000f373@swg.vates.tech>)
 id 6a104d2b-e002-0a2a0a5209dd-0a2a4505c798-30
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 14:33:55 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fad80e4000f373@swg.vates.tech>)
 id 6a104d33-aaa8-0a2a45050019-b9ff1c2285a1-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 14:33:55 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e4fad80e4000f373.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 22 May 2026 12:33:51 +0000
Received: from localhost.localdomain (88-175-170-134.subs.proxad.net
 [88.175.170.134]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id A50EA86A08;
 Fri, 22 May 2026 14:33:50 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=btuo1BkXt6I5InUgJFSYjZbZv6EuMecyqn5NavlpXiA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=KKNYOu2UmOALUk9YtOI0fMpzIZ1VOnn0G0pZEKDWDLPv6X28RME8vrTVqVERJz750+V9kOSXC
 JMObwEZf6XLeHwomhxIpfGc0esy9YuTdMv6BhaM7DY033htIt334sSvQ3SCz/Wz6g7wcv0VgZMd
 sWHVrLG1JmVeauTUsgR2eb1sejcWAyTXl2ARxFP54rmpmngNrVlVU8fRQmpBbCzD3nNPTzK3QCV
 kVy4uoFtSLxFLZa+EiFvaBz8R8B5wY9pPPThy/6mkRkT3Ds5UWHbyq47D4UHc06F3ZWqoznr6Ju
 jujRhdXRSTmf8wRwiS6wW6UbYhu9N8IfF04PqUic94Cg==
X-Zone-Loop: 3e4b4098239a8b005422ecdacfa1053111b7e158d1da
x-campaign-type: default
x-transaction-id: 5bbbe97f-a0ac-4f8c-a102-ca207c4937a3
x-swg-uid: 01-8c8fc81e-2762-4640-91f9-a50d47453f05
X-Mailer: Sweego
Message-ID:
 <1779453231.8631fc262581453bbf619ec5b2062170.19e4fad80e4000f373@vates.tech>
x-swg-bid: 1779453231.8631fc262581453bbf619ec5b2062170.19e4fad80e4000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] pv32: Fix bogus cr2 on fault in emulation gate
Date: Fri, 22 May 2026 14:33:16 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1242.f2a4f52407856473.19e4fad7ebe.3900a54c92a60a3f=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779453230785
X-purgate-ID: tlsNG-c201ff/1779453235-DA374443-6CD7DCD0/0/0
X-purgate-type: clean
X-purgate-size: 2150

---=Part.1242.f2a4f52407856473.19e4fad7ebe.3900a54c92a60a3f=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

__{put,get}_guest returns -EFAULT on access faults which causes
the injected cr2 to be off by 14 bytes (as EFAULT is 14) which is
incorrect=2E

Fix the computation by relying on copy_{from,to}_guest_pv which
reports the number of remaining bytes instead of a negative errno,
such that we can compute the offset properly=2E

Fixes: 70ad570b2799 ("x86/64: paravirt 32-on-64 call gate support")
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
v2:
 * Don't add variable in push() macro
 * Use uint32_t type for temporary value=2E

 xen/arch/x86/pv/emul-gate-op=2Ec | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/pv/emul-gate-op=2Ec b/xen/arch/x86/pv/emul-gate-=
op=2Ec
index c2c699fbff=2E=2E9c229c46c4 100644
--- a/xen/arch/x86/pv/emul-gate-op=2Ec
+++ b/xen/arch/x86/pv/emul-gate-op=2Ec
@@ -286,12 +286,14 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
     if ( !jump )
     {
         unsigned int ss, esp, *stkp;
+        uint32_t value;
         int rc;
 #define push(item) do \
         { \
+            value =3D item; \
             --stkp; \
             esp -=3D 4; \
-            rc =3D __put_guest(item, stkp); \
+            rc =3D copy_to_guest_pv(stkp, &value, sizeof(value)); \
             if ( rc ) \
             { \
                 pv_inject_page_fault(PFEC_write_access, \
@@ -359,7 +361,7 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
                     unsigned int parm;
=20
                     --ustkp;
-                    rc =3D __get_guest(parm, ustkp);
+                    rc =3D copy_from_guest_pv(&parm, ustkp, sizeof(parm))=
;
                     if ( rc )
                     {
                         pv_inject_page_fault(0, (unsigned long)(ustkp + 1=
) - rc);
--=20
2=2E52=2E0



-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.1242.f2a4f52407856473.19e4fad7ebe.3900a54c92a60a3f=---

