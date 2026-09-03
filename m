Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE9FC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:51:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406968.1640138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25y5-0006WK-GO; Thu, 03 Sep 2026 11:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406968.1640138; Thu, 03 Sep 2026 11:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25y5-0006WC-DJ; Thu, 03 Sep 2026 11:50:57 +0000
Received: by outflank-mailman (input) for mailman id 1406968;
 Thu, 03 Sep 2026 11:50:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0671b7c5b000c4f3@swg.vates.tech>)
 id 1x25y3-0006Vy-TD
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:50:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x25y3-003XFz-5z
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:50:55 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0671b7c5b000c4f3@swg.vates.tech>)
 id 6a995f15-bab6-0a2a0a5309dd-0a2a4506bb10-20
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:50:55 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0671b7c5b000c4f3@swg.vates.tech>)
 id 6a995f1e-195a-0a2a45060019-b9ff1c238999-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:50:55 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0671b7c5b000c4f3.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 03 Sep 2026 11:50:49 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id C1B9881F95;
 Thu,  3 Sep 2026 13:50:48 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=+RQ/XWmthdLmQkPy9HZTwrVmSXS++68tbHRKsHJNkLg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=bGgWaiQeb4kkLfpddLMu8979iFc4nBp4lgTRfIeW35g3gtbfEJjOI5hBvNOlI51iC4vj+X725
 +EluBu/9AYBcflDATaJ8viAg4G8Y1PZeHI3XwQlwypNCQU7747apGGhMspaHDaWS9j8q1cEuXTF
 6/QRo3f+Kl1MDwrFKbj8fGfkiIyli4vYrUrTxDVq08ttz0AjLPF1kjZYVOuDyliaBygNtH0sYZM
 R17Bq3WVGVWR1Pl9nHl95MUrpoxCyh+6Mp1N2ZG1a6koHoZzT6N4pJUT6rKaiidHpsKvqmIUZdq
 fjFgSLwx0pjGxVEDha03tuvVcPTHdzlMr49yPvD8AGIg==
X-Zone-Loop: 378df82f4bba589732e22afe7e9644d78d308dcf7369
x-campaign-type: default
x-transaction-id: 919448ec-66e9-4ede-85d4-f82837a12386
x-swg-uid: 01-c3ac608e-5daa-49d1-b384-7e1dbd6496b4
X-Mailer: Sweego
Message-ID:
 <1788436249.8631fc262581453bbf619ec5b2062170.1a0671b7c5b000c4f3@vates.tech>
x-swg-bid: 1788436249.8631fc262581453bbf619ec5b2062170.1a0671b7c5b000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 3 Sep 2026 13:50:48 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH v2 4/7] PPC: split xen-syms linking rule
References: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
 <85bc5cc5-285e-481f-bacd-8421abae169c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85bc5cc5-285e-481f-bacd-8421abae169c@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.34ff.14f69d624b772142.1a0671b795e.b275bbe9bf250f14=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788436248927
X-purgate-ID: tlsNG-16d1c6/1788436255-F580D77B-BFD0852F/0/0
X-purgate-type: clean
X-purgate-size: 1300

---=Part.34ff.14f69d624b772142.1a0671b795e.b275bbe9bf250f14=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 02:01:57PM +0200, Jan Beulich wrote:
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
> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.34ff.14f69d624b772142.1a0671b795e.b275bbe9bf250f14=---

