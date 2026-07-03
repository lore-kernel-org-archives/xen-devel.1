Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99A2C44500
	for <xen-devel@archiver.kernel.org>; Fri,  3 Jul 2026 13:08:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1353332.1609299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfddF-0002xJ-EF; Fri, 03 Jul 2026 13:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353332.1609299; Fri, 03 Jul 2026 13:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfddF-0002xC-BS; Fri, 03 Jul 2026 13:08:37 +0000
Received: by outflank-mailman (input) for mailman id 1353332;
 Fri, 03 Jul 2026 13:08:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f28184fc000080a8@swg.vates.tech>)
 id 1wfddD-0002x6-WB
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 13:08:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfddD-00Bbpy-Br
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 15:08:35 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f28184fc000080a8@swg.vates.tech>)
 id 6a47b442-bab6-0a2a0a5309dd-0a2a45058cca-28
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 15:08:35 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f28184fc000080a8@swg.vates.tech>)
 id 6a47b453-3cb2-0a2a45050019-b9ff1c239d81-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 15:08:35 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f28184fc000080a8.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 03 Jul 2026 13:08:29 +0000
Received: from l14 (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr [90.112.16.6])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0ADD381C1B;
 Fri,  3 Jul 2026 15:08:29 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=VDWJgtP/AnY0r8NxFjfUJNOMZlOVroSKIzuuLx6zirw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=jjzMPM0O7g6MSeoGiZG6nGTZV7Lx/U4AoTApaZKym0a7487BngyS/TQgeZy0a9FF95yhLF7jk
 aSGs9J71BKiQAG+bfc7u10XUqUvByczb3gY1s8Oh+9zxpU0tPkfd998OaU/03a9eMWlegA/jpdW
 ctAjqL8iqXqtEdp6CJQfT5Wb97W3IGoVgbmhUQAW4jAed8Yi+QzclKW6vXM55LCyU/8K6lYPFEv
 B+PWmtyFlhcb6F90X1nVY8VK618E5yRfiQ3c+mIieWdwv4sOyBDDMJqCNsdlV9+W1rqX9VxX4BE
 msUZ6xCWQhhizm6O96JYc1iEiWEfLGTdrJOpx6O1YfWA==
X-Zone-Loop: e96cc2f1795bb0a13a820145f52115a20f1a79e15d11
x-campaign-type: default
x-transaction-id: cb8cfce5-a343-4065-b258-43e694a50e03
x-swg-uid: 01-a130aedd-fc21-4193-a899-0b5bf17dfe99
X-Mailer: Sweego
Message-ID:
 <1783084109.8631fc262581453bbf619ec5b2062170.19f28184fc000080a8@vates.tech>
x-swg-bid: 1783084109.8631fc262581453bbf619ec5b2062170.19f28184fc000080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 3 Jul 2026 15:08:28 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22] tools/libfsimage: Remove the XEN_FSIMAGE_FSDIR
 environment variable
References: <20260702150301.825883-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260702150301.825883-1-andrew.cooper3@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.c7.af50758f9556348f.19f28184d77.5869ff7f27bf93b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783084109175
X-purgate-ID: tlsNG-c201ff/1783084115-14F072B8-38318739/0/0
X-purgate-type: clean
X-purgate-size: 924

---=Part.c7.af50758f9556348f.19f28184d77.5869ff7f27bf93b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2026 at 04:03:01PM +0100, Andrew Cooper wrote:
> This was reported to the security team, demonstrating that code executio=
n
> could be achieved, but without a demonstration of a priviliege boundary =
being
> bypassed=2E
>=20
> Still, it's a high risk path with no obvious evidence of having been use=
d even
> for debugging, so remove the environment variable and use the build time
> $(libdir)/xenfsimage path only=2E
>=20
> Signed-off-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.c7.af50758f9556348f.19f28184d77.5869ff7f27bf93b=---

