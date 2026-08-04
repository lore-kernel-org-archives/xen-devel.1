Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC702C5518F
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 18:00:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382541.1625890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrJRB-0000Mc-Mp; Tue, 04 Aug 2026 18:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382541.1625890; Tue, 04 Aug 2026 18:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrJRB-0000MV-Jf; Tue, 04 Aug 2026 18:00:25 +0000
Received: by outflank-mailman (input) for mailman id 1382541;
 Tue, 04 Aug 2026 18:00:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <val@invisiblethingslab.com>) id 1wrJR9-0000MP-LW
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 18:00:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrJR8-009Xhk-Un
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 20:00:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <val@invisiblethingslab.com>)
 id 6a7228a7-e002-0a2a0a5209dd-0a2a45089678-28
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 20:00:22 +0200
Received: from [103.168.172.144] (helo=fout-a1-smtp.messagingengine.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <val@invisiblethingslab.com>)
 id 6a7228b5-f659-0a2a45080019-67a8ac90a46b-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 20:00:22 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 05140EC0112;
 Tue,  4 Aug 2026 14:00:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Tue, 04 Aug 2026 14:00:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 14:00:19 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="CC:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="CC:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1785866421; x=1785952821; bh=LDZ2h2Nlf2
	cEyscx9QKZZfWGeO9IVpeAJYTIBjmBdSk=; b=U8B0xEmo3WYf0NSC7WpdFA5egr
	MMRDKsStHQ/i6/6csGQrbcsvIg0k5nXR3j5yKOH94VMhnau75lSx5HwbEMUwY72V
	CtS/M4su/sX6DFTgwBRLVIGBIHOCm1pvydlRPW7SGM3oKGTeaVi4rYT7nWK1+Ig3
	G1WofNG8buKgAb640Qn4ALaTRuTAuVJ8REMHaSZDOQfaSH5FagD1PJcXLQ/nNA2V
	W6jMlgj74SA87tO3AGFZaDiCozR8frj/elKpm93gi21KfL5TmfdPPIZGOwHftqIc
	uv9e4pRugJeVh4GqCCyyg3BUoV3/4Dz3hUlwSw2UTRdq5kGBtTTbVYqqN0Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785866421; x=
	1785952821; bh=LDZ2h2Nlf2cEyscx9QKZZfWGeO9IVpeAJYTIBjmBdSk=; b=D
	UdPhCg0Phe1INlR8RIRVJO+zzXoJhvYpNR1QImC53/SS4hIKbujmXIsDM6cgN9d7
	R3mxMCqjOZwKvk1cRdpEMHR8ZqzbCd36Qwurv6zodpnqLnDd40oVabPhMCWnYFf+
	bdBqjEnvbLSr3X8T5z5W3Hd0/Rmybnpd8UvVPbeWoGk5LdAtUao7E9DoV9Q6uuM2
	dIPX1czvh9pE0iADXbYro5ouJg8od6lXh5uFOP9mHPsmfiqa36h5QpuibgcaXrq0
	TTIypNDASinvzqOpc+OAXdn9K3f9yJkzw44upRVpF+/cwDD8z0zd4LlO2S3tZFBK
	5tY4bpwIzsv/OLSikmcog==
X-ME-Sender: <xms:tChyajvKj3HGorfWZzr7j-uGdm2JK7-2bfjHd3Sacvc0F-NqepT2sA>
    <xme:tChyagcbBgNBLdTfPChPD8CJiD0woC_A3L7VW-brlSaAGywXhLrWEPGPh9cKvVZAQ
    1Yrk7GNLwIUoQmyRczDlfhJE6LG7d2l1c8Iqkp7MmSeBJpaF14>
