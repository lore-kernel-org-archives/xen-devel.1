Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B81606A31A
	for <xen-devel@archiver.kernel.org>; Sat, 24 Oct 2026 14:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=tB7e+rf5
Received: from list by lists.xenproject.org with outflank-mailman.1460066.1671530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKcRW-00045V-JN; Sat, 24 Oct 2026 14:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460066.1671530; Sat, 24 Oct 2026 14:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKcRW-00045O-Gc; Sat, 24 Oct 2026 14:09:54 +0000
Received: by outflank-mailman (input) for mailman id 1460066;
 Sat, 24 Oct 2026 14:09:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1xKcRV-00045I-MI
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2026 14:09:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKcRU-00FVbf-V8
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2026 16:09:52 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6adcbba6-bab6-0a2a0a5309dd-0a2a4507c48c-34
 for <xen-devel@lists.xenproject.org>; Sat, 24 Oct 2026 16:09:52 +0200
Received: from [40.107.209.0]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6adcbc2d-b4ea-0a2a45070019-286bd100dc8a-3
 for <xen-devel@lists.xenproject.org>; Sat, 24 Oct 2026 16:09:50 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by CH5PR03MB7888.namprd03.prod.outlook.com (2603:10b6:610:210::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.20; Sat, 24 Oct
 2026 14:09:46 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%4]) with mapi id 15.21.0546.021; Sat, 24 Oct 2026
 14:09:46 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHQ40X6P2qMfEveaH9K0r+kTlrvi39JuH4Ts2IX9zghHghD9knxUebuDv2hGeOKM5+RbcDJjdQ8HcbQRy0n+amvv6y2tvBiEiag6KxXWQlPyYTCfOYnZPVQHta+ry4pCzsoEMC+4coWBo0x5KZaW7ncxhan2SBNjNp6uJEg7TAMv6R7eKxNPNfmdlDwqOnxNVL0uRoV9JQ+HtNHcKRkzUgjJYwqPr6B2rDqKRW6xbr3hlruvs2xl22dlAJFksvE3/2y8oDXKTdqpR74fg6DL5h8E7v1U6btTNPKWsdyhNLIkpNJPfOsItYwqKrFo3NhXWLEldkBVXZqeiSGs5BrDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlELAyw88BPv+kxDeeyrgZ+PSMWomOIQZ9nCxcMKp4Q=;
 b=VtLTw0ho476qH+Pue6t+lNFv/AS7qEmxoEpk/u0eZYxELC51LtQCKVUCTgsK/z5S1Ia2f3WvBjr8xmVCPK9aoluRjj2PZP2wmnAToz5pkIifAmaJ/y7jMEIhcoFyGV+UNiOcxaA4X3yfvVzzyVTK6SftcNNg6FPpBQtX6u14kTy9ism2HMkdNaJjlvQEpRAsmvQCw+HM7zWXmCnd+/pWzbeKCHFVUw4T9TtpV8UfDocCrI6qtMUA7pAXTsrOcJIc7rxVmhitqExJ4wZHIRzbVer7ETaH49wynnB5YNPI6YxIbZOoXlofXo1Ch4NN67PHNg6H7md+PEdEUwgivWFF4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlELAyw88BPv+kxDeeyrgZ+PSMWomOIQZ9nCxcMKp4Q=;
 b=tB7e+rf5qedCXD/PD1kr70IeU2BzGRECXa9jf6h2EwURDAeqTfhB085bPPK9cVXpRzJDDav+ZEWLuNK6fC1kWi/j+aGFYDwlwLDY3sdhv3k1YgV9YklKYkqrKa1+0ti5S/9ohNQ079f3uNENdQ8r7k5CmKAQ/2KY+3vPHLTSwYs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC 2/5] xen/livepatch: Allow tracers to schedule livepatch
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Ryo Takakura <takakura@valinux.co.jp>
Cc: xen-devel@lists.xenproject.org, roger@xenproject.org, 
 ross.lagerwall@citrix.com
In-Reply-To: <20261023045346.164171-1-takakura@valinux.co.jp>
References: <20261023044809.162759-1-takakura@valinux.co.jp>
 <20261023045346.164171-1-takakura@valinux.co.jp>
