Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBC8C79FA0
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 09:27:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411221.1641920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3s6V-0005oN-To; Tue, 08 Sep 2026 09:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411221.1641920; Tue, 08 Sep 2026 09:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3s6V-0005oG-Qw; Tue, 08 Sep 2026 09:26:59 +0000
Received: by outflank-mailman (input) for mailman id 1411221;
 Tue, 08 Sep 2026 09:26:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x3s6U-0005oA-6f
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 09:26:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3s6T-003LQY-JN
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 11:26:57 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9fd4db-e002-0a2a0a5209dd-0a2a4504b176-38
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 11:26:57 +0200
Received: from [52.101.62.6]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9fd4df-b57f-0a2a45040019-34653e067d64-4
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 11:26:57 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by LV8PR03MB7376.namprd03.prod.outlook.com (2603:10b6:408:18b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 09:26:53 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 09:26:53 +0000
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
 b=j8/lBlIEjayLSegD7LL5zfUp9GIM/aRy/qo/uBBUFPvY70InDJEdQIXTs2KgZSt6C7zjZgHkBZBgoYvUIWOU8uouCvJJ5Q3SGWPIllQcNBwdckUokhLl6W98YYN0OX+WCAY8k+Uyj19NafZEMLbdbvo6y2NUVw8auLVOtYv/GN5FfEsJDbzBYxrLD+/q1jn0itnWLNKQBcdJI6YUcD+YhEWcPQ3yYRoObHVhC9FKs6hq8uBioq8OVstU8oh7vBqtTe5BwEHqlLW9KMfeGXBrnwXhV+VOn6h70qI8/FGKezcLQuprul9l4GXRjVXvl1QRQTKpuPNPLeGhOMAYby/wiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XG3OLYfogiIpj1NnZTtoGu3tcU7fDM3bO+5n2zd3SYs=;
 b=h4/EgOJTHyUH+j7KkZmuZi5K9WkACmrgDWvLPTaWzYFODEk4D9ZdiUqkBuG1rCYHmXZpImeXzx1BZmYfuhZ5WBRsD2ETUClbf8biIfWO4HgRUQ+4KUGmWSAfGWniGg2CS2jLZR+9hpw/06uwFYbyI21qbtbkEw1O/Wja3R40EPj+Shq9YqV47SH544VdKJZI7rRh1HFtl7UF8sc0uRRJ0QeffnOtx4etGWIjFH7YLynMK+xabTwwgshRziNW/uihhPHtwwywLEcJ66FAyQ063kBvI0AkpfANofd8QE9kIO8KjOEB7w+cPlcEYPFFyDf0muSBHVIU+uaxrLBR/NmGKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG3OLYfogiIpj1NnZTtoGu3tcU7fDM3bO+5n2zd3SYs=;
 b=yg5hEKmvu2rFkdD1XW0TO0KwADGbHyQ4rJEX1xfycQlZDlHXHyAJrvTRZ3ya0NEp4tNYbyPbBAzHX6yJ2/Ovtj7QD9c1iu5wekToup1mRFroM6WTQ9Th+r/UdBc0mmZBbK1W6LTIwRZiuKEiAC2FbCMz4QoVzYebWCuxXdI5IzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3b899e5e-b434-40b4-a87c-0a4984462689@citrix.com>
Date: Tue, 8 Sep 2026 10:26:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/viridian: Workaround Hyper-V GP fault writing
 to MSR
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20260904141516.367862-1-ross.lagerwall@citrix.com>
 <20260904141516.367862-2-ross.lagerwall@citrix.com>
 <aprbab18qnndUhnM@macbook.local>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <aprbab18qnndUhnM@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::7) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|LV8PR03MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: c92e8efd-9a6a-425a-f4d1-08df0d8b51ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	k9tglt9ivsnnD9vTvH90CLeIqkMSsSGZHZHAsEv7PBYQA68ydBZBOLKhS1pnLAZGyDiWCVsg7xJOGNg6oY3yMvtoMvWoSt9Ng1bWtNwlKsR7K1WyoD1nFb7cNGejGebapQ386ovcYRTk8oqqIxPaTqAbvLIuUQueZMpIwKoPWixgXSc1JxFWA4hTHCU88dcp0e0HHJgIVoqUtrIWZVZxVG8qW5NH2v+Bdzp8Wn6L4+lV1XS3Erfa5Wuj+CCzIvZ0uE+moA/7ehDt29bmt9Ht1aeAuKSgBZLoYGyN3KyF4v0oBGrlPqTh0I8WTzqmsM2B2jgcyiXkVXH0jqlctM5WPiW0H8TdX6J2LSgpiGW/F6iqm2AZVI65Ca8gCDHucVHJYpNksETdrb438k52lNVyHsXoz5TbHxxifk6SsnvnFoJ3AbDSPnP31hmJnhb+MMxZQaBCWBWqirX4286p0sX9f0DlJHPNgGUMo0OCUTTCHxjmUoTGgN+T2g4KVfbqndyn5vQRQ30eWN1DARY9/7YJUBhEErUJ8lmALKTJdrmPYJhOsZAW63+zH63VkjiJ4FajD+DHRwpVtdBFZmNH0z40lqkGxcR/2kKfcpFANeM/7tKbxIg1q0AL1qtYxZVAazB630lIrz8PFD8a8zjlyvnWbA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anQ5RzAvWEYxVUdlUFk1MnByVE0rUm1iWS9NbzNjVjMza0kzVldoZXNvNmhJ?=
 =?utf-8?B?amZxdUZWQ2d3N2NzbURib29qd1NTVStBZGl5dkdjSXNDUWNhUEFSNldnNlRx?=
 =?utf-8?B?TEMrKy9nNU0zaU56S2ppMDFFUytlajlreFUvaVR6ZGFvQm9HQmdpUHZiU0kw?=
 =?utf-8?B?VkRWSi9Sc1VWclY1VHVpZjg4N0FVZ1lpRWpYdGx1VlVQT0NOZ3FKTnVTbCtX?=
 =?utf-8?B?dFZaY2pSckhMYit5TXBVTkFtYS92OEdZeDgxandYUWExQk4vOE1vaVNONGRL?=
 =?utf-8?B?VzBpQ1N6M25NWVR6Q0M1dVZiZEtaU1EwRzJwN0NqVk9RcVBYODdDS1Jic0s1?=
 =?utf-8?B?aTU1Z0NoUVoraTZVY21yeEkwVGpJaGNrMEF4czVEY201UkxOU0c2WUZQY25r?=
 =?utf-8?B?VkhqcVo4bHFoNkdLak5QbGRlZ3RsdUtDQm9WRDMxWlp5cisvZU04aWhjK2Y1?=
 =?utf-8?B?eWRBeUxwYUk0R2UvRWJzOEROV2psUytvL2U4MEZ6NWVGSW5KS0pVR2pIblVt?=
 =?utf-8?B?bHdlS3ZEaEJZNUkwMlI5RnRndmNWZHBHNVVoMjRDTEJiUVdMOW12QjdaMU9Y?=
 =?utf-8?B?eURFMnJJK2doREJYdDVIN0IxYUJabGJUSGF5Uldpek8wVzhKM0huYmFyZ3ds?=
 =?utf-8?B?SmtIVkFwcXF3b0tDcVlqSVE1SzJHTnpKVHo5SEo1RWFZL0xoNUtnR3ZXYXhu?=
 =?utf-8?B?MSt3ZlhWb3FKVWlMeFU1SU9aZ0tSQWJncVRVVnBBV01OaTl6ekJ0ZGJYYktO?=
 =?utf-8?B?S2pFcUpXS0g4SVRieENMcXEwSEJSWEdWVkZnWDVwNlJjRmhsalpJNGJ3WmRP?=
 =?utf-8?B?MXo0Q3FUVmtZNCttMzRscERlVzVMRENIVHcxOE9XY21kSElBZ3lTNUw1UlVo?=
 =?utf-8?B?VGpnR0hpNTB5MEpQcHh1eEtGK2Nxc09rUVU4TkEzeVhEWlJWcXdIUE1SV1dS?=
 =?utf-8?B?VDk0OGdrem9zTkpheENpWndwU21IblRiYUJ4NFJUQXA3cmJPRlB6R0JpY0Ju?=
 =?utf-8?B?SElHQi9oNS9GbXBNMXU4a3ZRV0cwcWZNVzFBL0YraGJ6U1F1WGE2V1lKeU9M?=
 =?utf-8?B?b1FlTzVPbllrZURXb1JxVnluM3RyYUNwWlBjVlI0L09zUGRBRnZ3SXVxeGVa?=
 =?utf-8?B?bnBMQzhoRmg2UDAvbWJjTlhlV3UvajRKL2M1WVBLZU5zcSsrVmo3SVJjdGp6?=
 =?utf-8?B?R0p2TjFSTms2aVFWNzhUc2Z1TWs0cnlPZm1UeHF0eTZudnBpSE5EUzZvaFpW?=
 =?utf-8?B?VXZCWHkyVWs4YjZlSENPV3FGNXFrbDloOWJLdjhMZXV2bHhPa1QrczhvOVNS?=
 =?utf-8?B?UU9tdGsyMUJUU0Q5TjdYN1haL2pNcDBUbHBRSlF3dmZaYlZaNFZsSW1WakN1?=
 =?utf-8?B?MTFqU05DNE00NEVYZ3h6Wk53V1ozUnVkdVR6Nzc2aGJDQ085dFpLK2RYSEpU?=
 =?utf-8?B?NzdFSzc5bjFoekRFc3hiOW51V2FqNU5FSFN5NmhOMFdSR0k4U2pEa21KUDJR?=
 =?utf-8?B?bTlEcUl6U0dZQ1ZJZXZpcWFCMDhNR1h2WGg0RjBmMzA3TU9ucDBZMjBQRFp4?=
 =?utf-8?B?aXloOE9zSTBIWDI3MWNqa0JSYzlEOGVKMWpLS0NtaklVK0FRdTFrWEw5aWl2?=
 =?utf-8?B?T1g1TVhvUFNHbmxmejNuUk5BblQ5NDJEZkluQlF5RlFYR2RtWGV5eU9TS2w2?=
 =?utf-8?B?VTFIbkQ4ZGd3STFybGw2MHhWQ3RVRjJkN1ljVXZxKzNick1KQVVQWmttdmth?=
 =?utf-8?B?Z3d3MWtpRkF2SWJDTDJMOFE5Y0dvREZMZVhUajhyUTNiR0krM3VjSFhBbmE5?=
 =?utf-8?B?WlNoVDBjN09UaW15QVo1MENtdzcya3k4RzlhU25VT0JMNEJKaUZuMUVpT2lB?=
 =?utf-8?B?Z00zOTkxL3I4dkhNT1gxV21yU3BJVGxFVXl4WC9RY1E2THN0dll4SlFxRzVB?=
 =?utf-8?B?MSs5TDh3TzhkeVZiT3BnQ1JJWWpDM1lOYjJ0ZnI5azU1MDB5b3duL1ZaSlhC?=
 =?utf-8?B?Ri9ub0tiNWJHeDYzYnoxVU54SVdEOEE2SENzanZJeTkrZ1NkdjVwR3Y2SnRl?=
 =?utf-8?B?WTN0bCtPOGdiWEExYUdPTnR5SDZsb3drcCtWN29UbmowbGZHUldFeGtPQXdh?=
 =?utf-8?B?RGZtUHkvWWFhVDhtRm9hODJ6RlJUWjNSbGwxWE5iQlcrQSt0cnM5bjJOZVhZ?=
 =?utf-8?B?b3BoRUxXZVpOeVVSTHN3bHBxbElUU0dvNW13ZUl1cmM5cDVsZ0xYUkxwVldk?=
 =?utf-8?B?QnRxQ3BYWlhvZVdpWVhuc3FBKzFDMlc0VEpwUk9iSDhoVDQ1SVlKZWVuWlpi?=
 =?utf-8?B?cXJuTlMrM1JsdWhFaVo4MXlUVlMzVmd3d3BlMVRNYkJDR3hEOFR3YVE5aDU5?=
 =?utf-8?Q?4dx+y2oR22VBzY2c=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c92e8efd-9a6a-425a-f4d1-08df0d8b51ab
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 09:26:53.3632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsMz6SqEnuyYEMnR9dnI+/RyGf3nDbuZc3yaYBHwmmbl1JH5NjH/YGYj3AtuvZZZTlmdivLsvfMnkcc6S9wTUhJkD71hk4/gcRXjdxjRKtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7376
X-purgate-ID: tlsNG-ebf023/1788859617-585C7B50-A659879C/0/0
X-purgate-type: clean
X-purgate-size: 1736

