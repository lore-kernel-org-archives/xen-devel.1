Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A46CA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 12:33:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446248.1662329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFD7-0008Dp-Ty; Mon, 12 Oct 2026 12:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446248.1662329; Mon, 12 Oct 2026 12:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFD7-0008Di-RJ; Mon, 12 Oct 2026 12:32:57 +0000
Received: by outflank-mailman (input) for mailman id 1446248;
 Mon, 12 Oct 2026 12:32:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1301a072300080d7@swg.vates.tech>)
 id 1xGFD7-0008DW-9C
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:32:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGFD6-006Bfk-MG
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 14:32:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1301a072300080d7@swg.vates.tech>)
 id 6accd370-8faa-0a2a0a5109dd-0a2a4506c066-32
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:32:56 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1301a072300080d7@swg.vates.tech>)
 id 6accd378-195a-0a2a45060019-b9ff1c22a20d-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:32:56 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1301a072300080d7.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 12 Oct 2026 12:32:54 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0F98A80034;
 Mon, 12 Oct 2026 14:32:54 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=TRItMS2pSkRZLCpQz88uDSxTxfgiGW/RRK6HOy1TP4w=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=jT0jTtQqcuB9SnW845bpIdORa4LS73+XIF9N8fiuc24tBFFcFw+otQz7xtroYFbbFEz2SEvFJ
 ksu2quzTZRuCcUp0aphRZasfd76rMG/FO56Lap5aQ5AtlWoTA3TFKcaZakGTFf+nTU226dALNXw
 l6nt31Vvughss9XfquLwpkAWBB2634X25z8mHqCCK6oomrfTSDOraB0+BwFvXdsqHkI6GdeUP1X
 YW2rfYsp54HBYGdLaG7JXV3Ekua6T/HUK46/ObxGeQoctdLSCC2+zUoyMI5HyWtnAmjfwqKXjkf
 8zhICHsCB7A/744dB+H8D7b8n8vwX9ezuUKDX2yybwrw==
X-Zone-Loop: ea6a248fc4df45b76cc64d8f09ac81fe4f22cee01858
x-campaign-type: default
x-transaction-id: 9e6f4687-d3de-4409-92a2-990a0fda0cad
x-swg-uid: 01-0372ff0a-7f7f-4414-8b46-f644ff8fb406
X-Mailer: Sweego
Message-ID:
 <1791808374.8631fc262581453bbf619ec5b2062170.1a1301a072300080d7@vates.tech>
x-swg-bid: 1791808374.8631fc262581453bbf619ec5b2062170.1a1301a072300080d7
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 12 Oct 2026 14:32:53 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Leigh Brown <leigh@solinno.co.uk>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 2/2] tools/examples: Example Linux bridge VLAN config
References: <20240517140506.8460-1-leigh@solinno.co.uk>
 <20240517140506.8460-3-leigh@solinno.co.uk>
 <CAKf6xpsHhe1v1evHOaRE_EBqAnC3vN2URsXkUwTu1dzWXP6BHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKf6xpsHhe1v1evHOaRE_EBqAnC3vN2URsXkUwTu1dzWXP6BHQ@mail.gmail.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.f4.16c921bfbd0a5524.1a1301a057c.ecbb5b2007da3ad3=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791808374140
X-purgate-ID: tlsNG-16d1c6/1791808376-F5C0F77B-171F16B7/0/0
X-purgate-type: clean
X-purgate-size: 939

---=Part.f4.16c921bfbd0a5524.1a1301a057c.ecbb5b2007da3ad3=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, May 19, 2024 at 10:54:25AM -0400, Jason Andryuk wrote:
> On Fri, May 17, 2024 at 10:05=E2=80=AFAM Leigh Brown <leigh@solinno=2Eco=
=2Euk> wrote:
> >
> > Add a new directory linux-bridge-vlan with example files showing
> > how to configure systemd-networkd to support a bridge VLAN
> > configuration=2E
> >
> > Signed-off-by: Leigh Brown <leigh@solinno=2Eco=2Euk>
>=20
> The systemd network config looks like it matches the the systemd man pag=
es, so:
> Reviewed-by: Jason Andryuk <jason=2Eandryuk@amd=2Ecom>

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.f4.16c921bfbd0a5524.1a1301a057c.ecbb5b2007da3ad3=---

