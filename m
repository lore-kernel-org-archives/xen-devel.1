Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03E1C98317
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 11:57:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432158.1653673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9i52-0003gB-W8; Thu, 24 Sep 2026 11:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432158.1653673; Thu, 24 Sep 2026 11:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9i52-0003g4-TT; Thu, 24 Sep 2026 11:57:36 +0000
Received: by outflank-mailman (input) for mailman id 1432158;
 Thu, 24 Sep 2026 11:57:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d347225a00072c4@swg.vates.tech>)
 id 1x9i51-0003Zl-AA
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 11:57:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9i50-009XC0-NK
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 13:57:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d347225a00072c4@swg.vates.tech>)
 id 6ab5102d-2eae-0a2a0a5409dd-0a2a4504e240-4
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 13:57:34 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d347225a00072c4@swg.vates.tech>)
 id 6ab5102e-b57f-0a2a45040019-b9ff1c238647-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 13:57:34 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0d347225a00072c4.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 24 Sep 2026 11:57:29 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id CD01C81C7E;
 Thu, 24 Sep 2026 13:57:28 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=YSK+oBEhJCxxZzsM9y3NERCslvzp5sV47ASUQ0IT6sQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=opwvSSeaIJAYQFGwOrE+4Z9hfuOxsUVQHroj+0c3lInNotR48+FoVZIQFZGqTJOkp38IfXV95
 QOGnA7JoasjQlz2yDv9RzH612+AU7vYeDdnc9W3pEQdJjf8zyq9Lv+DzgukDP74ipB4MN7zw7mt
 q42pyDg+NpCmtbeH2Q08OTejFqo2kGFw/khaqapw6CzD7MW1Fpn+3ZoGs3Q3+jW82YGvYKxyAoF
 vpHJ1opFe/2BKNwRp8RprOY325qOb8ijsRfz6UtTkRezxNBkPmXzY11uhNtkzsdEsRNnAzBi2vQ
 RrRkF5Ar5osO6jDMlZ0OgB4Ds778YatiEGkKuPzSzjsw==
X-Zone-Loop: 20541bc9a38802228b6bffc229bb790710352b308f84
x-campaign-type: default
x-transaction-id: 6c62f9b7-f9f4-40a4-b512-ea2630e8d76d
x-swg-uid: 01-16fd0064-d4a8-427c-b52a-feec3ef13f2b
X-Mailer: Sweego
Message-ID:
 <1790251049.8631fc262581453bbf619ec5b2062170.1a0d347225a00072c4@vates.tech>
x-swg-bid: 1790251049.8631fc262581453bbf619ec5b2062170.1a0d347225a00072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH 3/3] vm_event: vmx: Allow intercepting hypervisor MSRs in debug builds
Date: Thu, 24 Sep 2026 13:57:07 +0200
In-Reply-To: <1790250881.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@vates.tech>
References: <1790250881.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3d7.f43ed18a8ff1f602.1a0d3472009.a677eb19d0ec6198=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790251048970
X-purgate-ID: tlsNG-ebf023/1790251054-C28C9B50-A43345E1/0/0
X-purgate-type: clean
X-purgate-size: 1594

---=Part.3d7.f43ed18a8ff1f602.1a0d3472009.a677eb19d0ec6198=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

MSRs that are not covered by MSR bitmap (e=2Eg hypervisor range) are
unconditionally intercepted by hardware and don't need any specific handli=
ng=2E

However, vmx_set_msr_intercept() wrongly ASSERT() if the MSR is a part of =
the
hypervisor range=2E Fix it by skipping the ASSERT() in this case=2E

This is only reachable with CONFIG_VM_EVENT using XEN_DOMCTL_MONITOR_EVENT=
_MOV_TO_MSR
to configure a MSR intercept in the hypervisor range (0x40000000=E2=80=930=
x40001fff)=2E

Fixes: 62999081ca27 ("x86/vmx: Introduce and use struct vmx_msr_bitmap")
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/arch/x86/hvm/vmx/vmcs=2Ec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs=2Ec b/xen/arch/x86/hvm/vmx/vmcs=2Ec
index 8e52ef4d49=2E=2E050168bbce 100644
--- a/xen/arch/x86/hvm/vmx/vmcs=2Ec
+++ b/xen/arch/x86/hvm/vmx/vmcs=2Ec
@@ -986,7 +986,7 @@ void vmx_set_msr_intercept(struct vcpu *v, unsigned in=
t msr,
         if ( type & VMX_MSR_W )
             set_bit(msr, msr_bitmap->write_high);
     }
-    else
+    else if ( !((msr >=3D 0x40000000U) && (msr <=3D 0x40001fffU)) )
         ASSERT(!"MSR out of range for interception\n");
 }
=20
--=20
2=2E55=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.3d7.f43ed18a8ff1f602.1a0d3472009.a677eb19d0ec6198=---