On 9/4/26 3:53 PM, Roger Pau Monné wrote:
> On Fri, Sep 04, 2026 at 03:15:14PM +0100, Ross Lagerwall wrote:
>> The Viridian spec requires the vector to be >= 0x10 when writing to the
>> SINTx MSR, otherwise it should #GP fault.
>> The spec-defined initial value is 0x0000000000010000, i.e. the vector is
>> 0. On startup, for some reason Windows 11 Hyper-V tries to set the MSR to
>> the spec-defined initial value and since the vector is 0, it GP faults.
>> To workaround this, treat the write as a no-op if the value is
>> unchanged.
>>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> ---
>>
>> In v2: Added a comment to clarify
>>
>>   xen/arch/x86/hvm/viridian/synic.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
>> index e6cba7548f1b..75b004440e58 100644
>> --- a/xen/arch/x86/hvm/viridian/synic.c
>> +++ b/xen/arch/x86/hvm/viridian/synic.c
>> @@ -157,6 +157,14 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>>           if ( !(viridian_feature_mask(d) & HVMPV_synic) )
>>               return X86EMUL_EXCEPTION;
>>   
>> +        /*
>> +         * Windows 11 Hyper-V (26H1) has been seen to write this MSR to
>> +         * its default value, despite not being a spec compliant value.
>> +         * Tolerate writes which have no change in value.
>> +         */
>> +        if ( val == vs->as_uint64 )
>> +            break;
> 
> To make this a bit less workaround like, could we ignore the vector if
> the SINT is masked (bit 16 set)?

Yes, that might be better and it appears to be what KVM does.

Ross

