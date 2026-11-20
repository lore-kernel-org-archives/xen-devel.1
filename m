Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C862B606A32C
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 16:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=cVjm9n8Q
Received: from list by lists.xenproject.org with outflank-mailman.1498302.1696137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUR9w-00031x-4T; Fri, 20 Nov 2026 16:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498302.1696137; Fri, 20 Nov 2026 16:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUR9w-00031q-18; Fri, 20 Nov 2026 16:08:20 +0000
Received: by outflank-mailman (input) for mailman id 1498302;
 Fri, 20 Nov 2026 16:08:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xUR9u-00031k-H1
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 16:08:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUR9t-0063AC-P0
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 17:08:17 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6b007071-2eae-0a2a0a5409dd-0a2a4505823c-0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 17:08:17 +0100
Received: from [52.101.70.98]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6b007071-4cb1-0a2a45050019-346546626b00-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 17:08:17 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by DBBPR03MB7113.eurprd03.prod.outlook.com
 (2603:10a6:10:208::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:08:15 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 16:08:15 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mh87b3xaANhCyI/pB7J8k11zR5BMoXGTaSHzBQ6as9j3cST3CuivcKM0UEf4MzigxNYr2F0JtQpj3zqL5drAgs+/5uOIjBSkzc5iSfLDmy4a1lL9Uj9Mwdq/7lFIVUN+QHGqszV8jGOYaRwS6FXj0jLz8spkO6qQzy/htDTarY7GFl1APTO7cATVk/eJle4wLyaoV9DCLLshM4hayAzXVxijfIGRpYZc5tpqCalqTtGZs56LNiugGEowiN6cBNKGYknLQoVxPUSNxIJmVolVKw6x3oIP+ubRTURvnarA6qwKlm8FRRJ+8tlLufr8kdJPp0W9BJdi5jo1IP6BAF6O6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SGl0uO3IilJGbFkVZBFXh9Xw3BZJkYmMsPYboFSYtk=;
 b=NgrEAtppYk6Jbc2HinUSMilFmO3pNxqNaXoBuo/OMFFLtKt678xEI7n+Ygx4MLWfEq8E6j4j2DuydvARUFqf6/LY8xFCige26S4LrBdSfIQktl9e1lm7sBp2Be9C37V93k0WlNfD64lfpxvuCjnP5Fer1MBwo5H5Y/yF8kAIZWTi0LGCO+AoILXBiColwHTc1uUT+KYh8pWN0bCSvpYF9W1z5aXOPVfzbJQWeMt4IOWixJHawm88L9mjAhEOvbvY9UUOxeyX0MGiArASeXmR3YjocEVKdGDUE3thwLlDLuBTwyCgu1qM+2xy0V+OR6WuXmSfHIFlDWnqWzMJ5ogkhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SGl0uO3IilJGbFkVZBFXh9Xw3BZJkYmMsPYboFSYtk=;
 b=cVjm9n8QlKR5eNjUJjowm+DBVzYyZdLlQX9h4dyFieOrBHS6F2fapqWFHhbr5CtNfMU1TtCmG/0KQRUGA3BuWMUlsyx4TsICePcWUgsYFUeCdWNjVROmkH13b1fYtDBNLxnpLpbCt4ygTX64dVhe5hU1jnQpvXOioJou/gzoBjWxLiSAIacX965d+xDc+MVEsohGltEiGSyXY/HdmnaskNC5m83SU5gVHarJNbqOufrYJk0m6oVut2uvDj90vmfSgpe4L024Tj4cfMADOKSCduhyjwyMUfLnmiysLI3rIVQN6vMzlfIpOhCzZkjIirGHXbsg7u8s2jzRkFGwwIcHQQ==
From: Mykola Kvach <Mykola_Kvach@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross
	<jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2] xen: handle domain_shutdown() return values
