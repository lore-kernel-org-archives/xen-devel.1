Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6220CA6019
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 15:25:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444495.1661327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFCTQ-0006J1-De; Fri, 09 Oct 2026 15:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444495.1661327; Fri, 09 Oct 2026 15:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFCTQ-0006Iq-8t; Fri, 09 Oct 2026 15:25:28 +0000
Received: by outflank-mailman (input) for mailman id 1444495;
 Fri, 09 Oct 2026 15:25:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xFCTO-0006Ih-SH
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 15:25:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFCTN-00GQzu-Cs
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 17:25:25 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac9073e-8faa-0a2a0a5109dd-0a2a4506c6c4-38
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 17:25:25 +0200
Received: from [40.93.198.39]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac90760-195a-0a2a45060019-285dc627b1f8-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 17:25:25 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SN4PR03MB998611.namprd03.prod.outlook.com (2603:10b6:806:218::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 15:25:18 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 15:25:18 +0000
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
 b=Y8LkXIFZRmCQm8DNUeS/f6jqGj3BHjk1YEsm30t8ft8gyyueI/03XugeEF09FicKLdcxdI3kO9DXIARdbf6wp+dwUQQgAXtLqMRgxXl2R2Ma2jyL0PRx1+Wh9gIV93VM7xw5tsOrzrzAoTd0PIXPQkt6roS/+gby+Jgh6XVupObZSSZKbqEJG+BaV8TGjSwWTz6Mgl+f+HrYaQaQCzvtWyGtPBVNMQLCrzrJb0yztLQ96uaxIUk6bzVDNWwY/Tf8CKl+wWPGPy5z4tc/nxalzVu3wjg2f2e7Urj/QmTqbhzsVs0cz++4Jb2kd827A77f0VNuI5zLmzSyP1ZIA0Vu/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ingmyAoLJQaBTry0Pl4sw5csPWCENmolAoLeZlfxa24=;
 b=MUv/zpg9lOtghuKItcYc4bzlk57RumzZm2dUzEQx5HBx5f+6thQuY/MxtPGAq8hSJtNgV8HFXxXEZy4bQtIa4CMlN6Lh8mXYclXKAnH1h6WGTmJ6Fvasuj7Hzta/tk0TClzOaoPxa1rJNR2YJ3+DeqMCT7uL6RoduJe5CU5zxxqt8FCzbwiWaTMT7odoE9z6C26If9wLYMF0JBnyipAZforpDmmQKAVE9qMYW4qKVXG6OOAE8KckDL4epFtxSXjYXncRDCcwe0HiauNw1Xi/EjUtzRePqerlePq0z83nTJuDyOL2tBhQuFRQPrj4PLbgV2Gfjfs321xxzErKN3V8ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ingmyAoLJQaBTry0Pl4sw5csPWCENmolAoLeZlfxa24=;
 b=tXduahzN87ytat82RFqKut8cyY8XtCmSNdjBT5tAUDKLuSDNTYLVUqa2ole8iHZr6cj1tb6tUzUXTX5tumidAGzqWSDBHYSCADvzrbrSw8e1zLp9iMrjSGbwNxSBBVaYC5mFTHma0u4V3BqZqrNb4M2TI0YV+D4zn+edAUlF4hc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1f48cb36-49eb-4f9e-8aac-25c1bc86674c@citrix.com>
Date: Fri, 9 Oct 2026 16:25:15 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "teddy.astie@vates.tech" <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/6] x86: Remove return value from UPDATE_ENTRY
To: Kevin Lampis <kevin.lampis@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
 <20261001174749.2275245-2-kevin.lampis@citrix.com>
 <a91fef08-3a0a-4a71-9618-9d6d3e74112d@suse.com>
 <BY1PR03MB799623147B668DE6406228E4F3892@BY1PR03MB7996.namprd03.prod.outlook.com>
 <2db46bf6-87e7-4f1f-b440-b73be1f86b55@suse.com>
 <BY1PR03MB7996277A01F884028C5C2D04F3892@BY1PR03MB7996.namprd03.prod.outlook.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <BY1PR03MB7996277A01F884028C5C2D04F3892@BY1PR03MB7996.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0519.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3db::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SN4PR03MB998611:EE_
