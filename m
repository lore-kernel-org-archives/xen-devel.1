Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5759C5AC82
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 10:20:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387316.1628572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtN7F-0001on-0t; Mon, 10 Aug 2026 10:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387316.1628572; Mon, 10 Aug 2026 10:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtN7E-0001og-UP; Mon, 10 Aug 2026 10:20:20 +0000
Received: by outflank-mailman (input) for mailman id 1387316;
 Mon, 10 Aug 2026 10:20:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19feb2ff2f9000e099@swg.vates.tech>)
 id 1wtN7D-0001oZ-6v
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 10:20:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtN7C-00Dzem-De
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 12:20:18 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19feb2ff2f9000e099@swg.vates.tech>)
 id 6a79a5cb-8faa-0a2a0a5109dd-0a2a45048b74-34
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:20:18 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19feb2ff2f9000e099@swg.vates.tech>)
 id 6a79a5e1-b57f-0a2a45040019-b9ff1c2396d3-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:20:18 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19feb2ff2f9000e099.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 10:20:15 +0000
Received: from [192.168.1.61] (155.223.66.37.rev.sfr.net [37.66.223.155])
 (Authenticated sender: ngoc-tu.dinh@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 60F3B81C5E;
 Mon, 10 Aug 2026 12:20:15 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=dwh4fyIqqBY7gZ43AJfLXV5jUYa61S3uFDhcudB0Tfk=;
 h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:references:feedback-id;
 b=YGu7j7qiGvDn7d/nUlypyg4U69Pen65i0Y9F1mJzQjg0Igl8Syhv2Y1oYdEicqoWkGVx4uKUt
 lRTgzYrTwlz7swJRNJTTKQMfDYKBJoHQM0y8HOV+CNtgb/FLGfFLbesI2QREHPwsx3u3gC3/FAa
 oX5xj+diAH7Gyb7DCH6FSLAGtiXLEqIM7hR4mNFsixDvyQtoMIpLnfi3ZID3JiMeXGKE6qbeRP0
 6H1ewuIX8ZfSqp4tNGYvnvx/mGjOdIv38km7p5C9JmMNRIo/eEG8ndciRt8Rltl5WHI0NVwfW6A
 Zl9hcPcQd+waNuNlhaoaCnjCYmypLsvm0JAQjaAf6RDw==
X-Zone-Loop: 3e4d87dda4f87756c6df8b0e14db86ef75f8ee700b9e
x-campaign-type: default
x-transaction-id: 1d10f385-683d-41bf-a44c-f7a4b66d3af9
x-swg-uid: 01-b4e90962-d767-4f93-96db-19a98ff1c15a
X-Mailer: Sweego
Message-ID:
 <1786357216.8631fc262581453bbf619ec5b2062170.19feb2ff2f9000e099@vates.tech>
x-swg-bid: 1786357216.8631fc262581453bbf619ec5b2062170.19feb2ff2f9000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 10 Aug 2026 12:20:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: help Windows PV Drivers and Windows Server 2025
To: "H. Bakker - Hunenet B.V." <h.bakker@hunenet.nl>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <AM9PR05MB7665DF8E88357A35E50C1CA6EDD12@AM9PR05MB7665.eurprd05.prod.outlook.com>
Content-Language: en-US
From: Tu Dinh <ngoc-tu.dinh@vates.tech>
In-Reply-To: <AM9PR05MB7665DF8E88357A35E50C1CA6EDD12@AM9PR05MB7665.eurprd05.prod.outlook.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1fe4.78f79b667744f805.19feb2ff0d7.9ad1b47bc5e7f8fb=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786357215448
X-purgate-ID: tlsNG-ebf023/1786357218-52ECEB50-8C6F1673/0/0
X-purgate-type: clean
X-purgate-size: 1312

---=Part.1fe4.78f79b667744f805.19feb2ff0d7.9ad1b47bc5e7f8fb=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07/08/2026 11:59, H=2E Bakker - Hunenet B=2EV=2E wrote:
> This concerns the installation of the Windows PV Drivers on Windows=20
> Server 2025=2E
>=20
> When running *"dpinst=2Eexe"*, the installation fails with the message=
=20
> *"Install failed"*=2E
>=20
> The affected driver version is:
> *DriverVer=3D07/13/2023,9=2E1=2E0=2E1*
>=20
> I am currently using an older version that works correctly:
> *DriverVer=3D12/05/2019,9=2E0=2E0=2E2*
>=20
> Kind regards, Henry Bakker=2E
>=20

Hello,

Looks like you're trying to install the downloads from the Xen Project=20
website (xenbus=2Etar and related)=2E These downloads are not digitally=20
signed, nor are they kept up-to-date with upstream development=2E You can=
=20
rebuild the drivers from source repos [1] (requires enabling testsigned=20
mode), or download a signed build from downstream distributions=2E

[1] https://xenbits=2Exen=2Eorg/gitweb/?a=3Dproject_list;pf=3Dpvdrivers/wi=
n


-- 
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates =
solutions

web: https://vates=2Etech
---=Part.1fe4.78f79b667744f805.19feb2ff0d7.9ad1b47bc5e7f8fb=---

