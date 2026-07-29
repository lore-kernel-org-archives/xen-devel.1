Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B49C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 11:24:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375531.1622663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp2OK-0005xb-Lq; Wed, 29 Jul 2026 11:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375531.1622663; Wed, 29 Jul 2026 11:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp2OK-0005xU-J0; Wed, 29 Jul 2026 11:24:04 +0000
Received: by outflank-mailman (input) for mailman id 1375531;
 Wed, 29 Jul 2026 11:24:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1wp2OJ-0005xO-Mg
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 11:24:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp2OI-005dG8-VP
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 13:24:02 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6a69e2cd-bab6-0a2a0a5309dd-0a2a45058996-20
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 13:24:02 +0200
Received: from [52.101.65.123]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6a69e2d2-4cb1-0a2a45050019-3465417b51ff-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 13:24:02 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DU2PR03MB9971.eurprd03.prod.outlook.com (2603:10a6:10:46d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:23:58 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:23:58 +0000
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
 b=H56pu+WYC0SKcCRXbIlhiCFZ15GEM7McuEQAJPleYyyoMzqNnEsmhgS2ZwUI8SpBaHsgyHbxIcPJisbLQngbVhMJhoCWKFgNgd+CQsZ50SRsBrNzu2AJGG4fjQeo+o/D4IpLWNgC/PVpAxH3/W36i6paXBpTHLt0TqKKQp2fDQHvBOMbEOkVysigJLTxwbqbPzS1Vl1yexaP2YRTirwhLpNa1lrgfytOwEMUN3FMjq2KVkqxvQKDKN5Tr2EbdQ54W+61YT/srPtnRBBAznv0v7356+C+WqtOwyVJNNmv9AM4Wpf7soSFawBurxDV/DbWhMjmpkK6bLG+ZtH6hf9M2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCs+d5r6l/l0DXBIutJNU2EOOviDvM5NMF+cJAGeEzs=;
 b=Z8F2OkJvkdjDwaXvYtg1mLMRkiJ3lFZBlRgt1TBSsED47U+2uWRPHS+tmHSyLzFG+oAmpDpqmCuuJfZS70gkA4cm7r+ym5edPMAMlETsucwFkupuprCOcp3vFKydSktHdKORoDjxrwVns7drxmfCd8qXSjuktIl7OXQtf/gOUpMo0Y5mqYuwauimx/LU3qflofd1fpBgQZHKN7WqG3gnunHlKrL9G0+L/8lcU1uBOHsNzlI8/kNMV6i0bEolrsjLTP5nwJNVUAZOUHGKcPdBZwusysjre5umaytUcd6+1PL1ASL+kFLnV75gWIa+YvypJBPzwLIXb0y377a7vJHbiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCs+d5r6l/l0DXBIutJNU2EOOviDvM5NMF+cJAGeEzs=;
 b=ulAtAbsv3ps9sxAxdFGtlO4I5p/hmPH8TRp4BeYdOE6O/sKii8SI8A6hQOhYVsgGdwxaMIU6qtt3VbcbCbJlWPOaacOASeJxIf6qBEMXiWpfVyOq3KfmDxn/PVRGkoBwfzJWu3cRSUzVy8IEIITpyrvsU6JaOiy/rABHZNliE8rvfJ6y7okfGDc+7vi9iTrRqwmmDP+SMSrYigPH2y32JeDGniZhZA9YGSrqjryFOD192W1f2bvoDHVDa/Si9P2hgn05bx/bRW7TROjXgIiIRM2CKmcEsxBoprvqm5xayfQ1NfhQMAV+2Hnd97/vAosu3iDa2Cp0KTgjnTtU/W6DsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <02bfffb6-9624-4d38-b007-a8f459ae6c7c@epam.com>
Date: Wed, 29 Jul 2026 13:23:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/23] doc/arm: vIOMMU design document
To: abhash <a-kumar2@ti.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <06d3f9dd178c40b9b2360c24cc2ed55f9559eba6.1774918270.git.milan_djokic@epam.com>
 <5681cfaf-abfd-43ad-982f-dec63882c478@ti.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <5681cfaf-abfd-43ad-982f-dec63882c478@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0300.eurprd07.prod.outlook.com
 (2603:10a6:800:130::28) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|DU2PR03MB9971:EE_
