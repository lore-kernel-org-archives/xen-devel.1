Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABF7CCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 17:06:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452488.1667335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlOJ-0007G6-CG; Fri, 16 Oct 2026 17:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452488.1667335; Fri, 16 Oct 2026 17:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlOJ-0007Fz-7F; Fri, 16 Oct 2026 17:06:47 +0000
Received: by outflank-mailman (input) for mailman id 1452488;
 Fri, 16 Oct 2026 17:06:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae0c950008425@swg.vates.tech>)
 id 1xHlOI-0007EQ-Eu
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:06:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHlOH-006YfJ-S3
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 19:06:45 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae0c950008425@swg.vates.tech>)
 id 6ad25989-8faa-0a2a0a5109dd-0a2a4502d3c0-34
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:06:45 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae0c950008425@swg.vates.tech>)
 id 6ad2599e-6ca4-0a2a45020019-b9ff1c12837f-5
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:06:45 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a145ae0c950008425.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 17:06:36 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 34B3B824A6;
 Fri, 16 Oct 2026 19:06:36 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=y5W1BwliK9YUSa6dvhU+A5YtDZM930XqJPobMpHuQxk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Q/6ZbcWrxNsFM8sz442xUGm/AWvdA3yo8MkTegrCvxqza5RNduQxi8mrS+/kD4Yt6jagUh0WQ
 /SQHUo8vxxnji+FisSuMVS+AJ3qcuj6Pta7FOkP7Niw3PZ0FFNno+ax3F9Rmx1lUxZOFVIu96eP
 rxvsm5oL9C03KYdEUzMp0vZ+IvzyQ3QzlyrIlxa+S/hrIV5r3pdAPJKN0OBzIr7k6njOI+lr03g
 7ZMp6pHVhfeV/cnYnGyzcDLCwiNuNgB2e+wp6Nums8vyKEtbq9k4FVYfHon/UxqZYPsXyt2DU4s
 WmIAbFC7DVkn+4hx8/70lMIbemhu1PiC2Ca5WT+4shgw==
X-Zone-Loop: 18f1680ce4ee15ca41b26b1952733d1c5580dac65def
x-campaign-type: default
x-transaction-id: 67a4ba8d-a0cb-48af-8209-4e4dcbfde07d
x-swg-uid: 01-c084963e-5188-4fb3-8ae6-c62adc1c1ac3
X-Mailer: Sweego
Message-ID:
 <1792170396.8631fc262581453bbf619ec5b2062170.1a145ae0c950008425@vates.tech>
x-swg-bid: 1792170396.8631fc262581453bbf619ec5b2062170.1a145ae0c950008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	David Woodhouse <dwmw2@infradead.org>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] x86/xen/time: Clear xen_clock mapping later
Date: Fri, 16 Oct 2026 19:06:10 +0200
In-Reply-To: <20261016170613.173406-2-teddy.astie@vates.tech>
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <20261016170613.173406-2-teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2fa.9b863a069a05174e.1a145ae0aee.a3d16faf8fcfb122=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792170396398
X-purgate-ID: tlsNG-720697/1792170405-307C22AC-35AA7635/0/0
X-purgate-type: clean
X-purgate-size: 2132

---=Part.2fa.9b863a069a05174e.1a145ae0aee.a3d16faf8fcfb122=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The current logic has a corner case when both xen_save_time_memory_area()
and xen_restore_time_memory_area() fails=2E In this case, the mapping is n=
ever
cleared and kept with previous pvclock values (invalidating the comment
regarding VDSO_CLOCKMODE_PVCLOCK as the data may not have been zeroed)=2E

Also convert the clear_page with a memset, there's no need to clear the
entire page when we only care about 64 bytes of it=2E

Fixes: 2229f70b5bbb ("x86/xen/time: setup vcpu 0 time info page")
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
CC: Juergen Gross <jgross@suse=2Ecom>
CC: Boris Ostrovsky <boris=2Eostrovsky@oracle=2Ecom>
CC: Stefano Stabellini <sstabellini@kernel=2Eorg>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam=2Ecom>
CC: David Woodhouse <dwmw2@infradead=2Eorg>
CC: x86@kernel=2Eorg
CC: linux-kernel@vger=2Ekernel=2Eorg

 arch/x86/xen/time=2Ec | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/xen/time=2Ec b/arch/x86/xen/time=2Ec
index 2656b3a08553=2E=2E87b890691fcb 100644
--- a/arch/x86/xen/time=2Ec
+++ b/arch/x86/xen/time=2Ec
@@ -407,9 +407,7 @@ void xen_save_time_memory_area(void)
=20
 	ret =3D HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_time_memory_area, 0, &t)=
;
 	if (ret !=3D 0)
-		pr_notice("Cannot unregister vcpu_time_info (err %d)\n", ret);
-	else
-		clear_page(xen_clock);
+		pr_notice("Cannot unregister vcpu_time_info (err %d)", ret);
 }
=20
 void xen_restore_time_memory_area(void)
@@ -420,6 +418,7 @@ void xen_restore_time_memory_area(void)
 	if (!xen_clock)
 		goto out;
=20
+	memset(xen_clock, 0, sizeof(*xen_clock));
 	t=2Eaddr=2Ev =3D &xen_clock->pvti;
=20
 	ret =3D HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_time_memory_area, 0, &t)=
;
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.2fa.9b863a069a05174e.1a145ae0aee.a3d16faf8fcfb122=---

