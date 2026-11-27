Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2983606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 10:38:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1504780.1699850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWtLM-00034T-VF; Fri, 27 Nov 2026 10:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504780.1699850; Fri, 27 Nov 2026 10:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWtLM-00034M-QK; Fri, 27 Nov 2026 10:38:16 +0000
Received: by outflank-mailman (input) for mailman id 1504780;
 Fri, 27 Nov 2026 10:38:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Anandu.Padinhare@electrifex.com>) id 1xWtLL-00034G-I0
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 10:38:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWtLK-009a9S-UO
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 11:38:14 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Anandu.Padinhare@electrifex.com>)
 id 6b095d96-8faa-0a2a0a5109dd-0a2a4507daea-0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 11:38:14 +0100
Received: from [3.110.59.179] (helo=repost.tmes-in.trendmicro.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Anandu.Padinhare@electrifex.com>)
 id 6b095d95-b4ea-0a2a45070019-036e3bb3d1d3-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 11:38:14 +0100
Received: from 40.107.57.127_.trendmicro.com (unknown [172.26.73.106])
 by repost.tmes-in.trendmicro.com (Postfix) with SMTP id 73864C0010C6;
 Fri, 27 Nov 2026 10:38:12 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (unknown
 [40.107.57.127])
 by repre.tmes-in.trendmicro.com (Trend Micro Email Security) with ESMTPS id
 EAACFC00043C; Fri, 27 Nov 2026 10:38:04 +0000 (UTC)
Received: from MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:cc::6)
 by PNYPR01MB12787.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:30d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 10:38:02 +0000
Received: from MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c284:c893:95b6:d2a3]) by MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c284:c893:95b6:d2a3%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 10:38:01 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
X-TM-MAIL-RECEIVED-TIME: 1795775884.960000
X-TM-MAIL-UUID: 1d31dfd5-e5c9-4dac-a056-131fb34e76e3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwYbGNz5b6s2biA/lbWgQkbGeJ3xcgPLEUee4NlG7KhcQnuVQq6wYK8ls0IwZAzc42a87z6Z6Ssg3Yvwe7NxSQCUQsV6VodPvBq2uYmc0R0OHOcNdMWOGX74eAGYGKfCx1nlZFs1LReijtV4+xNW1af7XKwOrIJseyb8gtsTtFzLp/fIu2FMuGLsdCOVWbQMVUidkzmoziGnRXTIW6h0Fbr7C2l8cJFOCRKXffNwpkhfLTjPHLUHYr0uyHz3m5AV7IdwaiBExn8HRe3UelGp96QR4yiBbjMNjrDN1zBlQeulFybgTnF+7sDrezzcKuhvJGcAniywwAhrLjBdalAPrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kihdQQ3MIJUNnYXe63LgUtXxFlv4tk9fIedUmHAgZqE=;
 b=qrIYItTyXxEBSIeazFI4gVsBbyi7J1QDSDmfrNkPVqWEKt8xkgOUQSBSBBCkBI4f3EEkilw8AphnTG1j5kMlgUNBRFDeawixbhZPzCW4qyB3uL133P/bnvAxmEJAyOlY/2UdZ6sfdfOe8i9CTqzrocjL0aI/4pwWHOek4QOzWQ3kAksVdlNt5onz+Q2ZAm8Q+DcByM5djZcKW6GvTWrgKBTIWhLY5FzdbDa/t9r1UCbIE0VA0+9yV69KOYo/OUzHKgx7OMpWWb5qxHvlkD83uFewWevGipny5J1Gg0XldvC/KpDIiPCqzuaFJmTaqlZlZso+4JXKVHnrM9aC3V3Ysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=electrifex.com; dmarc=pass action=none
 header.from=electrifex.com; dkim=pass header.d=electrifex.com; arc=none
From: Anandu Padinhare <Anandu.Padinhare@electrifex.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Alistair Francis <alistair.francis@wdc.com>, Baptiste Le Duc
	<baptiste.le-duc@vates.tech>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, "roger@xenproject.org" <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] xen/riscv: use the SBI SRST extension to reboot in
 machine_restart()
Thread-Topic: [PATCH 2/2] xen/riscv: use the SBI SRST extension to reboot in
 machine_restart()
