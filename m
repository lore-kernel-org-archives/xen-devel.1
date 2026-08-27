Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE57C61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:54:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401222.1636971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzcQb-0004WR-EO; Thu, 27 Aug 2026 15:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401222.1636971; Thu, 27 Aug 2026 15:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzcQb-0004WK-BS; Thu, 27 Aug 2026 15:54:09 +0000
Received: by outflank-mailman (input) for mailman id 1401222;
 Thu, 27 Aug 2026 15:54:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wzcQZ-0004Vv-ND
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:54:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzcQY-003SbQ-6c
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:54:06 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a905d77-2eae-0a2a0a5409dd-0a2a4508dcea-38
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:54:05 +0200
Received: from [52.101.46.31]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a905d9c-f659-0a2a45080019-34652e1fcfbe-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:54:05 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7913.namprd03.prod.outlook.com (2603:10b6:303:274::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 15:54:02 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 15:54:02 +0000
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
 b=giSA/179hl7G7gpHaQGs6d3pMVh2pvad00HmDvUM3SkOjcFdtbGmkoVAinw2fxOgfjbRr8dUnuwMl+1KW5YNowfjXBSk3Zx7P+lPz0nBoirQ3k+u7S2JKfnIny8Zk91VrpxT8FSasbqoQ1GWy57m47q6JHEyaJOzvVwQeN51foSMpkKlFTg+wNqFusuyWVi7xWRWm50o7WABmWbluInn+E2rZT79xnwDod8dH20ACVlxjTR4xb5R8ktqh4wUvQ+7Q2Jean6rwVxhvW3sItwZysuG8WCtRuA1OWZiviis+5nMM014se5s64AqpmgMUohjmsCoDE7g8JeSldJVMSHexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuNI2a00IKRkgX1VHfLyGsdp3gNtWpTxViEmiJ2soo8=;
 b=cI1okZVSfG+9gMyMNZuOnGShulUARQNuabsBBdJUxEIZs3LrDFydhqLXtlq3aA2MsyR5Xr8NnWbi1j5rHZL2ijULwyNF8clyu441eJIOzYl3vAcFUBMLGPVp40iyJntMVTRg/bB38JvUo5oCFfOnGoU1ofatwY8FWmwNX+e+KQndZs2Aklu3Wa+083IabrJriOVhnxnYiVjTo2WPl78YwHUawJs6la080HYRS/TnzmXUKbbOfbwgQN48bJHM40tSuf4VlMgrc1hPzfcBGpmAK8uQh86W0X+d1TY1N7F114HInSHzVa1hyBDxEtuTVbIdC2mGnhX9bXrM55BbZ6bg0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuNI2a00IKRkgX1VHfLyGsdp3gNtWpTxViEmiJ2soo8=;
 b=EaGiPa+l5pzdG7LuL7wKSTKhB7U4ZCE6slaBSFHtDDYrsQ7fwe3dT0S6r2qskxe9LsZpumUfb8/V7are/dvqljaRD1SWSPZZJ1HGD3u0FAW+iYtIVxTUq71KKPSEJY0bIgzYgIhIYxx8thxJ6gQCvZJENvCtPyDTcZpyIphibFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fbe6796b-19ef-4be7-9bc5-09d2281157f3@citrix.com>
Date: Thu, 27 Aug 2026 16:53:57 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v2 7/7] RISC-V: place .sdata / .srodata /
 .riscv.attributes
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
 <f26f80e3-0b2d-429a-895c-b8003d1c5a38@suse.com>
 <0d0c6a5b-94a5-49c6-a150-3bb6a0dc3b93@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0d0c6a5b-94a5-49c6-a150-3bb6a0dc3b93@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0004.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: c7097832-31a5-4e49-0d33-08df04536a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|11063799006|56012099006|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pOG6Wa4YnG+TK2g3NLobF2YrySnGVNotTuAOFW0xkKqidpMPwke+F7j22/gRWjO+/RHeSpV6xw84i4Da5Q6EON3JydP4FZrOBuQocOYChL11O+iieq8RlndIPrluK3Uo05i5Nzb/AUDoT519xIMnxiXHu+NFtb7WPgH9EC1O+9ff9JJ6ghTc2/UqltEo6mnJCmjogLG4dUGDqS51JHfLGYWOOyGrOtoYOqqcAdOfmfanrBBl6mcweA/ZYeQzDr/FkQ+UeXO8f/C3tdg5bPJo+RDVdz4Tqoa/GwOrMlXnS7HSPeH0b9/uzCbiZElhEWWFnHV1j7W2JvyvCBcmmqwG7UnC42kSpLuMBT28yd+rll//7cWe66mzBCd0WrTbv9Sqo8pExhqPMTv922yTozGPRwL3XVJlgul5u6dfHfVQEqgvTYta/fGjpudyw6FVA9WEL7XPnrE9L7Bd1KrSGrRKClELhl77X6uUL0hfGpxbj7GcoGO6LF0jPaN+xau2id0w9itgo0h6O002/TY5bCjbkjUX6++8vXwc6mXg4ywsK6SG8rJTOwW8/zRUBA77FL+NrCw7QIokLc7LKADFKiNHWpMQ6ROxxOcUCBe6Hh+bZZKbmCcPlLOyOjYM3eHFTmspXZS3zOoTX4Nift4HQvzh7DcyyCeTZECiMcd04yHmoS8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ang5K3M3NWp4UUx0dGJ4WUtpUHFjNU5rVmF5TGdkeXN0a2RGUWRpeGdYK1NH?=
 =?utf-8?B?N3JDc1FaY01FZUF2Yms1dUJKVHN5NHZ2UytTZExwWENGRy9hYjZLcS9ONDlD?=
 =?utf-8?B?THF4REJ5WE9LRzBFcmVFa3MvMThLU0hwL1VOYkF6bGpzdzRGSmVRQVAwaDBO?=
 =?utf-8?B?OVpmS2xtOVdDNk9ZU0p6akt3b0xHVU11MmpZc25zbW9FbEdTYUdiM2lLZGh0?=
 =?utf-8?B?STFDR2lhV09oZ3c0Z2xLK0t3aGRIMXcxa01jK2o2K0NmdCtibVhHYWtZaE11?=
 =?utf-8?B?K1ExWFZza1VMeTBKcnVtbVB6WXU2M2d3OFVTcWNHOWtYbVQzakI4dGFQVFVx?=
 =?utf-8?B?OFJYaTE2TDEwVTd1Tk4zRHV5WTRoOGxiR1BUZXZMMGFic3F3bHA5MUpVb1kr?=
 =?utf-8?B?Q0J3NEUreTJvNTQ5WVdaQ1M5UEhjZEpTcVl4NkRiUFBsMllRaVRid25TNmNk?=
 =?utf-8?B?akF2Q2p2NWpSZGlWNDY5REQvNmdGTGJvczMrSjRqNDJ4OFZQRVB5b2pWU2ZC?=
 =?utf-8?B?bUJ5cjhHSzV3UkF4c1VaQWErN2RNZjVqWVA3cHEvYzlnT0ZQR0JraENURC9v?=
 =?utf-8?B?RUtYTGxoRUxpeDRXWjdHVW5iOGhaUzlkMHFuS0hoWWdrM0d2NmxKaWh3azNy?=
 =?utf-8?B?MEw2ZWQ4U3dOaDNoRElwM3pWTS9GM1h5VFVyM3FIcUUzN1FvbWR4QUhpMTZC?=
 =?utf-8?B?QWNkcGwyS0g4eElRR3dxdStPRWFGcmlGTkYwTm5KUitpYUw3K213aTJuTTZJ?=
 =?utf-8?B?YWpFdjFMUmpsdnZIalVneFNSNmszb2JSWndSNVdIMWpsZUNRanpFYUxaY3hD?=
 =?utf-8?B?dWh4M0N4MTVmd0s2bVpGVENLU3BWTVR4WGg1OERGTXJUOW9UWFExRExVVndx?=
 =?utf-8?B?QkZRdkFLelhGOU16L05sWlVtTlcycVFFSWhKVjBPY014M3dBNGhydVNYRWEw?=
 =?utf-8?B?RSt5SXhla3lUVDVIUzl5TWV0eUpJU0hUSXNLaWhpSkt6ZnBhM3N1NjliOEVO?=
 =?utf-8?B?NldadVJXdjZtTlNPSXUyaFB6LzZ4c3JRUFZJVWh0Z1pFRDZrcDU4Y2E1a09U?=
 =?utf-8?B?bmpuc1Q1VFI5dnA4ckNFSFBBWnJKMFdBajJaNTQycWlmSXczcEN4VTRQWUs4?=
 =?utf-8?B?RUgvUFpGZ0Rpdmg4Zll0Um05Q0x1MDhZbmtzMUJYbjBZemY5cmo1TklXTFNR?=
 =?utf-8?B?SlVsUUZ3dHg5Wkp1YVgxYWlQVUQwMjV3cVd4RE1UQTdGbXBhNjBlQ1lUSUY4?=
 =?utf-8?B?aVZPZjRjTEk5ZnVhaStlVFdnUlVDM0YwZ2QxTFdKSVA5ZUZRRXowQllHaTNO?=
 =?utf-8?B?eWQ2bkUwODIvMklQUUttblBYVG81aFBnVXdpL3N3dEsrSVl3b3ltZGg2OFZr?=
 =?utf-8?B?aTZmOUFJMUtSc2dwN29zN1RVTHk5L3I5SXdEdjlqbmQyZTZHN29lbGs1aHJV?=
 =?utf-8?B?cjRwMHB2eW1ac004OFFMeXQ3T3dSN3FDendaUFZNUDNIeXlqUm1PZFNnK3JV?=
 =?utf-8?B?c2JFNXYvSnhxMHlSNlozSTlIbVdiRG9HM0kzQzBObEkreGhnM2lsaGlxZjBv?=
 =?utf-8?B?YTVDWjU5YW1NYk01bkcrWmVla3R2ZUFQbzJOVE1DVW9CUnoxYXl2dUxmMXQz?=
 =?utf-8?B?V2pFTFhGMkViRzY4aTB1eDVIYlp4bEMzbnk4SkRRcU5OSmVYWWJsekpWSTJO?=
 =?utf-8?B?ZHJ6VTByUHc1RGlWT2JZemxQdEtPTEswZlIxMnRoYlEva05FdVJNbzVkNWd2?=
 =?utf-8?B?NEFDaERISkhGUHhLRHhHVWxXVzlSSWI3eVp1VGp4MHhsa0dwc2VwWmp0TzBE?=
 =?utf-8?B?YlJZalhCY29iUTVjUExEV2pjdUo5RHVjS01yS09ob0k5QkcrRVVBeE5xUmpl?=
 =?utf-8?B?ZHUxNWNidWlNbEdNVExsa2djdVZaemd2SzA1cWF1VENOVVcrSEtNUzROcUFN?=
 =?utf-8?B?UUd4NitvbW1EalBabXZVQUp0OFlTbHdSRW94NzRmTW5uYWJoUExYK0F0aWc2?=
 =?utf-8?B?dldObVZ3V21BR0k3dWpCTDMrZ0JEanFtTm93NEY0OWxvc3MxaHlsTERRQjR0?=
 =?utf-8?B?cGcySWdidi9VeE1CU2tkWlJWQUVhdWdWQUdJUnRuOS9KNHdwOFE5ZWoxUXBL?=
 =?utf-8?B?b085aTFVbnlhcXBicElnM1ViN056RWdXaHdsVXA0T1lwVTNjMTkvSGdpNGhQ?=
 =?utf-8?B?YXpVRU91L2RiM0NBOG1mY1d6YW14RmdiUTRTSHVvUTVQUnVlY1NwYWtKVkZk?=
 =?utf-8?B?V292ZFpaMjYwRUhya3ZLOXBKYXU5dkJjdVFaRVQ3dGVnblo0ME80VjJVTnF1?=
 =?utf-8?B?aGJZMUJuZGp2VEhoMUdHd2lXcVlwcEFMWjh0VS9vT01Qa3o4SmM4QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7097832-31a5-4e49-0d33-08df04536a28
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 15:54:02.1547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2iU477X5Kc9Sxufn2a32yi6qCuhMx8oB8GrNsIN9Wron41tQJGGXKmZaJ4kFjvjiWCZ64Zg4rNcu86eZyNcnwVhG4f5X9bS/ETVB1rTx/gg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7913
X-purgate-ID: tlsNG-c1860d/1787846045-CD14E87B-5B276798/0/0
X-purgate-type: clean
X-purgate-size: 1527

