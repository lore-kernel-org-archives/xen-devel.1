Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D638D606A321
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 11:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=uMmVHKwA
Received: from list by lists.xenproject.org with outflank-mailman.1479832.1683758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNJ0-0004c2-1u; Mon, 09 Nov 2026 11:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479832.1683758; Mon, 09 Nov 2026 11:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNIz-0004bJ-QK; Mon, 09 Nov 2026 11:12:53 +0000
Received: by outflank-mailman (input) for mailman id 1479832;
 Mon, 09 Nov 2026 11:12:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xQNIx-0003qa-Qs
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 11:12:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQNIx-003asL-6k
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:12:51 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6af1aaa3-e002-0a2a0a5209dd-0a2a4507d888-32
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:12:51 +0100
Received: from [52.101.83.89]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6af1aab0-b4ea-0a2a45070019-34655359e23e-7
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:12:51 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by BESPR03MB911570.eurprd03.prod.outlook.com (2603:10a6:b10:147::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 11:12:49 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 11:12:49 +0000
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
 b=TOZ5X9XR3bp7e00TnRMtx3+WEU+ye6wsykJ5jLF8ZU+pjIRnTw88WjX7AHu5NJ+wvE65Tvmus8nFXt7y2dp213NnedBEvr+VHzZylhkSyjgCVPgmXmosEntDkE7kpZCqiaRq97JsrStD/dHc+uoZ5I/AwfOMYHURFmYEmgXDTSXwpIAgjA/HnkLnyytShysOOy1QU/J3i1W80vmjw+KdwPKLG4k7AhzOMgQ+PubsVucJPS5/H3cH9apgNM0+87JynBsEgQjJQBmju3XhnefESwKYLzLnJVxNFSsGOwGzjGiCRtJ5NX+Bv/kXppYhA9r350oJdplmXyA3owwYta33BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8lN2N6zh132Ai8uzBJIHz2N+Q/htJPFUEWYUsnQlCI=;
 b=UXZEr27oO0PP1PKrYgkrh56Gq4+5aP71zypOFRX/rjVROfIzot7FZwzWjRxGSVgxvOwN7iw8TqCyVu+5oURLkVY+sufOlg1Ymg7vvDTcWCzopBgixPYatBZwwwms5EXjkW5zRFydcr9Opzt8aFdBE3Va6+KDbRbah7pPOnsPX6Sz2pJCf6khteFA6AaVcitoxJsmVtQtrmJAmr3OO8RKrQswFxe/vhUJ3og+dE/+BKdnYmeyuQI6SB1bDcHVLNCY99/HylkBbV2968ZtMbNuREsi/4izOEf83iRn0tipXCJm4h/0Us8/c6tDdvcsgf/JCNs7SW3ojmafquUaLk1R6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8lN2N6zh132Ai8uzBJIHz2N+Q/htJPFUEWYUsnQlCI=;
 b=uMmVHKwASrPlpHT6hdh8oUT5NzTTUZ8KPfPLuUzVIhW/3msJ2wcLp/ScVLLfzetHjLXn6usxldPL4J5bf5GdhQqliQMOpkHKLVzSJK1Zg5ulI2LEln1Ikcj1+ZIVcfgrD5z6XkPgVdM329qi/4xRs+HI6umiXYcH503+Z27d+4C2zaUCRjbTN+PGnIWUp0JpsD5rRD8B1RLCcVMHJSsgAwoOQovQxpEZeyiLu5S54ZRNk/GZHn5Po175eQZOd+tI7f+qwRnUWs76Lv0yXQ0lbxuYzP5mydUzAaxDTfK5K+a7JfLjSuPIjpU7YRU3964z2QErJG1SkurDHQBrJK19Fg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v11 4/6] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v11 4/6] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHdcDtB09yqm3vI3UKKICuJZIRK+g==
Date: Mon, 9 Nov 2026 11:12:49 +0000
Message-ID:
 <92f0934ebdc79687f6007f83ec04bf8001f1e0cd.1794222015.git.mykyta_poturai@epam.com>