Thread-Index: AQHdfltgP9/ridJYo0+blCGD9xqueQ==
Date: Fri, 27 Nov 2026 10:38:01 +0000
Message-ID:
 <MA0PR01MB9217B2C0DE50511F7EE8989BFD412@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
References:
 <MA0PR01MB92178FEAFBB95A225781351CFD412@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To:
 <MA0PR01MB92178FEAFBB95A225781351CFD412@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=electrifex.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB9217:EE_|PNYPR01MB12787:EE_
x-ms-office365-filtering-correlation-id: 3763e297-85fc-477e-89fd-08df4c72831a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|38070700021|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261021135927099003|261102123227099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 fDSzJu+Eq2kuyKN/S/i0m9DlzemwjqZvOxGUQvzWOUdDd37XNskq9AKfLsjN2sUwdvbLb16NwaHgs3XBf5GNdyMFPgdTbtvwv3WNA/q0GWFAvIAb9hDLzmzzpwU3gy8ahrd934JDHHpzVqPXqcCU4299ExRdOJIA8+VLoAbSfsoNAUT8KLC3xqYSoewM+F1TbfMvUjPoLPNN2qmTHjg4aTKvY69a7qUVWjxfCMFGuMP5ExKa257w6CayKMbi8n2HcRlFCtIPdXEssqP7nSkPA11OiskUkxkdhlpkE4rUmMmJb5lkVc7kUzNRNcD5uMFaehhwUNcbKU3Qs58fxIIN8Kp5Y9QG9Uru4x1l+JCM1n6QGJkhMzrjkNrnIaRr5dgaal1ORewy/yXc/p8YdOHaTGmDesM19ctAC5Zq/F0MJlsNO7rrXSiNbVUfViRDX5f6b7RHfFg6fHdzNra+l0lViDbWcIZRZUuFh6DL3bezH77VWwXxzlMH9sD/nH+wJHXT0Gw0IJUTSimcsmHFDuTP++2AuE7xJxOcd5epDavFLhaRkzD3v91vmat4ahmaJYBecC5Q6yjf6Fs6dNBbHukmdhTF5DqvoZ4HKjQLMX0Xc0SUPoardMZ5MTNIk7AgT0r5pASZmyesJfg2s+HnshcSXALUvO91pyT+k3JfMlWR5Osipc4YqLRXFmXUiNzTDyBUGynnoYXPpKKn/2CIQs5UvKWGqRJ/CT5cio/elYItSKg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(38070700021)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261021135927099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gY4ixyLMPzaOsFGH7GIGV2UVP5MbeSdwLMm1HmDt1XG1uE367QG7vCHz24?=
 =?iso-8859-1?Q?axek5E297k78vDUm/1h0UcmJBVgsx5LMDIZcLR9w7gQp3LjJJaf6k1XM1f?=
 =?iso-8859-1?Q?ilbaEIkJDirwEf6EjF9/tpu/lrwef1gTAqCGTvHNMU+AFVfzONPWDvPPE8?=
 =?iso-8859-1?Q?5lJyxCH6ledcGCVfr9o6NIPjjGSKS5A8cNjd+Jdqc5PXW+hXsxVlmGmN1X?=
 =?iso-8859-1?Q?y7ZSLNSRtijgR/vfs0+8sr/RARLdKxVUIWa7mqGO+BT9lw/oaZeGRnLBy1?=
 =?iso-8859-1?Q?h3GcZY8PieKL6DCDMKsf6ywSyMP/PJo99fw9iPMakapSX7pMfm+ssFHmVF?=
 =?iso-8859-1?Q?ZyE/UE/jx5mZWGN/v5Zv6VdWgQv2o+AklD4W4F4P/YQm3GwYImMDpjJ6B4?=
 =?iso-8859-1?Q?L9TEa0eoWZaKYrwilI/j3MJKtXvs48qDC5VlHX5EAQVyY4pzVh3MXJalDH?=
 =?iso-8859-1?Q?Or31cCzwZbllwDHLpkXKcZAh/weOxl0igKOUaBHfSiMsrKbWY8M2z4FeLE?=
 =?iso-8859-1?Q?1fxfSnt4qJm8x4XhWnmvY2QY6LJ3eIPpLGPU6ND2j0IbmwiDN6ChNXbRoo?=
 =?iso-8859-1?Q?BCblaJHULNHLJ9DavOlbCiHNf+Q9RHAu045BxZWSDUZmj/W3px43QHY+/s?=
 =?iso-8859-1?Q?W7gXNVTRlLxCaLTHrkBaeIZ7bB3nDQjtmX9jgD2gGhnhH2NCRNrhHxaWiq?=
 =?iso-8859-1?Q?KomSz2FTYrpTD27RLBlvJMFP+jQcow0ipi8kWzVPLNPn+fnVNosJ+D41pK?=
 =?iso-8859-1?Q?Rf+Q+PmjuzPU+k/zo7isxipPfd8dDD6KxEzB0uV1ki035R7sqMDpQmwh1i?=
 =?iso-8859-1?Q?WrP8zItm3LX12dflQ2Z7kNezCPwuKbCp9D7Vbuu1cusNXEnp3Y005Gc92e?=
 =?iso-8859-1?Q?CYUsQ1s8MRmKzHgF98ubwP82PrgEvp3boFUHdTwM/qcQ1gBBHftbyyn9xi?=
 =?iso-8859-1?Q?Lzu2Bhh5fyapHDZBmvrr8eaWnQu/PtURFk+kGC55wEjBmd+9Y3K7K6mfpB?=
 =?iso-8859-1?Q?OHx2XtwqD+dTEKz0kimoFsO0TmNnYl9jnzvhXD5sN3dpJvJixlzCJAu4K7?=
 =?iso-8859-1?Q?M8m45WOyHrSyDxJX9vNv8M8yrwDD3hSDKHKIWDJ7jJa2RtkCNvGJDdYazp?=
 =?iso-8859-1?Q?EEIbNtzjmi3gZ3rv9mlzxVk+Zyb99g/E309io0yBGT66jN9rZ5sYhrcd6d?=
 =?iso-8859-1?Q?FirsCR3oZNJP9PDKyfE8PPGc3gNsDPUvCRZfh8d9ajDGmS8m4arN9SAXek?=
 =?iso-8859-1?Q?bcsvKcvmLDfMXZF64vHs+HeH47qo2yfsjehwCaS0TVgZHtddE36LtrVO8c?=
 =?iso-8859-1?Q?p/pXu9d+T7j5wyM9ddhRI0i7OXGSPHOzIznzwmekGDcq52Yn7NlSzOZFeB?=
 =?iso-8859-1?Q?VOgoEWtcMYBfdq1Pb6lzh/55uz3dtRerp8ZA1AL3kku4vlUjkkQb7EjcgV?=
 =?iso-8859-1?Q?+hZBDrS7iODPbKtG3GIEmfSHeFfNuWBDrCtUx/jJcazHB8zs5XF0KCXrQ+?=
 =?iso-8859-1?Q?Yu57PAU1Q4vUJ5b411Uk8rVMuitN/Gz9u1nE25l8LMVvJu/QyrYGAzn9pP?=
 =?iso-8859-1?Q?2oqRaGTS2siTQDiZwf1aQp8KUsKDtp6yHKE7zO8DUs5KQ3QLeFnq3FzxzS?=
 =?iso-8859-1?Q?r/nNd+zjl8yBByJviw3zWL7DyQIodGlRQKK4zXJrArqsQXp0ETNrtUhnGB?=
 =?iso-8859-1?Q?EQBUdthwH/r1RNkktHFOezIf5QaMA3LM/aHZGBGzFYe4itmHdOT+HHyBbu?=
 =?iso-8859-1?Q?PjeHsvx0ynn9hJJVItdhaV6mtU+r7I+gwYOr7ATK/4SjfhUYWL95IrUL7A?=
 =?iso-8859-1?Q?PzQHBFv1fxwWS4gxxnMalHU+uK9VauQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	lG34rSuBSOIwngCnE2vgL6Yvp6E560iR0RRFACfVY1YG6TFQYCKHwlbXFOyQkkxzaetiyQFUlaRCptU1CPkANbOv1YbXdEjoLwmh6VCxJK+tJVbg2TSzOrY7TP67hRNrvmjL0PPwC6nqMgP79bBmEqZJXRs1AdENPoul2Mw1iSLQ37aKRBJyCpNJ/5ulGprBlrWja87KY5HPRLxMalNO/oA97LqEN6IHp/H3Dx7Ll0bL5nRV+zgoBQTJD2mCLQxVMB0AYtqWhLeiFTWSeVMYt2ntBJ7qorywyVagRvxCZiNkjHCfM11nFRxqV58DLD+LF3YXUbiKw0Xnpg6HHa5qbQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oW2uNI37CGw9J6bqrgJdj5a3Ym2dbg8dKIl+5w0AtrQ/of3kMD7pWWvzB297KTEE+FqHmhJkIp4sPc+bCeq5459y41zxkRYB2MH937PdqJDQ54DeOS9XSJDtlWXj+BrSvwhLa19NRWM/tRUj8jGf1vZ5xPuFxGAJZXKAMDAZMdwtrkpq8UY5INC15Q3n2SLoeryviucSUAGEtH/q5FuYM+7Qwa9yQJGqRRjTA/eFQzcsgWfDlRC4E/TCnQnz01tqHeFqZPgRsaqXBMEleVLPd2lnadZolaxCV2xppiVlvZj6vVdjucDlVEs0MHxdT5f5j4TL+uX63bwdd0o+eGOhMuirXCEoqSq5BTNvKAj3R3QfFJW9ca+pBPOG50qSHbAEojKCnqPO+kcp7yogYuUecppwB1VKTnfwfwd2rkCdttnnzncoFDuuxm9WwZn4IHZdwI6zAlA2FxmyTOT++Cdtt+PtTzNpU8tTXXO00SMZuMn3lFrBrGSNlTn6JKkkKKT/IUBMRvzoEI44KwNlxK3vvgZbwFcFaR9Ow4rCQc/Kq+9EO+/RiI3YBIwMqikh4FTdD5ImuFBhk/846Ri9IEkg9SYpky1SAZqqYU8uZEhK+JU=
