Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B28606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 10:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=vL3T0hIO
Received: from list by lists.xenproject.org with outflank-mailman.1462020.1673073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLeGb-00047F-Lh; Tue, 27 Oct 2026 10:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462020.1673073; Tue, 27 Oct 2026 10:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLeGb-000478-Ie; Tue, 27 Oct 2026 10:18:53 +0000
Received: by outflank-mailman (input) for mailman id 1462020;
 Tue, 27 Oct 2026 10:18:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xLeGa-00046y-2T
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 10:18:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLeGZ-0066Ng-FS
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 11:18:51 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae07a89-bab6-0a2a0a5309dd-0a2a450acc2c-10
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 11:18:51 +0100
Received: from [52.101.57.10]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae07a89-f2d2-0a2a450a0019-3465390ae847-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 11:18:50 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH4PR03MB7627.namprd03.prod.outlook.com (2603:10b6:610:241::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 10:18:48 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 10:18:47 +0000
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
 b=nFazbLi73J3qaYMDN+0Fwb4+f3+O2i6j8Nmf6lqzX2d8yMN80CoDfQfjVeoFaHwV7z8cLP4foyVJqGDudPMTIC6J8cPDvzKyuGgDOSiSMrwquE2zN72LeGR6oSN2Kx0SGFd5zFohiRXMUdwoBUxPYFTD8XX/PA+9F/qfCz7DrUXCqss75sRYJPPzC+ThgvuRVsL+3yhBaWW+rsx36EjEKA4XqAnL3JiAg6/Z+MBskhrq/j33P8KF2dw0ZAAxTIjl0PTOPay+Ko+hNbTwV/QIlgIJ6AoyXnzucrCVK+XmxklUZQ9tpxBzUbsOZ+XqpJxU58i7QIxXu+vF/F6T5RqNKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pf56grjtOfLmzjioLIubPA79mHi4tW9LpOI/3/Tl2Zg=;
 b=WixFkNBe6Myzv4DIOlXFKzgdLWkWSaLnYQ94t4Ly65dBWSaok7mDT9NzYk2yAryyWXRffJa/5LArR3nv9KPMepBq8WYZVwYeLnTcKRGKOGKuu5GrISdGTalUaN5/N18KbcDAO1n4tcpx1NHwjbpyoifgroLO/GQ4zUsJItrqSl4Rzn4Fcj9kwb+NE4WkQRzmT6VqHP5hk/df2S4Srrtm7cyed3HqUr6RyAkZnOHC1j8xNR82WjHiOftNC2Grgynar2c2ez9Hl3/4jxE4iG7712Mp4SQpsPAYu66XSTaJsmHPUlyS3Dri7p/0IbvxN6c5IqN4ZQH2ZRsSJfnmWxX2jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pf56grjtOfLmzjioLIubPA79mHi4tW9LpOI/3/Tl2Zg=;
 b=vL3T0hIOZ/aCdBKkhx9C6Vsbha6o8wu4BVPToBVZ1VToCnwyGsGttvo9Yp7mME7mteWMNEyoRVCPeUBvKXsm/T5xL3hkRbgoq0n8g7sElbg+6zSESkkRSqoICscST6Pn3BaWFT/YM0gXdxyPnPxSLsFNuKO05dM31Z8FyjXXJqs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ef4f6390-1d06-4e24-af66-48dc0689ad38@citrix.com>
Date: Tue, 27 Oct 2026 10:18:44 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [RFC 0/5] Introduce dynamic tracer using Livepatch
To: Ryo Takakura <takakura@valinux.co.jp>
References: <432e0fba-0765-4c2c-866f-faff8cd04926@citrix.com>
 <20261027043730.60174-1-takakura@valinux.co.jp>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261027043730.60174-1-takakura@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0218.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:374::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH4PR03MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c58b44a-dbc9-4bcd-5d72-08df3413b04a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261026140227099003|4143699003|56012099006|11063799006|261009223027099003|261022105027099003|261021121427099003|261022075727099003|18002099003|22082099003|261026121527099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	GOtdfVeOIzVEgeYOiMG3AiTY/txKW+IFEescOcqb+4/Ny0HbSra1zK4k5fl16r2Tm9qhMAc2i7AJad0T/VtoHh3FNlBxnw066ck7ZUIWcafUsOE+Nu8BJFdoAjVM15/warKQRgBMJZB1xmOVNOFwrj5c+GLPhVU2rSM28hXpTtTafjTutYDg2lDyD7dgOuxr8/bqvt323Nlsl1Ip5SQdGUzWMYWEinYC8UYbFFfXBJP+Kw+IZGuDRHDFrJzbGA3Axtmi5Q4gGzSpmQ0AoqbFWpcO+SqY8bL1iIdNJOSaVJKEjKgrCT6BWSQ/yCamR7dYdxwdMgZYT9ZGY4tMETrxtbH2VzyBv5tj8dwpiMfdlhc85RbLILzxdNbGd4/+3lktMRx+44TmKIhtDiudi0rt/WsQNlbXr6Y/MEoNAsQLDYaLS8F9PHjUKhQwGd5cX+LQhP7xanyXgd9uqef4XCV0ljooIpt3JANSFlaFnSXr4+yz2N90BI3b3vYMQAfr3XJPMQOK8RE6ueFk9rwqiLYYdVN2D8nQhBnzFbl1xgDQwmPBkM78+tzBDoPI9S20GsuzXZpaqBWiAkg1osec1RuEr0SbutvxAaclGQji7DvrKw+Wh6gECbiFZTsK70XpYFU4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261026140227099003)(4143699003)(56012099006)(11063799006)(261009223027099003)(261022105027099003)(261021121427099003)(261022075727099003)(18002099003)(22082099003)(261026121527099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUJmTnhxZ3g2TTVHUWxJSXRtazJaVUx6d24vcDU5bUhMT0tjL0VnMTN6NE5h?=
 =?utf-8?B?bEdPOHoxTHNnLzZBZGt2QWFaTkJ1b1dpYTNBQmYrMU9ZZ0Y3M0t0azBVKyt5?=
 =?utf-8?B?UTI0VDJveEFUYTZYTVdYQitWY21GdjBMTFR1ZndsU0Iva3hxOVRncExaWW9i?=
 =?utf-8?B?bDRIZzRKVElVWUppVmtMZTFhQTFoYzZySGxuUlRqdzVPcS9MZERvcjlXbklT?=
 =?utf-8?B?UU42TGQxZFpEb0MrWlRXRG8zNFdSUEpJQStRVnBSaGloRDNkMHJodGxHM1I3?=
 =?utf-8?B?czErRWtYZGJvRWRJRGdTNVBmQTYxV2UrOFVCRUdPMm8wY2pucTNiMEM5TU04?=
 =?utf-8?B?YS82dUY2VFlFb0d2TlJEZGxqNys2NHZRM3FRME03bmJ2Z2t6TU9QVys1VFpz?=
 =?utf-8?B?SjFSV1dQeUdibEpLVUlCMFVzSHJhbmVyR0IrZ0xCUHJBSmlDSldmaUlRQ0FK?=
 =?utf-8?B?YURBcWhmSi9HUzg5aE1WZDJWVTZGejVlV1g5RVJBYVV1S21CMElrQTQ4YzNw?=
 =?utf-8?B?WTRaRk9LWkxtWEtiVnRpQXJlMUpudzdqcHpHR0gxZWN2UHZYLzVpUDZNNGo3?=
 =?utf-8?B?K2g4V29XdFQwa1NPMlFpUlRGSi9Sb2ZjY2JKVXhlZktkTU9oclZQZnFxU2VN?=
 =?utf-8?B?bTc5d2pzUHVzZlVGbk0vUHlDM2ZqS096RElocWRlaU1SbDA3QVY0U1hodytC?=
 =?utf-8?B?NGRRU0NQWGhLK0drcjA4dTEwakhiblZOWTZtS2hWS2tOUHBzU0R2aGtldHNF?=
 =?utf-8?B?NXIwalVnRVJwQ2VuQ2pnNFExOEtnVlF1Zy91N0Y1OHZwQzNQRkpsYStVRmFz?=
 =?utf-8?B?akxuR1Uxb2s2bk5wYjNlNGNjR3MyenJhODVHTmJQSzdWWVA0Yit3c2l2YXNV?=
 =?utf-8?B?NXZ4ejNvanRPanQ4OEE2aUoyWUJzVGc1SGxFK3NuMXd4dERmaFg3ekVaU2V3?=
 =?utf-8?B?L1YvZng5NFR4QXBISzNsWEx4bmN3TkFFdmxiVlQxdjdsL1E0WHpZeDRLa3Z1?=
 =?utf-8?B?a3dSN3E5cWxubkphWHkvN0dwT0pVY1lmOTNsTXJVQkhrRXFESEluQTFGQmh0?=
 =?utf-8?B?d3Z6bjFYYzZFcHgzUkR3Ylp3VEZuWVN5eEloQjdUOWNPR0xwb1o3SzkrNTVu?=
 =?utf-8?B?YUR4dTZVRjc5TXlTeFk3cm42ZStwV1puNklDMHYyODZuY1p0ZENUZmF2alJz?=
 =?utf-8?B?bVFVK1hQZmZxSUxWb0E4cWJhcHhpSS9PWVgvVWUrRnVGMy94Nk0xUkduczZF?=
 =?utf-8?B?MVhlMWJRQzZrUTJidE53UFp2dlpsR09DeFZHRm5jUFJWRnl6RStLZ1BUMTNF?=
 =?utf-8?B?UmVrRDVGcHRFQ2Q3T1NzN1Q1WTBhQUlOc1psYU01a3JvTUNsSkxEcjNiSXFQ?=
 =?utf-8?B?N0szbFNpSGhwL1orUlVybEtJcE9tbGZZUUxTcEZQc1Bjalh2R09jQnZpajhI?=
 =?utf-8?B?czUydHJpQjEvejYwYXR0WlVvcFUwTVJKWWxWbTh5eW8xYy9JeXplbmsvY2hr?=
 =?utf-8?B?alVldzkwU2tVMGd5Uml2MlEvMGgwMk9IYjBIR1M3Mi9hcWtTYm5KNWJGWnVq?=
 =?utf-8?B?cVNIeHNyU1Y5OUxESllQMDJCMWNWbjVheFZCZk1hL1g1WE02bmhCaGJjVUUw?=
 =?utf-8?B?SmQyS2w0Nk14RTZ1WXYvNVMyQjlPekJDL2toNDRqT3Fid2wwaytxLzYxN0JL?=
 =?utf-8?B?TTRONmc5Mm8yUVhOaGhlaERtWWZNNWgyMjZKbUpWVG1tWll3Tm5yQ2puQktZ?=
 =?utf-8?B?V0FJSnJIRnBwb2MwZFdkSEZGUTN5NU5QUlNSSnpPTmpsSW5SLzBBTDFFVzZy?=
 =?utf-8?B?am5seTNFSUpDVllkOEI3VUl3anN0WVAyenk5Q1luUmNEb21MWUlmWDlBd0c0?=
 =?utf-8?B?TTJ5dE9hRkpVTHNXTVZhSVVsd29VZWFmb1FYUFlQa2dKNjRBS0R1WmNqTmVi?=
 =?utf-8?B?aTU5cXJvSjRYL2lrVXZRcWxZellwQWtOdWplL1hKVUc4ZGJKY1ZnOVd1YVE2?=
 =?utf-8?B?RmNDZHVzRHR2WjduOGQ3RXFlQ3hSakdRZzl2RTRQa1pja096azB0b2lBNDZv?=
 =?utf-8?B?SWtTcTVQUFlObDgrbkJzcTdRaEV3Qnk0VTRnMVkvZStEMHdmQXVSNFBuZDBt?=
 =?utf-8?B?Y2dOYkRFaW95SjlnWXZlaTgrd2k4QVZlRzROS05TRW5raVNLZGxCT2ZFQjh6?=
 =?utf-8?B?clFkbXB2S2UxakNIWEJQd3JMNEMxcnVlczMzZnMwRGFWWnJjbGRuOStvcjJX?=
 =?utf-8?B?d0VvTnVyc1lsaElWTmptdFF6djNYT3p4T05wY29sUXZ1enZ0N0RMVWk0V1Vr?=
 =?utf-8?B?L0c4YUMyc2hGT1JnKy9lallIbjZnbTlTZ3NtOE80NWF3OHdpSUNxdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c58b44a-dbc9-4bcd-5d72-08df3413b04a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 10:18:47.8144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qP1rQCIuyi/RXBw7QvWac8eBEANaar//SqICpjWN1CmYaBJg396VngqHEt5zZEGvJKJ2sqMmwZNQKqu/FfmParII3/+cpcDnNEAXzmWumE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7627
X-purgate-ID: tlsNG-4011c0/1793096331-502F0CFC-6B33B757/0/0
X-purgate-type: clean
X-purgate-size: 1603
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/10/2026 4:37 am, Ryo Takakura wrote:
>> You are also going to need a GCC_PATCHABLE_FUNCTION_ENTRY_BROKEN symbol,
>> because of https://godbolt.org/z/sde4faxaz.  See the ASM_GOTO_OUTPUT for
>> another example of this pattern.  Just use a plain version check rather
>> than tying it to XEN_IBT; this is a new feature and people wanting to
>> use it can use a new enough compiler, and it avoids variability
>> depending on other options.
> I didn't know about the compiler behaviour. Thank you for the detail.
> I'll make sure to check the acceptable compiler version and add a version
> check as you suggest.

https://maskray.me/blog/fpatchable-function-entry seems to have a
blow-by-blow of the bugs.

The ordering with respect to ENDBR instructions is the only issue which
will affect Xen, I think.  We don't use COMDAT, or BTI on ARM yet.

Clang support seems to have been mostly correct at the point of being
added, which is rather more than can be said for the GCC side.
>> Separately, you have a number of MISRA violations which you're
>> introducing in your series.  I see you've got cf_check, which suggests
>> you have built in GitlabCI.  Have you also run Eclair?
> Thank you for pointing this out.
> My apologies for the violations. I wasn't aware of the tests
> and haven't run either of them. I added the cf_check following
> the existing code that I referred to when preparing this series.
> I'll make sure to run those tests before sending next version.

Do you have an account on Gitlab to run the CI testing?  If not, reach
out on Matrix.

~Andrew

