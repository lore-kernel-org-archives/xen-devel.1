Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBB2C43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 13:36:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1348907.1606695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYda-0003YZ-4o; Tue, 30 Jun 2026 13:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348907.1606695; Tue, 30 Jun 2026 13:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYda-0003YS-1X; Tue, 30 Jun 2026 13:36:30 +0000
Received: by outflank-mailman (input) for mailman id 1348907;
 Tue, 30 Jun 2026 13:36:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1weYdY-0003YG-K5
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 13:36:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weYdY-00GnjC-0w
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:36:28 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a43c652-5cb7-0a2a0a5109dd-0a2a450485f0-28
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:36:28 +0200
Received: from [52.101.61.1]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a43c65a-a01d-0a2a45040019-34653d01194e-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:36:27 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6615.namprd03.prod.outlook.com (2603:10b6:a03:388::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 13:36:24 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 13:36:24 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0moEERjLpQvAXmLAcFRM7LCl7bTAb+piIyHIQYbv9urb4ygZVgzSAf7lK6/PyjjGkSM8vmgHWbn1NOiuMtqvWdTgD6MWIyHB4Add71ltrAHTWyvqimGcu3Onzrvxv7OerCzOGhrKx0XYtHO/eL2NVWul9yjXDZOzA2Y36WhEQk21fJWavM6RIxt2AlwAXSjGbZ/wj/nALSz1i//3YiLc2tSoNacwUDGehPv7ibMBaftqCUzx+ki6gnoHz3dfgZx7x4+o+H2qug6h5o1MznhSnyQrFJEfRlAG7oHUJpFOL3cEjOKQZAnxnv2TIhzTWwbztVCswFtj+phSX6B+k6D5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzNZA0119K2uxmjW5Vvg3CGsly1UYWe8Vpfn8yNDTbE=;
 b=cYsCsCPPMtd97javMbZps1ax9Kn2KKDTPaz3iZxlnJDLhLquuoEOyMiwyH1EBkgOStys4IwqBS7Msz7eiWpDBI4FFtc2Nf0UP0ojWuQ7PJt6ghquWQ7rfcXqErkdfIiFRnnglkhUD8QtABURylFM13AHU/r+j4Bb603jIr7/IUhc5xP3OZvUFFq0XEyGwgzUApi1HuF9N/IVHuYP+fCGflqND6mY+wLCu2deSi2OJWLND46IPtmKWwzLAbRZo3cYL78HlURmlFN+2syHjI0M9n4UjCXIXkcUwjuXpXRhDYK/5WGM7OMzwN5fNeh2SMzc21Z2PYNvctXEt2VXaLfthg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzNZA0119K2uxmjW5Vvg3CGsly1UYWe8Vpfn8yNDTbE=;
 b=ifS8XencRGFV0+aXCFskOqB6WZW0eQmK/wcBVm/+Tv6XEsWpbyaIk6tTueFCe0Uey/zBIn36LfOc94V5quY5ZyukbX3a+c0znLLwLtbgLe30mVVVD2TeMN3mdP+7Wnn+ZCQXHjaSKrq5hJMQWiVVqTMlltHzARt9iUlL8JjvluM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 30 Jun 2026 15:36:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] hypercall: mmuext_op is PV-only
