Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBD8606A334
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 15:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=jJVFXr4C
Received: from list by lists.xenproject.org with outflank-mailman.1498268.1696120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUQgs-0005mY-MR; Fri, 20 Nov 2026 15:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498268.1696120; Fri, 20 Nov 2026 15:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUQgs-0005mQ-Hw; Fri, 20 Nov 2026 15:38:18 +0000
Received: by outflank-mailman (input) for mailman id 1498268;
 Fri, 20 Nov 2026 15:38:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xUQgr-0005mK-Oa
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 15:38:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUQgq-004ZPi-RF
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 16:38:17 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b006953-2eae-0a2a0a5409dd-0a2a450ba1d2-28
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 16:38:16 +0100
Received: from [52.101.85.19]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b006966-b7e8-0a2a450b0019-346555134ef8-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 16:38:16 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB4963.namprd03.prod.outlook.com (2603:10b6:408:7e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 20 Nov
 2026 15:38:11 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 15:38:11 +0000
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
 b=kBoCFFleLPOlwS0Cp14w/xLsSIRa/Gun2QXG7qdk8hrtkFF/w8IOWGk7yWgQgEiIJx0lsrUMcoRrLKZEtDsdc+z+na2SqOlPfGXPqn60Sbozq8LQxa5mw5ave83eCTMHvZBNTSc11eFUEt87IZOUiWsh7XS5BeZ0rcFRthOvdtoEc7j/4aDRFEUBuqN/0jlCj+guzkGbJ+btQVCg8Ea9oheH9rh6jrNcPvMA6XEUvSBflbvUBJ1Jf6/x/4KIdo75pm/FGU5UU/aOS6ZU8cZEj4w/5sPn5MkdygbMFdtq5DlLPl5zZMTYBxn7OB9BEcYrFUixY52LU+0+5cVOrbsuqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGut1d5YmqrwZrvMdzUPT7pClcUl8Nt14zLsM1lNXlg=;
 b=xEwMU3o6b6LGCE3ZkR5WHKMatm8XGMxzOeRI28lJ7KJ15VcPFlqgu7zFysng3JdYnStkQxxHfN0XVveQQ7HdSRQcVnQ/uEeJhabdgohji0LC/tx/vUs8h+fvfwlPgVKQLkc8X6eKlxaNTo2rT9WDJN/VhEcKk6rNaFDgIEU59UgYcw1zIj9KXsHPWzOZ/h9/OB1K+PorDzc+SLKZpORyk7i2ZEbayN+OQUl/sLcbnXiJ5P2OMvG/GfbEC6wZMmYi0HWWqOTKRzwe8I+Dx7DTtrhE6PT9BFQkbmpzK2a418rf5oKwGNLjWP6E4kL7U9gonnJmKjyFMozeBczENtgJ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGut1d5YmqrwZrvMdzUPT7pClcUl8Nt14zLsM1lNXlg=;
 b=jJVFXr4CVASze43xo8HoQIdl/cTjfez+zelwXu1/IPCvnGXsdgCSO3pJBnNYd1KuLisyEhypEIg8L0IfPkSqpydSLhgKI1Zl/s4GYz/NlGffCxhbmACPGgpefz8lZg3iEVCKvQY65ua2DQUMlbVEKAUJWfvYUqAxha9C6zC/VL0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <340c3984-7965-4f00-b0ce-3d1b150bb464@citrix.com>
Date: Fri, 20 Nov 2026 15:38:08 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/nestedsvm: Inject #UD for not-intercepted VMMCALL
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20261120111111.1794822-1-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261120111111.1794822-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0658.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e193f70-0f02-4623-489d-08df471c48c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|3023799007|11063799006|56012099006|261102123227099003|261022075727099003|10067099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	5i2ulYJtxEQdgdXbUn4GAnHy1KvVB1Pmu3f0MTg3tmnYQEIRZ933kUGlRPn/NIujqAmM1iJDx8MUXfb1PnaMLnzql6uGPNLYUe5sCuL77noo5itF++s/blNO+2bSWXkTCJDeluynp3OZhjc0oKsELNMdHz/ukASl59mm+UpNSZX3O7rR5vh7VTOJ5GR+DbxEflINoOM4qcjz0QbEzBqTpuHscTIf+5io838lACMWhLeUwqNABS4tzvaX3l8Cnbu6fTbYyMowQmQJ6/tvGnUKqHs3+q9MCkQpncE5SVNneWlk9z4U7/2AEyIKGH+ppg8Q5VmoTW5N6FCCWViMMngi4CdQB+eemMkpB35B1Hbc/XDiFG4cBx4U/g5l56vAfdPozycOBN6D7iIA1/M7mcNhioBvuIq4dUF74usWrKaJUXpXVHvn8ItAdQZg40iaHDnHJt1F7KoASyHUzlD7AD76IhiO8b0R+1JmT/KjsiVW4SBcLX5H//ULmlx+uR9uCLRQj4/1Iy1YnGB3N5DRhRIuRgNfhCRqfzndm3xeyOnbDK6fL0IYnX7ialco59IP5OXXD9JUGXHAJPeH384WZKT0UtL1ZE1lkBFR+aRQN+KCrh42ygSYhuhK9+gmC5TDWBYvA2QwAfYZUutgiy8xPVrgFezJhZjTzNucOJ5a3n+LiDQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(261102123227099003)(261022075727099003)(10067099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STNwVmo0RnBPdDNQUXlKTjBHVkRpRnFuZWo1L1FuVkYyTndTSURWd3YrYjNs?=
 =?utf-8?B?MnV1VGgrb3VkenZZYTJ2VVFENm1tUTZnSEp6YWE0eUNnS0hNSzVWZC8rZm1i?=
 =?utf-8?B?aTNXZTB0dmxZMDJZSXhOd0c3TTVIYkppNWcwVnJUY0Qvb1hseTBDelJWelJa?=
 =?utf-8?B?Z08rNjZYRW5mTjN6TnBNVlpWNUljdVdHSnVVdC9FRmlKc25hdGxRc3RlaGNv?=
 =?utf-8?B?dlZvNEN3T0x6ZGhDOTZJUENBQUxTdW1aUTQzTW81Ti9PenpLOC9panA0WTRK?=
 =?utf-8?B?TnJjRmZlTkNKeUw4MjNyQWFXeWNsNC9RamtWKzBhNjJ4K1RsTkQvRFo2S2FW?=
 =?utf-8?B?RjFDL3lkTEhtbldKTUZtbEhuSzFJbWlnS1U2amRjWUJxVkdQRURQbVFOdEFJ?=
 =?utf-8?B?ZUxKd1B1ck40VFBzYU5BanYzWE5KQW9BTGZ6bEZ4cE1jY2t5YWptd0hoRzBv?=
 =?utf-8?B?V1ZtdGFzVml6L2ExakZ0QXYxYVJqdURkRTVUc3hVazNkd3VLeS9ub1BPdEJ1?=
 =?utf-8?B?RndJbXVxdWwyTHNZa2FSbjZKOHZOTjdVcHFWNzVKMVg0UFRubXdDa0p6SDlZ?=
 =?utf-8?B?OGsvQTJCREJSUS9zTllFZi9VTG1kNHloUDAydmhvOHBmZTQzUzMxWEp4dGhI?=
 =?utf-8?B?ZmJoSSszYTdMbGVCaEg1WmVaUFV5S3U0NkVpWnRDNzBieS9Bbm1DTFBBQ25L?=
 =?utf-8?B?MnZYaEQ4eVZ2NGRZRmFROVZOajV1Nm5yNlczSDFxejdxNDd0Ky9HM0NMNm9U?=
 =?utf-8?B?NFU5RzNVODdZNzQ3RzR5NkNRZHhqVjBWekNPN3NJdHVzajMvdWpRV3dORXFV?=
 =?utf-8?B?ZWNsNExQVDVxNG0vZzhTd05XdEhhelY1YStLK2c0L2Y3V3RIb0ZETGE0M2sy?=
 =?utf-8?B?a2Y3Yi96UUZselRkbGwxNXJwR2FvOXRzSjZhdi9oTmJncXBadVhqRHdqYlJZ?=
 =?utf-8?B?YVZGanptQWJEeWhKQVpXei9iSVdiM2lyRjRUUUVVeDRtMjJSbHJoUFJtRG9Z?=
 =?utf-8?B?WFdmNk9hclR2RjdVZkIvSVFXUjAxZHBNUjc4UmF1RXhvUGNFdjJvMVVoaWps?=
 =?utf-8?B?Z09nTEJYNERaVDhVMXZIZkVHZGg2TGVzOGpEZVJPOVhVNnlxWmcyU3IwVml3?=
 =?utf-8?B?d1EyMzFpT1dpSkFHSitFOE0wTkdYSUhnWXNObzIwZGgzMjhHSCtqaXRyaThY?=
 =?utf-8?B?Uk9IdmtIeXo3Rm1UMjV1TFJRSFRhMDFIVkJ4eHJQVktyMUJCTlNzKzQrNEFS?=
 =?utf-8?B?M3A0Y05uNFZtaUhmVFpDQnByMU9tT3hoeXA2SzZFTTF5ajZyNHpxb2gxU2Qy?=
 =?utf-8?B?ejg4QWw4RFZ4TVdnTjAydWJtenkzVFV6M2J6TXg4d3BFRWxzVnhQS3pyR3ls?=
 =?utf-8?B?Qm5DY1ZlMDBOVHppcVArVGQ5R2lVdURiQzRjTGVqS1B3TFRIdCtaeWUrTEh5?=
 =?utf-8?B?N2pOTDhKeTUvQnBQSU5EYWZHUVFxQ2NiRC83MUVNcWdoR1VyeGJBVmJhdFhx?=
 =?utf-8?B?dDlZakhYVUVTOUJZakZoaDlHbU9sYnVpTGRzNXRGbEdrNlBnNjRQMEFhMWsr?=
 =?utf-8?B?V3RYeXZtc3NnckRoSFRRQVRYM3FTbzQxSkhYaHFoWTFqR0k3MXZMZHFyVUtr?=
 =?utf-8?B?ODBlWHd3YXlRMStlUVlML3Nod3V4dlZYN0V0eGVYK2cxUjlIZ0pyTmVrTTNV?=
 =?utf-8?B?KzNvdVNsRHRoV3ZnZmIyU2RscmlrekQ0dUg4ZEFIc1ErRkk2TXFOVnhYMElL?=
 =?utf-8?B?SXF2Q1JXNG0rTDA3eDJMODlJU0srU0psblZiaXBlQjlGa3lvc2hwV1cvR2I4?=
 =?utf-8?B?akl0RDFGU0htR3hTT20zMDZUanZLdDFsTXVBSlBqVU5ZVXdMbWVDd0xkcHZi?=
 =?utf-8?B?TWtiOFByT0k0ck5UZmF4NElta2dtQkVubEt4aG8yZFVCNnJSclZqcmh1aHJp?=
 =?utf-8?B?Y0cwUE13Tmx3UUZhRk5jSkMwT1pVS0Z3eVFXeVAzay9sVVBYTFR1ZkI3eVRK?=
 =?utf-8?B?QjdZWHF5T2l5aWF6LzlwT05yRDM2OGNtOGVTRkZTQ0ZHbXJ0SndLN2FLaVMv?=
 =?utf-8?B?ckhXQUU3MndKZktTTnFuQ1oyOXBMakJKTUFFMFZsSjN4UWtTclVGV2hlUVdu?=
 =?utf-8?B?TC9iblV4Qm5nb25JTE5COXdpZVU5QVArcnlrVndXakdLYzdLQTE5cEpYSHZ0?=
 =?utf-8?B?dmE4b2lEUE5TNFFpdzMzU2dMbm5oSitEbkZaZ0d0cG83VnlkaHAvaXN0bHR2?=
 =?utf-8?B?K2wwMk10V0M3TmxyUjg4S1BXVWZrM0ttVEYyVDVkeXZOZ29sUGcwV0dCRkl4?=
 =?utf-8?B?am5aNU8rMWF0c0s2aWphNEpuSjZzTUhGWWpYTTU4ZDUwZDBwaWtTQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e193f70-0f02-4623-489d-08df471c48c3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 15:38:11.7204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0DfKSappJz4bDj3p6GgATpLz4uYI/c/NX43+h5wJ4Kxh03dHvmA2mCTT84IXs5mbN5f/0Amm8WK8MeqkkAQNISFAaioly2Aw20w4dOaUwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4963
X-purgate-ID: tlsNG-42698a/1795189096-ABED69EA-58F26614/0/0
X-purgate-type: clean
X-purgate-size: 329
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/11/2026 11:11 am, Ross Lagerwall wrote:
> Rather than always forwarding VMMCALL to L1, follow the APM Vol 2 Rev
> 3.46 15.18 "VMMCALL Instruction" and inject #UD for a not-intercepted
> VMMCALL.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