X-OriginatorOrg: electrifex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3763e297-85fc-477e-89fd-08df4c72831a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 10:38:01.8937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f2626450-e675-4872-bae6-db17376f7643
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HTIaC6qbm/f5wQr2YlFyxWW6VAIHR0sknlFlys5dAHt7QYrUWg+1dy7FSh0ZQQKFcprWRbL2ijtkA12TnaF5RH0GKP9niXWw7MYrSqZAtBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYPR01MB12787
X-TM-AS-ERS: 40.107.57.127-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.2.1014-30346.006
X-TMASE-Result: 10--7.350100-7.000000
X-TMASE-MatchedRID: muyIzeL3VjGYVvcOxH1cSVxhft2cHJCz4vIIVCYPZYGGHsgnieDIsAwK
	seLx0LRTpRmvrzqUXIW56hfZUXj5lpg0DcUpMHJuO3Y9BE9+f5HsiuBXRLBWQj7BYhP3HAAZ+I+
	8fkrly5GFBZJVMRPkNcWiaT5XrI7Pa50eibWQXx+SHQtEOSQwHNztvqTn5fr3r21vwKk5y6oj4/
	Z/wyn0CEVHfCNfzyE44dMw4OuQkZhz9umCZsYzXHzV+KRRiDItE7tltIr4y3ac2JxbD3wPF3kvO
	cYXpVCE1rR/6iWDwSiihTDw2IdSDcR/RwxIIBOypJgUXPcinGTJ+MXwxLqnFQp9Ebp3ocWsr54J
	Ix46I6RAXrlB2o4nmI3g/heSzGVXOfEmq6feyfMX6nfwyd2cmu6xG0H9n3ROdbWue7ufizIUVee
	rOoqGH7Btyzv8SpZpzboiUQzMLdHpOsJNvF28ZQ==