References: <cover.1794222015.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1794222015.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|BESPR03MB911570:EE_
x-ms-office365-filtering-correlation-id: e3137ac7-95b3-4197-12a6-08df3e5263b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|22082099003|18002099003|10063799003|10067099003|38070700021|11063799006|261028144727099003|261102123227099003|261022105027099003|261021123027099003|56012099006|261021121427099003|261026140227099003|261026121527099003|261009223027099003;
x-microsoft-antispam-message-info:
 tOX8s8raMEND0IV0Mr9jsIv8kMnYvp80ScoaIDoysrLByjBWXdtF24grzfuRh5Lz1NKw1JqhUqogEla2MOjyx5jckuk+2Ht6pDqKIsf3Epim8NW7MA8hVu34FnxGTkMs2Krh+C4Y+bAidqAUk5+a4piMTcURERtbrakwzVl1D28Pwz617CRRU7l23EXW/3SFvlPPIF5V4D3R97Bj1ADZRVv+/INVO5LwMM0dLoLgMkCBy74QJd9q9admqVttmWRolUq7l8GJ8zXsHI3jB/GsZqtixVM1EHvY9vsA/bp2kGbwaDkJNQP0hXrFiaSCm9hjm5aNgSJZZanTaKFOc2bjjnzkhydew+xU0eLURNyrfWJUeTMxx2XOUsWyiZkcik38rWU65syQ8aJ28zO+UlLJtEiHz0oOWwf84ufBdoqzdMzWFcu1FGhnIMHr2HEF907KIWS50NLPJc7lMrc9cPRib1EbOJeIupSViywYa0ADVqGRcQeFpfAiJCPuQQjUq5vBDfRlDKqXXwgoZmijqFYMpEQxrMhVocClIFbrof1ZxroSJmus9zBy016bvhTN5/f4qqFjoiDsxaKKCCXMB71txDEuNJnXdGBiVQBYLwvLGs4qPth5LWx3mESotpV2J6HR8p+4YQQK4oAxQLnRaGaBLGcEcT/DAXHgkHnMJtAs9TeBacsbdCw15+efAq2CIjoKFPvgnTVQmF39bPUH0JWate84XM1UPvNUolr7Cps+kR0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(10063799003)(10067099003)(38070700021)(11063799006)(261028144727099003)(261102123227099003)(261022105027099003)(261021123027099003)(56012099006)(261021121427099003)(261026140227099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Ud7KOz+SlrCoSjk9QL6KzsZ/zmmo/mKxL6kfOdpbgptgFC7JlalYKY/4qm?=
 =?iso-8859-1?Q?/oiWY1DeQw/CRksYpZxqyIG9PbDdSAPnwL/nG7kv2Ct/YFIVHmzBXWUGC6?=
 =?iso-8859-1?Q?Y1vH7e81LxL/jKlou/SVwe09lbZXTo6qccOpPH9C/XfcLJxurxbCgPN3gm?=
 =?iso-8859-1?Q?ZRI/7+Erlk1TY5F9ONer8qvTQ59wbP7AniKjQDovnZxrfMxIrkwi4cOzf+?=
 =?iso-8859-1?Q?aZCu+BhGONt/N77sh5vhNzkq1mUaN0AyLP6LxP+WifPZ2bPQEevFaFzycR?=
 =?iso-8859-1?Q?kGk/RzI9habmH6hPEsFwpY9IpWPh29z9wFEu7rcjtKAO1T6q98mhJCR3Jp?=
 =?iso-8859-1?Q?KNthej6CGm0VCVHHrBv7dtMs9HAWYLMkd847DpdsvYC+3hc0hTglt3pfwT?=
 =?iso-8859-1?Q?zhW8V2kOrUEC+8QACM+F8OHvktEyN474v0KslgWtrxXcetSj+icNtVYlxv?=
 =?iso-8859-1?Q?9pjZDlyIUK3mt3dYPf4R2Z7g4BPdMSWCcqG63yMlBio80UgJ37M5H53efi?=
 =?iso-8859-1?Q?twqRbj4Z/+PlY+0JoKjYeN03kpLoNt3aV/TsXOEbDZLjm+VPYIeEzUAviM?=
 =?iso-8859-1?Q?eO6FVWGTZhQ2gCejQPtHQHmanzTVTc1mAgKoVL8yA9FVewFHpxJA84hvmm?=
 =?iso-8859-1?Q?iT9cpJuJmBlWWNEm4e2Ng4cmM6Y1BRRVBAP3kB0TpqQF1V/gonWaaD21b3?=
 =?iso-8859-1?Q?bSPzaVu3GvDP6sYMhjz5kVz6EZvgd14Zo70+tICX+ppVmpi/pq8INlSFkK?=
 =?iso-8859-1?Q?OFCq4BCEJsExURVBrFbNzVqhzU37Ng/5fdhnmihA63si8CjyT5jJ2519S9?=
 =?iso-8859-1?Q?h2j0De2PdPwKdOXa8+v+hfMf2eIy4Oq/gapTFZxOfimFqaf9lpu1919N+/?=
 =?iso-8859-1?Q?gycU21hMKPCDbRoKV5FZ7NZ8DmCSxvUOZLkj28PfvlFBmL9PA70f/TMl3E?=
 =?iso-8859-1?Q?d54XLe0tUoRvKmM69yEUrzpnKTjGI2jNsUtx7JdRPIBWgpGrm1PYFFC4CE?=
 =?iso-8859-1?Q?7eNTl5h+lsEyN8EoupveJ5+iazxrJO4RZkqTlCLYoGVZb4dOm95XZzPrXm?=
 =?iso-8859-1?Q?RTaME8CeHJBpNrjh2aPpcIhfskWXYEgfovwcr7TerGgdOVj2wpT9Xk24e0?=
 =?iso-8859-1?Q?VgwvTobzHsB7erM5VMK1JeF3gj0fGZEQDIhKBKnFW9BWBRtcgzWT3Y04EB?=
 =?iso-8859-1?Q?L5JH9oQXkds6E3rUbUP3ZwapkXffaBiw2vPWqz2y0W+M4aj0sDz3FdHgbT?=
 =?iso-8859-1?Q?SZczzNHgdvSi7wueW0j+d7yGwTCLpaCfp862VdIHhKNI85Cj8B5Cp0LGZc?=
 =?iso-8859-1?Q?Bc+71+mBQsUI5KgQlndmu98vm3G0tc87PC8vITE04upuHUnjK9UkZNlwSb?=
 =?iso-8859-1?Q?UZGOaISCym/DEZ1NX0EWmLfjslZmy12sQp3UtDc7UNfU5VHcq0sqZWkBRG?=
 =?iso-8859-1?Q?iUSbpL+SK7uiwGJhb0uv1xnzLjOgv8w3DH41WvA9r3wkxJK4StD6lklI2r?=
 =?iso-8859-1?Q?26aYsQ5QWaolWWQm8Kl4QQR86klDwO1MEt2SVnFYEgQUe3Mvwk0xCuo4C1?=
 =?iso-8859-1?Q?Na0uUljFCksYKcGzTxwg8R5XBZCZQdgmW42b+ZnJ5GXfB/orIm7ktbheK+?=
 =?iso-8859-1?Q?zkxkGf8mMEYere6UhiVrfu8VCLljiR1mAerzg01GzsSsnimxf8zaJQEsrD?=
 =?iso-8859-1?Q?EaXelVF6yDd5bUlsYNBvUoLYf1kpsp1mkv1RJUS+a3R72hrFpXoMXqKO4i?=
 =?iso-8859-1?Q?hRzv5ljdgxVNvj39Ru7TMQRwqc2vDpKGNtbtlqkbLC6Mlywg7rPGT1ngkn?=
 =?iso-8859-1?Q?YEn+1sGRUw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3137ac7-95b3-4197-12a6-08df3e5263b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 11:12:49.0858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LLn7VnO6NUVP3hT/BYWZaWI19B7VnIMJ7/BQOlno1ZpxnWC3dDTuZTJz7SZsV4ot1n06s1G+AmJT0VptHeoCog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR03MB911570
X-purgate-ID: tlsNG-ef75cf/1794222771-36EDEAE4-9C6FB6FC/0/0
X-purgate-type: clean
X-purgate-size: 10690
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SMT-disable enforcement check is moved into a separate
architecture-specific function.

For now this operations only support Arm64. For proper Arm32 support,
there needs to be a mechanism to free per-cpu page tables, allocated in
init_domheap_mappings. Also, hotplug is not supported if ITS enabled,
and partially supported FFA, or TEE is enabled, as they use non-static
IRQ actions.

Remove ifdef guards for x86 in flask, as cpu hotplug is now
supported on more architectures.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v10->v11:
* add HAS_CPU_ONLINE_OFFLINE knob

v9->v10:
* rename arch_cpu_can_stay_online to arch_cpu_keep_online
* drop the single-use hp_op and hcpu variables
* make CPU_ONLINE_OFFLINE depend on !TEE, as FFA and TEE use non-static
  IRQ actions

v8->v9:
* simplify dependencies of config CPU_ONLINE_OFFLINE again
* rebased ove XSA-499

v7->v8:
* simplify dependencies of config CPU_ONLINE_OFFLINE

v6->v7:
* use IS_ENABLED istead of ifdef in more places
* remove unneded variables
* more explicit fallthrough in do_sysctl

v5->v6:
* fix style issues
* rename arch_smt_cpu_disable -> arch_cpu_can_stay_online and invert the
logic
* use IS_ENABLED istead of ifdef
* remove explicit list af arch-specific SYSCTL_CPU_HOTPLUG_* options
from the common handler
* fix flask issue

v4->v5:
* move handling to common code
* rename config to CPU_HOTPUG
* merge with "smp: Move cpu_up/down helpers to common code"

v3->v4:
* don't reimplement cpu_up/down helpers
* add Kconfig option
* fixup formatting

v2->v3:
* no changes

v1->v2:
* remove SMT ops
* remove cpu =3D=3D 0 checks
* add XSM hooks
* only implement for 64bit Arm
---
 xen/arch/arm/Kconfig           |  1 +
 xen/arch/arm/smp.c             | 11 +++++++++++
 xen/arch/x86/Kconfig           |  1 +
 xen/arch/x86/include/asm/smp.h |  3 ---
 xen/arch/x86/smp.c             | 34 +++------------------------------
 xen/arch/x86/sysctl.c          | 11 ++++-------
 xen/common/Kconfig             |  7 +++++--
 xen/common/smp.c               | 35 ++++++++++++++++++++++++++++++++++
 xen/common/sysctl.c            | 32 +++++++++++++++++++++++++++++++
 xen/include/xen/smp.h          |  6 ++++++
 xen/xsm/flask/hooks.c          |  2 +-
 11 files changed, 99 insertions(+), 44 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index b9c5c40678..4569c76615 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -7,6 +7,7 @@ config ARM_64
 	def_bool y
 	depends on !ARM_32
 	select 64BIT
+	select HAS_CPU_ONLINE_OFFLINE if !HAS_ITS && !TEE
 	select HAS_DOMAIN_TYPE
 	select HAS_FAST_MULTIPLY
 	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
index b372472188..f84f217359 100644
--- a/xen/arch/arm/smp.c
+++ b/xen/arch/arm/smp.c
@@ -44,6 +44,17 @@ void smp_send_call_function_mask(const cpumask_t *mask)
     }
 }
