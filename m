Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EFBCCF2D3
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 08:03:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1453986.1667445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIiKH-0003Z6-Bz; Mon, 19 Oct 2026 08:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1453986.1667445; Mon, 19 Oct 2026 08:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIiKH-0003Yy-90; Mon, 19 Oct 2026 08:02:33 +0000
Received: by outflank-mailman (input) for mailman id 1453986;
 Mon, 19 Oct 2026 08:02:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xIiKG-0003Ys-2s
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 08:02:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIiKE-002EVY-M3
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 10:02:30 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ad5ce8a-e002-0a2a0a5209dd-0a2a4504e462-42
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 10:02:30 +0200
Received: from [40.107.130.81]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ad5ce96-b57f-0a2a45040019-286b82513d5e-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 10:02:30 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by PA4PR03MB7200.eurprd03.prod.outlook.com
 (2603:10a6:102:100::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 08:02:27 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 08:02:26 +0000
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
 b=wZi9tE9eyt6Ww5mQRX/J4uSvX31VACoLOJ9NkJN+b17zDeDHxj0pXHg65q4XL1F49WkFWAi14eDJEnW1eZk3GEnVrBynHRMj85gI1aFCUdJ57/EgnEBlsAq/yr6VV9W8P23ExcoOVw7vKg3jb6jpYUG5MR0a+uI1WzCMTfBrrE5G5B4vWLK6jN8+6BQRPgZyOHpzJ+UASvv33wb3b9d0BZ8Ns/H2f/9KYCg76htn2Tfgyuj76M0D3P3+VSgjatBoDfYVB6tEQcw6XCDRQH463FM1BS14tMZMR7s4k/JcOYMSG5cfdwvOoNAPavqYIALluyFbfpQh+hc+dDqTjEkfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THqUcA+jSlE+cJXyOzAplOpsf2pkcu16YpV0TJNMB/w=;
 b=cHU7kJvdPF/2mmIJRpXw/SY0s/tFqHm49ZCCWZIRXO1UaUC2Ze/JUUWujt/gxBE5bsxPf1M2i33iH5O2mn132AVohDzSxrIMx8Y+CxoW6Fs4PBXeUgw0VAvLn6vXDEhiPxBSJOzFuLXKxfp+i9ALJL8XVs/QBDLpcXXEqucJHa9E5l+aMXWnqKQTiKfNXAa+3XZwTTBxVCCKF404LfQJd66OV3xnYnu6BmuvkfrmxPH0JFco3/jP2VpEnlUgkCYD5ns3hLrASFgGLSKyNAI3DLFUaMFtymF5L6VPH/swNwuKzjZ32+fBv65IteqHof4bauIF7JvgLMqmypGjz9b9Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THqUcA+jSlE+cJXyOzAplOpsf2pkcu16YpV0TJNMB/w=;
 b=vWkbw+XrC75crQtHMnZDyicedjxZORgCs6x9Fk926B1k/rqh1Whd35hC1kNGf6tu0WELyrs6Emdr+fgbc7KyWR6DMws/Vibl8itW/4q7/MtnO4JQb4Ym2rToXmBjf8n5bigGtAU9+8SsqKnGe8ZH7kzPX4AC5BG7v3ExssjOtCiPdodFWrrDOxhJV/oOZHNxhwc9M65X7mpHkl89MqEXLYoGiMrIhrQhanmlmRJz8Vt/wFVzx5Sl/HwQgRi53HeLhD2HJ99qtgexywLWLcFmLz77c5faBRoDHBcL3gYovQfeo3Wm165TVUGe9wgg8z2eC+3M8hGBvdkzppgSw0H3QA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <1aa21183-2bc0-4bd1-8267-6df5c2f0594c@epam.com>
Date: Mon, 19 Oct 2026 11:02:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Eclair: scan the last xen-syms linking pass on Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <da077c781fe07f776946475521bd06409a9af100.1791836668.git.dmytro_prokopchuk1@epam.com>
 <d10c7b4a-bd83-4a18-810f-50fab37ab841@suse.com>
 <a4b9fc24-35c9-4fcf-9798-3f3afd840d0f@epam.com>
 <171c47db-b916-4f25-8026-16a1a99dea0c@suse.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <171c47db-b916-4f25-8026-16a1a99dea0c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0030.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::30) To AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9SPR01MB0028:EE_|PA4PR03MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: b7fb8d84-f9a7-4133-ceca-08df2db750bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|10067099003|22082099003|4143699003|261009223027099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	gqCkgJfqs3EWalS9YBzIWGz0JFloT0Wzvn2xY964S1onrBVfg8+08yzYfK5zJ0GFGbVCJ6q9UUagmHzqh0QHN4puMcaJyRFvzkVSMUfXz+c9dzOmGE89u7jE/S9Aq5dukd0DZSJzvNsqCV65U8XozkM2MoqNHrvxw4ePKcIySBYe7cgLZ7RGgBbasFiLDKGUA7WsWc2uYdjR5AZ4/e+uwBuBljuayxA3T61hPINtHLLKhgsuCfqSwGyMeSHzVVxddoNgBiDe74MqAhMSm8XXg9qzRZI9eF4/OzYoJMpjTR7F3tLF130JVHh+hLcZOuEDURMJXIxoVLCibHQwtphNrCWFEn8sdFDJTrmZajGxgvUeJq7SMBuH2DWa4jtjkZVEpexTXGqMuz1qa3y5D88Jq8aOqDB7GOrla99fDbp23VXEKGYK8LOVlacjP239gilr03qGMohNOAvZXoq5PNxaE4La1yVWqpCmix0wvYiAL3iZtNk9mJ7Hf4fn79tvupx5ejk1HAfIEZI1PA3Hkb/1m6RaAIy272tIzz2GBiH/wBtmF4aM5vwn4DPDRN1Phn15HHSEwZD8rYlnTQcDFFzNKBmdNi+mFT6dpjPMmStcx0moqEVdUxzzNjovSjJ0MnGmtHxxk9Jhp6s8sPz2OcRv5xUAIr5hfIBzmZMrCixvdW8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(10067099003)(22082099003)(4143699003)(261009223027099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3FuZnNKSUw4aHNWTDN0cFlyYUJpeFZGWnkrTDM1TDVJR2d4Rk5DTXlTK0xi?=
 =?utf-8?B?aDBrcVcvQnp0ZHlJV3h2akJyZGtrdUxRUU5sNU81VkkyV21oeFhUamEzUzhy?=
 =?utf-8?B?Mjc0TGFjSW80Z1ZVRGVLaTN2RGpNSndlS0pJK3JSUnlzZVM1ZlFLZldDZHdZ?=
 =?utf-8?B?NFlUNXNYSkZncWVqMDdPakpFYlRzdDBjNU9XVS8vRnlJWXl2U2dTeHFGZUth?=
 =?utf-8?B?NUVVbzYwT05GUmo1SWc5NzJHNkFxK01POTgyNmEweHE3bldmckNaMndHVTNU?=
 =?utf-8?B?K0o5VEFHZkVET1ZQd2QxVWpTMzE4NFl4NXNGSXlzTEwveFlXWFQySjJhbXlk?=
 =?utf-8?B?cERqRk1pSmpUOGIxcUtSNDBySDZwNEg0bmxpNnhHc0ZnbmdCSUVKTXRkQnUw?=
 =?utf-8?B?Tm1tcUQxRm1rQzNseHZNNFgzUS9XY0ZiM3BZMVl2RXltK0lla0JWaER5UXAx?=
 =?utf-8?B?Nzg1Z0oybHZScmsxeTdLT2JZb01zUlRDZG84SWhkbHVRUkMrTDBqaEtuUk5Z?=
 =?utf-8?B?YzNBejhITU91WFpqckVsTHhId2FZMzlLRGJudEtUbzgraEpwRktYUHFPemM1?=
 =?utf-8?B?NzFNbXBoYll2cmJQYUhlYTBnbW1FWUNDWDd0YkQ5Zy9GanNwRGdRNjRHY1JU?=
 =?utf-8?B?blRtNW42Yjc2T1RaUVJET3Q1MXo3WCtZZTdtUUFHdVJnam9mVENEMklvQmlE?=
 =?utf-8?B?ckpuWWJQT2ZOVXVlNjV1aUUrMWNrSWNuVzdGNFFWUWdxRURkMGJzdm1aWWhQ?=
 =?utf-8?B?SStxMzdCK2RHYUQzRVZYRzJsbkR1QkdCK09GOVdyZlVPUTBkM3o2ZzVvdjhS?=
 =?utf-8?B?Yk53dHNXQThIMVE5RVA2ZHFPY2hLbm01K1BQbElCWlFHL0tJQzBPOWdGdEJZ?=
 =?utf-8?B?Nm9pRTcvbks1RDl6UytKUGpYWjRKcWFHRSt6dHg5ZlRPcU9aVE1DTUF4bmQ5?=
 =?utf-8?B?VjhTQTRkU3VmcnBiOGJkYlJ0Znoydk9TMlpKRk1SUDh2YWxVVGF4cDZNb202?=
 =?utf-8?B?bkRiOU8wcU9jaVVTUGFTQnFaR3RHRXFuRkVOWXVQWEFNU0FWaHdGUnA3R2Nj?=
 =?utf-8?B?MzBiV0JzdFJZYTFtSGlDdVVEb0swa2VZenJvelhLdWN3MmxSSFR2ek5wdlAw?=
 =?utf-8?B?UXVtMStmcmtCWHkwb0ZBK3dqbnBPblE1QWR6bjJaVXVaTnV3bkZwKzRpbVpY?=
 =?utf-8?B?UzN2em1XdVlGQU5kUVhNV1JJNmJNSGlTYUVkNnRBT0F0OFg2aG1pRE9WYWx4?=
 =?utf-8?B?RGEvaTlPRE5NTkZGbGxQMUY4S0wwZGlIblFVcS9sSTIreU9xWWdDN2pqZE1v?=
 =?utf-8?B?THdXb1VEMkJZeGFBTGU3RDJFeXFlOEttSzJiYy9DTUE4SnlaRXBHWVFxTm5k?=
 =?utf-8?B?cXVPTGQ3Nm01S0ZSQ1owQlNEM1c3LzRTcjFkd21mcXp4WFkvVFFzY3U2Y0l2?=
 =?utf-8?B?czBSdFp6OVVibkZneFpWeTh1NVR0VDBhczV6cnN2Rk9JOXNjTW9hYmtmQW1D?=
 =?utf-8?B?NStXQWk2VytiZnVuUEVXcVljMGhKcmlXUG5wZk5nUXhpaEw4dERsMXc0ODVm?=
 =?utf-8?B?Nit6cTdlTjBORlZkTi9EQkl4WGNjUkRqQ2dHendjaUtLcFV4UXM4TEEweHBv?=
 =?utf-8?B?UUpMUDArNFFNM0tmMmw4S0p2eU9nSG5hOTVxRXF3NXhTVEtRQkZ0Qnl3c05R?=
 =?utf-8?B?anVoRDZkOVZZZ0R1cFdkLy83b21KUFNTWmlkMlJrMCtaYUdmeWF4ZFRGODZE?=
 =?utf-8?B?aCtpTWNUYnhCZHp3TkxvbFFJM1J0K1Rsd0pmUmpRSGtPSW44b2ZlVnZXWEl1?=
 =?utf-8?B?Um91aWQwWU03V3FBSFpTV1hobW9FUnpCRElPU3pTOEJMcHZIVUdtZC9Oa0Vr?=
 =?utf-8?B?VEFiTGlRcXhPNTcyNGlzaDYvK3Jsb3U0Vmw3ZWhlc0JuL1V4cFNmR1BiTUow?=
 =?utf-8?B?QmhZcEpIRWZ5S0FwWkNuT2lXYXVtcGNmTDcrU1Z4WGtiNzN6aVQ1OUNsaVBB?=
 =?utf-8?B?dnN2YVYzUjhWOUp2a1A5UnNiUjZuem5xSkFBUWpyNjZEdlV0ZXhDUmFIcVAx?=
 =?utf-8?B?TGJPb2I5YXdZS1NJUlBQZzJjNVJ6RXlHNGFuMHcyTkhSY3VHQzREMndjUUZr?=
 =?utf-8?B?WFpNK0txOHdKTzVNeWJRVFdXeWtoY0hYYWwxdTZtTUJOMmhjUThJSTZNdlpa?=
 =?utf-8?B?Szh2TlNGZDlsZXY4MU44TklaSkhleUtpTm9mZG1IV2xvbW5RS3kzOFlPMnhv?=
 =?utf-8?B?Yk0waDFhMXp4bENweEdvUU1zbjRJNi9YWDYxM1hEaVZITG4rdTdIQ08xcGMx?=
 =?utf-8?B?RlZQSTREZldzbmMraEU0QjEwM3BENEY5UTh0N2FQUkhtVTRsN25MS29TaS9B?=
 =?utf-8?Q?FINlfGQKeK0f2zN4=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7fb8d84-f9a7-4133-ceca-08df2db750bc
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 08:02:26.8535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRla/xYK1saHnTWiHnOfyLqsE8xnYhUbx04tNLkjLlShGRZUwgABAfUJdEaswCvVRpNCQHlVFrKpJGtfW4vVynWFvBn2KGMs/0fhJLywbZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7200
X-purgate-ID: tlsNG-ebf023/1792396950-C3AC0B50-18CC7395/0/0
X-purgate-type: clean
X-purgate-size: 2156



On 10/13/26 11:14, Jan Beulich wrote:
> On 13.10.2026 10:02, Dmytro Prokopchuk1 wrote:
>> On 10/13/26 10:52, Jan Beulich wrote:
>>> On 12.10.2026 22:49, Dmytro Prokopchuk1 wrote:
>>>> --- /dev/null
>>>> +++ b/automation/eclair_analysis/ECLAIR/generate-xen-syms-passes.sh
>>>
>>> You neatly use dashes in the new file's name here. Is there a reason ...
>>>
>>>> @@ -0,0 +1,20 @@
>>>> +#!/bin/bash
>>>> +
>>>> +# Hide every xen-syms linking pass except LAST_LINKING_PASS.
>>>> +# The pass list is the foreach in xen/scripts/Makefile.link.
>>>> +
>>>> +set -e
>>>> +
>>>> +cd "$(dirname "$0")"
>>>> +arch=$(echo "${XEN_TARGET_ARCH}" | sed -e 's/x86.*/x86/' -e 's/arm.*/arm/')
>>>> +last=$(sed -n 's/^LAST_LINKING_PASS *:= *\([0-9]\).*/\1/p' \
>>>> +    "../../../xen/arch/${arch}/Makefile" | head -n 1)
>>>> +passes=$(sed -n 's/.*foreach n,\([0-9 ]*\).*/\1/p' \
>>>> +    ../../../xen/scripts/Makefile.link | head -n 1)
>>>> +test -n "${last}"
>>>> +test -n "${passes}"
>>>> +hidden=$(printf '%s' "${passes}" | tr -d " ${last}")
>>>> +
>>>> +printf '%s\n' \
>>>> +    "-file_tag+={xen_syms_tmp, \"^xen/\\\\.xen-syms\\\\.[${hidden}]\$\"}" \
>>>> +    >xen_syms_passes.ecl
>>>
>>> ... underscores are used here?
>>
>> The generated file follows the other .ecl names (e.g.
>> linker_symbols.ecl). The script name follows generate-linker-symbols.sh,
>> which also uses dashes and writes an .ecl file with underscores.
> 
> That's not very nice, but otoh not as problematic to warrant an immediate
> change. At the same time here your use of underscores is not only a style
> issue (where bad pre-existing instances should never be used as an excuse),
> but also weakens the connection to xen-syms: The underscore used could in
> principle be a surrogate for about any non-alnum character, including e.g.
> a dot.
> 
> Jan

I agree the underscores make the link to xen-syms less obvious.

Since you don't see it as blocking, I'd prefer to leave the names as 
they are for consistency with the existing files. If you'd like to 
rename it (e.g. xen-syms-passes.ecl), I can do that in a follow-up.

BR, Dmytro

