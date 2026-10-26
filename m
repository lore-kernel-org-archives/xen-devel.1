Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70347606A31D
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=RUOzG8Br
Received: from list by lists.xenproject.org with outflank-mailman.1461286.1672275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLK9K-0002Ea-Ok; Mon, 26 Oct 2026 12:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461286.1672275; Mon, 26 Oct 2026 12:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLK9K-0002EA-J8; Mon, 26 Oct 2026 12:50:02 +0000
Received: by outflank-mailman (input) for mailman id 1461286;
 Mon, 26 Oct 2026 12:50:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xLK9J-0001yv-3r
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:50:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLK9I-00DErJ-GU
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:50:00 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adf4c51-e002-0a2a0a5209dd-0a2a4501ae8a-48
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:49:59 +0100
Received: from [52.101.62.70]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adf4c76-5984-0a2a45010019-34653e468f5b-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:49:59 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA0PR03MB5612.namprd03.prod.outlook.com (2603:10b6:806:b8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 12:49:39 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 12:49:38 +0000
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
 b=XqYc4okohwNu94nmeYJXFizX5K+kFcW0thZEipVm8K4ovOhZJbk8l2LoC7uiPVXGN5WS4FJPR59Li/YnOsj7smDv/3n+6zIwh5bgXS+iPMRDCTq5L2qWiHLG049RDz8610iYqJhaZ35YlyUknYqXyd/iM30Kor8Ga717CCPU/5jGBJ/Pi0kvXJm4Xk0LJycUInrRT+qJRfsMAnEZhMUQKODwf+VWK9r+InFoPtfZJKVyepYmwMpZTLr1eML68JCoicmX7yzsRmtqEdiQxglD1J0VWZW/2V5YBgSn3aYmyCjGLayQqf7qIYtrpNC0KC2M7LISJP98p6p2C/1OjQNBzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kw+oGxNrfMzqMMVBbkT4NqPGIvzCMbdGvACS0aRtnQY=;
 b=FIDtScy7gpwGmIFP+6E4ZCMHqnHBvftTTS2ss4d9WRO/Pu+psWzAD2fBf9xuzc2PRFXojSzuhTu1im3ycCo7MBrxKF7drbyAXiYcS4Y+kTRyzGsp5zmaU2NfpJLVaWtllQaPXS2zXkb8hXaQKhTuO3n71ax+nBZWIXxn+mOEb4YMs3Ni061EK7+17YRw4vKlWEirNuxTHkQGN3O9SgPrKi5l5A+2k9NA7QwsTbaY1WMHgpFrBNfvmtpdBLaJ7xjpEirhKK6Cz0LO0KLNaDESL3j68aSCkoEp/0Z1AyAFUvWW9uYmxFkuCluvN3ASCwZ5tG5nE1Jl9Grz21V4L7oFfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kw+oGxNrfMzqMMVBbkT4NqPGIvzCMbdGvACS0aRtnQY=;
 b=RUOzG8BrWD76Bu2ix/bUGEOMfKEvcgJ9lc+K999o4KARXl5B1FzSYJvh0Q37PKdRx+WTZWHBGD8grumrDaK3Z4PRTArQJNtaW8axdgXCR240Ec0A3kvYyJDBdV+hWueaC7JwunziRkicyXGAD+HbIJZOTV1T9RMyXs421HaJkXI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <25716378-3592-471f-a972-8446c32e29bd@citrix.com>
Date: Mon, 26 Oct 2026 12:49:35 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH v1 3/3] vpci/msix: move common msix code to common file
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1793012250.git.mykyta_poturai@epam.com>
 <ea1ffe0c0494e326685491810999a24469c3ffa2.1793012250.git.mykyta_poturai@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ea1ffe0c0494e326685491810999a24469c3ffa2.1793012250.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0084.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA0PR03MB5612:EE_
