Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B6EFC0342
	for <xen-devel@archiver.kernel.org>; Thu, 23 Apr 2026 15:03:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1292277.1570787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvaK-0001yA-OU; Thu, 23 Apr 2026 15:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292277.1570787; Thu, 23 Apr 2026 15:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFvaK-0001y3-Kv; Thu, 23 Apr 2026 15:03:20 +0000
Received: by outflank-mailman (input) for mailman id 1292277;
 Thu, 23 Apr 2026 15:03:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbaddd9f8000f373@swg.vates.tech>)
 id 1wFvaJ-0001xx-BO
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 15:03:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFvaI-001I2q-Kf
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 17:03:18 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbaddd9f8000f373@swg.vates.tech>)
 id 69ea34b3-5cb7-0a2a0a5109dd-0a2a4505c416-4
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 17:03:18 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dbaddd9f8000f373@swg.vates.tech>)
 id 69ea34b6-aaa8-0a2a45050019-b9ff1c22807f-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 17:03:18 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dbaddd9f8000f373.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 23 Apr 2026 15:03:14 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 448428756D;
 Thu, 23 Apr 2026 17:03:12 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=u2ZCrL3FKsedINaHM/L0MISkunileTPXOhM7WtGyyCI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=GxUqq3pqEIxr19DoVYDsunJvab8rKl3IEgwhSvufk8DsZb30nKexNHbGYcZgiT9KRiYue3RS9
 wctewyYP+PfriuYmIVGdCpCU7D9LFAOtDxjuQKtDBzDqJJ9VHEz3uFhWH2TTmsMEw97MyDEMzzp
 A9DBXNvxHDvBfduqup/W0S/nnD7brl/qgg3/7UIHam6oiQebu/7ft4hbK5URoIi6z/2JgIQQ07l
 71UQwkMyO3USpqYPi4A932qDaDCbVnCNphb3Qx1JnCfBarrhdMiq04lG34bDTvuptaK8PLKb4X3
 yr070KX2k1Ue9/Jx8oTjT26G4JKvelj6+XqHptTjKVZA==
X-Zone-Loop: e65913d91b9bd9cf5a914c69dd43cca2b55168f4778c
x-campaign-type: default
x-transaction-id: d0af0e29-cfb6-4b71-8d0d-06da5f935818
x-swg-uid: 01-5586f84c-bb51-4f02-9023-2cf5e956083e
X-Mailer: Sweego
Message-ID:
 <1776956594.8631fc262581453bbf619ec5b2062170.19dbaddd9f8000f373@vates.tech>
x-swg-bid: 1776956594.8631fc262581453bbf619ec5b2062170.19dbaddd9f8000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 23 Apr 2026 17:03:12 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools: remove setup_physical_bridge_port() function
References: <abhj_os9fUw0JH1i@mattapan.m5p.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abhj_os9fUw0JH1i@mattapan.m5p.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.274c.307635f7b96b90a8.19dbaddd0db.5c662c9c97ee5fde=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776956592347
X-purgate-ID: tlsNG-c201ff/1776956598-E13A0443-1747D564/0/0
X-purgate-type: clean
X-purgate-size: 897

---=Part.274c.307635f7b96b90a8.19dbaddd0db.5c662c9c97ee5fde=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 01:11:42PM -0700, Elliott Mitchell wrote:
> Only the setup_virtual_bridge_port() function was used=2E  As such merge
> that with _setup_bridge_port() and leave that as the remaining function=
=2E
>=20
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p=2Ecom>

Do you mind if I add the following to the commit message?

    The last user of setup_physical_bridge_port() was removed in
    9fabe55939a8 ("tools/hotplug: Remove network-*")=2E

With that:
Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.274c.307635f7b96b90a8.19dbaddd0db.5c662c9c97ee5fde=---

