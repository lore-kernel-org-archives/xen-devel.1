Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1881ECCA464
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 10:20:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451524.1666570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHf2K-0005iW-UP; Fri, 16 Oct 2026 10:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451524.1666570; Fri, 16 Oct 2026 10:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHf2K-0005iP-RT; Fri, 16 Oct 2026 10:19:40 +0000
Received: by outflank-mailman (input) for mailman id 1451524;
 Fri, 16 Oct 2026 10:19:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHf2J-0005hE-90
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 10:19:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHf2I-00AqOK-Ln
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 12:19:38 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ad1fa2b-e002-0a2a0a5209dd-0a2a4503ac08-34
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 12:19:38 +0200
Received: from [52.101.85.54]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ad1fa38-fae8-0a2a45030019-34655536c0eb-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 12:19:38 +0200
Received: from BY5PR03MB5315.namprd03.prod.outlook.com (2603:10b6:a03:229::23)
 by BL1PR03MB6168.namprd03.prod.outlook.com (2603:10b6:208:319::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Fri, 16 Oct
 2026 10:19:34 +0000
Received: from BY5PR03MB5315.namprd03.prod.outlook.com
 ([fe80::f586:75e3:eb6a:9550]) by BY5PR03MB5315.namprd03.prod.outlook.com
 ([fe80::f586:75e3:eb6a:9550%2]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 10:19:34 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEyQyScsI4M6146McLNi1dQI6uucGDEsQekBniIXa4wEg+50FzWRLWD/sCfPc8a52ClcNeg8zqFJCEX5/eUC/FTzkeMTwGGyLzTm3gQ16TCxY2VmVyipmGL+6hlaKKWNp2W7Usb/LTA+os1bcQB40rKMVzzYB5EXo/GqYih3nVMdmE2krftxTMc/Mjr6OP4DrBBt2qSWG5pywjaT+dq269rjgyoTvxrPxiBMhrusrGRLLNrjFzb1jgVBzB2ahpe7z5Tbfsy/XTgSTUQi+sqBO88bX8SfFjdxWgw7RRlswORJDUuykgPVrSgqFUIROGkH6y6iNPAiZnHkVTzxIbASkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCzzjoKJ11AfYPriq5SQxXuZ6IMbihJjcTq84GOQccw=;
 b=rzFZGJgsjlgJQuFDtwoSN4376QRfihTzRR+731dfQtsUF7Y53sECDuDwgmqfsqXjIMmBpCcyq+6Q5kCEqWxQ8xKHxd9gQv2Xz3yfui0sUMuIiq9CChQb8IXRUfbuCElEjdfqpCnqdSGD/yHEX6OIqQj4Cmxlhx4x8EfrU9u5T8KkON9lFq/TIzzt1SbdGQGy88MAouGK+HF6kVqqZTu7yLu0/0VI39qygemGe78cywAqfxpEcqnkNbyxeaWGnPPRSLGWFx3zWtDF9kmnBDtUUBwj8p+zAkqECkoPacWdGWHF/zmeswTOhrzKcQ++Hx1fR1M9DNOHzSbPV1HUX/NFeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCzzjoKJ11AfYPriq5SQxXuZ6IMbihJjcTq84GOQccw=;
 b=j0JrCmwr7FAA0D49ULviKQ2iZ1SyVEvN8SpeT3oAbrcTtaor9bbRe+sUJybLZkRo8w/vWdkJRTIin+XO4W78WKGHjQN/4JqZgLzXoqAPPabTqofySakh1MMSor2NWROsbMilFM44Swq97hs757/8QcZpattUHRFETG1DaCAS4ZU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: jbeulich@suse.com
Cc: andrew.cooper3@citrix.com,
	chunjie.zhu@citrix.com,
	jason.andryuk@amd.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/nestedsvm: write back V_NMI and V_NMI_MASK on nested #VMEXIT
Date: Fri, 16 Oct 2026 18:19:26 +0800
Message-Id: <20261016101926.269405-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d2b8778a-7f16-4938-83c2-429f4ce96501@suse.com>
References: <d2b8778a-7f16-4938-83c2-429f4ce96501@suse.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To BY5PR03MB5315.namprd03.prod.outlook.com
 (2603:10b6:a03:229::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR03MB5315:EE_|BL1PR03MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: 883ac888-5379-48a2-6ff5-08df2b6ef986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	yP+bWn0JcbgNwDY+HeY5lIiFTDfpTcZxVvV5TrgtTSJqC6yajtuM8X3xg0Jv+hOrt8SEfZEn+a7zZGKFM7A/qHTPOWOK6j2LWZkdMPoa6dTOiUbhKYRr4pXsdcziOFWCmeS92qrk9ZqUdpOcqySwgV2RVzgbazbpu0CJXSi0MWsQPrgpBQXgc2DrNshsLUiiV0bOBX1I/i2JVPx2UCfVuCQxyiFjqLhCVUi7ag/Y7bA9nie+vqZ92WD1q48V72ctKYuAuiqtXfM425GW4lgDmQvW0PUcMqoJBdw5k4eOjlFFgB4EJRIXX1R4wk7L8hwBwD/QHyJ+nocqyUfTvVo7SHygv7KIWkzmmKin4shidJmDv2akfLnhPQGc5KCHJoJD7P1W5YrCrKkP61i0fefqA0wg7L6CY10ovrRq3EAPpC79UqVtWda1ey4wrzEycW4Pe8NlQvN9B9qkikyCFX0hE6iYkgfawCPcOC/xrfsKFDo7fD2NWcqjCZ2AsY6WCelb7jpxv5fO+iY9Y4LHKAPMoR973cTQCTkJTUEIfsD82UfM3S+4kTkIcC93drYtMI7Hqg66//9W8oBTwu0h0ZJu81+gflaqviYvMd9d8yEx6JV6HILiaAWGori5BbzR++5iR52XwNd8BowYawa7rd5mOOasekKcRoOALyyXooUScdA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR03MB5315.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AKuB6jlwM/LmpmIJxh0k1ZOKKZMkpBzfCpkTCA2A4g1oKQC4tZBhGDoKqMYT?=
 =?us-ascii?Q?+JPnpkBy2JREiXwQ2gJBAp8pf3aPyPHfAyoaH33XkE1q4+iADW8susP1sr4A?=
 =?us-ascii?Q?EJaJRT4ZXXWH4Fz0HKNP1sMyyyjEVkz87aoy7TzCEYlnDxJ7xOtuITjjxPv1?=
 =?us-ascii?Q?Xv8HC5rAvReHa67CDjhuFjPrD0229S02ereHXRob5sTdmr85/RwQKY/RVYqc?=
 =?us-ascii?Q?be3Od6xyYDi+MsSWJrbhhQw9JyAzoqkPA4gM3SBevcwhSAtxrtpu2r3Oj+j5?=
 =?us-ascii?Q?6yakzU/sSGuP7/5p4U5Pj/35Zjz7chxwhtsVO2caHi2rjZO4j3HUhlWtcmG1?=
 =?us-ascii?Q?g6NHECFrfUAfQvj0qDqyPwaLAwImwXJJwhu81SLmZs0F8/n2Ch+elSJh5HVY?=
 =?us-ascii?Q?O1qnkK9KJ9dn89d0idCmn/LtHTNFBSX904Z38abPMlphalRb6zaAICzeFaRM?=
 =?us-ascii?Q?pOcxoXyEW5maHt7hUr924S7pi0lACTifU/gvHT7OvhLKhM0O5vXOf6cdTSey?=
 =?us-ascii?Q?jNOQ9GK1IYyqBvk30vuVwpoyMChSrH03rzz1iERY3ePXgi+Hk14Ffw1T7A5P?=
 =?us-ascii?Q?ChytXRG9dNbICVKWUKF+e6peZQUJ2bJdO5Nj+U0H6gnGgKFSga8sfCJw86H8?=
 =?us-ascii?Q?QU+qKS349r58IBOPZNmrGiMBhQ9/sCX3FDUtFGdpobQuMg0iciQsnOjU9tQQ?=
 =?us-ascii?Q?7+MmPfnX9ruO2j0roiGyfex3Kn5aJRc8QqmVqAxAOIGt9LWWfaQLyzAPLivS?=
 =?us-ascii?Q?p1x4ofCRFdYyimbk1LMC9U0+Y/gMqfuQntOL0NK3SF/IRfMOaS+abm0qXAon?=
 =?us-ascii?Q?oq0KkgwkIklBYfk1iC7eIfqiAF/xtW9JQZGXEBb6G+S9EOX4RTADjDgiHMhA?=
 =?us-ascii?Q?Ne+3kFbV0TAg2hV4WP5O/oueXf64IL3ByS+0HiDeGwcisg7cNX3weqCwMkkF?=
 =?us-ascii?Q?FDIoT5SwdE1cwBZsgFkcmBRp0IftyxtZS7yCFhNA1vL+OuGbrr7yLeVW9z2v?=
 =?us-ascii?Q?r+i+ZB5R1lT194/QR0+2qzTpPlHMvWb0hIv6jBycVtC11EQOc22cgEUPvg2J?=
 =?us-ascii?Q?q0U77ETvEpgzZdfCeJDa9jpD1MQgDRtMZ8M74//kpVA1N2JRLtDOJkqTlTi+?=
 =?us-ascii?Q?nPiJQh3V739+4ShzYT3XCO25FOhrBjz+YZcCzHB0FFNZKL3/L+2genT3RF3f?=
 =?us-ascii?Q?Ho3NdrZrdOFDo5IX/jIorJVS2LqmDHQU8L8kAyZezzVharCxNZj7RsS+RhX5?=
 =?us-ascii?Q?3TRcIzrmAFVAfbiDYSf3zbpd+kfMukSrLMUYa9JVkl6Q1buLfUUKZoamkPAR?=
 =?us-ascii?Q?85hNdOQw3O4Qms82OTtHXiPe1cREQW/SSFxlqTo6LgxE98xIT7FAnj/qiiM9?=
 =?us-ascii?Q?xYLrEz7QL4pMoTa9ATYPaYYu0dJgXyhDWucwBsGEXp+j3aiGDI+QhN1A+Dtx?=
 =?us-ascii?Q?pCdUfSJRZO38SNnDyh1rDLjhChwTgjhLvcx0CksfQnqyP7fg14QBUMIrurYA?=
 =?us-ascii?Q?LKajlo2rnHOMrvWetHAkox1bjp5p3X7R25JKQEKRRm8sJZvq39FTt7+L2Lwd?=
 =?us-ascii?Q?wNHhLCZBRUe7BcPXeyh/At37mtFnvD8+6MxJO73O82EmFgum0Q+6ZDE2fahj?=
 =?us-ascii?Q?VbqIoopaz/vItEi1UkmcmZpQl49W6piDJaSBsfoFLMa4tY9LtQYp1pZrZbf1?=
 =?us-ascii?Q?W0opPLVgTmTk2lY+xLJFq6RS1n9ak1Ntxtd+aijKlWThLTq6ek1nXHPdd2cm?=
 =?us-ascii?Q?u7kqkdOGfA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883ac888-5379-48a2-6ff5-08df2b6ef986
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 10:19:34.4960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzTRmwvHpysFY7hCBPYT55c+S89X3ksIka0JZhTWUbLuU3ndCMR/BnHnAPKiwtqXDblx9JFAc5zA3K1S7Ub+eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6168
X-purgate-ID: tlsNG-33051d/1792145978-6F0C94E9-32E603A8/10/78276251493
X-purgate-type: spam
X-purgate-size: 340

On 16.10.2026 09:59, Jan Beulich wrote:

> Is there a reason my A-b was lost?
>
> Jan

Oh, sorry, that was an oversight on my part. v2 addressed your comment
about the section title, so your Acked-by still applies.

Andrew, could you please add it when committing?

Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks,
Chunjie

