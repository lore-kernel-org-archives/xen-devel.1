Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1505FCCA462
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 09:14:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451449.1666544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHe0v-0001Gp-0o; Fri, 16 Oct 2026 09:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451449.1666544; Fri, 16 Oct 2026 09:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHe0u-0001Ge-Tj; Fri, 16 Oct 2026 09:14:08 +0000
Received: by outflank-mailman (input) for mailman id 1451449;
 Fri, 16 Oct 2026 09:14:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143fd56420008425@swg.vates.tech>)
 id 1xHe0t-0001FH-KY
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 09:14:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHe0s-002C2b-Pu
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 11:14:06 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143fd56420008425@swg.vates.tech>)
 id 6ad1ead4-e002-0a2a0a5209dd-0a2a450bd9f0-34
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 11:14:06 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143fd56420008425@swg.vates.tech>)
 id 6ad1eada-b7e8-0a2a450b0019-b9ff1c239c49-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 11:14:03 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a143fd56420008425.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 09:13:58 +0000
Received: from Skynet-1 (lfbn-gre-1-317-75.w90-112.abo.wanadoo.fr
 [90.112.38.75]) (Authenticated sender: olivier.lambert@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1A7B381F66;
 Fri, 16 Oct 2026 11:13:58 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Y0h9d9AY+xO7OoOXqOECfFhCUG+ubXW1o8Wb0q1tvOc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=HrUwzlBuDlhiAlv24hIOlMlqmA9JOgxRglngwKyZIMDuwZcwmOIV9N38VV0gffZo6wXbaHuUH
 BtSidgcj7I0WUIRqsDHSsnaPB3GohU5b9KYpVYKo0B2Psj9NLiAwgeu/+joEo9ZorjGqA3oZEBx
 FXd5Z3medm4dwOe5sHA3Y3iAHy0IHD/UltnCjNqplS0JfOUqR9hss0cXl/q3Mv6/KSH4ReJ6L9w
 nEZAPRaB8b8Wvcs6HwAtsqTREL7o8xlZ6hy7FXlto7B7p40qmr9m1IbxGwC4j77kBjQd5+EXnY2
 +oTLTC6ganBW4JWcYrW+D+m1Ep4B3oCvMC+FJ1dgnXRA==
X-Zone-Loop: a5276eb863d98ce58e6517cb5c60d20ed3ce81d36a17
x-campaign-type: default
x-transaction-id: 2d73006d-be9d-42c9-81b1-6211e7afa71b
x-swg-uid: 01-679be25c-e533-4800-b881-a399e3c6d459
X-Mailer: Sweego
Message-ID:
 <1792142038.8631fc262581453bbf619ec5b2062170.1a143fd56420008425@vates.tech>
x-swg-bid: 1792142038.8631fc262581453bbf619ec5b2062170.1a143fd56420008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Olivier Lambert <olivier.lambert@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 3/3] tools/libxenstat: fix output initialisation in parseNetDevLine()
Date: Fri, 16 Oct 2026 09:12:59 +0000
In-Reply-To: <20261016091259.1254879-1-olivier.lambert@vates.tech>
References: <20261016091259.1254879-1-olivier.lambert@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2a5.af34a560c5939015.1a143fd54a8.db578474bea2f8d3=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792142038185
X-purgate-ID: tlsNG-42698a/1792142043-A8CCF9EA-72B728B3/0/0
X-purgate-type: clean
X-purgate-size: 2086

---=Part.2a5.af34a560c5939015.1a143fd54a8.db578474bea2f8d3=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

parseNetDevLine() zeroes all the outputs it is passed before parsing the
line, but *rxPackets is zeroed twice while *rxMcast isn't zeroed at all,
so it would be left untouched for a line that doesn't parse=2E

Also, iface is cleared with memset(iface, 0, sizeof(*iface)), which only
covers the first byte=2E The function isn't told the buffer size, and an
empty string is all that's needed, so write the terminator directly=2E

No functional change intended: the only caller passes NULL for rxMcast=2E

Assisted-by: Claude-Code:claude-opus-5-5
Signed-off-by: Olivier Lambert <olivier=2Elambert@vates=2Etech>
---
 tools/libs/stat/xenstat_linux=2Ec | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/libs/stat/xenstat_linux=2Ec b/tools/libs/stat/xenstat_l=
inux=2Ec
index 97f7fa9f87=2E=2Eaebd848722 100644
--- a/tools/libs/stat/xenstat_linux=2Ec
+++ b/tools/libs/stat/xenstat_linux=2Ec
@@ -123,7 +123,7 @@ static int parseNetDevLine(char *line, char *iface, un=
signed long long *rxBytes,
=20
 	/* Initialize all variables called has passed as non-NULL to zeros */
 	if (iface !=3D NULL)
-		memset(iface, 0, sizeof(*iface));
+		iface[0] =3D '\0';
 	if (rxBytes !=3D NULL)
 		*rxBytes =3D 0;
 	if (rxPackets !=3D NULL)
@@ -136,10 +136,10 @@ static int parseNetDevLine(char *line, char *iface, =
unsigned long long *rxBytes,
 		*rxFifo =3D 0;
 	if (rxFrames !=3D NULL)
 		*rxFrames =3D 0;
-	if (rxPackets !=3D NULL)
-		*rxPackets =3D 0;
 	if (rxComp !=3D NULL)
 		*rxComp =3D 0;
+	if (rxMcast !=3D NULL)
+		*rxMcast =3D 0;
 	if (txBytes !=3D NULL)
 		*txBytes =3D 0;
 	if (txPackets !=3D NULL)
--=20
2=2E53=2E0



-- 
Olivier Lambert | Vates CEO

XCP-ng & Xen Orchestra - Vates solutions
=
Book a meeting with me: https://calrs=2Evates=2Etech/u/olivier-lambert
web:=
 https://vates=2Etech
---=Part.2a5.af34a560c5939015.1a143fd54a8.db578474bea2f8d3=---

