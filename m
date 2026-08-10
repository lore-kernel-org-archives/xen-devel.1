Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13576C5AE49
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 13:45:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387494.1628753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQJx-0007zm-94; Mon, 10 Aug 2026 13:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387494.1628753; Mon, 10 Aug 2026 13:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQJx-0007zf-5s; Mon, 10 Aug 2026 13:45:41 +0000
Received: by outflank-mailman (input) for mailman id 1387494;
 Mon, 10 Aug 2026 13:45:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wtQJw-0007zF-9z
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 13:45:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtQJu-00BJvF-Tf
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 15:45:38 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19febebe536000e099@swg.vates.tech>)
 id 6a79d5ea-e002-0a2a0a5209dd-0a2a45029048-40
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 15:45:38 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19febebe536000e099@swg.vates.tech>)
 id 6a79d602-6ca4-0a2a45020019-b9ff1c12a695-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 15:45:38 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19febebe536000e099.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 13:45:33 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7B54581C91;
 Mon, 10 Aug 2026 15:45:32 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=AuvJ46ZXsKaVPL6J4UJsdpNDRwM9r7zXEul3tg/qrhg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=QiO85++4v8Y0lcf+26gHwHqOOxEpKOzB7Tel7kFHD1MMG0uvKBigYgOBre1qR8Vecc7GOC09b
 l2WgyirxCAy1JA63gF2PDn2MoOC5YSvv0nMCypjYg+zCCWZtjJdmKSjDB6CpAMWrdqGyNGgb53a
 QAnroT+JUJiv/uxHawaJ2hga2kOYehIQejhO/1KIb7Q/Yqpwn/lRkYSsqCLTbJ/FLOLCo1uZob7
 2VMvgGHEUF85fATItRcN7zB6PrshPwb5XEWEIfN5i9e/PkqOqw9J5KhuV7Kv+qH6aEwXe2g14xo
 HkFEs5u4RtuOakboWPLUL0H6/Z8+pIqVMRoRO3NZbqGA==
X-Zone-Loop: 2ad11547e23e446bcfd583493630f987771b4a341e0e
x-campaign-type: default
x-transaction-id: 49d14ca0-9328-4204-9a9d-4a365047c0a7
x-swg-uid: 01-f33560e1-6228-48de-99f9-2e09ee78e2bb
X-Mailer: Sweego
Message-ID:
 <1786369533.8631fc262581453bbf619ec5b2062170.19febebe536000e099@vates.tech>
x-swg-bid: 1786369533.8631fc262581453bbf619ec5b2062170.19febebe536000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Subject: Re: [PATCH v1 03/17] xen/riscv: add missing APLIC register
 offsets, masks to asm/aplic.h
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <ee3825adfd0012437a594f6a0e51c6ee71175cc4.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <ee3825adfd0012437a594f6a0e51c6ee71175cc4.1784560663.git.oleksii.kurochko@gmail.com>
Date: Mon, 10 Aug 2026 15:45:23 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786369532; l=932;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=cyL2Gx4dqiwndaPOMigFbRN7tCrMS1O7Fo6s0xPhDnk=;
 b=O4qqs96ENfYIcotiry1NxIU6yitbUjcvnH+bbR4hn57vCMEXo+h6u+P02qXTVknyUCZ4PNlf1
 f99f2rx/kAJDK8gMmYGSLZvi+Yx7MLS+v4lote35pS5mg5qDDysYWkk
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2018.943d49f9532550e2.19febebe324.69f557a2f31343bb=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786369532709
X-purgate-ID: tlsNG-720697/1786369538-31FD62AC-03C5A3EB/10/73395122804
X-purgate-type: spam
X-purgate-size: 1317

---=Part.2018.943d49f9532550e2.19febebe324.69f557a2f31343bb=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> These definitions are required for correct decoding of APLIC MMIO
> accesses and target configuration, and will be used by both the
> physical and virtual APLIC implementations=2E
>=20
> No functional change is intended by this patch; it only centralises
> hardware definitions that were previously missing=2E
>=20
> Co-developed-by: Romain Caritey <Romain=2ECaritey@microchip=2Ecom>
> Signed-off-by: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>
>
> diff --git a/xen/arch/riscv/include/asm/aplic=2Eh b/xen/arch/riscv/inclu=
de/asm/aplic=2Eh
> index 07318aaac2=2E=2Ef22622b9a2 100644
> --- a/xen/arch/riscv/include/asm/aplic=2Eh
> +++ b/xen/arch/riscv/include/asm/aplic=2Eh
> @@ -15,6 +15,8 @@
> =20
>  #include <asm/imsic=2Eh>
> =20
> +#define APLIC_REG_OFFSET_MASK   0x3fff

_REG stands for memory-mapped control "region" as explained in spec? If
yes, it'd be better to add a comment=2E

--=20
Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>


-- 
Baptiste Le Duc | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates =
solutions

web: https://vates=2Etech
---=Part.2018.943d49f9532550e2.19febebe324.69f557a2f31343bb=---

