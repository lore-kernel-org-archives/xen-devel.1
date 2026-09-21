Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB25C982EE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 13:39:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427548.1650344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8eEk-00069V-BV; Mon, 21 Sep 2026 13:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427548.1650344; Mon, 21 Sep 2026 13:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8eEk-00069O-8J; Mon, 21 Sep 2026 13:39:14 +0000
Received: by outflank-mailman (input) for mailman id 1427548;
 Mon, 21 Sep 2026 13:39:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x8eEi-00069I-Vl
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 13:39:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8eEi-00CeaP-8q
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 15:39:12 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab13369-e002-0a2a0a5209dd-0a2a4501ee10-46
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 15:39:12 +0200
Received: from [40.93.195.52]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab1337e-5984-0a2a45010019-285dc3349f90-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 15:39:11 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SA3PR03MB020706.namprd03.prod.outlook.com (2603:10b6:806:591::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 13:39:08 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 13:39:07 +0000
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
 b=uqwyuzpskpk6dwDFeNjv9lC2vwM5rQFBNYIF8dC7UYQ1e3MygS8jjf6hgZOsLcytRGIphMYTXAD22i6CWjFJ8sYlIRYLAP9h7+4sPPKxqQPE8EbYFmnH8oEjp3Qyaa8KU8wH0R11Tec3TrokS2efI/q62Dfw1GNMWipJJLtQ+HMKFHxmLmUMGy0iLf8HetCYMGXuDpfHWOoxH7TyZX3JtC/5Yl4osz3d7Otq6FiRMdgBZXOTQAoqifh38JgrwvtP68iCl3xiQaMYQVis2MZejyf656Q3762nJVts2QtjWw3TzXGWAuV+60LZTnz7pbzpOlxkugm8OeuRU/M3eSb1jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrLFG9FFUFFZmttykjJC+qRvnHJhAxZQltz3JBjvxHw=;
 b=h8EDuxRd8JF2F6QiqxQl/bZoXOp46g3fpPo37sUS79bj6KCbT0CQofLv6R1DjnZCJVMsHwkrqmvdx1Zm3sfntzefaDrg0x6Xhe41DtYwzfTwDpnVpskObuzRnOOIJc38+H4ACJ9r9O5IddA0wBLtxe+SqnZu7PzZBWcfEcPVWuMxFQRcvLvjfQWn5vnNcNIOMnTDIhfIRnoaIJGkhnXzp1daKNtR7Fe7l/E4chVdCA6Zr+a8GlUQ5UdznpFJPHxFe3VnIgmizjRNiBlx6rzMFoWESNPr/5L05HGgdMnFYcqPa3i2m8L6XZwoHPbJ61cjAAlEEfiLHcldcWad8aP8Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrLFG9FFUFFZmttykjJC+qRvnHJhAxZQltz3JBjvxHw=;
 b=MqqLoZa8sWgOkaKI1Q6v9iUWGXCTh12elJNUS0xnamEDci0ctiplThqgrP09pKQeIAcdwNEisLqBh/d51gOyFBXObcX0w3JhQYnMrN791jhFRZUowJLr93oWc7WIuQhmbC+2HxolBF9G1fdGBe/2xbbSWsVFk1mDfit/tmBb3tw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <14cc2bd1-168f-4420-ab1d-5d2d76315ec9@citrix.com>
Date: Mon, 21 Sep 2026 14:39:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 4/5] x86/hvm: Transition to needs_tlb_flush logic,
 use per-domain ASID
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Tim Deegan <tim@xen.org>
References: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
 <1785509309.8631fc262581453bbf619ec5b2062170.19fb8a5ecef000e099@vates.tech>
 <0b4a8cb9-e398-43a5-8f68-2c36d245c88d@citrix.com>
 <1789995064.8631fc262581453bbf619ec5b2062170.1a0c4051b5b00072c4@vates.tech>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <1789995064.8631fc262581453bbf619ec5b2062170.1a0c4051b5b00072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0328.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::33) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SA3PR03MB020706:EE_