Thread-Topic: [PATCH v2] xen: handle domain_shutdown() return values
Thread-Index: AQHdeQlZ+G+2VicjqkaZFs1q+PJATg==
Date: Fri, 20 Nov 2026 16:08:15 +0000
Message-ID: <20261120160804.230032-1-mykola_kvach@epam.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB9208:EE_|DBBPR03MB7113:EE_
x-ms-office365-filtering-correlation-id: 6fe69ee4-7004-4550-e03e-08df47207c0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|3023799007|18002099003|260925021311599003|260925022911599003|260925021911599003|261009223027099003|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261028144727099003|261026140227099003|261026121527099003|56012099006|10067099003|261102123227099003|11063799006|5023799004|38070700021;
x-microsoft-antispam-message-info:
 Nvp70TWZz2QMaZnyDimBRaOjBWswt1ZhXDaatK/87jOgeWkZECkifAo6kAT+8UzVOwjwZYiO6MRliAUYlYe+fa0I4BN58xNpmqDoYtLwOO2HWhpihjK15Rg0aGabZFFAexFMKg2tt37aPOjQRP3NbTB1O+WIwYbQ+iJaiQay41SxgTPehL2ZyZPoryoW1zRew6yO91zSXPX/VrnMgYu1VqfC+41qGcF78Tfi0gClJuuXA3MQmH8S7NS1d/FE0oh25rEPq9RYhxoapIqiICboefM03bdSnBUP6lDQm9pVEtzxLCe5DXQ2S7pbhnAYxHzhHlekU4+TEDz6C/IXkGCiKkNwJMzj4nEe6u0ZPmBH8cNXk0rbNkIuDF74PQVLR2qhC8naJLr5O3fqzsYfEzkoFy4isLyyNfSgAoNEgt6M/vIT+bmMjUeTNNNJk64Ew7IPQzLzPTzGxeLEk3faXh0Wp10ENHkgnIr8hTQRSxW6esn/bh9CvnMNIouysnclnwKNGG0icJnu9W1g/bbyvUWOPgeTkLBMRGoaFGOsegzKuI9lGOEvbJCgAPVYYqQZkWcAB/f907IdRfLM2iyZYZwTxkcklHGeo+YDLmmnS9fwMB9XcIvAS+LgXiYJqJA3IFrRHIuLskIviFT/ToG47VGGYICv1N2fjRXCPCYLQAPHK78=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(3023799007)(18002099003)(260925021311599003)(260925022911599003)(260925021911599003)(261009223027099003)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261028144727099003)(261026140227099003)(261026121527099003)(56012099006)(10067099003)(261102123227099003)(11063799006)(5023799004)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KSnLwpM5ecABh58RjhGje9wtE7N5ADjs2r9pCrea1rdF1ZbpEl2ZFQn6NF?=
 =?iso-8859-1?Q?r6vuGpVi0irNFCuAtQxxr5LKpGBLkmgGLdpQaBltQNxU8aFhxd3I5DHpeI?=
 =?iso-8859-1?Q?a69670zFApEl+QjzOsDCCdLLbfMqBkVjjaQw/oZoV3PA7A/jEOTkXO27TI?=
 =?iso-8859-1?Q?s2KIjPPu/PJZzWA8vAtYIWQYdpQkmo6CZ5sXmhpce61YPoZYJ68ptIcTYG?=
 =?iso-8859-1?Q?JuPcT74vDOwG+jdaGrLWZG8TXH4BQCSNKzkqIvXszVM3KqkplqvGNglJGA?=
 =?iso-8859-1?Q?LcbPVz4fRDfsCYjPw9bmBRaAaDEEpV2OKLRd3EtpRgMWSi+1Ccg6rtebVs?=
 =?iso-8859-1?Q?+FARn+vfsT2CwHzNDPxwlObDp0XOWM7bvwmF242lm5vMR7IPwGL/zwuE/s?=
 =?iso-8859-1?Q?WUTVzwdjV5pXHNPrV8xCbiUUPSNPN2P6d8LzELg8zSlcFb/icPH3L6OBB4?=
 =?iso-8859-1?Q?afcwNkvWaZ5k6dGkdFg3tzpFqUiO5MC5w/hWvZ0TNEw2skUZ0aAioKq2MZ?=
 =?iso-8859-1?Q?XEWFyOE2y+PsDNk99FAhIs+pWKBihjctthzTd3JEgF3UkCYXMOosP0eNCg?=
 =?iso-8859-1?Q?Cqj9VaTt/b54ouXqpzyvwBQjgmQlolIijhDQTs38Cq+ajIFtktiSOZPeHd?=
 =?iso-8859-1?Q?RlyrBCWlBUwSzJ1ZMOZfRS8zcfGH6tAb2IGHochmLAFQuIphF5+9pFPZkC?=
 =?iso-8859-1?Q?HedkIGURJLNNmBkvhLyLZWCIWmfK/fJF2gLBCWTP0fTEbOTXxI1yLB/F9i?=
 =?iso-8859-1?Q?pda4pWYLgNiy7PysTCovUmDWq4qd6zWb8Y9Xi2JAKnejTeY5wwc9/09eXB?=
 =?iso-8859-1?Q?ioSVaKPFTjjMWfTuqJyFy7etJYtu9WRUzlgBXnxVGHh3xUVjSZUYg/XNpI?=
 =?iso-8859-1?Q?+IXpoMqpNjfuXPy6XKbPrGvcDVlQN5CXKlKQyL+f7YExYa3+ZEP1bQK3Ho?=
 =?iso-8859-1?Q?zhns6tXkTMOWgyWwq29r37BHc5MTwDvbGKeNTD01qNWEjRghNta/njj6YG?=
 =?iso-8859-1?Q?qStC8JJ43ftufHPxjcwqT6c32N2RXCDs/ERfAp4hbcLMIXgVD7vgi25YE8?=
 =?iso-8859-1?Q?Qz7TsCmAkqVj7T2AJvauM/8ZzfomkiOjuAxQDZChELeBny7aspoRyqvJ5f?=
 =?iso-8859-1?Q?60yTqBLTkg3OZI0of+zBcJ2gMesMAYOPTtdYmef5+h5hqe7hOYUzPxyvtW?=
 =?iso-8859-1?Q?6s27CAS8fQMCs6m/nxyulEWMZFXxC3zqwf5yvvbyX/mJLYy9y2aqGIZ+5v?=
 =?iso-8859-1?Q?2jQV9ySmII4Cpul4B5JxawxaUgGSKSnsmzZu4iwa0SSdjQMpUsxy9z5nK2?=
 =?iso-8859-1?Q?OCSByT5HxZb/DmhT779FsJEWktkbvvTilcqDoOqkGfW5G+8r1rsCHqGdxr?=
 =?iso-8859-1?Q?rKXgg20PmeOptuESs+EMNJ95xWDY1Efwu3yVfd7meT512FaZdZM4f3A+cA?=
 =?iso-8859-1?Q?TGtaRFsuEGkPj1f5Ex5+3mVBDjaBgp42YO5dc3plu4x7f443+YZh8gT8ic?=
 =?iso-8859-1?Q?b6bVMJKkxCHLPsJMp6EPHAcz3v4P4EXLhQy/DgLtqJGavyF+0j3XCyonB8?=
 =?iso-8859-1?Q?anhk1aHMMwPzlVixn9qzmjqdP8jd1CR9gENdH3pBCA36hps5jvkFweVE+S?=
 =?iso-8859-1?Q?TRvCbFFS4erpBTM7hB6tOCPupdKA+rA/5J4Jw9ro+M5RuKlcJqm/gAm98p?=
 =?iso-8859-1?Q?n/OCEbTncLhTDEfo4LUH46VGEagJuxgCOsDzlp1V2HCIw/23jpNiU/8atc?=
 =?iso-8859-1?Q?gZdtly36DTbybOw+IYkCERYn+kV/zH36RExeZLVEgv1GmKBaeEswBBk7V4?=
 =?iso-8859-1?Q?NcRN+yJuPg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe69ee4-7004-4550-e03e-08df47207c0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 16:08:15.5297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Ub4eTTG0jCI4myIv0VOfNickokP4+ADNGGVWCxUq1ZufREH9bFll9Lt6t65f6psF+y+C5NzmsrIULBdRV6rLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7113