X-TMASE-XGENCLOUD: 5ef514d3-ae98-412f-8ea9-412069825eaa-0-0-200-0
X-TM-Addin-Auth: FsA/i8jjXZmEhTJwjRZ0ty/tLlIAW8He9t0KhooPie7NbqR/WvNPIn74fGT
	n3v3TqIlUOMYJLuSxUIqYkFNbrTbZbIwT66WLv7JS8NNLxgCg/5qEOd/kLYgjiZGSdG339ufZ1r
	+FdVYlPFUBh1oMUABtEeiVs4h1uLBD39o+xaxUxrugAVX0Q6P9Zn9+M96Fu71O2G/dup5BzLm73
	X2tK0RyHP7+rHoRs7mvLPfoHnOPpiGYGp3gzntBJynh86Yyjc1Gw6OlAsxSh5U1/w45PJ3KLcrA
	/e8qy4XQcFddiE85mLSlP6QH9DszKEZLwQw6IpPAywOB/f5mrxl+ECnrbw==.Hfg3YcWWkstAwH
	ZLe16vD+1Wq/KwqEY2cWnQWCD5JmW0eQmgGgjtvTgAFmKdyjkY9aFrYhi/3jwf0BJdAyVmizIn3
	roTtctYHnp8XGRs9OAKqdRmpUpGEjYXcKBTYivZkeroFt2W4lj99NSN+97XN5/6vkzKPEKyipAw
	vQ3Tf/b5BJSZJmuMAkVOXFkaXf1BCW+Ab5HF8ECMbqX6k+MMyy7UPYMUT03gi1rJvCUeTYCzUZ5
	OjNUt7niHmKBm0kwe28bDO7lg+pqR71lN/QTdAjqdpyEhHpQOLEmOsQ+OJa0d5VAnQS6gk+RysU
	zofnMa7vTJIsn0pw05BobsUYGw0g==
