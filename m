Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D263CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 12:55:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440803.1658287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDiED-0002N8-OI; Mon, 05 Oct 2026 12:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440803.1658287; Mon, 05 Oct 2026 12:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDiED-0002Mz-LH; Mon, 05 Oct 2026 12:55:37 +0000
Received: by outflank-mailman (input) for mailman id 1440803;
 Mon, 05 Oct 2026 12:55:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xDiEB-0002LQ-JK
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 12:55:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDiEA-008uI1-Lj
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 14:55:34 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac39e3f-2eae-0a2a0a5409dd-0a2a4509a0c4-22
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 14:55:34 +0200
Received: from [52.101.46.56]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac39e44-be1a-0a2a45090019-34652e38f332-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 14:55:34 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5606.namprd03.prod.outlook.com (2603:10b6:5:2c2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 12:55:30 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 12:55:30 +0000
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
 b=RIfVusZKSi7uwFQdmfi2dVkIh8mReXIAKjiP4XjPnKrnyMs+yim6M/gw/rz+2a2kDly39AIqDrjQuAE62iQnyGRFTpfCiuialOG3APDWm3LcVdNFXc2BzBEvDzfrIfc3kTz4fhcPY3enkyMtyTnNA/GbpOY7OQB+aQY2yhrZMmOD9PVgM1hy5BQUMhZVmtpQ4jzbTjmCeT88ZWNeUtkFOSisfloY/ItjiAY/rwtbsvDVS0yU+kC97m3SM5ivhf8Giq1yZzC1MGyf/ciUapteBSDax+6ZtnjQfS7hUfUmlmM4DBjrQqazskEoGK3TKvryXSL560PrFj2PCL5y3BKfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJJxIiACYqjn5PvqtTYrvBX1lsWtT4q0zkVAoUxqe8k=;
 b=OKnVy59Hdfec6xicPij4UO62w7JH+8bba13hsDtLpAHbgAbwTnj2KHcpNkd/I4ZFGh3gld3yr+etaqjNMb5cHl+MHK6Ynh8DMCK6AwXkR6caLY520iALhHASWenH+gSiXvSM4Erpw7Wot4uWnDkDKdcd9QicLC2SbHf/Rzx57tMXFPP+vy+mgHE7YTGE/vYlkXoFuZY4l/dXMOdrxde8jbXsnZyw7bX+snGOhMSR7P2GpXBn1KW6qGEQ7AYuD4pGVB3ydzOTqpBGW+PbS6vCzLRuAzMHYlGrcmqjukN8BdotrqDjiVxk38hC6tGiNTnp4KVvNXj7g20vAsVYntGXUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJJxIiACYqjn5PvqtTYrvBX1lsWtT4q0zkVAoUxqe8k=;
 b=gt90cOx0C9SIBbv9ITVXqRAU+pAGjAVZpy/DSkFZ8Mpb1tlx6olDEijIm98jvqDTQdQtLOXyO5inW0a1XV5cVdZleQH6QW7iPz7SaViHLpSAEIgU7AkSj/pFsaQxWoMVD1UYzWNiKXQJuN0LbiLUTfNyByNFy2M1BV0XoC/6/FY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fadc3392-eea2-46ae-ac5a-8cc9f885917e@citrix.com>
Date: Mon, 5 Oct 2026 13:55:26 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, guillaume.thouvenin@vates.tech,
 anthony.perard@vates.tech
Subject: Re: [PATCH] tools/oxenstored: preserve socket fds across exec
 live-update, document SIGTERM limit
To: Andrew Precious <andrewprecious388@gmail.com>,
 Andrii Sultanov <andriy.sultanov@vates.tech>
References: <20261005124654.4070674-1-andrewprecious388@gmail.com>
 <1791204532.8631fc262581453bbf619ec5b2062170.1a10c1c21670003f66@vates.tech>
 <CAF14T9kUo3hVbTik90YDDWs8gtD2uu6AP2X0oZSC7aYi6MwSrw@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAF14T9kUo3hVbTik90YDDWs8gtD2uu6AP2X0oZSC7aYi6MwSrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0147.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: 51a3a405-7b82-44f8-7afd-08df22dfef8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	guVuixuiFtVOj2DLwHrZSff164Tfk42gZSPFgU1KI54CTsJW735RdqRzh/k0q6ksy6zxFL11S7X541JtFf68/sdCZEEs7QzmdU7b22rJbvlsPZRfTdsF2O3SysyHGUqoMggTvPKTncgMBtnFyePbhgxJxE+vOyzUR47Q79U30dYnJrLx09OLjU0yo5qUjRkLyjVMaX0ziuMXxY5huIgfne0GV2MJBdyk/SRpXps1laTfSAjVeI2sA9hm4cbOcQdBys6yno7teGMJ23NWLwG0fGnT1KY/1V9NoWpnVrpQPbM7UhOe8pnxMbsNTBNTVwTd8qrAE1Zt2TGPobYwnKboZ/Cbh8V/MZ0gHM2Vp3usGwC2YTQgebxIa6XkbpjM+k5Irz44lGg9DMUslm2fvgwre/mjWIl4EI4wQnm69aO8y/8OMz/jclxeAM95CR3EbcEjQosiK2WHPDhAD2w/koC4VQYk/ukycRZ0rnqGwsBi8D1+7OqLcvgXkEsxpF+rn9CdcF5HO6AN6E2nR6v7IWp11oJ5IWyaMfWXRd63A4zrABSNbGtmCPNoesdVuhu+2bfJh7uuwf9niuCXTbyDsz8Cku3oppmX0mSQ9BCnLxU+aVnG3CsdwaHFWI97WmYTzgcf3OqYGtdotKQfntASjO594yhAL4JGPxNXYksR2qj1xjs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OU9saytNTjVaN0F2a3V5WDFJTWNCNVJ5TXBJeSsySVRNVW56ZFlkblhNdENy?=
 =?utf-8?B?L2t3YTlvQldoS3NmQXd0WUZObWRwS1RiZUVxOEI5V091NkhhWDZQR1phaXVo?=
 =?utf-8?B?RWxQc2RWUEJ6bGZXSXhVZTBmSjJyZDV2bHVibWdXUU1jU08weUd3bXFlMEpG?=
 =?utf-8?B?Nkd4NkozVG5mbzhXdHBLZ1FUa1UyQnZ5T29DOXJQSUtTNGYwUlJQNUZyRCsv?=
 =?utf-8?B?RGRJdE5SdmdZb0JUdjNvTWl4ZmVrTktLSzNGUVo3Rm1BbzY0WlZZYTFJVVU0?=
 =?utf-8?B?YnM1UlUwVm5ZYmZKN0FlR0FDM1RDR29WN2JXbm9MdWk4K1B5Z1FwUDZLK2VS?=
 =?utf-8?B?ai9vTlFWTW54cTZDWE8xR3JXT3FOcDhJTGVWZGxLQXA4YW9JLzh3SHVZN3I5?=
 =?utf-8?B?Q0dBakNpTzl2VVlZbHlTR282OXUyOG94MThPdnkxNnZXZE9QWjA4NFYrZmlJ?=
 =?utf-8?B?ajZWaGZ3RWJyODhyQTZwZjRoUWJvKzhWZ2VZVkhXWWt3U3pCU1BOQ3V3ZFgr?=
 =?utf-8?B?cEJ4QXNicHpkbVlUZE5OWE11QTlSR1l3R2kxVFlqVGwrSlNQN2dod1NxL0FB?=
 =?utf-8?B?ZjhjcThKUm5QWlJWRE5DMHNiYVNMRWxHQjJVNmZFUUl0ZXJPMkJXUlBWeG53?=
 =?utf-8?B?QUkyN2ZlT0dIU28weTlhemMzcTJ3SmViWER3Q2E0ekxrVC9rc0o0cXY0aXBX?=
 =?utf-8?B?TExDK3ZsS1dYZzUxcndJVmo3cWNtN1BhaHB4ZXpnbHJ5V0tNdzVPQzNrTEhT?=
 =?utf-8?B?Rm1UdE5uWWZmVlZIYWRXaFBFekdyY2dWUVhHZnVzd2lYOXgvMlN4SEk2bWhL?=
 =?utf-8?B?SVJ3VjloWkRpOStGVUs3NlVoTUlzeHowNjJiREJQS29yOXplTy9DTDFpRkh5?=
 =?utf-8?B?V1hzbUtYNFV3VzRDMDBOb2RJb0RRR2poRkt3aGJVQTNFMG1QS3NFUExpQXdG?=
 =?utf-8?B?S240TlhwZDFRUlZvMG5aeVlBdTNLa2NoekIxekJhOTJFbDVweVc4Ny8wZnhF?=
 =?utf-8?B?TndhVUFSVitqc3RVTzlRMEUxUkRNMFNiL01DeHI3MHRkSlBoWUdyaFhDbDJh?=
 =?utf-8?B?WS9ZWVFtVXBoQ2pDdFI0eDlEbUxoanp1N1hOcDhvMnkxQzZDM0dZam5uL0hX?=
 =?utf-8?B?STVZdW1aL1VRNXB4N2ZydGpERWQ2bVB5eUVwckhoTFlyNmxGQmFDL3FtU053?=
 =?utf-8?B?Rjk1WFBBMlgzYzI4NnVqNVdKRSt2UVpKQUs4K0kxK05rd2VvUXNRWFl6bW9N?=
 =?utf-8?B?KzY5dEd0dktIejVTNDJRT2tPbnBnYzF1bXl0SFpvSFlJT2tLUEtIOFYyZnhI?=
 =?utf-8?B?T1Z0c1JpMnZZNU4vUWtxNUU5YzFQc1lmbGYvQkZpK0RLN2hyS01VSDhQTll1?=
 =?utf-8?B?MGQ0eVRXTG9pSEU3NTFIT3NBbks5OUtaZUxqcUVDU0VrZHozN2VuQklma0Fz?=
 =?utf-8?B?M1VuVi9BQzNSQ0Iyd3NicTZmUHkwYmFIbitHeCtpRGd4OVI0ZXNtT2NkTFJs?=
 =?utf-8?B?cHhwSkx3NFJKTDBIdFFUT3Q1MlkyRkxDWlQ5SFJlR29UL05mdWR6WWIvTDM1?=
 =?utf-8?B?VHpXVnQ0dVVWeWFHOUpGQUs2RGlJMlJ0QUNUaXJUNFZISmVsQ3hIMHM4U051?=
 =?utf-8?B?MzUzSzVDL0ZKVTJEdDFFZ2twMkVJWC8yTEJvOFJBN1UwY09WSHlScjJvV0hs?=
 =?utf-8?B?SFVqY1ZXZzh2Z2trNU1YRmx6ZExKVnhROS9XMU9wNW9rRjhVbjNqQjF5YzZk?=
 =?utf-8?B?S0tIbytYd0UvNFdXUGU4bnFTWlIzdlNLcWVnSlFtU0pxcTlycXVCQ3BFZkEr?=
 =?utf-8?B?VUhDQU4wR1VsNkxuWmVuSHdyOWwwdWRVcm5Odld4OWhXRVNLMCt4VTV5TXdD?=
 =?utf-8?B?elEvQVJVRVZKZlBkdTZxdEp5WlZzSi9FSUJvWG9wbVhVckViQ2p5ZUhFNmk0?=
 =?utf-8?B?K2dxaUVSMkcxa0theE9DSFZRTVhIUzcyYVdUUTY1UERCRUJxOVBEeWFJT1lI?=
 =?utf-8?B?bmlWNHcwNVI5VWY4dWJCOUh1eC9FeHovM3BjU2s3Sk1lYWJjdkZKcGN6aCtG?=
 =?utf-8?B?NkMrVFlMRzhJeGtqM0JHS2w3NDRDN3FIY2J6Rm1uL1NNbXl2TTU5WitxUmI2?=
 =?utf-8?B?eSs2eWxidUpiMzIzR0VrWlZ2U25xbGFGTG9qdVVjeDY2M2V4L3Fxb2lwaEdG?=
 =?utf-8?B?NW1seDlnM0Y4RktSZk1HNEVCQnFVRXpleVNHbE80dEpjeDhRRnlGY3d0SVlh?=
 =?utf-8?B?ZmVnNThKRWl2Mkh0czY1by9yeDNPaHpJWXFQc2pzdk81ODBWOGMwWkM4a1pw?=
 =?utf-8?B?R2pva0VtSDI3UGh6ZlhQcytYOGVpZkUrTHpDcFJsdlROR01xSmR6QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a3a405-7b82-44f8-7afd-08df22dfef8c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 12:55:30.3661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99lN3BdsPFB1hmL7WVgxGDyRnbDUvqwO9M7MDLxKP8tUvVIujQhZF4KGChmUM1O6SftWVMGjsg9wD4PQzWTRv7z9XLgnNgMsM76tppl51X8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5606
X-purgate-ID: tlsNG-bad1c0/1791204934-FCA16034-119F3C2B/0/0
X-purgate-type: clean
X-purgate-size: 583

On 05/10/2026 1:50 pm, Andrew Precious wrote:
> Apologies for that everyone, gmail keeps giving me "The response from
> the remote server was: 550 REJECT"
>
> On Mon, Oct 5, 2026 at 3:48 PM Andrii Sultanov
> <andriy.sultanov@vates.tech> wrote:
>
>     Please stop re-sending this email - I've just received four copies
>     of it.
>


Please don't top-post.

It looks like it's being rejected from the mailing list, so it's only
the direct CC's who are receiving every copy you send.  Either way, you
need to fix that and stop sending out new copies.

~Andrew

