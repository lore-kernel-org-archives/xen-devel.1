Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB279C43602
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 09:46:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347352.1605204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8ZY-0001WC-B9; Mon, 29 Jun 2026 09:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347352.1605204; Mon, 29 Jun 2026 09:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8ZY-0001W5-8K; Mon, 29 Jun 2026 09:46:36 +0000
Received: by outflank-mailman (input) for mailman id 1347352;
 Mon, 29 Jun 2026 09:46:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1we8ZW-0001Vz-Jb
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 09:46:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we8ZV-00EVhY-RJ
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 11:46:33 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a423eed-e002-0a2a0a5209dd-0a2a4508d7a2-42
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:46:33 +0200
Received: from [40.93.201.9]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a423ef8-edec-0a2a45080019-285dc90940ee-4
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:46:33 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5141.namprd03.prod.outlook.com (2603:10b6:a03:1e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Mon, 29 Jun
 2026 09:46:29 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 09:46:29 +0000
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
 b=eOCATr/J0rXhbak2utGf50ymyn45g37DnSILzZ55f5/uQg7Kp1or7gr1TB0gMlEmWboxaLorTMdcsnUdsnQ2V45Njah+0vDHlg21NbTo2VC+VaE0rofryqz9nNnBh7je3TphMzE7bkAFc3pZI+D+CvkVTeaDkM7kEABO4S4U+Uc/6yCeDvFWlU+46cNQ4EXfy//zsRxZvgdJEIXNv+PV0QJk8hh1oF1KDhu9UnfJgftsmVGKisbvwP6iBIqJRxVIS6eJu/lpEamSRb7eRApEiB97y1g9F07U7m03CSZf4lcyPiac7pTmIXdadfMZZvSymqBEStPAl8k6vwGjfrW9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZiRNyN9yEiDUVCRpgswufpjL+J2KlUWgdLgVhIuRPY=;
 b=NduHMPpugQgZgVo51jFM28lu7y4tLi13ahI6Ots2a19amxf0K9FGDECqMqGpwTOIacr2F4ZJD6FRNhHR62Y0xD4HVUbSfHLKDTwdM0gmf1uls8SGEknxOEUrIiCr1eAkBZwrB7Y67TBTiGoamaW5cu7tf1mKKtaywohvgM8F1ImKdrqTDFZlSaXfuJkV0RvAYoSkjRawrJfu3UJADHIYiXzM/kqDHZZEWLIz4t9LuGJrp1RDXj4bJk5t34U29WQijda5M93oQRJ1132xSYn45M9grkbuguAn/L6Xxl/BQqQeTjxRz+Zc/p7Jw9EHAbC25ArXAqCzmJbrFVThRiZyiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZiRNyN9yEiDUVCRpgswufpjL+J2KlUWgdLgVhIuRPY=;
 b=dMS8hM2oMJtU6+WIEag8y+VUERKXEnDzEkY5o/uSIXB3/x9XTB/DBGwSudqrIwILuc8x7X9QqHPL2b2bzSM57V3On1AuVKI+YA0p3a7V2afys/V5rm2A56j4hysy4cCVZpRH+jE7B1LlAMKTKB1Eu3sHrck9DMxdUInqg2yu/88=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH for-4.22 v2 0/4] ns16550: bound interrupt handler execution time
