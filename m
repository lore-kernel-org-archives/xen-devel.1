Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09F1606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 23:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=yZhkeznI
Received: from list by lists.xenproject.org with outflank-mailman.1482772.1686571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQvcW-0005Fl-5e; Tue, 10 Nov 2026 23:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482772.1686571; Tue, 10 Nov 2026 23:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQvcW-0005Fe-2E; Tue, 10 Nov 2026 23:51:20 +0000
Received: by outflank-mailman (input) for mailman id 1482772;
 Tue, 10 Nov 2026 23:51:18 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>)
 id 1xQvcT-0005F3-UR; Tue, 10 Nov 2026 23:51:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQvcS-001s7F-S3; Wed, 11 Nov 2026 00:51:16 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af3adca-e002-0a2a0a5209dd-0a2a4503a9c0-10
 for <multiple-recipients>; Wed, 11 Nov 2026 00:51:16 +0100
Received: from [40.107.208.4]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af3adf2-fae8-0a2a45030019-286bd004d13b-3
 for <multiple-recipients>; Wed, 11 Nov 2026 00:51:16 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA3PR03MB7715.namprd03.prod.outlook.com (2603:10b6:208:512::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 23:51:12 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 23:51:11 +0000
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
 b=KXLAeqNBCNfw4Dh2xdMGoHAH+1Z5FYg6UatP+lz8trV7QyIuCDdzrDs9U5I/d3gs2oWjDEdIn5RV1/1eaYOGA9mokD1vniYOJA2Lra/J/6+pAsUBtVbutI8BP3yDWehKXP0YOwGqiBCO0x7YrPvsQSx6PQ2KuaWUWJiarEuu3kb/6RGtHVtS0G7AxTO3R3aB7xb3NMIGKnhRvquoqJdcLeOnnQn3FG94AQUpOiz4wZgmDkHNoX0KRAYIyjpHSG/93dBqDvh7Ig9LPiKUmh96vw9Ig0WbyJeCJoRed7pxciPp+di4xxNFCVqPDsGoiHwsmoxjmeSPssDmF/XvPaPUXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbP1YOaEu2PHMTVOo/IAULgMh8tNX2fZCTaWWZXFXrI=;
 b=ZuZ/L+cwQOLV4Z5xxotj7Q8y9cYs4pQ390wM0idY4RjM5vQetuQvXba/GKk+tvVY0jTJ3lQ27LTslfXUIOuMdDDmqw/Ic9f6OQet2oW32BYbqwfPWPh/Kd0A42oxOgf6lkWrlkgh9JWygPDA5/hJ5DqvGMTdSyEUN7W6mUGGFTDoqN88hLf7on5YIZdiG5OP05BH9L0XWfKXZ6B/k5YirZm2Dd887UPLSB6eVnQWVMSLIVaMmJF3K75RIK6WT1ujIwR0lr3qmoyov0q7F0xhwf9HtAIvWnneDgllY1IU9OeXyLMvQqhisW4O26Gf2a2IfjYvLDExnKpDbHNAsV1qBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbP1YOaEu2PHMTVOo/IAULgMh8tNX2fZCTaWWZXFXrI=;
 b=yZhkeznILq5Y3D572m/y0OfsLYreNSSUz9W6rpM7QzfQdonO4NyvpSSmVHPLObuuMx/jpVFzUfZAyKobAIVW9XxmibZl5F9Nl/qlXKSVYwlI60fHr+PXYfIFDCe3Tvst3/Wlmni+2KXpc3K/6pozBbmoLh2nlZMmWe67IQc/XoE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <42872e0b-c2e4-433f-b8ec-4b2db3bab3c8@citrix.com>
Date: Tue, 10 Nov 2026 23:51:08 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Xen.org security team" <security-team-members@xen.org>
Subject: Re: Xen Security Advisory 525 v1
 (CVE-2024-36350,CVE-2024-36357,CVE-2026-0004) - x86: Transient Scheduler
 Attacks (update)
To: "Xen.org security team" <security@xen.org>, xen-announce@lists.xen.org,
 xen-devel@lists.xen.org, xen-users@lists.xen.org,
 oss-security@lists.openwall.com
References: <E1xQq9L-00000003NGI-1q9A@xenbits.xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <E1xQq9L-00000003NGI-1q9A@xenbits.xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0228.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA3PR03MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: 1390eedf-5c18-47dd-53ce-08df3f857fa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|261009223027099003|10067099003|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261021135927099003|261022075727099003|261021121427099003|261022105027099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DxuPGLT2cxV1wxE583jfDTFDLLuHBCW++QM0aTbkiA1HYwQh1qPCgblfVR+3iOCezaoUtWHWmx5Dz2ASh59hjp96RwaLvR5qN1Qxu4KSlGI4GbRL6rm7kcsBRSkqFtxib2dv3kfuZBNKQbyk1piou+slq68/xQnx+2qYEHlKRm38eqj+s7XOZJljxNYm3V4lE21zlrx/7Tn8E57jCrEL7P/QwYzTEVi5iVLP8Y3wqydse1tTiVc4282BOu6HmgUyQ/Od32K/O41WYsqPoidNe31lne0VJmJM5tyxQB6e7hJ08/ogDibskhTphwvW4pa+ePPWF3OGseSFfsGxtSQA0a7ldZwQAwU3IMmFlWKXmimwpWofpPtXbLC9i/u4HfHhRlVEIsZ0FVqXzorrCYI+NYdKpzDqfZj1ifucxMvYZjBsNf1oRnkcaOmjj1mywmk/kIPlZJgbTgQoIrySv9KbHyVtl5xzmznW2QNapeGoZ1QeuBZYxguPSgUA6LQun6yTyF7pKb91G+Enn9Upem2zAfOo/rLZOmG2GlHPq1/cXzSrdQZynDh5Q7atdJ5fPTATKEpGcaUX1+BldpxtZEnyGOHboUf0DvZJhBHliYnZLw+F/7M4iNjLHz6+qUub4C5l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(261009223027099003)(10067099003)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021135927099003)(261022075727099003)(261021121427099003)(261022105027099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1lUcVRvcnF3NDhrVjJYSXpBRzVONjFZbXJWZWsrcTBGZEtKN3hQdldTcGJ6?=
 =?utf-8?B?RHN1bE9uek5SY1I5YURVSTU3K3JvVjRyVkcxU09KUU9mOFVWWHl3dDN2UmlW?=
 =?utf-8?B?Z2NvK0dOb3czb3VYNG5VZ2JlVmFYOXR6VFlTZXY3bStFeVZ5dEJFTElPdGw2?=
 =?utf-8?B?ZldhT0JmQWswK3VzcTdWZ1YrOERCczBlV0Z2dUlQakZTVXoxVFgwMGcwb1dK?=
 =?utf-8?B?OEJKLzZXR2pVRlUwdnVuYi9mbGJ3NlNJUGo3R1pUS3dlQWlJdHo0YkowVnZX?=
 =?utf-8?B?UFBDc09sNDZIRTlaOXZYbit0SWJ0L3RVVlVMNTN1RzhlVXNDa0R5WHYzaVZD?=
 =?utf-8?B?ci9RMVpXRVlXOTBnUmZ5TXZHeWNIRFhYZUNJRzZsMHdodXIyWDNHU0k1MVRF?=
 =?utf-8?B?NkVZZ0xMRlM3OXJYVGwwWXhHSjFXN1RnTzBia0hUUnRiTFhKdU9WNXFMaWY0?=
 =?utf-8?B?VldYdkJUSkpDL0NiRUpYcGxVY2I2ZjQva0xQdE5mbCtBT1NRclR5Rzk1cjNO?=
 =?utf-8?B?VTdWV1Vtb3pXOXdMOTZIWUJrNkhnREgrbFN3NDdPSTVRa0JNV3YxV0E1WkQr?=
 =?utf-8?B?WEFlK2FvZisvTnAyZmdzb21DT1lHRXJZcnZhdG15RXRUYmVaZEpSQ3RKTDYr?=
 =?utf-8?B?TUNJK2dzRHRqNlZKN2hMdGQ0RHNCTlNvdEtUc0lXVWpvYVdCU0R5ZUlKVUxD?=
 =?utf-8?B?WUkvdTJKWlA5NDdqN04zTkdrQVdweTVaRy8rTytaaXpSRXBWcTZTNmJEeTFt?=
 =?utf-8?B?MTVmQndBUDlrVTNyNnFDcHBhZ2kxMUxucXpxOXc5SnQwckZHUjF2ZjNZTmtu?=
 =?utf-8?B?OW82SmpodUp0QWFBUEtYZ2h6SVZ4NkJCSDZuRTNrZ2EyYWdYblJtM1EvcW45?=
 =?utf-8?B?Q0UzMTdqWFAxMzZFc1hVV2JzU1MyQWJYY2VsVFFMZmdFTXNheS9aNVl3d0Q3?=
 =?utf-8?B?OHdkMW1WWG9yWW1PbTVaL2dZcVVLWHF5V2FJY3ZicG1ManFLOUl5VXV3RTEz?=
 =?utf-8?B?QVY4QjV0Mkw0aUphRk5JT2JIRlNoR05RaDhZMThLeWxpNkJ4cFhhWUpFVzM1?=
 =?utf-8?B?THREMnVTZjFJbVB5REh2RTBUREtvV0YvUXZCUnZORHYzUEhnTGt5WjlZM0gx?=
 =?utf-8?B?ZkN5c3pMNGI5ZGxyaWxBSTR6cmxtc1luSTdjeThkLzIyb2diOU5mNlMyOU1K?=
 =?utf-8?B?NHFUNzdmbFA1S2Z4Y2hmSnY0d0gvbHVLWVN1YzlLNmhBSXVuQnA5ZDY5K0ZR?=
 =?utf-8?B?TmhGekxHd2Myb2REVW5sMzh3czA4RVhwWHZKM2szdTVoODNSWDVvL2o1Vk10?=
 =?utf-8?B?VVNySlREaHp1YTk4RXo0QXdBaTdRa3JaR0FjZlhiMTBHb3dHa3JueXIxOFNh?=
 =?utf-8?B?dFBKMDRDWHllVE15VVF4MFVvc3E0T1pDRy9zemxuSUkwSU15ZFBESkRQMk4z?=
 =?utf-8?B?Q1UranlraTBxSVRCbTFWTG93Z3RCcXF2bldnditRWFl0S0RDMWQ1WUhxUVd3?=
 =?utf-8?B?WjZ1VUpHTzBySWFsM1d2MGJNMkRGbE1yVFFGRFpBVS9QOU9zamxDdjRIRGRQ?=
 =?utf-8?B?UFVTRFpQWFRnanMwc1hScGFEQXk3NkJPaGV3SUlZWWpMcnJLVkZXOU85SzRB?=
 =?utf-8?B?WUFPekZrbCs0U0hFM3BKSFVnanlmS3ZjVVBhaWhMeVpxNUQ4SGd3MHd1Y0dY?=
 =?utf-8?B?TWFSd2dpRWlnRWtHWGZiZDIrbEdtVkNNbTIwQUlQdGVaV3hibHI0NjZQdUk2?=
 =?utf-8?B?dXp1NlI1a1BiUDJwK0tHUGsweGVXNWIxcVQ3SVA5My94TWNTZEcrV2toK0xJ?=
 =?utf-8?B?OHJ1b1ExcUVtSGhTYkZ2WVVHOUZTdkdGSytBalRrZUJ3YW8yeVQxS0JPeGw1?=
 =?utf-8?B?enE5WWt6Rm5iYXJsanp6VTZYVENWQ0JGWWl5ay9ScjUwT2duTnZjUG1Nb2k5?=
 =?utf-8?B?VFdLaDJCMStoUmRJeCtMMWxXR2IvKzZGLzVwNjh3L1ZOc3d6SG5HQ002eWZC?=
 =?utf-8?B?a0F5Z3AwYkI4dDFEaDFSYnhlRmUwRnlZNmRaUzc5aC9RMGF2Z0dmS1Y5VE93?=
 =?utf-8?B?aW1TeFFjODBybW80QWFrRGtMU2hhQzRZNjRjVFlMMTU1ajAxbHpvV3EvalIy?=
 =?utf-8?B?b2ZwSTVKSzkrTEVIcWUzQkhaN0JJaGZCZ2ozWHNRbTZDLzlIZmVLb0t1RjRQ?=
 =?utf-8?B?UHZpeTA3NkZGY1h4dTdkQjNSWFVXNUtsd1NwVlZEc0MrN0FTQmZiMWJSN3Zr?=
 =?utf-8?B?c1hpWHlVUXVlVWlSK25udE5vK0dHb0lZaWpXcGRURVMwTWM3Mlo5cjlnTVJG?=
 =?utf-8?B?VjgxM3lQa3cwN3NBeERlT0lZVUJCcGZNR0dZdDNIdnYrSFZGa1p0UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1390eedf-5c18-47dd-53ce-08df3f857fa0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 23:51:11.5955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ykq85Vbv/q/+8nMFI6PnWdGybDgNusVYVYRaShgOHc/9oobmG5azk+ELP9Gezqoe3V7iTkRjnaGXfW9nhZPkdTYqHY20eWOLTBihvGBWk0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7715
X-purgate-ID: tlsNG-33051d/1794354676-770F64E9-F88D4E15/0/0
X-purgate-type: clean
X-purgate-size: 1371
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/11/2026 6:00 pm, Xen.org security team wrote:
>  Xen Security Advisory CVE-2024-36350,CVE-2024-36357,CVE-2026-0004 /
> XSA-525
>
>                x86: Transient Scheduler Attacks (update)
>
> ISSUE DESCRIPTION
> =================
>
> AMD have discovered further properties of Transient Scheduler Attacks.
>
> The previously published XSA-471 dealt with two TSA variants, TSA-SQ
> and TSA-L1 on Zen3 and Zen4 CPUs.  For details, see XSA-471.
>
> AMD had previously said that Zen5 CPUs were not vulnerable to TSA-SQ and
> TSA-L1.  This statement has been corrected, and is being tracked as
> AMD-SB-7073 using the existing CVE-2024-36350 and CVE-2024-36357.
>
> AMD have also disclosed a new TSA variant, TSA-Fill, which is being
> tracked as AMD-SB-3031 and CVE-2026-0004.
>
> For more information, see:
>   https://xenbits.xen.org/xsa/advisory-471.html
>  
> https://www.amd.com/content/dam/amd/en/documents/resources/bulletin/technical-guidance-for-mitigating-transient-scheduler-attacks.pdf
>  
> https://www.amd.com/en/resources/product-security/bulletin/amd-sb-7073.html
>  
> https://www.amd.com/en/resources/product-security/bulletin/amd-sb-3031.html

My apologies.  Both references to 3031 should have been 3055 instead.

https://www.amd.com/en/resources/product-security/bulletin/amd-sb-3055.html

~Andrew

