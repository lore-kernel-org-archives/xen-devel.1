Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ABACCA462
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 09:14:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451448.1666536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHe0q-00010e-OA; Fri, 16 Oct 2026 09:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451448.1666536; Fri, 16 Oct 2026 09:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHe0q-00010V-L0; Fri, 16 Oct 2026 09:14:04 +0000
Received: by outflank-mailman (input) for mailman id 1451448;
 Fri, 16 Oct 2026 09:14:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143fd533b0008425@swg.vates.tech>)
 id 1xHe0o-0000ar-Hq
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 09:14:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHe0n-005NV2-Nf
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 11:14:01 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143fd533b0008425@swg.vates.tech>)
 id 6ad1ead3-2eae-0a2a0a5409dd-0a2a45038dea-40
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 11:14:01 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143fd533b0008425@swg.vates.tech>)
 id 6ad1ead9-fae8-0a2a45030019-b9ff1c12acc3-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 11:14:01 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a143fd533b0008425.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 09:13:57 +0000
Received: from Skynet-1 (lfbn-gre-1-317-75.w90-112.abo.wanadoo.fr
 [90.112.38.75]) (Authenticated sender: olivier.lambert@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5125A81F66;
 Fri, 16 Oct 2026 11:13:57 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=uhYnNuNkdI4OVcGYhDCwMvk+pCB6XSQQyZ18S7eQuTY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=KvHp9D7iOpDutFW0Vs+qrjj8acKihyjdVrFFDX1VzHN2UBrcod29LHEEtSL7HjY/GgtYHu5tj
 QrtL7A4jFRLgSMJKZn34+0TCWGE2t1xHPDl6G1p9/cX78BZ7kjQgcaJASVVN9TUbANLzR68Km25
 YjPs3bWPX0MMsObYMhc0JBnrTUvL82Zf8flECwRTgyT7X1DdDQXftDfmt3O5mFYYEj0SEbdb5ZB
 c2gaRlQeSl5h10wAdAE7o86c0NCnlMdlCVL4Jan07AWq/Tapw4W6sdMT+WiBBfcIQC299m1QOEB
 Xf3ypcDNz6QS9XR6/QO+HvFuD8m+uGzMXyk4P63KecdA==
X-Zone-Loop: 3c972a539661a259d8e17a9f2b9644256a4126755f65
x-campaign-type: default
x-transaction-id: 95710d7b-63f1-4b05-a629-269811f464ec
x-swg-uid: 01-4e736f70-76ae-4d8c-9ffc-b77f8137f8fc
X-Mailer: Sweego
Message-ID:
 <1792142037.8631fc262581453bbf619ec5b2062170.1a143fd533b0008425@vates.tech>
x-swg-bid: 1792142037.8631fc262581453bbf619ec5b2062170.1a143fd533b0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Olivier Lambert <olivier.lambert@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 2/3] tools/libxenstat: don't skip the /proc/net/dev check after a failure
Date: Fri, 16 Oct 2026 09:12:58 +0000
In-Reply-To: <20261016091259.1254879-1-olivier.lambert@vates.tech>
References: <20261016091259.1254879-1-olivier.lambert@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2a4.4d5a8078f2de9eae.1a143fd51a0.22fad48d3ee40ed4=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792142037408
X-purgate-ID: tlsNG-33051d/1792142041-6E0D14E9-CFCC008E/0/0
X-purgate-type: clean
X-purgate-size: 1896

---=Part.2a4.4d5a8078f2de9eae.1a143fd51a0.22fad48d3ee40ed4=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

xenstat_collect_networks() opens /proc/net/dev once and validates its
header before using it=2E If reading the header fails, or the header isn't
the expected one, an error is returned but the stream is left open in
priv->procnetdev=2E The next call then finds the stream already open,
skips the validation and parses the file anyway=2E

Close the stream and clear the pointer on both error paths, so that the
validation is done again on the next call=2E

Fixes: 49839b535b78 ("Add xenstat framework=2E")
Assisted-by: Claude-Code:claude-opus-5-5
Signed-off-by: Olivier Lambert <olivier=2Elambert@vates=2Etech>
---
 tools/libs/stat/xenstat_linux=2Ec | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/libs/stat/xenstat_linux=2Ec b/tools/libs/stat/xenstat_l=
inux=2Ec
index ec627f3ef5=2E=2E97f7fa9f87 100644
--- a/tools/libs/stat/xenstat_linux=2Ec
+++ b/tools/libs/stat/xenstat_linux=2Ec
@@ -296,12 +296,16 @@ int xenstat_collect_networks(xenstat_node * node)
 		if (fread(header, sizeof(PROCNETDEV_HEADER) - 1, 1,
 			  priv->procnetdev) !=3D 1) {
 			perror("Error reading /proc/net/dev header");
+			fclose(priv->procnetdev);
+			priv->procnetdev =3D NULL;
 			return 0;
 		}
 		header[sizeof(PROCNETDEV_HEADER) - 1] =3D '\0';
 		if (strcmp(header, PROCNETDEV_HEADER) !=3D 0) {
 			fprintf(stderr,
 				"Unexpected /proc/net/dev format\n");
+			fclose(priv->procnetdev);
+			priv->procnetdev =3D NULL;
 			return 0;
 		}
 	}
--=20
2=2E53=2E0



-- 
Olivier Lambert | Vates CEO

XCP-ng & Xen Orchestra - Vates solutions
=
Book a meeting with me: https://calrs=2Evates=2Etech/u/olivier-lambert
web:=
 https://vates=2Etech
---=Part.2a4.4d5a8078f2de9eae.1a143fd51a0.22fad48d3ee40ed4=---

