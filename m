Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A537606A320
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=U+f1wH7q
Received: from list by lists.xenproject.org with outflank-mailman.1497909.1695948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKaS-0007Zh-3U; Fri, 20 Nov 2026 09:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497909.1695948; Fri, 20 Nov 2026 09:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKaR-0007Za-W8; Fri, 20 Nov 2026 09:07:15 +0000
Received: by outflank-mailman (input) for mailman id 1497909;
 Fri, 20 Nov 2026 09:07:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xUKaQ-0007ZU-Qn
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 09:07:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUKaQ-00C7jJ-04
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 10:07:14 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6b000db6-8faa-0a2a0a5109dd-0a2a450abcc4-26
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:07:13 +0100
Received: from [52.101.43.66]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6b000dc0-f2d2-0a2a450a0019-34652b42cf6c-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:07:13 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by DS0PR03MB7701.namprd03.prod.outlook.com (2603:10b6:8:1fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 09:07:09 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 09:07:09 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lo20arjsH4IZQUZHzELEXl8QUAEw0UYlo2cbL8m/OWUUmrEvFPrEYxJL2+tcZr13v7kdDpMazalvxj+b9rGyIitX1DtGKiRtlXlFM+8tA0XAsqz6LWs6lJOP3/zYp/rn5EwuaVPLipqmi/u1+5ga004r+VvnS+azo5xM+2ctSQz9G2rKRnhSyaQfA03Jxsd5u6618TWlZA2h+FuwdBA+DRNwlHhTxNMaBf7yEmVarYDu7q5YVlWLH52X0Q+PVoUPuy94CAEo7NVUk7YZe57ryE6Cd/FQe/Q6GlVFuj6FA/3xtyVOKwBBo2qTA3rUP4Jgm7U0/Q8NHiMma+jHhBuNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wOLlqIihTxYM3HNu9pdXzygPwYv1vL53kQHDeCrMEg=;
 b=PTS00d6Ifi43RAASV5TXEbUgk97WXIbbznDdlqSXbDM6vz5pBIY0ais5tsWFXZZT9IyNZufYfeurilQzML/BnpvuuQK14yuihPG8gJvNFtNsJcFFuj62SHIaT5eUT6xZcMd1x40cSaVlwpLekcJwJEfEgt2K1TsCShJ4qFXvGNzRjNqYvsFmliv903cTid4xNJDOydmvOn3hPyVvOcahrayyM2aPd31oun1WO9trEy1g6z0CgoxBs+7XUhMRy4YS+Js0eh7urXwtrlJqdw4CoszDoBpCMmIuaUegAW4I/+z/ctqhP7x20OdCjGu7iKjCLKOC43IUceRdkdBl/dcn7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wOLlqIihTxYM3HNu9pdXzygPwYv1vL53kQHDeCrMEg=;
 b=U+f1wH7q03uwwbsEx1Im0eCLRaZOif+zm37WkYGdtCuSS4rOS1+e4fglGk/NWDmR7aRjV03ep67xA7AyZzRiawghLrmNF4iUWP5EEhSCHnWZKXVnrT4YGqtxPzAVSlhcXgY0i+fiJmGF4ZiY56ZnuMOaKq6uLzVsoil+p4aYgLc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: stephen.cheng@citrix.com,
	xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	chunjie.zhu@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	ross.lagerwall@citrix.com,
	teddy.astie@vates.tech
Subject: Re: [PATCH] x86/nestedsvm: Record NextRIP with the deferred #VMEXIT
Date: Fri, 20 Nov 2026 17:07:00 +0800
Message-ID: <20261120090700.273247-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261022090658.151682-1-stephen.cheng@citrix.com>
References: <20261022090658.151682-1-stephen.cheng@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0015.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::10) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|DS0PR03MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: c3909fe2-0e32-4eb6-f9e9-08df46e5a7fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|56012099006|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1dgxBJbiP+cyPteyKe4kDdUvA1EzLFsMOmOmUlskvitkPg/llPEl6gqGuCi0htXWI5Ce5ja5DGNe5WnMM9KNugC5PLfApPhJXm0e282CmKntsNsT2gQY6VjvaCWGKcECZvjX5bFFOM6AOOaVsCY+OOL7Z1FNdPhP4L4bcFT4migNTfJt0qBPOC93lD7vwbs835LHLEQr1B/1xo/PlrnNhBxTM+aGQzE+ojh5W1ma2i6MLHe/NKV5tSD70vKbALGZVyx1Cxj8KxsTGKAeevB55rwd9uBLmgP9v8noIvzza4jRkBhDy9VzVVyww8ev+8kQTDnUB3U8dahyLEKKb9USIsTrp6c9gSaZ9vFE4NFgEMTP1e2GfhjXiFehK35qTPAAOFqfl6985tZDOCh9jUdNWQlKkQnxyYOCLZPr0Fj6gcxlQoycdW4aLoVomDEiuPsqws5i3G+s/I3jMOSB60lzL/stO14XlYxFfTXQ5/n1jf1ZTVYXAN+clm6SMjBH9CgHnd8YdxazZoOBNk1PDp4KRF36zvgFduqCDEBCjnRNhX5lDKOij4VmD+Jsl8Mix79SA1xrheZvd2I+CM9C8yrVKUUMWm3+5/6BOLtCDuKyMR2TSSXry928Q4uX4LQJnLTJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pBhujQYcVmkUGChvIm27rZ0qLLYNSu0j1chg+b4xiMKwnTGHjLjzFCrsClVf?=
 =?us-ascii?Q?neNRXgVWVFB4Y3LhHUTnLRRbnG2YgnUtWE0cztPavLfhQ/287WCkcp1r5ZvW?=
 =?us-ascii?Q?oSxLXT7JEiI/9/dc3txc88ZrIP5iD8tE2dNkweqsQjsaXC+KwJ2oRy8WthBN?=
 =?us-ascii?Q?WtDruDNb3cs5ME/knvECIQRhptYUbV6paoaRTqSbSvpEZhrwhslEz/pOUDr+?=
 =?us-ascii?Q?B35XW7XmxUTAkzXLU3PDTnELfWhZd4yIdKwGBCvK/8LdrWepQwCbobuVMwHX?=
 =?us-ascii?Q?acuZcPFAK9L49EoDXJJbHjS0NP6JUsnWzuA2gnZK7Dm7KwYMqZttLSAo7h77?=
 =?us-ascii?Q?hBlkgy5L1kWNUr6zi9ejKyuxvxeC3pluYtSDhgcb3/bK0VofvorOb5nzsxWn?=
 =?us-ascii?Q?iswWoYz1DUTdujbdC7Bv8hvQ6UDw9+hZ+SVYIwWN+j5BEHxWvyKWrTWFSQjl?=
 =?us-ascii?Q?u8YFHnWwVHStIdSj5D7Qh+o7wXYlfVZcvjPKq7lxDhxosw89e+UriUctNeRu?=
 =?us-ascii?Q?5im7CxBqeRAixnIkLh31Oa3Cz1jHsxNDjr6N+AK004wgyHyZOgcfcTEmI/i3?=
 =?us-ascii?Q?xPEpTJJ1NURv6MxncxV1IAgJqpqjHcGZVNNTMBOcTC+BGlfPmqCr3zyBqYXH?=
 =?us-ascii?Q?uFw4DFfdMJ38auAPnQctSt/J+i2cLifNgUbu02/nT0rX9QoWoAW7MAo/Z2Cz?=
 =?us-ascii?Q?FY7eK+CO+7mEpHTBuam+lhtMiki22XHU3p/F3qhxhiqSFogNUTq1CItbGjvv?=
 =?us-ascii?Q?MeV5rZU7K/sedvtywSC3GdcFREFkSVHIXg4Pc62KNaGC0n/hfhfkIZwDalq2?=
 =?us-ascii?Q?+G6gP/XwEPlUpv3PQsChX16bzOxckt9DJhDSZiBimvIVsKdB+6uLq1Tmg81m?=
 =?us-ascii?Q?wzMKX3Qg3Oe2/KY/i73CWUfwYGX1URv6qVpNXrZbBL3kFH2+X5xbPeTePKL6?=
 =?us-ascii?Q?rVwZgQloVs9DOY5CvH3HsmtIsHM5NCt2Xrw2TuUPVFSBPG5j/EKjJH8G89ut?=
 =?us-ascii?Q?I4ABNnagjuAMocA6JiDSagpkQEXuT9W/bMkMhHP3xfC5OGXxcn5P8zvyDfC0?=
 =?us-ascii?Q?o49nsiDu6869jiEcDBE1Y/l0iuAcw7MxD/yaeWuP8GZuOE67CC5LFNrWOICj?=
 =?us-ascii?Q?0THFkL7/Y//RKYzBJw73Ku7BbgU7K3ZHRmi9zyf+oOZu+Q1RjY/UDvlk0pwS?=
 =?us-ascii?Q?FBG6xV0HSbkEOsfgNddFRR3R1z5lrzt+ADpFFcz+JLRkBQnwB1sN0QrjiUIz?=
 =?us-ascii?Q?My0xxIhdD6YHDup7hsKmAkEOjsHCATS7DT1TLIVpypOH9sxMY5eKv/tMXZXT?=
 =?us-ascii?Q?tjHo8M7z6YxGtvWGe01c7zhSVRm+pAVs6wnh31axjx12hAHbuxeNago653bE?=
 =?us-ascii?Q?wqJSmhcPsb3nQoJ/C3ydYjakVRJRKp7u1HNx8nSghAfj35/Jf2e9sY5Xo+KQ?=
 =?us-ascii?Q?y8G/PWLhvJRS3GuO+h35SCdbouxK6lqCrvbe7jl1edbC8XpQBmL8Bx7GsRKx?=
 =?us-ascii?Q?lRRWkL6dEtiUk6Bn+ibRfUcOa9TKh50RMgkT8L0H6Tbm/7Z5U6u+W8KkfJvt?=
 =?us-ascii?Q?pMXvUO7l+bBNLn2Fxo/XrJqLTlAs3pJ+GVP033E+QJJkban97vsRS20hsOjs?=
 =?us-ascii?Q?5G7W3mbuAvFinRvgfBFeUF6S9lelsmPYaIKUMce+t467zCyj7x6CqW/Gh/zh?=
 =?us-ascii?Q?u6CLS26IHwbVAq54ucKrmFVioaNC/P00c/1AmeQ8xPxffEkj5S4lNNioHifK?=
 =?us-ascii?Q?hKGoMEebKA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3909fe2-0e32-4eb6-f9e9-08df46e5a7fc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:07:09.0895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSUId5UzsnmfILqclyYlrYJ2jvMK1qPZhQTs2dmxeJVzkAaOFGdZKZHV26G0JF2us4teJlxGOzbyQ6CCoXqWM4ASaBCNYR4A1Y1zaQFBEVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7701
X-purgate-ID: tlsNG-4011c0/1795165633-5A9D9CFC-284D2B4D/0/0
X-purgate-type: clean
X-purgate-size: 201
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch is superseded by v2, which is now patch 1 of a series:
https://lore.kernel.org/xen-devel/20261120090013.271926-1-stephen.cheng@citrix.com/

Please review v2 instead.

Thanks,
Stephen

