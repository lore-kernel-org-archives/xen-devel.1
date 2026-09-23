Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12011C982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 09:21:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429924.1652550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JA1-0003zz-Gq; Wed, 23 Sep 2026 09:21:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429924.1652550; Wed, 23 Sep 2026 09:21:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JA1-0003zs-Dv; Wed, 23 Sep 2026 09:21:05 +0000
Received: by outflank-mailman (input) for mailman id 1429924;
 Wed, 23 Sep 2026 09:21:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1x9JA0-0003zl-Jc
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 09:21:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9JA0-0017hC-00
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 11:21:04 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ab399f4-bab6-0a2a0a5309dd-0a2a4501daa0-28
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:21:03 +0200
Received: from [52.101.57.0]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ab399fd-5984-0a2a45010019-346539001def-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:21:02 +0200
Received: from LV3PR03MB7609.namprd03.prod.outlook.com (2603:10b6:408:283::12)
 by BL4PR03MB8106.namprd03.prod.outlook.com (2603:10b6:208:591::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 09:20:59 +0000
Received: from LV3PR03MB7609.namprd03.prod.outlook.com
 ([fe80::146d:1d33:b619:386c]) by LV3PR03MB7609.namprd03.prod.outlook.com
 ([fe80::146d:1d33:b619:386c%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 09:20:59 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdo2xB9wTRYMrB9qYzO+wrhja9wfijxxRdOXFWHWfUXEUMN/8eQGG3KEDXvZMlc0bmCmKAVWTztHQvlBiIRCp6Bi0XPF97Wt4t1s+Fr6T5RbCgGEGfoTQdYvBP2Pof0T5+MvNn5k21AnDDb/Joc6mrR19/933/GSkNLpZoxDIvfH0ETjcfe9PkWifHImADYcT13zWAL330OxOmDckv7mZqFp8fE+Sw4VYzx6dS39GvIuXPbwSu5BVI94LYr5zSEUzg+OruZZcgWaI66aZ5J6Mcxs8uJIXZYTzV4hd2OoBYVYrTusoGrykg4XHk/ubXwHjgjbYzqdAhWiaudrkxC7wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/G3pWmU7e5VB5nwmAFh2EbKY1eIA5N6iRNC787XIaAE=;
 b=HYECa/kbt5M39f+XsZzZHx/XFvW5zh3THT0Zfo2Z3jE4u2fN7ZqYMywsfW/5CyxZ/F6Je47ggurBDG+TtnT6oNhx6uxKLt91FMv2GOX9++9n56+Jrxfz7nzbZii4zYwOU+TgxjKFkvDslgHhRddVTVfdj/IXSvzrLkPbaiYrF1uMGCr2JqMwGuD9vgcAZsKMm931ippIKJrQ1mC4NJ0oHSAqXV33yvTC1AvkDjv0J2KQfgXdxK9Xj7eNJqaz6UgAxX0irZprtmiA52pJaBAnvNUXZsW1slXzwiJZhKhL5autegMJl0YaY25eCDnl46+id6OKsRUXrm4rR036pe2JjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/G3pWmU7e5VB5nwmAFh2EbKY1eIA5N6iRNC787XIaAE=;
 b=Q8p3ARwhE9zDLORpimDlT/N57WBR9HbbEk/8Dig4dryqszjDzfMdisS2Y5nJ3VLI4/qXV87obpy1xsv14Yoo29caNW6bKdNbpROTTR2f7JNiHVr5eIcA8Fq6dAWTLFjyU7iqRbZEJWoOEFWBKu6/3zltUQpeEuyU1osoI6skgQA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: =?UTF-8?q?=5BPATCH=C2=A0v1=200/5=5D=20x86/nestedsvm=3A=20rework=20nested=20VMRUN/VMEXIT=20handling?=
Date: Wed, 23 Sep 2026 17:20:40 +0800
Message-Id: <cover.1790146987.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0010.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::19) To LV3PR03MB7609.namprd03.prod.outlook.com
 (2603:10b6:408:283::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR03MB7609:EE_|BL4PR03MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: a338997c-f1c9-406c-9dd2-08df1953fac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	flAFZt1oaA6bZPkui14bAQBnLeTmXEezxY4vPfxHU26YavmMzLKv8yBBJpWC/5zn/fyW8fbsgUt/rWLVnD8iZnlwSEgRCyvJVE072egXvfEO+pRBs3aa1nMKZ5CJLAzuHvlRs8gjTRwmDwLUji7zbcUyPDNO8nsqEXxbHBYBZQzo0aUXSet4oGPnbUqG/AAehjhuTeniYY3TC5k8NgNj1ApjPaNFGn4Tq6bDnDTsJvC0eCi1WQsuDlRZnfKc+JGrhv3MWubU6wRxNkc9iecQ/CMyQZHa0/46Tc0VFMg0FbyCalJfzobcd+39fHi5eWNMBev+XHVYpA5DZjqLcwNAcW/saYXDFWK00rcgm5yOD+TbtBC21C2euqaSU8O6HqRu4y9RIh31ToD0kX0Ooy+hviqr7qlj6gGL+sboEWnscAqYQfxqyiEggACSOpl7UlCxCjLo+ggWiiSNr/r+KL8xKBIhoYjXpz/wVnbl7p/+H3ZU+0y2WtZBepDKvO9kQVzvT7nUKD794fF+yI2ntC1H1fyfAhSEUz0KQmWM97mBQDY3rM6ZRJP/hugQ1VsWkgyV5Gm3PFOBAL64m2mC/3BOPh1cmfe1fQ48NOFFYKJpyamEBitH0bt8toZfmY2z+eBqAg4NKiMTpbL4UayZVv83LtfxADAzjO1EGYIY5+76Roc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7609.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXFiVnJDRXpLSjEyKzM5SHQ2eFhUQzFmM1hORktnaDZZVmtPejRlNFlXdkZJ?=
 =?utf-8?B?QjA5YlB1eWZSWjlpMUVHRW1Pd2FWa1IxSDBtYXovS1hmbVpqNUhrcERLaDJK?=
 =?utf-8?B?MzRpQU9HaUdNMHdWZlRvKzRFV3dURTEzMnJOSmRIYlA5MUlSM0UzeGhPMzBN?=
 =?utf-8?B?TWpEM01rcy9WQzh6NlNVYU42SWJEc1EzcVlMbWlYMDBtVldpNXRWeTVoOVRl?=
 =?utf-8?B?MmN5WXd3ejZrZUN2ZjhDWDBEVXRrV3A5dlJ1ZUtLL3AxNm03T1BJd0NOMFNG?=
 =?utf-8?B?ZE5XUGU3aHN1UzNJaUsvWWVvK0xRNk1DbFkvTG5zSUJSczJDVUJPckN5UEF0?=
 =?utf-8?B?ejBuVjB5dlk0TG5uODRGai8zZkx5NExhOUF4ZWIxL1M4NXBVQzNCOHE1TnhW?=
 =?utf-8?B?NlVBTEs5K0k3YnFiRWtaekhYNmZ2emh6TWh2YVpydFpPU2krTE04c1dub1VC?=
 =?utf-8?B?N0xNTzAyZG1wNlpvc0VHMzJUTHpzdUxRRHZ0U1ozVGN6TDRXR01ndTdORkNH?=
 =?utf-8?B?Wk9VV1JHZzhXUEE3aExGZUhmd3RFYmdXRFp3V2V1WDE0UXoydU5wcXE3TFdP?=
 =?utf-8?B?Y3RBa2dEWmVkMGZwODhYaHRhclhZb2Ryd3BXOEVGaUdiNWJFbmpLMEVRSWE1?=
 =?utf-8?B?d3FaTzFacTdpcjhtNS9vWEZHSEpNRDJ5bTVuSzAxdlYyNlpxV01WQ0RGejZQ?=
 =?utf-8?B?SHN1cFdOdWJ0YjJtWnlSU0p3N0t0aU5NcHBLRm5Jb2x1cHRPa0RKcGFRSlRv?=
 =?utf-8?B?Z09rOXd3SHIwZytWbElCNGhyMTNmUkMwRjFTWHFsclZXcGF5aVZLYjN1ZmxF?=
 =?utf-8?B?S01WVjB2aDJiT0hSNE9GcEluN3FpODRUcU1DK2pwZzhYL3BwYkNpWDdoSnVM?=
 =?utf-8?B?VTVUNXZ0U05DcG1NS1hZWlFiU1FxUGVpK2FuVXFHU0RpVzFtWkdSQjdjd2gx?=
 =?utf-8?B?MDlXWUI3YzZmaklWNGhndGhaN0dkUzkyZXZxMGw5d21vS3RabjU3QjQwWTlX?=
 =?utf-8?B?U3dsWDEvRHphMHdnT3ROd2lOb1RUTjBFTjI5S0JEOHdaeXpyVHVSVnpNdm5E?=
 =?utf-8?B?WVhjelZwUmZmeDVsMkNudzZxWXZiemNiZnBnMlRIaGVmbmlJcVJ2QTdlUDZa?=
 =?utf-8?B?N2tZUlBBcWRvV0V2OS9laXBaRWNPL2M3NG9pamJoSkRZSFhESXN1L1o5VkE1?=
 =?utf-8?B?Nyt2UTViTEl1YXRyS21TWGM2ZVVpdkNrVUdSbEx5TEN1bjNKQ3VWYlhzcDk2?=
 =?utf-8?B?Vy91ODNXR0hrL29PcjlDdU1vaTRnSUhKWjg1VXlLdEVuOThYT2lpc2g0R0M0?=
 =?utf-8?B?dEdSeng0TUhKU2JqQ2o2cmMxRCt5ZmVSWS9mS1JIaEVFL2VIY0ZMYmorMHYx?=
 =?utf-8?B?UWhPMmc0c2xFUHhYV2FOYnI2KzlKR0RUVjRTRlo3eEx1d0xtWUM0VnB2d25o?=
 =?utf-8?B?WnFZZ3djYlY3dTcxNG1rb21Sd0Z1ZXNWMkFjb1ZqdGtIbjIrUmFROVJSTk9J?=
 =?utf-8?B?NDNpcmZTUDhoL2wxRTFBTE1NZVNvcXlQeGUrcHdSN0hodmJEVUg2bllKYnEv?=
 =?utf-8?B?MGF2Ymd2ZXR1Q2VpeHkzYXd0VUY3V3RsZjdMbGdGbFNWSXpGSlJoK05IUlhI?=
 =?utf-8?B?akxEZGdRbVM0NlNNbzA5TUpjR1RBNUMzbmNTUmluTGo0NDcrSHRuWVBINlJG?=
 =?utf-8?B?M3pualZUdlJCZGFiYkd1N1BVWDhlMmNPMDRnbVNmUWhHbjNMWUc4YVF5dStO?=
 =?utf-8?B?MnNTZjNabnE0LzlhZENRb2FqUmYvYTRtYmF5QWlxWFpnOFhRc2tld1RXZHZt?=
 =?utf-8?B?VHJCcnNxaTUwazB5blN1UFA2b1ZwejZpeDQ0TE5FNm1RZGxoY3dicUxTbDFp?=
 =?utf-8?B?ckUwRXZUV1p3RGVnNUszRUVwTzlCcjU5QmxpOTdWTjkwQjRnMnM4aStVVGdE?=
 =?utf-8?B?VU1aS0x5L2o5U2s2TE9DU2Z4RHp5SXB5MkNuc2gxRDZvU0NJa3VvZW9hWGdt?=
 =?utf-8?B?QlcvN204YUNZYmU0Qkk0REJCVDRkQW8zZzNyRFJ1VkwxWWw0ME9EdXRJd2li?=
 =?utf-8?B?ek5Ock96RmhiM0Y3cUN4RHI4SnV1L0lBNkpqZ1JsZ0p5clZIakdEQzhmQlor?=
 =?utf-8?B?VFVDaDdHcnlyaG5aakNmVWNDQkVvdW1zU05QSnE4Mm85NDdxS3ExK29TaWd3?=
 =?utf-8?B?SFpiWmpLWThQQzNVSEZWT01JQnFKbk42b0k5dmJMS0U5WS9raEtTUlNSOHBh?=
 =?utf-8?B?SzBmYjFhSlQ0elJmNXd1UVo4b1R5SkpyY05sN1ZGeUk5bUtqNUdYTHVRY2VW?=
 =?utf-8?B?alNFWG5zUFJhd2N1YkhlSlA3U1paTGdyazRxU1pkUEZSbW1YdEtYdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a338997c-f1c9-406c-9dd2-08df1953fac6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7609.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:20:59.3019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seHHm0nt3Y/Y8kbfT6jK6vGaIhtz51/p7Qf4y0MTVYZBVB0fbfw4rDR2BJpsEkZVTVdMufhaSzvtbhwVM620fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR03MB8106
X-purgate-ID: tlsNG-d62444/1790155262-1E07B757-0141B1E1/0/0
X-purgate-type: clean
X-purgate-size: 1666

From: Chunjie Zhu <chunjie.zhu@citrix.com>

This series simplifies nested SVM execution by removing pending and
deferred state from the VMRUN and VMEXIT paths.  Nested transitions are
handled directly by rearranging the state transfer and control flow.

The series also removes obsolete interrupt-window and vCPU-switch handling
associated with `nv_vmentry_pending`, while updating the relevant assembly
offsets and nested-SVM data structures.

Patch 1 rearranges VMRUN handling without pending or deferred flags.
Patch 2 removes code related to `nv_vmentry_pending`.
Patch 3 rearranges VMEXIT handling without pending or deferred flags.
Patch 4 update vmcb fields correctly.
Patch 5 fix issues which cause transition failure.

Chunjie Zhu (5):
  x86/nestedsvm: update vmrun without pending or deferred flag
  x86/nestedsvm: remove nv_vmentry_pending
  x86/nestedsvm: update vmexit without pending or deferred flag
  x86/nestedsvm: update vmcb correctly
  x86/nestedsvm: fix up

 xen/arch/x86/hvm/svm/entry.S             |  48 +++-
 xen/arch/x86/hvm/svm/intr.c              |  22 +-
 xen/arch/x86/hvm/svm/nestedhvm.h         |   6 +-
 xen/arch/x86/hvm/svm/nestedsvm.c         | 337 ++++++++++++-----------
 xen/arch/x86/hvm/svm/svm.c               |  25 +-
 xen/arch/x86/hvm/svm/vmcb.c              |  12 +-
 xen/arch/x86/hvm/svm/vmcb.h              |   6 +
 xen/arch/x86/include/asm/hvm/svm-types.h |   9 +-
 xen/arch/x86/include/asm/msr-index.h     |   1 +
 xen/arch/x86/mm/p2m.c                    |   5 +
 xen/arch/x86/x86_64/asm-offsets.c        |   1 +
 11 files changed, 260 insertions(+), 212 deletions(-)

-- 
2.34.1