X-purgate-ID: tlsNG-c201ff/1795190897-732B32A1-31EDF89E/0/0
X-purgate-type: clean
X-purgate-size: 8267
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ten callers discard the value returned by domain_shutdown(). MISRA C
Rule 17.7 requires the return value of a non-void function to be used,
and Directive 4.7 requires callers to test returned error information.

Return the status to guests using the legacy SCHEDOP_shutdown hypercall.
In PV shim mode, a cancelled suspend or a checkpoint returns 1. The
legacy handler loses that result and returns 0, telling the guest it
has resumed in a new domain.

Propagate the result from both remote shutdown operations. The explicit
zero in XEN_DMOP_remote_shutdown dates from when domain_shutdown()
returned void. Also propagate a failed poweroff from VCPUOP_down when
the last vCPU goes down. On that path the shim has not taken the local
vCPU offline, so reporting success would hide a failed request.

On Arm, domain_shutdown() returns zero whenever it returns. Assert
this in the PSCI poweroff and reset handlers so that a change to this
assumption is caught in debug builds. Keep the call outside ASSERT().

The HVM poweroff and triple-fault handlers, the domain crash path and
the watchdog callback cannot return a shutdown error to a caller. Log
these errors at guest error level. The configured triple-fault action
can be suspend, so only a negative result indicates failure.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- Explain the MISRA rationale, the legacy suspend result and why the last
  vCPU's poweroff result matters. Drop Suggested-by.
