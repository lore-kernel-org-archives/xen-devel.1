Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E7EC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 07:15:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372163.1619559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woc23-0001QC-1E; Tue, 28 Jul 2026 07:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372163.1619559; Tue, 28 Jul 2026 07:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woc22-0001Q5-UO; Tue, 28 Jul 2026 07:15:18 +0000
Received: by outflank-mailman (input) for mailman id 1372163;
 Tue, 28 Jul 2026 07:15:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1woc20-0001Pz-Ta
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 07:15:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woc1z-003gVC-LA
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 09:15:15 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6a685700-2eae-0a2a0a5409dd-0a2a4508b3aa-6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 09:15:15 +0200
Received: from [52.101.57.8]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6a685702-f659-0a2a45080019-34653908cd5d-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 09:15:15 +0200
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by SJ0PR03MB5727.namprd03.prod.outlook.com (2603:10b6:a03:2af::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 07:15:12 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 07:15:12 +0000
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
 b=AgkuIDnF7DANLWTORXLhEZS2PyAD/zxr8ch8Oh/A4gV6q93UR17WnvNsL3iPS3YWjLqtQ0w27K4Qu1P+C30cmL/Zg2ot7Sbpa1rx4awLd9zGQGkBbl/XIH9FK/iAnkWjr2unAhQwXa1oRlLOPytLUfK2CQJrsgfBEfYJLOTpo3IA+hVLP+ed4QoitmP+7qig4MSbkVEB3/RPrUTMj14bMnSQ0wY7pRz8lQrMSbFl7y6CoMv8S2GDw/1O6gNPmeDmEYldXslskax4HLUIbhvvF1SnQ/k5LHWKfDceOmer7COG02HPwpLSOBNGSzd6b3WpXO12qGVUJOOnmNgvF/QcGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60Uq/mRUzXsfzG2pkARYh3m3TivgWpO84hW5IQSCk9Q=;
 b=wJ0Tf9yuCE3gHulNT7Oqq4LffDZAt+b+QRymh1TraBLTb/mkwl/Fu/GfRmepvVYKbXI3zc3/yEFuLt8+7ZpZTn4xM9NFgw12UBYloAr5w/Qx4uBg6OVyo0zJXj3voF1BacQq1C2qoVsWd+O6uo2DNW2N+U2mg1LLtwsX+FFav443Ah2a0zpVpFLCdy38VaXv3XJ4PGLbzSHU0nQKRJ8ql16GK5aQfh7cqS3apcIvYZctaglEpfM3mM4zUB6pnMrkhZLbfBuCefRYrb950exU1DnfymRN8LN5McFjNWq/hBD3o8mNFHuShttWCkUmsYQ6FwIf2U8D+B6Iv1NEHULfpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60Uq/mRUzXsfzG2pkARYh3m3TivgWpO84hW5IQSCk9Q=;
 b=Uzc4TbXQ0j7mPFX3anGt7Anhb4DGgYAWs4ChxqwWzyk48LSNp9n4ElLSlKL5+zhSxOS+2gsHr+Tk6m7L6QlIyx7UT1HqrNfnZvvIM80Scl/F3S0j39EZtOVaC+QsYLcFPR7WWEdLad1wCLwSdKlOQKAS/Ni4Mtglhi2Xzi6CgdM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: ross.lagerwall@citrix.com
Cc: teddy.astie@vates.tech,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger@xenproject.org,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/svm: require VMSAVEvirt for nested virt
Date: Tue, 28 Jul 2026 15:14:46 +0800
Message-ID: <20260728071446.263579-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <CH8PR03MB8274B8F533EF3D15C94696F8F0CC2@CH8PR03MB8274.namprd03.prod.outlook.com>
References: <CH8PR03MB8274B8F533EF3D15C94696F8F0CC2@CH8PR03MB8274.namprd03.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:990:5c::18) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|SJ0PR03MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c8533f-a480-4837-dd8e-08deec77f701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|56012099006|11063799006|10067099003|6133799003|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info:
	CVJDnNGv3dSKVlUcLmihTVOTiv3EH59+jJPzlbjLHFK/vdqYgHDrizVamaSldqy91wQ6idvvOeaTLS7E+43Zuv5gkyYhGHvLFlhX1TiXziOQsTx0STsxf/HtBtkimg8bnxAe8SNmW2IfC1wd1jj6LRE8o5uP5nhDIw0k3lkz7ge2ybglB83xGe+ZYwjNf9FH3hpZ4+MwvmJPV4qX9LSKYDjlOqloUFT23aeZi3jR+Iaa/qKubBMi2iy+Kiw6u9srypWc1H8g+ZdNkD9EFrln86sjLmtEsXIxAT5EyS+2Hi3dK0B5CoN6s9VYF9k/uqXUns6Vrr7ou44A15wweii9kFgvmK6UYgomvAx7T71OL60mJNDcvt+Ea3XgfjeggXE74t/BBAmMyTlCBV94kHAE37nptyogVeEkTUQnSyZDBczbQyqkyjIIbbqQx3ltw00qqLm7JkUYn+sC//bAyN69oVlscOx00SOdxAmkN+2kjSicN1ZyDuXDrosbAisjFoOjrflgtoRF8/67X70eVaHfnWTKYU6tqExV6HSpAnXwiTZ7rXRnogXvluRkP/pSD/K6Kkazx0PQ91O8K1y2T9or7N6XjgeumGMmbE8SoPzrQEFI2Ti+DlD7ZTWOrqvrHGp6n3tu5AmL8EJ/ajT3Wg5YHJuyNqCppJH+eF8pMbHZ14A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v/ma+3+8+cfXW4ipjqfIgxIvyBiHI/0MwkGYkJVcqjVGrA/y/GxNgMRp288e?=
 =?us-ascii?Q?k3nMqt0DfKz9pOsUxblTVbbNs2jsFtOY80spMkshY0y16ky2v9JtBsMToFuY?=
 =?us-ascii?Q?vpezrZH9g/Fiq4TPXav0cR9q212a+9n7NXV74yMvh5icCBQw/0F8GKI0h0pa?=
 =?us-ascii?Q?FAbig102K08eE0ExdaRzI+OnRzIyYanmZ0scUtztGz+8I/dntBd9wr0Niirp?=
 =?us-ascii?Q?ThZtSurB9MjGC0ARcNJIkbsPsvliVpexubAEEC4abNaARdsfqvQneYpwLLG4?=
 =?us-ascii?Q?FmmI+eDu9u034rGQokuLG2lNsu5YoZA25D0YIZzQ82PLiuuquMOUXHh9SYSu?=
 =?us-ascii?Q?Mgl8dnVvAst+2SPOyg+mtcC8U8uZWt/p7HS+AAQXfApYWr626Se6WflNdXkc?=
 =?us-ascii?Q?p3pAHPEFQxcQOCst4NkqgmZiigftxX4YKlEEpx4NUo/MAOR4TEudeELHc/oy?=
 =?us-ascii?Q?04amXD4jCG7I/GRT3ViEscmeFxC+H55VVysOJYs4VxXZMNdBeP2u/aAhuu9d?=
 =?us-ascii?Q?IaWGSaKY+2xr21HxUGGZxV13cyz7tnmvPvmS1eF/zUY9h7rgw34SLxzDW0zd?=
 =?us-ascii?Q?hlPDJNH4Py6kvUml1NI9W4G7jGi+yqoeRyl320qh3ppbi/d/Vb422MA8S0eX?=
 =?us-ascii?Q?DSOg2diG8foL2GzmGsjCZEZMEIdEsPT8WX8R71t4thHgE8JLvGOFW2IVxoMI?=
 =?us-ascii?Q?z9cyLVjb4YkgtNCCMjSi9EE3THE52kqho1zWbM6rSvgEZ4DVPNfvMB3wpm/f?=
 =?us-ascii?Q?I5EoByGe/tIBvTOXZ2A1UQ+Pgj01KMllF6Fg7OzhsBo4wOj0B4nU8OSKanFF?=
 =?us-ascii?Q?C8ME2Q4gRLsS5mQmBuOaLfFC6cvtuPwIzqKdokzgJbulDvK/Ov7cBFeibC8t?=
 =?us-ascii?Q?5T0j9hpRpn6mGJVIrltGKGTDY8U34RFeudutuCucAPlrmTiDFJCKkgTg3pEq?=
 =?us-ascii?Q?GmMgD1oODcGX7jyHZU9m0ckRD7jg8WmQN59G/HuHXib8WgxlbVrt8CyDQaBb?=
 =?us-ascii?Q?iRZrx6tVbCLaJnVYXm7GJ4o7A01+TQmCYEtw2vBDdQiDMFEcAI5mLWf1U+DC?=
 =?us-ascii?Q?wXl1q8u9LpCuxILNRkuZSEifo1iqeQZRIzc8Ag85UWXWN/y8ek52+7lYj5uN?=
 =?us-ascii?Q?UIf1+TSRfHUXp6Y5sALIDC8rNBHaOLdfbfyl8xZ7pdiBVk7wh1DgR1fGEBI+?=
 =?us-ascii?Q?d+2ZeMn+bGNRuAiHe+jYeQf7ehpy+07+jyYPzTiSJCTbIxbSv+KXyVrX7z+Y?=
 =?us-ascii?Q?W461sO2plhH48dxZjeEuvJ4+F9My9ItU3fqYSi4WTRuoOKMyDjFi7J69AvDh?=
 =?us-ascii?Q?BP20Vmiwz+ws/YhXQw4tzvYrpRSRA/H/rh6+Wsfw14j8cNRhzlD45eit4k40?=
 =?us-ascii?Q?P5GNHzoQLuJtJj73vUXa4JuzlN9h//JV5/c0uA0w1zDt31iZRasmPAem+kHb?=
 =?us-ascii?Q?sTXOV9B8R1ljgds9jkAhzPhDbBWA+lSwLlIVAbt3SyVdMK3on2TjLrIQ+CL3?=
 =?us-ascii?Q?vxRJcALKETuPOI2SZhPCn6Jis+t4Fh4Q7ZGcbG6ZTxaNMiUEUb2ZNOxB8/sa?=
 =?us-ascii?Q?yyt5uT90XHk+/N4156Uo70dE9ruGGs25sIK4AZGkRDKS1hrq3H6F+KPXUopr?=
 =?us-ascii?Q?V4WVdh1PYh3vnuYeHH+V1qWxX3jTNcbCAC/+9p8ymroBmf3rauQw+kru5inN?=
 =?us-ascii?Q?NgXWsYsaxg4skXmmz37q4vUFKJx2Vm+gyK8XV9Vptn9xMGDUWnZddAbyvMXD?=
 =?us-ascii?Q?fnNyADI5zg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c8533f-a480-4837-dd8e-08deec77f701
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:15:12.3451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKrq/59A48s2bTF3sMOkdFBOxGsHkWOQQ/x9cHPPipPCVzLIdA5qKjj2OQbCuLwkpe+AXqB9QgpQAP6HMlzQkyylGPexj1d9AwHQyJXVaGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5727
X-purgate-ID: tlsNG-c1860d/1785222915-DFED287B-7768F599/0/0
X-purgate-type: clean
X-purgate-size: 2719