X-MS-Office365-Filtering-Correlation-Id: e958b353-ca7d-4f07-fc20-08df17e5b5eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|6133799003|3023799007|10067099003|11063799006|4143699003|56012099006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FBmqYvsKNNT20BqVD1UpuJHpqdINz9JRLxczTYw8so82F81gC7D31YY8TksIAPdM7ikbDVPOlSJtEctbTzrQIihhi0vF9w5V+t03uNw+ba47gu1SedqW8fEj96uh/dvk0GyhyF+VtltFqEnqHbsl+nGwOVWl4aI4o/8P0vC2Rkk+oPtPtLCKmSimr7dCNy5OvxmT5r4C9xyc9LmbvByyuHn1jNVJOxFuEvafbeoxDM2F9+/eNjyVQkJ7Pl2LIdIgx2TQr1lMYHnWaQfLKiyLWN6e9wvGf1BV0i+ClKn3YNW16pq9ERzNP4GhihNcHxJEzra4ytcniN78tymSxZDezeKCZtfZdRobntm45m/xtj3CmvqN47moWmETls355uJS3Pj+BFmARHyNw0lDg88JxK5BpknvTdHuhC7vvxPJ6f9bD5rY2xW9EIHaCSWPR2qc8b/j9smmbxB3beyT5O4C6SpPwV4SoUIFxdqGB1eETIlKieLZ+XTuPm88jg7XlyqJiWKXQUunKQwSjFVe8fVLZ21dbsZ21kDdU1UQGAimNWoN2/rHKeaz4RX87ZzGenjXNFBd5skJGaZ+VRI1MJDgN8n2abEdRkK7GHO3lVd7yXF8S0MaQpYmueV6GfILbVeEczoIm+o11JGE73tW/5Crz8r8nZ9zDsW88OJGKV44XiQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(6133799003)(3023799007)(10067099003)(11063799006)(4143699003)(56012099006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUJrV3lqYm9tYVJyTTZaay9DSlhEeklFZHloaDhsWGJ1UDY1NVFZbHlySUZ1?=
 =?utf-8?B?aFlVb0NlR0dIeTAyaWpSOUVZOFR5aDNvOUdDL3hNeGorYW1mcGFheDNwNkdm?=
 =?utf-8?B?RDkwSTdjYkRXR2xWaDk3M0tNUkt4dU40R0d5RURXSS90MWpOcWpBSEZ0TGZt?=
 =?utf-8?B?RTRYc01Hd0tyUVFSaXNzVkhQaG9CTUNGUGpJeUo2cEFYWnFUVzdOd1dYZEQw?=
 =?utf-8?B?dEVjajJNRlduNVQ0Qm8zR2Jyd0tvYmtVWlBiKzNEbC9tVllRNUpaNS9iSmxl?=
 =?utf-8?B?VXBreVlsYUZFMXR1OXFob1JyVEt4T0g2czI3Z0F5NU80WWhhSW9ndGFEb1Yz?=
 =?utf-8?B?ZEptUUVHUUplSDNlcHBHTVlveGYzbmw1NXkrR1d5QmhrQW5FWWVzZzBqZXhC?=
 =?utf-8?B?Ym1YRWFEMVRmU3N3ZlkvQ001WXd4dkRGQVVpNCszT3dxOHpuMGJvUWdtMHNv?=
 =?utf-8?B?WEZ0TGQwUDVWZmxsU0tDMWdzT1pkS3ZHeXBRYWRvazhHMGtsN3Z6NGtpUHJH?=
 =?utf-8?B?R0dZR2FnV0NNZjRqRERGbjl6NnREK3o0a1lGWGM5aWozaDJHOEwwN0Y0S3Vj?=
 =?utf-8?B?S21RMkI1R2gwVXVZTTdGQ3pBYVlSWGQ4MlE3SkJZaGFIdkl5eGpvbm5jL0Mr?=
 =?utf-8?B?c0JjdjhiY0phWDQzYVpybVlGQklCOE5WN3BtUG9ZUWY2c1Q5Wm5qVG1OWkVU?=
 =?utf-8?B?N21BRGZjQUJYbWpnWllMYTR2YVRFZWhabS9rVFB3NzV0WGh1WmV0cU5hcUl2?=
 =?utf-8?B?V01lQSttaGNkcGdMenkrVDJPVEJ0SlpIKzhKZFdHcUE0djJJWGJrWE9vTGli?=
 =?utf-8?B?REg3TjVDUXhyS25aWVFnTHc5V0xtM0pMV2VxM1hucjN1TDdnNHUvSDExTzgr?=
 =?utf-8?B?cU14UzUybndQckw0M0ZLdzFhODROcm9NUStKeE1ZRTcrdDEyb3hWNW5udDhT?=
 =?utf-8?B?cXpVOHg0b1Y3OFRQQkJLaUVPQmNZRWhFby9yNXRPaEJUVkNTYmNpRXcxczZs?=
 =?utf-8?B?WkpiRVl3bTN2cEpHTUdPaGFuVlUxYlVqSDNqWVYyLzhzQkNwQnN0K3QweENI?=
 =?utf-8?B?SWpZRlBzNWtNNmk0TStJcHpkS05aYkw3ZDZuV3Q4eFZ1MkxyQ1hUazVkenhj?=
 =?utf-8?B?TWJQZG5WdVRrZ28rbVpoLzAvWnp1N1N5MmdIbXhZQmw4VlBOS3dzTlhxbTVr?=
 =?utf-8?B?YWpuYUZoSGk3NDhpMUo5QThPMHRCQkI5dUtJZG5GaVl4RURtaTQyaS9LekVl?=
 =?utf-8?B?dGloejdRMkdPQlBHZEM5RzlDcXVGamJQSDRQNlBrWTlxOGdFVW1XMjFWQ2s3?=
 =?utf-8?B?My9mTWVtYnJGL3FxeklMRlMxd1BqS1Jxa09kSW1kU2p0YzUvTU1OdG0xL0lu?=
 =?utf-8?B?eWx5WEpvTHBHUWh0Z0pkK1c2SGRSVUY3WENCNVppU042cEpVaE1QR0xXbUtk?=
 =?utf-8?B?czY4YmlqSmtNOERzdUNTSXg3eHlKcmM0SDlIRjFyVjNicmkxNzNqOG5FWUhy?=
 =?utf-8?B?ZnVFcm50NTQ3NFp6cENwSmxOa2x3ODF2eGlpM1ZSdTI1enpwSWFjNDk3KzhE?=
 =?utf-8?B?U2ZPY0hNUnl3aEg2N0MwTEZXL29iQ2VWQnlhQkxFZjBlVU5JZ2gxTGFaWXpx?=
 =?utf-8?B?K1FRdHFVWGxXWVJsY0c0UWc2V1lOM0tqRmlMenFUMU9lSUY5cEpCODlSMHVC?=
 =?utf-8?B?OStNQzlPNXhmejB1MjFFTGdSZmtaeXgyVGJVd2o4b3Iwd01sNkVHQ3BRL09r?=
 =?utf-8?B?L3RhU2EvSC82WnNGRWROWXZkU2R5YWhHSnRnUUFhVkszRG1HNVh4MzNRVHcx?=
 =?utf-8?B?MU9IQ29Banpmelh3ekdiUWRsTVVPUEZoWVphTlRmSHdwTDJrOGhpL3FxYTVz?=
 =?utf-8?B?TnJRV09FdVEvM1VhUVZtWDZhRVpQUnQxUUZWZy9sa3FJYkovbUNwME41WUN0?=
 =?utf-8?B?M0JKcXY4SXdFVGQ1RnFmcGZLOUU1ZDhwb1Z1OWE4bko0cHFCdDdIbDhhTDlV?=
 =?utf-8?B?ZGxGeWliZ0tqQmp5RWlNVkVlWTN1QVBHV1htRXgxK2hmaXZ2NWlKcGQ5cFdF?=
 =?utf-8?B?V09iL1FLSjFYcDlMNlArR1Bjd21sU2k2Q2FGN3U5WDdXdU1NRjJFSUVVMlg2?=
 =?utf-8?B?RzU4dDR0enJVV2JOMHJFdDNGOFJSenZBbkxsTDFhcTdiVzFSN1RGN3NuMnVn?=
 =?utf-8?B?QTV0SWhzOVNoVjRHQUR1VG80MXZ6YkZVdGJMT2gyK2w0MFJBanVMNVhCbkxI?=
 =?utf-8?B?TEVIY1NOMTlRWlFmaC9ONlZlbUU0MXhPWEpVaEFKd3FobWpzSURIUnIveVZk?=
 =?utf-8?B?S08wdkdsYy80M1dNeVRsUkZtbFNrY2lSclVyYk8wK21HKzlnR0JDWDZSYVRa?=
 =?utf-8?Q?0ALvkBvfWOshICcs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e958b353-ca7d-4f07-fc20-08df17e5b5eb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:39:07.8922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5Y0x/AQlCPW4KA9t4OgzOLgD3rnCDq9Tc3NzXACHl5oZ15fPIlt6I1GaUQIfEFu49x3S1N0Rjv/DwkV4hWro2ugImcD/FE1iJkysoTNIws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB020706
X-purgate-ID: tlsNG-d62444/1789997952-BD67C4F7-9AD95341/0/0
X-purgate-type: clean
X-purgate-size: 62213

On 9/21/26 1:51 PM, Teddy Astie wrote:
> Le 18/09/2026 à 18:30, Ross Lagerwall a écrit :
>> On 7/31/26 3:46 PM, Teddy Astie wrote:
>>> Change the ASID model where all vCPU of a domain share the same ASID
>>> as required by AMD SEV and broadcast TLB flushing features (AMD INVLPGB).
>>>
>>> ASID 1 is reserved as a placeholder for "no domain ASID", and used when
>>> either ASID are not supported or no more ASID is available for use.
>>> In this case, we always flush the TLB when from and to such domain's
>>> vCPU.
>>>
>>> Moreover, centralize the TLB flushing logic to use needs_tlb_flush, if
>>> a full TLB flush needs to be performed for the vCPU, either through
>>> SVM tlb_control or VMX invvpid before entering the guest.
>>>
>>> As a result, drop ASID tickling logic, which is now redundant with the
>>> needs_tlb_flush mechanism introduced previously. Also take the opportunity
>>> to drop some now unused helpers now that FLUSH_HVM_ASID_CORE is dropped.
>>>
>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>> ---
>>> This patch is particularly hard to split as the required changes needs
>>> to come all at once.
>>>
>>> Some questions :
>>>   - On Intel, with "ASID disabled", should we distinguish between using sentinel
>>>     "VPID=1" (with single-context flush of VPID=1) with disabling VPID (through
>>>     SECONDARY_EXEC_ENABLE_VPID) which implies flushing all VPID=0 (Xen/PV ones) TLB
>>>     entries on vmenter ?
>>>     Of course, hardware without VPID support can't use VPID=1 and will behave with
>>>     VPID disabled.
>>>
>>>   - I tested it on both Intel and AMD platforms without much issues, but didn't
>>>     performed tests with nested virt which has tricky interactions with these
>>>     changes.
>>>
>>>   docs/misc/xen-command-line.pandoc      |   2 +-
>>>   xen/arch/x86/flushtlb.c                |  22 +---
>>>   xen/arch/x86/hvm/asid.c                | 169 +++++++++++--------------
>>>   xen/arch/x86/hvm/emulate.c             |   2 +-
>>>   xen/arch/x86/hvm/hvm.c                 |  14 +-
>>>   xen/arch/x86/hvm/nestedhvm.c           |   7 +-
>>>   xen/arch/x86/hvm/svm/asid.c            |  67 +++++++---
>>>   xen/arch/x86/hvm/svm/nestedsvm.c       |   2 +-
>>>   xen/arch/x86/hvm/svm/svm.c             |  35 +++--
>>>   xen/arch/x86/hvm/svm/svm.h             |   4 -
>>>   xen/arch/x86/hvm/vmx/vmcs.c            |   6 +-
>>>   xen/arch/x86/hvm/vmx/vmx.c             |  66 +++++-----
>>>   xen/arch/x86/hvm/vmx/vvmx.c            |   4 +-
>>>   xen/arch/x86/include/asm/flushtlb.h    |   7 -
>>>   xen/arch/x86/include/asm/hvm/asid.h    |  30 ++---
>>>   xen/arch/x86/include/asm/hvm/domain.h  |   1 +
>>>   xen/arch/x86/include/asm/hvm/hvm.h     |  15 +--
>>>   xen/arch/x86/include/asm/hvm/svm.h     |   5 +
>>>   xen/arch/x86/include/asm/hvm/vcpu.h    |  10 +-
>>>   xen/arch/x86/include/asm/hvm/vmx/vmx.h |   4 +-
>>>   xen/arch/x86/mm/hap/hap.c              |   9 +-
>>>   xen/arch/x86/mm/p2m.c                  |   6 +-
>>>   xen/arch/x86/mm/paging.c               |   2 +-
>>>   xen/arch/x86/mm/shadow/multi.c         |  12 +-
>>>   24 files changed, 241 insertions(+), 260 deletions(-)
>>>
>>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen- command-line.pandoc
>>> index 1c711fa980..f59c14d447 100644
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -208,7 +208,7 @@ to appropriate auditing by Xen.  Argo is disabled by default.
>>>   > Default: `true`
>>>   Permit Xen to use Address Space Identifiers.  This is an optimisation which
>>> -tags the TLB entries with an ID per vcpu.  This allows for guest TLB flushes
>>> +tags the TLB entries with an ID per domain.  This allows for guest TLB flushes
>>>   to be performed without the overhead of a complete TLB flush.
>>>   ### async-show-all (x86)
>>> diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
>>> index 5e2ed50ec9..478a3f4962 100644
>>> --- a/xen/arch/x86/flushtlb.c
>>> +++ b/xen/arch/x86/flushtlb.c
>>> @@ -13,6 +13,7 @@
>>>   #include <xen/softirq.h>
>>>   #include <asm/cache.h>
>>>   #include <asm/flushtlb.h>
>>> +#include <asm/hvm/hvm.h>
>>>   #include <asm/invpcid.h>
>>>   #include <asm/nops.h>
>>>   #include <asm/page.h>
>>> @@ -119,7 +120,6 @@ void switch_cr3_cr4(struct vcpu *v, unsigned long cr3, unsigned long cr4)
>>>       if ( tlb_clk_enabled )
>>>           t = pre_flush();
>>> -    hvm_flush_guest_tlbs();
>>>       old_cr4 = read_cr4();
>>>       ASSERT(!(old_cr4 & X86_CR4_PCIDE) || !(old_cr4 & X86_CR4_PGE));
>>> @@ -224,9 +224,6 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
>>>               do_tlb_flush();
>>>       }
>>> -    if ( flags & FLUSH_HVM_ASID_CORE )
>>> -        hvm_flush_guest_tlbs();
>>> -
>>>       if ( flags & (FLUSH_CACHE_EVICT | FLUSH_CACHE_WRITEBACK) )
>>>       {
>>>           const struct cpuinfo_x86 *c = &current_cpu_data;
>>> @@ -316,18 +313,13 @@ void cache_writeback(const void *addr, unsigned int size)
>>>       asm volatile ("sfence" ::: "memory");
>>>   }
>>> -unsigned int guest_flush_tlb_flags(const struct domain *d)
>>> -{
>>> -    bool shadow = paging_mode_shadow(d);
>>> -    bool asid = is_hvm_domain(d) && (cpu_has_svm || shadow);
>>> -
>>> -    return (shadow ? FLUSH_TLB : 0) | (asid ? FLUSH_HVM_ASID_CORE : 0);
>>> -}
>>> -
>>>   void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask)
>>>   {
>>> -    unsigned int flags = guest_flush_tlb_flags(d);
>>> +    struct vcpu *v;
>>> +
>>> +    if ( paging_mode_shadow(d) )
>>> +        flush_tlb_mask(mask);
>>> -    if ( flags )
>>> -        flush_mask(mask, flags);
>>> +    for_each_vcpu(d, v)
>>> +        v->arch.needs_tlb_flush = true;
>>>   }
>>> diff --git a/xen/arch/x86/hvm/asid.c b/xen/arch/x86/hvm/asid.c
>>> index 935cae3901..1a21125161 100644
>>> --- a/xen/arch/x86/hvm/asid.c
>>> +++ b/xen/arch/x86/hvm/asid.c
>>> @@ -5,138 +5,115 @@
>>>    * Copyright (c) 2009, Citrix Systems, Inc.
>>>    */
>>> +#include <xen/errno.h>
>>>   #include <xen/init.h>
>>>   #include <xen/lib.h>
>>>   #include <xen/param.h>
>>> -#include <xen/sched.h>
>>> -#include <xen/smp.h>
>>> -#include <xen/percpu.h>
>>> +#include <xen/spinlock.h>
>>> +#include <xen/xvmalloc.h>
>>> +
>>> +#include <asm/bitops.h>
>>>   #include <asm/hvm/asid.h>
>>>   /* Xen command-line option to enable ASIDs */
>>>   static bool __read_mostly opt_asid_enabled = true;
>>>   boolean_param("asid", opt_asid_enabled);
>>> +bool __read_mostly asid_enabled = false;
>>> +static unsigned long __ro_after_init *asid_bitmap;
>>> +static unsigned long __ro_after_init asid_count;
>>> +static DEFINE_SPINLOCK(asid_lock);
>>> +
>>>   /*
>>> - * ASIDs partition the physical TLB.  In the current implementation ASIDs are
>>> - * introduced to reduce the number of TLB flushes.  Each time the guest's
>>> - * virtual address space changes (e.g. due to an INVLPG, MOV-TO-{CR3, CR4}
>>> - * operation), instead of flushing the TLB, a new ASID is assigned. This
>>> - * reduces the number of TLB flushes to at most 1/#ASIDs.  The biggest
>>> - * advantage is that hot parts of the hypervisor's code and data retain in
>>> - * the TLB.
>>> - *
>>>    * Sketch of the Implementation:
>>> + * ASIDs are assigned uniquely per domain and doesn't change during the lifecycle of the
>>> + * domain. Once vcpus are initialized and are up, we assign the same ASID to all vcpus
>>> + * of that domain at the first VMRUN. In order to process a TLB flush on a vcpu, we set
>>> + * needs_tlb_flush to schedule a TLB flush for the next VMRUN (e.g using tlb control
>>> + * field of VMCB).
>>>    *
>>> - * ASIDs are a CPU-local resource.  As preemption of ASIDs is not possible,
>>> - * ASIDs are assigned in a round-robin scheme.  To minimize the overhead of
>>> - * ASID invalidation, at the time of a TLB flush,  ASIDs are tagged with a
>>> - * 64-bit generation.  Only on a generation overflow the code needs to
>>> - * invalidate all ASID information stored at the VCPUs with are run on the
>>> - * specific physical processor.  This overflow appears after about 2^80
>>> - * host processor cycles, so we do not optimize this case, but simply disable
>>> - * ASID useage to retain correctness.
>>> + * We reserve ASID=1 as being the ASID used when none other is available (or with asid
>>> + * use disabled). Multiples domains may use this ASID, thus we need to systematically
>>> + * flush the TLB for this one when switching between vCPUs with ASID=1.
>>>    */
>>> -/* Per-CPU ASID management. */
>>> -struct hvm_asid_data {
>>> -   uint64_t core_asid_generation;
>>> -   uint32_t next_asid;
>>> -   uint32_t max_asid;
>>> -   bool disabled;
>>> -};
>>> -
>>> -static DEFINE_PER_CPU(struct hvm_asid_data, hvm_asid_data);
>>> -
>>> -void hvm_asid_init(unsigned int nasids)
>>> +int __init hvm_asid_init(unsigned long nasids)
>>>   {
>>> -    static int8_t __ro_after_init g_disabled = -1;
>>> -    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
>>> +    ASSERT(nasids);
>>> -    data->max_asid = nasids - 1;
>>> -    data->disabled = !opt_asid_enabled || (nasids <= 1);
>>> +    asid_count = nasids;
>>> +    asid_enabled = opt_asid_enabled && (nasids > 1);
>>> -    if ( g_disabled < 0 )
>>> -    {
>>> -        g_disabled = data->disabled;
>>> -        printk("HVM: ASIDs %sabled\n", data->disabled ? "dis" : "en");
>>> -    }
>>> -    else if ( g_disabled != data->disabled )
>>> -        printk("HVM: CPU%u: ASIDs %sabled\n", smp_processor_id(),
>>> -               data->disabled ? "dis" : "en");
>>> +    asid_bitmap = xvzalloc_array(unsigned long, BITS_TO_LONGS(asid_count + 1));
>>> +    if ( !asid_bitmap )
>>> +        return -ENOMEM;
>>
>> Should there be a sanity check to avoid an excessive allocation? E.g. If
>> running under another hypervisor, it might set nasids to ~0 while with one per
>> domain we need no more than ~64k.
>>
> 
> Indeed, I didn't consider that AMD had (and enumerates) 32-bits ASIDs. Only Intel uses 16-bits VPIDs.
> 
> Limiting to 64k seems wise, the remaining question is that I'm not sure if we want to make that configurable.
> 
>>> -    /* Zero indicates 'invalid generation', so we start the count at one. */
>>> -    data->core_asid_generation = 1;
>>> +    printk("HVM: ASIDs %sabled (count=%lu)\n", asid_enabled ? "en" : "dis", asid_count);
>>> -    /* Zero indicates 'ASIDs disabled', so we start the count at one. */
>>> -    data->next_asid = 1;
>>> -}
>>> +    /* ASID 0 and 1 are reserved, mark it as permanently used */
>>> +    set_bit(0, asid_bitmap);
>>> +    set_bit(1, asid_bitmap);
>>> -void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid)
>>> -{
>>> -    write_atomic(&asid->generation, 0);
>>> +    return 0;
>>>   }
>>> -void hvm_asid_flush_vcpu(struct vcpu *v)
>>> +int hvm_asid_alloc(struct hvm_asid *asid)
>>>   {
>>
>> Can this be implemented in terms of hvm_asid_alloc_range() as these functions
>> seem to be mostly duplicated?
>>
> 
> yes
> 
>>> -    hvm_asid_flush_vcpu_asid(&v->arch.hvm.n1asid);
>>> -    hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
>>> -}
>>> +    unsigned long new_asid;
>>> -void hvm_asid_flush_core(void)
>>> -{
>>> -    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
>>> +    if ( !asid_enabled )
>>> +    {
>>> +        asid->asid = 1;
>>> +        return 0;
>>> +    }
>>> -    if ( data->disabled )
>>> -        return;
>>> +    spin_lock(&asid_lock);
>>> +    new_asid = find_first_zero_bit(asid_bitmap, asid_count);
>>> +    if ( new_asid > asid_count )
>>> +        return -ENOSPC;
>>> -    if ( likely(++data->core_asid_generation != 0) )
>>> -        return;
>>> +    set_bit(new_asid, asid_bitmap);
>>> -    /*
>>> -     * ASID generations are 64 bit.  Overflow of generations never happens.
>>> -     * For safety, we simply disable ASIDs, so correctness is established; it
>>> -     * only runs a bit slower.
>>> -     */
>>> -    printk("HVM: ASID generation overrun. Disabling ASIDs.\n");
>>> -    data->disabled = 1;
>>> +    asid->asid = new_asid;
>>> +    spin_unlock(&asid_lock);
>>> +    return 0;
>>>   }
>>> -bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid)
>>> +int hvm_asid_alloc_range(struct hvm_asid *asid, unsigned long min, unsigned long max)
>>>   {
>>> -    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
>>> +    unsigned long new_asid;
>>> +
>>> +    if ( WARN_ON(min >= asid_count) )
>>> +        return -EINVAL;
>>> -    /* On erratum #170 systems we must flush the TLB.
>>> -     * Generation overruns are taken here, too. */
>>> -    if ( data->disabled )
>>> -        goto disabled;
>>> +    if ( !asid_enabled )
>>> +        return -EOPNOTSUPP;
>>> -    /* Test if VCPU has valid ASID. */
>>> -    if ( read_atomic(&asid->generation) == data->core_asid_generation )
>>> -        return 0;
>>> +    spin_lock(&asid_lock);
>>> +    new_asid = find_next_zero_bit(asid_bitmap, asid_count, min);
>>> +    if ( new_asid > max || new_asid > asid_count )
>>> +        return -ENOSPC;
>>> -    /* If there are no free ASIDs, need to go to a new generation */
>>> -    if ( unlikely(data->next_asid > data->max_asid) )
>>> -    {
>>> -        hvm_asid_flush_core();
>>> -        data->next_asid = 1;
>>> -        if ( data->disabled )
>>> -            goto disabled;
>>> -    }
>>> +    set_bit(new_asid, asid_bitmap);
>>> -    /* Now guaranteed to be a free ASID. */
>>> -    asid->asid = data->next_asid++;
>>> -    write_atomic(&asid->generation, data->core_asid_generation);
>>> +    asid->asid = new_asid;
>>> +    spin_unlock(&asid_lock);
>>> +    return 0;
>>> +}
>>> -    /*
>>> -     * When we assign ASID 1, flush all TLB entries as we are starting a new
>>> -     * generation, and all old ASID allocations are now stale.
>>> -     */
>>> -    return (asid->asid == 1);
>>> +void hvm_asid_free(struct hvm_asid *asid)
>>> +{
>>> +    ASSERT( asid->asid );
>>> - disabled:
>>> -    asid->asid = 0;
>>> -    return 0;
>>> +    if ( !asid_enabled || asid->asid == 1 )
>>> +        return;
>>> +
>>> +    ASSERT( asid->asid < asid_count );
>>> +
>>> +    spin_lock(&asid_lock);
>>> +    WARN_ON(!test_bit(asid->asid, asid_bitmap));
>>> +    clear_bit(asid->asid, asid_bitmap);
>>> +    spin_unlock(&asid_lock);
>>>   }
>>>   /*
>>> diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
>>> index 2efb1d4f08..259a2b0caf 100644
>>> --- a/xen/arch/x86/hvm/emulate.c
>>> +++ b/xen/arch/x86/hvm/emulate.c
>>> @@ -2655,7 +2655,7 @@ static int cf_check hvmemul_tlb_op(
>>>       case x86emul_invpcid:
>>>           if ( x86emul_invpcid_type(aux) != X86_INVPCID_INDIV_ADDR )
>>>           {
>>> -            hvm_asid_flush_vcpu(current);
>>> +            current->arch.needs_tlb_flush = true;
>>>               break;
>>>           }
>>>           aux = x86emul_invpcid_pcid(aux);
>>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>>> index a75ccb57bf..283dcad691 100644
>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -715,6 +715,10 @@ int hvm_domain_initialise(struct domain *d,
>>>       if ( rc )
>>>           goto fail2;
>>> +    rc = hvm_asid_alloc(&d->arch.hvm.asid);
>>> +    if ( rc )
>>> +        goto fail2;
>>> +
>>
>> Don't you need to free the asid if the subsequent function call(s) fail?
>>
> 
> Yes, the hvm_free_asid call is in hvm_domain_destroy(), I guess it would be better to have it in hvm_domain_relinquish_resources() so that it's called by the error handling of hvm_domain_initialise() too.
> 
>>>       rc = alternative_call(hvm_funcs.domain_initialise, d);
>>>       if ( rc != 0 )
>>>           goto fail2;
>>> @@ -795,7 +799,7 @@ void hvm_domain_destroy(struct domain *d)
>>>           list_del(&ioport->list);
>>>           xfree(ioport);
>>>       }
>>> -
>>> +    hvm_asid_free(&d->arch.hvm.asid);
>>>       destroy_vpci_mmcfg(d);
>>>   }
>>> @@ -1613,7 +1617,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
>>>       int rc;
>>>       struct domain *d = v->domain;
>>> -    hvm_asid_flush_vcpu(v);
>>> +    v->arch.needs_tlb_flush = true;
>>>       spin_lock_init(&v->arch.hvm.tm_lock);
>>>       INIT_LIST_HEAD(&v->arch.hvm.tm_list);
>>> @@ -4085,6 +4089,11 @@ static void hvm_s3_resume(struct domain *d)
>>>       }
>>>   }
>>> +int hvm_flush_tlb(const unsigned long *vcpu_bitmap)
>>> +{
>>> +    return current->domain->arch.paging.flush_tlb(vcpu_bitmap);
>>> +}
>>> +
>>>   static int hvmop_flush_tlb_all(void)
>>>   {
>>>       if ( !is_hvm_domain(current->domain) )
>>> @@ -5461,4 +5470,3 @@ int hvm_copy_context_and_params(struct domain *dst, struct domain *src)
>>>    * indent-tabs-mode: nil
>>>    * End:
>>>    */
>>> -
>>> diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
>>> index bddd77d810..61e866b771 100644
>>> --- a/xen/arch/x86/hvm/nestedhvm.c
>>> +++ b/xen/arch/x86/hvm/nestedhvm.c
>>> @@ -12,6 +12,7 @@
>>>   #include <asm/hvm/nestedhvm.h>
>>>   #include <asm/event.h>  /* for local_event_delivery_(en|dis)able */
>>>   #include <asm/paging.h> /* for paging_mode_hap() */
>>> +#include <asm/hvm/asid.h>
>>>   static unsigned long *shadow_io_bitmap[3];
>>> @@ -36,13 +37,11 @@ nestedhvm_vcpu_reset(struct vcpu *v)
>>>       hvm_unmap_guest_frame(nv->nv_vvmcx, 1);
>>>       nv->nv_vvmcx = NULL;
>>>       nv->nv_vvmcxaddr = INVALID_PADDR;
>>> -    nv->nv_flushp2m = 0;
>>> +    nv->nv_flushp2m = true;
>>>       nv->nv_p2m = NULL;
>>>       nv->stale_np2m = false;
>>>       nv->np2m_generation = 0;
>>> -    hvm_asid_flush_vcpu_asid(&nv->nv_n2asid);
>>> -
>>>       alternative_vcall(hvm_funcs.nhvm_vcpu_reset, v);
>>>       /* vcpu is in host mode */
>>> @@ -86,7 +85,7 @@ static void cf_check nestedhvm_flushtlb_ipi(void *info)
>>>        * This is cheaper than flush_tlb_local() and has
>>>        * the same desired effect.
>>>        */
>>> -    hvm_asid_flush_core();
>>> +    WARN_ON(hvm_flush_tlb(NULL));
>>
>> IIUC, nestedhvm_vmcx_flushtlb() IPIs multiple pCPUs to run
>> nestedhvm_flushtlb_ipi() and each of those calls flushes the TLB of every vCPU
>> in whatever domain "current" points to and then triggers a VMEXIT on the
>> relevant pCPUs.
>>
>> (Or current might be a shadow domain or the idle domain and do something
>> different...)
>>
>> Is this what you intended because it doesn't seem right to me?
>>
> 
> The nested logic probably don't match what is intended (it's mostly a attempt at making things compile).
> 
> But overall, IIUC, this function is called after we invalidated the nested p2m table. I had in mind rethinking the TLB flushing model towards better spliting SLAT-related flushes and guest so that it doesn't end up awkward.