X-ME-Received: <xmr:tChyao8cGUV_QuEsaP2Gn7cVWNpQVALTBtufgUu1KtMV1MGAh85uDEkWvXMYDdAOy5BiyX98>
X-ME-Proxy-Cause: dmFkZTEy9dbI7dVgmVyTaT5KMPh+I6ZGxOK3AUQTOQS2bIRY0xfX1eIAwzd/CZk9yFoRlO
    Cri2v3V/i1GamfTXF4Mv4XHmUAbgnxwc4BXyQwC+UslzHDz4plo3+nm5ZbJWSR77uA6e+x
    QyOrouw+nm3LsJ+gQ5m2R52NJQCw0vHielvFIhC0lcoQkpiZiVsdAClDG5dL9VTXt+eAQC
    A4lzSc/D45tR8Y5H4pkl73rK6mn6+0ks95z5yk8ssNzEj5Q9q1VvJ+Qj1rzNmhNgFMWZeA
    bKBgaopxeX7O0UrCTf+EADrwtUUR9rjHRxyOIxSMNJ3cL4NkVvRtnLa7Mq4BTBQW4oN2eB
    qqW38IwlcUBx5GF+YZWX1RbS5iQ/h8ZNKLGQb7/vrG07VpH2pTe2xy06c24FxiwGby2sV/
    xC9w0VW5qbbHSDDbo7bo7YIVWGgAhmKzjF9lD94oHrideo3ETE/xX5Ie9YjeOCcGGpYVHJ
    c11oUYpOE9nhCh/bt2kEIVcQaSq41dALy0f1JXwxTvChd2DIgCDYNRm0JwkjVzOTYfldG5
    g1cfdyZWsKiUhgzUM19WGn63AiyfwnckMcz6qx+ujUd2gdEEkV7avQoH+UU5k86T3ZcoNH
    ufBriIRzVnJoofkGLl0+IqtrjH2vv2Yo9OQj1IviIly5yokoSmGI26w8tZfw
X-ME-Proxy: <xmx:tChyajSD4YOfMYzHsLsqoGNJb-BFSdZAq68FlItuAFzHNcoB2kbFNA>
    <xmx:tChyahpq81WSJoXZIZi-geosS_HCbz6MYo_OVGlTDTwJqCbPpygI2g>
    <xmx:tChyaok-fLPCaNdApUfUWf2WZH_RdLmVzwB_Zn2P7BJ7Sop63_Bxww>
    <xmx:tChyaifm4QGvUobBK8dFUJsm_HNZBrbfKA_UEvsl6tQ01tmWM9FH-A>
    <xmx:tShyatOTSDjHa_-fhVEgcKTppK5qb4LXby9zT_TelmPP-VftnGLcRZ28>
Feedback-ID: i001e48d0:Fastmail
Date: Tue, 04 Aug 2026 15:00:13 -0300
From: Val Packett <val@invisiblethingslab.com>
To: Mark Brown <broonie@kernel.org>, Juergen Gross <jgross@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Xen Devel <xen-devel@lists.xenproject.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the xen-tip tree
User-Agent: Thunderbird for Android
In-Reply-To: <anITNOG1qicdE-TI@sirena.org.uk>
References: <anITNOG1qicdE-TI@sirena.org.uk>
Message-ID: <E5B27F21-9507-4801-8765-0A83FD8A316E@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1785866422-D514E87B-CA75770F/0/0
X-purgate-type: clean
X-purgate-size: 709



El 4 de agosto de 2026 1:28:36=E2=80=AFp=2E=C2=A0m=2E ART, Mark Brown <bro=
onie@kernel=2Eorg> escribi=C3=B3:
>Hi all,
>
>After merging the xen-tip tree, today's linux-next build (x86_64
>allmodconfig) failed like this:
>
>ERROR: modpost: "init_mm" [drivers/xen/xen-privcmd=2Eko] undefined!
>
>Caused by commit
>
>  64d26fb2ad1f2 (xen: privcmd: fix ioeventfd crash under PV domain)
>
>I have used the tree from next-20260803 instead=2E

Sorry for the trouble! Did not expect that to get applied so quickly=2E=2E=
 I had noticed recently in my own testing that that patch wasn't actually r=
eady to go in due to the symbol visibility issue, right=2E I'll work on res=
olving it=2E
~val

