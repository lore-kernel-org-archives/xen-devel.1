Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FFD606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 03:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=KqQ1tpNC
Received: from list by lists.xenproject.org with outflank-mailman.1504433.1699761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWmyo-0007S4-Kc; Fri, 27 Nov 2026 03:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504433.1699761; Fri, 27 Nov 2026 03:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWmyo-0007Rw-G8; Fri, 27 Nov 2026 03:50:34 +0000
Received: by outflank-mailman (input) for mailman id 1504433;
 Fri, 27 Nov 2026 03:50:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xWmyn-0007Rq-8X
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 03:50:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWmym-009tfL-2l
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 04:50:32 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6b08fde5-2eae-0a2a0a5409dd-0a2a450886e0-28
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 04:50:32 +0100
Received: from [52.101.201.45]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6b08fe06-f659-0a2a45080019-3465c92d471a-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 04:50:31 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by CO1PR03MB5874.namprd03.prod.outlook.com
 (2603:10b6:303:9c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 03:50:27 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%6]) with mapi id 15.21.0639.011; Fri, 27 Nov 2026
 03:50:27 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/XzJIe7puxC1lsLlpIcoqVH4hr6iLoQz4gtrmHW7YxO17IAyQl+AUlq9IsILZBrfx38D3AgMomydgjm+gwbKij4pULQxIThuflMYuitw/gn1ykrsji+nzSS9S7hg80RzyLphZjjx4f1VVF4+bayOpNUIKZYkoTZnSPthV8NAzUPyxFgdy0iCtggf56km7GQnURC9IlcHdFD9A4Kh8yh6b1tcBiIANLgCEpvS3n2AUW4VF6sZHfvABINFQspXUCEJjGxrOjOKpUtuSDFSdcgweQBxXSYxHMX4EsIGHiworS1Rr7EkqxCep/t1cUNajibOmKXOs/1qpROijLq8ujRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCZsPY8OAztUHLIIJ97dpQHMev98G3eh3tqdIBONwtI=;
 b=fx2KthlyztP1/oT+EWPr5jvnB+CndoUtaQOm5c/ug4Xf/z3XoMW1WfBbw4QYQToUllxrpC9FwSDE5ktl3Z0hgTMd9vrjWLyR4e8BaHn2diHqF/pd6DLUnglOIr5Py6RRutWx8v/XjUnG7mX0OsmaGcqSa4gXbNouA6C1tnpFqWlImTEATcRr7yUCTfyysfARSrVY5H5xiM43OL+1BTJOA5apAeQCnJfQqB80MNOIIFaUv1DgmOEHY5Dul3rgiH30sBCJjgQ91zbJVlxP0D1V0z7SSibEYKr3oNKk6DKRTYzPFM1MAZvjYX4l11G9o172OO6fM0iA34w6Q70iA8BLLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCZsPY8OAztUHLIIJ97dpQHMev98G3eh3tqdIBONwtI=;
 b=KqQ1tpNCQohgc6s/yrLSPjxR0lhfG/nBeaDx2JGb8xICzhjzm85QcdTm/YXAxB+80N3Q97BoFvP+T7wINAM/nE3bCnzPA6vs66m6Qug+jcaKjmEoutEza0EAOui5swQ0EjXp5s3G9brwm7SvvBcvgMgzDOdA02eDORyoht3TkS0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: ross.lagerwall@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH v4 0/2] x86/hvm: fix EFLAGS.IF handling of pending events with nested virt
