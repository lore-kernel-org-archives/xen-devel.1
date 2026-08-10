Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63FBC5AD55
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 14:24:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387521.1628779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQvE-0007KW-Cn; Mon, 10 Aug 2026 14:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387521.1628779; Mon, 10 Aug 2026 14:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQvE-0007KP-9h; Mon, 10 Aug 2026 14:24:12 +0000
Received: by outflank-mailman (input) for mailman id 1387521;
 Mon, 10 Aug 2026 14:24:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec0f24d6000e099@swg.vates.tech>)
 id 1wtQvC-0007JE-Sz
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 14:24:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtQvB-008vgD-Rc
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 16:24:09 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec0f24d6000e099@swg.vates.tech>)
 id 6a79df00-2eae-0a2a0a5409dd-0a2a4508b484-30
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 16:24:09 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec0f24d6000e099@swg.vates.tech>)
 id 6a79df09-f659-0a2a45080019-b9ff1c128abf-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 16:24:09 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fec0f24d6000e099.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 14:24:03 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9079F83723;
 Mon, 10 Aug 2026 16:24:02 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=w3Us9nesQGAMRB6+hb7KVElnxo3+BAlMCfqBlWxluIU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=sLomAFoEh0VD9jNswyxRCc0EHebV2qsMrWrQ23ZSKUDgeF/ZDPCpz0rWQJ/Q9On0T7kKhBt1D
 Itnn9mYI509sRMhynAWL8uLqM8WNcTONiWh898tDmGmduMou2m3Gmd38vzOUU9wTdJVa6JZ7yeh
 kJL6LmJK9SqUEBtWaTxQ4CyT9T7EYpwGEypSya+wlbv+0ClTbBHOfYfl1imNxYknNgF2GE4hx/3
 xgqFcfdTa6rve3EFQihoVQ34fyroWtSlMjyNjdOKnuNVzNoRrNWzgvKT+CjusVn5tgszCOiUFra
 p/VI9XzeFA7e18OKxcAffnHRia4vFx2imhkEDzm2wWBQ==
X-Zone-Loop: 64e6ac7acbbe1721415925217bf7e9260646a46776ea
x-campaign-type: default
x-transaction-id: 0942e2cc-63eb-4493-9f70-8b571d7cadb0
x-swg-uid: 01-816107dc-484d-40c0-bc0a-0c1d64c0ec7e
X-Mailer: Sweego
Message-ID:
 <1786371843.8631fc262581453bbf619ec5b2062170.19fec0f24d6000e099@vates.tech>
x-swg-bid: 1786371843.8631fc262581453bbf619ec5b2062170.19fec0f24d6000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 10 Aug 2026 16:24:02 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/3] xen/scripts: import gen_compile_commands.py from
 Linux
References: <20260810095056.29884-1-gwd@xenproject.org>
 <20260810095056.29884-2-gwd@xenproject.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260810095056.29884-2-gwd@xenproject.org>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2029.9152c53835ec1e0f.19fec0f22a8.f9e5d48b8774318a=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786371842728
X-purgate-ID: tlsNG-c1860d/1786371849-CF15E87B-9B6DBEA1/0/0
X-purgate-type: clean
X-purgate-size: 1319

---=Part.2029.9152c53835ec1e0f.19fec0f22a8.f9e5d48b8774318a=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 10:49:43AM +0100, George Dunlap wrote:
> Xen's Kbuild-derived build system records the exact command line used
> to compile each object in =2E<target>=2Eo=2Ecmd files=2E  That is everyt=
hing
> needed to produce a compile_commands=2Ejson compilation database, the
> format clangd and other tooling consume to provide accurate
> cross-referencing (go to definition, find references, call hierarchy)
> in LSP-capable editors=2E
>=20
> Import scripts/clang-tools/gen_compile_commands=2Epy from the Linux
> kernel, unmodified, so that the provenance of the code is easy to
> verify (commit 90efe2b9119f, Linux v6=2E16)=2E
>=20
> As-is the script produces an empty database on a Xen tree, since
> Xen's compile command lines differ slightly from Linux's; the
> following patch adapts it=2E
>=20
> Assisted-by: LLM
> Signed-off-by: George Dunlap <gwd@xenproject=2Eorg>

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.2029.9152c53835ec1e0f.19fec0f22a8.f9e5d48b8774318a=---