After a nested P2M flush, we IPI the other CPUs using the nested P2M to reload
the correct nested P2M and flush the TLB, so I think all this needs to do is set
the needs_tlb_flush flag (see the attached patch).

> 
>>>       vcpu_nestedhvm(v).nv_p2m = NULL;
>>>       vcpu_nestedhvm(v).stale_np2m = true;
>>>   }
>>> diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
>>> index 53aa5d0512..44d2138895 100644
>>> --- a/xen/arch/x86/hvm/svm/asid.c
>>> +++ b/xen/arch/x86/hvm/svm/asid.c
>>> @@ -1,39 +1,46 @@
>>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>>   /*
>>> - * asid.c: handling ASIDs in SVM.
>>> + * asid.c: handling ASIDs/VPIDs.
>>>    * Copyright (c) 2007, Advanced Micro Devices, Inc.
>>>    */
>>> +#include <xen/cpumask.h>
>>> +
>>>   #include <asm/amd.h>
>>>   #include <asm/hvm/nestedhvm.h>
>>>   #include <asm/hvm/svm.h>
>>> +#include <asm/processor.h>
>>>   #include "svm.h"
>>>   #include "vmcb.h"
>>> -void svm_asid_init(const struct cpuinfo_x86 *c)
>>> +void __init svm_asid_init(void)
>>>   {
>>> -    unsigned int nasids = 0;
>>> +    unsigned int cpu, nasids = cpuid_ebx(0x8000000aU);
>>> +
>>> +    if ( !nasids )
>>> +        nasids = 1;
>>> -    /* Check for erratum #170, and leave ASIDs disabled if it's present. */
>>> -    if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
>>> -        nasids = cpuid_ebx(0x8000000aU);
>>> +    for_each_present_cpu(cpu)
>>> +    {
>>> +        /* Check for erratum #170, and leave ASIDs disabled if it's present. */
>>> +        if ( cpu_has_amd_erratum(&cpu_data[cpu], AMD_ERRATUM_170) )
>>> +        {
>>> +            printk(XENLOG_WARNING "Disabling ASID due to errata 170 on CPU%u\n", cpu);
>>> +            nasids = 1;
>>> +        }
>>> +    }
>>> -    hvm_asid_init(nasids);
>>> +    BUG_ON(hvm_asid_init(nasids));
>>>   }
>>>   /*
>>> - * Called directly before VMRUN.  Checks if the VCPU needs a new ASID,
>>> - * assigns it, and if required, issues required TLB flushes.
>>> + * Called directly at the first VMRUN/VMENTER of a vcpu to assign the ASID/VPID.
>>
>> Mentioning VMENTER and VPID is not relevent in this AMD code.
>>
> 
> yes
> 
>>>    */
>>> -void svm_asid_handle_vmrun(void)
>>> +void svm_vcpu_assign_asid(struct vcpu *v)
>>>   {
>>> -    struct vcpu *curr = current;
>>> -    struct vmcb_struct *vmcb = curr->arch.hvm.svm.vmcb;
>>> -    struct hvm_vcpu_asid *p_asid =
>>> -        nestedhvm_vcpu_in_guestmode(curr)
>>> -        ? &vcpu_nestedhvm(curr).nv_n2asid : &curr->arch.hvm.n1asid;
>>> -    bool need_flush = hvm_asid_handle_vmenter(p_asid);
>>> +    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>>> +    struct hvm_asid *p_asid = &v->domain->arch.hvm.asid;
>>>       /* ASID 0 indicates that ASIDs are disabled. */
>>>       if ( p_asid->asid == 0 )
>>> @@ -44,11 +51,31 @@ void svm_asid_handle_vmrun(void)
>>>           return;
>>>       }
>>> -    if ( vmcb_get_asid(vmcb) != p_asid->asid )
>>> -        vmcb_set_asid(vmcb, p_asid->asid);
>>> +    /* In case ASIDs are disabled, as ASID = 0 is reserved, guest can use 1 instead. */
>>> +    vmcb_set_asid(vmcb, asid_enabled ? p_asid->asid : 1);
>>> +}
>>> +
>>> +/* Call to make a TLB flush at the next VMRUN. */
>>> +void svm_vcpu_set_tlb_control(struct vcpu *v)
>>> +{
>>> +    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>>> +
>>> +    /*
>>> +     * If the vcpu is already running, the tlb control flag may not be
>>> +     * processed and will be cleared at the next VMEXIT, which will undo
>>> +     * what we are trying to do.
>>> +     */
>>> +    WARN_ON(v != current && v->is_running);
>>> +
>>> +    vmcb->tlb_control =
>>> +        cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
>>> +}
>>> +
>>> +void svm_vcpu_clear_tlb_control(struct vcpu *v)
>>> +{
>>> +    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>>> -    /* We can't rely on TLB_CTRL_FLUSH_ASID as all ASIDs are stale here. */
>>> -    vmcb->tlb_control = need_flush ? TLB_CTRL_FLUSH_ALL : TLB_CTRL_NO_FLUSH;
>>> +    vmcb->tlb_control = TLB_CTRL_NO_FLUSH;
>>>   }
>>>   /*
>>> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/ nestedsvm.c
>>> index b06124c2c9..c712b98256 100644
>>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>>> @@ -5,6 +5,7 @@
>>>    *
>>>    */
>>> +#include <asm/hvm/asid.h>
>>>   #include <asm/hvm/support.h>
>>>   #include <asm/hvm/svm.h>
>>>   #include <asm/hvm/nestedhvm.h>
>>> @@ -633,7 +634,6 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
>>>       if ( svm->ns_asid != vmcb_get_asid(ns_vmcb))
>>>       {
>>>           nv->nv_flushp2m = 1;
>>> -        hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
>>>           svm->ns_asid = vmcb_get_asid(ns_vmcb);
>>>       }
>>
>> Removing this flush seems wrong. If VMCB(1-2) has switched to a new ASID but
>> VMCB(0-2) always uses the same ASID (same as VMCB(0-1) IIUC), then we surely
>> need to flush the TLB for correctness.
>>
> 
> Yes, I think we ideally want some form of vASID; so that can have better heuristics on when to flush.
> 