X-MS-Office365-Filtering-Correlation-Id: 85fa6ba7-62fc-4bb3-9e59-08deed63e1b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|6133799003|11063799006|5023799004|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	dXrhGAohKgQ/qf25/7Sn+BZgkRHtUDAHMvk+/uB66P6xjqkwhX6Tsq1Lx0ARnmwiqcfhLjDYZpm5VHPhbpqs4vXIcLuQD6tiL+SId2Pggg5V3K3/qJtKJNQw8ds4I6SvrWChnJLpCZ7Tw2LcRc/xHqLoM3FWMX11Us4tbeX7NSGmtTplsDdy85jCQUPNj0WYXDs2l72ZrKgMnxWA2mUBTruCB22BPM2B/aa1R5J8pJqH3M3ZhOEk6Hr8DfXJflyF313BowRrE6lEEjE/GbEuHwjzl5USeUJgq7w4SvOYwBlhe7Av/MZvR1DdwpC/nxu8+QFWZDWVgzq9ol+nLk+LX+B7KpQgDnug9q4FLgDKEM05zJ0ydS7ATokHpZdbn5hxFY8hW1RtyUmcVMZJDBUEAhwmre26ACg0Or47gNqlDQRwKAgpvXKhstj8jIwwTyITXTcF7+2e4Hqn/SU3qLO59KSKJ3aRaZZ6ENpN9KzN65RjI8m2kzjgHYtUP11o7txYY5YImccyd8LzM3C1voE5n5OE9OgSl2V/xfhdfAKHR5J6Ya6iI+gwc2BW5pEfGINeFZ9BQvc3tlIeKGul05nL7fr26Rtsz3yljW+jsXqG1p3OGKarroKM4Q/gO/BR9lRWKI9IKFiLuPmCht4BYWVRs6+hB1piK6jfkRJUUuXGXYA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(11063799006)(5023799004)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWVwcVZGaXg0bmhBRnhheUNtOWJoUmJ6ZFhyZ3hpdm1UdU95NnkyWGwzbTZW?=
 =?utf-8?B?MHNzL3JaM3h4dk11Sk1oa1pTU2tXOXFzSDhVWFZlVXRsWG9VM3ZoVFpzdGta?=
 =?utf-8?B?RDEzb1ZTZUN6ejFqamFBNkUwbC9JYnJWb0d0eFUvMU5mMkwrNVA2VUNvTnAy?=
 =?utf-8?B?aEdSZWdQcFBXZXJJcWtqWkVZZFY1L1BOZ0ozUmpLbjBBZGpPdnRsbU9nRDE1?=
 =?utf-8?B?ZHFIRW5yU05TbnVROXFtdFN4S1NIUVRxSi93byt5WGptT0Z3Zitna1IxdGVw?=
 =?utf-8?B?cDZnR29GV1dWZE1PcjV4aWthVlgyVlNKR25iWW5yUXBISmxpdGZKMDRKYW5D?=
 =?utf-8?B?QXZUQ3NCbmluL2JUeGdWWDJROWZLczJKOW1qM3FtUDlWaml0di92NE5LUWR5?=
 =?utf-8?B?Y09qLys3MEFWcloyNmRTdlZ2d0dvQ3Jsa3l1TG1ubTliR2hQRWMxQ242MlpX?=
 =?utf-8?B?SVhzeHBXTVo5NUVpZDMxcDdoVlduUENlaE9MNXBGRFhadEVaVnF1NDZ3Vks0?=
 =?utf-8?B?RVY2TlI2VDFIR1JmNWJmK2NHdTU0bitNTldrSTEzSnlWZFBGRkxnVTlsOEVV?=
 =?utf-8?B?bFhTd0MvSEl3Q3JwQ2NpZ3lGWGJ2ckoyL2RXTFdUTDU0bmR2N3FaUVVsOHBi?=
 =?utf-8?B?WG55R09naG45WUI3TG1qVm5Mb1B1UWlMNTJQVjhoR3RHdTVFU05OaVlmQkw2?=
 =?utf-8?B?ZGczejlEUUVra1VFMG5meFJxdHhUYmlTZEV1WVUzNGREaTBEMndTQ3kyVGUz?=
 =?utf-8?B?OHlWdEZNeWVUQU5RMUc1SlN0TmNiMEwwVkRmVmM0bWd1MWlzeWFxcU5GbXlv?=
 =?utf-8?B?RVNJZ01CVXVkei85NlBDL1dQVnJLMmtrNkFJenZyTkRpM3Rna3djOENsN1BH?=
 =?utf-8?B?VUptdW5CZlhBTEhYczN5SlhxRGg3RS81SzJvVXZqOWVlOC9jUWQxd3Q4VW9Q?=
 =?utf-8?B?Qk9kVGVYNkJWL2E0M3NoVXFGRzB1NlkrcE1ZUml3R1l1TTYvM3F2bkV6VFNh?=
 =?utf-8?B?d1UyekZmOWladnpNRDMvd1RueGFOSXNzZ2dpMWhOOENjNHZkRm00NWZxa1ZF?=
 =?utf-8?B?VXhoNHEwa2U3QW4vMFVwM2dOenBtcnR2Ry9Ha2F3MGtLVkYvTWhEeFBkWGpN?=
 =?utf-8?B?QlZuZ0o4aldKUTJ2TE10SVp2QlJRV1Iwd3pvNDBkQTJtQ1lLTk12cVZtaWpM?=
 =?utf-8?B?RGxDanBmS1dCNmFoWWVjOTRZSC9iRzlrS2ZSVDJxQ3JPN2JMVzFYbG9ON055?=
 =?utf-8?B?bm84QmZzTGw1WlhFL3VhdXltVGRQSmlkOURrTkp1d1h4aGNxNmJUMFc4Ym1O?=
 =?utf-8?B?ZnVCZUpYOFdTVVlxOFg2Z1JxeEw0ZmdqL1RDQVQzdElIYVhTSk1HZ2ViVzBW?=
 =?utf-8?B?cmMrOUpya0lhM0duNG05Mk55Z2JMV1pKYTJDd3UzbU9rcVlDZEZrTm8wbkFF?=
 =?utf-8?B?M3RWNThucmMyaklCekVHeUFITGxGSVlMT05wWTVlcDQweFA2RElFcFh2NDRB?=
 =?utf-8?B?Z25ZR3puV2pwdXNaZTgrTGxpYUZzeng0dzI3OTl3OFRZczFMbjZ2dnM5NWFL?=
 =?utf-8?B?RVlFQVpWcGhzQzlQTnFWaWpEUHFmenNaTmtqSFVGTisrSUdKbjJtSU9VdXR0?=
 =?utf-8?B?MFZNUm1OeDVjTVZpTjFhWTF6MXcyRFdvNE40c2RQTHJmVkZkTjZMdHEvSmNv?=
 =?utf-8?B?QUN2eWJUcVh0c1g1S3ZDdzQ3Q2dXczE2VUxDOVNsZWlxM1Vyd0RCNDRqNWpt?=
 =?utf-8?B?YkJxWCtsVG9RYThPZGJDOThqQzVYN1RiWU9taGpxcUdwRElpM3laenlmMWIw?=
 =?utf-8?B?azRnemZNZWtsODB4L1J5TVVsRERmVkQ5TDRKRVpTQ2ZRY1JGVmJDY3dxMzF6?=
 =?utf-8?B?OHVHQ0RqcGVBUXlpM2tQM3JKMlpYWmc5YW9Oa2dxWklYZlc2MzZ1YzV6ejdx?=
 =?utf-8?B?eFU3WW1PT2FwbFdjYzFVRTlTQ2dZNDVIdVVvclRLSXpHNzY1ZkJ4L0t5SnIx?=
 =?utf-8?B?MUROb3piVFl5ajd4aG80ZzY0Y0pwN2VYUGtHR2d4QXNVZjY0dzFTRVNBQW1h?=
 =?utf-8?B?MVphSmNjRVpNWUJGaW52Y0hwNHRxZFc4RWJxcHd2dmxqbytwYUFzUmRHc21w?=
 =?utf-8?B?RGVyNFpvOWVCMGpSVzRHai9xVVV3cVQwRHcydUYzVVNIbjVNUVVwTWl3b2Vm?=
 =?utf-8?B?a1hZOGFEeEFzZHdVSU5mMklUdWtiRW4xTG5jeGUzUlA1MktaTzkvNmpYdklV?=
 =?utf-8?B?Rm5qQmVPVVBYMm1rd00rUk45WjBZMmU1eHU0Ym9hUURWT0JuR2ZPSFduQWt6?=
 =?utf-8?B?Y2FRVTNtaTdmdVg0bmdHbVc0aXl4dU12dEZiSDlMNm92b3Jtekdadz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fa6ba7-62fc-4bb3-9e59-08deed63e1b4
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:23:58.1506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtevO/4B9BxrhoIfucZQUTd4n/PH5CO+bPzbGkTGTAWj1MGBWTXeis8c3w0wACGrFCucTQ9OAeYkdDARnNHeHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB9971
X-purgate-ID: tlsNG-c201ff/1785324242-F76BD2A1-4AFE03E2/0/0
X-purgate-type: clean
X-purgate-size: 2991

