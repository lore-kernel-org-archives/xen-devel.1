Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962B2C79F8C
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 09:59:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412764.1643123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4F5D-0005nM-3v; Wed, 09 Sep 2026 09:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412764.1643123; Wed, 09 Sep 2026 09:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4F5D-0005nF-1B; Wed, 09 Sep 2026 09:59:11 +0000
Received: by outflank-mailman (input) for mailman id 1412764;
 Wed, 09 Sep 2026 09:59:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x4F5B-0005mx-JL
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 09:59:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4F5A-002JkT-IK
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 11:59:08 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa12de3-bab6-0a2a0a5309dd-0a2a450c99e0-20
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 11:59:08 +0200
Received: from [40.107.208.61]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa12dea-f479-0a2a450c0019-286bd03d53f5-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 11:59:08 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB8327.namprd03.prod.outlook.com (2603:10b6:806:462::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 09:59:05 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 09:59:05 +0000
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
 b=A4gYgRzikJjzRoJuz22hhmibLitXbqTzpGPlBa3KflsNgn79IjAFvvoV2kv7jumHLtwn6uw19CCaalL7NY1/gOD+SbY6plwa5PToksKUx/QCODlNbNkXEfeOP194QvzR/kHpGrMOPq7NJ6jh7HZ5jyz6Svbt4E7mkckwtaYEcHLL8BzMIld5uwrzzDNDwGqEbfchJEQCg6wwDgmKAjX56U3PaGtkB/6VIJNT0Uy8Y+eS0BTahQCJJ7gI+bnr4B1QTVhMsVZMnyoiejfT9/gmtCJae7TtJZjmtM9DlpkJsr6ZeprIKnJHJwMarsxI5ferBXNS06Ui8OuQyj1gcey4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eK1jtWcvDiMSUz2rhX485aFGD3Z2Us6Jlh6zXyxfdk=;
 b=j1hvDD4OfjviY+bi6VWJyyW4dHmDne1fZwHLY0tQnKpfoFrgJU0IHGWH8zCFufWSuU+ypI2R6a/102LfUyNVAe35buxrsFoCsKQ/Qi7mGPbJA/hWjmulOs8JobzozN/QhU8G+3JLNM1I1Y4EpYAr2SJlNUu2H+u4BsSVpKIiuiRW9KBbI3h3J9CSQQpH2DMdbe4qxxMN/UQ8eyxe8+Wua1QKtrCWTKdfNOS/LH6Ec7r1b1osJs6Hh36Asssb1TMBrjdQNG6pCsRdnx3a3sA3mpCI7SshSHOfTLr9vfUxre+7hqjjZYxfF4RejBVVuxEr4SzqGrSYNtCYGStkTC9s5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eK1jtWcvDiMSUz2rhX485aFGD3Z2Us6Jlh6zXyxfdk=;
 b=F0/+l2zaNqg5Gr3g8Xqu2btKWDqP1spBs0DcZAuRz3o9tm+CyGA/UIWTsvOvEvh3R7q9Ha5vGsuMo+cVfjAWOtXdYYOrqoYBA1UvJ0bqdIQkPFpMP5a+gZmWLYivks4dYECUs0CajiXxSo3qI5a9anc/4QmGVkg9I8ZwOX8WUiA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <343ccc16-bc42-41b4-a192-2ce446288d04@citrix.com>
Date: Wed, 9 Sep 2026 10:59:02 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4/3] x86/PCI: use pci_sbdf_t also for pci_dev_base()
To: Jan Beulich <jbeulich@suse.com>
References: <20260908215721.3346842-1-andrew.cooper3@citrix.com>
 <f2ed324f-3a52-42b1-8b26-b3ae53ab2ead@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f2ed324f-3a52-42b1-8b26-b3ae53ab2ead@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0424.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: 1665ba64-5ce1-4cbf-5e8f-08df0e58fbd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|56012099006|18002099003|4143699003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	LsKmXaPNYtAD6glHqx7fAGBYbfL7lbWst2jWeuQa0EMrwr4kOvW37rCgQa3qJJM1t1R6l2ZI5r7+/B+k74lWG7ueZcYrnEC26vtr93Q8xkdeoCvHIUT+jpm8DaUw+jGRnvd39k/YIWo+tNb+xMNSyVUcxnvqxJ7RQrkNEQqkczCyzhtVavmeYakhnU+wzh9km0GcHoZaR9x1Kum1ff2+ncM9u8ui9JBcwHbul7K52gVltYQmTYoqdF9FlVOANw1p7VJ9pCNpouNaBs5Su36KOps8LWny9oEJKSiQTa1kIJzV+00v84sH0nb0zVtJXX6ARnYNmaPrks3XdwUPDeQgcCx+yAGbpU9+wRIodgxVBKVBHEvMPWA+bf3G+YaOOXwAliZNkJ3K0xgW79TkPT9lvmi8unyim/hnD8Ni5tnc58IaiDP4r4S6npN50J9hLhlF2abTJxzZIyEPERv/umNlkwHbWfjPh+v5/gGnwzrb2PTNwnPtxecvCrFX3NuQ/eie3gFCorVHjiDmJSYzLk856gF/CFSXOeh+PebfUkRtXPe9bXYxON8728CVTvQzz4rNRJzjF4VPnjcBL9e2VJZi5A1N+KUEki0bFCs4FsolDtoWewQMsGmuLJmOEBC2ckE2qx3iDNTxVQjNAXkAyHDL1j3QWt/L15vXKNFA1d7xw7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(18002099003)(4143699003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wk5XaXpQbU5OeG8xRG9Qdmhna1d3Z29KNm9JMWlJSHc4V2J6Ymo4dnFLaTRO?=
 =?utf-8?B?UEJpdjlzLzI1Yjh6Y09SM1NVdGpCeUdpWTF2UVJKaHJ1bDFZem1sUllOLyt6?=
 =?utf-8?B?ZzNjVWU5Ri9lVDhZVTNkeUhBa0t4Zi9iM0U0NzBaR1d2YWJKNUYrTUxpR0lM?=
 =?utf-8?B?SnlZMzBTYlpZc3JnUVFYaC8weU1FMjFmUStHVEVQanhrMCt6Umo2NDBmQnNX?=
 =?utf-8?B?Y0hIUTBXOUEvQmhFTkxMNDk2ajZuL2tpRDc4aXNBQ2NKbzUrd3hKY1d0cE5M?=
 =?utf-8?B?a0ZzellnL0dnSzRnSWgwdHU5N3g1YnlMSjZBd2VOS0lxbHhLSWowUDRveU9n?=
 =?utf-8?B?UjJjQnQ5c0paVGdpL3lwcTVNZ2NxTjdyYUFyN2t6R3BidGJBcldEcHdSc1Fs?=
 =?utf-8?B?WjJMbVg2Ym15dTFKaytXcW1jSHFmUmprdjhCZkhxVnMrTUwvRjFFUmJtUVFE?=
 =?utf-8?B?aWNPZEhJQmZLVnpGVG5JTERZcFR0L2prSzMxR0N4YTlNaEVGc1RpU1l4TGF0?=
 =?utf-8?B?M2tJOHRDbkZKK3NvNzIzeDI3SFg2OXBNanZtN0doaWNsNjkwUkFncWg2YllC?=
 =?utf-8?B?UFE4SjlObjhTeEsvd3VJYkFub1Zob1ZtZ0xZRGdwYUFZS0xEN2FGQ0tsdTBq?=
 =?utf-8?B?a0JRT0xja082T3hxdmw1eS9tbEVuWmh4U1Q0cjR1QlQ1TDJXYmc4aVI3TkpU?=
 =?utf-8?B?R3ppZy9iTUxmbHFUREI2ZCtRV2p0emlFbTVHUlY3M1VFUnI1amVVeEx4Z2Qv?=
 =?utf-8?B?Sm1WM29pK3ppWlduWmZ0M2VXTjVkcy9KZmZCSzZPNmRPcnVlSXY5ak9yVGtC?=
 =?utf-8?B?cXo3QjZQT2RGSnJQUS9aNk1IbEE5WGlqZndCc29ZT3c5K2R2ZDJkNDA2R29N?=
 =?utf-8?B?bUFQTnJIWE8yemJCVXJQaDhYOVpCaUFUTWUraW1zWTR1b2lOakdMeTlUVWlU?=
 =?utf-8?B?cWhvbnVnYVFjejl1RXQ0NWR0T0FwbUxlbk1JeUh0cmhYeFlRT0phYWovTjg2?=
 =?utf-8?B?dkFBcFVhbEROWU8xZWNId3ZZQ1NHV095YTJ4ckZkeS8xNDJHdnlRR1dUR0JP?=
 =?utf-8?B?QzRtK1krcVNQSGxaRXhrSVV4Tm11eTFSQVp0aU9lN3RUVFhnMVB1SHRCQmtz?=
 =?utf-8?B?TXJ2elpIUUNSZ2FLdHZkcDJQSllhaEdUTjRXRVc5VExkSmxNVnM5TWluVnpT?=
 =?utf-8?B?QzViTjFpN2JGMWt3czhhZ0J3d1dBQi9ySjhNak4zT0FjWlVWVVhleWdaSloy?=
 =?utf-8?B?SlVWSmUxNGxldVNpTzNtckJ6Nms5QVFzbVRUY0lHdmp6dnVZamgwSWQzU3Jk?=
 =?utf-8?B?Y2lBZm1SUXlRQmxjRUhmeDNMbFMzVmRkRTlPeHprTlRaL1gwVjVYVjlkeVQ4?=
 =?utf-8?B?Q3U3eEMwTjdxZDBQQ2dBZmovU0I0MmdkdHJyL0h5Z0JLOU9CQTNuWjhmOWh3?=
 =?utf-8?B?YW12U1hiUWlGQjkrT3ZDZTUxb1lZLzg5RUJXT2tVNHJ0UnhDUC9rb2hibnBS?=
 =?utf-8?B?S3MvUFJzQ1FTSTI2N21lUzVvbWJFSEVkYnh0QUZQNFQrR3ViL3JJS2RJNTB4?=
 =?utf-8?B?NXE1NEh5bFQyWTd3V01LUi9xWnNtb1FsS2hMaFNzdlpNKzJkN1NYUXBsRHB2?=
 =?utf-8?B?TDFYQ1liZWY2WVJHVkU5VENFdWFHQXY2V0tFci95MVFWME5obUR0TXN0Vmpt?=
 =?utf-8?B?ak44cjhZQWMxUE0vTGt0ZllKVHltb0V0cXowRFhSSjU4Q3hRdko1VlZFRFFa?=
 =?utf-8?B?dk5RdnQ3SWtVbHVIZTczWFRuMTRQc3pJbE04MG9XdHlYenMwazJKSWRCdEls?=
 =?utf-8?B?d3dTM1BEQkN5WU1INmhoUVB3a2hTYTRqYWlTT3V6aGV3MkM4WTRlUWZrWXpq?=
 =?utf-8?B?QmVjNFBXaHFuSVY1VjQ4d2NvTlh0dFNXYnNudTkzZVVhTVMvNWNQYXJJV2Zu?=
 =?utf-8?B?Um9RYU5acThOTGdBYlRoV29YN1Q3dXZXcVRVaHUwY2ZMWnFVTXBEWjNJMWlV?=
 =?utf-8?B?ckV2amlzWDdTSHNoemR6QktSUUNJaStCckNmVEJFODd2MWo4dTdQdkJCaXkx?=
 =?utf-8?B?YnEvWUpaeVlHb1dkM0IzcXRJTTQrQk51a3FsemtNNHVJNzhnUVRleFBNem5J?=
 =?utf-8?B?c0NZbFRYTWlqdGpwVGF4QytCK0VFYTFVaHV1SkhwNnpRQUF4MFdpczJ3NmFl?=
 =?utf-8?B?bXczK0hMU09RMXdTSjVPTTVjcUJRR2dXdFNHSFA3dmlNZUU0WllOSUtNckx6?=
 =?utf-8?B?eHRQUVdSZFBxMXRrenZhM3k2Qm1qTUZWM1c2SkVNbW92eDB0T2xpVWdtc3Av?=
 =?utf-8?B?OFltOWR1MkpTUmN3WjRRVC9neVFSelVHNGUvVFFtRTFETGVzYUdMdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1665ba64-5ce1-4cbf-5e8f-08df0e58fbd7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 09:59:05.5698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KuJL7kJKvzC2wdMg9pdm2S/Mr+jJewHCqLivRnMTzhboJ456tpKpG3iApop0fPqieYs9Z+aKv6ku+biet3x8ruXqjRyNXI4RYNcd9XVCz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8327
X-purgate-ID: tlsNG-d25034/1788947948-00CCBA5B-310A9BB5/0/0
X-purgate-type: clean
X-purgate-size: 272

On 09/09/2026 8:16 am, Jan Beulich wrote:
> No need to pass three arguments when both callers already hold SBDF in
> their hands.
>
> No functional change.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