- Use assertions for PSCI SYSTEM_OFF and SYSTEM_RESET on Arm.
- Use guest-class error messages for shutdown failures. Include the target
  domain when it can differ from the current domain, and the timer ID on
  watchdog expiry.
- Log poweroff failures in HVM release builds. For triple faults, report
  only negative results, since a suspend action can return 1.
- Drop the unreachable return at the end of do_sched_op_compat().

Previous RFC:
https://lore.kernel.org/xen-devel/95dacecdce8f8417562548e16a4d3e11c41a3f27.=
1773923242.git.mykola_kvach@epam.com/
---
 xen/arch/arm/vpsci.c    |  8 ++++++--
 xen/arch/x86/compat.c   |  5 +----
 xen/arch/x86/hvm/dm.c   |  3 +--
 xen/arch/x86/hvm/hvm.c  | 12 ++++++++++--
 xen/common/domain.c     |  9 +++++++--
 xen/common/sched/core.c |  8 ++++++--
 6 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index 8c7a70c7a907cf96252ae60cabb3927e6a972a8a..ae92a336ede70e1e519703efb6d=
0e8f23f7d3fbc 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -210,13 +210,17 @@ static int32_t do_psci_0_2_migrate_info_type(void)
 static void do_psci_0_2_system_off( void )
 {
     struct domain *d =3D current->domain;
-    domain_shutdown(d,SHUTDOWN_poweroff);
+    int rc =3D domain_shutdown(d, SHUTDOWN_poweroff);
+
+    ASSERT(!rc);
 }
=20
 static void do_psci_0_2_system_reset(void)
 {
     struct domain *d =3D current->domain;
-    domain_shutdown(d,SHUTDOWN_reboot);
+    int rc =3D domain_shutdown(d, SHUTDOWN_reboot);
+
+    ASSERT(!rc);
 }
=20
 static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t ci=
d)
diff --git a/xen/arch/x86/compat.c b/xen/arch/x86/compat.c
index 217b5b1fcc41700cde830a8c74f4c230d0e1d58c..ec3f253a8b46834932e05b53f7f=
a7022774f187e 100644
--- a/xen/arch/x86/compat.c
+++ b/xen/arch/x86/compat.c
@@ -39,14 +39,11 @@ long do_sched_op_compat(int cmd, unsigned long arg)
     case SCHEDOP_shutdown:
         TRACE_TIME(TRC_SCHED_SHUTDOWN,
                    current->domain->domain_id, current->vcpu_id, arg);
-        domain_shutdown(current->domain, (u8)arg);
-        break;
+        return domain_shutdown(current->domain, (u8)arg);
=20
     default:
         return -ENOSYS;
     }
-
-    return 0;
 }
=20
 /* Legacy hypercall (as of 0x00030202). */
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 91f6ca669b2b4304c8c25265253778538eac1109..7528bb5b2c60948c388e2739624=
589dc8a5b0d49 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -551,8 +551,7 @@ int dm_op(const struct dmop_args *op_args)
         const struct xen_dm_op_remote_shutdown *data =3D
             &op.u.remote_shutdown;
=20
-        domain_shutdown(d, data->reason);
-        rc =3D 0;
+        rc =3D domain_shutdown(d, data->reason);
         break;
     }