Hi Abhash,

On 7/28/26 12:58, abhash wrote:
> [You don't often get email from a-kumar2@ti.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
>> +Performance Impact
>> +==================
>> +
>> +With iommu stage-1 and nested translation inclusion, performance
>> +overhead is introduced comparing to existing,
>> +stage-2 only usage in Xen. Once mappings are established, translations
>> +should not introduce significant overhead.
>> +Emulated paths may introduce moderate overhead, primarily affecting
>> +device initialization and event/command handling.
>> +Testing is performed on Renesas R-Car platform.
> 
> Hi Milan,
> 
> I tested this series on a TI platform. I was not able to get the DMA
> test inside a DOM1 guest
> 
> to work with nested virtualization.
> 
> 
> On the top level, my changes are:
> 
> - Enabled CONFIG_VIRTUAL_IOMMU and CONFIG_VIRTUAL_ARM_SMMU_V3 in Xen
> 
> - Added viommu=true in xen-bootargs
> 
> - Added a "smmu" node in my DOM1 passthrough node, so that it can be
> replaced by the viommu.
> 

Xen inserts the emulated "smmu" node into the domain device tree 
automatically, so there is no need to add it manually. I'm not sure 
whether this is the cause of the DMA failure, but I suspect that the 
device tree node could be overwritten during domain creation. Could you 
try removing the manually added "smmu" node?

> - Added "iommus" for my DMA controller.
> 
> 
> I can see that the smmuv3 is probed successfully inside of DOM1 and my
> dma-controller is added to the iommu group.
> 
> ""
> 
> [    0.161594] arm-smmu-v3 4040000.iommu: probing device
> [    0.162067] arm-smmu-v3 4040000.iommu: ias 48-bit, oas 48-bit
> (features 0x0000020d)
> [    0.162993] arm-smmu-v3 4040000.iommu: allocated 65536 entries for cmdq
> [    0.163730] arm-smmu-v3 4040000.iommu: allocated 32768 entries for evtq
> [    0.164281] arm_smmu_device_reset
> [    0.164559] ARM_SMMU_GBPA reg = 0
> [    0.164924] smmu->evtq.q.q_base = 45a0000f
> [    0.165609] platform 30100000.dma-controller: Adding to iommu group 0
> 
> ""
> 
> 
> Did you have any changes in the kernel tree as well?
> 
> Could you provide the testing setup that you used?
> 

There are no changes in the kernel tree. The mainline SMMUv3 driver is 
expected to handle the emulated IOMMU device without any issues.

So far, we have tested this feature on the QEMU virt machine and the 
Renesas Gen5 board.

Just as a note, I will be uploading a reworked version of this patch 
series updated according to maintainers suggestions, as well as 
additional fixes identified during more extensive testing. I expect to 
post it sometime next week.

In any case, DMA should work for DomU with the current revision. If you 
still encounter issues after applying the change I suggested, feel free 
to contact me directly.

> 
> Best Regards,
> 
> Abhash
> 

Best regards,
Milan


