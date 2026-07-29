Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80870C53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 16:31:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376420.1623173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp7BU-0001dk-Ux; Wed, 29 Jul 2026 16:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376420.1623173; Wed, 29 Jul 2026 16:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp7BU-0001dd-S4; Wed, 29 Jul 2026 16:31:08 +0000
Received: by outflank-mailman (input) for mailman id 1376420;
 Wed, 29 Jul 2026 16:31:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wp7BS-0001dP-QY
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 16:31:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp7BS-008Xmp-7J
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 18:31:06 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6a2ac9-2eae-0a2a0a5409dd-0a2a450c8d42-8
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 18:31:06 +0200
Received: from [40.93.195.68]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6a2ac8-f479-0a2a450c0019-285dc344692c-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 18:31:06 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB8247.namprd03.prod.outlook.com (2603:10b6:8:28f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 16:31:03 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0245.012; Wed, 29 Jul 2026
 16:31:03 +0000
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
 b=ywJkjkdR/Pe8RKoc2PwGB+t2AG2i9NmjwmCu115iSO/PmeNgKzcGLq1Mvu3gfYL0jWwlyJg/Qs/hOHvtcf0fdWB8CjAp2O6/3XgvvFci7TeG6JtfsvzHlyWQZdizhGI/XiIE1/OALcLslXeBgLOm6G5VN5HmGffhC+Q68aEhIGNWB0fBeGemUg6OSBgP7dPfS1+DA/JYszoRy4O1d5Z6i13GBA8Y/mv+Z236O3Q1nTEhNVM7F1NHw1orCybwEv7VX+mPDFjgvvoMnhnB+jZ4kFPzY5pEpLa3Kz2kZtkQvhpp8g1B7tF/8KDNogfziT6psu4U4jHlB9zaO5IYQVL3qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aKWEcugL0FDXUClrxs4ZzeP3tDbcwkc/QWllUooMx8=;
 b=vgnv0jCM/2o3SaiQ971knpGE81mQTIYn4D/psqN+YB2zueyWE8yfUGgjSSVtPjxutWtWZjNi88+eAen5hJa7L7Me1G+WUT2Q9J8zpzhOuFOf0GKosdWaRQiKVlUkqkjmTxDnK1NnNBK4QYASlfL2I3i01KUEb/djm0PiBe60lXEt/z0Z3LibEXNerQNDMQPcdeG4a1WIWzFp5l5PfSWi1Nqou6nqpYuYo6oQJkkbK8bbIlpb+ZRsv7r7f0PND570vu242+aFdWZlAgXQDzSnp0hinf41wrToOSzzjM24mVrFGE8f3ZmcFFR77Aq72rNPVHnpbJve2jDIkNTVAqbDhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aKWEcugL0FDXUClrxs4ZzeP3tDbcwkc/QWllUooMx8=;
 b=MW1idH9WLaKBc9aeZQMMMJ1u5A8QTu9fHtxaULYHh3F8ZovVnPB0JVmgikh5hhr50jU5bYTvPWKUKoOq0qLg9AMN8kBjNAtTAhe4vofbUZ7AyHmkukWNul2Ttz+wODMTACQpdzoHLjDWu8XsB3BLiEF42zXc0DLxxtG/mIP9Y4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8f809d38-0784-482f-a30b-31af7097df03@citrix.com>
Date: Wed, 29 Jul 2026 17:30:59 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22 0/2] Final prep
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
References: <20260729161529.164017-1-andrew.cooper3@citrix.com>
 <amopknY3DltQwGcQ@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <amopknY3DltQwGcQ@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc22312-c2e2-43fc-4858-08deed8ec823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ee0fbIvt5wNrBHs1/MN+l0ZxDvycrmYvmkKS7kst9JNU/UJuxZXmh+9JN3leO2H7I1/gs9EqC5Ackcwre+7CWDRN8qtP1mn9B1v+NjwZu0+NVp7I7A0SD5Ua6/AWcQvccz/GAZotw2e8p1MW0DPZpKCf5tD1cEZaKt0y9D9VK46JkeDjvxSv71IFMWWR12AO32xy0zZFniUmCHi0aGvwKbzGtFIyuOcs+kAlVhr+yj4sYYDOFh2tHq2vncVhZwkdjiUeRcwLa17B+ymEC356RGnaWZCCdKhe75kXonkwCIzIgRLcESAjIolFff+6dSCNu21b4eJAGZSlheC1UeOVZgYRkoNhiysAYbmF4OAoJLzeDcJ4hj5OIg7Qtb4XGxC70tWrKvFi99W/kSjTfdU74JmRC5JlvokfV1Mzv/dALKQFQ5lTZ7mj514GpfH6D9JKpDVR3o7I4QecnVvVOoFrRzNEp7GjfIJ9pwsolfBgCz7zfuOvx1xmPQ4nN8tXkjs2iZ0tp2Gr0nW3Z4SaihvOk0SzLmyp59p8Fx4AvOTzwe+K8dJSUjHUoj1Lx/YEpPQa88tkVdj1skRX7CRZy6wyzFo8vxMf8LPnZkwQBIUDhhXG2K9q4BYf7R5fgk3gGy33uaEUbt9Ck3tKLQ7V5ouTSDpPa5vTf7u48zhh2B2cogw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0pHczhQUXQ5ckNMREVpS0kwQzhsam10WEt0aE9vWFpaRmgra0E3WVpCQjdB?=
 =?utf-8?B?bU5UWGZBd1F4bW9VeEVkR1J1Qm5Dem53M3o3K3NqMVd2WjNQY3pVdHk4V1o2?=
 =?utf-8?B?ckFDYkdDVWNHNWxxQnFwdjJLZ1BLVS9oNFVRTGdoc282L3JJcDNTdnVGdmdH?=
 =?utf-8?B?VTh0L0xhVVVoTUhhRmV3dTJoeXJQTHIwY0NjTCtROGJOblFDazdycGdzT2Zx?=
 =?utf-8?B?alEzUXZhQmpiZUgzRkRONi9LVXNaOUx1UHcrdWJBeE9oMktXRFl6alNVcDNT?=
 =?utf-8?B?anNOVTQxZFRmNzgwN1M5SWxrQmk0UXJ2d0Vwb3dIVmtYS3FTRXNUK0JTZ3NY?=
 =?utf-8?B?R1h5cWJZWm1wNlFKNzVrQjRyRWVMczJIR0pXUkwyU28wLzNyOGtvRTFPclVs?=
 =?utf-8?B?Wi8reUUvaUltMk9Xbk9QQnJyajIzM014dFk1cC9hdGZIUjBqTVVZcGxhUjFT?=
 =?utf-8?B?Q3d1MUtaWmsvNGJvNm83N0MzK1hTbUJVdVVoeUlmT092em0yUmJXaGpyd21l?=
 =?utf-8?B?VVJlZjc2dTZGU3BpckxZY1dsVW1QTG9aYXY2OHFMQjl1elZqRjRDTEZVRXYy?=
 =?utf-8?B?MGNIZzUyTUU3RlBDRjIyaWFMSmVCeVUzZkVsTEwrdXlNMkNBTnNnSXg5Y2VW?=
 =?utf-8?B?VHg0Tk83cVFkcFYyVUNnNTNiQm1vMFNFZ3dXNmw1VEpNeVdxZG9PWWxPVG9E?=
 =?utf-8?B?bEIwSjdpSnBSZ2FpNjRrUTdFcWdnS3NwQ1lXcVg4RldTKzVVRUU5aVNsOWlp?=
 =?utf-8?B?bnNKQlN3VnVJcVlxNUl1bW02V1orTzQyZk9ld2N2dWNJblJtNVpPNEZTUHNX?=
 =?utf-8?B?dkNabW9qZEIvVUVQZ1MyUVJUKytPRTVXWlY2Zmh3cWNTKzdoalBmUk11dmQ4?=
 =?utf-8?B?amJqa2FLVnVLTkNxRjhNaXhkN3pmeVhmQjRCT0hKR3pZSlZxSE05Vjg4cUc0?=
 =?utf-8?B?ZFpLUk5zR1RHWE9TQmZxZkR2RWxOTFY4alVtTGU0elYyVkZyWXNiY2g0akVL?=
 =?utf-8?B?b01ZYkVyU2d4aldyQ2NTN1FUSHd4aUNGYzB3d2JKNFVpRGY4REtwM0dyZTRt?=
 =?utf-8?B?Z01wbktuUm14N1ZrRjlmSlVIeHozM2VwVjEyNTlCY1h4QzZlbVVHY05FemJv?=
 =?utf-8?B?NzRhb3RXT1FialBtK1FPa0JyNFRPbFFZeC81alFwVDU4eXRydEJHTzBZMDZy?=
 =?utf-8?B?VVVVRjlsSlJKdXM1Y2ZsVERpcmNtUXYwdzJTQ001NDVQenZmUHBsa0x6Y280?=
 =?utf-8?B?QkhnUzNVRk01VmZhMzByWCs1YzlMc1RjSDV2bXphVVU1dmNLejJCQTVFQnhl?=
 =?utf-8?B?SkpsWUcxOHdVVWt6ME5PdzQydGpYa0w1V0VNYVRIWVJBcjVuMnhiZzJoLzRE?=
 =?utf-8?B?eUdXWXloRVNBZnE1QU5OS2RwWEo3Q2dKalo1REFOaysreW92MjIwdzdkcjZV?=
 =?utf-8?B?SlQ3ZGg3c2FGRTE1aHNPZTNTZUp5SUlOSWFxQ2U0cVp5SjI5TFVIb3N2d0t5?=
 =?utf-8?B?a21zY01yUFpSbXdCaEpDZDNGQUc4ODIxV04zaTRxZFlaeXVoUDVtbWhhT3FR?=
 =?utf-8?B?eWc3dldGamJYZjRvV2k0SHUzV2poYkZkK05QTU0wV055ODVrMDZSRFA0VTV6?=
 =?utf-8?B?RnFiMzc5Z1RPR29ZM0lzdmd5Ym9PckpBaWRJaVF4bWZjUmF6VFlMZlpZOW5E?=
 =?utf-8?B?K01ZSVNzS0dlU0xXNXNaQ3pMcEpobE9LdDE3RDJpV2FNM2s1YkE4Qk1IVWpv?=
 =?utf-8?B?NjlkWjMrcnpPYnUrNFNXV0FYQWZvTjJlVXlHQmo4anNZMUNmMHZTSDJpbHFo?=
 =?utf-8?B?U2tBd0J1WjFZYnhjVi9kNTJRWTltYmIxZG52cytmc0s3S2JEMnV3UEFNMU51?=
 =?utf-8?B?bVo4WUwvMDdwbi9GdmxLRm5BT2I5dERMY0JSTzVVaTZ6Zk5mRGdoRGF5dVlJ?=
 =?utf-8?B?T3k2ZzdEUjVIMmhXVnFjeHJwVTREcDVjOGJ3S1Z3Z2VaNmdYcjJkZGt1Q01L?=
 =?utf-8?B?L09USnJXZzY5RGlYSVdOSHFjU0wzSlRyWXEzeUwvOTBJcG8zb1pFekwrdmQ2?=
 =?utf-8?B?aUVHRGhuSGlyYWs2UVJOSW1QbVFKa2cvUUpZd21FT1V0d3F3ODQrcUkrZSt6?=
 =?utf-8?B?blRRV1BoZHhFRHRMN1hvY1loUHJsV0hEdEgyUUlpTWlYNFZLekZnQVA1aVpH?=
 =?utf-8?B?U0ZoWDlieG16cmRvMS9aVmpVeHFVVm53S2NLN3A3QXk0aVc4TmpHNmdJSUFn?=
 =?utf-8?B?QkxqMVpEQVR4eU45Umh3Qk1GWXk4eTFUTVByNU5EY2JpZks2a3Y1eDJrRzdB?=
 =?utf-8?B?d1NFMzBVcWZLcHMvS2xWeVZ5RDNZb3EwOFVqcjhtejgwNzNoQnlVQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc22312-c2e2-43fc-4858-08deed8ec823
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 16:31:03.2787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/cPCXbhGg+g/DRZZfjVFRuvC3Cu/qpLas7Mihp4bRXCFNDrVpN//5/OO0bcmQNc3VzXKhplfsC2LrP6ZCvKIPJ/s3VIQrRpwR+s1lvuAOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8247
X-purgate-ID: tlsNG-d25034/1785342666-5270FA5B-B8A89A17/0/0
X-purgate-type: clean
X-purgate-size: 388

On 29/07/2026 5:25 pm, Roger Pau Monné wrote:
> On Wed, Jul 29, 2026 at 05:15:27PM +0100, Andrew Cooper wrote:
>> Andrew Cooper (2):
>>   CHANGELOG: Set release date for 4.22
>>   SUPPOT: Define support lifetime
>     ^ SUPPORT

Yes.  I noticed just as sending, and fixed locally.

>
> Otherwise:
>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

~Andrew