=20
+#ifdef CONFIG_CPU_ONLINE_OFFLINE
+/*
+ * We currently don't support SMT on ARM so we don't need any special logi=
c for
+ * CPU disabling
+ */
+bool arch_cpu_keep_online(unsigned int cpu)
+{
+    return true;
+}
+#endif
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index e5535ac484..e5e3134022 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -17,6 +17,7 @@ config X86
 	select HAS_ALTERNATIVE
 	select HAS_COMPAT
 	select HAS_CPUFREQ
+	select HAS_CPU_ONLINE_OFFLINE
 	select HAS_DIT
 	select HAS_EHCI
 	select HAS_EX_TABLE
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.=
h
index 572b39b01c..6c33567cb5 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -44,9 +44,6 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t =
pxm);
=20
 void __stop_this_cpu(void);
=20
-long cf_check cpu_up_helper(void *data);
-long cf_check cpu_down_helper(void *data);
-
 long cf_check core_parking_helper(void *data);
 bool core_parking_remove(unsigned int cpu);
 uint32_t get_cur_idle_nums(void);
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index e3c4c0d5e0..b56d8dfd36 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -417,37 +417,9 @@ void cf_check call_function_interrupt(void)
 }
=20
 #ifdef CONFIG_CPU_ONLINE_OFFLINE
