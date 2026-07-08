Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0ACC43458
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2026 13:32:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1357023.1611525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whSOF-0000lO-TB; Wed, 08 Jul 2026 13:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357023.1611525; Wed, 08 Jul 2026 13:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whSOF-0000lH-QV; Wed, 08 Jul 2026 13:32:39 +0000
Received: by outflank-mailman (input) for mailman id 1357023;
 Wed, 08 Jul 2026 13:32:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f41ee18a900080a8@swg.vates.tech>)
 id 1whSOE-0000je-An
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 13:32:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whSOC-000Ejg-Dy
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 15:32:36 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f41ee18a900080a8@swg.vates.tech>)
 id 6a4e5173-e002-0a2a0a5209dd-0a2a45069be2-2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 15:32:36 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f41ee18a900080a8@swg.vates.tech>)
 id 6a4e5174-08de-0a2a45060019-b9ff1c22b5fb-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 15:32:36 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f41ee18a900080a8.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jul 2026 13:32:30 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 054DE81BDC;
 Wed,  8 Jul 2026 15:32:30 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=lwprljWpAL9XwQDrgQYJo+K0sTuIaFUdgrK61jVIciE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=UKeMan9ZnSUrSC5kPoSX+cBnNo2NHRyqi/mDL66Y6vezPIi8Dr7UvMgYV7fjiFuGPC0r5d44U
 ORKNzVirJ4YK1G7vSZP6NLV/oEqyqiTE9wYCFhLnjA21GwlaOMglREJEF9/VVLIvim0QRXhVIjD
 C/RN+ZLsoZhochToVDGhaH2R32aF4qo2kY8mSQzDjWlEIekcKTNl+Fbt5KeJ/ouxXONvih443F5
 E3tKyLa1DDh6ZavX2YuGsiH73eeGD7C2f96YpMKM01u4QUiTmM93GFyb/SDpi2c9IRbXokEnnjt
 11rnCvWMtkMZJP28d187TZaUlGxFAwrH6ryXzTPL0lMg==
X-Zone-Loop: 63986184987d4ee0469d48294fbf68cef20c51bfec42
x-campaign-type: default
x-transaction-id: d6a57b06-b26d-4808-8dc9-e18df09e0bb8
x-swg-uid: 01-ca262856-3906-4d03-ba17-837789a3c35d
X-Mailer: Sweego
Message-ID:
 <1783517550.8631fc262581453bbf619ec5b2062170.19f41ee18a900080a8@vates.tech>
x-swg-bid: 1783517550.8631fc262581453bbf619ec5b2062170.19f41ee18a900080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 8 Jul 2026 15:32:29 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 10/16] libs/guest: add xg_foreignmemory_copy_{from,to}
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-11-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260619130501.272832-11-frediano.ziglio@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.429.52a10174ab0eed38.19f41ee1656.7d4ce702aa90c69c=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783517550167
X-purgate-ID: tlsNG-16d1c6/1783517556-4392B68D-C9D501F8/0/0
X-purgate-type: clean
X-purgate-size: 1032

---=Part.429.52a10174ab0eed38.19f41ee1656.7d4ce702aa90c69c=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 02:04:55PM +0100, Frediano Ziglio wrote:
> This change prepare code to use a new "foreign copy" hypercall=2E
> The new hypercall will copy memory from/to a foreign domain=2E
> The new hypercall can be emulated with a sequence of:
> - map foreign memory;
> - copy memory;
> - unmap foreign memory=2E

I don't understand the point of this patch=2E The hypercall doesn't exist
so there's nothing to emulate=2E

I've notice there's a patch later in the series which introduce a new
hypercall, but the changes to the library should come after the
hypercall is been introduced, only then can we check if the emulation is
correct, or even needed=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.429.52a10174ab0eed38.19f41ee1656.7d4ce702aa90c69c=---

