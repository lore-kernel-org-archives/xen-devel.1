Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D4E606A320
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=m2dJk4e0
Received: from list by lists.xenproject.org with outflank-mailman.1494307.1693935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTdvJ-0003gI-Gh; Wed, 18 Nov 2026 11:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494307.1693935; Wed, 18 Nov 2026 11:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTdvJ-0003g7-DQ; Wed, 18 Nov 2026 11:33:57 +0000
Received: by outflank-mailman (input) for mailman id 1494307;
 Wed, 18 Nov 2026 11:33:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTdvH-0003fe-7g
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 11:33:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTdvG-0083mi-JT
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 12:33:54 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6afd8d21-2eae-0a2a0a5409dd-0a2a450bb84a-4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 12:33:54 +0100
Received: from [52.101.85.7]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6afd8d20-b7e8-0a2a450b0019-3465550736f6-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 12:33:54 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH2PR03MB5157.namprd03.prod.outlook.com (2603:10b6:610:9b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 11:33:51 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 11:33:51 +0000
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
 b=ICtDAQOsmy7v2tRoBgI6rrk0oh6bdthjiaDGblT+n61lctGRUmn+RIIQ6Qj90usBSnQpk8eyBQoVbdL19b5QDi975yD0kc7Y6t3T89R9ZK3dwuQI9OywDiK+B6cy2yv5tTRxUAeS4384z4oyfSgwSWpbxVpa2wvwXwVqhZIwfj903OEaGd6eS4+b3ehKC9PwIzA3MaTdMxTZZhbJfkNijoNPBVtFKraRw5MbElMRjoYnscpCl23tH8D7ZREWsLgylbTAaTz54doBj6H+YIcxvPSeNSqZXSW1d8rluW8YSV4RfsBZwAyKWcEKCwMHBzQaLd9EEG4O5BrGoJ5lyFMm4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSUAzgLSzifco2aLwCNpcKKxW9Zn1+5wKPWDUhL9JRo=;
 b=FoIPOPWr2jtZjWeEQM4eAZ7R81bvHyrfPc1hs/e4lT0yq/ziU3qCMsAHjzXEmyfLaHBMy8UhyrGxtnNLy+qhPbxXAQAduC/aK8H2d+VnZz1Cpq0NASNmrk4SQTeq8U/R0M7E4qAC5SJsTyfSyBz1i/ZjC5ADTIL4vqobgLir/rPtv85q3bvHBSeMJdJUiW6KJ4HUWqSYM9KdhUOxxEiB8VFLZetONF3jbdY6/U9MleVPaoA7RdH1KoT3sPC3hDSKJpV32U4Dh15NeKLv418Wd3fcWjwSiaNEBZ39W9l0Qus5HZlkVo/SGHIQcLJtQPtGV9OoCBvI1tW77ZZPKbkUJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSUAzgLSzifco2aLwCNpcKKxW9Zn1+5wKPWDUhL9JRo=;
 b=m2dJk4e0/qXY8nU6jC3MpJEN/6sSdeLD4aulmge6gwrMT15ub6pJbraKp90FnYRpacUOxNsn49Ta/0oBRQyFfRssj3pB2fekOgwfmlykOyHTLAPqFKqQU78yVlBPnOpYJuWxyYm/SIrTwK+PsP81m/BkT8fsOIFkQNLI+hmY6CU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0ebb64bb-2758-46b2-8965-05589d0ed01d@citrix.com>
Date: Wed, 18 Nov 2026 11:33:47 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nestedsvm: Ignore attempts to clear EFER.SVME from L2
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261113160242.695800-1-ross.lagerwall@citrix.com>
 <5c372738-8d61-4673-9bab-d2246e120874@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <5c372738-8d61-4673-9bab-d2246e120874@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0231.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::20) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH2PR03MB5157:EE_
