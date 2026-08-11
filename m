Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D546C5B56A
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 13:02:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388195.1629407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtm6w-0003A0-7K; Tue, 11 Aug 2026 13:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388195.1629407; Tue, 11 Aug 2026 13:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtm6w-00039t-4L; Tue, 11 Aug 2026 13:01:42 +0000
Received: by outflank-mailman (input) for mailman id 1388195;
 Tue, 11 Aug 2026 13:01:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wtm6u-00039g-G7
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 13:01:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtm6r-009LCC-Fz
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 15:01:38 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7b1cec-2eae-0a2a0a5409dd-0a2a4509e918-18
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 15:01:30 +0200
Received: from [52.101.193.24]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7b1d25-be1a-0a2a45090019-3465c11832eb-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 15:01:27 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB989491.namprd03.prod.outlook.com (2603:10b6:a03:407::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 13:01:22 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 13:01:21 +0000
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
 b=tukdJ7h+jvWFTWG/Rs5CNwcYyKka9m9B7ujc0Gjs6WqZpi+jAbWUT3kN4en1i8m/YLvvlgGVpebo/UvnwZGUJ4u2fIQD3EQk8BYZq2lEzFXQZy1l3WXC4NuWvDbdJQJAtdmnykrOba8Ql80EyQQh7ysnlsEvSrFAowTSITkSYZVihckPqk8t4Jv5O8tr2BXXMBMmuG8pT0KalQ3IzbOFXkGq2/OFDv2KhFZE2EL9vLRTTxiLpZn+VcU7QUCFCFrh1qVyFiIBY/TabVTqRBECTC/wDfhFNp26Y/HfD0scIZzdMqqGzlPB5oZcjQuNBG9IPr0Ts1XRljnO0kR08LaK/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZ+jG5N07na9TTaIn652mOqplbTmcBrD7nwVlzdekfM=;
 b=MQGN/QJeV7UGBQxCFA3PO5ry+h4x7Q08/eNs03VO3TgtA6G/5yAtIVepCD71/gGECHLRElHZQv8dXE9eewhgMXxxSK+KtumZHuunqwIdWwVz1WgeKTViMSyZJh8H8ikE1ja9+r4Uq3/u+k8QupuqIMnUNv4lL11HcwVl1ernoLv4xCdkgQ1RLjeRPh18AiMmBVl+PY5HPlK9uaJkaudnwIZjZtJUcD4LwQPXxgWwd5q8rTHK/eUwM19ouJ3bYlBZU1066xbuaK7ILKpdZyzVW6UZhOvsXdg/V1Hd5+T+uIQDacOcHrUgEVkkz3l/RH4e8UX+NgxCR5W8XdD4p0noXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZ+jG5N07na9TTaIn652mOqplbTmcBrD7nwVlzdekfM=;
 b=DZT6Z7wwZt2L2URLA4htGJKPxxMsqj759/mgzu6lkPZJvpMNIbaQaUWyK5RzaU1oSLnlzsfAPMWFGHyQjTcCDP7d7jKpNCi0+/i3vY2s3vdGTApIQ+U3aFHjOT/8hkJVKLbixGuB0WYh8daWIHDopKSc8SinKwgBwLRz3Ky8px0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7b2d0e8f-5c6c-4002-a123-d96c90030e54@citrix.com>
Date: Tue, 11 Aug 2026 14:01:17 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jens Wiklander <jenswi@kernel.org>
Subject: Re: [PATCH v2 3/3] xen/arm: handle irq_set_type() failures
To: Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1786385827.git.mykola_kvach@epam.com>
 <d4087afce93cd4bb1779507393ac74c5dd5baea3.1786385827.git.mykola_kvach@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d4087afce93cd4bb1779507393ac74c5dd5baea3.1786385827.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0018.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB989491:EE_
X-MS-Office365-Filtering-Correlation-Id: 32266a46-e3ca-4b64-a19f-08def7a8a43d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|18002099003|22082099003|6133799003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	uP40TFpYN+NtvjONtLsfW2by/sdA2/7fOrahfVWxjVqGLVwfMtqMIKhPAMlN8Nh/rXX+6PZMMWBTr8+MRXejj2tVWS/6xwkrPX4IVPR0wD7HTttYHihOQSl4NfINmBWVDUeZCyQkMzlMW98jcVxrXXG5XFAZ7GAD1/jQa4pwKeSnl2PkGjITQ4Y/hwAl6j+OtXCgw2rBHj8Ib5YYJEp1r9mDuleytlmOsRAk18DVZcoXJFhWSdiVzaXGRt8ysf964YlR3O8kT9G9KNNudd/FHzJHU7nS4eydesvaEZ3lDvDhKwj2dH5yNrez7jCk/+8NdqvmzxM2qs3NqLChu2U+NFbtTeEq/fS3unX/7ovoj4bdQyRy+ISkOAcwYGmb1Zkljldj86m9S7e/35VajXw6eJlwBO3HT9MkZvddM8GrsFA4DMK7oGk86JfSERrkaQpFr+L08efXtLPcWcyiaP78ySmJi/N7Sr33S2fWK+wynXtR601bCkOVziFWEAATvZMvMxEDsO8Cblhn8fWFD37sbKyTrvrhT/QkyDiALgo7pF6J3MzqPX84i77tCVoXFh9Kvl6+hqTKVUOdP05Lv/K7MJl5cIJYH1ibhe3p8hNLJ2KZxwOXZgrfwThINSEEURT7r13i22qI4zC31a2ETLNwa6D+Vionk/2rYufLThKKlU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(18002099003)(22082099003)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG5FMkdPMEVrenRwRG9xdGdTdWt6aVp2N0hKeWVydDhjQzYyUWRBSUdVamVE?=
 =?utf-8?B?Yk5QVFl1NTRDNlBGZkNVRlFMK3llQmtsVlVnM0IwSStoVEJ6aGUzVVNkZ2hF?=
 =?utf-8?B?MHRReG1mU3oycS9BeG52WTRXcVVLUWl2Tk1WNFNNTE9OWGgzTFZDQytHcGhP?=
 =?utf-8?B?WDVGVW80Z2IzM3JIUytPaTNtQUtrY2VrcGljWlZ6WXJWVlZXWUVBRFdPczVF?=
 =?utf-8?B?YVpTNkdhZU1mM2lBR1lCYXRHR0U1Uk9KUGJqUEJoVEZld3JjaHI5UmVPNXpD?=
 =?utf-8?B?OWNJaW9wMW5EYnYxaWNEZ1IwU2NUalYxV2ZXTFF4VHhSaHhHL1RnMk5TVS9M?=
 =?utf-8?B?Tm43YlZhKzI0UHd4SW9HM3F0SWRLSjMzNzU5NGJ4YzhScUtUWXhHcEYzTnRu?=
 =?utf-8?B?WUdITGorR0NRVDVVRkJSR2VEMkdua0ttTjB1bDFOdUxnVE9FYzJiUTdQNjZv?=
 =?utf-8?B?OTJWQ2dLSnhlS1IwNWNjdDhIV2VOeGhHSUdnQ040NG9XUnRuTFdnQ0gzd0hZ?=
 =?utf-8?B?UFY3aUUrZDc4T21VVzlxM2NFREN1MWlobFRUM0pYM3JXUDlsaXlzNS9Jbldp?=
 =?utf-8?B?R2Z6TE4wR3ZpcTB2MUhiNkFUaWJsSU4vMEI4eEhRUVR4T3poMm9mek1DMW5h?=
 =?utf-8?B?dWllbWlkNlFCWlFsTUNDQ05XcS9vbDJtWlFPazBWUmFtZ2F0U2E2M21zVnY3?=
 =?utf-8?B?YlFQVWJscytxKzZMYkNmSVFKSGpIM1lGYzB5TElZQTl6MGpCSUVOeWk0UlpO?=
 =?utf-8?B?cTRSdFZNMjZVaUtqbm5acVhrREV6K2dBa0dINFNZdWJTWGxUamVwRDJQeWZR?=
 =?utf-8?B?L2ZFcGNOeGhscFBvanR5NUtjTUIrVmdnQk9MenI0YmtpT3YrelR4SU94ZmV2?=
 =?utf-8?B?QStSTWN4YkVHSmNTKzNpVExVS1FqamhMcUtRMkRZZ2FQQm9FQ09yUUxPc01n?=
 =?utf-8?B?TDZnR0t0N21xSUxrSU1sbnB4bTZ1VFVxUDg0TXdjaDJpdzlNOFRXdUpwaTk2?=
 =?utf-8?B?TzlPK3hPNHlqR2VrSDJCVWNTRTdNOWRBd1F2Z1o3SEoxQStjMGRaZndzVGJs?=
 =?utf-8?B?UlMrdjI5ck9BWEZoN1V3TTQ1bHorTjVjMlpOVXBVWjNnZDZZSnF3S0RjLzUv?=
 =?utf-8?B?cTV1NzVwalR2Uk4zNytPZDNaM0V2MG50Z1FUYUNWN2FhalJRd2lhdU9IaFE1?=
 =?utf-8?B?djEvMWpvNWIrVGhYWnNTTm9aMHRMRDhEYTlOSVNGZDJGTkx3SXhuUVhHYWxW?=
 =?utf-8?B?N1lVditzQjNUbkcxbTlRZ0hDMGdFcE52UVBxY2tFeGZveWlFejRxdGhoRkNP?=
 =?utf-8?B?ajVGYWM0VUpQTWRFWTgvYVhKMEwvSkZWRzZHNlh2OVhFSms3RTAyQThxOUxP?=
 =?utf-8?B?aTRrbm43ZjdRQnV5SndNWU9JRjcwRTV6ODN0T3A3dEFSM0ZGVk0reDU4cU9s?=
 =?utf-8?B?eWlYbklyUklWVGV6dUlZTlpEcjk3S2xUZFlud1U2cWY4T3NJc0MxeDQyUFZo?=
 =?utf-8?B?QkVkSXpScU9BbVQ0eldpeiszSjlSbEh2aHZIY0JLTzZGVjk0cVlRVElHR0Vv?=
 =?utf-8?B?dXU0MTVUSWhiSXBleGF0TU11cFNBcjZEcDc4UkpYVk1NZko3SGM3V1BZYUVy?=
 =?utf-8?B?NEt3VTMxaGlHSGJvdEE0TTB1c3JrRlRIWnN2TzR6M2JBNWEwZXhYL2U1czdK?=
 =?utf-8?B?dzl3SmVOellUQWlFYnd4bDM2OGs1cjdTTGFlOGxhbldYa2RFY0RUYytGVEV2?=
 =?utf-8?B?U29SWkViaW5uNDhEYzJKR0xqY1h4NXpjVnJXdHBrdktrbnF5UGpocGljZXpI?=
 =?utf-8?B?RldwdjJPV1did0tZRzdjOEJER3NzT0JtUkJ2VCtUWkhHU3VuU2pJS3BwWVVJ?=
 =?utf-8?B?eDhmSXpnRWlRa00vK3U3YVNmL0xEaHNyb2EwUGk0R1hJNXhyNkF0UnN2OER3?=
 =?utf-8?B?L3hFSVFndkV1aFB5eThUdGUrbUg1QWtrQjdjTVhheFZLYkVUWWZkeExyWC9F?=
 =?utf-8?B?STZ3bHc5dWJ0QnRlSEpQbXFjMnNpcW5BN1pmL25KdGU0OGRJeGVZTGd6dHFl?=
 =?utf-8?B?SWpWWHBkWWFkZTVkd3p2L0l5UXFlVFJZa0w4YzkxUGRtNVpyTDFoZ0ZnbzZq?=
 =?utf-8?B?eGZTZVpCd29hTUg0UE91WDUyODluWS83cS9jN2hnWkI4cUlPUzlGS0ZEMkdZ?=
 =?utf-8?B?SXpUbTFNbnI5Zjg1SCtibXlXRk1RRjZQZWhnc0xiQnJsRzZ4ZlVTY2doQWt0?=
 =?utf-8?B?aHJMOXdIa25aZWJrTEM5Znp5SmR6V0QvOUkxTWE5QWtyYjJITmVMM3loTWFr?=
 =?utf-8?B?TTZHVzhJR1FnQloxbXBJWFBnejRBZVNUMzhuMjdHbHB1bHdTMGhpcVJ0NjQ5?=
 =?utf-8?Q?X9SwcXxnqRg2XP2k=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32266a46-e3ca-4b64-a19f-08def7a8a43d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:01:21.7526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5ED69T5U97wCvbk8mDsugpolr53SiV1Iqs9GBlg6RWVX3oQY2lDWfTytUMQpr6eHI+TZc8lK9KRb8rrLc5Tpjh67zvb4fL3l/Rl4nQr2N4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB989491
X-purgate-ID: tlsNG-bad1c0/1786453287-BC2F4034-51456E6A/0/0
X-purgate-type: clean
X-purgate-size: 2434

On 10/08/2026 7:38 pm, Mykola Kvach wrote:
> Several Arm firmware initialization paths discard irq_set_type()'s return
> value, violating MISRA C Rule 17.7. If trigger configuration fails,
> initialization continues with an IRQ that was not configured as requested.
>
> Check the return value in the GTDT, MADT, SPCR, and FF-A paths. Store
> timer INTIDs only after successful trigger configuration, make GTDT
> parsing failure fatal, and stop UART or notification setup when trigger
> configuration fails.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v2:
> - new patch.
> ---
>  xen/arch/arm/gic-v2.c        |  8 ++++++--
>  xen/arch/arm/gic-v3.c        |  8 ++++++--
>  xen/arch/arm/tee/ffa_notif.c | 11 ++++++++++-
>  xen/arch/arm/time.c          | 18 ++++++++++++++----
>  xen/drivers/char/ns16550.c   |  5 ++++-
>  xen/drivers/char/pl011.c     |  4 +++-
>  6 files changed, 43 insertions(+), 11 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index 43a379fdda..b8dcbb0bb4 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1157,6 +1157,7 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
>                          const unsigned long end)
>  {
>      static int cpu_base_assigned = 0;
> +    int rc;
>      struct acpi_madt_generic_interrupt *processor =
>                 container_of(header, struct acpi_madt_generic_interrupt, header);
>  
> @@ -1173,9 +1174,12 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
>          gicv2_info.maintenance_irq = processor->vgic_interrupt;
>  
>          if ( processor->flags & ACPI_MADT_VGIC_IRQ_MODE )
> -            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH);
> +            rc = irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH);
>          else
> -            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK);
> +            rc = irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK);

I know it was pre-existing, but this is an overly verbose way of writing:

rc = irq_set_type(gicv2_info.maintenance_irq,
          (processor->flags & ACPI_MADT_VGIC_IRQ_MODE)
          ? IRQ_TYPE_EDGE_BOTH
          : IRQ_TYPE_LEVEL_MASK);

I expect the optimiser can transform behind the scenes, but it's better
to make the C simpler for humans too.

~Andrew