Message-ID: <akPGVJm07FjShOx_@macbook.local>
References: <7dfa254b-e61b-4337-aa54-b6f14a28d0f6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7dfa254b-e61b-4337-aa54-b6f14a28d0f6@suse.com>
X-ClientProxiedBy: MA3P292CA0059.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: 715cb108-a6a3-4402-0e63-08ded6ac940e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|11063799006|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	f54lnj8SvJ0Xksi0a/sDHQyWmNbV2dfiUTe6A1hFB6q6kOqotjBA5a6Z/mHrSOVHVHxxTBShcm6xW/8J6mdo8XdU5OrC90iK1+bicSKPWVFdRzpnOQbAHFoJp8ixUkZUDB5YNn7K8O24NJaWLsibX7McSjzCp/CTTGSRGQUmZVE093/nzmuB0K2P2KEQbe49oM3mWXqWpF0XSxVjeHEjbzRvY73VcIRyXJyXtcnAzpi/AlyBifjFQKdMoZ6lVdlUPwP4MtqEfiBCsDUOWLTCy2JxapnYNpd1+BXoG5u/8ttQ0GwtR3I0EitfhSIHZOLVPDN7TnZSOnrviXX8osDM5Qx4w4sIcM8pDt2bVC6NqitFKOOGdZkGoHXHbwCV+wpvnnMD/UdHDgBKyr9nzdTupsX+FNBA43Yv9IMoQiJySZGcbe96VbhKxcIawe/k2kaGl8NAxGXIkyo/e6Y5OYH26p/pOH5yM+SnqHwPnIRfEf2b7SCcg8eOEJcFaNFhwANyw0wNn5Nn5WaXxfGQGOKBpmvvAEQNhF0YreJaQB8LkKKMYu1tCgYxnH8Q/0yD4x4mvW0zEyatUxDcFrtZ2Zzt980Wgm6GZFdKRFF3hyQe1jijde4804Ogf/vwnIkNJ080tBA0kweo058SJsbc0mPV6wql4nZtGn78viSvXOBt/vc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(11063799006)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGdIeEU5SkJLa0YyL1QxV1hjOXp0Q1MyTWVwZXFpZGdkcXBKeFFpTDAwN0Z4?=
 =?utf-8?B?UUN4Zll0Nmt5SURIbWQyZzhyVGY2bkJTYjg1WG5xa0Q1UGR6aGxoS0oyNi85?=
 =?utf-8?B?Tk1xaFIrdVQvaERTWDlHdlJaandwa21KTmZ0QkpvMXhtVEpjOFpnczdxSWFi?=
 =?utf-8?B?UlV5MUJyZEpxaTdCZ3lpN3ExQWJOY0tFVExLellpcG1jenF0dnlsL2RJYlhF?=
 =?utf-8?B?SU9XbEJhcXJRcEdLMGNCQ2VtaHNFRHZMQmhjWm1QdENDblhMZjJvZkhEQTY1?=
 =?utf-8?B?b1JFNE1MTnRUM0FKbXNySnVONWxtZDd6UjdtWnllUDlGcGkrRjloUm5HanRE?=
 =?utf-8?B?QmQxSkc3RUhUbzJRZVlxQjFNTFhTNGlzL29FZ1BGcUgvZkRCV01UWGlSTWNx?=
 =?utf-8?B?Rmlwd0IzMXBzRlgzQTkrZzJ2OXhoOFh1eGFkMDg0TmVpUTlmSGhINW5TaUcz?=
 =?utf-8?B?SHQxUUhVR3RkRi85T1JrZWt1azZBV1ZqMDZ2N1lIbWUyZGpNTUM4N1ozeHBX?=
 =?utf-8?B?VGtuc2cxaXdXczR3eVlwOTA4QThhbGxHaUxJUWdzNnJFOUZnR2h2NVpKRWZ0?=
 =?utf-8?B?d0NBQ05xNTFXcTh2UFhDdk96WUhZRlJuTUJOS1dKNDM2T0tHZEhSOUxRNWRh?=
 =?utf-8?B?TXZCZkpzSkR3NUhlMDYxdUI5NWpRNXBIK0p3elRqaEVDdjBlT3EyV2ROOFpl?=
 =?utf-8?B?WWNaR3hscitjc1BlM0hoU3RjcDNQYUlsVUhXZkM3WHdWZWU1TEFOT3lHWlVY?=
 =?utf-8?B?RGdUZHhhNlp1RGFDOTFIek03azIrYVJsREJEQkUvdi9MY01IL1d1bTVUT25o?=
 =?utf-8?B?U3VVL1poYS9waXB6QTBsMW43MGs0dEtYMFFxM0RDZTJoRE1UMWlvRG5wMXlK?=
 =?utf-8?B?NGpLSTlkOXR2N3RXS0FSSjJ6QXVlcGNVRkxnVDNadG1OMU4xd3VVek51NnEw?=
 =?utf-8?B?WExOZG9PWXR0dFBDYWhUSXg3TzFscTVYalJERnVMU2k5THV3NzFxcC9wNkp3?=
 =?utf-8?B?Mm9DQVUwa0hxVnpZUUVWNmhSdmJRa2xJWko1clJncGxwc2NlM3o3M3pqcHg5?=
 =?utf-8?B?MUJ0ekxORE5VSlkvMFBYV2tnRXJyMUVGWHNkWTRSdWhlMDNBZE80TWxOeFpO?=
 =?utf-8?B?bms5MURCaTNuR3NDcWZaSnRhMnhsQTVEZmtUVTE2UFgreTdlUWNXRENuWWd5?=
 =?utf-8?B?TXhsMXdnN2NjQlkrZkNQeWFuTE9hNjF2ZWJ3aTVrUFhVanVsdncvYWhWUnov?=
 =?utf-8?B?ZkpmVEVJTnlyajA2anU2Vi94V0o3cWxLTE8vSkJYTUhLSzl0d2Y4TnNMNnhl?=
 =?utf-8?B?S0NGNFF5NVBqT2lDNlo5SUlKN0tWNlFUTVFVcExQTmtsYURzSGR2aFNab0N2?=
 =?utf-8?B?Rm9Cc1hzSEVhalIyYmIvRm84dXZ6STJBWHJpUkw4RThLMzB3VW1id2RDNmN4?=
 =?utf-8?B?VVFETHNoWnI1R01zSldiTjV6KzgwRklEN2J1K3BhRzNCd2g0NUxYNnVvYnVw?=
 =?utf-8?B?R1pYcEZPN3k0NzhUYytZcVU2TUhMN1VRaml5cmlZM1k2TlhGcWtYVUJqMEZJ?=
 =?utf-8?B?d1JQSXNvTjNHRWNsTWxvUnJVNDJielpHQWxKTkJ6OVVha2syQU9KUFg4T0xX?=
 =?utf-8?B?L2ppN3g4T0xkSGNSbm1RWVQ4a0RGdWFWeVVJR043eWQrY3NWZTNQeGhOaUda?=
 =?utf-8?B?cXFXOTVJWHlrWWlSSnR6TnV3YldmMW1CWEk2dnFvZ3RlcnNpTzdQRUorc1hH?=
 =?utf-8?B?MERxZkVqcnhMb203WWJydmdHcjIzRTl3NlJpdmpOSUdVWUZHMzB0R2w5Wlk4?=
 =?utf-8?B?anRyWE1MYldhZDZPa2d6OHBsMURqeTJOc3ZDTmIvMUIyUFJ3dmJKMGNZaUtp?=
 =?utf-8?B?dklSTGUwYytxYU9BSlJyN2tuWkVkNUptbStGRkJyV29yS3M1ZnBvd0x1dzBP?=
 =?utf-8?B?VENLSmZ4LzgwOGlmbGE0YjJQRFFicEYvcEdtK0F0dDNGMkhldmttb2wrclBz?=
 =?utf-8?B?MDRKcmFoV085SFhKY3BhTjJnUS9xeHRHR01jejNLQWFGS2R2UDhrWXhWZFBL?=
 =?utf-8?B?QW1lcnQrZWRPbkdCYTBrSzRSVWpDZVpKRVpvaHQyS3NVQWFmUGJPTElwRElq?=
 =?utf-8?B?UTZrVHhEdHYyallxOWRjdUNhSEI1dE4zdmFtQldZdVpMcGV0cFg2ZXlURE11?=
 =?utf-8?B?L1ZodldQejBGdjFCMzIyb084MUNydlM2SEdiVStRS21LdU9XTDM1TGkweFBC?=
 =?utf-8?B?WVdGZ2pseGMvWGhyWnYyYkhDNlNpcjRGL3F2aW1kZlFlK0Z0T1g3N1h5OThk?=
 =?utf-8?B?RHA0S211UGY2aFA5NWErdnVJS2N6SFd6SS9aOVE3RldiSDJ1eTE0Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 715cb108-a6a3-4402-0e63-08ded6ac940e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:36:24.2636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDfqaE5/L7NYOBk7JiE5CYuuCJphz64osNpv9Y06PObvREGXu7MD5D4qupZNJlffcf5Pa5ezws7o9649F5XA4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6615
X-purgate-ID: tlsNG-ebf023/1782826587-2C7B61CC-5E13F23C/0/0
X-purgate-type: clean
X-purgate-size: 292

On Tue, Jun 30, 2026 at 03:34:18PM +0200, Jan Beulich wrote:
> In a !PV configuration the functions aren't built. Hence we're better off
> also not declaring them.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