X-MS-Office365-Filtering-Correlation-Id: 4528f9db-e39a-4f9b-0160-08df261986b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	yjXK3Kn2G4rLlzbIt7o8YiMNsz1EBSw4Oktlq92NwjiGQXVFgScbF2VOCuN+HPY3kTPPIJMjMb+kY4GHTlY5prstfC6dKe5JUMRP8/CjUWJq6iV1B3P6Jm5p/WHfAUDMbo0r4Olmul5u1OW/VZ9zSRetLxXbkpX5ZWXM8jd/zYt+vqLivOWxe1jLyA0gHtlYyqNaffHgkDb6KMuQ1Sn03ZnMYz62+TleNyQVjUNFbV62zhPKbngbKHrTm1Fnqw+/geqloxm6R2aQ99VKKrtMFWVaWaBE+8GnJR4imt6HQ+px4cu0jidGi7mrY33Nj1lv1QpMucAGzuHatAXpJ82xn22jwkXuuEG81ZKK8krscxwZ269hLRHikgE2qPfKEQrD7dqDTX/tb5AhV+zxhlNIiMsk2vAVJpptlV+MFJQvbEIWileFRNDm3kU+CMhwHZdLIltKwcBK2gXITtYFrU3b/jffIwEjIR9WRDB5WWGLBOJp63C9PSTnlRntpL5oOUt22ZfyZ5jATyMhLeTIcrZCnp2gQp5iqU/lUbaW693laZbw91aSuwaTdqql9HfgVmbeOJp17b3mYAy0SviQFeIQslo27fkxv5xsSA9bFolj09gPMbMYOcxRs8mJCQ0jnKdl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmhRdjQ4ZFJPTFJkTWpmZnVveVJiWHhYMmJoc2tRTUhhMkNVYlVJWmNYWVll?=
 =?utf-8?B?RWNSSXBHRTY5WHQ0YjdJdi9hR1FPN1BZMURXUXJDdWd1K2tnRThGM1lLaFdM?=
 =?utf-8?B?VG4wMFg4Z3VUOFExYzhkb0ZDM2pqNWM4SGFlMHpPOHdMT05ob3NLWHdmaHFT?=
 =?utf-8?B?aG5xcWlrNEhKUFYyaCsvcVFxVjVRWm80ajcrSFpYMXl1ZzBxUmtEaFRSTW5l?=
 =?utf-8?B?R0NwMUY4dXpxanV4OUR2WDdPaU1ZS1cwTkNqZStVUFV3ekVYeElRM3pKQjlw?=
 =?utf-8?B?Uy95QkQ1bjcvdzRiSXdXNU82Z3AvS28xZFQyVW5TTlMwMlhaRWlQNGtFNHRM?=
 =?utf-8?B?QWpzcUorY2FMZ3RiSnRtQzFqMDFtVnB1bW9aaUNjTmhtYkgzMVFaRlp4V0ZP?=
 =?utf-8?B?UktCUytTL1pLaE9qTTdrOGxSSytsZUpUMGxUUDlnR1pXOTJZK2NzN3lDczkw?=
 =?utf-8?B?d1Q5WmJBNFpiTTdkU2VwamdOMXo4RGdWN2JaU0RNUWl0WlVLRmVTNkkxRnQz?=
 =?utf-8?B?YTYwd0VpRWxXT3dVanRXY3djbU8vaFY2QTRnQVorTnRFemkrWVluaWlBSHNY?=
 =?utf-8?B?SnpnM2duR2hEMytlQW11VEhsalpwbnJaemFmYS9GNXExTFdhNitPcFVoUTBS?=
 =?utf-8?B?TGpROGtjbnppT0J1ajBZNTdTY3dMdW9jY2ZERmsyOGp1ZlZCTEpqMmxOWmUw?=
 =?utf-8?B?T1ExVXVRYm9uUklDVDhhSUpDOFQwbkk2ZmtUZGd0aHZFNzFVc1JWdEZURTFB?=
 =?utf-8?B?Q1hyakpmYjY0S25ZU0pVa016eE9ZRStBQ0J4b1Ezclo5VHQ5NFBtdnh1Nys0?=
 =?utf-8?B?TDBZbFIrZElCcDdOaVpNdE1KeldoYjRDck53WUxzUDdHWmI3NEVsZjl1ZHJx?=
 =?utf-8?B?dDFTejVMSVg5Smt3ZUJZVG05aHRuKyt4TXd2MG1MSEp5OFg3MEFmS3cwUjFa?=
 =?utf-8?B?NWNSa25XYlowLzhUR3ZBcURyTmJ6bTYrSlBEOGQ4ZDRIVGZnZy9PdVViNXIx?=
 =?utf-8?B?RE1OZGkwSnVIalo3a2pOckw1RXFPY1dOaWNqUEE4L1RMTGdhbk1tSjlSTGhR?=
 =?utf-8?B?VXcrcWVjZEllUzlyTC9rVzRPSnY1L3c1MlJnbUtYZVZsUG5BcGEvQ1JjdjRt?=
 =?utf-8?B?MkpwcE5SQUdUVjh0WmRHdzBBVjN3ZVJveUFrZFF0aFMydnhPKzJLclY0TFVV?=
 =?utf-8?B?TnJNVmxpZ2RDcGlXOWZQdVhyQzQyQ2RiMEc3R3NMVWtBN1VQM3lVcGh1TTBw?=
 =?utf-8?B?MS9tZTNBL25MU2NJcGtHdHMrbkoxeFBuMzltOTR5MmpmeDZPaVFIbEQwWkdU?=
 =?utf-8?B?SWRxdWVIZUNwSzJZUEZvaEpDSVJvdytSU2p4NWZWRk0xYk5HTWxDa2gvNmVx?=
 =?utf-8?B?WW5BZVArdUg5a0h1VEw0disyblRuMTN6R0xISGdTNjIyeU1LRmJDV2M5SFBV?=
 =?utf-8?B?clBFOXRFcVdXU2N6ZXo5ZmpVdzQ0ZVpndkxlZkIwQTJnM1psVkh6d0FtUzRC?=
 =?utf-8?B?YmsrbFhlNHFXOVM5a05JL3FJZXZqWndOaWQwSTBJUEZqRk5od0o3STlFOVVS?=
 =?utf-8?B?U1VpdEttcjVOYVBkU2FsUGpScFByNEFXNDMrMXBBVjIyRnRZYklOZzJSaHdQ?=
 =?utf-8?B?MnM5ditJeko1R2FQN21FejVacVVxeGpVT0tYS3JBcHUwSFFoUC9MRVg0SXRO?=
 =?utf-8?B?UUlldlBPczJoZVBlUGdjU1ZXK1BSUnVMTi9YU29iR3Nlbmd6d1BOajVETUxT?=
 =?utf-8?B?Q1EwTTlNQk9jU0VhcWFtOURxRnFpM0JaTUhyYmR5T3YrRXRtNnZ5K0xCb3dv?=
 =?utf-8?B?UTVPUGdOaEZuUFlJUlJ0bXFRaFZ5aUNnUmNCNGRxL0pFNDRIaWFkQk5zU1Qr?=
 =?utf-8?B?M2phcGg0YjFtTkNpTWVEMXJxSDhId2plNHZnYW1Ma3hEZHZTTGlleFdSTVgw?=
 =?utf-8?B?SzM3OVJJMDFFRDdtQWtGaytrWmh2WFVJdHFnZkxWbWlQaWtjYys2Q0t0N1ZV?=
 =?utf-8?B?QUFudi95SFAvZ2RHTGxOakR2RlpzRklOeWFIbDh2bm1HYXFaaGN0YkhzSVBX?=
 =?utf-8?B?b0lUR0wzWnA1SXNpTHFZT3kwb24zMFZXTkV2M0NXU1lXRXdPUDgwWjJPdGVO?=
 =?utf-8?B?TUQyVjBBSnVHYmlPVThzYitBTm5VOXlJdkp4L013Q2xqazlkYTFZdzBVQlg0?=
 =?utf-8?B?ampmNW45RmplbXlKQ3BqWllVZkJQT0tHQkhBK1JnWUN1YWVyVlhwaS9Qb0Nm?=
 =?utf-8?B?RWtnSXM5QlFaLy9zTlN6YU9kZjdRdjh0Rit2N1JLUWc1bDM0cDdvbWtmTytS?=
 =?utf-8?B?blVTbWs3dGJoSW9qMjRwb09sOWpjRDZyOUE1TU80eno1d2lWZ0NMZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4528f9db-e39a-4f9b-0160-08df261986b0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 15:25:18.6840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gs65yJiEW6eacHU3/1V2B3ZOiAmYQBLmEvKWraf+YA+X+yegj3KnwPUmSQZvNVfyYFNbwPhfnflfkH3Y0US8h8ZCJP9IjyYBo06/NW4DXd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB998611
X-purgate-ID: tlsNG-16d1c6/1791559525-F687577B-4494D9E3/0/0
X-purgate-type: clean
X-purgate-size: 317

On 02/10/2026 11:52 am, Kevin Lampis wrote:
>> https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=5ec86c22b4b3f26eab0fe9af4cbd0f90d315d820
> I'm sorry for missing that, I should have rebased.

Yes, I had to take this patch together with the first one in order to
untangle the XenServer patchqueue.

~Andrew

