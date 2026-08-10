Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF116C5AE49
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 13:55:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387502.1628761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQSw-0001fH-2d; Mon, 10 Aug 2026 13:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387502.1628761; Mon, 10 Aug 2026 13:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQSv-0001fA-W3; Mon, 10 Aug 2026 13:54:57 +0000
Received: by outflank-mailman (input) for mailman id 1387502;
 Mon, 10 Aug 2026 13:54:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19febf4636c000e099@swg.vates.tech>)
 id 1wtQSu-0001f4-R4
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 13:54:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtQSu-003bn7-1G
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 15:54:56 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19febf4636c000e099@swg.vates.tech>)
 id 6a79d828-8faa-0a2a0a5109dd-0a2a4502cb30-16
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 15:54:56 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19febf4636c000e099@swg.vates.tech>)
 id 6a79d82f-6ca4-0a2a45020019-b9ff1c2299a1-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 15:54:55 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19febf4636c000e099.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 13:54:49 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 33FCE836B7;
 Mon, 10 Aug 2026 15:54:49 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=qYZlMcdmRV5gUuAWGbMRzHbSRcI58EU4VevDR3Dt7GE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=XCFbg2XCWFLGGR27dXrp6Q4WGZ9rV+6OoxX+Uw7FQe9HoBZn7PfTdBZYqUaDS8ZsbnYAhrqCU
 thWTcPsI+YMIRL5KuL3ckNPz+CnxocMgOTT4AOcKg3JINFp+uHjG1xpLfZXcyLJnxmdhdW6yn/u
 0xaWhLRLJV6gfNYsvtsrDHLREOm+/gERZKjxkRoR2e04a6LUzcPuaBuV1t0OBO8RHr+DNmDrn+s
 iGUgb+matMPlXXnxteV/2ZM+CLCw5KdgVkhYebwslmEUtZvA17J62ZFJmXUgDTbvfN/L3lmE0Vr
 Gxa2llKzC0sm1qzY/M+pVowGF33wFG96zE1b6YArfySw==
X-Zone-Loop: 12ac97beabf66f61959a1ab1a95b9d6c178d7839e040
x-campaign-type: default
x-transaction-id: bff11c7e-85d3-4528-b2de-57a1e2ce49b8
x-swg-uid: 01-ba4e17f1-c418-4ef8-b15c-4e1af4467c88
X-Mailer: Sweego
Message-ID:
 <1786370089.8631fc262581453bbf619ec5b2062170.19febf4636c000e099@vates.tech>
x-swg-bid: 1786370089.8631fc262581453bbf619ec5b2062170.19febf4636c000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 10 Aug 2026 15:54:48 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 1/2] x86/domctl: don't imply I/O port permissions from
 I/O port mapping
References: <65f69026-f284-4cfd-b502-8d8955b412f5@suse.com>
 <724bd14c-ebba-4e29-be7c-012aa7aa82b2@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <724bd14c-ebba-4e29-be7c-012aa7aa82b2@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2020.8836ca613bbf8c64.19febf46169.4adba427c2485d41=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786370089321
X-purgate-ID: tlsNG-720697/1786370095-30DC12AC-4A3917C6/0/0
X-purgate-type: clean
X-purgate-size: 2019

---=Part.2020.8836ca613bbf8c64.19febf46169.4adba427c2485d41=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 03:54:04PM +0200, Jan Beulich wrote:
> Rather than granting permissions when mapping (an operation that DM-s ar=
e
> allowed to carry out, while they can't invoke ioport-permission), check
> whether permissions actually were granted when adding a mapping=2E This =
then
> also allows relaxing the necessary locking=2E
>=20
> While no longer granting permissions upon mapping is "only" at risk of
> breaking guests, no longer revoking permissions upon unmapping strictly
> requires callers to additionally invoke XEN_DOMCTL_ioport_permission=2E =
Or
> else a security issue would arise=2E In-tree code already does so=2E
>=20
> While there switch to using %pd in the two log messages=2E
>=20
> Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>
> ---
> libxl has libxl__grant_vga_iomem_permission(), but I can't spot any I/O
> port equivalent (nor a revoke counterpart, btw)=2E Everywhere else MMIO =
and
> I/O ports look to be treated equally=2E
>=20
> Qemu uses both xc_domain_{iomem_permission,memory_mapping}() in
> igd_write_opregion(), but only xc_domain_{memory,ioport}_mapping() in
> xen_pt_region_update() and xen_pt_{,un}register_vga_regions()=2E Is the =
IGD
> region special in any way? Clearly this can't work from a stubdom=2E

Yes, the IGD opregion is special, it's not something that exist on every
PCI devices, just some Intel graphic devices, it's probably not part of
any spec=2E Other region are just PCI bar, or the VGA region=2E

I guess the toolstack could handle that device and call iomem_perission
instead of QEMU, if needed=2E


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.2020.8836ca613bbf8c64.19febf46169.4adba427c2485d41=---