X-TM-Addin-ProductCode: EMS
X-TM-Deliver-Signature: B25824AE6117DB97BBCEB849B531C5F3
X-purgate-ID: tlsNG-ef75cf/1795775894-A7CD7AE4-7DD906D8/0/0
X-purgate-type: clean
X-purgate-size: 5307
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

machine_restart() just calls machine_halt(), which uses the legacy SBI=0A=
v0.1 SHUTDOWN call, so every reboot request, including the one after a=0A=
panic ("Reboot in five seconds..."), powers the system off instead of=0A=
rebooting it. Commit 6471badeeec9 ("RISCV/shutdown: Implement=0A=
machine_{halt,restart}()") left SRST support for later.=0A=
=0A=
Probe for the SBI System Reset (SRST) extension in sbi_init() and add=0A=
sbi_system_reset(). Use it in machine_restart() to request a cold=0A=
reboot. If SRST isn't available or the call returns, fall back to=0A=
machine_halt() as before. A failed reset request is logged.=0A=
=0A=
Now that udelay() exists, also honour delay_millisecs before resetting=0A=
or falling back.=0A=
=0A=
A panic after sbi_init() but before preinit_xen_time() gets no delay,=0A=
so it now reboots straight away, and one that happens on every boot=0A=
becomes a reboot loop. With "noreboot", Xen powers off at the panic,=0A=
as before.=0A=
=0A=
Assisted-by: Claude=0A=
Signed-off-by: Anandu Padinhare <Anandu.Padinhare@electrifex.com>=0A=
---=0A=
 xen/arch/riscv/include/asm/sbi.h | 11 +++++++++++=0A=
 xen/arch/riscv/sbi.c             | 21 +++++++++++++++++++++=0A=
 xen/arch/riscv/shutdown.c        | 10 +++++-----=0A=
 3 files changed, 37 insertions(+), 5 deletions(-)=0A=
=0A=
diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/=
sbi.h=0A=
index 2a245d0b42..eda426b623 100644=0A=
--- a/xen/arch/riscv/include/asm/sbi.h=0A=
+++ b/xen/arch/riscv/include/asm/sbi.h=0A=
@@ -29,6 +29,7 @@=0A=
 =0A=
 #define SBI_EXT_BASE                    0x10=0A=
 #define SBI_EXT_RFENCE                  0x52464E43=0A=
+#define SBI_EXT_SRST                    0x53525354=0A=
 #define SBI_EXT_TIME                    0x54494D45=0A=
 =0A=
 /* SBI function IDs for BASE extension */=0A=
@@ -49,6 +50,13 @@=0A=
 #define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA       0x5=0A=
 #define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID  0x6=0A=
 =0A=
+/* SBI function IDs for SRST extension */=0A=
+#define SBI_EXT_SRST_RESET              0x0=0A=
+=0A=
+/* SBI SRST reset types and reasons */=0A=
+#define SBI_SRST_RESET_TYPE_COLD_REBOOT 0x1=0A=
+#define SBI_SRST_RESET_REASON_NONE      0x0=0A=
+=0A=
 /* SBI function IDs for TIME extension */=0A=
 #define SBI_EXT_TIME_SET_TIMER          0x0=0A=
 =0A=
@@ -84,6 +92,9 @@ void sbi_console_putchar(int ch);=0A=
 =0A=
 void sbi_shutdown(void);=0A=
 =0A=
+/* Returns only if SRST isn't available or the reset failed. */=0A=
+void sbi_system_reset(unsigned int type, unsigned int reason);=0A=
+=0A=
 /*=0A=
  * Check underlying SBI implementation has RFENCE=0A=
  *=0A=
diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c=0A=
index 3576e26033..6898dc0dea 100644=0A=
--- a/xen/arch/riscv/sbi.c=0A=
+++ b/xen/arch/riscv/sbi.c=0A=
@@ -25,6 +25,7 @@=0A=
 #include <asm/time.h>=0A=
 =0A=
 static unsigned long __ro_after_init sbi_spec_version =3D SBI_SPEC_VERSION=
_DEFAULT;=0A=
+static bool __ro_after_init sbi_has_srst;=0A=
 =0A=
 struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,=0A=
                         unsigned long arg0, unsigned long arg1,=0A=
@@ -82,6 +83,20 @@ void sbi_shutdown(void)=0A=
     sbi_ecall(SBI_EXT_0_1_SHUTDOWN, 0, 0, 0, 0, 0, 0, 0);=0A=
 }=0A=
 =0A=
+void sbi_system_reset(unsigned int type, unsigned int reason)=0A=
+{=0A=
+    struct sbiret ret;=0A=
+=0A=
+    if ( !sbi_has_srst )=0A=
+        return;=0A=
+=0A=
+    ret =3D sbi_ecall(SBI_EXT_SRST, SBI_EXT_SRST_RESET, type, reason,=0A=
+                    0, 0, 0, 0);=0A=
+=0A=
+    printk(XENLOG_ERR "%s: type=3D%u reason=3D%u failed (error %ld)\n",=0A=
+           __func__, type, reason, ret.error);=0A=
+}=0A=
+=0A=
 static unsigned int sbi_major_version(void)=0A=
 {=0A=
     return MASK_EXTR(sbi_spec_version, SBI_SPEC_VERSION_MAJOR_MASK);=0A=
@@ -381,6 +396,12 @@ int __init sbi_init(void)=0A=
             set_xen_timer =3D sbi_set_timer_v02;=0A=
         else=0A=
             set_xen_timer =3D sbi_set_timer_v01;=0A=
+=0A=
+        if ( sbi_probe_extension(SBI_EXT_SRST) > 0 )=0A=
+        {=0A=
+            sbi_has_srst =3D true;=0A=
+            dprintk(XENLOG_INFO, "SBI v0.3 SRST extension detected\n");=0A=
+        }=0A=
     }=0A=
     else=0A=
         panic("Ooops. SBI spec version 0.1 detected. Need to add support")=
;=0A=
diff --git a/xen/arch/riscv/shutdown.c b/xen/arch/riscv/shutdown.c=0A=
index 3513d9af47..53f5735a13 100644=0A=
--- a/xen/arch/riscv/shutdown.c=0A=
+++ b/xen/arch/riscv/shutdown.c=0A=
@@ -1,4 +1,5 @@=0A=
 /* SPDX-License-Identifier: GPL-2.0-or-later */=0A=
+#include <xen/delay.h>=0A=
 #include <xen/shutdown.h>=0A=
 =0A=
 #include <asm/sbi.h>=0A=
@@ -17,11 +18,10 @@ void machine_halt(void)=0A=
 =0A=
 void machine_restart(unsigned int delay_millisecs)=0A=
 {=0A=
-    /*=0A=
-     * TODO: mdelay(delay_millisecs)=0A=
-     * TODO: Probe for #SRST support, where sbi_system_reset() has a=0A=
-     *       shutdown/reboot parameter.=0A=
-     */=0A=
+    mdelay(delay_millisecs);=0A=
+=0A=
+    sbi_system_reset(SBI_SRST_RESET_TYPE_COLD_REBOOT,=0A=
+                     SBI_SRST_RESET_REASON_NONE);=0A=
 =0A=
     machine_halt();=0A=
 }=0A=
-- =0A=
2.53.0=0A=

