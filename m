Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E1DC624D4
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 16:32:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406158.1639568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1nsu-00005G-VA; Wed, 02 Sep 2026 16:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406158.1639568; Wed, 02 Sep 2026 16:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1nsu-000054-Rg; Wed, 02 Sep 2026 16:32:24 +0000
Received: by outflank-mailman (input) for mailman id 1406158;
 Wed, 02 Sep 2026 16:32:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a062f6c8bd000c4f3@swg.vates.tech>)
 id 1x1nss-00004x-SW
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 16:32:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1nsr-00AE0E-Qn
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 18:32:21 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a062f6c8bd000c4f3@swg.vates.tech>)
 id 6a984f88-2eae-0a2a0a5409dd-0a2a450bc9c8-20
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 18:32:21 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a062f6c8bd000c4f3@swg.vates.tech>)
 id 6a984f95-b7e8-0a2a450b0019-b9ff1c129129-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 18:32:21 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a062f6c8bd000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 02 Sep 2026 16:32:15 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 40D1381D64;
 Wed,  2 Sep 2026 18:32:14 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=nNQVaPZ53cy3SQN2iIVBQJOp/DE1cX6lnXjPRbVtl58=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=JtZ/FDtAHv79NyKqrVaqFpABiGNgetMrH8+Ritfl3uxlxE9yi7QyBOJMlc6wyWcS0BnPEGdLp
 ACZuuvQjLs5EJyU0Z+cnrCFrsJvw4BMnOXypW/FASZOivi3s0lWSa5sR2o8dCmGO9JNvRIftlTX
 QaEsuPszypzNefql+g0OL3Zzd+h3/pXxI9xtSatjTcqs32Ye6HHdrJ/emWpTZ44gRJ48XoG8RyV
 +2vIsRt7ZTJ5bdkLQwhw8htXf0n2KiWZH6zS/p73U2NRonGXdWj6EKVQj4YMQdYE44mEqkNc6wJ
 ePiQZM59EfV8yFR/6MBXZGxItXMKXPiv49GV1Z90C+UQ==
X-Zone-Loop: dfdf6fbde1843ed5a1164cbc8f1fcfd69c0983bc46de
x-campaign-type: default
x-transaction-id: ed90e130-2c7a-47fc-9e44-0632fc5aa11d
x-swg-uid: 01-8e635302-73ae-4b2e-be67-b1f44ba2c1a1
X-Mailer: Sweego
Message-ID:
 <1788366735.8631fc262581453bbf619ec5b2062170.1a062f6c8bd000c4f3@vates.tech>
x-swg-bid: 1788366735.8631fc262581453bbf619ec5b2062170.1a062f6c8bd000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 2 Sep 2026 18:32:13 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v2 2/7] Arm: split xen-syms linking rule
References: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
 <483052d4-b70e-4005-8b10-4ecf509bf40a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <483052d4-b70e-4005-8b10-4ecf509bf40a@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3485.2d18154cb0a3e86e.1a062f6c4cb.9be7a3910a02cb0f=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788366734539
X-purgate-ID: tlsNG-42698a/1788366741-194C39EA-E539A174/0/0
X-purgate-type: clean
X-purgate-size: 1931

---=Part.3485.2d18154cb0a3e86e.1a062f6c4cb.9be7a3910a02cb0f=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 02:00:55PM +0200, Jan Beulich wrote:
> Doing so, besides (hopefully) adding clarity (not the least by way of
> [re-]using pattern rules where possible), also avoids explicit recursive
> $(MAKE) invocations=2E
>=20
> By re-using the generic rules introduced when the respective x86 rule wa=
s
> split,
> - the =2Emap file now isn't created after the final binary anymore,
> - --strip-debug is passed to $(LD) during early linking passes (for
>   consistency the option is also explicitly added to the optional linkin=
g
>   pass rule),
> - CONFIG_{SUPPRESS_DUPLICATE_SYMBOL_WARNINGS,ENFORCE_UNIQUE_SYMBOLS} are
>   now properly respected=2E
> Orphan section checking, otoh, is getting suppressed for now, until the
> about a dozen warnings which would result have been taken care of=2E
>=20
> While the 4th linking step continues to be avoided when possible, a
> redundant invocation of $(NM) and tools/symbols (plus the assembling of
> the resulting =2ES file) is hopefully deemed acceptable=2E

So with this patch, if =2Exen-syms=2E1=2Eo and =2Exen-syms=2E2=2Eo are the=
 same
(compare-symbols-tables), we through away =2Exen-syms=2E2=2Eo, and build
=2Exen-syms=2E3=2Eo from =2Exen-syms=2E1 (nm|symbols + as)=2E I guess the =
resulting
=2Exen-syms=2E3=2Eo would be the same as =2Exen-syms=2E2=2Eo, so it's prob=
ably fine=2E


I think this patch is fine, I didn't find other difference in command
executed beside the one described in the patch description:

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.3485.2d18154cb0a3e86e.1a062f6c4cb.9be7a3910a02cb0f=---

