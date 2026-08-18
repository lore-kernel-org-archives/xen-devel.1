Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65200C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 09:52:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393869.1632685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwGU1-0002ov-F6; Tue, 18 Aug 2026 09:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393869.1632685; Tue, 18 Aug 2026 09:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwGU1-0002oo-BZ; Tue, 18 Aug 2026 09:51:49 +0000
Received: by outflank-mailman (input) for mailman id 1393869;
 Tue, 18 Aug 2026 09:51:48 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wwGU0-0002oi-Jp
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:51:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwGTz-00BBLg-Mo
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 11:51:47 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a842b30-8faa-0a2a0a5109dd-0a2a4503d28e-14
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:51:47 +0200
Received: from [52.101.72.114]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a842b33-fae8-0a2a45030019-346548723e9b-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:51:47 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB7319.eurprd03.prod.outlook.com (2603:10a6:20b:2b7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Tue, 18 Aug
 2026 09:51:45 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0315.012; Tue, 18 Aug 2026
 09:51:45 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlLXGFQ++o/9yJzw3TuHi8WH5sxDFHixrFU8d6Aa269kzerCBILNv4kTp9xpvxEKTwYWqAGxqz7ucrXfYXkR7ZPnDFIR89Y5SNuSKjV/UJ7upOYAKGA5uRllXvE+EOixUiM7a81dzYDBsuGrxQ8eWf8GDUUL2m2c1Dk08XaW1AjBFH4QwqgHB5hvRPZ+RmqhuDmT4nRd40leEZ2G8bxvCZ7xbiqnWaUuJ4CYldNtKz/c7wMSUUYCCnQ81aoQlMody8QE0nWmX5BDSKCa0JxgGrYRzCXK/fq+rgz7G3/ByCMaHCJI0/lOTp12aZI1b3H7zwcfx8fW+eeDszyRSspMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++vue6zmpgd1AiBfELRsqf8M3Vb4q01LCid6m88uRVM=;
 b=Dgw4xYI+GZXDgOn81NccNbxIrkvb+RUav9lj0BV4fqeGMVc20Jvq9XSwfLXonAu5ojZQCfGnHRn3R/vKrTzRbZ5TnQhSQsDNAlrHYZIb7ahb34dcGoUxuym1MjnvMRjVn8QTKxUA1ak51IVQHVND8jgVpLYApnmQAVmNvXVVZlKzlWZl4FgKRCKIh1GCaRSV6SP0mAnkGyWulkEDZAhFz/xaWLoJ5refGgXLOkEiDPGRAhhm4ds/qoDL+G2bdrh9qSZmNIvP5xV71mbDVGTWsKGmRmJVXW1zCAvxm09wnhl1+uVnSuxoBHB35NQCTeEAQYYBIJhozF11wXE03CNbcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++vue6zmpgd1AiBfELRsqf8M3Vb4q01LCid6m88uRVM=;
 b=i1s48JBWbH3B23gChhL0AYCNWdJjlcmStoiSwJttZd8ZW8DT9+hv4iJWSohfG+yvGO6wRsDevmLky3H/f7A9a+SIN/dpoiLzLg1hJu4PMKUptrW1tRFprzdRtBupfkspNHjuoG6U4NQG/QPpyghHpOHjW6UzdpHaV3OjYl/tPsLRjKGDiOX/7BzL16JnIdwGQTOsz9D0IrVt5kjPn2kvFFhLoxfomhGzrfXzzBzqQB9Rvoz5m9gFl/qnh2JqmdtUkYrBKEHjo83vszW7jKXu3Sk6siJ2EofiLqi0IHHXa0Bv3WE958cIvjk26hqYnjBlIDKZCsxDJopspMupJpukhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Date: Tue, 18 Aug 2026 12:51:41 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, Jens Wiklander <jenswi@kernel.org>, 
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/3] xen/arm: handle irq_set_type() failures
Message-ID: <w5cozmwr5bh2iugoslfjwxhhqlijbfcmrh2rgiu7acspysitl6@umdjbcatzf2o>
Mail-Followup-To: Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, 
	Jens Wiklander <jenswi@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1786385827.git.mykola_kvach@epam.com>
 <d4087afce93cd4bb1779507393ac74c5dd5baea3.1786385827.git.mykola_kvach@epam.com>
 <68b346b5-e4fe-455c-9f7f-f4c9d2b3ed73@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <68b346b5-e4fe-455c-9f7f-f4c9d2b3ed73@suse.com>
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS8PR03MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: 0644861c-9fc1-40bf-47fc-08defd0e508e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|4143699003|18002099003|11063799006|56012099006|22082099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	LXpNpPd6yPqxwwA43l4LxrHGolBCGk25akxYJxaE3agiI/9w+LtkQHrR851FWo6xkSecMq3JBRAvJe9zZggvlA1ouybGYzCS8OE1SZh7BdMRMCXXSHcsBOtI/7/wGs2xebmnWqbye5tPUW03vCILbEVGbCtgun2qoRaooBKmkMwcxjSUR9lYlW5uCTUF0pv7lxPlZI+HOHyx5DEKmmHiEZKUULd+s1ihDfJEDW7pPotZg5Zy1Rffd4SMtdfEpCIvrHpNB1/j1DTWHzhSvbOlA8TskOn5CDAHVksOLNmnWMpVWDWCVngEJaim/4S6j8f0K2HWlDWN/KekklU8e2Ad6FqxjiqxxJFpQzvYbkdi1wBJXm+7eDAm5Z3o11GHeyr10sFhy/ir8jWKXio5NHNRU8DLhBYlRN4MHedwnOtbEhPIkN5ypU40kaZ4xmj+x6wtb2K47f++z03rw14NcSmre13FUuFZQ/53VXY3hXgxe/QkYNQtn108Gu0PMRGe9bq1kjs0IW/rEOxgSJNwwvm5Rui/KUtxFNv9BXgtnjl9iJWmoXkzAU4lLNKZN8WwxQCHhcXJceofugLV5us8MQFPObOI8uBoHRL5CugEvmH9GRfUD3WklzQ79vwyZ3pT5vMZD9Y3k6NI/4AGkbMm57HO5KfQr75IgBoTNGDpXKa+sA4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(4143699003)(18002099003)(11063799006)(56012099006)(22082099003)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDlrdWxTOXV2UXVmNUZNNnZERWMrNWo0Sk1HNzZDeFBSV2R3WGk1VEZYQVlU?=
 =?utf-8?B?bUNnUENVY1FzWFdaMjROczRNai9NZ1I1UUptK2Q1MGsyeVpUaTVkUWhuZ2l6?=
 =?utf-8?B?KzJzdzIyeG80V2N3M0J4dlllYkJTWWtXdk1veFhpK3U5TnA2OGZINVA2eFBu?=
 =?utf-8?B?YzBsTDF3TDBQTUFDVkc5TGVqT3kzZXdGYzJ0dnJnZllESS81UVM3VVJZTnNK?=
 =?utf-8?B?MGVrNjBHRGlCVEc5QlUreFJFdkh3dWcxYTY5NHlpZWpnY3pPbk1ZUGRCRDkr?=
 =?utf-8?B?L0c0TzBCU1hLRE9Ic3U1NnY3MFlmYVNacXFTVHlYclV1b0ZWTFp6Vy93bXBw?=
 =?utf-8?B?TEpmdmJSRzJXYm9xSE8yckhmUlpGTkNMZHRxZHRBdVY2Um9hNlQydm5rZFdU?=
 =?utf-8?B?Q2Q0ZWJGY2hJZVRvVEd2eDJ3YUs1OWNXdFdlbEdNNXMyb2J1SW4vMW1KZnZX?=
 =?utf-8?B?d0s2NTRDVUxxdjl6eElyVnYxWWhNaVRGQVBrc3lPYVQ5VmQzK3ZOMi9FblE1?=
 =?utf-8?B?ZU5TcDh0djFURVdxSUVwQUJLK3hhT0ZIbVh4dk1ZcUsrb2grbno4SjJIckdX?=
 =?utf-8?B?RWVLbGlKTWFpMFJLTU1lckNRS1JKbFMwK3VDYlg1YllyQjJMaGVEblk3aU5o?=
 =?utf-8?B?VXA3eUU3THk5ODJEcnc3aXpONFp1amNSNVUwenc0SGRjKzlsVys2eGZ6eXFN?=
 =?utf-8?B?OXpyOFlRTGJObWtCWkxXem1SWUZROE94Q2E5NVU1bm5SRldnZHJWYzlydFpX?=
 =?utf-8?B?NmN6K1ppRzBFR1JaRzhjemhIT0VSV1VrMU5xNnlQWW5QUFE3Q2g4Smp1MDds?=
 =?utf-8?B?Y3pmaHdvVlRFaXhVYVd4b0toQ3BlaTFFL0JvaE1Da3o3THdwdkc0Zk9WT0J3?=
 =?utf-8?B?VkdsK3FrcU9VL0Nsa1BLYkY0b3k2NzJFY1RpeCs0TVNnNWlvNmtYek5yTEgx?=
 =?utf-8?B?bGM3Vm1aL0lCZ3RCMjEvN0ZweHd6N1AwUDZaL1NVWGRSTmlHQ29PeFlDOXhE?=
 =?utf-8?B?S2RxYnZwRWJhMzR6ZnhkVlExWkJONVIycjJRY1JWRlFuQWg5d0pmR2JRcHdn?=
 =?utf-8?B?c2xoUEhkb1doUlNtWFFFcnlrWVZmQzc3NW9oenpoc1M3MzQ3UXVLcGF2OUY1?=
 =?utf-8?B?S1lQaXZRSTFiTjBBeWpkdUdUOUpLamliZ1A0Q0x3OGZFMkJRd01XYUpXMm11?=
 =?utf-8?B?aUNZQWRRSnlZcGhNZ1Z2a2JFTHZLbHMxUTVYZnpockd5Q1RscUF3dm90cDVQ?=
 =?utf-8?B?RWVQSFJIT21HZWlCU3ljdTdqdUxaSi9OSmM4cXllaXRQNUpmcUNISDkwbzV2?=
 =?utf-8?B?TkRwZlI3Zmt3UEFxZVRuY2pjSEM4bmFtbm9ZSFNkRk9HVHFNK1dYWkhsR1ZR?=
 =?utf-8?B?Y3F1ZGdBeUs5QTh0QXNkc1BXVFk5MzlaK2dleHFhN0NCTWRPb1lJYjlYN3dj?=
 =?utf-8?B?ZFFGeFBsRlpRUmx5TlAvN2YxZk5ZelhFckFVRy9TYVdjVTA2ZW15RVRzRXoz?=
 =?utf-8?B?V1l4TFp6WHRINEtFT3h1Q1FNZS95akhpMG1uWXBXbWw0QzJOZmtGYUdZNXg1?=
 =?utf-8?B?WTFPaUl2UnppaEZDYTFSVlR3T3hzbHRkWXJLQkFQTkNRZC9Mdm5FUjBIM3lL?=
 =?utf-8?B?ZWd4SzM1Q3ZGOUZSVytHalRvQTVPdWI5MEU3UlNhd2hSNkR2Lyt3Q2ZIZlR5?=
 =?utf-8?B?NTFWWnJMbG5wSHBEWTgyejY3c3d6OGxVM1p4ZCtQRVMvQXNPdUFaTVRTSk8w?=
 =?utf-8?B?cUNXRlNwNjJadjBqekpWYnNwTWpIUm9PbWFVb2RyOTlNTmpHRkw1VmJvWmhq?=
 =?utf-8?B?OFJSaEJNRUdTY2VWK0ZpVGszSTJrcUh1R3djeERtYXJLejVyaWpmc2YzOGxH?=
 =?utf-8?B?QTRKcDk3akdvYUlMOEVVc2NkcTlRb1VHNlROeW4zdk5aK0xoaG5TcW85YkM3?=
 =?utf-8?B?ODd0YjZKak5vVjB1cnE0VlJONFdXOXZLTGF2UkFXelBUaU9BZkdGYmphSXFz?=
 =?utf-8?B?MmdjSkUyeGxFYk1DR2tDNTlaME9tZGNOWDE2eVZXaUFvVGVFNzlTcnkydTZT?=
 =?utf-8?B?MlFNa3hVdnBNMm5NUHJqZDBvbVhyVWJrVXVCeHVkeWN6WmdRKzA5UkZ4Smpa?=
 =?utf-8?B?cWZDTEhzOUZrTGtURHdmWm5qR0U4WTA4ZERqdGRmZi83TWVybnI1Nm03RWdk?=
 =?utf-8?B?MkJKeGpZQ2NtT0lWbk5CKzdETUVtYjZINEpMOHlFSWtCdnZMc2VlQXlseEJR?=
 =?utf-8?B?V0tOeW5YSzdrd1hXRmlGUFk1Mzl0TXErbVduV212aUlCbnB6VmNJL01zR0FS?=
 =?utf-8?B?Y29FTU0xV3MrVFJ3dDJFYituUXhNOFJtbk1kT2xqYi84YlZudnhHdz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0644861c-9fc1-40bf-47fc-08defd0e508e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 09:51:45.7962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9IZMTMtEOjYuQHcUYTBvY8f3AOgwPP28oJbi09rzfqjOD8+GXT0VI6qCmlcgKYWwOyc2alJelZYms0iBe9tQRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7319
