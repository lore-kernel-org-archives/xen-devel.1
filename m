Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8D5C88E72
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 11:56:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423939.1648763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Aid-00024U-LL; Thu, 17 Sep 2026 11:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423939.1648763; Thu, 17 Sep 2026 11:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Aid-00024N-Ii; Thu, 17 Sep 2026 11:55:59 +0000
Received: by outflank-mailman (input) for mailman id 1423939;
 Thu, 17 Sep 2026 11:55:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x7Aic-00024H-Jk
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 11:55:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7Aic-00DUz9-0P
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 13:55:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aabd53d-8faa-0a2a0a5109dd-0a2a45028cfe-40
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 13:55:57 +0200
Received: from [52.101.52.56]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aabd54c-6ca4-0a2a45020019-346534382c88-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 13:55:57 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS6PR03MB989139.namprd03.prod.outlook.com (2603:10b6:8:368::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 11:55:55 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 11:55:55 +0000
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
 b=PBe51dcRF9kWhewhlcHkTXYRddk50e4Ndz5bcadyvFsozzYhckNXfE/Rb7DpCABRfOIn+H3M1dAvQ73ee1Q1eDhpT0OIejTDeYxabPdG1SJ+tofKu78dzrzDWuKeahw6vxrP6yB0KbDyigHsrrRhUGAFRKr8YMZH2HalwkAwog72PR8ahuHuETVyAtctA3BVyuAyrHt+PdgE7gAS/BFwk9vsa+902p64XNtEeipNmRqemrH7LzNbC+41ADqWNRg6eWXweCwjCwzXochWf2GdY3el7iMhnO5CisxssOaHG6U6yOqCJ5nuBBodaAV1LlNoIBHkjsALD7GE0iw/CKQxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzBtTiyCxoz5Ohfl1wwUqMxTVfiFfDbVMtiyRXcdruY=;
 b=uUSNTOxlXiNnqrGoWavZ66ehtllF6zxUBrSlhPr5dE17uzAgstP+RCTKq43yGe3ovABRYbTijtZYqBz9JkzLrw8hCOhpx/UeLSg6YtU4VINFOw0xTxg3B2HJyn+SMcAWFxzNnmjfpur/eH/SDixKIhnIsIyhqRqGBpFzrtr1xFK2/zjWH+mUN95bdPb+8UIIPeVBot1S9C5fUCd8b2tPiGxI1S89Hx3G70hK9FwGazb5TrxFq21NSvY8hHUNzY0y9ElUvZF1hjKybgaV/u41vz12ttH7cqMPwy/e59s6gP9/pvJAsv0SDW2/q9+mXXDgbGj9886tSArslnz5MglM4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzBtTiyCxoz5Ohfl1wwUqMxTVfiFfDbVMtiyRXcdruY=;
 b=PgElSMt7ugp1xncPdTdLNx3SIzSSAqve7P7Urw54cE7rMHE/foFhYzcBNL5omFEwbGQY3G/N83jJYVuwRN4oIh2xxhCxy3O7+aK0/dbHQMmTofCOfUSQotorCfCC66qSzMrtWvHZHxGefdMKibwKGTjt0JtpLIgYgFvYe4KUvJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <591230f5-f68a-4a18-ac01-05aaecb0950a@citrix.com>
Date: Thu, 17 Sep 2026 13:55:51 +0200
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v2 1/4] tools/libxenguest: remove Mini-OS specific parts
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20260917075351.37208-1-jgross@suse.com>
 <20260917075351.37208-2-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260917075351.37208-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0422.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS6PR03MB989139:EE_
