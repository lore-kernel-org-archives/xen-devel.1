Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9498D606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 10:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=ZvBRQV2J
Received: from list by lists.xenproject.org with outflank-mailman.1485476.1688670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRS61-0006MO-O7; Thu, 12 Nov 2026 10:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485476.1688670; Thu, 12 Nov 2026 10:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRS61-0006MH-Lc; Thu, 12 Nov 2026 10:31:57 +0000
Received: by outflank-mailman (input) for mailman id 1485476;
 Thu, 12 Nov 2026 10:31:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xRS5z-0006MB-H9
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 10:31:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRS5y-001L3Z-UC
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:31:54 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6af59599-e002-0a2a0a5209dd-0a2a450786a8-8
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:31:54 +0100
Received: from [40.107.209.2]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6af59599-b4ea-0a2a45070019-286bd102365f-4
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:31:54 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by SA0PR03MB5595.namprd03.prod.outlook.com (2603:10b6:806:c0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 10:31:50 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0592.010; Thu, 12 Nov 2026
 10:31:50 +0000
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
 b=viYKQz5P8t+KhlHd7zcaS1qeGeUaJifmVji2HDIogdizcq8I+2jxHn2Ltsntss1UFeAp4yNB0CsMAvAix99vp43m/ngd/2oV7WAzKTJqr/43rQHP+g3CbzBCA4BYyxwWwZPyP1p/Da6gPm5PtxgxjHc7Ho2ogbYoRM2G33JlgvxLwUotqNKhgYNxh7FWEcUU8qyHWpSFGHfQYYszLnlz1VeDmtUZlRVRoTqCvuP3aKvUV1SSqUWFLb5B1FEoMqEDI/G8XebSQ7xHqIuuy171aaqDdzKmV37ahwKCAG67g6PwImB0ffn0QjoQt7MxHEVKdxj93Zu4XHay/EZeoNrmqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+cy3quM3jUuaEVRC1Z7UOiyA5Me0X4vpg4ZUNh8PTs=;
 b=isrU3QVQBgBrpCj5DEd5ov4cOcY6QND9BrTrDhtTcyoFosDCw/tez0V4TbmVkb5flQYeP2552IOGX9jW11JOk/DWbo5iNos3SZjUdYTuRMI4MKlDy4UXJy6Dvgr4Qd15+UUWS7fh29o2gLTBOlw2hvyK+dO+AYwkGUuklNoGyBXqKqJhFPyEfDFAiawN5zCZxV4S7vqaSk2V2CDVkKR6OxPxL7hbQI7eMFb4oWJGxh0wV8+K2wkst5XhyMDWvnXcRdclcqOCU1xrj0x9xq3V70ppaw3pafigc5LPNhZLo+PJs5Z9BopZ7Pw2PKDUx0jbhtnL7Ury0SNWKYx0cs8uvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+cy3quM3jUuaEVRC1Z7UOiyA5Me0X4vpg4ZUNh8PTs=;
 b=ZvBRQV2J/SWEOND6LL9Ql9iIY2Z/BUaTPB72wKQWbD8ncofNpfMhhv8Y6nmNrS0VUX8iTicGPPGA2gsYyN4CB5Eid3CjCp2unYWUVtmtuHDnIpHN8FNrFz9WxJPY5iX5SEV7AVj9m2OOUwKP/k5KEz4GJ9LpkIJ4m9bXk0F0Fa4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: jbeulich@suse.com
Cc: andrew.cooper3@citrix.com,
	roger@xenproject.org,
	ross.lagerwall@citrix.com,
	stephen.cheng@citrix.com,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86emul: Treat the vector of INT imm8 as unsigned
Date: Thu, 12 Nov 2026 18:31:33 +0800
Message-ID: <20261112103134.113023-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <47ed6cbd-77af-4328-858c-80d0ecae50c3@suse.com>
References: <47ed6cbd-77af-4328-858c-80d0ecae50c3@suse.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0101.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:cf::7)
 To CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|SA0PR03MB5595:EE_
