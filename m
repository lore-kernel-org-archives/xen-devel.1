Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C35BCA5FDD
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 15:27:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439231.1657627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCfAm-0007IM-Bb; Fri, 02 Oct 2026 15:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439231.1657627; Fri, 02 Oct 2026 15:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCfAm-0007IF-7m; Fri, 02 Oct 2026 15:27:44 +0000
Received: by outflank-mailman (input) for mailman id 1439231;
 Fri, 02 Oct 2026 15:27:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0fd3a548c0003f66@swg.vates.tech>)
 id 1xCfAk-0007I3-Rh
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 15:27:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCfAf-000RSx-8Q
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:27:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0fd3a548c0003f66@swg.vates.tech>)
 id 6abfcd5c-8faa-0a2a0a5109dd-0a2a4501c8ae-18
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 17:27:37 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0fd3a548c0003f66@swg.vates.tech>)
 id 6abfcd68-5984-0a2a45010019-b9ff1c129db3-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 17:27:37 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0fd3a548c0003f66.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 02 Oct 2026 15:27:33 +0000
Received: from l14 (82-67-99-167.subs.proxad.net [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id B5D66809C6;
 Fri,  2 Oct 2026 17:27:32 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=2k2CxDwV8XUNeG+VQjpahB/T6ktUfINrt+l/Gepot4s=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=DRd5ra/pGQP6CHB/OaSTO/2a39jyDfPC4qz9/K20qhD7rwB7qkYu98rW61f+lxACKm0pNokH9
 9WmugjOGhl+/LR4Q69MNKbEiFBgphkODECeClAi+D3mYZRqkZs+icCZEi5q1UvDOQhJixJs8DB2
 hSGoqblgkticvOuc5iUjdK7LtPYQHeoYGpsPIyU1PyHDWK0TgkpSURQefkQUaVXqyxYiLYr78Ya
 AhkGfC9Z6qSgTySgAwUaLdbxbT6lPo0vsn42nd3Djx06L4bEbCqBAMgd4d720WDJ44TBZJLIZkZ
 WLFcG1rrnzxJytE8ls77l7FlRxAYYyOXvyjn6MgGBcUw==
X-Zone-Loop: b76e80e7d30525a47f22f36fcd7c2a3e8cbe5bc5bfa9
x-campaign-type: default
x-transaction-id: 13cc0e9a-0031-462d-b6f0-f1d5554a8803
x-swg-uid: 01-1f51c301-c5a2-46ed-b2ef-08ff477a4ffc
X-Mailer: Sweego
Message-ID:
 <1790954853.8631fc262581453bbf619ec5b2062170.1a0fd3a548c0003f66@vates.tech>
x-swg-bid: 1790954853.8631fc262581453bbf619ec5b2062170.1a0fd3a548c0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 2 Oct 2026 17:27:32 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: James Dingwall <james-xen@dingwall.me.uk>
Cc: xen-devel@lists.xenproject.org, James Dingwall <james@dingwall.me.uk>
Subject: Re: [PATCH 2/2] tools/hotplug: validate mtu read from xenstore
 against RFC 791 minimum
References: <20260814060441.923061-1-james-xen@dingwall.me.uk>
 <20260814060441.923061-3-james-xen@dingwall.me.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260814060441.923061-3-james-xen@dingwall.me.uk>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.5eb.10b6ee2fe678b154.1a0fd3a51ed.9f1557c3373a6e0e=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790954852846
X-purgate-ID: tlsNG-d62444/1790954857-BF46D757-A9AA61C5/0/0
X-purgate-type: clean
X-purgate-size: 1181

---=Part.5eb.10b6ee2fe678b154.1a0fd3a51ed.9f1557c3373a6e0e=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 07:03:51AM +0100, James Dingwall wrote:
> From: James Dingwall <james@dingwall=2Eme=2Euk>
>=20
> RFC 791 sets the minimum acceptable mtu to 68:
>=20
>     Every internet module must be able to forward a datagram of 68
>     octets without further fragmentation=2E  This is because an internet
>     header may be up to 60 octets, and the minimum fragment is 8 octets=
=2E
>=20
> In the Linux kernel source:
>=20
> include/net/ip=2Eh:#define IPV4_MIN_MTU           68              /* RFC=
 791 */
>=20
> While there is no reason to expect a value <68 to be read from xenstore =
or
> from the bridge make the value test require a number >=3D this minimum=
=2E
>=20
> Signed-off-by: James Dingwall <james@dingwall=2Eme=2Euk>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.5eb.10b6ee2fe678b154.1a0fd3a51ed.9f1557c3373a6e0e=---

