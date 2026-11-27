Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB4A606A31E
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 17:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=iPDYzdb2
Received: from list by lists.xenproject.org with outflank-mailman.1505470.1700176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWzqZ-0001JS-S8; Fri, 27 Nov 2026 17:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505470.1700176; Fri, 27 Nov 2026 17:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWzqZ-0001JL-OS; Fri, 27 Nov 2026 17:34:55 +0000
Received: by outflank-mailman (input) for mailman id 1505470;
 Fri, 27 Nov 2026 17:34:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xWzqX-0001JC-Sg
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 17:34:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWzqW-00F7YR-Uq
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 18:34:52 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b09bf08-2eae-0a2a0a5409dd-0a2a4508a6dc-32
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 18:34:52 +0100
Received: from [40.107.200.48]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b09bf3b-f659-0a2a45080019-286bc8307d37-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 18:34:52 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by FT1PR03MB599314.namprd03.prod.outlook.com (2603:10b6:170:3d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 17:33:48 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 17:33:48 +0000
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
 b=vm2kXLnuOh4GRDu/5un/+/6ZEAe3DalkaVdMCgfSvhv/WNi1tB8c0/yBR3ft3wUy3ppci76AYPiq8f++1GBawE8v+ShNLmopJZWuuIxCKr4YvD3g2wMq+JoC4ogc3LozxuDJEeZoq6AnhzYg4szqzlGthkJJpqcp04c8XOSTv4YxAmoMJSnBMOP3M5dHS08ASysYOD2uqMfDm0JOzkUzaK5BElRshgsCpvL2lvfSTkheXa4BwfH2sIdzgjYg2rd+mgdqBwKGWdoKufsXSWb3jAE5cOXBmECLvuqkaq5U++SqKBI0biqLrWwccQE8hXMnGSpMaoxgmN8RnMyzxtJSlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jk4NSynBZFNNd62tTvzO9QUHEM2GgFOvHdAF0R6HH2I=;
 b=K7oST3SG32uF6jgrK/zxfacqIXYEvlNbnYeGJcHtWefReUOHTX+STIErGbWxFpc85DJ9g1wmFaPXbHqAC/2Soh/EzF8vsa8pTr3CFv3txLB2KAb7EKnS6hvJNE00Zyf4oHwkg+ARKOSpcO1wA04huWT/wJuCuhFJf6Zqd1a6woTgCKw7Py8T3C92blRuF28uHp9m0xsyCSRYlk3ZLisSAr4NKFZqR69MkWOgwoJRWb57P/ljve7bXv875ExMm9fEMbRN1GGyJAF53QgkLp4aRAGO+6LCVXsGza2pc04ZULqRRDrrnXBz6vWL6EvfpYaIZJwF0mptG1jwWL1RftU/kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jk4NSynBZFNNd62tTvzO9QUHEM2GgFOvHdAF0R6HH2I=;
 b=iPDYzdb2KFUh7/l73hYpXzeQUsMqT+6wr1pGlZO39tnO3sSGG7y3EuPTX7JyQQJBjko+sKZYau3UkSpHKjTL1IhzOnwC/LxVW+Ji7RXXcjMPB2l3726Wc6Ogu86bZPeq5iIhO7U3tbfw6OcNFb6agV2MKuldeQI0c6aVC5hMN6Q=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <adfb80d4-5635-405e-b932-d782cb4141be@citrix.com>
Date: Fri, 27 Nov 2026 17:33:45 +0000
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Firmware-enabled split-lock detection causes later crashes in HVM
 domU [QubesOS/qubes-issues#11300]
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, thierry.laurion@gmail.com
References: <awmNEIRH1GHGpYDl@mail-itl>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <awmNEIRH1GHGpYDl@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0166.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|FT1PR03MB599314:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f6660d-9bda-460a-c4e0-08df4cac9843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|18002099003|22082099003|261009223027099003|10067099003|3023799007|261026121527099003|261026140227099003|261021123027099003|261102123227099003|261028144727099003|261021121427099003|261022105027099003|261022075727099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	IPgHxUq2/cyKkSqOF77ffE7iEMvT2SeMRT2rLFHuowgwLo+/o6Bh5zkjy0slb+vPmfgohwSvTOCrLBXAtq3ayMB7wZSL/gE67VCqkmzMKykPkeFIXd+FWwrtTMR1/+0noPTN/i4oR45IPiG2i2FNoSjBEe/NDpfbL/hFsFa7hi/p/AtjRPL9rACGbmlckzSizZYqW4OJd2HlOCC+Bxy6OhKj32vVTl4TQv/1kqF9T6ExLfX+79xWL7xNpIgryP1jO5iZX3c2cnosyo/pQXYebAXx+gVovj3p9dGhpYdJY0fWHKZrHXNet02fDo06iRlYRTrok1K0kdvZr0C+A5L6LLfMuVptqZDOUu7YFaYDbLWQXXAN+l8407TLGMGPZ/5nM744nLTbfbNwtcguFwyMu0DX6lS1Im7ZF1vmx2l6LSYw0ydm/jvtWvLQxKBo7SzUZ2Ph0Zz4HRzwJDA+emRl44m15us7hn0dRCAtyOKd+aGHgqlxaPP96lhHGmAfbO0q6Kwqx5hmfpEyv7NH8FZcXxb8hHUCQV9f4euJYN+jh2mnERCmuocViX/EMIMQIzUdWwmcrjBvWKdfI6etfyRUhkPqMs9G4iWUlInogCIw1Lmnd1Ik50yfc/dDY7End9t1IyAyUDVG9TdonuMMQqScW8XWUSV9/4fIiS1QpBb0Y68=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(10067099003)(3023799007)(261026121527099003)(261026140227099003)(261021123027099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261022075727099003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTZzejd0QklDRDNFQXZCaXpiY1pWT3lmbm1obHFjcGJNVDFvaEd6SFpRcEln?=
 =?utf-8?B?WUh5TTdEd3NFeFRTTXZmTzkrWjc3aWh2eE05TFBjTFljWFJDKzN0L0pjbmJI?=
 =?utf-8?B?ZHNWQmZJbVVpWTB4cEFLaEU4YUNtVi8vWHBsZGR0blpSZzRvNVJwOWdqMSsv?=
 =?utf-8?B?WGRkbXJYc1JyN3VtL0hJYXcyUys1aEdrempEUXBpd1NCbjUvYXZPL2VKVTVT?=
 =?utf-8?B?VnVSOU1BU3dOZFVEZFJablhvUXpoV2NWZ0I1MXQ2MHgrREFwKzNUSUY5N0dk?=
 =?utf-8?B?aGtjamxON24wZnB2ejZKQjNSSEtoTUQ0UDN2K3RTWTVINGlGTThEaXJSMmFs?=
 =?utf-8?B?aGR4VEhhaXpSSVJxNTV6d3kyNkxVbnVpSm9McWhKRzk2aXl2YjUva1hGZ3Fl?=
 =?utf-8?B?ZzFkNUtoekdyNlVtOUIvV3BWR3VhdU8xQUhpOUNxbzFOYWtvRGxXREd2Lzg5?=
 =?utf-8?B?b1lxSkdIWEl0dlpwK244NUhseFlBRXRSMFplOGVudHluYzE4bmw3SEgxNnI2?=
 =?utf-8?B?eUtjemJuR0ljTmtEQlFVSFFuRnNUdFh4NzJDWkhFZjBXWmhad2Z5YTNYc3Z1?=
 =?utf-8?B?VjZPaGxtRzdORzRGRkF4ZFliRm1temdoRnRPSHpoN1dqcmpFOHZVc2dXZnJs?=
 =?utf-8?B?Q2tOWWFzTjZhWXJ5TlU5N0Y1S05GemFFRFFwUm9XTXJrR3pDdngyWlkzdHd0?=
 =?utf-8?B?V1pqQkhqckdhMSt0WHgrdUljdU5USThwdkRHVFNsamZyWkdRSGtzNTlYTlNs?=
 =?utf-8?B?bUs1SE03TnEvNnJDS2ZNQnpuZ0VmVmpBQnFaOUh0Rm1vUUNZQmpiSjRPQlBL?=
 =?utf-8?B?WVhsRDV4Ly9nNVplcDk5Wm1USUJGWk85MmVSaTJRZDZaaTNyZDVqU1lHa0hr?=
 =?utf-8?B?YVNCM1FkeEo2cjJmRjZKQ0swUjR2dDBoYnBtakJFQStkaERTSjV5YWk2Zm05?=
 =?utf-8?B?NFNqNm9rSkphLzg1UnkvOEk3QS9QWDMrRTFEaXB0V1ExNXBuU0IvRmh5dTV2?=
 =?utf-8?B?dE5Uc3FaMEpnaTAwVUVleHBEd0YyWTBzdlVjWGM5alBDcktTQTNRUVI2UUJr?=
 =?utf-8?B?L1hXbkNtaVZRUUJQbjIxMmVBblRLNEVHbktHbkh5a0JnT0tKN1g5RWl1a2hG?=
 =?utf-8?B?d29SOEN6ZmVUTWNscHU0VWFIR1d4NE92RGVkM2wrRG5iMUtVc0ppN0N2cGJn?=
 =?utf-8?B?RUI4dkIzWWNPdHROVUhKZ3VWU2Uyc0tOVXVJS3BqVFVHUnczSHZWcUZJZytt?=
 =?utf-8?B?UFp4NFpjUTJ4OVlBQ1FTWk0ySk5xUWc2NlVVVEdwb2hlSWFrT0VOUy93bm4y?=
 =?utf-8?B?OUE4Y2xPcUZjRjZFOHdmM0hkVHNIMXdMK1pHNkN2c2NHcmxudnVlWFBiN29L?=
 =?utf-8?B?Tng3YTJmV1hyZWlZaE9lT2dqZmRJOVlycm5TTU1kdWVVV3NRc2ZIayttWUxT?=
 =?utf-8?B?REVRbkxYc1hjTkdTbDNoRTZkWjRQalZVSm5DNFhaUCsxNWRhdStjcllyY0Ro?=
 =?utf-8?B?MnY2U0RDWXArYmszdElYVTNBOW1MaHBseVkrVnZzbzIxUHBURnBJeG9JTDlw?=
 =?utf-8?B?d3VlaHpYMitsZy9BZS96czNya1BVT0pSVU51bXZuU0pPNzFIRDRWMWQ4emJI?=
 =?utf-8?B?OTF1MTF4SndGMW5mMXZUYVRwd29WVThlaWpHeERyTTFsRjY5ejZOMEJCMEo5?=
 =?utf-8?B?M2FSdjV2dklrSUQ2VzJHa0kwbU1RZm9EVVNOWkU3R081d2dmM2dqNHMwUFcr?=
 =?utf-8?B?dnh0US9Kc1FXZGN0SDVoTDNIMklLRTlSamZZdmpqTHE4TUk3VjU2blNLVVBF?=
 =?utf-8?B?YS9CaTM1ODhvcWszUk5sVGc0UUoweFY1emNUVW5nalJpV3lTOGp2L1RSN1Ni?=
 =?utf-8?B?SWhkMlMyNHZQc3BvZS9tVVdvK25ZU0hoVTJrZXJKTGhoa0hJbVUvVkRCZWtx?=
 =?utf-8?B?Mk94K2JLWU13KzhvOEVSdzl1akRkU2cxOHM3T3hZSHF6aE9WNUdRY2N5VHAv?=
 =?utf-8?B?Vmx5WjZ4ZEFDQkFxOW96VDlVdDhjdkJpQUNqWG9oVTlKQ3JVeHQ3cERhUHFO?=
 =?utf-8?B?Y0ZqUlRxaCtEWnhiYmVzVmI1ZjVCM2xJcWxpMTRIK0UyQlcweHV0dmVneWpV?=
 =?utf-8?B?SGRjM1p6THloRCtId25zRDBTMGhjbDVDUHhxaHVZbmNlNDdHaTNscnRqbW16?=
 =?utf-8?B?T2h5K2dTNnU2Wm02eUEwZ3ArNlloRm5nNGhTYzZ4SWJ3L3BUelBrQWtKNW1S?=
 =?utf-8?B?RTlPcENXQzRDN1pwa0tkZ2U2dkE5cnFESUtBR21qbVlmODAyREpRK1BJNzBZ?=
 =?utf-8?B?QnFjK2xRUDBudVZzTllzT245T2FHNlJ2U05MWGh2bmJtSVNmVmdGakw2YXJw?=
 =?utf-8?Q?LNn20OGnTIGyAa10=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f6660d-9bda-460a-c4e0-08df4cac9843
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 17:33:48.3538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujrSVw7qBJxxXhltup7zDBYV2ExPk3CMKUG/ugygD/xVaYEf8+sxXWw6328WpXpL591S9krteSUDZQXTgaM3UEs2i+FHKeNWnbutk6+Zis0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR03MB599314
X-purgate-ID: tlsNG-c1860d/1795800892-D4B7187B-0525B9B0/0/0
X-purgate-type: clean
X-purgate-size: 8086
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/11/2026 2:00 pm, Marek Marczykowski-Górecki wrote:
> Hi,
>
> I'm forwarding analysis I've got in qubes issues. Looks like something
> that either Xen should turn off, or handle better (as KVM and VirtualBox
> supposedly do).
>
> ----- Forwarded message -----
>
> hippalectryon-0 left a comment (QubesOS/qubes-issues#11300)
>
> @loftlifter31 Thanks for the logs. This is probably not memory corruption. The three crashes with parameters (dump2, dump3 and the one in hypervisor.log) all fail at the same instruction with the same second parameter across separate boots, and dump2 and dump3 show `nt!KiAlignmentFault` (the alignment fault handler) on the stack. dump1 has the same fault code, in `KiInsertQueueDpc` (its stack is cut short). On x86, normal alignment checks only apply to user mode, so an alignment fault in kernel mode points to split-lock detection: the CPU traps a locked access that crosses a cache line. Xen passes that trap into the guest, and Windows crashes. KVM (in its default mode) handles it on the host instead, and VirtualBox seems to as well, which would explain why Windows runs fine in VirtualBox on Debian.
>
> Xen never turns split-lock detection off, so whatever turned it on before Xen started stays in effect. My guess is Heads: it boots Linux first, then kexecs into Xen. Linux turns split-lock detection on by default on Tiger Lake, Alder Lake and Raptor Lake, and doesn't turn it off before kexec. The `split_lock_detect=off` you added goes to the dom0 kernel, which can't change this setting under Xen. This would fit the forum reports (Alder/Raptor Lake on Dasharo+Heads), though one of them says Dasharo UEFI crashed too, so Heads may not be the only way it gets turned on.
>
> Could you try, in order:
>
> 1. In any Linux qube (no reboot needed), run:
> ```
> timeout 10 python3 -c 'import mmap,ctypes as c
> m=mmap.mmap(-1,4096,prot=7);m.write(bytes.fromhex("f0480fba2f00c3"))
> f=c.CFUNCTYPE(None,c.c_void_p)(c.addressof(c.c_char.from_buffer(m)))
> b=c.create_string_buffer(256);f((c.addressof(b)+63)//64*64+60);print("no split-lock #AC")'; echo "exit: $?"
> ```
> It does one locked write across a cache line. If it prints `no split-lock #AC`, split-lock detection is likely off and my theory is likely wrong. If it hangs until the timeout (exit 124) or dies with a bus error, it is on; `sudo dmesg | grep -i split_lock` in that qube should then show a `took a split_lock trap` line.
> 2. In the Heads recovery shell, `dmesg | grep -i split` and paste whatever it prints. This shows whether Heads' Linux turned it on.
> 3. If you can rebuild Heads, add `split_lock_detect=off` to the Heads kernel command line (`CONFIG_LINUX_COMMAND_LINE` in your board's coreboot config), reflash, and see if the BSODs stop.
>
> If this is confirmed, the imo fix probably belongs in Xen (turn split-lock detection off at boot), not in Heads. The microcode difference (0xbe under Xen, 0xb8 under Debian) is probably unrelated. `xl dmesg` confirms Xen is started via kexec from Heads.
>

This area is far more complicated than it seems.  Some history is
necessary, and various peoples lack of precision in the past has lead to
misinformation on the subject.  (i.e. Linux's command line option, which
confuses the capabilities.)

First, some terminology:

* Bus Lock.  When a processor has to exert exclusive access across the
entire system fabric for correctness reasons.
* Split Lock.  A LOCKed RMW instruction, with the memory operand
crossing a cacheline boundary.
* UC Lock.  A LOCKed RMW instruction, with the memory operand containing
non-WriteBack memory.

For both Split lock and UC Lock, the CPU tends to handle these cases by
exerting the Bus Lock.


Second, the capabilities:

Intel have had MSR_MEMORY_CONTROL for ages and ages.  It is entirely
model specific.

One well known bit (31) in it that isn't publicly documented is "split
lock disable".  AIUI, this bit simply splitlock conditions to not exert
Bus Lock, and result in non-atomic behaviour.

Starting in around 2019, Intel introduced MSR_CORE_CAPABILITIES
(alongside MSR_ARCH_CAPABILITIES) in order to provide model specific
enumerations.  The MSR itself is architectural, but the bits in it are
not.  Model checks are required to parse MSR_CORE_CAPS because some CPUs
use the same bits to mean different things.

MSR_CORE_CAPS contains a SPLIT_LOCK_DISABLE bit (in a model specific
position), which enumerates that bit 29 in MSR_MEMORY_CONTROL exists. 
This is also called SPLIT_LOCK_DETECT, and is documented in the SDM.  It
causes a splitlock condition to yield an #AC exception instead of
exerting a Bus Lock.

A related enumeration is UC_LOCK_DISABLE (again in a model specific
position), which enumerates that bit 28 in MSR_MEMORY_CONTROL exists. 
This turns a UC Lock condition into a #GP fault rather than exerting Bus
Lock.

Both are faults, so they break software which encounter them.  It's fine
for debugging your own code, but it isn't fine for running anyone else's
code.


Intel were told this wasn't good enough, so they went and made the Bus
Lock Detect feature.  Bus Lock Detect is fully architectural, and AMD
has picked up the feature too.

For the non-virt case, it causes userspace bus lock conditions to
trigger a #DB Trap (i.e. after the Bus Lock occurred).  Importantly,
this means that the kernel can ratelimit problem userspace[1] without
breaking it.  Linux prints out a message and deschedules for a while.

For the virt case, both Intel and AMD offer a way of getting a VMExit on
Bus Lock.  This applies irrespective of CPL, and lets the hypervisor
ratelimit problem VMs, whether it's a problem kernel or problem userspace.

On systems without Bus Lock Detect, it is possible to use performance
counters for the same purpose.  Xen doesn't, but other hypervisors do.


Third, the interactions:

One problem is that MSR_MEMORY_CONTROL is defined as a Core-scope MSR,
not Thread-scope.  i.e. we cannot context switch these settings because
latest-takes-precedent and clobbers the sibling hyperthread.  On Hybrid
system, this clobbering only occurs on P-cores, because the E-cores
aren't threaded.  So in practice, the choice to use the DISABLE controls
must be system-wide.

The next problem is that Xen doesn't intercept #AC and #GP, so the
faults end up getting serviced by a kernel which isn't aware of their
cause, and doesn't have the controls available even if it would like
them.  We could intercept and emulate, but that's opening several
security cans of worms we successfully closed previously, so isn't a
viable option.

If the DISABLE controls are used at the same time the DETECT controls,
the DISABLE win.  They're faults and block the memory access, meaning
there's nothing to trigger the DETECT for ratelimiting purposes.


Anyway, to the bug as reported.

IMO is a Heads bug.

Thierry, you said "but Heads tries to override unsafe defaults from
firmware", and while I appreciate that point of view, splitlocks are
purely a performance concern, not a correctness concern.

It's not reasonable to ask OS or VMM to turn this stuff off.  It's very
model specific to even locate, meaning that we'd have to keep on
backporting new model information to existing releases for them to know
how to turn it off on new hardware.

It is great that Heads has an option, and I even recommend people trying
it out.  I even have a patch to Xen to let an admin try this stuff out
too, but people need to be aware that it's invasive into all software
including VMs.

i.e. Use of the DISABLE options needs to be opt-in, by people aware of
the consequences.  Xen does use of the DETECT options when they're
available.

~Andrew

[1] It being userspace-only is my "fault".  I had to remind Intel that
there were security vulnerabilities to be had to do with re-entrant
#DB's because of how SYSCALL works.   This has now been fixed in FRED,
but Bus Lock Detect didn't change behaviour.