X-purgate-ID: tlsNG-33051d/1787046707-6F2C84E9-676EE359/0/0
X-purgate-type: clean
X-purgate-size: 1299

Hi Jan,

Thank you for the review.

On Wed, Aug 12, 2026 at 09:39:55AM +0200, Jan Beulich wrote:
> On 10.08.2026 20:38, Mykola Kvach wrote:
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -1928,6 +1928,7 @@ static int __init ns16550_acpi_uart_init(const void *data)
> >      struct acpi_table_header *table;
> >      struct acpi_table_spcr *spcr;
> >      acpi_status status;
> > +    int rc;
> >      /*
> >       * Same as the DT part.
> >       * Only support one UART on ARM which happen to be ns16550_com[0].
> > @@ -1976,7 +1977,9 @@ static int __init ns16550_acpi_uart_init(const void *data)
> >      uart->reg_width = spcr->serial_port.access_width;
> >  
> >      /* The trigger/polarity information is not available in spcr. */
> > -    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
> > +    rc = irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
> > +    if ( rc )
> > +        return rc;
> 
> Is erroring out still appropriate when part of ns16550_com[] was already
> modified? I.e. doesn't the call need to move up then?

Good point. Returning there can leave ns16550_com[0] partially
initialized. I'll move irq_set_type() before ns16550_init_common()
and before modifying the UART state.

Best regards,
Mykola