X-MS-Office365-Filtering-Correlation-Id: 653028e5-ed91-43e5-4125-08df4567d17c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|4143699003|11063799006|56012099006|261026140227099003|261022105027099003|261026121527099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	WuqGzAJgiGU69oPjtQGGmqDe8KPsC3lOO0pr4CDf9Vi6GtffgyDBhyZVqdT8xxxezsai8QfB62CIkVk1OwtTT+wJ4ZOCpNOPhjIBu/eP9gAVDpzA/JJ4MBSgLflIuzJ+inlET1vwF6zK1216z1NPfitPiNIF8CdcAL8OkCapTZ2ZFPyfEw0436v1KEamuJzpOMrPJj747qpqxXc65DJhtdBsqjZko2ycVk4sWHvIMKGAUHO+fOm9GYtI46UmMKJvk+dsvt+wGEHuXWpWeisP3zh0UpGpkpWBYprkGqXbcpB6YhXEDg4pXr657cVde9QHR5jvcJmJkqag5KX8CjbZwFcljCMN5MR2Q1pTk2efPuVYM7PNVzzCUkSgT0H6zxmOqoUOy/FlrdqcULs7Iky9hXAQef7Wd8YPZ7HQGH8nlB6xEzOoX6lIGAMdGmgfCBAPo18vbHew7ytTHTl5d52FSmQZj0LykcQqNy3+x8SVBDRpvXoZ++2RleizGNOB5AqaJTs2a/bpQaqmar+lsOrYQ6gcVhH9Syf4faloxU4hB5VR3L0qdvodZIAxas1uvh3JwHO2kkK3q/14ejnL/V0egwONk7LcA9X/P5qAEic0CcdZwSWhADiliEdO0SpJwHKEN/eR8gn/NpHMe1rr1rYgUJoPMnraqMwMoiCDrlKWYAE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(261026140227099003)(261022105027099003)(261026121527099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEdZV3lDQjcyR0pmaVMwMDArdWgxNzdReG1ZbUdEUWVaOWxVaERDd3BXeU56?=
 =?utf-8?B?dHVpSlpYcm1nZXlpYkpCUkhicXVnUkRnb1NZMEl4cmQ5MERBRXFtV0ZWbEZO?=
 =?utf-8?B?dlc0ZVUvYmczaTg2QTZHaDJYc0ZkUEZUSmRZdDJMNVh2bzdlZWFPc3dCMW5q?=
 =?utf-8?B?M0tmVHZKc29TWlNRaWszUmdvNWhkQ21ENTZ0c3FlZndKNDkxdzNDeUFINE5Q?=
 =?utf-8?B?Wi9yMkhMeVlYU3VmeEc4YWEydk9pRWMvMVlnNjVRRVBVb0NMQlVNeXpYSkpL?=
 =?utf-8?B?Wk12RUV0Smd5c1NzSm91UGRxOWlQbjY1bjB2Z3ZqNW9qVkhYV1A5RVVSc0Jj?=
 =?utf-8?B?eWVuaW9RN2RvWWZxZ1E4WTFWaVFEVlE3Rkx4Z3VuaDRKNm4waHkxUmhwZUFW?=
 =?utf-8?B?QklVbnp1bVZDT1huaXp6UzZwdGZTTXlOcEFqMEhNS25HYlY0M05nWFVKNkhP?=
 =?utf-8?B?MDVRNGNVRWVzU1c0clJZK0FteUZwSE95WlhwTXhST0FKMXJMc3N0eWRXWHJJ?=
 =?utf-8?B?b3lxSUhYMWllalRRa3JJZ3c3T1ZiSkpNWVd2YWpCUWJwQ1JYSkxhTkJqaDN0?=
 =?utf-8?B?Yk5JN2YzdXpES0NFOE5WVXpwRDl2cXArNjlNNDluWHJKb2xJWU1WaDhDR2Uz?=
 =?utf-8?B?LzN1cmN4NXlXTEpCQ09NNjJ0YUVIM0VrVXRZeFBkaEltclZkaXJDZDJTWXJC?=
 =?utf-8?B?Vmxmd01Mb293VEp1aDJxZ252Ung4RWo4VXk1a1YxdjBVZFBnZ2REYmVDWVM5?=
 =?utf-8?B?UlduZGcrSitoY1FSUnBIai8yUDVYeW82Q0hzall2TXlpejRlUlVLS0hrUklp?=
 =?utf-8?B?UVBPMTJFMnhSckZUWDBIREJlQVRqb0NORWZKQVZhOGszSy8wZ3FtQ0RVaEhR?=
 =?utf-8?B?V3VOSUNEVDcyK2NpL21NMmFKc0d3RS9HTml1emxIYUtHdWVDelRmRlJkd2dM?=
 =?utf-8?B?Z0Q4bHFrN3RpKzhMb2x0WDBmK0JuemFKYXByUmlSU1VLeURoa01DMzZWT0tE?=
 =?utf-8?B?dHREUXNNRzdGMW9VcEdiVWdVQ0pSUzhvNzJ2VUJtWnJjUmQ5aW5zMFNLeFN5?=
 =?utf-8?B?SEtBeW9JN2xNUnRjRFVCaFcyZlFxNVhMVVl5KzZGQTA4eDJpNFAyQUlCa3N2?=
 =?utf-8?B?YStFM1B2M0w1MW0xV1ZYd21adHZEWXd2SjArTTRvcG0xdjFzOVI0SzNMMWJj?=
 =?utf-8?B?SC8vNE92MXA1anQ3akhmNzZWQVJzYWxLMVBvMEgrem1IYXViVElZOFZRVEU0?=
 =?utf-8?B?aCsyRnpHKzFPSDZSUjlYVGdQZTBzaU4wb0dSVUt6cjJhZjY2S1FhWXRka0Rl?=
 =?utf-8?B?S1B5S0JBUENFWVRTd29EbHJWOG1ibk9oajR6ZGI4bFRHNmpLQ1JtMm5iVnJB?=
 =?utf-8?B?RkZ3UUlRVUtZTU9pWXRpUUVzTW5YUUY1VURjS0lsOWxSenlkSWJaTnNSZTJm?=
 =?utf-8?B?aEVpT2llS0RWczBVd3JubzRDbUJlNHIzdUp5WElxVUtLSzg3UG1ueVcyLzhY?=
 =?utf-8?B?eGQ0a3gvSzVCYUM1ZWwrdW8wSHluYXh4Z2dpNENKckl3SC9VWm9LRnk2MGlX?=
 =?utf-8?B?R0V0M1FXajJMMlNONjNldHFva3ZjWVpFcVdTQ2lWM0s4K2k1MDh3YjNvdXlS?=
 =?utf-8?B?SjZzY2UrNWV4UndDMXpheXVONXdpRWNNdHpmUTZOUmt6TThtQ3dFSWdSNStx?=
 =?utf-8?B?MzR1UlRidytoSUwvWTNLZ1FOZ3RnWXZtMllENUc1Ym5BWXJUUVc5RG5JMG1l?=
 =?utf-8?B?d1BmTms1Y0FHUzh3Nk1IeEpaOG90M08vb0dZb2NSNDJ4c2NMK01OeEl3TXh6?=
 =?utf-8?B?dWIrUnNFODQydHlkU1h0dE1GN0JuRlFvLzBxaE0vcE51eGdrOXZKQXR5NDNJ?=
 =?utf-8?B?VnJDcmxCb2E5ZVV4L3h0UmhwZ1lFdjR2ekFmRFd1bXV2eVdKN0tSWC9CSm9O?=
 =?utf-8?B?THZyNlhqcEJ3TXlCY3NMNWRjWnBCN0VROEY3TkV0MVRWQTdyTzV1Y1Y4OENq?=
 =?utf-8?B?ZUkzY2NkSE9SQjhORDFUR25JNVdwcHREVWNpWmhOVUNXdWhhNUZzTUczUHhO?=
 =?utf-8?B?OFhUb0NxTkltQlV3NXpMZGhTN1EzK1BUSFQwVFo0WWthY0M4YmhNQm8yeEgw?=
 =?utf-8?B?bWsydXBNamJnMmRSa21JcUVmTFc5aHlJbHlScVFzVmNleGRXYXFCSWhtQ1Js?=
 =?utf-8?B?dzlOSXBEWmR1R3RYK2JScTdwUEhXbUhyUDYxdkZHaStNUkZTUCtTajh0VXlk?=
 =?utf-8?B?Z3VIMVVJMjNleE51bWY5ekh0MDR1QXFwQzRXOG9uNEVIaU13ZVU2L2FrUFQ2?=
 =?utf-8?B?cUtJelREYXNGczRFVWQ5Z1pZWjYzQXpicUZIMDlBTDF0Qnk5ZzdiMFhWcXY1?=
 =?utf-8?Q?N8U6NqqyJLlcUy74=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653028e5-ed91-43e5-4125-08df4567d17c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:33:50.9198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FS/BItGXfxpVS9/UGpKG0wNG8yidRqlTP7LPR2rTozyx+EYGKx3hXFQmEWvtJa8JRtFFqcvLXbhy5pYL6Tzp0wtZQEc1+wHUQ654gN2Wy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5157
X-purgate-ID: tlsNG-42698a/1795001634-A88C99EA-3739C709/10/78276251493
X-purgate-type: spam
X-purgate-size: 1432
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/16/26 11:34 AM, Jan Beulich wrote:
> On 13.11.2026 17:02, Ross Lagerwall wrote:
>> The APM leaves it undefined what happens when the VMM doesn't intercept
>> writes to EFER and EFER.SVME is cleared. The current implementation in
>> Xen resets the nested state without doing a VMEXIT which is unexpected
>> and may potentially hit a BUG or assertion failure.
>>
>> Therefore, implement the same behaviour as the APM documents for SEV-ES
>> guests; ignore the attempt to clear it.
>>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 

Thanks

>> ---
>>
>> Another option here could be to fail VMRUN if L1 does not intercept
>> writes to EFER. However, this wouldn't match the behaviour of real
>> processors and may cause incomplete toy hypervisors to unexpectedly
>> fail.
> 
> +1
> 
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -2156,9 +2156,15 @@ int hvm_set_efer(uint64_t value)
>>          ((value & EFER_SVME) == 0 ) &&
>>          ((value ^ v->arch.hvm.guest_efer) & EFER_SVME) )
> 
> Unrelated to your change, but: What is this? When we have checked that
> SVME is clear in value, why would value need XORing with what's currently
> in effect to figure whether a 1->0 transition is occurring?
> 

I agree that it is unnecessary. Looks like it has been that way since the code
was added.

Ross