X-MS-Office365-Filtering-Correlation-Id: 3628addc-2f35-4268-1497-08df14b2a124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|56012099006|6133799003|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	TRrDUJ6QDB7kq2nd32lxapzf+hZTVwUKSoO7QcUE6jC1telrB8wfQlIaAo665Bm8Do6YiCfJD1QfWIiteT1Q7J63SoqxJL1aNQXv55duRMSepHpp6A3RD7P9pHaoZ/Rrgj0260uwTl8pnMftwRjc0ay62Rbt1cOA/gaylGqvnAEa7tGsYch1AoDze2lWtpT2uGVdrwTGzoS01oE9mMRjslMEBwr8ODUDYcFqRwjtOfhIz6eHIgb9kvZTO4MrjMyjlMhhgB5CSj8cd61qP8dE5psBHQWq7sMdTm6+2dChh2Fv/uCbVhBiL8nXNApbZ0sIwRscho90+8dvyYb3nAzORibt683Xzw+r+E/LMsFE6/gAI1rBUfiAvA2IslCi3v92OplMEDvZ82jX3CKCXKjIuZEAVfUgRK5TSPY7goMIac7VA5aXM63At+bkPLRr/p4X0WYTN1wHARvTr1z+bP8LtQW2zzqe8Q6hKblHJIIn0/FAgB6PeGXNnFUI8UoHAPxIMmSmBfvsmCAbxvgx+LdvbRC2jH5GDKzzJqCXBV8cTKCRGMkefJLT+juB2TqxlUj/pFpnXlqyVs3hQLWJEwaXLYg1Ve50B+pshnyfFabPmMVeHs7nsKc7xfM5i10sP7J1IowSR+aCOdtE1Z33yZxJiXPeyloZMCheWbpgIttH6z4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(56012099006)(6133799003)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmlMdXNRbkE4eEwzcE9oeFFlNm5QYk9ORmYwOWgxMWNMd1NCbWFOOXpReW1m?=
 =?utf-8?B?ZytLUzQvNmQvWTNPWUhjYWhKeHVXZlhRVFlYNHkvalpRT3FKZW1lWkJhU2x6?=
 =?utf-8?B?Q1ZDcm9qWEJKR1pZMjVQT2xHd2EwMHFqeG80Y0s4cm84eTZqUVR4SDdKN01j?=
 =?utf-8?B?WjBYVlpNNmcxRTdzUkZIa0F0MDgvWElLcVh3N0J3OGc2YVk1WWN0UWtoNG5o?=
 =?utf-8?B?cGVPN2U0MkZhYVFxcjFLTnNMdU10TmhzL0lDekpiOVNvdXpRM0NLL1plVlor?=
 =?utf-8?B?ckJSbmJ3MlBSbVpMcGswc3BjSUt0UjNXa1NYaThJbFp1ejJ5cE9mSU95dVJX?=
 =?utf-8?B?dS9wTkdHVUtkQUErTmN3WG91YUpxVDdOc0pFQ3lTbFZlV2VyZ0tta2o2Q3Zr?=
 =?utf-8?B?MW5tWXJ1aGN3UUNhdnZwZG5IT3RES0JHblhrU1U5eGtLTXZIVVE5QjJOSGRZ?=
 =?utf-8?B?bnNMc0F2UnU0OHE3WHlab3l0RTR5NStiODBESUs2NUhzdk1wTUxlTVVrVUNn?=
 =?utf-8?B?WkRFb0xEZ3VtWVM0QTRzWjdYUm1WOGkza20wUEJEWUlqUVdVRWRHTUlLQ1hq?=
 =?utf-8?B?K1hlRSs0NisyclVydHJtVjRJdkdzWldxbDd0SjNRNG1VczNXZmRsWnMraVVx?=
 =?utf-8?B?N3JMc0RjbWpnNXk0M2IweHJPT2twOXJlbjV1VFNIclp0UTZTNDVVUFc4cHg2?=
 =?utf-8?B?NUNmZHdrN0swK0NGcmk5K1ZGNTdONnF4V1RKY25raUIwNjhoNHkvUW5YZnV2?=
 =?utf-8?B?U2hMYWpETGFMY3NjS0RkMmpUZi9oVFBHcHByQzl3YzV4bE9ZWUZFWHRoVy9Y?=
 =?utf-8?B?WlR2KzdOTWpmQlN0bUtEQVl4YUNYTEswZXhFSHBuVDE1OE8zSHRyTjZUQ2R5?=
 =?utf-8?B?ZjJ1Y2h2VjRhajgxeXN3SkM3c0xzbFR6WUM2bTFJT29xbE1XVzVSb25MNThR?=
 =?utf-8?B?bkFqdEF4SUxHK1ppZTh1NjNMQ1NSOE9YRlZ3c0tRQmxsa01HYnlGblF2Wldv?=
 =?utf-8?B?ZkFHa3lvQnA4L05tSjJzZ0xlSEQyNVdUaDN2bkovWUdoVzdDdUFWb2hQS3Fk?=
 =?utf-8?B?YjEvTm4wbmRnSWhBODVBWXBlUWY0TENkTFpiUG1ZWURwOFhYeUJ5MFNtT3ZF?=
 =?utf-8?B?TndUd0hoclRZQmIvNDZJNW13am0wTWN0QlZ1QlNqM2Flb1RMckEwbjhTdEkz?=
 =?utf-8?B?NTBtd2dnRTl4RDlvYjVuRU1jdE00bGc5WDZhOWNnZUxlU2k5ZCtoZkpKQVpS?=
 =?utf-8?B?SWNhWTlhR1NyZkJnaWpINjVJb0djR1psVWJJQTFmemRaYW83RkZWKzE0cUVx?=
 =?utf-8?B?dWRIVTNtQWE5UEJvY1FrdUJvTDZ5dzJ4a0VubHlwbXhOb1Nsd3NuV1FKMnQr?=
 =?utf-8?B?UnR3dFQ3MzRBOFBzMTRYMGphMVFqRUF4ZEt3RTMrOGtYdE9ydExqd0JCM01x?=
 =?utf-8?B?VFlHTFdkc1pIOFpiNkkvSk4xZCtTL0g2aGE0L2hlQktDaGJidFlnZHlkYTJa?=
 =?utf-8?B?M1FMdU9EbGgxdDNCMnJ0RlB4VGE2UG1xUnNmQ210K2wrcHlJL3p2S2E3ejh4?=
 =?utf-8?B?cEJFeUtXbmhmUjZUemdmaW1WSEVNQndiS1VubUZyb1luZlNPaWlrUE8ybVNp?=
 =?utf-8?B?aTd1MVptZVB1dVlNc0JrQnVuK2tjQmNFR1BMbFNFRzd3ZkQvYnFlVlRTQjhV?=
 =?utf-8?B?K0RBa3ZIZEY2WE1HbEpSVWZucWFXeUZVNGloZUFuL3h1a3F5TzNhZ1dOSzA3?=
 =?utf-8?B?ckZMR0dOTEhRQ0VvcHB4YjkzWFhwbWlhc2RDZ0lXZUlCYUEzcTI2QVFMYk9F?=
 =?utf-8?B?SWhYd3A5dlg3Wi92RmEzOHZidDUxclRxODJUTnczMXlkRHV0bVRtZXppZ2RB?=
 =?utf-8?B?akRTTVpQMWFUamZ2Wjd1Qm5BZnhPMU1wbVVJQkdsRDdDYy8rbFNaTFUrWnNR?=
 =?utf-8?B?ZWRZQTU1TnR0enJMenkzNllSRTN1a1lNcGFCamxJY205SzFoRkcxRUF1dzJI?=
 =?utf-8?B?MzdNSVNhOCt0NVM2UWZnYkVHU1RsUmJFMWVPZTN4blJGU2NDSm5LTXNTb1JH?=
 =?utf-8?B?R3FzZ2V5WW1KMi9vNnBPdjVKaVRpUnF3WE9GbmdUc0dVTWlrcmh1dEtHR0Y1?=
 =?utf-8?B?dnMxdi9BOWlKWHh5dW1zbTN3cFdVNWlHS2VtNEh6NFFZeTdjMzFRVWt6Mld6?=
 =?utf-8?B?WEdCQ1FacWZGOXkvZ09uVFM5WjJLK1BJTzFLOGJxc0g0dWpJWTdxOTUwcmFO?=
 =?utf-8?B?MXRSdDlUOXl2QjRFN2NxWTdPczByU1ZRVU9HWWVSYUlCKytIU285QWUwaTVE?=
 =?utf-8?B?ektqV0hHV3hneWhpL20xVmk4UXRUTGdNRWpGOEpYQnprWDltMVFEUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3628addc-2f35-4268-1497-08df14b2a124
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 11:55:55.0798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcolArjB9bEqK51gDkKBxC4sNujG5YtBl14wO9q692Q11ugaqryruIXA7uNf3E8/2EJuCxdTacBblw1IuljA3LXokibCeLD8UaArwwfxJrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR03MB989139
X-purgate-ID: tlsNG-720697/1789646157-30DC12AC-3EC05AF8/0/0
X-purgate-type: clean
X-purgate-size: 1516

On 17/09/2026 9:53 am, Juergen Gross wrote:
> The last Mini-OS use case of libxenguest is gone, so remove the
> Mini-OS specific parts of libxenguest.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/libs/guest/Makefile.common              | 15 ------
>  tools/libs/guest/xg_dom_decompress_unsafe.c   | 48 -------------------
>  tools/libs/guest/xg_dom_decompress_unsafe.h   | 28 -----------
>  .../guest/xg_dom_decompress_unsafe_bzip2.c    | 14 ------
>  .../libs/guest/xg_dom_decompress_unsafe_lz4.c | 39 ---------------
>  .../guest/xg_dom_decompress_unsafe_lzma.c     | 14 ------
>  .../guest/xg_dom_decompress_unsafe_lzo1x.c    | 44 -----------------
>  .../libs/guest/xg_dom_decompress_unsafe_xz.c  | 46 ------------------
>  .../guest/xg_dom_decompress_unsafe_zstd.c     | 44 -----------------
>  9 files changed, 292 deletions(-)
>  delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe.c
>  delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe.h
>  delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_bzip2.c
>  delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lz4.c
>  delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lzma.c
>  delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
>  delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_xz.c
>  delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_zstd.c

Good riddance.  

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

