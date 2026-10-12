Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4B3CA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 13:36:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446339.1662447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGBt-0006WE-Pj; Mon, 12 Oct 2026 13:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446339.1662447; Mon, 12 Oct 2026 13:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGBt-0006W7-Kj; Mon, 12 Oct 2026 13:35:45 +0000
Received: by outflank-mailman (input) for mailman id 1446339;
 Mon, 12 Oct 2026 13:35:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13053793100080d7@swg.vates.tech>)
 id 1xGGBs-0006W0-8G
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:35:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGGBq-006NAk-Vx
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 15:35:43 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13053793100080d7@swg.vates.tech>)
 id 6acce22c-2eae-0a2a0a5409dd-0a2a45028e3a-10
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:35:42 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13053793100080d7@swg.vates.tech>)
 id 6acce22e-6ca4-0a2a45020019-b9ff1c23961b-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:35:42 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13053793100080d7.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 12 Oct 2026 13:35:39 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8041582A96;
 Mon, 12 Oct 2026 15:35:38 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Y65q1HDGpq+Awp/6IP3p7ukxpLUb7B0aWyCpKMQZG1M=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=HRMEzxSa7Z44jrj/HXZPJD7DcjD0nemjwMTCHNB1QiHTuKuuBHiXTdM3zzSiYfLUJGhZ14Xu1
 w16+WZ/AYID9zKTpIz1GG9AjdFuDebtmePylSHiaa7cXj3XG0ZLChsS6mBaboa1SM6D0Hg9tR8B
 aBlnqZ4uiKpjK40/SKdc0EXqw/XLxvYNDs7Wy8fiEsB177wya1CSkSx7pI8xS6C260qaIfDa9x+
 ISbrOx+ZIUp7/UBagcH/9ZDxOwa9XqdjZxGeBegNoyQdUB3fRnpVl2bqU0Yszjl7pK/sSwSKqDJ
 xaMi50qtP3q7IPiSom6AXdOdwXIm+zbpLszRjf7Pc1Aw==
X-Zone-Loop: 6042c7b0bc1fce8ea1e725b98d9d74ca3d3b676f268c
x-campaign-type: default
x-transaction-id: 16b9a213-4e0b-4ab8-98ee-aa9ac050bdbc
x-swg-uid: 01-ab7f1dbc-cd2d-46b4-92e0-c5b054c5bd53
X-Mailer: Sweego
Message-ID:
 <1791812139.8631fc262581453bbf619ec5b2062170.1a13053793100080d7@vates.tech>
x-swg-bid: 1791812139.8631fc262581453bbf619ec5b2062170.1a13053793100080d7
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 12 Oct 2026 15:35:38 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Andrew Mbugua <andrewprecious388@gmail.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] tools/console/daemon: fix log_dir memory leak in
 xenconsoled
References: <20260813212724.2607832-1-andrewprecious388@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260813212724.2607832-1-andrewprecious388@gmail.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.fe.c59c22f6307d81e.1a130537656.7743c531264b367d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791812138583
X-purgate-ID: tlsNG-720697/1791812142-30BC02AC-4278E72E/0/0
X-purgate-type: clean
X-purgate-size: 1523

---=Part.fe.c59c22f6307d81e.1a130537656.7743c531264b367d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 12:27:23AM +0300, Andrew Mbugua wrote:
> Valgrind reports that 21 bytes are "still reachable" from the (XEN_LOG_D=
IR "/console") allocation:
>=20
> HEAP SUMMARY:
>     in use at exit: 21 bytes in 1 blocks
>     total heap usage: 9 allocs, 8 frees, 4,799 bytes allocated
>=20
> Since the dynamic memory allocation for the default log directory path h=
appens before the process
> forks into the background, the parent and intermediate processes exit du=
ring daemonize()
> with the memory still reachable=2E
>=20
> Move the strdup() allocation down below the daemonize() block=2E This en=
sures only the final
> background daemon allocates the default path, matching the lifetime of t=
he free(log_dir)
> cleanup loop at the exit of main()=2E
>=20
> With this change, Valgrind reports a clean heap summary
>=20
> HEAP SUMMARY:
>     in use at exit: 0 bytes in 0 blocks
>     total heap usage: 8 allocs, 8 frees, 4,778 bytes allocated
>=20
> Signed-off-by: Andrew Mbugua <andrewprecious388@gmail=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

I'll try to remember to fix the indentation on commit=2E

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.fe.c59c22f6307d81e.1a130537656.7743c531264b367d=---

