Return-Path: <SRS0=8ky9=M4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5F9C432BE
	for <xen-devel@archiver.kernel.org>; Thu,  5 Aug 2021 15:58:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FA576105A
	for <xen-devel@archiver.kernel.org>; Thu,  5 Aug 2021 15:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FA576105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cs.pub.ro
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.164461.300769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBflD-0007lb-De; Thu, 05 Aug 2021 15:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164461.300769; Thu, 05 Aug 2021 15:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBflD-0007lU-Ab; Thu, 05 Aug 2021 15:58:19 +0000
Received: by outflank-mailman (input) for mailman id 164461;
 Thu, 05 Aug 2021 15:58:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kdBg=M4=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1mBflC-0007lO-4J
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 15:58:18 +0000
Received: from mx.upb.ro (unknown [141.85.13.221])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc1aaad2-ce6b-4683-9fa8-7ba8339166a8;
 Thu, 05 Aug 2021 15:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id D0068B56005D;
 Thu,  5 Aug 2021 18:58:14 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id AxPH0Rbm83PJ; Thu,  5 Aug 2021 18:58:12 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id C81C5B56005F;
 Thu,  5 Aug 2021 18:58:12 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SPN36_qjnfB2; Thu,  5 Aug 2021 18:58:12 +0300 (EEST)
Received: from localhost.localdomain (unknown [86.121.144.181])
 by mx.upb.ro (Postfix) with ESMTPSA id 513BEB56005D;
 Thu,  5 Aug 2021 18:58:12 +0300 (EEST)
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
X-Inumbo-ID: bc1aaad2-ce6b-4683-9fa8-7ba8339166a8
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/libs/ctrl/xc_vm_event.c: Remove redundant newlines from error messages
Date: Thu,  5 Aug 2021 18:58:09 +0300
Message-Id: <9baed69de702f3e87f14b86a4b4edbca386ec2e9.1628178928.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Messages printed with PERROR() do not need explicit newlines (\n)
because they are added implicitly.

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 tools/libs/ctrl/xc_vm_event.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/libs/ctrl/xc_vm_event.c b/tools/libs/ctrl/xc_vm_event.=
c
index a97c615b18..2ac27c71b2 100644
--- a/tools/libs/ctrl/xc_vm_event.c
+++ b/tools/libs/ctrl/xc_vm_event.c
@@ -58,7 +58,7 @@ void *xc_vm_event_enable(xc_interface *xch, uint32_t do=
main_id, int param,
     rc1 =3D xc_domain_pause(xch, domain_id);
     if ( rc1 !=3D 0 )
     {
-        PERROR("Unable to pause domain\n");
+        PERROR("Unable to pause domain");
         return NULL;
     }
=20
@@ -66,7 +66,7 @@ void *xc_vm_event_enable(xc_interface *xch, uint32_t do=
main_id, int param,
     rc1 =3D xc_hvm_param_get(xch, domain_id, param, &pfn);
     if ( rc1 !=3D 0 )
     {
-        PERROR("Failed to get pfn of ring page\n");
+        PERROR("Failed to get pfn of ring page");
         goto out;
     }
=20
@@ -80,7 +80,7 @@ void *xc_vm_event_enable(xc_interface *xch, uint32_t do=
main_id, int param,
                                               &ring_pfn);
         if ( rc1 !=3D 0 )
         {
-            PERROR("Failed to populate ring pfn\n");
+            PERROR("Failed to populate ring pfn");
             goto out;
         }
     }
@@ -90,7 +90,7 @@ void *xc_vm_event_enable(xc_interface *xch, uint32_t do=
main_id, int param,
                                          &mmap_pfn, 1);
     if ( !ring_page )
     {
-        PERROR("Could not map the ring page\n");
+        PERROR("Could not map the ring page");
         goto out;
     }
=20
@@ -124,7 +124,7 @@ void *xc_vm_event_enable(xc_interface *xch, uint32_t =
domain_id, int param,
     rc1 =3D xc_vm_event_control(xch, domain_id, op, mode, port);
     if ( rc1 !=3D 0 )
     {
-        PERROR("Failed to enable vm_event\n");
+        PERROR("Failed to enable vm_event");
         goto out;
     }
=20
--=20
2.20.1


