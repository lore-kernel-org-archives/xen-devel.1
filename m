Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1EFC98302
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 08:47:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428358.1651085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8w9J-0006yS-RV; Tue, 22 Sep 2026 08:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428358.1651085; Tue, 22 Sep 2026 08:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8w9J-0006yL-Ol; Tue, 22 Sep 2026 08:46:49 +0000
Received: by outflank-mailman (input) for mailman id 1428358;
 Tue, 22 Sep 2026 08:46:48 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x8w9I-0006yF-4F
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:46:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8w9H-0028cQ-Dx
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:46:47 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ab24072-bab6-0a2a0a5309dd-0a2a4504d552-0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 10:46:42 +0200
Received: from [52.101.193.54]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ab24070-b57f-0a2a45040019-3465c1366ca3-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 10:46:42 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB7078.namprd03.prod.outlook.com (2603:10b6:a03:4d7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 08:46:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 08:46:37 +0000
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
 b=SwMHdulPSk4/my4FmdiPgr/WHvuT8OZGaw1tx0ODvU3gZJPSVBA97msMlFBS8DvnCHfXSrRxozKqQo3pvikrCYFy/FEKmpskLhMf9tSKHQ2bPwMP1nOYIvu4fVuKPWrhr4xDKSJN29ZE/1k18KIuiC8JWFUDEb2RF0V67j8c37jknK9PVYF4abcztayvf5KVBJgVIFJ1OlBqBWfKifoxnlS3Uzp1IBJ00P1AtGuGL3xtnqigG5iMBMwkuPED+ArGS0osQ51nqQggjDpNr7sjBJy5DYWlQ+9z0DcRLw6Xsr//ulF702pxPfgzHHvrVqgbSCGDAW/ETZ/1DVULvnMD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6S8Qlml4KIcmFt9GBxd9qkw/xMiL535E7cdJGNOeYxk=;
 b=KwObllsNzF4RXQK/Qi0kTLs0AVNzdiofZadNR4AI6hPAOaeK44hTQAkq2I0mEiIj9a6WZkdOCQVO1MsebyOHT0cSy1hId9QN/Z3dpMM/rAIN735bMWq5IDgHWD8KAXH6exvv7IATD2BLhsCHH2Lm1nT/KkSHnvssteyML/VDw9LTEqu9RGOU6G7XuZ5t4/QwTFJXxnk2Lo6Orx6zbvjZu3p5EitgvdYgU7kXmcuonkn/EF1pvH2qZY+ERLPdsgq4ErSw2Fqvg0om0OrLHQqrt44HcG44dXEiyL/4YaFd6bNF8rs8Oqxy+12gIPty45l48fAhXIxbubjVgxTsY/3ojQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S8Qlml4KIcmFt9GBxd9qkw/xMiL535E7cdJGNOeYxk=;
 b=iHQfzaICQWgz+4MJOVkAjloYztF4wtSPSRoIDn83fTfiWV3DHXi3FYnqrdxOMq7tCe+UVUhfRAvuwO3E6/MmH99luaOMw9LHg39Os/AmxfwbfC3KfVlM+2CTGqXoMKotFyO+IM2goXa4efCAdosWPh4Ddl2/zlsy6jUMh30VuoE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0581fc21-f2db-441b-92ff-0c7da6e8d443@citrix.com>
Date: Tue, 22 Sep 2026 09:46:34 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] ACPI: prune undue ia64 leftover
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d8ed3534-979f-48cc-a785-d00d1d9790b7@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d8ed3534-979f-48cc-a785-d00d1d9790b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0170.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d7aa61-9418-4263-f401-08df1886036c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Lppdp0H3p/r9kwP2kDAZwXU4+CaQIhpt0iS2l4dtaeUegQsrpp0+MA/gfyRmpxnCrzeoe+2mgCb+xCEgZ5T3YAtU0qivcgBGbFB+9vYjxfC2I4ZVrtG7dI3hRZuRf3bB1VjCpXD+8wFTxi2LZE1qDxI5771avFaPKhqpnKOaO23W5LxJe2uES/sDhRkId9KjkCbGrXM9EGlTltelk6FLXmJFE2w102tCU1Mct17sA1ZbYO/RVAuUFTM85UE6TqHPtBmZJv3JQJJVSbtZs0a1TzLdY/HXdf47LVn5gWtlBw2HKSYtuUS2alUdAnNfsvO0jg8moMZx08MPu6SNSIdA1eDl/LYfIxarHJfs/xYln7UL2m7TC7I4uLKguFq8t+vCM//7mAFiPeiollK3mTFJWUiILwY+FRvJcOyS5RXqOj3RKvTtQNl/QYS5GCQvow6ebiRivN5BKvbbsuhmplSkaadrgRFWhyTP2IWmNejXdGOvS6DbYPmoYaPeMqE4hxls7RpkJR09LPJu31a9rrYZYAPUoKJjHmI+SHR0pU94nlXC+UNy4SNY+Wp/8wEq4YKCTifVRFzCVtr2MiYj8RRcM1CLCWYJYIjkV7Mlf+tpptUSPWV8PT0VczRl3Amg9j7MTPbUFu+8KA/i+IsrdXKruUt9ZK1/krkG7VNOGnrn/80=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTRYeUF1K244bWxCakZ6Rk0zMmJoaTdZYlVKelp2b0xGSHludU9uQ2hiUkpa?=
 =?utf-8?B?U0dqeTgrZmxQNStzc0NTMG8xZER0UWZETGl1bDhjV0Y1SUhXdFhqYlJvbGFB?=
 =?utf-8?B?MVFhWERTT2ZoL1dkNHYwR2p6L0lEZHptOUs2dFUvQ1RCNk16MjVDRXpKRlRW?=
 =?utf-8?B?WUE0UU5lamtZV2pqVk9vNDB1SzZKK2NOa3l3YnNJY1V0MnJEZ01BL3h1R3Rs?=
 =?utf-8?B?SHlLajNvM1RZNitRWXNDMHJwM3V0REw4ekJrN0c0ZWo3NUY4V2ttZ09xU0Rl?=
 =?utf-8?B?aS9sbWJpSUZHTVRtTWcraDZkNG1YUDBBYkhHVEFSb05oSXMram9lQUh2cW0x?=
 =?utf-8?B?eTV1SVlVWTFBTkt0bG5WTjVBRUZ4L1JualNXQnVZaW9wOE5GV3R5S3RQeUk3?=
 =?utf-8?B?QzZjMDNMMHVSTUlPRzdXWElvdFlJbmQ0NWZnNlkyNnE5WjFsdGx0R0ZtOExh?=
 =?utf-8?B?WUFnaWJ3WE9ZQjRVSDhrNzFhblY2NlJYTkJqejhjZFR3am52dkxmaGc0dzYr?=
 =?utf-8?B?QTJpS01nQloyK0t2MHBjM054ZnVoZUIrZXB1d3hvNkRSbjBvMStLNENMdS9G?=
 =?utf-8?B?alVpNVBvaGFxbjdFOVBiZWlpTEd4TzhVeUNaOFlEdEJBUXNVaXo2UW55bEs2?=
 =?utf-8?B?MHZHSnc0WUNkb0w4SFNIeDhzNVNuWFQ0NDNhRmlRejFaQmtDajd5THAzdi9u?=
 =?utf-8?B?eWlDNTBVak9zRTdXWjRwUEh0ZnZFUHZHc3VUblBENmMyVEsyWEMxTExjRko1?=
 =?utf-8?B?YWFyQzUya25IdllUK2dVTU83cmQ1SFl4L0NycTdSYXpyUXZQcFhTVGFLOWMr?=
 =?utf-8?B?NFRiUVFvTUg5SmVxQVJ0SkVoQWhQZmJBU3JZMFRHM2NPMC9wUWZLUVZ1Q204?=
 =?utf-8?B?cWJjTFc0dGFsSHZ4SThhcm8xbUcyczFJMlJWaStuUFJsSm9IbGEzLzd0REFx?=
 =?utf-8?B?Z0hVOTcvYUYyWVphWlo3MDlDa1AwWVQ5Mzh4TFhwcmFTUXg4NnVCRHVJTVNX?=
 =?utf-8?B?cWJtcFNFV3AwYUVTWVpBOWFKc2dUNlN4ZG10bkdPeWtVejhDN01lZVR1Q1kz?=
 =?utf-8?B?ZzVmc1NmK1duUTZXRGVyS1BhOFBrNmM3YjZVeHZjVThXNjc3QzMxK291M3hi?=
 =?utf-8?B?ZlVMYjMySVM1OGtWODQ0eUJ0TmtYT3RWQk9pQnNYNDJPSjIrOGU1YlpMck1G?=
 =?utf-8?B?cGZOaXFodXRsQ3BlVWVhbXBNSCtRUHhZY2tYVEFaR1VoOEx5QUMzOUFjNmJz?=
 =?utf-8?B?ZE5XUDZlTEFsMXo5ejZ0TDNUanlNaG1GdGJYSy9qRXdiVUJYVVk1NnhtMFBR?=
 =?utf-8?B?QlpHcHpNbVI4dEJsN29ZbDNXbUtVZDV1WXF5REtWNFl6TjVUc3VQZmoyMThZ?=
 =?utf-8?B?ODRkTlhzdWQzVlVod3pGNWhUQmhyK25JN2tEZVVhZVd0b2FTUTV6elBzeXNC?=
 =?utf-8?B?RUUzTFJUbExmcHZtc0VaMmNYSXdFTWpoL2l5NnNhUWJnU2RZeEczWVBxeHJl?=
 =?utf-8?B?ekVsbUFqaTN4SlR6RXVpcnhpZk1QS2kvUEU4czEyZ08xVENEREV4c1N5T1FN?=
 =?utf-8?B?cUhrUDhsWHNvK2tudkZNRVdGY2g3RGpKWFRXYWN0Mkh3TVJsc3Y2N29XbEwz?=
 =?utf-8?B?Z0RtTnhQczZMMi9hVFFYREtXUUkwc3d4YndMZTY4MlovS2Q5Rmg4N050Y3dN?=
 =?utf-8?B?MnhOcjJEeUxjNjJPMEJVb3QzdndnYzRUNWN0N3E2VzFZVCtJVnVqSjNWejAz?=
 =?utf-8?B?Y2F6VTYwSnAwbC9oRVc5Uzg4eWJYbnJVYjJFQlh0TllDQkhqdnQ1TE0wejE2?=
 =?utf-8?B?dkJKRlBGeGZrRDJ4VkJ1WENsN0pxV1lhWCtZZ0FXQmwzWFVTYmJZS29IWHU4?=
 =?utf-8?B?VGdNZHFMNE8wQXhQbTdVd001d0hzZjluVWp1Q1JxNnpSRytaMzdOTzloYWFi?=
 =?utf-8?B?RXliOVBncFhwVW1WK01hVGYydFVMU2R5MGhaQklvNkllV0hwN1NldHczRElZ?=
 =?utf-8?B?UDhSMFdvTU02cVUzaWF4MmZOdWdmREVVOUlxTklCeEVnYys5a3YvVFZYRUFq?=
 =?utf-8?B?TGFpSmF3Y20wMzhlRVgwUTVNSC9TYVA0NnBab0hjU0ZXY1lUbGY5c0R5UkdU?=
 =?utf-8?B?bUdhMmwwcS9BdytJQ3hJVDJtdDhvRmFCTmhPanRmYkpDcHJHc2tnVWVkSmta?=
 =?utf-8?B?V0IwVlRXdng3bm1SOEFqMFN3bkpRcWtIRmxoMGlKUnl1RFZjSUcvVWRzNlcx?=
 =?utf-8?B?Vnl5dUtXK2dKQVRacmx6WXY4UG81Y1hQOFgwNUg1bVZCbC9jS2JLZWY4dWhG?=
 =?utf-8?B?S2czUVAxT2o0UlVjZzN4NU42Vm8wdUdwVFk1L0ZuS2ZYVWUxeEhxQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d7aa61-9418-4263-f401-08df1886036c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 08:46:37.3608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: byvgdsDnBPOf2ZLCSp79RCvDcwFN129tT8kTqD//DxUFOL+pazQfWMrdw1t0Y8D84RoRq+iDw0JyKqZ+C90dacLaocJNzkOfQRrHbkU+wkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7078
X-purgate-ID: tlsNG-ebf023/1790066802-51AD0B50-404EDCFC/0/0
X-purgate-type: clean
X-purgate-size: 284

On 22/09/2026 8:10 am, Jan Beulich wrote:
> This undoes the part of 3b0246ea0347 ("Fix ia64 tools build") which was
> missed by e567964a54b8 ("tools: drop ia64 support").
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


