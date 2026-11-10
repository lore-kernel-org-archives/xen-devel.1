Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757C3606A321
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zV+oPNx+
Received: from list by lists.xenproject.org with outflank-mailman.1480988.1684769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhsY-0000PE-VJ; Tue, 10 Nov 2026 09:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480988.1684769; Tue, 10 Nov 2026 09:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhsY-0000P7-SE; Tue, 10 Nov 2026 09:10:58 +0000
Received: by outflank-mailman (input) for mailman id 1480988;
 Tue, 10 Nov 2026 09:10:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1xQhsW-0000P1-Ud
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:10:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQhsV-00AMWq-Ss
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:10:55 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6af2df9e-2eae-0a2a0a5409dd-0a2a45049eca-6
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:10:55 +0100
Received: from [52.101.85.22]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6af2df9d-b57f-0a2a45040019-34655516808b-4
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:10:55 +0100
Received: from CHBPR12MB780315.namprd12.prod.outlook.com
 (2603:10b6:610:36a::15) by BN3PR12MB9570.namprd12.prod.outlook.com
 (2603:10b6:408:2ca::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 09:10:50 +0000
Received: from CHBPR12MB780315.namprd12.prod.outlook.com
 ([fe80::6f6:156c:5674:75e7]) by CHBPR12MB780315.namprd12.prod.outlook.com
 ([fe80::6f6:156c:5674:75e7%6]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 09:10:50 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWlpyVelxMIx5Uc2UdPW2Jrl23sPGF0cqxjvsRmYcihbfZ9ZzH6m3t0WewRPsUEcux7YvOiE1t1OiRAaODsYqUZiLXyg8cjzh6cfzsFPn8G4M+xX+u/B/O+f8LqBQ3M3XW8Jd6lrnRYRuA+AexDtNhWmNvCS0n65ZtD+Cv/FvwgipHpIUMNsNRuLKdo0e0D+P75Kllr5zBA4q53MhvtfJFQajYIdcykbKHDTUuVzCTUnCd/HuybrV1/b76UMO/j7arWI4EJCWKyb81eFL+egJvY+bHeax8ADv8DkWT7JSzmFFs+kyFz4Ubr3Js5kExaWdZwPBi+qMh5t7w3dIEuldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95lf+0J6m1H5yD3wWpgCi8OODwf5CsVuGNVDqxrdsns=;
 b=Wy77r+bYMGIFQZD1QtaLzDHxDwxQkI1JUCE4veqyZrTdCES2Vf2OlDSSBQPzSuUlTiENASKQnME2E+YeGCwB615D4zMvPoZzcRW8vzuKTfzRriLa+CSgJQEm/xursJ+ZizChNIclCy/PriJui3Avhcw8ia1Ye7A57QcZY6A7TC+CkABFoOS/Sk4BkVFF2hc+ihQ9uFhF+XIv8sYZ06EYoB3gk/0WKRr3gtGItPpusYloCWoF8qdZngaM9gwIwS9ETdN7ZHkRgLSrWB+Rd0p4DZ8ZuFSThEATG9ZRYy6L5ojHSKDVBEc/3+2saeNeyAFgs1fVon9Xn9iQ/vyt51TIeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95lf+0J6m1H5yD3wWpgCi8OODwf5CsVuGNVDqxrdsns=;
 b=zV+oPNx+gbMeXqrnuwRIm2roMbGXFFh7MmNEORLBWMljLO9njeznyi1LY6avv59ZDu76riFLyICehKD45FcHmNDUuzTK4xK6pf98BZKTBsLG+4dr8y/+MD1f1GC2IGa/6KfSMOafsr/U3gyOT2yWT2lwAmLqh5yMDdccX3P2Edw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <14f7eb35-4dfb-4c2b-8594-fa07cf700bfe@amd.com>
Date: Tue, 10 Nov 2026 17:10:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl: wait for QEMU exit before restarting a domain
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <penny.zheng@amd.com>, xen-devel@lists.xenproject.org
References: <20261104064645.1171477-1-Zhao.Jiaqing@amd.com>
 <0762b21d-3173-4014-bd43-fa2a9cef9c85@amd.com>
 <fdd91377-bcc1-4695-8cb7-b5db1f0f71ab@suse.com>
Content-Language: en-US
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
In-Reply-To: <fdd91377-bcc1-4695-8cb7-b5db1f0f71ab@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0020.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::10) To CHBPR12MB780315.namprd12.prod.outlook.com
 (2603:10b6:610:36a::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB780315:EE_|BN3PR12MB9570:EE_
X-MS-Office365-Filtering-Correlation-Id: d950111e-4869-4def-0027-08df3f0a83af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|4143699003|56012099006|261021123027099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ExIW53iycazZGA4tXYzIlj/a9Zz2B2i/zVC3v+tkvy7zT/QwXV2HlBc/EHZzRwnWjXn3Mr8j4mJTLJPwxZe3owwv206ZCHvQV8XRvKq3ir9wmg4hU5WE0TcM/hrs4pxxwZWwNxoVD9WcvOz396e00TaiPjhr7cok7APHp1i32N7sIRg4fLmofkXZqzrnnmPRPiAMzfCeJ9kyB1cJqxWUqecloucdsaBVeduKDVLa+3oL7kOcuBPV6/LkrpKS0WUG8KTJ1ACGKdbcB2lwQE9jfqKAaWhcrsOlhwytSBfwLVdkS+B9n+O0UuieKAjVyQjDqysbWas5w4aDxI+lWzTbnUpsKMyxiK3K7bWHLMdd2K3cfmUfCkorUb4Bwq+4OxTUESZtuyBG2Ei9GwWE/7IALuHmeDfvkAlc4MrtB9tyLRhhtqRY+TD6pxBbW+Q61ap4vqCKw8zBtVzgIswg8cBTEKOS5hLQB254VrzBQ0k0W0KP9H1mdBo56uSnwtBpAVOf5ZT+UAzGF6BjNCKRL7xB/BLcmPvoqnlnQ5PhPGXaCDccJLv2O9T0rYnxVjZBGHC+uUZRj6GNWZdqqz3uYLTWca1I1+1PfTAJWKe4PZFl/rLKKU4KStjmc3xtJ1LrYQ6brefFMhfsmyFyUrIrlP5DW5nJd0LVieg13vkmWNe/Mbo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB780315.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WG15YzFOU0NLN3V3T2RPb29NMVd4V1dxQUFsRmNsYmdZNUJkMnVicDBxdmRL?=
 =?utf-8?B?QmxVU2tpMWxUdldFSVNkQ3VCK0ZBb0sza2ZwNUV6TjR0dVZDRWo1UUFlV3pC?=
 =?utf-8?B?dGM2SzJRWmpoZjRqMnkrVlliZnVUeWVGY2p0Q29sUmtGYUpHWFpQckRlN0hJ?=
 =?utf-8?B?cGFaVDVVeHFnbHNxTXgvWnJYcWUrZmsrRGxRMGVkd0xzYisxMG4xa1ExN0R3?=
 =?utf-8?B?RUMrMkc1TkZ0bFJ1SjhMRTVQOWJ1TERGbXhtbjRxSjBrN1dLM3VoUWxNWWpz?=
 =?utf-8?B?clcvZ0NvcHpaR2tKRmdJeG1mNWRabE0vMTdjQW5PWjRlNysrclIzMm1ONk84?=
 =?utf-8?B?bTNRZGFEWU4xQkl0WGNWbjc2M3hnZXV5ZXBYbW11eXVlTGVDTXBEaG83OUNm?=
 =?utf-8?B?d2R5NW1Ebmc3L21STU9nVGEzWVVNR0s2bnc2cWw3SUNBbUtEdjJadlN6cWF4?=
 =?utf-8?B?MjRYVndOSEdYeVJ6U0hRYWw3OGlMY0l1V2t5K0hCUWZmbWRYaEJqYkpMTGp5?=
 =?utf-8?B?eGxKb05McXlJTkZENVFDWTRRWU81WlAzNFl1MXBRL0w3UnJYWWdCVWRrOGpn?=
 =?utf-8?B?YjZTMWhNYWhpejdhRDNWTlRCSi9DcVFjbXVXRGE1WmljMEpudk9FQTE2emV3?=
 =?utf-8?B?a3Y1M2hWZzBsL1QwYXUwU2doanB0NUxqRGFhMnQwTURhMTFNZWxIM2Z3ZVdy?=
 =?utf-8?B?YTh3VUJoWjZnL3JpQ25yZDloUjdaSFRNa011OFlFNDdFbllHMXo4NHJ0SHB6?=
 =?utf-8?B?ZWVoQzFGNVlKbklsTHhpOEZjS2hOa2FBbTNmemRKb0cyVjdrM010LzZIbTU4?=
 =?utf-8?B?bVdkZm5iSnBTdmFCMGMyQVB2SXJSTlBjeC9EZzNYVzErZ21aMjluMkR2NmZn?=
 =?utf-8?B?OXlpMFFjc3BtNVVlbWQ5NDU2WllNc1hScnNkbmt0MUxBNDNoWFB1cWd1dHIw?=
 =?utf-8?B?RWZidFlGK2xsTGQ2T0NGaE9ORUVtMm1GR2lFcXd3K25YMzBNYVZVc1FyRnAw?=
 =?utf-8?B?YkpTTnZ0bk5ZSlg3VFRjY3lLdHAwM2FXNFZ2OERiazNtWUVXdmEyd1Nyb2tV?=
 =?utf-8?B?czN2OHZTWmlRVDJLdG1sR245L0laSzV1M0FtSkJFL2pvWTlzM0RVT0l1MFlF?=
 =?utf-8?B?Tko5WlM3cE9JYTJhY0txL0JuZUcycTRuR005SlNKQ0kyZm1FRWlOSmVBRnRi?=
 =?utf-8?B?ZHhyUXNtbGRSOE9xQkxWaE9kQ0JFa08zQU1heTR4ZGNyclRWNnVvcCsrWmhs?=
 =?utf-8?B?djlNRC82L1pLV2NLSGpzS2hWVWN4eU1EVGNoRFEvR0JwWVBoTXU0MDd6Yi9M?=
 =?utf-8?B?ODZxOEZEMWFTRm81SUEwdHhlUU5POGtFcWo1T2k2anNiMEZTdHRtSWRFdy82?=
 =?utf-8?B?a21EalMrOXhHSnlwZG9wRG9Iang5d1FZYVlJVXZpWnNHallXYk9XRHVkbVVo?=
 =?utf-8?B?TVJ2OGpDSktqSTZqRFFtT0U2bnB1R2lKMk8ranR6QnhqSUM1QkZkc0ZvZjhr?=
 =?utf-8?B?bnRFZzZlSEJieHFBS0ROMXdKNE5hMHdGK1ZlV1pCVW16VTk5djRDcFBYZVJ5?=
 =?utf-8?B?ckQrT2gvV2wzVDNYL3lJSHhPUFAxeFBlMDBKMi9WdFVQQ3FqNUdqL09mcGlk?=
 =?utf-8?B?QkhCdVczQ0NDSjhhd3ZTWDI1MlR1QXZsMHgwUVU1S291aENIOHJHclJZa251?=
 =?utf-8?B?NUNkODdKQ294V25QdTZWWWdlNUE2Sjh6aitHeUk2ZC9lbG1wYm9kT3VUdllo?=
 =?utf-8?B?TXdlUitPUUZnQWNsQ3U5dlYxNGF0L3FCTWdEaEk4R1ByYm1sWXpsZlpFeGxY?=
 =?utf-8?B?MWgwVURPdG54ZE9ZSWlYNk9kUEQwL2lMUDlkOVBRei9LTGp2N2hlQkppUDNw?=
 =?utf-8?B?VHV4ZHlxUTVHc0F2L1hEaXhtMEROZTFFTjcxTkNWcThaNXZGcVFrbW1vUlZp?=
 =?utf-8?B?OTNremJpYzd6L0RSTndmZ1RRbU5BNkUrUWJubVBpbXF0elJ2UE1OdTB6RTVR?=
 =?utf-8?B?ZVUrRmo3UTN3WVdiY0N0bnZIaTAwVHUyOHpWMG45dUFuUXRsM2s3eWN0eTJP?=
 =?utf-8?B?bW5uS0JhOUJSTTBPeVY0Z0c3alhabVVnNWtMSzNSbnVsbFpRNjFzUlBFVkFD?=
 =?utf-8?B?KytNbk10Ly83bzRFK1d3anZCT3NrUEN1UjN4Y1d6M2tmZkZkV1ltektIQlc3?=
 =?utf-8?B?TnhuN3A0Qmgzc0s0ejRpUXRtU0JRb1V4NVNZZllEbW95alRLR2UvRFEzckd0?=
 =?utf-8?B?Q3hSM1pnOENoVlV3WDFiY3plNW9CcDhtNjVyS2xYNnR4clhtZVBmVncwOTVO?=
 =?utf-8?B?MkVKWnFhaWZ2TUlOeWlrekdtVHpVaUQ3WmFtSEJDcWpKSGd3SXJUZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d950111e-4869-4def-0027-08df3f0a83af
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB780315.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 09:10:50.4246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPkCQUmlFh+heYiqcjsVocgHCwU29gTqwkIpFF2Zc0cnnzl76iK0KmoSAjP3OsTkPhp0xO2Pre5M+HzmRZv+VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9570
X-purgate-ID: tlsNG-ebf023/1794301855-C26CAB50-0E41CFCD/0/0
X-purgate-type: clean
X-purgate-size: 1281
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-05 16:13, Jan Beulich wrote:
> On 04.11.2026 18:33, Jason Andryuk wrote:
>> On 2026-11-04 01:46, Jiaqing Zhao wrote:
>>> The PID-based device model destruction path returns immediately after
>>> sending SIGHUP, before QEMU has necessarily exited. When an HVM guest
>>> reboots with VNC enabled, the new QEMU process may fail to bind the VNC
>>> port because the old process still holds it.
>>>
>>> Wait for QEMU to exit in a child process after singaling it for at most
>>
>> "signaling"
>>
>>> 60 seconds. If waiting fails or times out, log the error and retain the
>>> existing domain destruction behaviour.
>>
>> 60 seconds seems like a lot.  Did you measure the time to see how long 
>> it takes?  It's an upper bound, but maybe 10 seconds would be better?
> 
> Is 10s enough for it to time out upon disconnecting pass-through devices?
> I'm seeing this happen routinely, albeit with an older version of qemu.
> 
> Jan

I checked the code, passthorugh devices are removed via QMP, with
pci_remove_qmp_query_cb(), before sending SIGHUP to terminate QEMU.

Passing through a PCI SD card controller on my system took ~1.2s from
`xl destory` to sending SIGHUP to QEMU, and QEMU then took ~50ms to exit.
So 10s is pretty enough here I think.