Perhaps - or we flush on every L1/L2 transition like KVM does.
Discussed further below...

>>> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
>>> index 38c61db1d7..e9026e0ae5 100644
>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>> @@ -27,6 +27,7 @@
>>>   #include <asm/hvm/nestedhvm.h>
>>>   #include <asm/hvm/support.h>
>>>   #include <asm/hvm/svm.h>
>>> +#include <asm/hvm/asid.h>
>>>   #include <asm/i387.h>
>>>   #include <asm/idt.h>
>>>   #include <asm/iocap.h>
>>> @@ -137,14 +138,17 @@ static void cf_check svm_update_guest_cr(
>>>           if ( !nestedhvm_enabled(v->domain) )
>>>           {
>>>               if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
>>> -                hvm_asid_flush_vcpu(v);
>>> +                v->arch.needs_tlb_flush = true;
>>>           }
>>>           else if ( nestedhvm_vmswitch_in_progress(v) )
>>>               ; /* CR3 switches during VMRUN/VMEXIT do not flush the TLB. */
>>>           else if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
>>> -            hvm_asid_flush_vcpu_asid(
>>> -                nestedhvm_vcpu_in_guestmode(v)
>>> -                ? &vcpu_nestedhvm(v).nv_n2asid : &v->arch.hvm.n1asid);
>>> +        {
>>> +            if (nestedhvm_vcpu_in_guestmode(v))
>>> +                vcpu_nestedhvm(v).nv_flushp2m = true;
>>> +            else
>>> +                v->arch.needs_tlb_flush = true;
>>
>> Flushing the nested P2M when running in guest mode isn't correct. L2 changing
>> its guest CR3 can't affect the nested page tables.
>>
>>> +        }
>>>           break;
>>>       case 4:
>>>           value = HVM_CR4_HOST_MASK;
>>> @@ -952,8 +956,7 @@ static void noreturn cf_check svm_do_resume(void)
>>>           v->arch.hvm.svm.launch_core = smp_processor_id();
>>>           hvm_migrate_timers(v);
>>>           hvm_migrate_pirqs(v);
>>> -        /* Migrating to another ASID domain.  Request a new ASID. */
>>> -        hvm_asid_flush_vcpu(v);
>>> +        v->arch.needs_tlb_flush = true;
>>
>> Isn't this flush when moving to a different pCPU already handled by the context
>> switch logic in the previous patch?
>>
> 
> yes
> 
>>>       }
>>>       if ( !vcpu_guestmode && !vlapic_hw_disabled(vlapic) )
>>> @@ -980,13 +983,14 @@ void asmlinkage svm_vmenter_helper(void)
>>>       ASSERT(hvmemul_cache_disabled(curr));
>>> -    svm_asid_handle_vmrun();
>>> -
>>>       TRACE_TIME(TRC_HVM_VMENTRY |
>>>                  (nestedhvm_vcpu_in_guestmode(curr) ? TRC_HVM_NESTEDFLAG : 0));
>>>       svm_sync_vmcb(curr, vmcb_needs_vmsave);
>>> +    if ( test_and_clear_bool(curr->arch.needs_tlb_flush) )
>>> +        svm_vcpu_set_tlb_control(curr);
>>> +
>>>       vmcb->rax = regs->rax;
>>>       vmcb->rip = regs->rip;
>>>       vmcb->rsp = regs->rsp;
>>> @@ -1107,6 +1111,8 @@ static int cf_check svm_vcpu_initialise(struct vcpu *v)
>>>           return rc;
>>>       }
>>> +    svm_vcpu_assign_asid(v);
>>> +
>>>       return 0;
>>>   }
>>> @@ -1532,9 +1538,6 @@ static int _svm_cpu_up(bool bsp)
>>>       /* check for erratum 383 */
>>>       svm_init_erratum_383(c);
>>> -    /* Initialize core's ASID handling. */
>>> -    svm_asid_init(c);
>>> -
>>>       /* Initialize OSVW bits to be used by guests */
>>>       svm_host_osvw_init();
>>> @@ -2289,7 +2292,7 @@ static void svm_invlpga_intercept(
>>>   {
>>>       svm_invlpga(linear,
>>>                   (asid == 0)
>>> -                ? v->arch.hvm.n1asid.asid
>>> +                ? v->domain->arch.hvm.asid.asid
>>>                   : vcpu_nestedhvm(v).nv_n2asid.asid);
>>
>> If we only ever use the L1 domain's ASID, INVLPGA on any other ASID is surely
>> not correct - it could belong to some other L1 VM. The existing code is also
>> incorrect - L1 invalidating using an ASID other than the last ASID it used
>> would not do the correct thing AFAICT.
>>
> 
> I think it's going to be a bit more complicated, at least in the nested NPT case where we also need to reset shadow SLAT.
> 
> With NPT, the TLB maps a GVA into a SPA built from gCR3+nCR3, with this instruction flushing a specific GVA mapping. "In principle", a VMM is allowed to use this to flush a GVA after a (nested) SLAT modification was made.
> 
> In our case, that means that we also need to invalidate the shadow SLAT, to handle cases where the guest expect SLAT changes to reflect in the new TLB entry.
> 
> But we can still use INVLPGA on the host, as the other existing mappings of the ASID aren't suddendly made invalid even if the shadow SLAT doesn't exist anymore (a simpler alternative is to completely flush the TLB, so we don't have out of sync shadow SLAT and ASID).

I spoke with Andrew about this previously. INVLPGA takes a guest virtual
address, therefore there is no sensible way that the L1 VMM can use this
instruction to invalidate mappings in the TLB after modifying the NPT(1-2) and
so we don't need to worry about invalidating this.

INVLPGA is only to be used with shadow page tables in which case there is no
NPT(0-2) to invalidate. As per the APM:

"The input address is always interpreted as a guest virtual address, so INVLPGA
is typically meaningful only when used with shadow page tables; it does not
provide a means to invalidate a nested translation by guest physical address."

> 
>>>   }
>>> @@ -2311,8 +2314,8 @@ static bool cf_check is_invlpg(
>>>   static void cf_check svm_invlpg(struct vcpu *v, unsigned long linear)
>>>   {
>>> -    /* Safe fallback. Take a new ASID. */
>>> -    hvm_asid_flush_vcpu(v);
>>> +    /* Schedule a tlb flush on the VCPU. */
>>> +    v->arch.needs_tlb_flush = true;
>>>   }
>>>   static bool cf_check svm_get_pending_event(
>>> @@ -2482,6 +2485,8 @@ const struct hvm_function_table * __init start_svm(void)
>>>       svm_function_table.caps.hap_superpage_2mb = true;
>>>       svm_function_table.caps.hap_superpage_1gb = cpu_has_page1gb;
>>> +    svm_asid_init();
>>> +
>>>       return &svm_function_table;
>>>   }
>>> @@ -2539,6 +2544,8 @@ void asmlinkage svm_vmexit_handler(void)
>>>                      (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0x0F));
>>>       }
>>> +    svm_vcpu_clear_tlb_control(v);
>>> +
>>
>> Is there a reason to split updating tlb_control into a clear and then later a
>> potential set? This way there are either 1 or 2 writes to it whereas if you
>> unconditionally set it before VMRUN there would only ever be 1 write.
>>
> 
> Yes, I was also thinking about merging svm_vcpu_clear_tlb_control() into svm_vcpu_set_tlb_control() by adding a boolean parameter.
> 
>>>       exit_reason = vmcb->exitcode;
>>>       if ( hvm_long_mode_active(v) )
>>> diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
>>> index cfa411ad5a..901354e914 100644
>>> --- a/xen/arch/x86/hvm/svm/svm.h
>>> +++ b/xen/arch/x86/hvm/svm/svm.h
>>> @@ -12,12 +12,8 @@
>>>   #include <xen/types.h>
>>>   struct cpu_user_regs;
>>> -struct cpuinfo_x86;
>>>   struct vcpu;
>>> -void svm_asid_init(const struct cpuinfo_x86 *c);
>>> -void svm_asid_handle_vmrun(void);
>>> -
>>>   unsigned long *svm_msrbit(unsigned long *msr_bitmap, uint32_t msr);
>>>   void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
>>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
>>> index 8e52ef4d49..3916ae4468 100644
>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>> @@ -20,6 +20,7 @@
>>>   #include <asm/current.h>
>>>   #include <asm/flushtlb.h>
>>>   #include <asm/hvm/hvm.h>
>>> +#include <asm/hvm/asid.h>
>>>   #include <asm/hvm/io.h>
>>>   #include <asm/hvm/nestedhvm.h>
>>>   #include <asm/hvm/vmx/vmcs.h>
>>> @@ -778,8 +779,6 @@ static int _vmx_cpu_up(bool bsp)
>>>       this_cpu(vmxon) = 1;
>>> -    hvm_asid_init(cpu_has_vmx_vpid ? (1u << VMCS_VPID_WIDTH) : 0);
>>> -
>>>       if ( cpu_has_vmx_ept )
>>>           ept_sync_all();
>>> @@ -1903,7 +1902,7 @@ void cf_check vmx_do_resume(void)
>>>            */
>>>           v->arch.hvm.vmx.hostenv_migrated = 1;
>>> -        hvm_asid_flush_vcpu(v);
>>> +        v->arch.needs_tlb_flush = true;
>>>       }
>>>       debug_state = v->domain->debugger_attached
>>> @@ -2116,7 +2115,6 @@ void vmcs_dump_vcpu(struct vcpu *v)
>>>            (SECONDARY_EXEC_ENABLE_VPID | SECONDARY_EXEC_ENABLE_VM_FUNCTIONS) )
>>>           printk("Virtual processor ID = 0x%04x VMfunc controls = %016lx\n",
>>>                  vmr16(VIRTUAL_PROCESSOR_ID), vmr(VM_FUNCTION_CONTROL));
>>> -
>>>       vmx_vmcs_exit(v);
>>>   }
>>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>>> index 269ca56433..a531145218 100644
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -25,6 +25,7 @@
>>>   #include <asm/fsgsbase.h>
>>>   #include <asm/gdbsx.h>
>>>   #include <asm/guest-msr.h>
>>> +#include <asm/hvm/asid.h>
>>>   #include <asm/hvm/emulate.h>
>>>   #include <asm/hvm/hvm.h>
>>>   #include <asm/hvm/monitor.h>
>>> @@ -834,6 +835,18 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
>>>           vmx_update_secondary_exec_control(v);
>>>       }
>>> +    if ( asid_enabled )
>>> +    {
>>> +        v->arch.hvm.vmx.secondary_exec_control |= SECONDARY_EXEC_ENABLE_VPID;
>>> +        vmx_update_secondary_exec_control(v);
>>> +    }
>>> +    else
>>> +    {
>>> +        v->arch.hvm.vmx.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VPID;
>>> +        vmx_update_secondary_exec_control(v);
>>> +    }
>>> +
>>> +
>>>       /*
>>>        * We can safely pass MSR_SPEC_CTRL through to the guest, even if STIBP
>>>        * isn't enumerated in hardware, as SPEC_CTRL_STIBP is ignored.
>>> @@ -1510,7 +1523,7 @@ static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
>>>               vmx_set_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
>>>               wbinvd();               /* flush possibly polluted cache */
>>> -            hvm_asid_flush_vcpu(v); /* invalidate memory type cached in TLB */
>>> +            v->arch.needs_tlb_flush = true; /* invalidate memory type cached in TLB */
>>>               v->arch.hvm.vmx.cache_mode = CACHE_MODE_NO_FILL;
>>>           }
>>>           else
>>> @@ -1519,7 +1532,7 @@ static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
>>>               vmx_set_guest_pat(v, *pat);
>>>               if ( !is_iommu_enabled(v->domain) || iommu_snoop )
>>>                   vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
>>> -            hvm_asid_flush_vcpu(v); /* no need to flush cache */
>>> +            v->arch.needs_tlb_flush = true;
>>>           }
>>>       }
>>>   }
>>> @@ -1871,7 +1884,7 @@ static void cf_check vmx_update_guest_cr(
>>>           __vmwrite(GUEST_CR3, v->arch.hvm.hw_cr[3]);
>>>           if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
>>> -            hvm_asid_flush_vcpu(v);
>>> +            v->arch.needs_tlb_flush = true;
>>>           break;
>>>       default:
>>> @@ -3168,6 +3181,8 @@ const struct hvm_function_table * __init start_vmx(void)
>>>       lbr_tsx_fixup_check();
>>>       ler_to_fixup_check();
>>> +    BUG_ON(hvm_asid_init(cpu_has_vmx_vpid ? (1u << VMCS_VPID_WIDTH) : 1));
>>> +
>>>       return &vmx_function_table;
>>>   }
>>> @@ -4931,9 +4946,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
>>>   {
>>>       struct vcpu *curr = current;
>>>       struct domain *currd = curr->domain;
>>> -    u32 new_asid, old_asid;
>>> -    struct hvm_vcpu_asid *p_asid;
>>> -    bool need_flush;
>>> +    struct hvm_asid *p_asid;
>>>       ASSERT(hvmemul_cache_disabled(curr));
>>> @@ -4949,33 +4962,9 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
>>>       if ( nestedhvm_vcpu_in_guestmode(curr) )
>>>           p_asid = &vcpu_nestedhvm(curr).nv_n2asid;
>>>       else
>>> -        p_asid = &curr->arch.hvm.n1asid;
>>> -
>>> -    old_asid = p_asid->asid;
>>> -    need_flush = hvm_asid_handle_vmenter(p_asid);
>>> -    new_asid = p_asid->asid;
>>> -
>>> -    if ( unlikely(new_asid != old_asid) )
>>> -    {
>>> -        __vmwrite(VIRTUAL_PROCESSOR_ID, new_asid);
>>> -        if ( !old_asid && new_asid )
>>> -        {
>>> -            /* VPID was disabled: now enabled. */
>>> -            curr->arch.hvm.vmx.secondary_exec_control |=
>>> -                SECONDARY_EXEC_ENABLE_VPID;
>>> -            vmx_update_secondary_exec_control(curr);
>>> -        }
>>> -        else if ( old_asid && !new_asid )
>>> -        {
>>> -            /* VPID was enabled: now disabled. */
>>> -            curr->arch.hvm.vmx.secondary_exec_control &=
>>> -                ~SECONDARY_EXEC_ENABLE_VPID;
>>> -            vmx_update_secondary_exec_control(curr);
>>> -        }
>>> -    }
>>> +        p_asid = &currd->arch.hvm.asid;
>>> -    if ( unlikely(need_flush) )
>>> -        vpid_sync_all();
>>> +    __vmwrite(VIRTUAL_PROCESSOR_ID, p_asid->asid);
>>>       if ( paging_mode_hap(curr->domain) )
>>>       {
>>> @@ -4984,12 +4973,18 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
>>>           unsigned int inv = 0; /* None => Single => All */
>>>           struct ept_data *single = NULL; /* Single eptp, iff inv == 1 */
>>> +        if ( test_and_clear_bool(curr->arch.needs_tlb_flush)  )
>>> +        {
>>> +            inv = 1;
>>> +            single = ept;
>>> +        }
>>> +
>>>           if ( cpumask_test_cpu(cpu, ept->invalidate) )
>>>           {
>>>               cpumask_clear_cpu(cpu, ept->invalidate);
>>>               /* Automatically invalidate all contexts if nested. */
>>> -            inv += 1 + nestedhvm_enabled(currd);
>>> +            inv = 1 + nestedhvm_enabled(currd);
>>>               single = ept;
>>>           }
>>> @@ -5018,6 +5013,11 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
>>>               __invept(inv == 1 ? INVEPT_SINGLE_CONTEXT : INVEPT_ALL_CONTEXT,
>>>                        inv == 1 ? single->eptp          : 0);
>>>       }
>>> +    else /* Shadow paging */
>>> +    {
>>> +        if ( test_and_clear_bool(curr->arch.needs_tlb_flush) )
>>> +            vpid_sync_vcpu_context(curr);
>>> +    }
>>>    out:
>>>       if ( unlikely(curr->arch.hvm.vmx.lbr_flags & LBR_FIXUP_MASK) )
>>> diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
>>> index e4cdfe55c1..5c0e1226c4 100644
>>> --- a/xen/arch/x86/hvm/vmx/vvmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
>>> @@ -1253,7 +1253,7 @@ static void virtual_vmentry(struct cpu_user_regs *regs)
>>>           if ( nvmx->guest_vpid != new_vpid )
>>>           {
>>> -            hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
>>> +            v->arch.needs_tlb_flush = true;
>>>               nvmx->guest_vpid = new_vpid;
>>>           }
>>>       }
>>> @@ -2052,7 +2052,7 @@ static int nvmx_handle_invvpid(struct cpu_user_regs *regs)
>>>       case INVVPID_INDIVIDUAL_ADDR:
>>>       case INVVPID_SINGLE_CONTEXT:
>>>       case INVVPID_ALL_CONTEXT:
>>> -        hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(current).nv_n2asid);
>>> +        hvm_flush_tlb(NULL);
>>>           break;
>>>       default:
>>>           vmfail(regs, VMX_INSN_INVEPT_INVVPID_INVALID_OP);
>>> diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/ include/asm/flushtlb.h
>>> index 345677eb72..081e5a1188 100644
>>> --- a/xen/arch/x86/include/asm/flushtlb.h
>>> +++ b/xen/arch/x86/include/asm/flushtlb.h
>>> @@ -125,12 +125,6 @@ void switch_cr3_cr4(struct vcpu *v, unsigned long cr3, unsigned long cr4);
>>>   #define FLUSH_VCPU_STATE 0x1000
>>>    /* Flush the per-cpu root page table */
>>>   #define FLUSH_ROOT_PGTBL 0x2000
>>> -#if CONFIG_HVM
>>> - /* Flush all HVM guests linear TLB (using ASID/VPID) */
>>> -#define FLUSH_HVM_ASID_CORE 0x4000
>>> -#else
>>> -#define FLUSH_HVM_ASID_CORE 0
>>> -#endif
>>>   #if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
>>>   /*
>>>    * Adding this to the flags passed to flush_area_mask will prevent using the
>>> @@ -190,7 +184,6 @@ void flush_area_mask(const cpumask_t *mask, const void *va,
>>>   static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache) {}
>>> -unsigned int guest_flush_tlb_flags(const struct domain *d);
>>>   void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);
>>>   #endif /* __FLUSHTLB_H__ */
>>> diff --git a/xen/arch/x86/include/asm/hvm/asid.h b/xen/arch/x86/ include/asm/hvm/asid.h
>>> index 25ba57e768..b6df5cda35 100644
>>> --- a/xen/arch/x86/include/asm/hvm/asid.h
>>> +++ b/xen/arch/x86/include/asm/hvm/asid.h
>>> @@ -8,25 +8,25 @@
>>>   #ifndef __ASM_X86_HVM_ASID_H__
>>>   #define __ASM_X86_HVM_ASID_H__
>>> +#include <xen/stdbool.h>
>>> +#include <xen/stdint.h>
>>> -struct vcpu;
>>> -struct hvm_vcpu_asid;
>>> +struct hvm_asid {
>>> +  uint32_t asid;
>>> +};
>>> -/* Initialise ASID management for the current physical CPU. */
>>> -void hvm_asid_init(unsigned int nasids);
>>> +#ifdef CONFIG_HVM
>>> +extern bool asid_enabled;
>>> +#else
>>> +#define asid_enabled (false)
>>> +#endif
>>> -/* Invalidate a particular ASID allocation: forces re-allocation. */
>>> -void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid);
>>> +/* Initialise ASID management distributed across all CPUs. */
>>> +int hvm_asid_init(unsigned long nasids);
>>> -/* Invalidate all ASID allocations for specified VCPU: forces re- allocation. */
>>> -void hvm_asid_flush_vcpu(struct vcpu *v);
>>> -
>>> -/* Flush all ASIDs on this processor core. */
>>> -void hvm_asid_flush_core(void);
>>> -
>>> -/* Called before entry to guest context. Checks ASID allocation, returns a
>>> - * boolean indicating whether all ASIDs must be flushed. */
>>> -bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid);
>>> +int hvm_asid_alloc(struct hvm_asid *asid);
>>> +int hvm_asid_alloc_range(struct hvm_asid *asid, unsigned long min, unsigned long max);
>>> +void hvm_asid_free(struct hvm_asid *asid);
>>>   #endif /* __ASM_X86_HVM_ASID_H__ */
>>> diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/ include/asm/hvm/domain.h
>>> index dd7fa96aad..194343d9bf 100644
>>> --- a/xen/arch/x86/include/asm/hvm/domain.h
>>> +++ b/xen/arch/x86/include/asm/hvm/domain.h
>>> @@ -140,6 +140,7 @@ struct hvm_domain {
>>>       } write_map;
>>>       struct hvm_pi_ops pi_ops;
>>> +    struct hvm_asid asid;
>>>       union {
>>>           struct vmx_domain vmx;
>>> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/ include/asm/hvm/hvm.h
>>> index e7c1364802..935d9e7548 100644
>>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>>> @@ -274,6 +274,8 @@ int hvm_domain_initialise(struct domain *d,
>>>   void hvm_domain_relinquish_resources(struct domain *d);
>>>   void hvm_domain_destroy(struct domain *d);
>>> +int hvm_flush_tlb(const unsigned long *vcpu_bitmap);
>>> +
>>>   int hvm_vcpu_initialise(struct vcpu *v);
>>>   void hvm_vcpu_destroy(struct vcpu *v);
>>>   void hvm_vcpu_down(struct vcpu *v);
>>> @@ -497,17 +499,6 @@ static inline void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset)
>>>       alternative_vcall(hvm_funcs.set_tsc_offset, v, offset);
>>>   }
>>> -/*
>>> - * Called to ensure than all guest-specific mappings in a tagged TLB are
>>> - * flushed; does *not* flush Xen's TLB entries, and on processors without a
>>> - * tagged TLB it will be a noop.
>>> - */
>>> -static inline void hvm_flush_guest_tlbs(void)
>>> -{
>>> -    if ( hvm_enabled )
>>> -        hvm_asid_flush_core();
>>> -}
>>> -
>>>   static inline unsigned int
>>>   hvm_get_cpl(struct vcpu *v)
>>>   {
>>> @@ -901,8 +892,6 @@ static inline int hvm_cpu_up(void)
>>>   static inline void hvm_cpu_down(void) {}
>>> -static inline void hvm_flush_guest_tlbs(void) {}
>>> -
>>>   static inline void hvm_invlpg(const struct vcpu *v, unsigned long linear)
>>>   {
>>>       ASSERT_UNREACHABLE();
>>> diff --git a/xen/arch/x86/include/asm/hvm/svm.h b/xen/arch/x86/ include/asm/hvm/svm.h
>>> index a35a61273b..1877bb149a 100644
>>> --- a/xen/arch/x86/include/asm/hvm/svm.h
>>> +++ b/xen/arch/x86/include/asm/hvm/svm.h
>>> @@ -9,6 +9,11 @@
>>>   #ifndef __ASM_X86_HVM_SVM_H__
>>>   #define __ASM_X86_HVM_SVM_H__
>>> +void svm_asid_init(void);
>>> +void svm_vcpu_assign_asid(struct vcpu *v);
>>> +void svm_vcpu_set_tlb_control(struct vcpu *v);
>>> +void svm_vcpu_clear_tlb_control(struct vcpu *v);
>>> +
>>>   /*
>>>    * PV context switch helpers.  Prefetching the VMCB area itself has been shown
>>>    * to be useful for performance.
>>> diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/ include/asm/hvm/vcpu.h
>>> index 2a14fa0a63..8ad2ab2910 100644
>>> --- a/xen/arch/x86/include/asm/hvm/vcpu.h
>>> +++ b/xen/arch/x86/include/asm/hvm/vcpu.h
>>> @@ -9,6 +9,7 @@
>>>   #define __ASM_X86_HVM_VCPU_H__
>>>   #include <xen/tasklet.h>
>>> +#include <asm/hvm/asid.h>
>>>   #include <asm/hvm/vlapic.h>
>>>   #include <asm/hvm/vmx/vmcs.h>
>>>   #include <asm/hvm/vmx/vvmx.h>
>>> @@ -16,11 +17,6 @@
>>>   #include <asm/mtrr.h>
>>>   #include <public/hvm/ioreq.h>
>>> -struct hvm_vcpu_asid {
>>> -    uint64_t generation;
>>> -    uint32_t asid;
>>> -};
>>> -
>>>   struct hvm_vcpu_io {
>>>       /*
>>>        * HVM emulation:
>>> @@ -76,7 +72,7 @@ struct nestedvcpu {
>>>       bool stale_np2m; /* True when p2m_base in VMCx02 is no longer valid */
>>>       uint64_t np2m_generation;
>>> -    struct hvm_vcpu_asid nv_n2asid;
>>> +    struct hvm_asid nv_n2asid;
>>
>> For SVM, after the change to svm_asid_handle_vmrun AFAICT nothing sets this
>> other than nestedhvm_vcpu_reset.
>>
>>>       bool nv_vmentry_pending;
>>>       bool nv_vmexit_pending;
>>> @@ -140,8 +136,6 @@ struct hvm_vcpu {
>>>       /* (MFN) hypervisor page table */
>>>       pagetable_t         monitor_table;
>>> -    struct hvm_vcpu_asid n1asid;
>>> -
>>>       u64                 msr_tsc_adjust;
>>>       union {
>>> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/ include/asm/hvm/vmx/vmx.h
>>> index 08854c36ca..e0d4389f20 100644
>>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>>> @@ -463,7 +463,7 @@ static inline void vpid_sync_vcpu_context(const struct vcpu *v)
>>>       if ( unlikely(!cpu_has_vmx_vpid_invvpid_single_context) )
>>>           type = INVVPID_ALL_CONTEXT;
>>> -    __invvpid(type, v->arch.hvm.n1asid.asid, 0);
>>> +    __invvpid(type, v->domain->arch.hvm.asid.asid, 0);
>>>   }
>>>   static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
>>> @@ -484,7 +484,7 @@ static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
>>>       if ( unlikely(!cpu_has_vmx_vpid_invvpid_single_context) )
>>>           type = INVVPID_ALL_CONTEXT;
>>> -    __invvpid(type, v->arch.hvm.n1asid.asid, (u64)gva);
>>> +    __invvpid(type, v->domain->arch.hvm.asid.asid, (u64)gva);
>>>   }
>>>   static inline void vpid_sync_all(void)
>>> diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
>>> index 5ccb80bda5..156734d3e0 100644
>>> --- a/xen/arch/x86/mm/hap/hap.c
>>> +++ b/xen/arch/x86/mm/hap/hap.c
>>> @@ -27,6 +27,7 @@
>>>   #include <asm/p2m.h>
>>>   #include <asm/domain.h>
>>>   #include <xen/numa.h>
>>> +#include <asm/hvm/asid.h>
>>>   #include <asm/hvm/nestedhvm.h>
>>>   #include <public/sched.h>
>>> @@ -750,18 +751,16 @@ static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap)
>>>           if ( !flush_vcpu(v, vcpu_bitmap) )
>>>               continue;
>>> -        hvm_asid_flush_vcpu(v);
>>> -
>>>           cpu = read_atomic(&v->dirty_cpu);
>>>           if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) && v- >is_running )
>>>               __cpumask_set_cpu(cpu, mask);
>>>       }
>>> +    guest_flush_tlb_mask(d, mask);
>>> +
>>>       /*
>>>        * Trigger a vmexit on all pCPUs with dirty vCPU state in order to force an
>>> -     * ASID/VPID change and hence accomplish a guest TLB flush. Note that vCPUs
>>> -     * not currently running will already be flushed when scheduled because of
>>> -     * the ASID tickle done in the loop above.
>>> +     * ASID/VPID flush and hence accomplish a guest TLB flush.
>>>        */
>>>       on_selected_cpus(mask, NULL, NULL, 0);
>>> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
>>> index 027b9ae69b..9879b4840b 100644
>>> --- a/xen/arch/x86/mm/p2m.c
>>> +++ b/xen/arch/x86/mm/p2m.c
>>> @@ -1440,7 +1440,7 @@ p2m_flush(struct vcpu *v, struct p2m_domain *p2m)
>>>       ASSERT(v->domain == p2m->domain);
>>>       vcpu_nestedhvm(v).nv_p2m = NULL;
>>>       p2m_flush_table(p2m);
>>> -    hvm_asid_flush_vcpu(v);
>>> +    v->arch.needs_tlb_flush = true;
>>>   }
>>>   void
>>> @@ -1499,7 +1499,7 @@ static void assign_np2m(struct vcpu *v, struct p2m_domain *p2m)
>>>   static void nvcpu_flush(struct vcpu *v)
>>>   {
>>> -    hvm_asid_flush_vcpu(v);
>>> +    v->arch.needs_tlb_flush = true;
>>>       vcpu_nestedhvm(v).stale_np2m = true;
>>>   }
>>> @@ -1619,7 +1619,7 @@ void np2m_schedule(int dir)
>>>               if ( !np2m_valid )
>>>               {
>>>                   /* This vCPU's np2m was flushed while it was not runnable */
>>> -                hvm_asid_flush_core();
>>> +                curr->arch.needs_tlb_flush = true;
>>>                   vcpu_nestedhvm(curr).nv_p2m = NULL;
>>>               }
>>>               else
>>> diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
>>> index 14ab7defd8..06053d9a06 100644
>>> --- a/xen/arch/x86/mm/paging.c
>>> +++ b/xen/arch/x86/mm/paging.c
>>> @@ -938,7 +938,7 @@ void paging_update_nestedmode(struct vcpu *v)
>>>       else
>>>           /* TODO: shadow-on-shadow */
>>>           v->arch.paging.nestedmode = NULL;
>>> -    hvm_asid_flush_vcpu(v);
>>> +    v->arch.needs_tlb_flush = true;
>>
>> This unconditional flush is done on every L2 exit to L0. That shouldn't be
>> necessary, but that's not specifically a problem with this patch.
>>
> 
> 
> 
>>>   }
>>>   int __init paging_set_allocation(struct domain *d, unsigned int pages,
>>> diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/ multi.c
>>> index 1b0477ed2b..107d0829f2 100644
>>> --- a/xen/arch/x86/mm/shadow/multi.c
>>> +++ b/xen/arch/x86/mm/shadow/multi.c
>>> @@ -81,12 +81,6 @@ const char *const fetch_type_names[] = {
>>>   static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool noflush);
>>> -/* Helper to perform a local TLB flush. */
>>> -static void sh_flush_local(const struct domain *d)
>>> -{
>>> -    flush_local(guest_flush_tlb_flags(d));
>>> -}
>>> -
>>>   #if GUEST_PAGING_LEVELS >= 4 && defined(CONFIG_PV32)
>>>   #define ASSERT_VALID_L2(t) \
>>>       ASSERT((t) == SH_type_l2_shadow || (t) == SH_type_l2h_shadow)
>>> @@ -2945,7 +2939,8 @@ static bool cf_check sh_invlpg(struct vcpu *v, unsigned long linear)
>>>       if ( mfn_to_page(sl1mfn)->u.sh.type
>>>            == SH_type_fl1_shadow )
>>>       {
>>> -        sh_flush_local(v->domain);
>>> +        flush_tlb_local();
>>> +        v->arch.needs_tlb_flush = true;
>>>           return false;
>>>       }
>>> @@ -3160,7 +3155,8 @@ sh_update_linear_entries(struct vcpu *v)
>>>        * linear pagetable to read a top-level shadow page table entry. But,
>>>        * without this change, it would fetch the wrong value due to a stale TLB.
>>>        */
>>> -    sh_flush_local(d);
>>> +    flush_tlb_local();
>>> +    v->arch.needs_tlb_flush = true;
>>>   }
>>>   static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool noflush)
>>
>> Booting Hyper-V on my AMD test machine with our internal nested virt branch +
>> this patch series fails:
>>
>> (XEN) [   88.003415] Assertion 'local_irq_is_enabled()' failed at common/smp.c:53
>> (XEN) [   88.003419] ----[ Xen-4.23.0  x86_64  debug=y  Not tainted ]----
>> (XEN) [   88.003421] CPU:    11
>> (XEN) [   88.003422] RIP:    e008:[<ffff82d04023b580>] on_selected_cpus+0x9a/0xd4
>> (XEN) [   88.003428] RFLAGS: 0000000000010046   CONTEXT: hypervisor (d1v0)
>> (XEN) [   88.003431] rax: 0000000000000046   rbx: 0000000000000000 rcx: 0000000000000000
>> (XEN) [   88.003433] rdx: 0000000000000000   rsi: 0000000000000000 rdi: ffff8310510ddaf0
>> (XEN) [   88.003435] rbp: ffff8310510d7cd8   rsp: ffff8310510d7cb0 r8:  ffff8310510ddaf0
>> (XEN) [   88.003436] r9:  ffff8310510eae70   r10: ffff8310510d8230 r11: ffff8310510d7f08
>> (XEN) [   88.003438] r12: ffff8310510ddaf0   r13: 000000000000000b r14: ffff83107c52d000
>> (XEN) [   88.003440] r15: ffff83107c52d000   cr0: 0000000080050033 cr4: 0000000000f506e0
>> (XEN) [   88.003441] cr3: 000000107c51c000   cr2: 0000000000000000
>> (XEN) [   88.003443] fsb: 0000000000000000   gsb: fffff87bd9e3b000 gss: 0000000000000000
>> (XEN) [   88.003445] ds: 0000   es: 0000   fs: 0000   gs: 0020   ss: 0000   cs: e008
>> (XEN) [   88.003447] Xen code around <ffff82d04023b580> (on_selected_cpus+0x9a/0xd4):
>> (XEN) [   88.003448]  41 5f 5d e9 60 6a fc ff <d6> d6 4c 89 35 f7 9e a0 00 4c 89 3d f8 9e a0 00
>> (XEN) [   88.003455] Xen stack trace from rsp=ffff8310510d7cb0:
>> (XEN) [   88.003457]    ffff82d04031fac2 ffff83100c11d000 ffff82d040c45498 0000000000000001
>> (XEN) [   88.003459]    ffff82d040313e5e ffff8310510d7ce8 ffff82d04031fb33 ffff8310510d7cf8
>> (XEN) [   88.003462]    ffff82d0403098d2 ffff8310510d7d10 ffff82d040313e94 000000000000000b
>> (XEN) [   88.003464]    ffff8310510d7d28 ffff82d04023b6b1 ffff82d040c45498 ffff8310510d7d40
>> (XEN) [   88.003467]    ffff82d04037ab68 ffff8310140aefb0 ffff8310510d7d78 ffff82d04023b59f
>> (XEN) [   88.003469]    ffff83107c52c2f0 ffff83107c52d538 ffff83107c52d000 0000000000004d01
>> (XEN) [   88.003472]    ffff83107c52d000 ffff8310510d7d90 ffff82d040313fce ffff83107c52c2f0
>> (XEN) [   88.003474]    ffff8310510d7db8 ffff82d040330164 ffff83107c52c2f0 ffff83107c52d538
>> (XEN) [   88.003477]    ffff8310510d7fff ffff8310510d7dd8 ffff82d040330259 ffff83107c52d4e8
>> (XEN) [   88.003479]    ffff83107c52d538 ffff8310510d7e00 ffff82d0403305bc ffff83100c11d000
>> (XEN) [   88.003482]    0000000000004d01 0000000000004901 ffff8310510d7e38 ffff82d04030b25f
>> (XEN) [   88.003484]    00000000c0000080 0000000000000001 00000000c0000080 0000000000000001
>> (XEN) [   88.003487]    ffff83100c11d000 ffff8310510d7e80 ffff82d04030b580 0000000000000000
>> (XEN) [   88.003489]    0000000000000000 ffff8310510d7f08 ffff83100c119000 ffff83100c11d000
>> (XEN) [   88.003492]    0000000000000002 0000000000000000 ffff8310510d7ef8 ffff82d0402e71db
>> (XEN) [   88.003494]    ffff82d0402024f2 ffff82d0402024f8 ffff82d0402024f2 ffff82d0402024f8
>> (XEN) [   88.003497]    ffff82d0402024f2 ffff82d0402024f8 ffff82d0402024f2 ffff82d0402024f8
>> (XEN) [   88.003499]    ffff83100c11d000 0000000000000000 0000000000000000 0000000000000000
>> (XEN) [   88.003502]    0000000000000000 00007cefaef280d7 ffff82d040202542 0000000000000000
>> (XEN) [   88.003504]    fffff87bd9e00000 0000000000000000 0000000000000400 ffffe70000005a40
>> (XEN) [   88.003507] Xen call trace:
>> (XEN) [   88.003508]    [<ffff82d04023b580>] R on_selected_cpus+0x9a/0xd4
>> (XEN) [   88.003512]    [<ffff82d04031fac2>] S arch/x86/mm/hap/ hap.c#__flush_tlb+0x84/0xd4
>> (XEN) [   88.003514]    [<ffff82d04031fb33>] F arch/x86/mm/hap/ hap.c#flush_tlb+0x21/0x27
>> (XEN) [   88.003518]    [<ffff82d0403098d2>] F hvm_flush_tlb+0x21/0x2a
>> (XEN) [   88.003520]    [<ffff82d040313e94>] F arch/x86/hvm/ nestedhvm.c#nestedhvm_flushtlb_ipi+0x36/0x51
>> (XEN) [   88.003522]    [<ffff82d04023b6b1>] F smp_call_function_interrupt+0x63/0xd2
>> (XEN) [   88.003525]    [<ffff82d04037ab68>] F smp_send_call_function_mask+0x3c/0x3f
>> (XEN) [   88.003527]    [<ffff82d04023b59f>] F on_selected_cpus+0xb9/0xd4
>> (XEN) [   88.003529]    [<ffff82d040313fce>] F nestedhvm_vmcx_flushtlb+0x21/0x4b
>> (XEN) [   88.003532]    [<ffff82d040330164>] F p2m_flush_table_locked+0xb8/0x167
>> (XEN) [   88.003534]    [<ffff82d040330259>] F arch/x86/mm/ p2m.c#p2m_flush_table+0x46/0x330
>> (XEN) [   88.003537]    [<ffff82d0403305bc>] F p2m_flush_nestedp2m+0x42/0x4f
>> (XEN) [   88.003540]    [<ffff82d04030b25f>] F hvm_set_efer+0x15a/0x167
>> (XEN) [   88.003543]    [<ffff82d04030b580>] F hvm_msr_write_intercept+0x314/0x3f8
>> (XEN) [   88.003546]    [<ffff82d0402e71db>] F svm_vmexit_handler+0x12e9/0x1925
>> (XEN) [   88.003549]    [<ffff82d040202542>] F svm_asm_do_resume+0x162/0x172
>> (XEN) [   88.003550]
>> (XEN) [   88.511287]
>> (XEN) [   88.513714] ****************************************
>> (XEN) [   88.520429] Panic on CPU 11:
>> (XEN) [   88.524600] Assertion 'local_irq_is_enabled()' failed at common/smp.c:53
>> (XEN) [   88.533449] ****************************************
>>
> 
> I didn't made testing around nested virt, I guess I need to investigate more on this case.
> 