X-MS-Office365-Filtering-Correlation-Id: 2984a335-ee06-4f66-95ca-08df40a828fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261021121427099003|10067099003|11063799006|261026121527099003|261021135927099003|261022075727099003|261102123227099003|261022105027099003|261026140227099003|261028144727099003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	7RjZZpfAXZLjEsA9oH5SYmY/tjNoERmV/EMA1m+37W939KqbsE9WBZv+0AM/EA2wCtxM/OK2Jnkscj673GwX3qOuCFNRMoCimwbv+c6d7ODEmYGMOa3+q413TfrFnHIZ0si4+kylW3Gzls5Wb8cFSXyMUHGyUSGLArc24w4iHiycKMEg5EoPbjwfSyIw5vVFZagPJcybBvlw39tDLx9yBOGzhFNPy7eKyVnakxsSuL5ZnObkr9nC37ikEjtEUzZlF32TrAaK+bW94Z6blHf0YXfAoMcPBMo/ucQPuUDDEPQDE0PecUFNjSSLN6O4NSpGzn79YuGaAOl0MJJ3j/6+6GCrqpZ8FTbS1kMElaoXsxXSQoVOhWUj2UKbgVaSwLQtjBoqrfT/0MXvetc4WcoSbxNJu0004zUggcftppM45SIsf+Ekf15jAxcTyc80aqsE9JFos/iFbfrYZ5XCqi7zTc0YiqRVHRtH5cjwpYt7twt+kkuktNbh+L0OYIquz3wf2thwLpSOUkyb1K+Nk+2Z9VjIZVXX4ZCXCgkdBTMPIeqzy9jOZxXnirXfNJ3g+K9Tf7xWzKtMMPVGzdNtNZa9hWuSdm9iPDGDVh8zhRK0/6JI7nnX22WwqVW942sJZHR93bmJvBUa9EH5HeLhWQ5ITgktjXVBycHy6+RFjuY70ls=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261021121427099003)(10067099003)(11063799006)(261026121527099003)(261021135927099003)(261022075727099003)(261102123227099003)(261022105027099003)(261026140227099003)(261028144727099003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/It+auSqYz266JV6qBtHayC4f6/a1Mupiy5Mdre8tqeudujgg9FK9BptJnRC?=
 =?us-ascii?Q?QAupxwP36NxMnVZFaGEdGTUqKbNbar/FfuXHK4YMzV2zrfGLKdzDcDVUwL7d?=
 =?us-ascii?Q?JAQRVFfPdT4IhlxJxidW+e90phQ8kcfwYqh93w/FggVvgqGtva1b1PKpqlI1?=
 =?us-ascii?Q?SB8afI43ewBM7r1Vrn7vf94h1YWX5jBLBuZKWsrQJ1EGR1lV3J7hPeAD9Wap?=
 =?us-ascii?Q?n/QI89uvK0K0+0TzRXDtBMqYtVlkCoOikQJzoZps9OYh7i/OIcrX4ecDSQZj?=
 =?us-ascii?Q?aRQpOQZiMksXe1E8fgwfTSrMyOx7p1+/WKkoIZGjCj6zs1GRPs2gLPkhS0dx?=
 =?us-ascii?Q?f+UCNAKXqeYi5LFmIJRNbxFKwd1Zj/J+RR4+wTFJpxbrikiDh0GUGUY7UMot?=
 =?us-ascii?Q?V5UejlyGE3HcomSXRSQWCwfEnR4P0QA/g6XMjNqpBAndOvhdgVN0tszPDzTb?=
 =?us-ascii?Q?yYjXz1RURrfn06YWFhjYDG6MzesnFKKcHICAM9CIHsZ0tug8aDY2hLZCZBRD?=
 =?us-ascii?Q?m+5DDZxS+5ey7tdSpDhGAp3+dlKs+XzlyIATgDU7qn0mPRZyYwMFd+7vqfTC?=
 =?us-ascii?Q?sLvYINAfpYZbxa+PGY0SnQIg66rSKOpdvADi4mjG9RTJ95MN5Ib+0XJAXQBV?=
 =?us-ascii?Q?3usa02BCXzjpmv6G5K+eirTzunCi5sWSC5AUDtKJU06PJ9SR3GnaUG7RBJuP?=
 =?us-ascii?Q?WfPWh6BB1BS3SzhaCwFJEtTfX1wdVW927QZCF7VMl12tEYjDOl2nmX0J28LN?=
 =?us-ascii?Q?959QR3HE1CAYeIhwyp8TUu9JoU2WmPS9NRuhWOyc60J5AddfhIs+zDTVnkvA?=
 =?us-ascii?Q?6zxpyaEMI8oDXbtcIEU0Bwu8tVS535sfjrxPmxPIUTfOnEIPvzc0xmBhpG8m?=
 =?us-ascii?Q?j6168LniZT8+nZMArX7KVAsNYNgBWeJbCUfA6GtIbIUOcSP7+L3KjGLgpg6r?=
 =?us-ascii?Q?b//npZRswGOwZB60R02tk1e2Wh+5TF0JTiKn3sS51vHVfeID3GrrLy8ENg5h?=
 =?us-ascii?Q?kpD5BmsNN9ZWr5F18tKDk9YNbVlZhM5uogXC887f0e1AkLHXnHr0reczr031?=
 =?us-ascii?Q?8/PW5M1ViuURAqc2vMeVk5h8BBUsc/zIPDjvwnNe/utIwx+YolryvYzS2hy4?=
 =?us-ascii?Q?/YGw8f8Q96eIMZlV8lqeNt/iD/FIMPs7JZpiesn4Ud+wjdHefLLLJAJIkQcg?=
 =?us-ascii?Q?ggLgUD2mez4s3IYdmLTq4IDX4llusYc6lZVm9Yipjvl/NTpJ7OSHccC5QhY/?=
 =?us-ascii?Q?/N1s3Mu9t87LiIumEYdyg9qV4JVl2+yQW0sIjcPj5NS/UlODkETwGZC2UssX?=
 =?us-ascii?Q?PxHnOr3gKS0tGkVL4uns3e+L9yLjBRS7h1MqkR+HU2uqhrPtaGtZCHioeEdY?=
 =?us-ascii?Q?yO4FIoU4QJNLCsXQ5WKXnwkEKA+NXMOV8bPNregCzCTZIGaih1Ukin7+mZyx?=
 =?us-ascii?Q?nqPzSdTigC9BuDzTwJtBk+5pdiOfdybxpO5LrmWd7muqxqHcKQ1VPzkIgDfZ?=
 =?us-ascii?Q?7o26/pTECUhh/IDTCvhjdR4iHfHbGG/2ItXdLusrMM8i0ROQ0q0d+k+6dyuS?=
 =?us-ascii?Q?IfSBPJFGyYB98pHMkkjfIIDRSeX54KLcdvA4+0S0jtwshVQndNYiIQfyQFei?=
 =?us-ascii?Q?wnl4pgIGB7TDjMiT/pzVAXANmn06C8PwTFx9wP2luN/DO4lXAJ88Mzx2XLpU?=
 =?us-ascii?Q?gXjGBArtI3HeuzzDmT33SNp41LDRXk2BY0KqZA/JS1o/N9cYEUGxFSA5EqPp?=
 =?us-ascii?Q?30teG7NJ5A=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2984a335-ee06-4f66-95ca-08df40a828fe
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 10:31:50.1150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IowmhIIVRx5Uh3zoRu/JMdAH2ARXCUNaFtM0cIh5OVAGB9GMENH9ji68CNWlEHhAlfAh04Q6Tyt3jx0DHX0B0Gl8jtqZodLtGVbgW90UIHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5595
X-purgate-ID: tlsNG-ef75cf/1794479514-35AC0AE4-F56048E3/0/0
X-purgate-type: clean
X-purgate-size: 1545
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 10:29, Jan Beulich wrote:
> On 12.11.2026 08:23, Stephen Cheng wrote:
>> The decoder sign-extends all 8-bit immediates (SrcImmByte). For INT
>> imm8 the immediate is the vector, which is unsigned. So INT $0x80 to
>> INT $0xff put a negative vector into the event (e.g. -128 for 0x80).
>>
>> hvm_inject_event() then fails its "vector == event->vector" assertion,
>> and a debug Xen panics. An HVM guest can trigger this with the forced
>> emulation prefix (hvm_fep).
>>
>> Cast the vector to uint8_t, as is already done for the port of IN/OUT
>> and the operand of AAM/AAD.
>
> I'm afraid this isn't sufficient: At least x86_insn_immediate() is also
> affected, and then also for the other insns you mention above plus quite
> a few more (in particular uniformly for 0F, 0F3A and XOP08). I think
> this needs sorting in x86_decode_onebyte() for all of the former (some
> of which I then need to mirror into the APX series for Map4), and in the
> switch() below setting ctxt->opcode and s->desc (where decode_*() are
> called) for the latter three.
>
> There'll then want to be a 2nd Fixes: tag for the commit which
> introduced x86_insn_immediate().

Thanks Jan, I see. I'll move the fix into the decoder and add the 2nd
Fixes: tag in v2.

Two questions:

1. Which other one-byte insns do you mean by "quite a few more"? I can
   see the shift/rotate counts (C0, C1). Are there others?

2. Should I keep the existing (uint8_t) casts at the IN/OUT and AAM/AAD
   use sites, or drop them?

Stephen

