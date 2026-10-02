Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16645CA5FC4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 15:26:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439227.1657618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCf8y-0006fs-27; Fri, 02 Oct 2026 15:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439227.1657618; Fri, 02 Oct 2026 15:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCf8x-0006fl-Tc; Fri, 02 Oct 2026 15:25:51 +0000
Received: by outflank-mailman (input) for mailman id 1439227;
 Fri, 02 Oct 2026 15:25:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0fd38b9b90003f66@swg.vates.tech>)
 id 1xCf8w-0006ff-S5
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 15:25:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCf8v-00CE8K-R8
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:25:49 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0fd38b9b90003f66@swg.vates.tech>)
 id 6abfcce5-2eae-0a2a0a5409dd-0a2a45098d08-38
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 17:25:49 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0fd38b9b90003f66@swg.vates.tech>)
 id 6abfccfd-be1a-0a2a45090019-b9ff1c2294f7-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 17:25:49 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0fd38b9b90003f66.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 02 Oct 2026 15:25:48 +0000
Received: from l14 (82-67-99-167.subs.proxad.net [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9005D8229D;
 Fri,  2 Oct 2026 17:25:47 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=xMRGVFoWsIF6udNRmRcfQY2eHJeK51vcukcVIkpw8D0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=eB1nA1cB4bdeFGot3prYx9fbG3rA+qdeJtXzZOghYnvRVkFPqkkibSMJTyDDnQ+H/T8KKQcMl
 a1RlKBEhrldU0QNDjUtwtTrqfkhi2xNoAC8uT9QK+VZDfbm82zyt5Y0LBSOvLdsR95UwJ/XkphR
 UtQ5Q9zPdiVT9DCfbZA/eMQT1vuYiIycNOWS5R8D1osf8nJDVonFDdpwTIcqd+Fo7dZpGXWGUNb
 +MCjz20CEgUhygzW9Kozefb+ncV2V+d7OQqbziqCDKxdjXhJKroTWUZIcvDbVqWhdawFf4n6pNA
 Bllmx6yy9ceLpjUhZwLnBTIvhVoZ0kIfPyoJ6pJUvSrA==
X-Zone-Loop: 0d05f3949fea57c6d1c89a63ba1c42dd8fab6079a57b
x-campaign-type: default
x-transaction-id: b3b93cce-ef05-425a-95d7-a7cf93909917
x-swg-uid: 01-7c06bb1f-fa6a-4798-9682-d72d7b19ad2c
X-Mailer: Sweego
Message-ID:
 <1790954748.8631fc262581453bbf619ec5b2062170.1a0fd38b9b90003f66@vates.tech>
x-swg-bid: 1790954748.8631fc262581453bbf619ec5b2062170.1a0fd38b9b90003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 2 Oct 2026 17:25:47 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: James Dingwall <james-xen@dingwall.me.uk>
Cc: xen-devel@lists.xenproject.org, James Dingwall <james@dingwall.me.uk>
Subject: Re: [PATCH 1/2] tools/hotplug: fix invalid frontend path for set_mtu
References: <20260814060441.923061-1-james-xen@dingwall.me.uk>
 <20260814060441.923061-2-james-xen@dingwall.me.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260814060441.923061-2-james-xen@dingwall.me.uk>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.5ea.bb9c48ae452a9775.1a0fd38b732.6d117db070233a58=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790954747699
X-purgate-ID: tlsNG-bad1c0/1790954749-3AEDE034-D406BE36/0/0
X-purgate-type: clean
X-purgate-size: 1378

---=Part.5ea.bb9c48ae452a9775.1a0fd38b732.6d117db070233a58=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 07:03:50AM +0100, James Dingwall wrote:
> From: James Dingwall <james@dingwall=2Eme=2Euk>
>=20
> The set_mtu() function of xen-network-common=2Esh currently has this cod=
e:
>=20
>         if [ ${type_if} =3D vif ]
>         then
>             local dev_=3D${dev#vif}
>             local domid=3D${dev_%=2E*}
>             local devid=3D${dev_#*=2E}
>=20
>             local FRONTEND_PATH=3D"/local/domain/$domid/device/vif/$devi=
d"
>=20
>             xenstore_write "$FRONTEND_PATH/mtu" ${mtu}
>         fi
>=20
> This works fine if the device has its default name but if the xen config
> defines the vifname parameter the FRONTEND_PATH is incorrectly construct=
ed=2E
> Learn the frontend path by reading the appropriate value from the backen=
d=2E
>=20
> Also change use of `=2E=2E=2E` to $(=2E=2E=2E) for a consistent style in=
 the script=2E
>=20
> Signed-off-by: James Dingwall <james@dingwall=2Eme=2Euk>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.5ea.bb9c48ae452a9775.1a0fd38b732.6d117db070233a58=---