=20
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4334ff678d348f1002d5b509daeef2bf4057d78e..98deb2eefc5127ec13fdd610a6c=
2686c39939bb4 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1720,8 +1720,12 @@ void hvm_vcpu_down(struct vcpu *v)
     /* ... Shut down the domain if not. */
     if ( online_count =3D=3D 0 )
     {
+        int rc;
+
         gdprintk(XENLOG_INFO, "All CPUs offline -- powering off.\n");
-        domain_shutdown(d, SHUTDOWN_poweroff);
+        rc =3D domain_shutdown(d, SHUTDOWN_poweroff);
+        if ( unlikely(rc < 0) )
+            printk(XENLOG_G_ERR "%pd: failed to power off: %d\n", d, rc);
     }
 }
=20
@@ -1750,12 +1754,16 @@ void hvm_triple_fault(void)
     struct vcpu *v =3D current;
     struct domain *d =3D v->domain;
     u8 reason =3D d->arch.hvm.params[HVM_PARAM_TRIPLE_FAULT_REASON];
+    int rc;
=20
     gprintk(XENLOG_ERR,
             "Triple fault - invoking HVM shutdown action %d\n",
             reason);
     vcpu_show_execution_state(v);
-    domain_shutdown(d, reason);
+    rc =3D domain_shutdown(d, reason);
+    if ( unlikely(rc < 0) )
+        gprintk(XENLOG_ERR, "Failed to shut down after triple fault: %d\n"=
,
+                rc);
 }
=20
 void hvm_inject_event(const struct x86_event *event)
diff --git a/xen/common/domain.c b/xen/common/domain.c
index f3a2634d5f985e094236f81c49acbf6f9ebc8d58..9253c811b520977a691f831fa97=
9eb0df135af95 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1358,6 +1358,8 @@ int domain_kill(struct domain *d)
=20
 void __domain_crash(struct domain *d)
 {
+    int rc;
+
     if ( domain_shutting_down(d) )
     {
         /* Print nothing: the domain is already shutting down. */
@@ -1374,7 +1376,10 @@ void __domain_crash(struct domain *d)
                d->domain_id, current->domain->domain_id, smp_processor_id(=
));
     }
=20
-    domain_shutdown(d, SHUTDOWN_crash);
+    rc =3D domain_shutdown(d, SHUTDOWN_crash);
+    if ( unlikely(rc) )
+        printk(XENLOG_G_ERR "Failed to shut down crashed domain %pd: %d\n"=
,
+               d, rc);
 }
=20
=20
@@ -2198,7 +2203,7 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUES=
T_HANDLE_PARAM(void) arg)
=20
         if ( !rc ) /* Last vcpu going down? */
         {
-            domain_shutdown(d, SHUTDOWN_poweroff);
+            rc =3D domain_shutdown(d, SHUTDOWN_poweroff);
             break;
         }
=20
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 10b6eecccd3b39cfdc684e434e6eb9cdcd707417..d3aca88cc832fe76fcb914aa870=
eaa82aef1113b 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1588,6 +1588,7 @@ static void cf_check domain_watchdog_timeout(void *da=
ta)
      */
     struct domain *d =3D _p((unsigned long)data & PAGE_MASK);
     unsigned int id =3D (unsigned long)data & ~PAGE_MASK;
+    int rc;
=20
     BUILD_BUG_ON(alignof(*d) < PAGE_SIZE);
=20
@@ -1595,7 +1596,10 @@ static void cf_check domain_watchdog_timeout(void *d=
ata)
         return;
=20
     printk("Watchdog timer %u fired for %pd\n", id, d);
-    domain_shutdown(d, SHUTDOWN_watchdog);
+    rc =3D domain_shutdown(d, SHUTDOWN_watchdog);
+    if ( unlikely(rc) )
+        printk(XENLOG_G_ERR "Watchdog timer %u failed to shut down %pd: %d=
\n",
+               id, d, rc);
 }
=20
 static long domain_watchdog(struct domain *d, uint32_t id, uint32_t timeou=
t)
@@ -2027,7 +2031,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
=20
         ret =3D xsm_schedop_shutdown(XSM_DM_PRIV, currd, d);
         if ( likely(!ret) )
-            domain_shutdown(d, sched_remote_shutdown.reason);
+            ret =3D domain_shutdown(d, sched_remote_shutdown.reason);
=20
         rcu_unlock_domain(d);
 =