-long cf_check cpu_up_helper(void *data)
+bool arch_cpu_keep_online(unsigned int cpu)
 {
-    unsigned int cpu =3D (unsigned long)data;
-    int ret =3D cpu_up(cpu);
-
-    /* Have one more go on EBUSY. */
-    if ( ret =3D=3D -EBUSY )
-        ret =3D cpu_up(cpu);
-
-    if ( !ret && !opt_smt &&
-         cpu_data[cpu].compute_unit_id =3D=3D INVALID_CUID &&
-         cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) > 1 )
-    {
-        ret =3D cpu_down_helper(data);
-        if ( ret )
-            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
-        else
-            ret =3D -EPERM;
-    }
-
-    return ret;
-}
-
-long cf_check cpu_down_helper(void *data)
-{
-    int cpu =3D (unsigned long)data;
-    int ret =3D cpu_down(cpu);
-
-    /* Have one more go on EBUSY. */
-    if ( ret =3D=3D -EBUSY )
-        ret =3D cpu_down(cpu);
-    return ret;
+    return opt_smt || cpu_data[cpu].compute_unit_id !=3D INVALID_CUID ||
+           cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) <=3D 1;
 }
 #endif
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 10d485e633..a4254beabb 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -121,13 +121,13 @@ long arch_do_sysctl(
=20
     case XEN_SYSCTL_cpu_hotplug:
     {
-        unsigned int cpu =3D sysctl->u.cpu_hotplug.cpu;
         unsigned int op  =3D sysctl->u.cpu_hotplug.op;
         long (*fn)(void *data);
         void *hcpu;
=20
         if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
         {
+            ASSERT_UNREACHABLE();
             ret =3D -EOPNOTSUPP;
             break;
         }
@@ -135,13 +135,10 @@ long arch_do_sysctl(
         switch ( op )
         {
         case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
-            fn =3D cpu_up_helper;
-            hcpu =3D _p(cpu);
-            break;
-
         case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
-            fn =3D cpu_down_helper;
-            hcpu =3D _p(cpu);
+            /* Handled by common code */
+            ASSERT_UNREACHABLE();
+            ret =3D -EOPNOTSUPP;
             break;
=20
         case XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE:
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5713dc1f9c..f1c78b0ac7 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -121,6 +121,9 @@ config HAS_ALTERNATIVE
 config HAS_COMPAT
 	bool
=20
+config HAS_CPU_ONLINE_OFFLINE
+	bool
+
 config HAS_DEVICE_TREE_DISCOVERY
 	bool
 	select DEVICE_TREE_PARSE
@@ -648,8 +651,8 @@ config SYSTEM_SUSPEND
=20
 config CPU_ONLINE_OFFLINE
 	bool "CPU online/offline support" if EXPERT
-	depends on X86
-	default y
+	depends on HAS_CPU_ONLINE_OFFLINE
+	default X86
 	help
 	  Enable support for bringing CPUs online and offline at runtime. On
 	  X86 this is required for disabling SMT.
diff --git a/xen/common/smp.c b/xen/common/smp.c
index a011f541f1..af532d4873 100644
--- a/xen/common/smp.c
+++ b/xen/common/smp.c
@@ -16,6 +16,7 @@
  * GNU General Public License for more details.
  */
=20
+#include <xen/cpu.h>
 #include <asm/hardirq.h>
 #include <asm/processor.h>
 #include <xen/spinlock.h>
@@ -104,6 +105,40 @@ void smp_call_function_interrupt(void)
     irq_exit();
 }
=20
+#ifdef CONFIG_CPU_ONLINE_OFFLINE
+long cf_check cpu_up_helper(void *data)
+{
+    unsigned int cpu =3D (unsigned long)data;
+    int ret =3D cpu_up(cpu);
+
+    /* Have one more go on EBUSY. */
+    if ( ret =3D=3D -EBUSY )
+        ret =3D cpu_up(cpu);
+
+    if ( !ret && !arch_cpu_keep_online(cpu) )
+    {
+        ret =3D cpu_down_helper(data);
+        if ( ret )
+            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
+        else
+            ret =3D -EPERM;
+    }
+
+    return ret;
+}
+
+long cf_check cpu_down_helper(void *data)
+{
+    unsigned int cpu =3D (unsigned long)data;
+    int ret =3D cpu_down(cpu);
+
+    /* Have one more go on EBUSY. */
+    if ( ret =3D=3D -EBUSY )
+        ret =3D cpu_down(cpu);
+    return ret;
+}
+#endif /* CONFIG_CPU_ONLINE_OFFLINE */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 8fb5ff0af3..dd21b6ff7e 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -475,6 +475,38 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_=
sysctl)
             copyback =3D 1;
         break;
=20
+    case XEN_SYSCTL_cpu_hotplug:
+    {
+        long (*fn)(void *data);
+
+        ret =3D -EOPNOTSUPP;
+        if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+            break;
+
+        switch ( op->u.cpu_hotplug.op )
+        {
+        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
+            fn =3D cpu_up_helper;
+            break;
+
+        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
+            fn =3D cpu_down_helper;
+            break;
+
+        default:
+            fn =3D NULL;
+            break;
+        }
+
+        if ( fn )
+        {
+            ret =3D continue_hypercall_on_cpu(0, fn, _p(op->u.cpu_hotplug.=
cpu));
+            break;
+        }
+    }
+
+        /* Use the arch handler for cases not handled here */
+        fallthrough;
     default:
         ret =3D arch_do_sysctl(op, u_sysctl);
         copyback =3D 0;
diff --git a/xen/include/xen/smp.h b/xen/include/xen/smp.h
index 2ca9ff1bfc..6c011d73ef 100644
--- a/xen/include/xen/smp.h
+++ b/xen/include/xen/smp.h
@@ -76,4 +76,10 @@ extern void *stack_base[NR_CPUS];
 void initialize_cpu_data(unsigned int cpu);
 int setup_cpu_root_pgt(unsigned int cpu);
=20
+#ifdef CONFIG_CPU_ONLINE_OFFLINE
+bool arch_cpu_keep_online(unsigned int cpu);
+#endif
+long cf_check cpu_up_helper(void *data);
+long cf_check cpu_down_helper(void *data);
+
 #endif /* __XEN_SMP_H__ */
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index d65ba0aeae..a1eed309b4 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -957,7 +957,7 @@ static int cf_check flask_sysctl(const struct xen_sysct=
l *op)
     case XEN_SYSCTL_getdomaininfolist:
         return flask_getdomaininfo(dom_xen);
=20
-#ifdef CONFIG_X86
+#ifdef CONFIG_CPU_ONLINE_OFFLINE
     case XEN_SYSCTL_cpu_hotplug:
         switch ( op->u.cpu_hotplug.op )
         {
--=20
2.56.0

