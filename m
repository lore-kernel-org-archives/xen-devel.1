Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C6C606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=QosfNQxS
Received: from list by lists.xenproject.org with outflank-mailman.1500479.1696622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVWa3-0001rf-2J; Mon, 23 Nov 2026 16:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500479.1696622; Mon, 23 Nov 2026 16:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVWa2-0001rY-Vg; Mon, 23 Nov 2026 16:07:46 +0000
Received: by outflank-mailman (input) for mailman id 1500479;
 Mon, 23 Nov 2026 16:07:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVWa0-0001rS-QX
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 16:07:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVWa0-00DDll-1P
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 17:07:44 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20929b8bf0001cf5@swg.vates.tech>)
 id 6b0464b8-8faa-0a2a0a5109dd-0a2a4504b1da-42
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 17:07:43 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20929b8bf0001cf5@swg.vates.tech>)
 id 6b0464cf-b57f-0a2a45040019-b9ff1c22ab05-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 17:07:43 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a20929b8bf0001cf5.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 23 Nov 2026 16:07:38 +0000
Received: from localhost.localdomain
 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0C161832B3;
 Mon, 23 Nov 2026 17:07:38 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=9UBICFJ2g9ORC/JRx3y76O2m5PT8ANf1Y7MijYQDbIQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=QosfNQxSygSrnJvv5mwZraLJNhrElA7xFh2DQHMGbvBPkBv/2v2ZJvfMteAjgMCCWA12mhT/g
 OscmmfNsHADuSPXn8xlTV/nmt0rO9+9MROFy3JuVBHKBBS83h1RXoO9BQc4M0JaCd8smaBsZbtz
 YHrrMbP/PwLNR91z0SoEsLa6bfaCvrOios47lAStMD+lBYw1buoE7tmB/qsaBhjXfm5tYm6oSlY
 cY8IwKEqh0lmL9deHuCbUzklvJqvWVU+/hYmwxCUfEfc9/rKeXSINWr/R/HEJY6WlejQXA+LmxR
 v3nc+EGQgXkF8XhBMXBjy/Z/gJqFAB9nRVaqE+YFbHPQ==
X-Zone-Loop: 757ceea6af65c27bc5528126ccc0404201ee8a03c7e1
x-campaign-type: default
x-transaction-id: 97f07a60-66ca-4b4e-b5a7-9d30172237ed
x-swg-uid: 01-c0670e04-3621-436d-833a-f56ac9f637ad
X-Mailer: Sweego
Message-ID:
 <1795450059.8631fc262581453bbf619ec5b2062170.1a20929b8bf0001cf5@vates.tech>
x-swg-bid: 1795450059.8631fc262581453bbf619ec5b2062170.1a20929b8bf0001cf5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] libxl: simplify and correct domain ID and CPU pool ID
 parsing
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 msd-xenproject.org@msd.im
In-Reply-To: <d2cbd116-875b-4441-9338-9788cd72e5dd@suse.com>
References: <d2cbd116-875b-4441-9338-9788cd72e5dd@suse.com>
Date: Mon, 23 Nov 2026 17:06:37 +0100
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.c2.d65ee868ae99a114.1a20929b5a4.afe58ef7319a6e7a=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795450058149
X-purgate-ID: tlsNG-ebf023/1795450063-53AC0B50-9DFE2348/10/78276251493
X-purgate-type: spam
X-purgate-size: 921
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.c2.d65ee868ae99a114.1a20929b5a4.afe58ef7319a6e7a=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Tue, 27 Oct 2026 17:00:24 +0100, Jan Beulich <jbeulich@suse=2Ecom> wrot=
e:
> strtoul(), with a radix of 10, already guarantees that the string parsed
> consists of just digits (and leading whitespace)=2E No need to do that c=
heck
> in advance=2E All which needs doing is a check for a leading digit, to
> exclude the case of leading whitespace=2E
>=20
> This in particular avoids a domain ID argument of "" to be mis-treated a=
s
> a reference to Dom0=2E
>=20
> [=2E=2E=2E]

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,
--=20


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech

---=Part.c2.d65ee868ae99a114.1a20929b5a4.afe58ef7319a6e7a=---

