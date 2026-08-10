Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87A5C5B56A
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 14:24:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387525.1628797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQvc-0007y7-S9; Mon, 10 Aug 2026 14:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387525.1628797; Mon, 10 Aug 2026 14:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQvc-0007xz-PS; Mon, 10 Aug 2026 14:24:36 +0000
Received: by outflank-mailman (input) for mailman id 1387525;
 Mon, 10 Aug 2026 14:24:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec0f92fc000e099@swg.vates.tech>)
 id 1wtQva-0007up-NE
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 14:24:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtQva-008vjl-2h
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 16:24:34 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec0f92fc000e099@swg.vates.tech>)
 id 6a79df15-2eae-0a2a0a5409dd-0a2a4507c85c-46
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 16:24:33 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec0f92fc000e099@swg.vates.tech>)
 id 6a79df21-b4ea-0a2a45070019-b9ff1c12b527-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 16:24:33 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fec0f92fc000e099.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 14:24:31 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id E2C7183723;
 Mon, 10 Aug 2026 16:24:30 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=ipFeHvE57IAsAWSsNWzZuqCIDNnFW9Ndjb+yWQWlc1U=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=DBweDEdn4CifiahFKFPNlF+TeE3vA4Mpbhwla78HlQzT8f76yrRsRlKXJOZnpRPyBQnzON+6S
 odtufhIQdC8vr9xtI6jJW1T6WFuAqKLahEDbunaZcFXEfM6XYMGRF+avGHcQC8b3l1PmSFCeLlJ
 4s1UlWDY9fcHFhtZbSd/Lt0GsPGr3T+RuJqI+tg/LrV+8Dk3IqGPYTJ1z+j2PUU6tGY6nA5/hlS
 W4qK1KDTjuKiJc0lPVpTEhvDHvF8dS9fo6hicW7st+H+wW/qYvIbf4PdkkazDFrFlSWJ0p0Glis
 EcO4eXxcbk7pcud0Uz8Z133n5JhH/bZ+Tq2OsHXCkApw==
X-Zone-Loop: c68e55a2f3f3038df9810e67bca596aaae5f8543d083
x-campaign-type: default
x-transaction-id: f23847f2-c3a6-4677-b231-080ca9acecf4
x-swg-uid: 01-58a8410e-2e16-4d41-ad90-e7d6de06d9dc
X-Mailer: Sweego
Message-ID:
 <1786371871.8631fc262581453bbf619ec5b2062170.19fec0f92fc000e099@vates.tech>
x-swg-bid: 1786371871.8631fc262581453bbf619ec5b2062170.19fec0f92fc000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 10 Aug 2026 16:24:30 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 3/3] build: add compile_commands.json target
References: <20260810095056.29884-1-gwd@xenproject.org>
 <20260810095056.29884-4-gwd@xenproject.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260810095056.29884-4-gwd@xenproject.org>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.202b.b5ca387bdc25a7b2.19fec0f914f.d3edfe96f7118aa8=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786371871055
X-purgate-ID: tlsNG-ef75cf/1786371873-374D3AE4-9C644EFB/0/0
X-purgate-type: clean
X-purgate-size: 1441

---=Part.202b.b5ca387bdc25a7b2.19fec0f914f.d3edfe96f7118aa8=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 10:49:45AM +0100, George Dunlap wrote:
> Add a convenience target generating the compilation database from a
> built object tree, alongside the other developer conveniences (tags,
> cscope, cloc -- the last of which already walks the same =2Ecmd files):
>=20
>     make -C xen compile_commands=2Ejson
>=20
> The output lands in the object tree root=2E  For an in-tree build,
> clangd and other consumers discover it there automatically when
> opening files; for an out-of-tree build, symlink it into the source
> tree root (consumers search the ancestors of the file being edited)=2E
>=20
> Note the database records the compiler invocations actually used=2E
> With a clang build it is consumable by clangd as-is; for a gcc build,
> clang-based tools may need a small =2Eclangd configuration
> (CompileFlags: Remove/Add) dropping gcc-only flags=2E
>=20
> Also add the generated file to =2Egitignore=2E
>=20
> Assisted-by: LLM
> Signed-off-by: George Dunlap <gwd@xenproject=2Eorg>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.202b.b5ca387bdc25a7b2.19fec0f914f.d3edfe96f7118aa8=---

