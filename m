Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7B7C88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 15:21:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417427.1646251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x533l-0002l2-Cm; Fri, 11 Sep 2026 15:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417427.1646251; Fri, 11 Sep 2026 15:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x533l-0002kv-9y; Fri, 11 Sep 2026 15:21:01 +0000
Received: by outflank-mailman (input) for mailman id 1417427;
 Fri, 11 Sep 2026 15:21:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x533j-0002kB-R9
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:20:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x533j-008qcF-7g
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 17:20:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa41c55-2eae-0a2a0a5409dd-0a2a4507c6ec-8
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 17:20:59 +0200
Received: from [40.93.198.4]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa41c59-b4ea-0a2a45070019-285dc6049073-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 17:20:59 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH1PR03MB8142.namprd03.prod.outlook.com (2603:10b6:610:2b1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 15:20:55 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:20:55 +0000
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
 b=eX8P83zsCT01u/u6ultjAw6tXMor7XQqLe/VELS4SIr/ENGgk3y89EBGkydVpxEaq8Cb3vLvWd1H/T7z3AuSAHXzTXgT8I6Kyndy9W5Ltj9wXmUi6OHbtCNvzka2k44YJ4JgR+dopiiiTiH26jqROTDTKdVWTy4VEnPXCZfozgB9ecCv8v5e0wT9vWehlrZLfzk0jChBjyGYUh08YULo08cmNneQMzVdm6Q89JDRo2mitlySsvC0FPO99WaMkOHrG0YCJ45itinX0mvE2mVObuQ2d5gjb6K722CM7yJB/WC5b7snIFoJLSTT5AziVqn64OTG5qZM1RH59NGCM5X5rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6kPztzeMRtVA1TdA2qPT1+aM+D08F+DszvqJqvSHLg=;
 b=UntrT/ES26/UxCSffzd6LsTafCLLO2F24BczkB0gQpk3D3Jm8C2lswBeNR0MJD7R3gXA10G2zrS6AFGAdZ+rZ0q0DwJMhuFzVhhh+wvTxBu4u7SxICAsX9HZjx7yE2t7P4FM3V/czQRlx02bC7+4OGLrXEYBiXc4g1s14D4cXthj7vtwxI5WboleFgP0Us3dRa80ajjwaLq3hyyh20ki6yIYSJ1C1I8f/whpHcz5rNTiFnhbOOIVLp1SvU7R4EPcgSsZO3PgDBEVyNQfGYQLsA60M4Gxw5iwgk2ktjL+QYyEwweSfZ/exKOSOVXCm7AVL2cbj/dIlkL37c+eIz5dnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6kPztzeMRtVA1TdA2qPT1+aM+D08F+DszvqJqvSHLg=;
 b=jk5zcKDHe1AyLei7b6rRAMa2SzDzWWaot51axyfdMtBxYnvMWjI/iX0Miorfp1amYP7uEoOfolr0vl53Al26pE8xlPN//Epk9ybdwlrtz7BKJb8/W2IFeGAII52uaovmtimtgsmGQl0SUVtAoVIe6WDL6SNqMwp3YDbpTusXWPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cceab41a-27e0-46a8-9a5d-9a817078e626@citrix.com>
Date: Fri, 11 Sep 2026 16:20:52 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2] nestedsvm: Fix multi-byte IO port intercept check
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260911132315.1209497-1-ross.lagerwall@citrix.com>
 <10df3c15-990e-43db-8cc7-578f44a2bbfe@citrix.com>
 <52b94314-5291-4cf6-87fc-be3a54618b39@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <52b94314-5291-4cf6-87fc-be3a54618b39@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH1PR03MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e654c7d-a684-4071-2c7f-08df10184621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	5OTZpJcdMbt4gmgxJqv45DpIcem/CnxmyMSyTYPn6NJfC0d9yx/1dUahnHeYh7GsdS9gGGwzbFVuXJxJ+gaTvf4TMIYsGetJ8cCt8V95JBKHquhHbOYMzQtKf8RsN3n5CH+KiMUXuGuK14c+N839YM7rg5GJthfZrItyVO9IjjmuvkJDwdHK52VedMU2QvuIUEh5G/ut3JCrmQbmeLo9Y02MJQnJSFTCRnnopCfIPBka4UM+D2tHx+OWUtYhsGzeFTdCtNmuU2cxbxxE67VaEYVaTo/puRM6uI6u49l3JBfSRe2sB9Gp2Y0NJGFohgl14WnSJRrsIbzHG8MUoqhMb99/mChc2aBXLBai278iFZBn6UMJxh+sPFWjhQCPXLyMV5OSfaXrG2pKCBzA6dbrnrsXdXqY32F2Kjm56s9YF999bhjipE2ykuFEojsGmDtbgEmd4zjViC3Rzl8h+5f84yPX6If8EPr+vQps2vuSEiEBaBV9qW+6PKW4Jp/LQC5Q7ih7DlMcKY3eC7emu0UI2MYPz2zmGpPKwvwQ7LNK3c9a2j5uhvG+SjM/pf4iuJW70NS6ByylQIV/iZnj9sl3AnceTZya0ghRYjQZW8Z0N6ai56BeNmZ9tto8PiXK2TrwUB/ftYwKg5+vc0ZYGK/6In8Ir4p0l9g8Rpgug+rIGXk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3ZneDhTV01CK1RJamdsZ1IwUzV2aHN3SjdFMUdXRHhBSUNQR2ZKZ2JWUUtX?=
 =?utf-8?B?ZXl6NmV5WGhGZk1nUTEyd292NVdESFV1Z1VpYjcvdHJiUVpvaVJvTWRQZXg0?=
 =?utf-8?B?ZUJLbUNqMXRGRXh4cWZCdnNnUUUrNVM2U2EyNnh0ZGYrWkZ5bUZLUzBKRm5x?=
 =?utf-8?B?WVp1aGxaZ2gySW5LU0x0Sng3WnhDU2wzd0MyZDlNM0paNHFTeWxFeGpFazRU?=
 =?utf-8?B?elkwaVVmaUROTjR0aU1BL2U0YmNDUTQrRmNmbkt4ZFhWNVNZOS90MnJBRURa?=
 =?utf-8?B?L0w0K1g0U015aU1PMTNEWlgrQjE1RjdBTGdlSXpoUDQ4U2crK0dNODN5T0kz?=
 =?utf-8?B?eGlYVTB3bkxPcm9wakJOVGxOMWEvM0paY0x4YXBDanVZSzBmNFQyZnVmeTl4?=
 =?utf-8?B?QnJMaHpac2FUSjRyazRZT1huUjRxd29SbWYvMW1RSjNrWWdmc3lPcG1EQ0FW?=
 =?utf-8?B?eVdKTVBJd2l1U2dWMGJYck9PdnRjSlZZTDNjaFBNSEZmRHNkNGNvQW84SE1y?=
 =?utf-8?B?NmE5ZFdlZ2ZHL1pTSFhuandmd1FFbDdCN1VJa3pKMHA0TGRXMGxYbXR0TXQ4?=
 =?utf-8?B?UUcrNWlSQzhXcHBXS3VDVGFQRlpzTXRxaDRpRk43SDZadlIza295Yi84bWMz?=
 =?utf-8?B?WmF5RUhBQXNzOW9qcmgwRWJCV2lXY3VsZ2VCTlFrUVdJVVEzWmNCb0d3c1di?=
 =?utf-8?B?YmFsUTJvM3BUeGRaZWNsTmE1Q0ZLcElBTzZyT0FaenFKaDBocGVwWnpKT3ds?=
 =?utf-8?B?KzZhRWtEQWQxUFJNVGJ1L3ZGeG5tM0liL3hIR09pK2IwREQxWlZLWml4M0ZK?=
 =?utf-8?B?UzQxNHVXaXJuVkp1TldVSlRySjRzMVhWMU9BY1NiVGd0RTh2K015MFhCYVNx?=
 =?utf-8?B?YUJnNVZrK0cyT0Fyb3FzcWl5b0ZjODQrUWlHczdKT0NmQm5OdkEvVTZZeEpP?=
 =?utf-8?B?ckdQRTltQ0ljZXR1eXhPZFdrWHFVaXdxLytVT2hVdCtEcHRGZnduM2xYNXJq?=
 =?utf-8?B?d0wwSUhnaGVseDVqWDdvaG5vZDNPV2J0Yy9uckRFVHJTc0pRTjZSNWRJcFRw?=
 =?utf-8?B?SG4raFdYc3J0OW5GbWRKTGFUM05GcjAzK1IwcE9uU1VFc1hwblZiVUJNWEtR?=
 =?utf-8?B?NTVXOVhMRWRxWnNnRnFINVcvUzF6WEdJaThkVWZQcmtwQmxDOVJvdlh5QWpa?=
 =?utf-8?B?djhWWUNvZTdReGdOUTk4LzFtQytqQVVkbFdzb0tRam5VWWpJZDFRNnpXZEpB?=
 =?utf-8?B?eEh3V2FHdXlNalBsYmozc0p2ek9xYlRkVzd6MDIvVDgvMW1YekNXRzJqM1hL?=
 =?utf-8?B?VXNTQUNyNlhxeXhNQlV5U2N3MVZNVnhWWnlkRUNFaUxNRjk4Zk0wcHY2Mk5Z?=
 =?utf-8?B?RXU3RmxycmxDVXhzMXZ4c2dKZERoQW1KcmIrQ2VobllLY3JhQVNuU0dLWVBC?=
 =?utf-8?B?Q1grbC9aSjVyUkdEQk50YW9WK1BXNDk2d2xwNGgzMmlSZTBLVmUyWFlkaGsr?=
 =?utf-8?B?RlJDNy8wM0hwQTlCaElKK2lZaHFHTm5ISDVnYmVBYTJGcTlQRzdpdUV1T0Qx?=
 =?utf-8?B?UG1BZW9VTzFOcGt2OEtBRzMyN1YyZUF6RTJHazdJcHh1SVp6cnB6Y1RmdFZE?=
 =?utf-8?B?eWViVlZGT3A4VTNsQ1dJQjZKcGtqV2x1d0VXYmdPZ0JzWTBrNW9qZE5mdlZT?=
 =?utf-8?B?UG5NTk8zUFBNOWs0RGdKVkllNjk5dlR5TXZyNG1OajkrNjA3anVBZTNHeVB2?=
 =?utf-8?B?UGQwdEREaVFqVEpkQ0hQalRua0xiOWNQVmtwT3JGZHdERjNFT2dLd3hJZWcz?=
 =?utf-8?B?d2Vhb3JHczVQSDFmeWFvVElNQWRsZ3hnQ05VeW5PVE92WmpiaEVxczFKOXdu?=
 =?utf-8?B?d3cyUWhkRmk3ZVB3bnZaMzE5SWxkdW1YcE4yai9PNy9VMXpZTGQrRENSMHBK?=
 =?utf-8?B?TVlybUp2SWVNRDVxU2Rjemd2cHRadmhkd1BtbUtaV0VCWk1wQjZDVFBwUVNv?=
 =?utf-8?B?WlByZE5waHRTQ25zMG1rR1JKaFkzcDBPV0l1ZFprcFI3VGt3MmNtclFsT2g1?=
 =?utf-8?B?bTB6VGFNbExPTlAzYlVJdG9xMlZERWI0MGhTWHU4RFZHbXdpTmZXcTVhZEIx?=
 =?utf-8?B?ZmNXRHRWY0tQeWNFbWtRZlJydkFTaVMvZ1h5YTg4a2V2UTlnUzJjNHVmZHZF?=
 =?utf-8?B?YkxNU1BNYUllejdVR3lZKzk2dEpZVXpaYVhNWU11d0toQVhDcjIxektORlZ5?=
 =?utf-8?B?MnN4cE41TmZVT1U5eCs3OXlEcXVwYnJDcHRkZnM0WGo2b0RHeXBlTWcyOURZ?=
 =?utf-8?B?Ly92K3Roa3B2eUo2SkpHaXZIR3Nmb2YveC9lMWZnME0wZkpmZTM0Yy9yNFpW?=
 =?utf-8?Q?BGpQHkmthQ2hZYTo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e654c7d-a684-4071-2c7f-08df10184621
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:20:55.3819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJ39oE2SNwfDjr39Oor50HRwiaB4mmR0xYFl9tPsIJdEn9/SS6lkofdZT6Ucx/4ssfWkutI81loIfWT2CC4cgDs+qjMYJzANHc3R2Qsr980=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR03MB8142
X-purgate-ID: tlsNG-ef75cf/1789140059-3C411AE4-ABF2636B/0/0
X-purgate-type: clean
X-purgate-size: 2859

