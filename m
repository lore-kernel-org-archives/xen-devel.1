Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D751CA5FD4
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 20:59:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438755.1657375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCNsA-0008Mu-Ax; Thu, 01 Oct 2026 20:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438755.1657375; Thu, 01 Oct 2026 20:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCNsA-0008Mn-6z; Thu, 01 Oct 2026 20:59:22 +0000
Received: by outflank-mailman (input) for mailman id 1438755;
 Thu, 01 Oct 2026 20:59:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCNs7-0008MO-Ow
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 20:59:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCNs6-003yEJ-Ur
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 22:59:18 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6abec945-bab6-0a2a0a5309dd-0a2a4509be3c-48
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 22:59:18 +0200
Received: from [52.101.46.5]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6abec9a4-be1a-0a2a45090019-34652e0556e3-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 22:59:18 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5911.namprd03.prod.outlook.com (2603:10b6:510:37::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 20:59:14 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 20:59:14 +0000
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
 b=HyJ/jCsLF6lYLLgT+vSQOZvlc4+PPDzAxr3KIxSHTHm/gD+yh2QVSrgjXCybwEcdGgHek4KEOfGWPMuz+Z0cd/FxKOThOaB7hzDKfHSgRxLFW3CnrZoxKXb/mu2D5ConzrQCBxMmG1HLy1SG/Voafk9BODQSRG3O7urxKB/TKoD6gCZCzBFEzc6cyIsCeXs9aJb7q9wwf3cdDEAMj5bz6tVxoFSQDXeKfY1pqiE0ZRyMMMDYFa/hQv/GaO5L46GnNnPZOU0xJx9r/7tVJxmQljDCbwlbZCIxBss+r9qfU/qVIvSxNkAQIFFP/Yt9ZsVeTmPILnPzHlTP/j0ACy7Hcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPJ7t+yR5ONQMQZP8Fh/cTjH2eMlapzttNVyCJnt/pI=;
 b=VhWqc7S0npbuREXHyhlov+mkqQebmiqkdJWaA5J+JO6VK4zGS31xBUTzhEkSdxOgM+CUyU5b+GVoMEu4czAzvhiTrkHwNACOx8cvxQhpdt4u4XXoTdj3oQJ0oet6zu0BT0xsjr0kgM0GLk0rxt/YVN+vD8rn17IZfkFjLX8k+C8xsDPVMDJZjhNbdjfvxiRcCe4HBkKNAATkKOPgpZaNJjQq1uO7Kw6dSPU/qBMCc5UjHxEhChad3Rdl+WQgHtFRqHW5FzpxpHlUtGvmyM7BjtDL3vcvWM4HaA8WSTPjAaxfse4RFeOK4krUuDyIqEkUiIhDEMEBS9L094kP2QEuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPJ7t+yR5ONQMQZP8Fh/cTjH2eMlapzttNVyCJnt/pI=;
 b=D4B0NR+5oGt/DCZEy/D2MgHOLLeJcxO2J5WT7/lHnJXXEYWYz+phK0jFAJyPTCkgVSv8r5qp4mGtAIh+Ng6IT5Q+jWqUzfiiCvvCmjA5x0L3us7xfcvdwoRsJppde965OospKTt3iDqKMdZe+zIiy9VK/HPoRu+Rza5VVl6QIjA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <466c7fc5-521b-4f09-9ebb-0fdaa1f39a5c@citrix.com>
Date: Thu, 1 Oct 2026 21:59:10 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Doug Covelli <doug.covelli@broadcom.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Borislav Petkov <bp@alien8.de>,
 David Kaplan <david.kaplan@amd.com>, David Woodhouse <dwmw2@amazon.co.uk>,
 Shivansh Dhiman <shivansh.dhiman@amd.com>,
 Nikunj Dadhania <nikunj.dadhania@amd.com>,
 Santosh Shukla <santosh.shukla@amd.com>
Subject: Re: [PATCH] x86/svm: Work around VMRUN's corruption of
 VMCB.INTR_SHADOW
To: Sean Christopherson <seanjc@google.com>
References: <20261001190518.438643-1-andrew.cooper3@citrix.com>
 <ar65XLqmSI3bEUiW@google.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ar65XLqmSI3bEUiW@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0262.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: 59c9f77c-39ff-40bc-20e7-08df1ffed9c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|6133799003|10063799003|18002099003|22082099003|10067099003|3023799007|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	feO7cpERaWBRjBGuyCkborMi6x/ph3kIKRwOVTf2TYVNvkL5dW0pqQmWuBboPIffeLrKH4QYr/RofD0usRDyhi8HFrWOkqEPhkznY49QP9fR8sOOmwmOAdpm9vm1oHU2Dp9cChPVEg2i+jg4OSh+wnHr2n/+naT+rZSfykbAefLDduzQxLr9GpHn8uVlgeENz6dRHPzJFeGx6kiDGs0Jr7mezq4VTGnCzliDdmZTFtWhdxrkV6OqQbEvmllcq0lvcIGsAp1ZGNV/Ic5cDMt3wjwPmTkRcdW/eZ4A26RoGafcR97lxZl4ga/EMROEhx7OV0un2q/IBZWbFkODkquDmyXle+w1bD6AVCRTXO7YK+EqfV00OIt6Dvd/F6vX3TeBNg8SHuq87AHnMFvJX23yzaiv9MhxQ0YfQKjrsMRxLIrE5Gs5jQyyXsrAaBxEriA2zvuugjJ69/btj7WG4tYZ8R+3fexmDYncqu5xPgqH+HHG1c48FOFI5m04Dtq6kjX/rPJAVND0zWO/aBlxZ6Icm4xh/z6K06evsnx/82ooQw4Btavuh6Mms00600mDB3feHpMyw3idKexQlfLYVSyXZ8ghG0eMx7LAoXXHrVyQNhsKvaAiFDVJ6PVskDje91dxC560AMSOj75PmDwZTAs6njsuRnYh9SJH23TVI7Q0HR8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(6133799003)(10063799003)(18002099003)(22082099003)(10067099003)(3023799007)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGg0UFczZUJqUWlZU2pTbFFFd1p6ZmxPeXRYWkhUWDlZSzMzQTlBUC9qVDQ4?=
 =?utf-8?B?ampZZUhsY1BIWGMyUlFqS01hcjYwL0hqT2VqZFFOWUduREkvQ3Ntdk9KNU5x?=
 =?utf-8?B?d3RTVktMY0xPYzlyWnorVnpwbUlSdWdzbnRXRXVpUU8zV2RmQTBXV3k4ZFFF?=
 =?utf-8?B?SHIrTWZYNTZNaGFlUnN0Q1JPSGZFbFo0NXgwVzg4Q2pGZDBuaTdEWHVpcVRt?=
 =?utf-8?B?VEhQZDVUSHRzOS96ejdVeGI5VlA2K0pCZklnM2lhdURWZ0l0UVNtalpXMW5O?=
 =?utf-8?B?djE5MXdVaUZzWUhRWTBCSHVQQzlQaDN2eWQraUJ6dVdCRngrK1BDeUhTWHho?=
 =?utf-8?B?aTM1MHlhckhOZ0I1dkdLMDA0RkhpdnJFMEdnRW1hY1BBM1JQTTFvNlRoclBY?=
 =?utf-8?B?Ly9rdDQ5Znl1T1U0Y1g1OGJtUHBEL25UMzArazhsbGVIbUVMQzBZa09JanhD?=
 =?utf-8?B?WjJYVllMT2VvbE4ySldRNnZXcGZQRVFLYkJoUFQ3M25sa3pSU0NzQms5dERM?=
 =?utf-8?B?R2tLREVaZy85Vmx0OGJRTktwQ1dweDU3Y2IwTm1PL3dBaFQ4VnVoSy9yTDZT?=
 =?utf-8?B?ZU5xNjRXOXUwS25ENW8vdzZ2Z2JuSCtoQ2JzRGpST21uNjUvaStVSm5QS2cw?=
 =?utf-8?B?MXBHWFdBWXcrS3UwT1NibDRoTlNxWFNNOVFoVmJQVzNSR2x6MkJJaEd3Nnl4?=
 =?utf-8?B?c0JyMVhZYzNlamdBQkZqL0FUM29KS0lWeTVhRlk4clVlODdvRW9Kam9JVVJP?=
 =?utf-8?B?dmpZekJLakdQTEx6WERjbzIzdEsxaHVhTmNBaEdSNkpJR3Q4S1RzUUpXUk1K?=
 =?utf-8?B?SGpSZ2ZDc0ZheUlUUVA5VmtqUVBjOGNiUS9wMjFJbWhUWWV6eExadnRCUTAx?=
 =?utf-8?B?RC9aWEJlUDZKeTNCU1dyL09SamozOFY3QlYrN1UxV21wcU1uUUdNT3preXpU?=
 =?utf-8?B?dzdXNWdaQmpRLzVSSUJ6Tkx3ZlJVK1huUSthNVcwNFlNTmpuL2lmS0R6NWY5?=
 =?utf-8?B?UlEvYlNnZlNLWmFFanhQNm45RFBlK21FMEtnOGRuaGh1eTc4L3ozVzc1SHE3?=
 =?utf-8?B?bDZ4djJJczNIRFhiVTEyWkVhRlZBZG9pdHg1VG9DNzlSLzRaT1RPS08rMGNm?=
 =?utf-8?B?TjNHU0QzU0FMUU01UjVFSERxL2ZWNVJUV3BUdGltaXp3eEJwZWFpejBETGt4?=
 =?utf-8?B?YnRWc0RweW1OT24yc3RMV2VKOVgyajB6bDFqZm05MUVnZHc3b0JQVHpOTUE1?=
 =?utf-8?B?THJGL1MxaHVKL0JObzBMQVJlMStHUktqOGtzNnZId2svYXlab3JqYkJmOU1G?=
 =?utf-8?B?R1lIZjNsQ3hXR1VpNUpRa0ZhdzlVQlJyMDZ4TTRNMkZvamdvZXhvd284L25Z?=
 =?utf-8?B?SVE5a1JMeGIvblI2dGlNN2d0enpsclFPelIxWWdxWWRjUFZBRG95VEJiQ1ND?=
 =?utf-8?B?MUtocDg2dFRqTStkSXNDek4rT0pOTXVmdUJaTWZNVlBFdnhUM01xWXZ6QWpq?=
 =?utf-8?B?Q05aTHE5eTFEZlMwdGN0bzlIQVFLa3VzVGhsRXprUFhCckpBbnNIS0ZFa3Vq?=
 =?utf-8?B?Y2Fkb25ZQU9SLzkxWHE3M01GekRGdFpMSXBJdks1dS9seUFHajhYOWZFNGM3?=
 =?utf-8?B?TWdNNGRhMDZQeTAwbkdWL3I5MzlENmIwcFpha0xOKy9qVlpOeHAxM3REMTM5?=
 =?utf-8?B?YjVFajBlaEtpVWVNZVFTWjVlV1hRVi95dGZZM2tKK2E3VFIvN1RCN202SjJZ?=
 =?utf-8?B?U2NSd2dJS0QraVFXenIxTWdXeHpFL0Q4MWQ5OUE1Ry9uVHdhRE8wRmFaeUp1?=
 =?utf-8?B?WDQ5YTJxbk9WOUFUekNzUTJaZUh4K3F1SEt6YUFtMitQVzY4cHRwODhGMHM0?=
 =?utf-8?B?SlJpQkg0Z3ZuYmszUjZxeERJbUlkcWF3UmFtV1QybXRwc0FTR1RhcFdMeVVt?=
 =?utf-8?B?c2ZCekVySXd5VHMzR0p0MmppbVY0YWE2ak5wVjVFUGxYRmprTEpVVEhzb0VY?=
 =?utf-8?B?eGxGS1U5RFRqcUd2R1RWLzFnSzkxWDc3NHZnTnhaTTd4SVIyYWlSY3ppbmkz?=
 =?utf-8?B?VHlMVW1OdGpmQ0cxa1B5dzhvUElEY0N5Mmd6UVJlcHB4dStCSmdLMnZrbExM?=
 =?utf-8?B?Q2liK1M2bDM3L2FpdVdONnRXOXpyeXJVSjlkNVdla21EWUsxbGZyeUlwTFkr?=
 =?utf-8?B?R3RGUk5ka3RHVGlhTnc0QUhWZGpBT1ZQTElUZ1BvZ055cDhvQzFReGtBZlJ6?=
 =?utf-8?B?bFg0ZWZoMFBuZFpEZTladmVMUmZKei9tbjBBOVNjTm1DT3BJa0ZLVlEvUWNl?=
 =?utf-8?B?VHRzRHQycGNGa2QzWXptaGhTQjdQOUJGT2JHcEM0RHNndGp3QUNDUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c9f77c-39ff-40bc-20e7-08df1ffed9c7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 20:59:14.7340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HlldLRJ5aOBJJPawaMS9Ue4o28FQgIgLzDKuZixR+ZeH7MH6sCl0AzD+pujSqDgIc7k2VCntyNhQEKKAKhWuGhPwoxaHsVKy2SJaS9z6zA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5911
X-purgate-ID: tlsNG-bad1c0/1790888358-BC2F4034-C0779814/10/78276251493
X-purgate-type: spam
X-purgate-size: 3272

On 01/10/2026 8:49 pm, Sean Christopherson wrote:
> On Thu, Oct 01, 2026, Andrew Cooper wrote:
>> I was asked me to explain the comment beside STI in the svm_asm_do_resume(),
>> and, in trying to do so, things unravelled.
>>
>> The original fix inherited from KVM prevented the guests INTR_SHADOW being
>> changed from 0 to 1.  This prevents undue delay to interrupts, but it caused
>> the value to get changed from 1 to 0 if the guest was in an INTR_SHADOW.
>>
>> Whether this matters for IDT guests is unknown; it depends on what else VMRUN
>> can do beside event injection and still write back the wrong value.  This does
>> matter for FRED guests, as INTR_SHADOW is exposed architecturally in the FRED
>> frame via the STB field.
>>
>> Fixes: c989ff614f6b ("x86/svm: Separate STI and VMRUN instructions in svm_asm_do_resume()")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Roger Pau Monné <roger@xenproject.org>
>> CC: Teddy Astie <teddy.astie@vates.tech>
>> CC: Jason Andryuk <jason.andryuk@amd.com>
>> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
>> CC: Doug Covelli <doug.covelli@broadcom.com>
>> CC: Sean Christopherson <seanjc@google.com>
>> CC: Paolo Bonzini <pbonzini@redhat.com>
>> CC: Borislav Petkov <bp@alien8.de>
>> CC: David Kaplan <david.kaplan@amd.com>
>> CC: David Woodhouse <dwmw2@amazon.co.uk>
>> CC: Shivansh Dhiman <shivansh.dhiman@amd.com>
>> CC: Nikunj Dadhania <nikunj.dadhania@amd.com>
>> CC: Santosh Shukla <santosh.shukla@amd.com>
>>
>> AMD have confirmed this is broken back to at least Zen1.  Hopefully an erratum
>> will be issued.
>>
>> Slightly RFC.  I don't currently have a Venice system to demonstrate the FRED
>> part of this.  CC-ing the KVM folk and AMD FRED folk too, as someone will
>> presumably want to adapt this fix.
> I wouldn't say I "want" to adapt this. :-)
>
> Thanks for the heads up, and for the suggested fix!

You're welcome.  After all, I did stea^W borrow the fix from you last
time around.

>> +         * events cancels INTR_SHADOW), but FRED changes this behaviour to be
>> +         * able to observe and restore the shadow via the STB field in a FRED
>> +         * frame.
> Hmm, does that even matter in practice?  IIUC, hitting this would require taking
> an exception in an STI shadow, which would break pretty much any software flow I
> can think of that relies on the STI shadow.
>
> E.g. IIUC, STI->HLT with a #PF on the HLT code fetch would break pre-FRED because
> HLT would execute without the STI shadow.  Unless software quite deliberately does
> things that only work for FRED, I assume the entire thing is benign?

STI; HLT vs #PF was fixed very intentionally in FRED.  In other news,
Windows pages out kernel code, and uses the STI; HLT pattern extensively.

It's not just the #PF case being fixed by this.  e.g. Instruction
breakpoints now don't need special casing in FRED either.  Even if we
don't see a need today, it won't be long until OSes will be expecting to
use the niceties that FRED offers.

The unknown here is what besides event injection also triggers this bug
in the VMRUN microflow.  I've not had an answer to this question.

~Andrew