On 27/07/2026 10:50, Ross Lagerwall wrote:
> > @@ -837,7 +837,8 @@ static void __init calculate_hvm_max_policy(void)
> > -                               (1u << SVM_FEATURE_DECODEASSISTS));
> > +                               (1u << SVM_FEATURE_DECODEASSISTS) |
> > +                               (1u << SVM_FEATURE_VLOADSAVE));
>
> Exposing this feature to L1 is separate from requiring it in L0 and IMO should
> be a separate commit. If it's exposed to L1, there is a lot more to think
> about. E.g. whether L2 should follow L1's setting or L0's for vloadsave_enable
> and if it is not enabled what happens if L1 doesn't intercept VMLOAD/VMSAVE.

Agreed.  I'll drop the cpu-policy.c hunk from this patch and do the L1
side as a follow-up.

Worth noting that dropping it only removes the CPUID advertisement, not
the functionality: vmcb02 picks up vloadsave_enable from the virt_ext
merge in nsvm_vmcb_prepare4vmrun() regardless of what we advertise,
which is your third point below.

> Also note we discovered previously that contrary to what the APM documents:
>
> If the VMSAVE/VMLOAD intercept bits are clear, and virtual
> VMLOAD/VMSAVE is not enabled, then a VMSAVE instruction executed in
> guest mode executes as if it were in non-root mode, and operates on host
> physical addresses.