The rough patch below fixes the Nested Virt issues.

The overall change makes it similar to how KVM Nested SVM works currently - L1
and L2 share the same ASID and the TLB is flushed on every L1/L2 transition.

This is not ideal from a performance perspective. However, AFAICT the
performance of KVM Nested SVM is acceptable in spite of this. Perhaps this will
do for now, then if we need to do something more complicated like vASIDs later,
we can?

Ross

----- >-8 -------------------

diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index 61e866b771a2..ef29521f3695 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -37,7 +37,7 @@ nestedhvm_vcpu_reset(struct vcpu *v)
      hvm_unmap_guest_frame(nv->nv_vvmcx, 1);
      nv->nv_vvmcx = NULL;
      nv->nv_vvmcxaddr = INVALID_PADDR;
-    nv->nv_flushp2m = true;
+    nv->nv_flushp2m = 0;
      nv->nv_p2m = NULL;
      nv->stale_np2m = false;
      nv->np2m_generation = 0;
@@ -85,7 +85,7 @@ static void cf_check nestedhvm_flushtlb_ipi(void *info)
       * This is cheaper than flush_tlb_local() and has
       * the same desired effect.
       */
-    WARN_ON(hvm_flush_tlb(NULL));
+    v->arch.needs_tlb_flush = true;
      vcpu_nestedhvm(v).nv_p2m = NULL;
      vcpu_nestedhvm(v).stale_np2m = true;
  }
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index f42a249b1341..e6100db76eba 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -199,6 +199,9 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
      ASSERT(n1vmcb != NULL);
      ASSERT(n2vmcb != NULL);
  