X-MS-Office365-Filtering-Correlation-Id: 6827bc3f-5f50-475e-ff52-08df335f98bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|56012099006|11063799006|4143699003|261021121427099003|10067099003|261009223027099003|261022105027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	gyCzm74RtW1sAwE479p8GEsYV7WEatZCDbOUvSADeCuGKMafsdjeQ9mU3iip/lfdDRXC3HosBums+IR679EoUsDgYzfVf/SOCe5CsoWHI1WaLX++kAzm53cgG3Wpx9S7BJcNmn9oqneCx6jufl8foEjKWXYz11tqCVQ0CxuFhEUYggvhIdX+jdXzHAoqGfgZvJVz5/dxbrIRcjJBd5y1zTr6tFD3/vFMudSU3y+hAS6qMexS/ncal+f8Vid2JlOp+IHN2K3YjY2wbN5D1uGUVbdKw2rcRN/Dop2xlNL1dr0TILmbBHoEUfvNycrDZFG4aISbE+yDF/OTSXFynqiRd6+FxaU3kkoxpMjUj8pCJ66w5dZKj6YxN0rnZbZafp2QIeAZM37oG9PY+Iy8sQfD/YtF5gENStMo2GpPvqRwdmjx1OXybrN1Ca7RzQPlGkW8T1l95GF/WG4LQ+vHnr9C4q5WPZwIrNbHSGnXhU3WChTp4eOuSIZ66xu5WnQIpGVbB4mXRbIfymbzCpTwItkOmz5+lrPnDpKWLmcb9ITycOL6XPxGOoinaKLWI2R2+YHYhFkiicSfkOCM6XT0AjU6tbcnW1y4finO90zuryHTQnxQhCg/q1liMAEnOC3oCp3X/gX4r74kcs/1fWMbifnf2bFCRALBfbOo6nl6FrhrZE0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261021121427099003)(10067099003)(261009223027099003)(261022105027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTZNNUxUOXM4T3MrTjVZaCt3a2NRbEx5b1ZKL1gzSmszL0RyK2dVNEtFZ1Fa?=
 =?utf-8?B?cCs2MEE1cVNaM3cwbCtKSjNPWFV4ZlVwd1BHZExxRGVIWXc4a0ZnTE44dnAv?=
 =?utf-8?B?enVxLzlObFBEZzRoWTRvZk52eUpQWkZweEljd1ovcW9XV0c1RmNPcmZObmc0?=
 =?utf-8?B?Q1BRaHlvNTlveTdmLzZmQXQ4MmNaNWFyNzlOQUdrWlh4NFlITm9nSjQ1Sndh?=
 =?utf-8?B?VzR6SUxjMmQ5a3grOHZjVkNKSkg4VHZYeHZHOFpaUUtyNU11Si9JVndkbmxS?=
 =?utf-8?B?SnZaMEp0eWZ2VDRYaitBTnVwdXkxSHduMzVBV01WYUFsMk9JUzA4eHJVdFFF?=
 =?utf-8?B?TEErV0xnRmtFQVN2ZnJZNnUwTDRFN0VNbVc3UUhlWXBxVHhhSEk4SFd2eEpn?=
 =?utf-8?B?eDR6L0FyOGd0eFE1YUFUS3FTUmlNSytyR2tiK3I2bHpubjVGbTBtczFHdmU0?=
 =?utf-8?B?MmdGM09ub1Q3eVJTU3h4THdUNTc5OGh0YlJaSCtURnhpTUtQY2UzdG5qUDZj?=
 =?utf-8?B?WGJJNy9BOWtKUnRrQ3JkN0NkWk5lZU1ackRrcXhMSUNrTG9mdnhDMDE1OGt2?=
 =?utf-8?B?bjRFeVV5YVI0WmtOMk9nVHFKNDZtOVY5SGVjZzkwNGUvcjRIeDNMOWlCaEdV?=
 =?utf-8?B?V3VBdnBGcWp1YVNCMkZ3VXZkZ2RJRk51dC9BRDlkVE05QzVOMS9ncmc5bDZL?=
 =?utf-8?B?ZVZGVHlabkJjem4wOHE3VzVYc1o2SFdkVTRpbCtSalBVTGlUblFUU0swMTVz?=
 =?utf-8?B?eW13cnNUTzhXUjU2QTdxQm5tZzRpSFRyVHhiY2lwRC9EcDFjTjN0c3FBWDF1?=
 =?utf-8?B?bitUVkc0aGNrMFByc0tEZlQ4TGpjMDFhdWJVRlN5eUtyRE9kakd0elBHSDhV?=
 =?utf-8?B?VlRtUjljY0psOEhFWjFYYUtiU1dBRVhiZ1VUSlhFWHZEYzRzNWxlMWgxTC9F?=
 =?utf-8?B?NW9nQTRMcW1HZnBQZWtONE5Va1JVcGVmdE44c3NGcGpYYjZsWkUxNm56bFFZ?=
 =?utf-8?B?SWFVVjdyS1dBUVFmN2MybmJPcXNreDJDK09hcmtOTmJHeUw5dW9sdUt6bVJO?=
 =?utf-8?B?RFRodTN4bHU3a1ZDbEd1UDFxaWNxVlNQOVhJcEMxZC9ydWVnUWgvSUVSc3Rh?=
 =?utf-8?B?S1hibWl6N1BWYUhMNkRyV3kxWVZqVmllZmsyRWdncm1KZkMyNVZQWGR5TURW?=
 =?utf-8?B?Y2JPRUhxT3RITnUzT2dUWnZwNkVpS0RjYzBLUFo0UHZrRGxXUE45ckZYd01Y?=
 =?utf-8?B?dEVOVloyU00razVub25NaDh5RFJrcFA3c0RVc0FrL0I0akU5cGJsRmRyQU5z?=
 =?utf-8?B?a05jQitOVkg1dWduRWtYWUtLT2k3SjRYY3RBa253d2NsdERqZ2J6bnQxNjM0?=
 =?utf-8?B?TmNKUDJicmp0dDVFYllGL0hTblByQXoySmxtV21FQlJvTGNFd1hneEdoK3Mw?=
 =?utf-8?B?WlVJUWwwZ29UTDIvRE9kUTV0Um9DcjVXdWNlRzBWMlM2YmV3dFk3cG45NVZm?=
 =?utf-8?B?aTlEWTZ4VmpWRUx2SGpEaytuYTJPN1VaY3NUOFZuRW55d2xaOElMeW5aU0pN?=
 =?utf-8?B?QlFVQmZPaE1iemszK2twTENJSGFCMXRjeUJmZnBaeU96VGdYc29kd0Z2QlF4?=
 =?utf-8?B?UjA3d0R6SWI5MTN4RCs5bUtTUW5SdFN6bHo0TnBSOHNLdmF6SStWMFR0N3p2?=
 =?utf-8?B?d0M0S0w0dFdNSTlXOXJxZk1NSHlzVDA2SFBZUUJESXdUM1h6YXBzckpMQWJa?=
 =?utf-8?B?c1JZU2E1ajNZbEt6VmRSMGs4R0FuS25oV0FzYUR0WWxGS0YwNWxxcXdHeXhO?=
 =?utf-8?B?V0xVU1loc3J4aVlIaDRRYWVlM2RHTjI3VUpaZk93K0JMTlNQVTZaZGh0SVhB?=
 =?utf-8?B?YnVSK2o3dENOdkwwbjB6MVJXN21mMVE2ZXp3RDlHQjJ1SHAzMVBPLzlxWlVy?=
 =?utf-8?B?QW9CaUFDNG0vbG81RExsdGVpN0VBRTJsdHZjd3VTQmxKZEt5MHUwSllVUjgr?=
 =?utf-8?B?S203V29qYTZobVpnWmc4QU5MU08vdndTbWc1Z0VGOG81T0VQQjJRZFYvNUlM?=
 =?utf-8?B?Q0dBSGRuNG9LRStoc0xkb3k2WkV0T1MwQisxMzZPMFhOZkI1R3VRZzArV1p1?=
 =?utf-8?B?MjJQbUF6eFZuN3hMenUyM3BScnIwODZRQTJVbVpLTHhQMFNuVnRYYXFBdTdO?=
 =?utf-8?B?ZDhzWXVrNVBFRUZqb21vbzQ0bDZyeE9DWWhXRGdybjNtMWkrZEtydnFSVlEx?=
 =?utf-8?B?YldwVFVyU0F2V0xEY3htZDd1YnYwOVlOZlpXTys3NUgrNG1tSGJvd0NMK2RY?=
 =?utf-8?B?Wis4ZzFETWNpSE5PSk1zcVMzOEFYT2lmeTVrVURTcCtlT3c0ZUtmZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6827bc3f-5f50-475e-ff52-08df335f98bf
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 12:49:38.9093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glG0C20Zg5c0VmKO0J4bB+pLcAUADks4gdwH+T7pYenq4ZAw34PQzi6x/PkvIrYR71oFegenY3/8qu+L/PimF1XCOg+/nMZveMc+8/QOxfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5612
X-purgate-ID: tlsNG-d62444/1793018999-BE27A757-46A22C8A/0/0
X-purgate-type: clean
X-purgate-size: 1053
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/10/2026 12:28 pm, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>
> vPCI MSI-X code dealing with intercepting the MSI-X tables and PBA won't
> be used on Arm. Moving this code would result in a large diffstat, so
> instead we move the common code to a common msix file to achieve a
> smaller diffstat.
>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/drivers/vpci/Makefile      |   6 +-
>  xen/drivers/vpci/msix.c        | 160 +-------------------------
>  xen/drivers/vpci/msix_common.c | 202 +++++++++++++++++++++++++++++++++
>  xen/include/xen/vpci.h         |   5 +
>  4 files changed, 215 insertions(+), 158 deletions(-)
>  create mode 100644 xen/drivers/vpci/msix_common.c

Please arrange things to make the best structural sense after the
change, not to optimise for minimised diffstat.

The diffstat is an instantaneous review burden.  Good longterm structure
is far more important.

~Andrew

