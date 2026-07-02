Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563D5C43458
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2026 08:10:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1351365.1608558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfCVE-0007ed-5r; Thu, 02 Jul 2026 08:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351365.1608558; Thu, 02 Jul 2026 08:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfCVE-0007eW-2F; Thu, 02 Jul 2026 08:10:32 +0000
Received: by outflank-mailman (input) for mailman id 1351365;
 Thu, 02 Jul 2026 08:10:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f21e0f0bb00080a8@swg.vates.tech>)
 id 1wfCVD-0007eE-00
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 08:10:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfCVC-006YAq-24
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 10:10:30 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f21e0f0bb00080a8@swg.vates.tech>)
 id 6a461cea-e002-0a2a0a5209dd-0a2a450b8880-44
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 10:10:26 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f21e0f0bb00080a8@swg.vates.tech>)
 id 6a461cf1-ac48-0a2a450b0019-b9ff1c228991-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 10:10:25 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f21e0f0bb00080a8.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 02 Jul 2026 08:10:17 +0000
Received: from l14 (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr [90.112.16.6])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id EA49B81185;
 Thu,  2 Jul 2026 10:10:16 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=NzjTuiIjDTo1ZZYWkpiat2ZqEEL6x3BN/uhxJFF01R8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Zr/oNT9XlnRlOrgPaKUQf9FbSprIFnNkWwqEEHkDDGxQy2tmwZhWG3ys5HUQj7+p2HuV51TSj
 5yz9CjcPNftPUy6IQjz9EIyec+VcDoFYfuprjqiT+sfQiXiPDaKcci7MXF/gv/0CYNpIEwwNZGt
 c+k/ho+qEBhfIH8p7IRjqIsFCakfGXlHzK0O4Tf2FkjpwjIgHI8xFTesXcLA4Nv0eqineLtAXEe
 S/JdX7rtVhI5cHVeiiid11BXuR3xMsVdrxgGndWt42AnF/7dMCNUp5x3JF2qcST27IxjU/XqE6E
 1QeVHNaTfNv4vJ3V9YzqxYRNr6xa+mkH3lqZuPks96UQ==
X-Zone-Loop: ee71f1b68e5dcc06fe78d492b4692f29d182dab32c26
x-campaign-type: default
x-transaction-id: d87f70da-4587-4978-bfa8-d0bde2e2714a
x-swg-uid: 01-ba1883c0-31d7-4f8a-bd64-0c977363d851
X-Mailer: Sweego
Message-ID:
 <1782979817.8631fc262581453bbf619ec5b2062170.19f21e0f0bb00080a8@vates.tech>
x-swg-bid: 1782979817.8631fc262581453bbf619ec5b2062170.19f21e0f0bb00080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 2 Jul 2026 10:10:16 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 2/2] lib: make safe_copy_string_from_guest() validate
 input
References: <ba863889-b389-4264-824e-121a5daeba61@suse.com>
 <80bc4e83-b767-4692-9ce1-0ebf68d7ab26@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80bc4e83-b767-4692-9ce1-0ebf68d7ab26@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2f.704031f6a12d6c5e.19f21e0ee99.35cf2f2dae56525b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782979817114
X-purgate-ID: tlsNG-42698a/1782979826-A653B220-F8C34B4A/0/0
X-purgate-type: clean
X-purgate-size: 800

---=Part.2f.704031f6a12d6c5e.19f21e0ee99.35cf2f2dae56525b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 04:48:33PM +0200, Jan Beulich wrote:
> =2E=2E=2E rather than papering over guest flaws: Strings passed ought to=
 be nul-
> terminated (yet sadly libxc hasn't been doing so thus far)=2E This way w=
e
> also avoid order-1 allocations, seeing that all present callers pass
> PAGE_SIZE for max_size=2E
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.2f.704031f6a12d6c5e.19f21e0ee99.35cf2f2dae56525b=---