On 11/09/2026 3:50 pm, Ross Lagerwall wrote:
> On 9/11/26 2:36 PM, Andrew Cooper wrote:
>> On 11/09/2026 2:23 pm, Ross Lagerwall wrote:
>>> For multi-byte IO port accesses, the APM says that SVM should intercept
>>> if any of the corresponding permission bits are set. However, the code
>>> has this backwards and only intercepts if all the permission bits are
>>> set. Fix this and at the same time, make things safer by handling
>>> mapping failures as intercepted. Also rename the 'enabled' variable to
>>> make it clearer what it does.
>>>
>>> This affects Hyper-V since it does not generally set all the permission
>>> bits of the multi-byte ports it allows its root partition to access.
>>> This results in an L2 root partition that cannot do PCI config space
>>> accesses and therefore cannot access its NVMe disk to continue booting.
>>>
>>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>
>> The reason I asked about 0xcf9 is because it's the one-byte PCH reset
>> register, which hides fully inside the normal 4 bytes at 0xcf8 for CFG
>> accesses.
>>
>> Despite outward appearances, the x86 IO space is not one uniform space.
>> It's 3 orthogonal space (1,2 and 4-byte accesses) where the target
>> device gets to choose whether muti-byte values alias in the spaces, or
>> are entirely disjoint.
>>
>> For the HyperV root partition specifically, I'd expect 0xcf9 to be
>> unintercepted so as not to interfere with the final steps of
>> shutdown/reboot from the main kernel.
>>
>> The patch looks ok, but I think the second paragraph needs a bit more
>> explaining.  Are we saying that because 0xcf9 was permitted, we allowed
>> 4b@0xcf8 to be permitted, changing L1's CFG index rather than changing
>> L2's CFG index, causing the subsequent 0xcfc access to produce garbage?
>>
>
> Yes. The incorrect trace shows:
>
> L2 write 4b@0xcf8, permitted so it updates the L1 CFG index
> L2 read  2b@0xcfc, VMEXITs to L1
> L1 write 4b@0xcf8, updates the L1 CFG index to the wrong value (since
> it didn't
> see the first L2 write)
> L1 read  2b@0xcf8, reads the incorrect value from the device model in L0
>
> How about this for the second paragraph?
>
> This affects Hyper-V which for the root partition intercepts 0xcf8 and
> 0xcfc-0xcff. L2 issues 4 byte CFG index writes to 0xcf8 which are
> incorrectly
> permitted and update the L1 CFG index. The subsequent L2 CFG data read
> at 0xcfc
> is intercepted by L1, then resubmitted as a CFG index write followed
> by CFG
> data read to L0. Since L1 doesn't see the CFG index write by L2, it
> uses the
> wrong index and gets garbage back, ultimately leading to a failure to
> boot
> since it cannot access its NVMe disk.

Yeah, much better.  I'll swap this in on commit.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

