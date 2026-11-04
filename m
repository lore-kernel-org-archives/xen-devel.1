Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093F8606A332
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 13:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=Dt+/PHNe
Received: from list by lists.xenproject.org with outflank-mailman.1471882.1680011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOb2G-0006od-8D; Wed, 04 Nov 2026 13:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471882.1680011; Wed, 04 Nov 2026 13:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOb2G-0006oV-4O; Wed, 04 Nov 2026 13:28:16 +0000
Received: by outflank-mailman (input) for mailman id 1471882;
 Wed, 04 Nov 2026 13:28:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xOb2E-0006oP-UJ
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 13:28:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOb2E-00GrCE-4Y
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 14:28:14 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6aeb32e8-e002-0a2a0a5209dd-0a2a450cd374-26
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 14:28:14 +0100
Received: from [52.101.69.83]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6aeb32ed-f479-0a2a450c0019-34654553f6e2-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 14:28:13 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DU0PR03MB9542.eurprd03.prod.outlook.com (2603:10a6:10:41e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 13:28:11 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 13:28:11 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpM/l77s6jUROToJw7RxbhKc+xy0UDv2q47fJswSCZ0hDzCRGPcSl05/1NNiDzMWzXMXpd1JPp5+B+ElulI9C+AZc9fU8b/WF93rd+bMEp8kJOq7GcypI6P858Lq2VefTD+NT5o3I0jJJ9n2+e26Y0aSl3dXzIOD4JR9Mw3xnzy6Yg2AJDaQH7l8LIUpRggKkQTTxTyIaXKTIFFU8wiLvVY/L/WLn2Ys1sq933jUoOS1iU4SDBnpklR+sszaEEi2duMfuUYQdn9GBY1l2YKVGrqsi+H7KXmyNksZA355m4HBDr0ZW1xmgJffG97r0D303EIr7cmq6yUuTsagK+sVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIdISH3GrjazHmecmvBpMjJGTcsxz7q0z/8VV+GeRNo=;
 b=Nm2WOeFT40ePf3phA6vjRWOk9ySliaZCH3kgWuMzjgH3Jnh6jT0STPB6tFtz6txCzqPwjdU5kpikoqJlCRJG7jKVF9bMMbJRhVgAJ1TkPBtOXFWbyO+V+UBgMaCRryLKHO1L3f41OGMBZb3KW9mE30PKvScVyK4ZO5qqicW2tInimFweWJUOmhRVR+lWBeEYKAHrTiAlp/XUCS8wQSHs2lLYH7PP62F7oxQwFbZ4GYRs+lQK9d2uL9QJrmAfe5jPEvxo/2+x/Z+XEw7ghDYhjT4FAv98bYXHetb2+psyMDKNKVSZkmDraiZiW2lEP3BQCeb75SRLt2nwdAbGr1Lmdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIdISH3GrjazHmecmvBpMjJGTcsxz7q0z/8VV+GeRNo=;
 b=Dt+/PHNel+jhzX/xnpSTlkfiZMwibRK+hCVV8K89T0FkNSgFS08coDlnb0B3c4jxD9eeFnpc2xXM7qQxzIloihrOSXnrcgrmZT5wnxLA9JfaxuMUtatBeYb1oEGcf/fTqKIuXNRG9PxMDPnYLYZF7tQbscFg2hy52V1ShhzZhD+Eus57rnoF4LNJTbKWZIKqK/MEF8GJccGyC+eydWFR097hzO8V846Cwnvo67ERfTSM+KgxYPDcrvupXNqjumNroe2tTpssGLdLDdRL0LD1uTluYtNex6VuUoMjS8lckVZgcBUjwRuIoWt9FLhShFwDsp3vnvzjVKdC4VpdZawkhQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <7ce2c3c6-f73c-405e-adb5-e8a2b68427f9@epam.com>
Date: Wed, 4 Nov 2026 15:28:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: deviate MISRA C Rule 10.1 for boolean operands of
 arithmetic
To: Jan Beulich <jbeulich@suse.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a536212d9cb18b5c23d06c1c06b9a8ae03941440.1792428626.git.dmytro_prokopchuk1@epam.com>
 <83187933-b4cd-46df-b428-368d6f71cfaa@suse.com>
 <dd2f093b-4151-4c42-ba7a-c7b1ce96e02d@epam.com>
 <929b051d-2735-4d33-9240-fdf13355c11c@suse.com>
 <fddeac51-52fc-4ab9-bb24-0b3b33faf07a@epam.com>
 <6cde35ac-186f-4a9e-bd66-71b752582a21@suse.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <6cde35ac-186f-4a9e-bd66-71b752582a21@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P251CA0026.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::15) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|DU0PR03MB9542:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d2a3c93-c571-41d4-1e36-08df3a7778ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|18002099003|22082099003|4143699003|261022105027099003|56012099006|5023799004|11063799006|261022113327099003|261021121427099003|261026121527099003|261028144727099003|261102123227099003|261026140227099003|261009223027099003|261009221227099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	l+LBds9iD834yLy+II6dqjWxrWzDDW7Ql13CggfTkWBH8/CMvy97aSJR8dnW+ouL1UIOqMTL3tv1KAsprxckH8Dja0JkC5QTXTjjebXufdyJuNUIp9R32cbune11EbiP55jqTRlnGx2G21XIJO8KPsoyG8KZcElxSX7XmW/W63kD4adwdiJqomoUzK5Qlzo97mPKD/Nwwv3fJLYZOqzDacRuI6MyIirI7hoDSWNffJqHieOuJ0x2cH3oYoOrP8n7jFDyO4hkawExoFnVsctkUY8hFrpf7CqpHElKbfXc8vHt9rthUaAnMsLBfqEBZuONnDVBMvsLlGsbFIdDXMWVjDVSDiRCS01XMYoA2WVYJjzpxQ7/YmQys0BtSq7u2ibx86Ing0kgt7/J31OIATncPYQ2Sq7ptPYPGH/Lmm7EvGt73q5Igc6mkWHSZiNEiOJkAp5doKVI8Ap3mKy6bdTmko2OR5HxoD0LXvV9gywlwJ2aLRGSLWMbmSP/ZDKQSthQVXcyfGYSco1uwGAb5BYcZCYivlh1oCvHP73tzh2yCeTJz/1N9QHM41/q7Ir6v+7D9g42/ZhrMjm8wVTRUuJMyhTfpdWqOzvaLSEZrcshphW1mB7LBLectbTBG8F1X2nnz2zBCp9BfRGy0jMzMqeZ0H2RQh49PSwFIZPh0G80gpA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(18002099003)(22082099003)(4143699003)(261022105027099003)(56012099006)(5023799004)(11063799006)(261022113327099003)(261021121427099003)(261026121527099003)(261028144727099003)(261102123227099003)(261026140227099003)(261009223027099003)(261009221227099003)(261022075727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHN4ckRoVEFDZlNrb0ZBYTFWQmVxVy9FU00vczhBWkRHczEvak45WkN5dGcw?=
 =?utf-8?B?NlIrUXhORnZSc3E4MXVraTZVVEgrY0JCRWtzSWdmUzZaaWlaU2tiUDl3OVZz?=
 =?utf-8?B?V3ZKTTFDVEh6N09KSC9UdlN0MTdURk1qUjMzdVNEdVdDdjdSL0tQdzBHVW05?=
 =?utf-8?B?bmJjL1I1Y3ZSdlAzcjhtMWt0QlAyUGNjTDFzTnNHK3E2K0dTSUNyakNIMEVj?=
 =?utf-8?B?aWZEL1dhVDN5eEFRYU8vb2ljU2lnc0xNL0loMWg3VVR3K3pqdGY1NHRnREcx?=
 =?utf-8?B?U29OTUxsQ2hPK2xtZ1hXbXc3UC9FeXJVK015SlhFVUtxVXl5MFN5SE1ac2ZR?=
 =?utf-8?B?WW5xUWxyREMzbmljVzdnSG0wOWJsQm9STWdvN1Z0TmZibzNiK3ljdzNBZXVP?=
 =?utf-8?B?V3VvRDdhQWMzZ0JGZ3VrZzJDMlkzdWR4VkZtU3BpRnlFMHNYRUhrZTJEV0xP?=
 =?utf-8?B?VFArZUEyZGxTNWZIY3pEWlNvNldpTDBiSENWbnBKVEJOMS95RVBkc3ZlbzAw?=
 =?utf-8?B?RW02N1JqNGI1Wm1FU1QyVzU0eFkraHk4dkE4czZqTlFFMTRXb1MwclZqRWdk?=
 =?utf-8?B?NjNUU0x3bzRXTk5xRysrWXpEOFI1b1haQ08yUkMyR01mNm9OZm1DWkt5U0p4?=
 =?utf-8?B?U2lZbmtHTWdNRHJVamlCT0dDdEtnSlZYb2xsMm5ET09uQUNMN0gyWnZGNEVM?=
 =?utf-8?B?eEMzc1V2ajgwNDJyOEtIbzIzc3JDNVZiem9VTTIvNWUrZ3VYVUdDeGQvODRk?=
 =?utf-8?B?SHQzcnZrNWdEQVlWU3BRMHpMNlgzTXFISzhxcWVVd3dTZ3U1UVBZS0F4L2JL?=
 =?utf-8?B?ZUpIZldFL0JLNjVPNXRFakRsRm9acEpMcVpwVUk1V2srSWlRa0dQZ2JjcEo3?=
 =?utf-8?B?aFAxS0hOUThETkhnak05V3ZTc1hLbzlGLy9XWGtMTlJmYnhNWEpFSWJxYnUv?=
 =?utf-8?B?Uy84d1VtcXprM3pyRml6K2tvNGhRdWFKYzVCNGFYRmRDbkszSlo4SG1FY1J5?=
 =?utf-8?B?dkpyaG1IUERoWFBWSWpJSWpiTTdGRE5NcEN0cCtneTZXSHpXU0ZvWTVaMldi?=
 =?utf-8?B?aTk0YmN2L005dFBoWUl3aXRKQXFScU5GK25LWTFBelNaMUpBbUVORTN3ZGFP?=
 =?utf-8?B?YTZLMW9XRDRBbUV4eld4WlE5Y204aXQ3aDlkZEtpQlRZcXlsWVdyZVdJYjFa?=
 =?utf-8?B?M2hNaDdLaW9FSG1BQXoxZ1BYSFkzdUR3R1Z1ZTV6WXlYYlIxeDVFYnEvQWlw?=
 =?utf-8?B?QTAzMk9GakdPNGVNblBPWnRRK3JZZjB2REZTTWZ0ajllQWNTTUYyS3NQUmE2?=
 =?utf-8?B?UzhUVHk4ekJEdGdqNnlRVlYzSTI0NVVIaEtNdDhnN2M1STFOS1RyaHpVbU0r?=
 =?utf-8?B?bk9GSnZDVkVyS1RJYnU5ZENxaVphZ2Z4RHBEOGNWTU5pSjRZaG9zWGkyS1hQ?=
 =?utf-8?B?eE0xeFdScUtFYUU2NUFVSllLcUhLcVpuekN0ejh3R3o2NVJQQjF6c2lWa2NM?=
 =?utf-8?B?blNGdGpWd0MvT2hIb2dDNHVmMWhqcVRJNjVnMk0zR3Njazk2bFZVSFVxTVRt?=
 =?utf-8?B?b3phWW5TT3N4UzVVTzVRL3FTNXlCZXltR2tKT1Yvanh4VU0rM0NTNWhTNDlG?=
 =?utf-8?B?dlBqd3llb0tkcDVrb2xBNVFrdTNlaTZzTHJCMzZId3BaYi9hdXVtYmplTEN2?=
 =?utf-8?B?NnNUSytqWVkxOS9zQ1IxR1BLWjRMbWVRM0tKVFBldUJPMFc2ODVEV2pqMVM2?=
 =?utf-8?B?Q3d4V3dsYVBjbE9KQy92L0pDeG8zckVqMU16cWoyaDJHNkJJc3hSRzI2YlQx?=
 =?utf-8?B?M2pvdzNaVG8vTmVPZ2kyeitJWEJUNUNQM1ZyUzVDenVtMkpmQTkzYzVMVG8w?=
 =?utf-8?B?V3orRjN4VVZOSkZ3UnQ5YUFKOEJnci83MUR4ZFByUDlTTWlBSUFldTdOeHVj?=
 =?utf-8?B?bkJVci9qYmU2VWRLMFJxVEpkcFRCajJPemZtU1E0bzRFb0NnNmRwdGFpeDFm?=
 =?utf-8?B?alBMQlZhVTk4U3Fsci82SGJkZnFKUkRlcjRaalZ3M01QMmxybTNrbnhuSk55?=
 =?utf-8?B?Uk9xQ1F6ZTg1MTcxR1o0UnNaeDZsMXpaR0sram10a2oxREphWFZwKzY1NzNs?=
 =?utf-8?B?RGVVbFEvSXpBVHNnajVRNXZCcFNsVzZhYVFkWThuR2VNVU9TNHpwVUZKY1Vn?=
 =?utf-8?B?VDdYYlpBVVVzSUR1NWR1eldYUU0vdkcrM3prVWF3NGlSM3NFRHBISXdiRm5w?=
 =?utf-8?B?NlJqeUdzbHB4WmE2TU12cUpUUXUrQUhXelpNSTd1UCtnOHV3M28zRm5OcEsx?=
 =?utf-8?B?QlJFTkFxM1kyV3huOCtMcU9ybFF1VGk1Q2NWUVdTeTJFeVdZZkJvVEdyWHRH?=
 =?utf-8?Q?Epi7DphaGTkGyv5c=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2a3c93-c571-41d4-1e36-08df3a7778ae
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 13:28:11.1953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eO3g58YoLW4m2HhQysKCseQrs/W/WYDYCOnKIrE+UfvQMq1nw1UoXwJ/txAv9u4XX2vtd2qGbmXt6alw/PHNpWJB/5LbZClt6/HsHEKKc6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9542
X-purgate-ID: tlsNG-d25034/1793798893-002F0A5B-1DC86522/0/0
X-purgate-type: clean
X-purgate-size: 3055
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/2/26 17:45, Jan Beulich wrote:
> On 02.11.2026 15:43, Dmytro Prokopchuk wrote:
>>
>>
>> On 11/2/26 12:52, Jan Beulich wrote:
>>> On 02.11.2026 11:20, Dmytro Prokopchuk wrote:
>>>> On 10/26/26 13:13, Jan Beulich wrote:
>>>>> On 19.10.2026 18:54, Dmytro Prokopchuk1 wrote:
>>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>> @@ -335,6 +335,11 @@ still non-negative."
>>>>>>     -config=MC3A2.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>>>>>>     -doc_end
>>>>>>     
>>>>>> +-doc_begin="The result of relational, equality and logical negation operators has type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5),
>>>>>> +so using it as an operand of an arithmetic operator is well defined and well known to all Xen developers."
>>>>>> +-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(add||sub||mul||add_assign||sub_assign))", "src_type(ebool||boolean)"}
>>>>>> +-doc_end
>>>>>
>>>>> Why the restriction to add/sub/mul? The text ...
>>>>
>>>> Because this is the pattern found in the Eclair's report, and it can be
>>>> deviated safely (as opposed to unary minus, division and remainder which
>>>> are not included intentionally).
>>>
>>> Division and remainder aren't very useful with boolean operands, so can
>>> surely be left out. However, more generally: How does "Eclair's report"
>>> matter here? In deviation wording we want to go from what the Misra spec
>>> says. The spec covers all operators. Hence any special casing we do
>>> wants to be justified. And, right now at least, I see no justification
>>> for restricting the deviation to just add/sub/mul.
>>
>> Agreed, the report shouldn't be the argument.
>> The deviation should cover only the established idioms with a clear
>> meaning, and leave the rule's protection in place elsewhere. With a
>> Boolean operand these idioms are:
>> - + and - (and += / -=): "count it if the condition holds",
>> - * (and *=): "this value if the condition holds, else 0".
>>
>> Other operators have no such idiom (at least, I'm not aware of them).
> 
> The use with * easily extends to <<. With that it's only logical to also
> include >>.
> 
> With + and - covered, it feels pretty much natural that relational
> operators also want covering.
> 
> Once there, and with division and modulo agreed upon to leave out, there
> isn't that much else left, I think.
> 
> Jan

I agree these uses would be equally well defined.

My thought is about deviating them without a need. For these operators 
there is currently nothing in Xen. Without the deviation the rule keeps 
protecting new code: e.g. Boolean operand of << would be reported and 
looked at, rather than silently accepted.

So I'd prefer to keep deviation limited to +, - and * (and assignment 
forms). If you still think the wider scope is preferable, I'll of course 
go with that in v3.

BR, Dmytro.

