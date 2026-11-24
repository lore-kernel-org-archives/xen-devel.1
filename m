Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94D4606A33C
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 16:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=fB6+4zE7
Received: from list by lists.xenproject.org with outflank-mailman.1501269.1697395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk7-0000wV-ID; Tue, 24 Nov 2026 16:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501269.1697395; Tue, 24 Nov 2026 16:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk6-0000t3-Tx; Tue, 24 Nov 2026 16:51:42 +0000
Received: by outflank-mailman (input) for mailman id 1501269;
 Tue, 24 Nov 2026 16:51:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVtk4-0000VG-D1
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:51:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVtk3-004DBX-OH
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:51:39 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e784b420001cf5@swg.vates.tech>)
 id 6b05c084-8faa-0a2a0a5109dd-0a2a450591b8-46
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:39 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e784b420001cf5@swg.vates.tech>)
 id 6b05c095-4cb1-0a2a45050019-b9ff1c228ac5-6
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:39 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a20e784b420001cf5.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Nov 2026 16:51:34 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id B3DD9830AC;
 Tue, 24 Nov 2026 17:51:33 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=957clx3YeeaBLTEiysyVkPdimsDlWk28ZYqDrV0yZXk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=fB6+4zE7ippNd8nX2el24oEMsm0irvE88EJ2ANRYlTA6tg+zkuK+EcH21CIzNdoLSxigsSYJt
 X9LhUg77Aei5Vp2hbyM6FnpskhifkOcamZYiDGl175NKqsXXh+9j/c5ONbYWxSIzeokdXkZ0pjz
 JrDLYicEBzHL/cLi2MihTwdEvQ3PZ+y4GGt7wA5Lw7aFjcQGlEWbW23Q0apCK6fTLU21oTmNwqW
 8kg+iIt5n1YjW8leyIGb8RftaO29IE4+6IsH+NSDMtJA7K5e9HmU9BZ5SjtqKeP/uVnGGvHwP6F
 tEwHlfxdUCCE59nzxFsTIVbPnk38kaHLuv0U4+uP93OA==
X-Zone-Loop: 0a7eac2a71a9e88fe513e83bfd4ea7344f7bdaf70c95
x-campaign-type: default
x-transaction-id: b3b2b6ee-c712-4100-b443-93fea721dbcd
x-swg-uid: 01-612be79d-1385-470a-8ac9-a65424ca7d10
X-Mailer: Sweego
Message-ID:
 <1795539094.8631fc262581453bbf619ec5b2062170.1a20e784b420001cf5@vates.tech>
x-swg-bid: 1795539094.8631fc262581453bbf619ec5b2062170.1a20e784b420001cf5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [RFC PATCH v2 12/13] wip: fastabi: Add evtchn_status helpers in struct
Date: Tue, 24 Nov 2026 17:50:40 +0100
In-Reply-To: <20261124165041.653941-2-teddy.astie@vates.tech>
References: <1795538976.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5@vates.tech>
 <20261124165041.653941-2-teddy.astie@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.138.f224c3850bc35cc.1a20e7849c6.421a4cdea2fda2c=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795539093959
X-purgate-ID: tlsNG-c201ff/1795539099-71EA92A1-82126FB1/10/73395122804
X-purgate-type: spam
X-purgate-size: 1613
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.138.f224c3850bc35cc.1a20e7849c6.421a4cdea2fda2c=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Could be used for convertion between fastabi and structs for helpers=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Cc: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
Cc: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>

A guest can use this to easily convert a struct to registers by
taking _output1 and _output2 into registers 6 and 7=2E

 xen/include/public/event_channel=2Eh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/include/public/event_channel=2Eh b/xen/include/public/eve=
nt_channel=2Eh
index c5548d206c=2E=2Edab907f796 100644
--- a/xen/include/public/event_channel=2Eh
+++ b/xen/include/public/event_channel=2Eh
@@ -208,10 +208,15 @@ struct evtchn_status {
         } unbound;                 /* EVTCHNSTAT_unbound */
         struct {
             domid_t dom;
+            uint16_t _pad;
             evtchn_port_t port;
         } interdomain;             /* EVTCHNSTAT_interdomain */
         uint32_t pirq;             /* EVTCHNSTAT_pirq        */
         uint32_t virq;             /* EVTCHNSTAT_virq        */
+        struct {
+            uint32_t _output1;
+            uint32_t _output2;
+        } raw;
     } u;
 };
 typedef struct evtchn_status evtchn_status_t;
--=20
2=2E56=2E1



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.138.f224c3850bc35cc.1a20e7849c6.421a4cdea2fda2c=---

