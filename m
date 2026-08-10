Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C776C5AD55
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 14:52:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387569.1628833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtRLt-0005ha-IH; Mon, 10 Aug 2026 14:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387569.1628833; Mon, 10 Aug 2026 14:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtRLt-0005hT-Ff; Mon, 10 Aug 2026 14:51:45 +0000
Received: by outflank-mailman (input) for mailman id 1387569;
 Mon, 10 Aug 2026 14:51:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec2874e4000e099@swg.vates.tech>)
 id 1wtRLs-0005hN-6B
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 14:51:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtRLr-006Ghm-JO
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 16:51:43 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec2874e4000e099@swg.vates.tech>)
 id 6a79e56c-bab6-0a2a0a5309dd-0a2a4506bcdc-38
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 16:51:43 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec2874e4000e099@swg.vates.tech>)
 id 6a79e57f-195a-0a2a45060019-b9ff1c22a46d-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 16:51:43 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fec2874e4000e099.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 14:51:42 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8D79083700;
 Mon, 10 Aug 2026 16:51:41 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=oh2DgB3SGnmWnc2owIE3IXRTnj2Ospz9Wo6bD61coCI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Yxq0k2NkBG/y6/LnMmUtoLQlYXSzEbNlFcxyWo2V81C4swoHO7E1K1e/ewl0IK+wZvPuzb/87
 5aKTb9qtTBt9+ssfl9/MR1NZFx4/BHMe1eQ73DTZu/rpHDxMgxYiXpSqfeLIarEdI9smRHlAHP0
 qAQzBEcXhmR7U9MHoM3/2POMhwpJcurI5kfM8EpAHneFU1IQ1JMR81A/ZXprYVaIufmn2DEh9qP
 8NTUyczUE/z+Vergwi7OeHFlNTPGhDQGDF+51zxKj1VF/zUWxJCY++9I8n2pRrKJ2oVmxpXO2ln
 fJZ/i0wo8U+PIRluzvEC5klb10qMNxFEevz/M8HzcKwg==
X-Zone-Loop: 7c266bd4a239a061645f15bae85c0dec40ef71421f58
x-campaign-type: default
x-transaction-id: f8fdb848-13b6-4ca6-9b1c-6c2355ef87f4
x-swg-uid: 01-ea7f7148-5ec1-4575-a726-5ff57c40b051
X-Mailer: Sweego
Message-ID:
 <1786373502.8631fc262581453bbf619ec5b2062170.19fec2874e4000e099@vates.tech>
x-swg-bid: 1786373502.8631fc262581453bbf619ec5b2062170.19fec2874e4000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Subject: Re: [PATCH v1 03/17] xen/riscv: add missing APLIC register
 offsets, masks to asm/aplic.h
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <b1e6363b-2012-44fe-9aa9-3d0f049f0b69@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <ee3825adfd0012437a594f6a0e51c6ee71175cc4.1784560663.git.oleksii.kurochko@gmail.com>
 <1786369533.8631fc262581453bbf619ec5b2062170.19febebe536000e099@vates.tech>
 <b1e6363b-2012-44fe-9aa9-3d0f049f0b69@gmail.com>
Date: Mon, 10 Aug 2026 16:51:36 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786373501; l=1226;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=pX3pIsTRAJ2uAndkfmMJyp9wTrk95aLN1X+NZ0w8Kss=;
 b=EaiCKGGunu/86m+j2fMlnTVPNsbjQbBrvKECZnFYfMrCb5ZStVfupaQcICKo6v08UUMPM2aiq
 aM+mRefYqwPA1RKVqZmNr3pXWumVMgLRI8N3JIY3ZYQouTr5YdwZvWp
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.203c.e671b9931e088f51.19fec287342.7804da051366af2a=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786373501762
X-purgate-ID: tlsNG-16d1c6/1786373503-FEA7477B-10D815E7/0/0
X-purgate-type: clean
X-purgate-size: 1642

---=Part.203c.e671b9931e088f51.19fec287342.7804da051366af2a=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-08-10 16:45:23+02:00, Oleksii Kurochko wrote:
> On 8/10/26 3:45 PM, Baptiste Le Duc wrote:
>=20
> >> These definitions are required for correct decoding of APLIC MMIO
> >=20
> > _REG stands for memory-mapped control "region" as explained in spec? I=
f
> > yes, it'd be better to add a comment=2E
>=20
> Yes, it is a mask that allows us to get the offsets for the registers of=
=20
> an interrupt domain=E2=80=99s memory-mapped control region=2E
>=20
> IMO, if the problem is with the name of the macro, it would be better to=
=20
> use a clearer name instead of adding a comment=2E For example,=20
> `APLIC_CTRL_REGION_OFFSET_MASK` sounds self-explanatory to me=2E

I think the rename of the macro is enough=2E
Lets keep this:

#define APLIC_CTRL_REGION_OFFSET_MASK   0x3fff

>=20
> If you=E2=80=99re still not happy with the suggested name and it isn't=
=20
> self-explanatory, then:
>=20
> /*
>   * Offsets of the registers of an interrupt domain's memory-mapped cont=
rol
>   * region, which is APLIC_MIN_SIZE bytes large=2E
>   */
> #define APLIC_CTRL_REGION_OFFSET_MASK   0x3fff
>=20
> Alternatively, I could keep the old name (APLIC_REG_OFFSET_MASK) and use=
=20
> the suggested comment=2E
>=20
> Which option do you prefer?
>=20
> ~ Oleksii




-- 
Baptiste Le Duc | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates =
solutions

web: https://vates=2Etech
---=Part.203c.e671b9931e088f51.19fec287342.7804da051366af2a=---

