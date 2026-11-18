Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C2A606A883
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 03:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=tXtOvrar
Received: from list by lists.xenproject.org with outflank-mailman.1493669.1693535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTWJl-00023N-7h; Wed, 18 Nov 2026 03:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493669.1693535; Wed, 18 Nov 2026 03:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTWJl-00023G-3v; Wed, 18 Nov 2026 03:26:41 +0000
Received: by outflank-mailman (input) for mailman id 1493669;
 Wed, 18 Nov 2026 03:26:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTWJj-00023A-3q
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 03:26:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTWJi-002wJJ-GX
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 04:26:38 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6afd1ad7-8faa-0a2a0a5109dd-0a2a450c9fb4-8
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 04:26:38 +0100
Received: from [52.101.46.27]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6afd1aec-f479-0a2a450c0019-34652e1b4e38-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 04:26:38 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by BL1PR03MB6040.namprd03.prod.outlook.com (2603:10b6:208:316::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 03:26:34 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 03:26:34 +0000
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
 b=JD5r9xtuEkxb3IVd+zGFJ4myLd5LM4mcCvcxnrjDpUUbIbSmiDXLewVDeeCNoMOE5vIXfISgMmZ0O54k7kxnHCIDDDAV3me3Xl2jW2SBHqJo7LpM92Et/BBtIcsrGuP8EcbmCKuXFaxZTorr/1ATP42lGw7WBYVeXH0+XB4EjFvJ6myao+0t3nzHFbLFPQ3fZe1sNUXIxH278cfDmdE8lUyeB/uJsrdPqhv0MA3mBeB4A6zg0hCmz7eq/EHmVy8GXZoloZ1P5j4Ji0Awy19sgZ0sgRoUKj0MMLqgI+6MwrMQS0zAPO0XBeUTU5FiTWwAp01i8AbSnA9D7srnC+dW0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgQW+a5+U+C/hOOK92YZNHBLzUcHumuI4nc4gk+AdE8=;
 b=qlpuuqBeC6dyh8iiWNoBK7BRC52vISimuC9avwkMU5LkRWTrhQjRjOBHKbH4DAA6I5wvrHQW4PloP0wsveptMyRhcKvHybLlHgSztN9sOs6TGDLYzmDdIugbptRVZxxut4v+AjNP/Ic0wgLTH47vfUjqj8ojsF3YVAxKTSwzxq25dLfSI1rc2MUBUiR2K5kGUV4Z7LhNprMoxMrT4p40hnWd26Fv+h6Q6H1DpMdZl4PSwUDvlkmvTjEcbpLTtIBMolBvDcrdR2GxYINgpz/rYWrTg286XhG17QP07uDBOTxknsaFtoGVIhbR0LSbO2NljAkqFkpX5/crDIfGA2GpNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgQW+a5+U+C/hOOK92YZNHBLzUcHumuI4nc4gk+AdE8=;
 b=tXtOvraruHINtOQ5aICH08AlETo2ayy+/L22Rwiqx32FxfGw785vBMguwUHC3UWamX3v9mZpDm95p7aCowTdNIwjGxMJs1r7uUAt2Sdy5AgESphq2ulQARFqzD3HVM2zKng3lbG3WQhgn8CMQSZ2698e5u8JjzYl3z8I8lCjvys=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
	xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stephen Cheng <stephen.cheng@citrix.com>
Subject: Re: [PATCH] x86emul: Don't adjust the memory operand of BT* with an immediate offset
Date: Wed, 18 Nov 2026 11:26:20 +0800
Message-ID: <20261118032620.441292-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <7367755b-e2e5-41bb-9b3d-494f6d17378a@suse.com>
References: <7367755b-e2e5-41bb-9b3d-494f6d17378a@suse.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:5::9)
 To CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|BL1PR03MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f895784-cc77-43a1-c10c-08df4523bf44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|56012099006|261021121427099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Iu4tzLiU57QxV0j2KfPv/pW3euwLHyLFQUsheT79hplSugRKrmWj6OqVtWwaQDR7fvd7XJewvcmbRPJlwreBb/+xYZ1nDKEeFbx+S4pfmCHfOB6q/MueaGj14NSJpReopM91bDzoRZsv81ZWIUft2jrllpJaksMtybrn4zYmA8gqUmqHWjXRaIWt7LsdmFwwiNFLD0Pf7jyB9Yqi38JZwr6GyCPDMrEvMyVCSE91wCcANL2VHi3h45mkV46bRUsGxvt/0Qx/O7w8XY+M5RtBQyxd6Xn/M9M8ZZ7rFc+N4zPW4PwHtDoWKR1Tzq+PbRyh0N+QmgNS/EbZAOpSp55UE1u9J4vpUo1gOoq+3fuD2PkZLW76RevL8XpWeWaiz6CmL9+c+TQ7Tt5Zon0NLpdArxi6VIQ4ec72SJzBobRrJtQGfLNSZqiwyaJB5yHF+o8SsRENhPboOfYer024k/WNa8+gNRjfoMVUksPEiHmJC33a/MusEPOIWSHuiSfswH110P5J0z6y/m0UauVIXxjyn+XeuTcIJkjjAGdg3+xfPoQBstB0HDmEw8NXG2UQClHDb2wPXbpfg2oTa4ApxM0QCnAxNwgo81Tb2p3vmdfSCR1kL6wzGkq0S7lxFUML0W+qbggtpg27J+rAGAtxnsVEiAELjY2qHY0+Z+pDFha/qgI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(261021121427099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NAMw5lhEtGjV1ozTyR9K18Dwr5UXo+FU01UdylYcHqdBg3Zlb8SBBBmat4S+?=
 =?us-ascii?Q?k8oLWJ8k61XlkSrLe8jCEAECwClxsgB8XlLfJqdHEJF/MFPZ/TTdj7tIsaev?=
 =?us-ascii?Q?ribZRBL/4sHXGnWGBCdxWENfl/LDo9sL7HOveCWHMDscEr+fNgFT+42ne2Xz?=
 =?us-ascii?Q?IfQv7TC4eTmePI05FeaJwzNVvYv3qpojxPjAHYhlyp3s8fDejP2xg1A3EDDj?=
 =?us-ascii?Q?FS7ip5FrgmavobHsTfgSD9JEktClwk7c/m492RM2odSxpqaXqZ1jF/2SUrtu?=
 =?us-ascii?Q?s4CV0/EYgOZqO50JYh6BhzvFdLJt5ULj0UURLsGZRnbHSj+xrVNKhKTxLHLn?=
 =?us-ascii?Q?xM/FQIFbWkf0bu/CIHezihZOMllZlaJw5b0ts/4JN0c3WSi9gZ9nJH5q/xkP?=
 =?us-ascii?Q?zW9ZUTRX3md87x4oz4Z9bOTCvFq9g2X32eEO6RhDbVut67aXoRC+r0pcq/7Y?=
 =?us-ascii?Q?EKV5P9kluX6In71ZB84e/7T2AxAZyXcdzJXkHSxPCBy914p6TpJhckyPKwLp?=
 =?us-ascii?Q?In1xMNZaMovFbCpgdGNHcHcSy53NAfCWpVmt0HiYnbVe2EwPY1/zTx5UZMVP?=
 =?us-ascii?Q?gieFrfJYeJSH0uy34RF6wyQubn5wGF7XRhZocsbrpUj88VATBoK9qFvLYKye?=
 =?us-ascii?Q?u8aWPfigvGFAuan2Dmvplp4hHtj7xcIoScKMPa3T+dEa0AfRFEZiDQqfnuBs?=
 =?us-ascii?Q?tz5Iq/6G7H1ImtQzOJijM1XkN4zKSWhJlM0J7cgjwtuC3AwK0sV4vCJByv+U?=
 =?us-ascii?Q?mqAbzpOMRCIX7aCxBaRgnEHZezu4xujowvB/HuxzwyzCUY3wRL8bbAvaWvuZ?=
 =?us-ascii?Q?KOm9EmCfnwIkkJACJCXNQGRIO4ovGUXfDwfA7iNB6BQVqSF1Lco374sft9NL?=
 =?us-ascii?Q?Dck+FBr2WXQVZ+Ov+qY7V2mYhFASoErgeR3v+8sgcpGjhaxp1LPT53KlT3K3?=
 =?us-ascii?Q?0FVJxqjfYnV+HaJZKouFw9ExySuH0K95D1aKk+A7TpdX7i44js6MTEYyO6OL?=
 =?us-ascii?Q?JYoIm5QbMMvZ2w3z2IDZ4z0rvODLQ73cjBSKuMUo1XXIbDg5MVfvjo6Jesy2?=
 =?us-ascii?Q?nhIA2aaBq6rGVI7gd5vanvwK/Q9/XzPsSe+d7oLXLfXEPdteZ/K+thGuUe4m?=
 =?us-ascii?Q?8QxWJLFhXxphV5FWc7fKTCTXwjx2owCwMt4AdxnJ8/N1OZqkCnyGNYNpLULZ?=
 =?us-ascii?Q?FEUVzA0C/6ZhAgPTj1PWg2Bu/snE9EqJVlZBVNdNy/6dDV5T1SCN1KFOH42s?=
 =?us-ascii?Q?SS6L5mZLClVfUEJBSJx52MeCG+vSRyyLCR8w9YFWW+SZp+obxdPEkfXvXymS?=
 =?us-ascii?Q?XdQlV3YqwgkI2dGhMQ1ZyJOcNf+h/iyFFU+7ZNE8707kYG/42flz1Uz8V/zb?=
 =?us-ascii?Q?RvEe60iwZ25PGW6zCHMGNNGlzD3y8Ia8VGEXaGS7rOLWY+wL8/+OhYYe7BOL?=
 =?us-ascii?Q?yEpdYqa8rOrFpukOPqAtnexDSelnQCA7HDM190idBszNAoxmkCylQjnAJocs?=
 =?us-ascii?Q?z0Unko8+axHFQAavyE2P//cyQAA047bkzuCChpPcS/sSzSjLIb6Vdx8Oi8sL?=
 =?us-ascii?Q?6tPZYwPu2inffwgT/Q2giG+hpvkdCKkEr850eteA0QqCM7KxZhfRho5Jt+HB?=
 =?us-ascii?Q?oTV7EZl1NV5oh+g2al3d82zZCQosu3WDIgfAAiB2qg+lWEW6juhORnujQMZr?=
 =?us-ascii?Q?q+317jNGo6Sh++2B9oBAApAfDzBS7rCythBU+nO0ON+a6g0C0ElhjUrm66z3?=
 =?us-ascii?Q?28ExxUYYAA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f895784-cc77-43a1-c10c-08df4523bf44
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 03:26:34.6305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8QUb7mo64W0ughGuNnMrzXMhMqc2bghLVklt4TcYHiYM0/bMt19nzcE5g07zvCkEEwcp9j9RFHKghiOvY5hembpDcyMT6f67a4nz+gGlhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6040
X-purgate-ID: tlsNG-d25034/1794972398-77ED2A5B-8D9167E7/10/78276251493
X-purgate-type: spam
X-purgate-size: 493
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 11:11, Jan Beulich wrote:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with a remark towards the description: I question "accidentally", when
> the description of the offending patch says "... and simplify the entry
> condition for adjusting the memory operand." I'm inclined to change the
> word to "mistakenly" when committing.

Thanks for the review. You are right, the change was intended, so
"mistakenly" is better. Please change it when committing.

Stephen