Date: Sat, 24 Oct 2026 16:09:36 +0200
Message-Id: <179285097671.1706038.6114522060925613675.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792850982; l=3785;
 i=bernhard.kaindl@citrix.com; s=20261024; h=from:subject:message-id;
 bh=NXsTzMUMfmR9IJQcdF8B/7/pZcg/Lnr/xNwou/wIkZY=;
 b=I4q/H2cvOVA9eSOZatnVoA+stOpS8yGuXgVvBc/4iK/BpP4mEAcdiVZHWp3rJ0bld+TEErvvu
 fnlgw9ayVfUAEEkmGSV/p2clh8OxIPNb4fmN+k8Q/POw0bNeQSnbV8U
X-Developer-Key: i=bernhard.kaindl@citrix.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=
X-ClientProxiedBy: VI5PEPF00000976.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::816) To LV3PR03MB7707.namprd03.prod.outlook.com
 (2603:10b6:408:28b::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR03MB7707:EE_|CH5PR03MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c8f5a78-7a08-4a04-93fb-08df31d87580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003|261009223027099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	cQ4AH0YS6JcYsOdCK2MWpO6iOgoLETMnqwmP5vDIHKnV/dpp57MjSLtZNFi//BC70AoffZxNIckXU7LSKU69vfq9iKD8lbBB/Wynj8LHb0KfqQ+1OTDkA1hNoKSm7/8gE7PeseSaxuR5F91IVPmCRBMgL1MuWLgP6GENXMMPHp+ExcWFmUwN9h4F+DUugFFixncJz22C6KZzVYDh76RikIurTK5vbw1sfHRYUCqW1Kh212u/bn5xxp5ijNbMy/5usQInap+dtSit/LecsGp7IXrMPuwxgjdQ647UKrd82k7kj2jH/czvZmHd6I3ApbsdidYLC/TiWG/aZrnWNNjp3EANk2Y7cssV+JW4gTG6di9uIGMZ0rRjJ9LoHIJLe7zZZ9jv+29PL1Vf7JMp86PNyTKjL8EcUKqgYCSUCZzbLHnTCm01mEqaqN577+UsRZRf7RSxGcsWRDXXkv5/d4S8qYeImEP3j8/rzDkUJEaVKFvxHTqJqY0I23x46O7QDV5uzJG04sg7rg093o0a5yIy2VvJX+Jt6/HHF5BNYt4NrZEfJzlxd71BPgCj4RbRKoztTEEktdMnND51ftSP9eXRnIzcLfZhVUxMU7V6PeCgUaANAu6gXvZcGlB78XjPZIGFZKkEgQGyQrJyAvk8p5xd03ciEpB3KQ/Dj8r+UwDalNk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003)(261009223027099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk1WZVdZcjdqT2lLckR5THhWTmRzRGZsNXdUSEZFbytlR2VZdUovalNIVy8z?=
 =?utf-8?B?MnVHK2x6OXZOMFkrT3E0Qzh2WVcxTTV1ZWNhTTJIbUE3bTRzQkVmMVBMblVB?=
 =?utf-8?B?dndoVlVLbHB2Y0ZueGFqaVdOUEtXVGFJVTNBblFqdjdYb2lFNTFNMTZhYnRY?=
 =?utf-8?B?V2hhSUhrc21ZeUlOMWwxcndZdjdsNGRSQ1dLNmFPUkxpTVB6ZXNOcnR3ZmNy?=
 =?utf-8?B?Z2tRSTlNalJmUFVDdndTZEVjZ2tpeGVmalBtY3REQnJJdlBETU1yMHczUURa?=
 =?utf-8?B?NXFDRmdLY0Z3a0RNM1RnODFvaGZzVmowQ3dubGZaNjkwcW91aUNjaDJpRlRO?=
 =?utf-8?B?T04xS3NFbHRCc2pEMVJYakxJRTQ3ZktoUUZBYTNtYjFsS3hQeEZHd2Q1L2tx?=
 =?utf-8?B?MFh2ZCtnYlQrVTBjVDdCcHVibDlwbGxNWkg3UE1PZitKT2wzMUJFQUVrZHow?=
 =?utf-8?B?MjBkbTJhTTlXS0JSZ2tuOWlXeE5lbHZTbktWM2NsaDh5OTBjZ1FXOXYzcmtE?=
 =?utf-8?B?cHZPc1hNZDRiRXNOdEtTK1diVU1PLzBQWThUS205OThzRE13cW9QVW1SZzFD?=
 =?utf-8?B?K2N6bWwyNXNiR1lFUHVuOEg0WFJuWTJVaFlLaWYxaldWVDRHc0F2WVVYZTZv?=
 =?utf-8?B?RjZaaE5oOVJhOTBaZkFFUWx5ODd5Vy9IY29pZS9HYjNIYVE5WCtDSERSOVhk?=
 =?utf-8?B?NCtQMGpIMFhVRncvdUw2OVY2a1JRVWlLKzRrUlkxdWprTTlIT3U4L3hHK1VU?=
 =?utf-8?B?dmsrM05nZ3QwcnhoUnNkUjg0bU5rRXVnZzhwWW1idEY3L2kxbnF6MDVyeFN5?=
 =?utf-8?B?NkdjYWxnZ2xWK3kzTVFIR1hEaXlOVVZjMEpqZUNYUS9SMms2TDZDOVp3Vjh0?=
 =?utf-8?B?aGhRbytZaUdEM2FKV2lHNk5vY2Y3ZHV6TFpRMGxqd0NkZUNLUFM0VHFINnEw?=
 =?utf-8?B?eDVmUGsxWTN5VEQ1Y0FKNWFKOGRhMDMzSzFLMjBaMWpyRUNYQ3FhTjZNSHpB?=
 =?utf-8?B?L0d2NTF5UldZOFczbnY1ZWZlTXpDMEtSTW1zTlBTV3BqYjdxZWNRMFNyYmVH?=
 =?utf-8?B?Uno0ZWR5RCtiak1wbnUrb2NLNHhhWjJQb3Q0blVHdFpIbkptbFNKQUlIMWVL?=
 =?utf-8?B?eTVVcmMzMTNrUkM0eVkzY1cxS3Q3Ky9WT0Y2YWNWVzNoclorUlpvbXFzUllY?=
 =?utf-8?B?Ym4veVU0QnU3YVI2MS9DK2dGY25qaUx4ZVhuOVhIbC84cytCZS9hQld4VTRO?=
 =?utf-8?B?eklmTEVKWmd4Wk0xV0hDVm03L2QzeDhHRjI5TkQ5WEQ2cUJrTi9heGpoVThN?=
 =?utf-8?B?Und4ZmVmT3J0dTF0WVpWZk5sbmVjaS9ScGtYdG5wczZTYU5Dc1MrNFRwSjI3?=
 =?utf-8?B?aTd2dWNmWFhOM1h4R282Y2ZRajJ3YmtpM1F3RXY1MHhqTVJlNXRTZkkxNVFH?=
 =?utf-8?B?SERWdzE2c1Y3dldFdVliaFRxM0ROcFZNQmNoUmt1ZFdHTkdaYWpETEZZcE53?=
 =?utf-8?B?TkdDYlNqZUYwSGxHdGxBNGhTT0V2aUVUaDJ5UGZVeGJFa1VBdnlrNGsrVGV2?=
 =?utf-8?B?LzJEcmp0OXp3MnM4dEtVeXpUSlV6aXUwSStEcjhFdFJYZkd6UHlmaVJKQlIy?=
 =?utf-8?B?T2U0Zmt5Q3FNVVZBZEtBdFRxN0xycnh5enBoS28yYkI3ejl5UG15VEpTYy9t?=
 =?utf-8?B?MkhCU28zV0F3dElsS3YzNmErYzFSQzFTbjdKRE9OdVBxRGIvNldTRTBXbFRL?=
 =?utf-8?B?dU1GTFhjblJSdC9DckcxR211ZUVpNUJiU1hqUWFzVjgwUXFKNVFuUmZsaVh0?=
 =?utf-8?B?bDFZN3FISEZXMUVhWThWcUo2T1plajNLT1JyYnh5elJTYUJiK2Z4aThlSGIx?=
 =?utf-8?B?Rys3cm9pNkRCZlUzNUUyZjhTbG9zdVlBTUNyYk9zb3o4cXcxYjZFREdZc1Z0?=
 =?utf-8?B?emtsaFQ0akpGWnNiTjY4M1RvdU9xSmVUem4rNS93MURlei9VZUVoNkExQ3Rm?=
 =?utf-8?B?ZE13VHZ1amQwNFNjOGJxRXRQQzc3MXk0Zm1WV1pWai9zUi83elc3eTVSVkhD?=
 =?utf-8?B?WTZSV2MzNHNhK3hTWEpLQXhSU2Fidll0cUMvQW9oeFlRWVdiTUpHL3FoVmdn?=
 =?utf-8?B?NDdnQ2ZnSUw5amdEZFVURjk1L2pLMTZZbCs4YWNCbEdVSmZtMTQwMmFER01r?=
 =?utf-8?B?MVd1SHFxbXpvbTE3YjBrOXJoNk1rclFQUmNDS1g5WGZQemthVXhVOEhLRzJY?=
 =?utf-8?B?Z1c0NU9iMDFDUFFFZ0E5TGFMZUhpUGV1SVJxQjBxdkd5NnhHYnNJR2R4VXh0?=
 =?utf-8?B?MlpLLzBGYXp0RWtMclhHTmNReGFRLzFodFdjd0tlOFp5WE9Tc2VUNFhGOG1u?=
 =?utf-8?Q?0PjS7kcni2r1IFq4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8f5a78-7a08-4a04-93fb-08df31d87580
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2026 14:09:46.6399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEto7aDT1eICdjAKcvJDYRb7ybYpYmwyGHMjIxM3iXFZHpFPynZq2jLTuM3SLyKAfKUUjHbQB3GuojhAu3xiBEtvWYPhtJdJuOzRvfRvqOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7888
X-purgate-ID: tlsNG-ef75cf/1792850991-3C411AE4-6BD14133/0/0
X-purgate-type: clean
X-purgate-size: 3785
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ryo,

Thanks for adding this interface for tracers. I'd like to help with the
review, although I'm still getting familiar with this code and have used
LLM assistance. I may have missed part of the result-handling contract;
could you help me check the following failure path?

> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -1823,6 +1834,51 @@ static int schedule_work(struct payload *data, uint32_t cmd, uint32_t timeout)
> +int livepatch_schedule_trace_on(struct payload *payload, struct livepatch_func *func, unsigned long ip)
> +{
> +    void *old_addr;
> +    int rc;
> +
> +    spin_lock(&payload_lock);
> +    if ( is_work_scheduled(payload) )
> +    {
> +        rc = -EBUSY;
> +        goto out;
> +    }
> +
> +    old_addr = func->old_addr;
> +    func->old_addr = (void *)ip;
> +
> +    payload->rc = -EAGAIN;
> +    rc = schedule_work(payload, LIVEPATCH_TRACE_ON, 0);
> +    if ( rc )
> +        func->old_addr = old_addr;

Am I right that is_work_scheduled(payload) only detects work for this
particular payload, rather than any work using the shared worker?

For reference, the existing is_work_scheduled() in the same file ends
with this check, which is not added by this patch:

>     return livepatch_work.do_work && livepatch_work.data == data;

The existing schedule_work() instead has this global busy check:

>     /* Fail if an operation is already scheduled. */
>     if ( livepatch_work.do_work )
>         return -EBUSY;

Could a request therefore pass the first check while another payload
has work pending, set its own result to -EAGAIN, and then be rejected
by schedule_work()? Failure to acquire the CPU-map lock seems to offer
another path to the same outcome.

The caller does receive the immediate submission error, but wouldn't
payload->rc still suggest that an operation is pending, with no queued
worker for this payload to complete it?

The off helper appears to have the same result-handling question:

> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -1823,6 +1834,51 @@ static int schedule_work(struct payload *data, uint32_t cmd, uint32_t timeout)
> +int livepatch_schedule_trace_off(struct payload *payload)
> +{
> [...]
> +    payload->rc = -EAGAIN;
> +    rc = schedule_work(payload, LIVEPATCH_TRACE_OFF, 0);
> +
> +    spin_unlock(&payload_lock);
> +
> +    return rc;
> +}

Would publishing the submission error in payload->rc keep these rejected
requests distinct from work that is still pending?

To illustrate, I think this could be addressed with a small change like:

--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -1861,7 +1861,10 @@ int livepatch_schedule_trace_on(struct payload *payload, struct livepatch_func *func, unsigned long ip)
     payload->rc = -EAGAIN;
     rc = schedule_work(payload, LIVEPATCH_TRACE_ON, 0);
     if ( rc )
+    {
         func->old_addr = old_addr;
+        payload->rc = rc;
+    }
 
 out:
     spin_unlock(&payload_lock);
@@ -1882,6 +1885,8 @@ int livepatch_schedule_trace_off(struct payload *payload)
 
     payload->rc = -EAGAIN;
     rc = schedule_work(payload, LIVEPATCH_TRACE_OFF, 0);
+    if ( rc )
+        payload->rc = rc;
 
     spin_unlock(&payload_lock);
 

Would this preserve the pending assignment before successful queuing,
while leaving a terminal error when no operation was accepted? This
only handles immediate submission failure; it would not reconcile the
filter or target state with a later worker failure or make retargeting
an applied payload safe.

Thanks for taking a look; is there an intended status convention that
would make this harmless?

cu, Bernhard

-- 
Bernhard Kaindl <bernhard.kaindl@citrix.com>

