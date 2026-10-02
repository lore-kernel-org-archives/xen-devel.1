Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C780CA5FC4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 15:16:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439218.1657607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCez0-00050H-4Y; Fri, 02 Oct 2026 15:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439218.1657607; Fri, 02 Oct 2026 15:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCez0-00050A-1b; Fri, 02 Oct 2026 15:15:34 +0000
Received: by outflank-mailman (input) for mailman id 1439218;
 Fri, 02 Oct 2026 15:15:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0fd2f3d240003f66@swg.vates.tech>)
 id 1xCeyy-000504-5R
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 15:15:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCeyx-001s9N-EB
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:15:31 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0fd2f3d240003f66@swg.vates.tech>)
 id 6abfca82-bab6-0a2a0a5309dd-0a2a4505d3d0-42
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 17:15:31 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0fd2f3d240003f66@swg.vates.tech>)
 id 6abfca93-4cb1-0a2a45050019-b9ff1c229f75-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 17:15:31 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0fd2f3d240003f66.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 02 Oct 2026 15:15:26 +0000
Received: from l14 (82-67-99-167.subs.proxad.net [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id A7090800DA;
 Fri,  2 Oct 2026 17:15:25 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Ix+MWG1aDMJSNlcBNQc8Ob9p/qkmAqwKoNoWhltSI90=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=EcdjyHRjBVyNbbTQHjkJg+bjYlrTKMmfb+tSZY7Z8ya1q3qfdfFHNuljeCWjlnuZ0Pi958cnJ
 lIlv/4P+JoEcSah6b10deUZ4NREBcIZmgNDwBk/FlmSPp4SNumUchqR3srE1q1YyRWDhOPsROp7
 RbPDHyaklctO6I+3PkiYfL29zymjeOoTHB2oVfFdRG8N05hufoLX0qskajYMgUr5gWMuD/IlY3C
 id5own45OUD0y0D7APYDwLRz+c/iGuNMQG3ujWfYn+X8e9SapUaP5kWMXuf7ryiyKD/cdaYMQhU
 7DRJVM14biNTLdYhSsm99oYJXnpVi1BZTjXOlXi0vupA==
X-Zone-Loop: d164275f075c4fe1def57c8c376b2a7d359520024f60
x-campaign-type: default
x-transaction-id: 3e22ccde-0949-4339-9412-027892f6d3eb
x-swg-uid: 01-a3a025ba-f88c-4c59-837e-e1576fe84a57
X-Mailer: Sweego
Message-ID:
 <1790954126.8631fc262581453bbf619ec5b2062170.1a0fd2f3d240003f66@vates.tech>
x-swg-bid: 1790954126.8631fc262581453bbf619ec5b2062170.1a0fd2f3d240003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 2 Oct 2026 17:15:25 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 3/3] tools/libxl: Add support for Viridian stimer
 direct mode
References: <20260911091244.1165516-1-ross.lagerwall@citrix.com>
 <20260911091244.1165516-4-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260911091244.1165516-4-ross.lagerwall@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.5e8.844263e0f7d64ae4.1a0fd2f3a0a.53defecdf44d7939=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790954125834
X-purgate-ID: tlsNG-c201ff/1790954131-720AA2A1-75E528B9/0/0
X-purgate-type: clean
X-purgate-size: 628

---=Part.5e8.844263e0f7d64ae4.1a0fd2f3a0a.53defecdf44d7939=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 10:12:44AM +0100, Ross Lagerwall wrote:
> Add support to libxl for using the stimer enlightenments in direct mode=
=2E
>=20
> Signed-off-by: Ross Lagerwall <ross=2Elagerwall@citrix=2Ecom>

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.5e8.844263e0f7d64ae4.1a0fd2f3a0a.53defecdf44d7939=---

