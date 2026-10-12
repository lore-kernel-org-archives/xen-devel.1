Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5559CCA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 12:59:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446301.1662400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFct-0006wJ-6F; Mon, 12 Oct 2026 12:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446301.1662400; Mon, 12 Oct 2026 12:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFct-0006wC-3N; Mon, 12 Oct 2026 12:59:35 +0000
Received: by outflank-mailman (input) for mailman id 1446301;
 Mon, 12 Oct 2026 12:59:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a130325e7700080d7@swg.vates.tech>)
 id 1xGFcr-0006w3-Pt
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:59:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGFcr-00EiGp-5J
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 14:59:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a130325e7700080d7@swg.vates.tech>)
 id 6accd9a9-e002-0a2a0a5209dd-0a2a4505d7ca-22
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:59:33 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a130325e7700080d7@swg.vates.tech>)
 id 6accd9b4-4cb1-0a2a45050019-b9ff1c23a69b-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:59:33 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a130325e7700080d7.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 12 Oct 2026 12:59:29 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1F1BA82A2E;
 Mon, 12 Oct 2026 14:59:29 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=ALpgLwBmyST4wwta0BdWWvLh0x8Z6fccFcXa4ymz0Es=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=gsiR0hf40NZEEkpvJk146z2NIZwWr4atyYnn25ly40d1kYXWgALu8n8grYpaRSPe1X2ZAwnA+
 al9IUEzdTUHXVM+m47lZhDc1jvYca3ORRczJOaxbZTJ6ob3gGczE1w5iZhaEKRfSin3alwbYSqE
 xH5R6ptLY6bq/Qd7mY4eEkPDASJuG3beVo99f4nKVfFNmkcfNQwHaqVkGbuO3TAaFF708bn0PFR
 2o6mWylUKY0lLyOOtLEruEnjOO2gXg8nJrO1Qyo6jceu1Kj1SaFXiZlRKnoRVP/cV3BjU6wXtsp
 exahnxR+QZS5TmsbrKOdd6xneijEVCnhJolGiX22OHig==
X-Zone-Loop: a3bb09e2f04204f9c9e7fc880f077833f4dc4488ce26
x-campaign-type: default
x-transaction-id: 77c76d5b-63a2-4e13-89d1-ad559541ece1
x-swg-uid: 01-4804db62-a1a2-4efb-bd0f-37a6963fe0de
X-Mailer: Sweego
Message-ID:
 <1791809969.8631fc262581453bbf619ec5b2062170.1a130325e7700080d7@vates.tech>
x-swg-bid: 1791809969.8631fc262581453bbf619ec5b2062170.1a130325e7700080d7
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 12 Oct 2026 14:59:28 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Olivier Lambert <olivier.lambert@vates.tech>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/libxenstat: don't lose all VIFs when dom0 has no
 Linux bridge
References: <1791011886.8631fc262581453bbf619ec5b2062170.1a100a0936a0003f66@vates.tech>
 <e3bbade6-da37-45f0-a6ec-19aebbc6c2a7@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3bbade6-da37-45f0-a6ec-19aebbc6c2a7@amd.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.f9.12ee6d52d261336f.1a130325c41.26f1a35d09122b8b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791809969218
X-purgate-ID: tlsNG-c201ff/1791809973-2491C2A1-2736C31C/0/0
X-purgate-type: clean
X-purgate-size: 1605

---=Part.f9.12ee6d52d261336f.1a130325c41.26f1a35d09122b8b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2026 at 04:49:43PM -0400, Jason Andryuk wrote:
> On 2026-10-03 03:17, Olivier Lambert wrote:
> > xenstat_collect_networks() looks for a Linux bridge (a
> > /sys/class/net/*/bridge directory) so that, with bonding, dom0 can be
> > given the bridge's counters=2E When there is none, as on hosts using O=
pen
> > vSwitch (the XCP-ng default), routed networking or only libvirt's
> > virbr0 (which is excluded on purpose), getBridge() leaves devBridge
> > empty=2E strstr(iface, "") then matches every interface, and devNoBrid=
ge
> > is just "p", so every VIF with a standard name (vifN=2EM, vifN=2EM-emu=
)
> > takes the bridge branch instead of being attached to its domain=2E Eve=
ry
> > domain ends up with zero networks, and xentop shows NETS 0=2E
> >=20
> > Only take the bridge branch when a bridge was actually found=2E
> >=20
> > Fixes: 1fd93d4f8cb8 ("xenstat: Linux dom0 statistics for case we use n=
etwork bonding")
> > Assisted-by: Claude-Code:claude-opus-5-5
> > Signed-off-by: Olivier Lambert <olivier=2Elambert@vates=2Etech>
>=20
> Tested-by: Jason Andryuk <jason=2Eandryuk@amd=2Ecom>
> Reviewed-by: Jason Andryuk <jason=2Eandryuk@amd=2Ecom>

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.f9.12ee6d52d261336f.1a130325c41.26f1a35d09122b8b=---