On 27/08/2026 4:40 pm, Oleksii Kurochko wrote:
>
> Is dropping orphan-handling-y := from arch/riscv/Makefile the intended
> end of this series? As if I understand correctly with such defintion
> we will miss warning so everything of that will be missed:
>
> cd xen
> riscv64-linux-gnu-ld -T arch/riscv/xen.lds prelink.o
> --orphan-handling=warn -o /tmp/t.elf 2>&1 \
>   | grep 'orphan section'
> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section
> `.note.GNU-stack' from `prelink.o' being placed in section
> `.note.GNU-stack'
> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section `.rela.text'
> from `prelink.o' being placed in section `.rela.dyn'
> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section
> `.rela.init.text' from `prelink.o' being placed in section `.rela.dyn'
> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section
> `.rela.data.read_mostly' from `prelink.o' being placed in section
> `.rela.dyn'
> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section
> `.rela.init.data' from `prelink.o' being placed in section `.rela.dyn'
> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section
> `.rela.text.header' from `prelink.o' being placed in section `.rela.dyn' 
>

Orphaned sections are a huge source of bugs.  Right now, only x86 has
any kind of orphan warning, so the `orphan-handling-y :=` is maintaining
the existing behaviour.

Longterm we do want to delete that override, but IMO it should be
follow-on work, rather than being part of this series.

~Andrew

