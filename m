Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEACC79F82
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 18:32:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1409016.1641236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2YiH-0000eM-1d; Fri, 04 Sep 2026 18:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1409016.1641236; Fri, 04 Sep 2026 18:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2YiG-0000eF-VI; Fri, 04 Sep 2026 18:32:32 +0000
Received: by outflank-mailman (input) for mailman id 1409016;
 Fri, 04 Sep 2026 18:32:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x2YiF-0000e9-TI
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 18:32:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2YiD-001tn7-Da
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 20:32:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9b0ea1-bab6-0a2a0a5309dd-0a2a4508c1a4-26
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 20:32:29 +0200
Received: from [52.101.61.2]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9b0eb9-f659-0a2a45080019-34653d02175b-4
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 20:32:29 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5727.namprd03.prod.outlook.com (2603:10b6:a03:2af::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:32:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 18:32:24 +0000
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
 b=vkfa1pwWkdvhdI8EBfyLmH3TNV56Ji6/KrYtKOQ7/xl2Qw431WazTwIS+UbEzgHrMovskJC2yLI9eadVENANh4eGpfUVW294p8GgiRXkK9UQMGfdIFt8H9q1DFLEDx00YiF7wB8I/QxwugZDd+Fz7h1tFe1O1uwlb34Apos2c/pxLrN5/dEdYiaKKXWCK6ELPSocOoL9UrWCGdr418w0WuuxhbNE7mM8eHxbhHwJD5q+QYtvZzLh8LfgUlWgxmtksKh+VFF5+TgfGPSg0coQZ7IHUDkwK0UVrHid8uejtKvct7QoDu+VWfOcc2mlf24eefzxvNVE+A8HtTpYYb9JLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAdqvY7EGKjA22s1xDamwL+EgoiwzuubLrqjIkoE3lg=;
 b=mXgNkQ4zdM3vpD5KB8ZNO0WvCIRwNmnG01fQnAmtGVC/xoHuhVDix9dHLJDYoVjWL1KCDDPCVz9lcQAaW598N08S6sgoLA9g28UwjLd2aeZLU98bhWLOdLFBZY8KXeGyJjjHwGNEDo8DQ0gdQbt0Yu+WhcftvUsMoZQ+mko3pMd1Nl1PYLtH+zGXXWiv3e90AkYOws8ifLybJBShfXzBCZUn+S7ou5p7WgKpabpVDVY9YFXCghZMWhDOKHISOgzJ0c52bV0VB0xSLizIfSS6IkA/9hsRyCMCtf1RH0sSFQ5bxmGtK5bUL89aDNOiOAjKOP7WYCXPnHSoCZsGggapsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAdqvY7EGKjA22s1xDamwL+EgoiwzuubLrqjIkoE3lg=;
 b=VZlbLTCkS0cWCa8pXNxVMew1QynYhkX8SnsXlIGawV6MyvmjAXeyCzJIZqi5admE1OReElltfxNsHBCXjqUO5gOcN4+uI2nqURl5zlihLnbpTxuzDn1KCKhb+iS0DyEZEUOcyIVwk40sf681/6TqWmqVNOLEQ5FjIJN7GQjWBU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8cb14cba-d905-4e5c-89dd-7196b068ca87@citrix.com>
Date: Fri, 4 Sep 2026 19:32:20 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/5] xen/rcu: fix types
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260904171121.65300-1-roger@xenproject.org>
 <20260904171121.65300-2-roger@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260904171121.65300-2-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0503.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8f4557-f755-4587-1cac-08df0ab2dd1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+XCVUx0Kuf62xu4zq0Iwhl3w/bk5wESz+daIaRRBaNehNwwLd2jGu6TBDmtBSFAvXuSlcvLdt9D11Yv/6FNj3DvB9KhOoLVvTqdj4yrZSn/fSVGYQo0s1cManJtb83IVjfpaxNxa7ROs402dtSy4dG+UlJ1AsXTEatRJLJGUAyBzAH2S0EH8ckHR6jruAumOkjqhn4+BixrP4fospSbzXuwvFzz88+6oObmhUvCsBCXsKlDWPdbyPEEjHYnMSr24OZz8ExRoLbZ6kH+n2eW7KyeRZdrQ9zNne5iR3EhU4zLf/SBnh6R9BvR+GNCN8YO1Bk7aGyU94YtSrNCJKEv7IUEWV4HgDMngcQ349A6YFDQZ5zjtixn6V2OWMKzX6Tqi5O+ddZIJ5fTEgqEBFxyrnGS83dmC68lFx9mpBPiiFO/KmAokuda1+hmsJDcbhlaBx7IzY6JVXpiTDWA5d9q+5y12yCA1d8K87NcE5oIcAxUB/QUOQ/u6hn6okeZgopJPjDBNEV0rhJ0OVF3vTM3awQqugg5uQiqnjAFUhuC6qEBsPWsKpk2iYxXWZs3bPrTL9vLPz9BgmkFWizdGvRglokca2N5qMHTysz9WuUl6NQZf4dyEbpr6Z7del+AnbsfPK8MtNPdyWcZoVkjlmwDQ6yoOkbKr+lab0sJa4FWxK/Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGFKT1NRTXJYQjQ3dFBQNUdlak9hYWIvdFVyQWgyQVExQ0hlRlJyTXE2eEJO?=
 =?utf-8?B?emNJVWd1eFNlMVpObGNuT1JQRUxXajQwT1p4eEFsRUh2ckszVUpJUmZ1Y2d2?=
 =?utf-8?B?dGg0K014ZW5URVA0YVcwQ1ROV21uR1pMeEtIOW15Zi9GbHd3bVVlaEJZcnRn?=
 =?utf-8?B?UHZsRmdxV25tSExvV1hSU0hCdGxvY002WmtXbXFOM1l1eXh0YjJpSjhSMWxm?=
 =?utf-8?B?ZC9lOXFqZU1qS012bmI1L0RtUDRXWEdsUVRWTWJ5Ky90akV1eDA4WUgvV1Fv?=
 =?utf-8?B?dUJKcjVZMUNoRUozRXZka0dUa2xxczE5VGFia3daSm1BcEMvUkt5OXEzVWZj?=
 =?utf-8?B?djNycFZDeWZ1bzAwdjBINmR1eGt6VytveDVWUDIyN01FaXBLS1pTMmN0bi9J?=
 =?utf-8?B?WndiWldyTzBDRHFoVXN3aHk3SkNyNSt4cFA1L0o3VktvZHdncWp0M25DMUNF?=
 =?utf-8?B?MWJDQy9BU0tBai9wdFhFSjVBTis2SmdFYkgvVnBKQm5WcElJWElFcXZXVEVo?=
 =?utf-8?B?aVlxcDRWeWNXWDBQUkdXWVorTGk2SHJkUDMvbUs4a3lYbmZWYUFXbm15cWIw?=
 =?utf-8?B?UW1La1JXaFhoRmxqUzBNYkJvajR1eWR3YjFHRzY5YVlOdy9CZ2I4ZVd2MFVu?=
 =?utf-8?B?NHllcC9zUkJPbkJLdzBZNFpjODdLaTlMcW5YaUJiUWJSa1hPZU90Nm1GSkRn?=
 =?utf-8?B?Vmp2RFAza3o4djM0bkFRRUdjU0kxbzlURk5sbU5XOGIxMm1SRUhNS0NhSkZM?=
 =?utf-8?B?QThza05Hc2JFY0EwZlZIMzZ1NUxyYUtsNk9zU1E1YmNsZlF3VzFzaWRNRnFR?=
 =?utf-8?B?c0NNbWQxM3VDTVYxRVF0UllxbHVRWkVYeDhhYnpjQnk3VGg3NUFBNzVZang1?=
 =?utf-8?B?MkppUVZPVlN4c1c0OEl5TCttdjVRSXF6SHZQOFFFTkNiV0RDWjBQYmcvSnJX?=
 =?utf-8?B?ZWZnUS9TTENGM3hCVkdoaTJIMjlZbkFuVDN4NUxvd2xKMFVTZ2pGdE01MlQy?=
 =?utf-8?B?NFhGNGRMVmlKZEFqVWZsbFNYa1dBckhHZG50UnJhSWJvdVkzUmJrSDV1N29o?=
 =?utf-8?B?TlY3RERIaVhDenU4RUJLdlkycnQ3WTd5Vm5xb0lDTG5MTWRIZ2ZaRTBFeEhF?=
 =?utf-8?B?QWFYQWhhclR4dXZVczdrN0FNM3JJNlRtUzZhVDBMQWpxRDluaTg0L3FTejAz?=
 =?utf-8?B?RVgwS2VBS0tGL242Y0pnZ0d3RHNrUHhmN2taUXZCNFQ5UGUwNVNuY29QQ1h3?=
 =?utf-8?B?S08yVCt0Nm1tYlA5NE1zTHRkKzVDbUdpUzMxSVVGb0RlaXhCWmI2dC94T05G?=
 =?utf-8?B?QllLMHpwci9BdHFVNU5vR1Q0a3EyZEFQK2RTSkFncmFLaXg3Rk0vVjNOTG5P?=
 =?utf-8?B?bnVGTEIrVFlLOE1QNXBMSjkwTFFSaUlCSVVnTCtmdlBEc3VoMmFEcWhhUlBE?=
 =?utf-8?B?cWpjUmgxaldIazlxTkI1QmFKeC9KQUc1ZVFEd1ZzOTRxUDF0dnVhZDg0VFJx?=
 =?utf-8?B?VHY1VXB0MW5Dd3hnNzEyK282cjJxbHczQ2JDUENqdnFYd0hsTlNCZExKN0tH?=
 =?utf-8?B?eFE2NjhWay9UZk1Rb3ZTeDduR0w0Tlc5YUZVRHA4eGdRZWJGTGlJRHh4L1E5?=
 =?utf-8?B?R0FsUHlDQjNBc2JvY1pmcklTSXhlb0d5VGIvZVhYa0pYOGhTaUJ1NkxKSjBh?=
 =?utf-8?B?eHFsLzEwS2JvbHpGUERwTC9kaFVUNzJGbDBDajlQVDNIS1k1MUFISmFyVkk1?=
 =?utf-8?B?MldFN0l2Mk10dGkwVjY5emVkY2QwdHhSdlM3T3Q3Ynl0SHNNYllYeVhQQjNV?=
 =?utf-8?B?cHpwcDd6cXJUUDQ2ZGJMZ2NxellDcjF4b0hDcS9HRGhoK2o4OVg0TnFyQ2NF?=
 =?utf-8?B?c1FJU2tqZVk0aHRuS3ZKK3FlQi9jUzlsYkRMTWJlQmlFZnc3V0FwN0NWVkVF?=
 =?utf-8?B?MkNlUkhLSzNGZVRNQVMxZG9BMUdKTTNQUWNGdUNhbjB2RlVQVkt1UFdZUXdS?=
 =?utf-8?B?VTJ6azZYaXphaXBmS0dWdkFjUmpjeEdZdEFNd21RUzZJSmZHRmRlSERWVDZN?=
 =?utf-8?B?QzMwZHNlRys1ZllQYi9BcDE5enRIak9vVmJ0YWtZMGlRb1IzWUloc3VaUGZ3?=
 =?utf-8?B?SC9KSmt5K01LVUtvaGd6aU9ENWtQWFNhSzI3T3prUmpLbTg1S0Y4R1Q0NFB5?=
 =?utf-8?B?aDRXWXhJbExabW16dXAwYlVxNStuSUhSNXZENDV0MlBnNTFNZk16YnVoSVVL?=
 =?utf-8?B?MkZyTzFzeCtNRU40M2xyTlZrUDgweTlNM0pSNVZFdXBZQWdBY3kvU25ORG9v?=
 =?utf-8?B?MHZ4TElYbU45T08wLzRxYXdQWktDUkpWOFM2blpzU2paazFBT3cwdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8f4557-f755-4587-1cac-08df0ab2dd1a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:32:24.1386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEDKPPGCcv83IrFra7lBuLKVnuZmeGANHj9ZBkSiV/q9Y/biQ7z0ZYl35qv04nP6kVzLDxxPT5jJUrbXIEUbknzSieAMGxkwVWBLV7EDZOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5727
X-purgate-ID: tlsNG-c1860d/1788546749-D795A87B-FCF93308/0/0
X-purgate-type: clean
X-purgate-size: 313

On 04/09/2026 6:11 pm, Roger Pau Monne wrote:
> Adjust some types: int -> bool, int -> unsigned int. Also fix a couple of
> typos plus trailing white space.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