Thanks, I hadn't come across that.  It makes "vloadsave_enable clear
implies the intercepts are set" a hard requirement rather than a
tidiness thing, so I'll treat it as an invariant in the follow-up.

> I think there is also a separate bug that what Xen advertises doesn't
> necessarily control what the guest can use. E.g. previously we didn't advertise
> SVM_FEATURE_VLOADSAVE but Xen would always merge in tthe virt_ext settings from
> VMCB(L1-L2).

Agreed, and it's the same virt_ext merge.  I'll fix it as part of the
follow-up.

> > +        /*
> > +         * VMSAVEvirt is a hard requirement for nested virt (see
> > +         * start_nested_svm()), so it is guaranteed present here.
> > +         */
> > +        ASSERT(cpu_has_svm_vloadsave);
>
> Maybe just personal taste but I think this assert is unnecessary.
> cpu_has_svm_vloadsave is constant since boot and also checked at boot so
> further checks are unnecessary.

I'll drop it.

> >      case VMEXIT_VMLOAD:
> > -        svm_vmexit_do_vmload(vmcb, regs, v, regs->rax);
> > -        break;
> >      case VMEXIT_VMSAVE:
> > -        svm_vmexit_do_vmsave(vmcb, regs, v, regs->rax);
> > +        svm_vmexit_do_vmload_vmsave(v);
> >          break;
>
> I think it would be simpler to just move these case statements up to the
> VMEXIT_RDPRU section.

Will do.

Thanks for the review.

Stephen