Date: Fri, 27 Nov 2026 11:49:44 +0800
Message-Id: <20261127034946.1130719-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|CO1PR03MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b2a0c7a-2e39-4711-3f4e-08df4c3992f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|261009223027099003|18002099003|10067099003|56012099006|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|261102123227099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	26WJltuYGyinc4o1PXuK0g+BGWrET0Bb60CdFXq4NTKZoNAjL5evGxCdCJeWlrEQBPgaR0u6DvJWuiW/Ef72wQx9EO39qsg8nTOfZpm1Dih6YLOUrpfM9zaUbkFYaIz0sPUB0KUT3WwnGUlpPinrpy8s4C4a2z/9963cNmaJBGdViqGn+V7YbBe5rrJZTxMfy/KIHq9vK3ht1Nzz0VtyJBIMd6B4+Y/YqmpnIqdjnipmN5JRLUSosCe8A2ChDEJa3d9SObUhbL4Tz+niG4LweiTU1BvbsJpwSUPMItGTPTeHKjXbJ6egj4prqFBXY282A/BLxhrmmdTSUpiP7o//HL8hrEwapQnXDEdgfJ7n5T/sHvm+7zSv2FsFxmAZg4nMWhkhYkKIvwq5Sr8vYkBcMRgSDWXfMi5aotCmN4PHtz9E0dUF2seHlOVX6C0BHL6YlatAtRnDS2DLzC0x0uHcudkha5AnfE8vKkNisNNWxlnzzJM6oWchTu1FJ7qYV9ON/aq+70Fv4IJIIvMB+og8IpL7ZbZqLvEDCdNniMcfQFPsUoCRHlW8hNqHhVAPr0lwALxXVwN8UIiNciodWRo0Wotq/GM+H1+HGP3DyVIemr1K00Vd1JT/gsHY0NA1ICqFi3QzHl3L9qu6RGDRGfOKQjoNZX2gfw6+qjz43ydB4lw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(261009223027099003)(18002099003)(10067099003)(56012099006)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(261102123227099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?30uj5RPCmYzUqZD2bUdeYCPFdluWWHYXMoa+wl2mHQD4wKvSHTCW4IiiWgBN?=
 =?us-ascii?Q?BbW/swfGiV2wh1tStUTPlHYwTgh+r354tpCTtWNwuOYMUCxwEkyfnHLhItSq?=
 =?us-ascii?Q?o/d/kNYxrw/Mi+i3EMKhylwsKu7vprew1vYLAKyt/L6dodwTEwgdqoeG9wO0?=
 =?us-ascii?Q?uZchrcXwqM9b/C0IKBvcQDkhaO3PKwBZCp504Z4KzOvO9TSgLJU2859uEbYL?=
 =?us-ascii?Q?RQrOGlolJAbm2yggU4vEZV/IR0koHhwpC53b+20klaKWBeCHeFunLpgAnMcb?=
 =?us-ascii?Q?wjhBDsTLy1JkqsaanB7W/hgRnQi0ESxZotuzhcbH8v4g9xWTZ1IysSwDQC1x?=
 =?us-ascii?Q?X1oNHtK1cRXFziiB6XS9N/t67DvsHQ2X0WyMXKaPvoWlvLgtqsnq+qD9+X37?=
 =?us-ascii?Q?TZ1FN8s7wcoc1PGNS322kY7Guv3jc9poJtfS7ME2tZazoAlhS6/2excYk1w1?=
 =?us-ascii?Q?r2/v4aF8ru/cY9KacLPgPoC70dPRvk179WyszmRacS4Y1C2MtYfTUn095vd9?=
 =?us-ascii?Q?Kit6T8YwkGe1oTSPWrvmcbFAIm31zy7gU/obagMB2mXkTZJv52ffefHXf0iK?=
 =?us-ascii?Q?L/5Kz0RMrvhM9uNzDxG8IxOUpp3lVgIIN4S1RVFfmtCVK4wmhF7wJV9SOFql?=
 =?us-ascii?Q?nNajDoL7SL7T4avN8jTtpsgBhI5AFv1ydC3msnFYta+rpu0h1cu6fQR7FpsK?=
 =?us-ascii?Q?1YqidBjOn+dNUSibFjJpAJL8c4spnjjs21Fe7QyHoL79a62v8jKXcHTJMrg2?=
 =?us-ascii?Q?V6C8Obb5gcN0+IadmfCDGAzLk8twkzYR0xRI0hu2gZQtXGk3XElGhJRIOSEm?=
 =?us-ascii?Q?qGnYy1OLrtTqmGtikxgYQ8CYYJY4Vl6TpGpm6GqOTyQnVPsa9SXo53Y4jlhq?=
 =?us-ascii?Q?mnyHdG3FSFV6BEWZweVFAwVN7/NioIodZz+v9MMEoe2SxBhq/0TCH426YQ/B?=
 =?us-ascii?Q?2MvJe+So5lcpgicZRD5+V5Z0jXHVWxOadLebHm+ugbbY1ed0NA1UpKNRDjYo?=
 =?us-ascii?Q?WScbjiYPTHp6Cdy2HzVi9iB6B9sTTuc8S2h5OhIiYJ/shwNELZCv+Ho5NiFB?=
 =?us-ascii?Q?L0JTsyBbqAWe+DMhi6IbpUxM/fKkTydfkIU7OuG4eTC646LqmY+rwYgisdz/?=
 =?us-ascii?Q?N85hZ5X85g4MDopclaYsAgRojY41nM57GL0DXVvzjB3i591yL3rsHIEVMQq/?=
 =?us-ascii?Q?zYGYluABqDvC+K7m1l7vSgGqfOwG+PLoxE3ZdNNcqCNsImwgL3/4V0gaHQLh?=
 =?us-ascii?Q?NQ7UOskT8ahnFyLi79yrc2ItcCivvrFUuWCYsiDJ6TpaQlT8c279lrCWCFrq?=
 =?us-ascii?Q?KSkxcX2NhWGe/aOX88tVEEQ/l/cmjPBrsqGSMji5G1JRdmvDOZhDzemDxgBt?=
 =?us-ascii?Q?bsoDuOWJjpTvsSg0DnmbIMaS8UVdroyhdlMwOosioHOOb/tUNk3/1Jiu11m0?=
 =?us-ascii?Q?FcFTJDJTx9c9ZrMFdPFYI5qBbJwpARDnELF23rFg12syQAU4AGWl5kaxyteM?=
 =?us-ascii?Q?A5b8vF9D3EEMhaaRHAKAtZVV51D6p41h03c6Riz6F43RgTCJ9QBqHqhE9ts5?=
 =?us-ascii?Q?d1HAhs69kLIqDdVVquQRxW9xJAA/4arIrMzeEKSh2OXIvZbcKLfxL9ym2Yi0?=
 =?us-ascii?Q?HAvRDCmk9iS/Ze4jtSnvGWUvum8zSkFyimAiyYbCscMnD/Tl0egEFxOwJvlg?=
 =?us-ascii?Q?jOghq2wt9VvHx+ZWCzGh4HOlRlv8k7wAYsait+8KaGDR4oG/0yP1uBNlipW8?=
 =?us-ascii?Q?DDjdWHOngA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2a0c7a-2e39-4711-3f4e-08df4c3992f0
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 03:50:27.5660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: peGkhvo8bcAITsSc5gRw4b1KyaJC3n+CPTLfVKYZpWkL7pmtfZuxhv63n7oXNUc/DjOC2HziqBV29QdalBAvXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5874
X-purgate-ID: tlsNG-c1860d/1795751432-D694287B-C595C467/0/0
X-purgate-type: clean
X-purgate-size: 676
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

Patch 3/3 of v3 has been committed, so v4 carries the remaining two.

Changes in v4:
- Add Fixes: tags and collect Ross's Reviewed-by on both patches.
- Drop #MC patch, already committed.


Chunjie Zhu (2):
  x86/hvm: don't let EFLAGS.IF block NMI/#MC due to nested state
  x86/nestedsvm: honour L2's EFLAGS.IF when L1 clears V_INTR_MASKING

 xen/arch/x86/hvm/hvm.c             |  2 +-
 xen/arch/x86/hvm/svm/nestedsvm.c   | 14 ++++++++++++--
 xen/arch/x86/hvm/vmx/intr.c        |  8 ++++----
 xen/arch/x86/include/asm/hvm/hvm.h | 12 ++++++++++--
 4 files changed, 27 insertions(+), 9 deletions(-)

-- 
2.34.1