Date: Mon, 29 Jun 2026 11:45:27 +0200
Message-ID: <20260629094531.55555-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0178.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 18888c9b-4e80-492f-f3ae-08ded5c34b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|23010399003|376014|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	jFglgLNLjgVUT8W8Vs7UJuvjsGJ9oRXgHq10rUt0OqjrkwmTaUEmFiov14GuTWBVGoix6W4oRbvbVsMmbIEzwfzbV9iGGqdwhceu+BWIVN56w4/7OW2fj+EQAHWBOu9Dxb64wVBFXjf1RTsCj/+ulUWhbUsDNXTRVcjfbkexNUf4KpVgpUr0QUHLGBsSFTy21malBTqIfOKwDQbwebbggt3EZf3xjXx7AOwdyk94h5Ltr/Fb81SkGGAREOn3D0NU4gdqKsWviQse+s5scI65du5OpQfPFIxeS/ikXvvKC2h2hPPE22W2MKnrTQT63A2G+Je1L8fos9/bm55ZbW4iezDl6WQqftk64fkhaYukwz+y9QCi8pr+VvLHOOv8+J3kwvScYDywXbNHR+tw6laz6yhYMWkexU2450G5dberpVjnWAuR1u7f6D24khgi1KxDMWEbcj4ad5TstltNVQLM6knoZM6E87fw0aOMpoeBc8ZlqmHZ54VGTmi7YaKwezVIxnDaJvOAFTJBLXUgEQ+rwFiuFuLvio5ur3q1L1kvvolqOBuFUHouBJ97Qj6OACgN5yzMAtRl+htbc8zd3J6Co9OUmdlj3xiTxFT+77xarzAmQ9YUrmS4qUwNm7Sijqys43Or7oShX1Sh0WOi+G46L+4dJZqlPHtQDUkqfOe5YGg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(23010399003)(376014)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW9mcURldWlmbVRibWFoNWhpYU1VQTRhdWcrZDAzVElJOUZKTDdlYjdjV3Vt?=
 =?utf-8?B?VVhVOEU2YS9CbXU2SkN4VDYyeGRwYkZTb1FjVFpncmFNWm8xTG9OdUoxbnVr?=
 =?utf-8?B?blQ2UUdVbHFKK2ZzOHRWYmV6SlB1anJ4emZIRjJmOW5Qc2FJQmNxZURQSU5i?=
 =?utf-8?B?d1grM1ZKRUUyRk5pcC9pV3FKK2NkYWE5UVFEQ1JlZWQ5VlVMRGlISFR4YVVS?=
 =?utf-8?B?cEcwTURZVzkxcEw2Y3N5RXYwQm9FdnR2ZkdTU0pUc09sMDRvS1hRc1R0MEE4?=
 =?utf-8?B?SFR1ODdXMFpGaWduTXE0RnRPbjR1RnpFRTdQV2dLQ1Q2T09XZjh5K2drbTlO?=
 =?utf-8?B?V2ozcG5MZW50clVYNGUwL1ZDbFZZc2UwbWpJWWVXVldWYWlUNXUzQTl6YVAx?=
 =?utf-8?B?U01zYWxYRmNFV3NsR3dKVXQ4dTFlNmplY3d4RVM1UEd5YlhuZUthR3hxMDBv?=
 =?utf-8?B?MjN0enVUb1BjY1hpNGJxRFZHa1BCVnVPRUtjZ1VIWnVlUms0cXpvdEowTWVv?=
 =?utf-8?B?WEdZVTAvL1NXNTMrMnh5VkdXTVViOWpBbHRTeTBLK1ZOTWxIYnIyN3hwVWc5?=
 =?utf-8?B?QUNpZkNNVTlmNU5yc0ZmaDdmTWZFdllrb2d4WlFQQUFUNElsZDVsMUQrOVlQ?=
 =?utf-8?B?M0VzSU9OM0Y1eGZOUW5UUktFZlNkeHNjK084TWVhQnY0cmxEeUVxYjlKTWJM?=
 =?utf-8?B?UHFxYmI3SWVINVNCN0FXU1lMcjNhNE1KbkpkTkhsLzljL1U1OEhmcVBPeWdT?=
 =?utf-8?B?THRKRzN3aTZyRm45MGRQakVGQkpRTndTMjdkSjl2YzBZSmZtMWZpdmtoUG8w?=
 =?utf-8?B?WHRkT0ROSWxDQU16elAvRXcvc0pzck9kSUFJYjU4OHV4N1pXanUzR3c1SWlq?=
 =?utf-8?B?dktDeWR2a0FuOVp3dkV3aEpCd1NUMjZHRm8wMDhRL3BYRkZmaE1qWUJkWGtE?=
 =?utf-8?B?R2pkVmJqdFlmRjlpT3J1Yzd3K242VjRZQXlWaFY3WHZQY0dERnZva0dySm0w?=
 =?utf-8?B?ell2ZzNtbnlaQXdhaDZTWC94WHhrK0JNSXVOY0FRV1kxVVRhdGhRYWR4UFVZ?=
 =?utf-8?B?OWk2YXVmQjh5NlcrK2tPcElPdmY1QnZqUGx6RTBJaG0yTE5KZjN0bkdvVFZn?=
 =?utf-8?B?Q2lSYUMzOGNaYVhKY2VsRk0yWmc0OEpTRC94L3BsaVRzUm5nRjVHQ1JIQnAr?=
 =?utf-8?B?bkIwSUV2T3hMWGlvNmVKS2c5T2VUdWp0UWNweVd2d1lYV1FIZ1JzR3R2TnE1?=
 =?utf-8?B?NDJZcDZqUEhhc2NjekRlUFdWRktvMk96TEx4Z1AzemlacUVKSGhiWlkxRjQz?=
 =?utf-8?B?RngyWUtYMEt4b1BQVVJkTFJ1azVyY2RrcnFqcVlWdzdrZHN6VFpKT0FQUFo1?=
 =?utf-8?B?Zm9FWmFCbVhoTmJwZSt2ZGMyNE5QNCt2dis1K2h4MThaZXFjdSs5RDdmSWc5?=
 =?utf-8?B?eEw2a1pKOEp4YSs2a200RWVPU2YxRVBRZ0pTb0ptbVFZZlpremJMU2k1emlM?=
 =?utf-8?B?eFhMOUtEakZtK2lJZkR0UmQ0N201djhWMldISnZlRmhXWmYxekx6T0cwVTBs?=
 =?utf-8?B?RWpFaDV4R3M4QTA4dm5TdGh0K0gwVzA2S282TlptTzlTMWc5Z05NbGxlcUdJ?=
 =?utf-8?B?YVZ5eXZpSkowSmJFemtOY2VrNVRVMnhkcjdwQnFhb0lXMkNkWWZUMGM3b0ZM?=
 =?utf-8?B?VGoxcmp5ektvSTFzbkFtNzlKOG5xajdiZk1XclNBMloyZ0h0cFdMOWVxMm1x?=
 =?utf-8?B?K2RHN2VhSC9WN0MyU1NPNGpRLy9jOC93TGNoaU9Ea1IvRnd1c05pUW90UExP?=
 =?utf-8?B?bVhaRjY1VFBVV1VTcFJrSitPWmQ3QWovNXFsamcrNUQ0T1llbjk3M3hBeSsw?=
 =?utf-8?B?ZjZZSVI1RjBhVHVTNWVOemRzUjZKWklBQ3NUZ2FTRXppbzVVb0dKcnpuUkh2?=
 =?utf-8?B?ZHE3TkdLT1oyTFBzWmRkcDMyZHdnVlBubE1CMlU2TDltZjQ0WjRLdm51LzRz?=
 =?utf-8?B?cHRLQ0pIUEw1eVdEdGJJSEhuOGI1bnpRTnhMUXBMOGNycW5RUml4d1ZmNGhs?=
 =?utf-8?B?aklmYmEzK0JOTVFwNnNEaVh4NFFjYWtyNE41dmZQK3h6cnFMbHU3MXd5TFYy?=
 =?utf-8?B?SmVnYXoxNmdJVVhoS2dkSVpPTEN1Y3ZaMFJOcUNYWGxGTXJtYTFUQmlYSEJa?=
 =?utf-8?B?UVVhaUx2WU53RDV3WHR4b1ZvS0hYTFhQOThXMEVUbkZtRENhN1dxeVc4d05C?=
 =?utf-8?B?WGVnbk8wMmZIdnZmaUp5bTVlK25udGNac2lsbVdzWVNMN1RVNDkva1hJaDVr?=
 =?utf-8?B?VlVJM1A2ZzB4ek02QkFxMVhmUTN0M3F0Vks0VEZhWkV5a0dZU09Wdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18888c9b-4e80-492f-f3ae-08ded5c34b45
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:46:29.4416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8xTWPD55pa512MjnvPZ5fkBnl8FWdfqoyZDMZTtM11B5pbom1UON6XTN+T/SxR4RNPHLZ0kHToUFD9cbHOccw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5141
X-purgate-ID: tlsNG-c1860d/1782726393-43B343FC-946DB134/0/0
X-purgate-type: clean
X-purgate-size: 932

Hello,

Same approach as v1, but the introduction of a generic disable_irq()
handler requires two pre-patches for PowerPC and RISCV.  There's also an
extra fix for dealing with the interrupt being disabled while executing
the handler in do_IRQ().

Thanks, Roger.

Roger Pau Monne (4):
  riscv/irq: define a per-arch irq_to_desc()
  xen/ppc: introduce a dummy irq_to_desc()
  xen/irq: handle IRQ being disabled while executing its handler
  char/ns16550: bound execution time of ns16550_interrupt()

 xen/arch/ppc/include/asm/irq.h   |  6 ++++++
 xen/arch/riscv/include/asm/irq.h |  4 ++++
 xen/arch/riscv/irq.c             |  5 +++++
 xen/arch/x86/irq.c               |  4 +++-
 xen/common/irq.c                 | 12 ++++++++++++
 xen/drivers/char/ns16550.c       | 30 +++++++++++++++++++++++++++++-
 xen/include/xen/irq.h            |  1 +
 7 files changed, 60 insertions(+), 2 deletions(-)

-- 
2.53.0


