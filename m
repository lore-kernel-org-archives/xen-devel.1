Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AF9606A326
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 13:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=KD1sJHUp
Received: from list by lists.xenproject.org with outflank-mailman.1455864.1669484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJAFw-00087i-9a; Tue, 20 Oct 2026 13:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455864.1669484; Tue, 20 Oct 2026 13:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJAFw-00087b-6F; Tue, 20 Oct 2026 13:51:56 +0000
Received: by outflank-mailman (input) for mailman id 1455864;
 Tue, 20 Oct 2026 13:51:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1599536d8000f79f@swg.vates.tech>)
 id 1xJAFv-00087V-I9
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 13:51:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJAFu-000Nqf-KV
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 15:51:54 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1599536d8000f79f@swg.vates.tech>)
 id 6ad771e9-e002-0a2a0a5209dd-0a2a450cd07c-46
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 15:51:54 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1599536d8000f79f@swg.vates.tech>)
 id 6ad771fa-f479-0a2a450c0019-b9ff1c239a47-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 15:51:54 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1599536d8000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 13:51:53 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id B19D781B2E;
 Tue, 20 Oct 2026 15:51:52 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=V/75RGEsEtsnGU0WXZZ1cfYHm88H7Kn4+IVIKtQ72gs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=KD1sJHUp/bXfc44bpo/lHAHdYMNZl9scFKteurpItYe1RsjdA+Rs8Zm4FTw4LDqTT/w3MebEQ
 lQlpjA8yLaZouXmFahhA/8szgEmKiASUw34JYBsKM+F0PJ9tqjPvIMeswhR/juF/pd9Ayt0wJc8
 IZclNdbNtV+htKK84EOXQ3O95ehoKy5D3utn8DHJ7zU6sB+GSaI9Q2rVtne5xLNgk01lckEB4Zd
 xINV09kkLIiIF8R+rkZJGTZWy9Fls/JwzNChDDLtfWvCYdJeImnnu2TfSoAlOTbpV442QTOVVYH
 A8Bxc4GqyhaN5HK5WWZVuMj0ruI+9Be7XtZHPjvj4/+g==
X-Zone-Loop: 671e7958a7aa0ce540cab0847f881048ba669b876407
x-campaign-type: default
x-transaction-id: 0eba7c7b-3dfb-4a5d-a90c-4665a9e4109c
x-swg-uid: 01-2cab2f36-0015-4fcc-99f3-87e8e0d7996b
X-Mailer: Sweego
Message-ID:
 <1792504313.8631fc262581453bbf619ec5b2062170.1a1599536d8000f79f@vates.tech>
x-swg-bid: 1792504313.8631fc262581453bbf619ec5b2062170.1a1599536d8000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Denis Mukhin <dmukhin@xen.org>
Subject: [PATCH 0/6] vmx/apicv: APICv and IOMMU posted interrupt improvements
Date: Tue, 20 Oct 2026 15:51:30 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.4e.2f29739024001b1f.1a15995342f.4ef697d52e3f951c=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792504312884
X-purgate-ID: tlsNG-d25034/1792504314-52132A5B-079F7333/0/0
X-purgate-type: clean
X-purgate-size: 1605
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.4e.2f29739024001b1f.1a15995342f.4ef697d52e3f951c=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Various improvements around APICv/iommu-intpost found by Claude Fable
(and Opus)=2E

Some of the APICv bugfixes makes APICv behavior align better with
emulated lapic=2E

Testing shows that "Don't lose posted interrupts while SN=3D1" vastly
improves VT-d interrupt posting reliability=2E
I guess there's more stuff to fix (especially around comments), but
that's probably a good start=2E

I'm not sure how the current HVM infra around interrupt posting
fits with AMD AVIC=2E Feedback welcome=2E

Teddy Astie (6):
  vmx/apicv: Fix vmx_pi_hooks_assign() comment
  x86/vlapic: Fix hardware virtualized APIC state after reset
  vmx/apicv: Don't lose posted interrupts while SN=3D1
  vmx/apicv: Fully deassign the PI hooks when the last device is removed
  vmx/apicv: Replace the PI_CSW_{FROM,TO} flags with a boolean
  vmx/apicv: Don't defer RVI update when an event is pending injection

 xen/arch/x86/hvm/vlapic=2Ec              |  43 ++++++-
 xen/arch/x86/hvm/vmx/intr=2Ec            |  11 +-
 xen/arch/x86/hvm/vmx/vmx=2Ec             | 159 ++++++++++++++++---------
 xen/arch/x86/include/asm/hvm/domain=2Eh  |   3 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh |   5 +
 5 files changed, 160 insertions(+), 61 deletions(-)

--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.4e.2f29739024001b1f.1a15995342f.4ef697d52e3f951c=---

