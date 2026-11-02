Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96AA606A338
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 10:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=eMOvqXmD
Received: from list by lists.xenproject.org with outflank-mailman.1468054.1677097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNot7-0002JL-1V; Mon, 02 Nov 2026 10:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468054.1677097; Mon, 02 Nov 2026 10:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNot6-0002JE-U0; Mon, 02 Nov 2026 10:03:36 +0000
Received: by outflank-mailman (input) for mailman id 1468054;
 Mon, 02 Nov 2026 10:03:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xNot5-0002Hy-Gw
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 10:03:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNot4-006ioX-35
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 11:03:34 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae85fe2-2eae-0a2a0a5409dd-0a2a45089f7a-32
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 11:03:33 +0100
Received: from [52.101.52.13]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae85ff4-f659-0a2a45080019-3465340d81b9-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 11:03:33 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by CH3PR03MB148667.namprd03.prod.outlook.com
 (2603:10b6:610:346::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:03:31 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 10:03:31 +0000
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
 b=gB+zEsCQ8O83DpyePbpof57Zn7KeVF8uL9iB4+AeJvbhmWwb/toOb96iDl9BzJhA+ZUZ65n6GWYD78sKzw+hUuQT+qnnEKOlnQwV1GveWTOcYDICrBxT9NMe8SDWmTvJeCazs9NHaTBl5NpTCSSNAW6p8OjDxbu7zAmftA/wXyTmZmCFrCGkLPcK2it0DXWHreq5lOY8vCO5E8GZ9mDzov7hOVO15dOb0Z+ViOFHHqomCKAlFb4OnsVpoB1mKb5uULRux7ZlmjMFwWWbSvE3uu6ozRmX1bpzWpi/wJzb2E6W3H1tY6YkAAWx2p9VmU5rLpCD0gbhwj0R8C/4rbbGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEGoIsbcCbUg1W6H84Y0joGU6LGMSlo9SpAwU5tGiYQ=;
 b=fvEQ7kEUPmJ+Vk+H2OR2vuuAAe7OzvHeAHK/eUk9tebZfZP2YnOUhlvSPVbwtbv1XsFjGOS23rExH1pBOUpFOKVKDLras2z/ddg6Mc7bfplAu0CwHndWUxz4YnZBdQ9x11fDc2xYdv65cJIeWcP3U7nCD81qrz8Wi92y73hdwYP1gGsSTbStwU+n4yG2tY7+kzTTcv5Crv8BnUwHIijrkFaVFsjsAgJp55Xowv/npAAtwkX7bQ8UPODqa/SUEresqclSi/l9MQIkNJDc1sz7icolv5SzSEYibHnh2aQ6zCGzDgQLejTnBBtst1doinGlLSj9CvliLq413OP45JtMPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEGoIsbcCbUg1W6H84Y0joGU6LGMSlo9SpAwU5tGiYQ=;
 b=eMOvqXmDGKqGY+12fvhqv9qZ7Dl8iEmYd7O8Z1g1tgQo/dc+y3JqKrYysjUV/TX6nKH26VYZfi9eXKUgU9Jxkyu9EUQjAliW0RTyvTk+nNSPggIRniA/831dkcWOH7G+9NyIwEsELgqqndzX73+a901IVS0h3wq27vRt8MMPS20=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: roger@xenproject.org
Cc: andrew.cooper3@citrix.com,
	chunjie.zhu@citrix.com,
	jbeulich@suse.com,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/hvm: sync APs TSC with the BSP at creation only
Date: Mon,  2 Nov 2026 18:03:20 +0800
Message-Id: <20261102100320.187717-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <auhLMExBiCspLd49@Mac.lan>
References: <auhLMExBiCspLd49@Mac.lan>
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: JNAP275CA0054.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::20)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|CH3PR03MB148667:EE_
X-MS-Office365-Filtering-Correlation-Id: adafea26-9303-4af9-9d8a-08df38c88c8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|22082099003|18002099003|3023799007|56012099006|5023799004|11063799006|261021135927099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261009223027099003|261028144727099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	PaiWWXB13LP/zvENT/dMxBeHtbA2gGx1+hZQuOfJHOy/HqEi6fsmGIDfGHFGHzgyKnRfy1FcAVa1P0rpvrjL5Z0RMfCzXMi1Qn4wAXPugZ33krgcR4scsqtPh2WBZ0OHE6wub9bsTYNgA+XEF9ohkiFKZQDSi1LcvjroDG2GTxtSPV7QMNgnA9hTH+wGdxcxOn2YsbmaU95zGccweNNp/f7Lta7rHGNg75+whsXZssVAt+Y2SsC9QWytax/BCFxnw9kDiVrA1Q+pGbbBju6CJjnux+++rU/FDFw1d36PZ/xuK/N7wUyrZD4jiRiWzW0a38yw6QT90YhH3Cwn13lO5kNqldLnqjc6rKY/OK/Bi+SVVCV6u9UhnyQNWdxEnPKEs/r6F2/K0Ck9k0pOtYV5cIkbCRjf6QHwbBF70J+UAju+b8JzEcCIcuF/r9OnN6ccrjQIW7neCcbyd6b4GXsjO6enS/NkX5RQXosNFp8hzUqOqrY8rmC3w6F0kHlbGOME84hmi8CQwhN+CZ5xbirjUWDYg6+CIKEdJh+f0W1sSI76Zj11pNNiNFe84+HKXWWQjAIwpCgcwA+bDcvoVVdR/AqcaVUU4Jg39ClBGYEnSRWRVXo819x3JViYY5RPjR4dTWWXIeUKjShFb/1CBZ19+xwCjKzqSvLqcyJdCqtKTiw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(3023799007)(56012099006)(5023799004)(11063799006)(261021135927099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261009223027099003)(261028144727099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WUvD+Xu17X3In42ndiI33aw98000r2h1hsO/4EMc9eh2/Ob3J9XS9V+ZVPOl?=
 =?us-ascii?Q?A0LLhTT/1jE6EGnYKcIRSBVODkhtEBczGgRH9XYKpA/rnmjrRY4uM67MzqfW?=
 =?us-ascii?Q?I7jJvzuCRrH1SKLCtKJt/POh/POPyg2m6iuG2oyFp9GQGrVeXHRaEmRxVhTT?=
 =?us-ascii?Q?5NB3QoarTueR1nDdzh2yngjnNUmfcIw++CuUxzvJjxV0pxd33eOrbain5m8R?=
 =?us-ascii?Q?ll1ROmS3LVDIRHSl8SdIoLIR0GURndoW/+9gOpJ1jxlbnYZH/qIAv7/F2RIO?=
 =?us-ascii?Q?854PRXx4Jg/ERmldiV6Pt3vahsBr6+YVDOJzqjebkJT9FYfvPAMU9RT40OAq?=
 =?us-ascii?Q?Q5WWI5VVbxjDLUZ/ZgyAB44Uvk7RTch/hKEdlcyeozAgmGNyIbaDM+qVoHuB?=
 =?us-ascii?Q?+eHlcxyAQ7CtJ21I4Pqv75n6Mj7g0I0gkTPcIsS8veoFODcgJr4XTefgEXid?=
 =?us-ascii?Q?HNTna14hLSw5i8N9EmfUJIS1aGtEfZanIzTAuxZj8OB9pS9CYkmDnjDfTquE?=
 =?us-ascii?Q?UIaQwbFmaSD1cZvDJLxt1iIhQXNKQonP/dTnOKycaX0QprVB1ejTXYv71FzO?=
 =?us-ascii?Q?kMn9Nbkv0Vv01UvLpdajpZrPwy68rL9kQMrq2l3R7qjsYDA5f3oSxNvEWS0f?=
 =?us-ascii?Q?1iHYktNO8epuKU/+K6fXo4hHtibfBFcYGpy+cgizMSU6TRtnwk9Hi6n+DPFy?=
 =?us-ascii?Q?MVWVyYtLvqJFmzsCiTrrDI70iKWbFKuFgrAQ0Icttnkue96E5FEg2rjumc/H?=
 =?us-ascii?Q?8aUJBbl8vcxnerzlwe7c6ESRWzs9xkjJ438TiLAwoEjnRybh0Wb9QvyJxgzs?=
 =?us-ascii?Q?nRSZGMJ4C2H14enjJyBv+102rioEI10p9ZaiH9uP3Jqssc0B1+YtM1NCqjmB?=
 =?us-ascii?Q?jUwrKxDJyYkS9V1djozo13lvbJlM+0uixJjgljWgtSkK+oSjrZrEM2pKreXz?=
 =?us-ascii?Q?KsuD9vsb+FumXIwuYG4FRgsdTABP77DhVNY7jBkSFXeQbISjVDc6JJg2PV78?=
 =?us-ascii?Q?7Q1jsuSAt0dSY46OcFVV6ntGc9r4xSZZk1gnL5uuovPxxSAYUNBzeEZC8K8g?=
 =?us-ascii?Q?gps0o1YodLM/0a/NTe7iaU/ldsH4hLDLXbStZNcwZekzPtZXoUCyoIDF/Zpq?=
 =?us-ascii?Q?aq+ZrMPhQo2KTL52gw+Tj9nJHpU744lmK/BYeIkCZf94oN34yl8pHvXUylV9?=
 =?us-ascii?Q?aFeCwO1yj2BcH0eHtsa7chzmJisuw0pLi903I3+lJDnic1BOZ07nuhkH456n?=
 =?us-ascii?Q?q1LyGRQ1E6mSJ3NWSSKIGikLseO7/HX1wCINzSEov8o/EoC/58xTCrNgdQKw?=
 =?us-ascii?Q?sZTsCbrnvglNaAtNd+5OxXFvjwOxkXdqboD/NNQZM5GR4NYTJ/sbAueqzy5/?=
 =?us-ascii?Q?8XCTj2YYEAZds36/O4DBuS8VFPN3QeoaAgnuKrMzvlb8WSm5oQFub3z+3tHr?=
 =?us-ascii?Q?oVUQnzTf1Y6lTWWo/tfLxfZyavlCzGIBlgUNfaMjHbtmr2QBWcj+Wcn+PkJ5?=
 =?us-ascii?Q?RbqNrFNGKmSs6vxGphYd6mdeRc8eCcyqNDB0hvrLVh5BzwC5sbv44LleE8bK?=
 =?us-ascii?Q?wZeIzX9hjLFquwFZP8j4gYy4E5CAjWYV9iEqCulR3qXj3AV0YzEE0edLetBo?=
 =?us-ascii?Q?DQ1S/p+PyIgXY4LXQIFqPGF41eV04//ovF6F2ORELCebH5JDTUdtW9q/iaPl?=
 =?us-ascii?Q?xc0RLr0dADTL2UF1D7uDLXkLsNv+ER0nj/GSHHCvtvWpELrdmTjuL/Usw/tJ?=
 =?us-ascii?Q?m1GJ8Q7EeA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adafea26-9303-4af9-9d8a-08df38c88c8b
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 10:03:31.3543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hyw5uVak/VAsHs3xSPKZWrCg2d8z9ukq+Mz0nhKBZvd+OLIVQpEZ7831TJkNr5nAWbrmI17TLm1UEZ4cLrxXeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB148667
X-purgate-ID: tlsNG-c1860d/1793613813-CCB7187B-06FDFFAF/0/0
X-purgate-type: clean
X-purgate-size: 7574
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 09:34:56 AM, Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org> wrote:

> On Mon, Nov 02, 2026 at 03:40:42PM +0800, chunjie.zhu@citrix.com wrote:
> > On Fri, Oct 30, 2026 at 02:24:19 PM, Roger Pau Monne <roger@xenproject.org> wrote:
> > 
> > > The current logic syncs the APs' TSC with the BSP both at reset and when
> > > setting the vCPU state.  This doesn't match hardware behavior, where APs
> > > are only in sync at platform start.
> > 
> > > Move the TSC sync so it's done in hvm_vcpu_initialise(), that's called a
> > > single time at vCPU creation.  This matches the hardware behavior.
> > > INIT-SIPI and VCPUOP_initialise no longer re-sync a vCPU's TSC to vCPU 0's.
> > >
> > > On migration the TSC offset for offline vCPUs is not transferred
> > > (hvm_save_cpu_ctxt() skips offline vCPUs).  To avoid an unexpected skew
> > > synchronize offline vCPUs with the first online vCPU, taking into account
> > > the TSC_ADJUST value.
> > >
> > > The clearing of TSC_ADJUST is also made consistent with hardware behavior:
> > > clear it on S3 resume, but not across an INIT-SIPI or VCPUOP_initialise.
> > > Additionally, on S3 resume start all vCPUs from a shared TSC reading, so
> > > they are in sync.
> > >
> > > Fixes: c31f8336e64e ("[HVM] Initialise AP TSC to same as BP TSC.")
> > 
> > This looks wrong.  c31f8336e64e only added the sync to hvm_bringup_ap(),
> > which no longer exists.  The code removed here comes from bcba667e12e3
> > (INIT-SIPI) and 192df6f9122d (VCPUOP_initialise).
>
> TBH it's a long tail of code movement.  The code in hvm_bringup_ap()
> was latter moved into hvm_vcpu_initialise(), hence why that commit is
> used as the Fixes tag.  Note that previous to c31f8336e64e the TSC
> sync was not applied, as the chunk was protected with #if 0.
>

Thanks for the explanation, that makes sense.

>
> > > Fixes: 6e0336351ed9 ("x86: Implement TSC adjust feature for HVM guest")
> > > Signed-off-by: Roger Pau Monné <roger@xenproject.org>
> > > ---
> > >  xen/arch/x86/hvm/domain.c |  5 -----
> > >  xen/arch/x86/hvm/hvm.c    | 19 +++++++++++--------
> > >  xen/arch/x86/hvm/save.c   | 34 ++++++++++++++++++++++++++++++++--
> > >  xen/arch/x86/time.c       |  5 ++---
> > >  4 files changed, 45 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
> > > index 978d8b222256..71f49ec7ce9f 100644
> > > --- a/xen/arch/x86/hvm/domain.c
> > > +++ b/xen/arch/x86/hvm/domain.c
> > > @@ -312,11 +312,6 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
> > >      hvm_set_segment_register(v, x86_seg_es, &es);
> > >      hvm_set_segment_register(v, x86_seg_tss, &tr);
> > >
> > > -    /* Sync AP's TSC with BSP's. */
> > > -    v->arch.hvm.cache_tsc_offset =
> > > -        d->vcpu[0]->arch.hvm.cache_tsc_offset;
> > > -    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
> > > -
> > >      paging_update_paging_modes(v);
> > >
> > >      hvmemul_cancel(v);
> > > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > > index ef9c7cd05777..81e90cc8fc8e 100644
> > > --- a/xen/arch/x86/hvm/hvm.c
> > > +++ b/xen/arch/x86/hvm/hvm.c
> > > @@ -1667,6 +1667,12 @@ int hvm_vcpu_initialise(struct vcpu *v)
> > >          /* Init guest TSC to start from zero. */
> > >          hvm_set_guest_tsc(v, 0);
> > >      }
> > > +    else
> > > +    {
> > > +        /* Start in step with vCPU 0, as all CPUs do at power-on. */
> > > +        v->arch.hvm.cache_tsc_offset = d->vcpu[0]->arch.hvm.cache_tsc_offset;
> > > +        hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
> > > +    }
> > >
> > >      return 0;
> > >
> > > @@ -4021,13 +4027,6 @@ void hvm_vcpu_reset_state(struct vcpu *v, uint16_t cs, uint16_t ip)
> > >      hvm_set_segment_register(v, x86_seg_gdt, &reg);
> > >      hvm_set_segment_register(v, x86_seg_idt, &reg);
> > >
> > > -    /* Sync AP's TSC with BSP's. */
> > > -    v->arch.hvm.cache_tsc_offset =
> > > -        v->domain->vcpu[0]->arch.hvm.cache_tsc_offset;
> > > -    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
> > > -
> > > -    v->arch.hvm.msr_tsc_adjust = 0;
> > > -
> > >      paging_update_paging_modes(v);
> > >
> > >      v->arch.flags |= TF_kernel_mode;
> > > @@ -4079,9 +4078,13 @@ static void hvm_s3_resume(struct domain *d)
> > >      if ( test_and_clear_bool(d->arch.hvm.is_s3_suspended) )
> > >      {
> > >          struct vcpu *v;
> > > +        uint64_t at_tsc = rdtsc();
> > >
> > >          for_each_vcpu( d, v )
> > > -            hvm_set_guest_tsc(v, 0);
> > > +        {
> > > +            v->arch.hvm.msr_tsc_adjust = 0;
> > > +            hvm_set_guest_tsc_fixed(v, 0, at_tsc);
> > > +        }
> > >          domain_unpause(d);
> > >      }
> > >  }
> > > diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
> > > index 8ab64057064e..65ebfd384d69 100644
> > > --- a/xen/arch/x86/hvm/save.c
> > > +++ b/xen/arch/x86/hvm/save.c
> > > @@ -289,6 +289,7 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
> > >  {
> > >      const struct hvm_save_header *hdr;
> > >      struct hvm_save_descriptor *desc;
> > > +    struct vcpu *v;
> > >      int rc;
> > >
> > >      if ( d->is_dying )
> > > @@ -302,8 +303,6 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
> > >      rc = arch_hvm_check(d, hdr);
> > >      if ( real )
> > >      {
> > > -        struct vcpu *v;
> > > -
> > >          ASSERT(!rc);
> > >
> > >          /*
> > > @@ -341,6 +340,37 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
> > >              /* Reset cursor for hvm_load(, true, ). */
> > >              if ( !real )
> > >                  h->cur = 0;
> > > +            else
> > > +            {
> > > +                const struct vcpu *base = NULL;
> > > +
> > > +                /*
> > > +                 * Offline vCPUs have no CPU record.  Adjust the TSC offset
> > > +                 * based on the first online vCPU, taking into account
> > > +                 * TSC_ADJUST which is saved regardless of whether the vCPU is
> > > +                 * offline.
> > > +                 */
> > > +                for_each_vcpu(d, v)
> > > +                    if ( !test_bit(_VPF_down, &v->pause_flags) )
> > > +                    {
> > > +                        base = v;
> > > +                        break;
> > > +                    }
> > > +
> > > +                if ( !base )
> > > +                    return 0;
> > 
> > This silently skips the offline vCPUs.  If that ever causes a problem it
> > will be hard to diagnose, so please add a comment or a log message.
>
> Is it a realistic situation to have a stream with all vCPUs offline?
> I was about to add an ASSERT_UNREACHABLE() here, but that's not a wise
> move since the restore stream is external, and could be crafted in
> such a way.  Also, if there's no online vCPUs, does it matter to sync
> the vCPUs' TSC?
>
> Thanks, Roger.
>

Yes, agree. The restore stream might be used by external to exploit whole host.

The code block sits in the END-marker branch, all load handlers have already run, so
the restore can continue as usual. With no online vCPU there is no reference TSC to
sync against, and nothing is running which can observe the skew.

The code is good. I personally prefer adding comments to explain it, but I’m fine
either way on whether we add comments.