+    /* Unconditional flush during L2->L1 */
+    v->arch.needs_tlb_flush = true;
+
      /*
       * nsvm_vmcb_prepare4vmexit() already saved register values
       * handled by VMSAVE/VMLOAD into n1vmcb directly.
@@ -437,7 +440,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
      if ( rc )
          return rc;
  
-    /* ASID - Emulation handled in hvm_asid_handle_vmenter() */
+    n2vmcb->_asid = n1vmcb->_asid;
  
      /* TLB control */
      n2vmcb->tlb_control = ns_vmcb->tlb_control;
@@ -655,6 +658,9 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
      svm->ns_vmcb_guestcr3 = ns_vmcb->_cr3;
      svm->ns_vmcb_hostcr3 = ns_vmcb->_h_cr3;
  
+    /* Unconditional flush during L1->L2 */
+    v->arch.needs_tlb_flush = true;
+
      /* Convert explicitely to boolean. Deals with l1 guests
       * that use flush-by-asid w/o checking the cpuid bits */
      nv->nv_flushp2m = !!ns_vmcb->tlb_control;
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 3b24aea5ab22..2519a332901c 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -144,10 +144,7 @@ static void cf_check svm_update_guest_cr(
              ; /* CR3 switches during VMRUN/VMEXIT do not flush the TLB. */
          else if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
          {
-            if (nestedhvm_vcpu_in_guestmode(v))
-                vcpu_nestedhvm(v).nv_flushp2m = true;
-            else
-                v->arch.needs_tlb_flush = true;
+            v->arch.needs_tlb_flush = true;
          }
          break;
      case 4:
@@ -2294,10 +2291,7 @@ static void svm_vmexit_do_invalidate_cache(struct cpu_user_regs *regs,
  static void svm_invlpga_intercept(
      struct vcpu *v, unsigned long linear, uint32_t asid)
  {
-    svm_invlpga(linear,
-                (asid == 0)
-                ? v->domain->arch.hvm.asid.asid
-                : vcpu_nestedhvm(v).nv_n2asid.asid);
+    svm_invlpga(linear, v->domain->arch.hvm.asid.asid);
  }
  
  static void svm_invlpg_intercept(unsigned long linear)
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 4fb15ebfd3a3..b3f5caa68424 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -927,6 +927,7 @@ void paging_dump_vcpu_info(struct vcpu *v)
  #ifdef CONFIG_HVM
  void paging_update_nestedmode(struct vcpu *v)
  {
+    const struct paging_mode *orig = v->arch.paging.nestedmode;
      ASSERT(nestedhvm_enabled(v->domain));
      if (nestedhvm_paging_mode_hap(v))
          /* nested-on-nested */
@@ -934,7 +935,9 @@ void paging_update_nestedmode(struct vcpu *v)
      else
          /* TODO: shadow-on-shadow */
          v->arch.paging.nestedmode = NULL;
-    v->arch.needs_tlb_flush = true;
+
+    if ( orig != v->arch.paging.nestedmode )
+        v->arch.needs_tlb_flush = true;
  }
  
  int __init paging_set_allocation(struct domain *d, unsigned int pages,

