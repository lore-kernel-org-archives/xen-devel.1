Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB3E606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 13:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=XkI2Ctz0
Received: from list by lists.xenproject.org with outflank-mailman.1455873.1669493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJAHl-0000lN-Js; Tue, 20 Oct 2026 13:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455873.1669493; Tue, 20 Oct 2026 13:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJAHl-0000lG-G9; Tue, 20 Oct 2026 13:53:49 +0000
Received: by outflank-mailman (input) for mailman id 1455873;
 Tue, 20 Oct 2026 13:53:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996e4a1000f79f@swg.vates.tech>)
 id 1xJAHk-0000l0-4x
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 13:53:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJAHj-000OEO-Hs
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 15:53:47 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996e4a1000f79f@swg.vates.tech>)
 id 6ad77256-2eae-0a2a0a5409dd-0a2a45048eb8-38
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 15:53:47 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996e4a1000f79f@swg.vates.tech>)
 id 6ad7726b-b57f-0a2a45040019-b9ff1c239605-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 15:53:47 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a15996e4a1000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 13:53:43 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id E68C981DC6;
 Tue, 20 Oct 2026 15:53:42 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=AseNajs4Y9qMRyP5C5A3ZVOpuHAa0rbWW9c3ZzHzWdc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=XkI2Ctz0owm5ma6LQWlUwD5vNHV2ELZxBW2k/ZRPlPGlehlhpm/SJphbLFQSGbRv7UbKpOuC9
 7vdCcTk+G1T2g3Nt4wo0K3l9GffFDEKtTDWNK7xG2+ZNMOvr5TUzDQDUioM+F4ysUlL3GbPFrIN
 tChobmibJpo+NXUXU51orfirDIbs8DzRDNvwdI0vjInGDjMn9Su2JZJsT+hrOtgiJm+y9q1q9Mv
 EXkWzuPK+5KN2M8iwR8kPTIookogZc8pNs4WxB5hJJDEAGWZsbuA54lwakvGPA3sIBSVfFpZf3n
 84Fphe14deqNt/x39KblNQyKM1cxLxb2bZw7XvRhzm2g==
X-Zone-Loop: 5afb56d1d6191fe3a3cd5aeae8a4fb3362370dae2c53
x-campaign-type: default
x-transaction-id: 85bbb5a4-388b-4694-8677-56c91771da51
x-swg-uid: 01-b329dbe7-8122-4151-afde-0bad1826fe16
X-Mailer: Sweego
Message-ID:
 <1792504423.8631fc262581453bbf619ec5b2062170.1a15996e4a1000f79f@vates.tech>
x-swg-bid: 1792504423.8631fc262581453bbf619ec5b2062170.1a15996e4a1000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH 1/6] vmx/apicv: Fix vmx_pi_hooks_assign() comment
Date: Tue, 20 Oct 2026 15:53:28 +0200
In-Reply-To: <1792504313.8631fc262581453bbf619ec5b2062170.1a1599536d8000f79f@vates.tech>
References: <1792504313.8631fc262581453bbf619ec5b2062170.1a1599536d8000f79f@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.50.bd4b6428bf971b7b.1a15996e29a.4413b678a157b37f=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792504423067
X-purgate-ID: tlsNG-ebf023/1792504427-516D2B50-8FCC1CB9/0/0
X-purgate-type: clean
X-purgate-size: 2357
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.50.bd4b6428bf971b7b.1a15996e29a.4413b678a157b37f=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When the VM is preempted/offline, we're looking to suppress
the notification (as we're going to resume the guest later on,
processing any pending interrupt) to avoid needlessy processing
interrupts in Xen=2E

That behavior is actually SN=3D1 and not SN=3D0 (which makes Xen process
interrupts)=2E

Fixes: 4b759ce163f4 ("vmx: VT-d posted-interrupt core logic handling")
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
So it now matches what docs/misc/vtd-pi=2Etxt says=2E

  3=2E When vCPU is preempted or sleeping
    - Set 'SN' to suppress non-urgent interrupts
      (Currently, we only support non-urgent interrupts)
      When vCPU is preempted or sleep, it doesn't need to accept
      posted-interrupt notification event since we don't change the behavi=
or
      of scheduler when the interrupt occurs, we still need wait for the n=
ext
      scheduling of the vCPU=2E When external interrupts from assigned dev=
ices occur,
      the interrupts are recorded in PIR, and will be synced to IRR before=
 VM-Entry=2E
    - Set 'NV' to 'posted_intr_vector'=2E

 xen/arch/x86/hvm/vmx/vmx=2Ec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx=2Ec b/xen/arch/x86/hvm/vmx/vmx=2Ec
index 3c7374a9ff=2E=2E31bb094d6f 100644
--- a/xen/arch/x86/hvm/vmx/vmx=2Ec
+++ b/xen/arch/x86/hvm/vmx/vmx=2Ec
@@ -303,7 +303,7 @@ void vmx_pi_desc_fixup(unsigned int cpu)
  *  If the VM is currently either preempted or offline (i=2Ee=2E, not run=
ning
  *  because of some reason other than blocking waiting for an interrupt),
  *  there's nothing Xen can do -- we want the interrupt pending bit set i=
n
- *  the guest, but we don't want to bother Xen with an interrupt (SN clea=
r)=2E
+ *  the guest, but we don't want to bother Xen with an interrupt (SN set)=
=2E
  *
  * There's a brief window of time between vmx_intr_assist() and checking
  * softirqs where if an interrupt comes in it may be lost; so we need Xen
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.50.bd4b6428bf971b7b.1a15996e29a.4413b678a157b37f=---

