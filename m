Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61841606A326
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 16:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=mI14yNMD
Received: from list by lists.xenproject.org with outflank-mailman.1472211.1680173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOdtW-0006gw-AK; Wed, 04 Nov 2026 16:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472211.1680173; Wed, 04 Nov 2026 16:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOdtW-0006gp-7b; Wed, 04 Nov 2026 16:31:26 +0000
Received: by outflank-mailman (input) for mailman id 1472211;
 Wed, 04 Nov 2026 16:31:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOdtU-0006gj-Ir
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 16:31:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOdtT-00F0EG-Vm
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 17:31:24 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aeb5dd3-2eae-0a2a0a5409dd-0a2a4501c530-34
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:31:23 +0100
Received: from [40.93.194.7]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aeb5dda-5984-0a2a45010019-285dc20747ce-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:31:23 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB4940.namprd03.prod.outlook.com (2603:10b6:5:1e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 16:31:19 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 16:31:19 +0000
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
 b=Od/wcol4xdMNlGGqc/Zl3IFUYKv9tZYNY0QFCc5vi1gxn+9uI+3Qp3z1ufot3hHki2ToDUH57h+qStgWfX2Bvfxah+0b14uxgLqTOSBR52UspLFkFLMK1Rzs3EC8/ufR2LTJP8hTAopKUrdSt8oxScDvJKQEXHF+kzETTsmWKiLJ6T4BAvTsORxlN54Rlg08ra8QMnXmky18MfkX364cOmBcxvE6Xl3CJNeklbvwn6JzHtWhjt7njtcNeT/2R+AwJjVHSbmgNMFmPsJ8oID5tppQMxA+Wi4k+RleX/xjhDO8qPLogRwomK+wvfFXMY1WSChEBgw08YXjI2QWt9HxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zH0AnDnT78PdGq6FySrWUDxu0XRcC48TxmYqlUNdiQA=;
 b=wYTqx/6SIJdGJYCN4wcMyBfxtLSfQooLbibNe4E8QZKCJ7BsI3zFVef4RoqGkG/ccw4MY9hhEW9nnnxy5vK1M+2NENXBWbp79o5ZvCMkyrNlxx6accwviHELImQwTetk5KtyxdIQBLk3WV7gJGiVLobk3r1mOJqwvz0ACntxyA/9uFj1drUqfKSrPg2NIouneye5hHNns/AZTb5k7pAIUpoUpCvnN8tcmejLbPLXwFYNqxL1/SIDoFfKBKZXUCa4enf1ArOVjp+Jh0DZuWtnt76dPyixtgY87hd/JpVNvXjmz6NH2DBobQgVR0BYDnxYX111/CXlcCF74FR3v0OUqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zH0AnDnT78PdGq6FySrWUDxu0XRcC48TxmYqlUNdiQA=;
 b=mI14yNMDvPPuktzpv2G1jR5SF00R1QyWycLR9nkF7/bqaTqubP0WT+F/U/GSgvkPahHtshmmulk3f/rNDj1rfCr9UJJ90EHcfy9+BB2IUW5RmSiBpkIVTgN1BX/MBETWR0wttFxII7iV1komT2kufvMT+/V3xZv0/ovtr5dFyz0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <67b28949-be62-416e-be27-5f1b81bea8c0@citrix.com>
Date: Wed, 4 Nov 2026 16:31:16 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/svm: Adjust vNMI handling to update the cleanbit
To: Jan Beulich <jbeulich@suse.com>
References: <20261102134621.1693316-1-andrew.cooper3@citrix.com>
 <6648b7f8-bbb5-4231-9c30-ed7843a5d59a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6648b7f8-bbb5-4231-9c30-ed7843a5d59a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB4940:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c1a8c1-73fa-4533-ed6d-08df3a910e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|18002099003|22082099003|4143699003|56012099006|11063799006|5023799004|261022075727099003|261102123227099003|261026121527099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	5gzXlrsi11scQHgma/h7UrwGmoioAuNpGTJTL412zi4IIbxhxJsb31RFczxIjbC8Ne2dd459mI7b6VqLYUoBVE1e47SUBHg+5BReqFC9EO8hyZaSNbHy87qcH79eljkLoMxrXXxJiR8/ykFcXMylndAEJ8N+e7YCbEZ4quCKNJyiRxEWeU4vxKWnEdzDDyPkWooEKJ1wsfkL5N9DwKJEybFJwW7oOrfaQCOLf8dYHOf7JZ9SYltcllMAzF5SRlSSVkbzd003IQP2QchhkL1OL5/a1p2qecAhjrVLO6IstTujm6cdG3mCZzZ1XGYu6e8B/QCW0WSDZz5ClFGPZL7qJP+kSZNC7G/QCG5CxoSgBwWneVncM/pAx5BJERNj41VLkLTjSI6DZbXqKEBx/anLbl024UsuDP39KHCxrpGYIOdX0mrF4uxe5ltpNk3TQJR9cIoTyt1SsgOEPFfcOSljbOzBvjEaRJBO7OzuQRrGxm8y/PNO98wIMuePVBIIN21/q69BK7LV02QowbrPRUPAckCj8Q/cko7PbRXJKoGrMEZRmSfEfo2lyABbB3yC/C+rj9Sjy1z2V2EtMfRvFvmM8wYbnk14DDgZNkThWtmYsPF8Of9GSbcl06BB+8t0K56i4Hqk57BoFkJRt3gYvv8GAewuirPKGZtmjWTjcuZa0AM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(5023799004)(261022075727099003)(261102123227099003)(261026121527099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnJDa0VsNUo2ZWVhK0xSekRsODlkNDhDV1VJaTlvb0Z1bEpibHZ6TGo2a0h3?=
 =?utf-8?B?TkM4TWVuTjFzNElIM3pPOU80QVBoOSt5cWlsaHh0eCt0SjJzUERzczF1UXBZ?=
 =?utf-8?B?MVJIN1kxUVFoWExRODVRVGlDRkpFMkV1VGNsdkg0aTZaWGN2STZ5eXdnU0pa?=
 =?utf-8?B?eFNrVENzcmdMai96eERGdVMzQ1lIc0xIZzlKTVhadGcxN3N5T05RLzhBNjRP?=
 =?utf-8?B?TmpMKzk3Q0RweTB1QjJGUXAxeG85MFc4eGRXWURHeVRBR2l2M0JidXV3UURX?=
 =?utf-8?B?OXMrVVY4d2Y4aTg5TklsU1NRbzM3SFBjUmNwaGxwcWt0TlhDUG5sRWNUanc5?=
 =?utf-8?B?RU5vaHNyVlNkZUVYT2xaYmNGTXI4dVNWY0pDYnJnRThaU3lKRW5uZitjQTVK?=
 =?utf-8?B?ZVR1SkdmRm85aGk0bHA0cHJYem5yVVdaZkgyU2sxSDNtTVA1R3VjaWx6Z0Fx?=
 =?utf-8?B?OC9CcUlteS9mQ0N4TTVKNkhBSlFJK1piUFo4dE9iS28rdXY3SUYzRzZZRWdl?=
 =?utf-8?B?K2ZRNXZsVldtblRHZlNwNWRlY0s3eDdvZzQyRzAwM1k2VVdxUTkyZ3pLazU4?=
 =?utf-8?B?Q0V6RDYxSkEwN2FrT01jWFN3QUxqcy9DNEpkalZUS2FWdDVKcktuSCtvb0t5?=
 =?utf-8?B?K2pBenFxZndsMDVSaDJEVWhUWnBjTWRpbXdPUWpwSmxBQmFJd2xieXFlZnQ3?=
 =?utf-8?B?RnU3bk9kOU5oczNMRmxHOXFoZG5ObWc3aDV1V1BGSDdwemNGTUx5VERPejVa?=
 =?utf-8?B?V2VZcnpyWUx3K0JnKytYMCtRcGVJNTBVQzF1ZExZMUY1Qk9sQytTRGwvWWVE?=
 =?utf-8?B?Vy9mbHdjSE5PVTRkbkx4R09qaDJlaWdqQUc0SkwzKzRJNzFmekc4dEtNZ2Nx?=
 =?utf-8?B?QkI4SW8yU2Q5a2xiVm1hbmIyUlQ0WVVrU3oxUkpJZXlDMGNyZHB5MFFpRXBk?=
 =?utf-8?B?Z292Vmx0TGM2N2lOUmpEc2ord01UR0pKREdiaFRvWlVnQTIwY3hrRTcxVWZn?=
 =?utf-8?B?WmxVVC9TWmRGcTF0d044dCtPT2tlblhRL3UyUjNnNHRHdkNZNzFKN01pTFdE?=
 =?utf-8?B?RWxnd2Z6NU5KR3FhV0Q3bFg2T0ZzV1ExcmxveThEeVFoVVVIZ3dzUGhUT1Zy?=
 =?utf-8?B?a0tETkk5QjFPak8xQXVjM25DdFh1ZXh3TGZPbmxXRjg0UFpVSEZ0b3d4dkI4?=
 =?utf-8?B?bm5aVkpzK1V0L0hxbkN0UFdEamxtYVllNktNcXJmUGxKenp0d0F3R0IvNDM5?=
 =?utf-8?B?dllFN3drMk5uaGYxNWVsRGYzRkFyM2ZNSDJjZDMxM0ltWmFkTk56QlNQdE1M?=
 =?utf-8?B?UVduaXFmR29tdExybFdKVjhnV2t1cVQrSGYwQU11N0JFdFY1eGNDS0Rma0dX?=
 =?utf-8?B?SmJqbllycHNjQjJQZ29vdHBCS2dzeW4zV1VHMGtBWDRsQ1BJNlNoSmZHdGRw?=
 =?utf-8?B?L01pU0hJZml2L2hUd1JlUnF6Nmhqb1QwbTNXaWxOaFpmVmFlTkc4WENwSHlR?=
 =?utf-8?B?eFlRVXdrRVVPT1Aybnc1bXJxRHYraVU2TGNyczZwZm4zMWYxTlBvMnVYTVpB?=
 =?utf-8?B?ejlyUFF3b09SOXhLZ2E4VE0wSHVJaU9rNlJDVXNWMHRvV3hiZzI3dDRjSFpT?=
 =?utf-8?B?UlJ3ZW1rc1pldUVQamw1VDdocjhKdWwxY3gxT1VhVk4zeXBjazFucFQxRFB3?=
 =?utf-8?B?RWF6d3pmMkY3NVp5UVdJcWlGbUhHQlBiUXlNNnQyc0VZWlhQTENGNUtJbEZm?=
 =?utf-8?B?Y05yU1BuRDZXVTJVNHVpR0lIbFl6bHgwR28yNTVvNlpRaHhJNFhMZGxVUG1R?=
 =?utf-8?B?MW11RU4rY2pRTlZTMHFUbERPL3BHZGM3MnkzOXZjT0pnWk85N2pBdDJHQkdw?=
 =?utf-8?B?UDZReU54cS9EZHk5czNVMUcrRTFjbm1ySiswRWM2Y3pkOVh0Qm00ejBlZ2VT?=
 =?utf-8?B?aVNHTWR2ZkVPRUdDK1pPSUx3K2U3M1kzenFVRlJ1bzVMblc4TElSczNsZ2Rs?=
 =?utf-8?B?OXFvc2ZYVDk4dmpyQUZvUnNzYmxMWDllVUZTVjg0MzRtQnZVV2traFk0aXh0?=
 =?utf-8?B?Z3Jtdk42VE5UVFFhMStCZXNCVVk2SDRFOFllTGRjOFNXTTc3M1I0Mmk2K1Fx?=
 =?utf-8?B?d2ZaeTFkNWhObFFtZWd6VlQ5Rkp6QVpXTDlsSUZoMXczMXk0RHpZSGJaSkNK?=
 =?utf-8?B?aDR5azNjVTVuQTlKaVpoTGRRZHNHSHVXeFZaSjB3ZUg2TExKRzdZdDU5UWk0?=
 =?utf-8?B?TkZCSERjK0ZFQWVrOG1SeG1BcTI1eCt6YS9aNFpQQnpFayt2em5jaG56Y2Js?=
 =?utf-8?B?T1IvdllPOFVCOWo5dXpjdnpyQ0tKZVVtUmhuN2xPeTU1QUloUitxZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c1a8c1-73fa-4533-ed6d-08df3a910e3f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 16:31:19.5236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrXGozmsMut1dkr0MNGeBBPtHQONQHEazWnyabSS30QGwMdEg6Q16n35+uV13Z7sLJ5q6MSHQtHvKXNiUW8cMhbCcvPbj0IfjD+bHgkCWvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4940
X-purgate-ID: tlsNG-d62444/1793809883-C495A757-4EF2FE9C/10/78276251493
X-purgate-type: spam
X-purgate-size: 1079
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02/11/2026 1:51 pm, Jan Beulich wrote:
> On 02.11.2026 14:46, Andrew Cooper wrote:
>> Despite prior information to the contrary, APM Vol2 revision 3.46 October 2026
>> has been adjusted to state that the vNMI fields in vINTR are covered by the
>> TPR cleanbit.
>>
>> Adjust svm_inject_nmi() and svm_set_interrupt_shadow() to use vmcb_set_vintr()
>> rather than writing into the VMCB directly.
>>
>> In svm_inject_nmi(), fix an inefficiency from the introduction of vNMI.  Move
>> the reading of vmcb_get_general1_intercepts() to the point at which it is
>> used; tt does not need reading on the case that vNMIs are enabled.
> Nit: s/tt/it/ ?

Fixed.

>> Fixes: 86a203ab8d38 ("x86/svm: Support vNMI on capable hardware")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Assuming the first sentence of the description kind of implies trust into this
> being the final word on the matter:

It is formally written statement on the matter, where previously there
was none.

> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

