Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DD3606A323
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 07:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=DOOZHloJ
Received: from list by lists.xenproject.org with outflank-mailman.1504614.1699806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWqo5-0004aJ-Q0; Fri, 27 Nov 2026 07:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504614.1699806; Fri, 27 Nov 2026 07:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWqo5-0004aA-My; Fri, 27 Nov 2026 07:55:45 +0000
Received: by outflank-mailman (input) for mailman id 1504614;
 Fri, 27 Nov 2026 07:55:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xWqo3-0004a4-Th
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 07:55:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWqo3-001Zmv-6G
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 08:55:43 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6b09376f-8faa-0a2a0a5109dd-0a2a4502becc-28
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 08:55:43 +0100
Received: from [52.101.48.26]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6b09377d-4900-0a2a45020019-3465301aff3c-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 08:55:42 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by PH4PPFAFBA01248.namprd03.prod.outlook.com
 (2603:10b6:518:1::612) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 07:55:39 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%6]) with mapi id 15.21.0639.011; Fri, 27 Nov 2026
 07:55:38 +0000
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
 b=toTd31GqhLwD9aJ4RQi9mOpdkogQMqvEL56dtCjOVQ0D14NKwsTM7v1W5OwGjejvxyo2+bfGKRjbqGlYor3de0ts4t+C4vOBHPH1r7Vjdzb6C9XYH8C7vWCABhMdb5+AEMIiJvhgqY3MPNHlVSZ8FMLeYbkypncFIeju3/pVIf3Hc1pKNEEUwbXEagH8/TFCrdgqtgDlbYERe2EwhVWI36H2pBSEDp/mcYH6/CGiY7vZScAWMEMKUH+8AEnvexpiUnZWXdXWBu2NcYF/JNNlwNBhlJw/McOV2Y7g2u/bfEiXMpO9VMbUr4SBxCt3AdNHRNhzo/78PtLq2jfsHAwgUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZal+WCyJrqzodCNZ8GmvTXL+mw+KhUxeLf/oVzle2g=;
 b=MIpMtKRFASWXgKNs9/zwYezwNehUWS5kXBre2mJjeVLatFIH85wyNES4CFLG8dCuCxFU2P4Wtchuno5X+//dwPI6srM46EuHBzN5Fv57sNQspq7Q4ky4hJfF6CVUTjKnZqTbUnAiaj8pRMWgdqrklUZJZvqUQiHTF4dlnz0AuDKZwG8Pm75/Uj/1EUUoNRG9GjFqoP90UrBYchauSgCODxw6usz+5ERLlm+WzHaCvYJt8b2qckC3nYemxJxDSlwi6eWjU3H7Acy3NUm4bS/UmNR5ewpdSBXbjRDZax4Wf9cJYHKj8s6FKtshYHcvHZhxXXEjglwkjhRfUBG6iBza3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZal+WCyJrqzodCNZ8GmvTXL+mw+KhUxeLf/oVzle2g=;
 b=DOOZHloJmY9jKQLh8fiLQMw1+7DWBPDHtnoGdMCyobCHZVmmy+DyEDtBJs0gtkDAqFThGLTu9BK2HBfR+QUqh+ZdmqW15a+JxEEfjtqrBzjeAognGVmlMQqKTfq9QYoN3xUpxvl/nK7IWC35O3B4XLoU4Hzr3Ijr6yH/fPQVR6s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: stephen.cheng@citrix.com
Cc: andrew.cooper3@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] x86/nestedhvm: Don't treat an emulated INT $n as an exception
Date: Fri, 27 Nov 2026 15:55:24 +0800
Message-Id: <20261127075524.1138427-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120090013.271926-3-stephen.cheng@citrix.com>
References: <20261120090013.271926-3-stephen.cheng@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0073.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:c9::17)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|PH4PPFAFBA01248:EE_
X-MS-Office365-Filtering-Correlation-Id: 6383a04c-83ee-4162-a5e6-08df4c5bd38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|11063799006|10067099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	XH61fHX4sFMLMuw0t9OzSbxeDTFfU25c0fnPuVpj3/vwhRcqgdBb6cB7EZaFFctsp4Y/2VdngMq8u3XoLcMAhNXJVMcPJVt0SN4y2YQQwGOlYK12gLYt9P9HQs6T42/N9IjSBq0s0dl6IsSJyHMc2jMVWy9o6f+h5TDKTL8saQY2+pkfOuA7yy9A9GX4wC0bdT9wbSl0p4wl04MZYYDag7SZn1bD0+6l/E/xiDf+GSmDwJfxk4UK3JtTV5qgx+3n43nKDOrERapa49DOFP1HKrC13tOWS4+NAPS9YaeQ0Hh06o97uUMs7AQAxsNPJ+1kqh+Hb1K97h23ut6z8EfobubpMRp7lU5ToZwb/3xf1S/AKRKhN77uR33DyLnbW/dOxFQ+SnCARLNBKLn4vwVh5UD+TdhLoPo+a2f4lM+rtgWYRK+baLLxjXzOh2YsW8ursn8SHr7nef4KHdQRVmw3+wG+TU/6pKD1EG9x0AYNpAngD+Ve3xu4jw0KiYq3bhYhIBB6etzPKWnpUYmaFaQuFE23J39Ds9H5JhkCsf2jBrZ06IOHvMeJShTjhpfkV6t6FmiqVWUDy70vQjcy7cnYmLS08hL86bBXoS9rnGsWgl84qaEi9b4DPrHdAQVQrFIFKxpuAIveVqLBp1aEVKrkGRMqsWshGk70ZXD/4WYRyEE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(10067099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xkwJJonvM7hUCIMPb/nCz3gwFCmi0K461dRmpiZWoIczBLG7jqP56jLllXTd?=
 =?us-ascii?Q?qy/tJES0HHkuVniPokU6Rm9ti7yN8iiX1ur9wsrXA8eZ0LILQXSsCNiZfYZ9?=
 =?us-ascii?Q?UKnV1xMNEkvgYmrsNyg1CSswsGuSMN+y5OepSkddZNX5pFaYnfelbaI8MGs+?=
 =?us-ascii?Q?LOxMFU6Lal54IPqZS1XniGfj+T0Jp3K89LosiLbJe3VCgThjDAhodUQdHaXs?=
 =?us-ascii?Q?JxDBj994igpukw2PUSVJ71A3LmGA7OtFsB+t79ytVJsrTMV5hsJHEZXe3rdc?=
 =?us-ascii?Q?CCFIHgydHqYT5+xOmgZYUW9JQ6exBCWbp/qpaJ6DTv7NTIywqXGLDBzVfq9L?=
 =?us-ascii?Q?PX733ZB7ZGXlX8vVFQ+fxAD23spBB6b7FdkvBtsZBf0+8CCZOe2+HjNNjQrD?=
 =?us-ascii?Q?V/YKERUQ4U0EPapzqXAXM54A0sAdOqUfZ+sGTd5/UHsP0NR3oxlM1n1cAydf?=
 =?us-ascii?Q?9fEAyYjR8fjYTRwGnpO93yUhRDAiAwzZsRH5BFYnrAEbWf6YRNC/RVcRIe2T?=
 =?us-ascii?Q?6esalpZT5vWOV0oK/o5odXAR7qGDZYULr/apJMg7cR5prusdqY4gv7IUxzLo?=
 =?us-ascii?Q?yCXcTTa4daqWxlB/UWke1Kk1azyF5Je3lP1Bpf3HsMovGQnTfkKmGOEnpe/c?=
 =?us-ascii?Q?7SkwtzIABmf2EXBno+DSG/9h+eOvw3dnQRt08SZtQgoD1m1RWY0e6GvuLwAM?=
 =?us-ascii?Q?vPfpBPovKOiJDdiE6lTwKuxiUuYfyNd17Z0BVRYVIK8uT/o5XejnBEzrP5Nz?=
 =?us-ascii?Q?i3OOl4ReZ6xonySErl5VuSSeZAYCxtQCALHa+62MM+QXzLnc8SxmoCQ6qQ+J?=
 =?us-ascii?Q?43QKxswT3WYarPUa1nD1z77QI2q15U2N9iKjat7xJjgATPvMBEpU4CPI2cyl?=
 =?us-ascii?Q?CLkIwLtLNKTkXQGsEJnDw1ijmZDTNMGrjn5Uju0wd8H/bIO6T+pMU2bRzs1r?=
 =?us-ascii?Q?6QbEje9+nzIYI3mCLQ+NPU07/A0AHZ8B7Ekm54aIDni1+p//ubKbRdioziW2?=
 =?us-ascii?Q?PVmDtcsvqwXFCCGa0YtzvtNEP6FInkLwWHClTMnBRf2KyJP61DkWVtY449WW?=
 =?us-ascii?Q?FUgNw37AtXO8pQbWFeMdEoJWWTY1vXqj+ksENxbS96AU2rfnKkAPifPbCvO5?=
 =?us-ascii?Q?5IBjw/UCaelEz6HoJTwmCU1NtNt9XmnQZWR4OsxbXRpoKIvoF3PXYg0xYwQD?=
 =?us-ascii?Q?XnLi7dJyw1yMvFnjGeFI0O2tTbkMDEqiFAqUP24qSZsXUXxTFTsiXad8J9lg?=
 =?us-ascii?Q?NtNO5jBVn5GOuq+/uRdJu8E/ZvOfNCmoxQ5PnzYCUB1H+JmMm0uC8t3beylJ?=
 =?us-ascii?Q?CM4vMLCJclxARxjeMq4VIiJQhgkGLG8pIlunxwqe2JnZ4Jxw3OW88zQHGc8G?=
 =?us-ascii?Q?z8TicOXlUbaJ3nByrVRiXzCv7AGlwYol/Agd/PzpIbi66BDwaGf5vC9Cc6SN?=
 =?us-ascii?Q?tKMbEQWbRaq0EGip/lhDSSydhZ2pcNZtoQvFiuGweVm2VG4SPdWWjGJAY7r5?=
 =?us-ascii?Q?N6PaeDPsilceetC+DyC/qQo3+ab5y0sfTppOwL4euBfPCF/CRYnAZZEolV1n?=
 =?us-ascii?Q?4yiB4Df28Iu2Xq+ZsVXC665xgatQzAg7tyZgOZzbO70ocPJh0M8h+tPhLmUi?=
 =?us-ascii?Q?IMD9hP6ETv0Apn7+K1qnGxO+QPb91omZCgncaGueJNnMxYRdtBafyQ7uJCO5?=
 =?us-ascii?Q?5BXsMt/zPTaw89Pfti9ZPOLB/TroXJpfpLl3nQiNsFoTGGny9IIEcGIyl2rB?=
 =?us-ascii?Q?fW3YzakkiA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6383a04c-83ee-4162-a5e6-08df4c5bd38a
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 07:55:38.8462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDSapybo9AIwTGRxqUo00mGo/sOlKq7wqrEVXH3pk4FwvsDcQHtXB8F+c4eXBghm4p7SQK2zNVkAwN8VvV2oJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH4PPFAFBA01248
X-purgate-ID: tlsNG-720697/1795766143-F8D216C6-426E8490/0/0
X-purgate-type: clean
X-purgate-size: 1196
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/20/26 9:00 AM, Stephen Cheng wrote:
> +bool cf_check nvmx_intercepts_event(
> +    struct vcpu *v, const struct x86_event *event)
>  {
> +    const unsigned int vector = event->vector;
> +    const int error_code = event->error_code;
>      u32 exception_bitmap, pfec_match=0, pfec_mask=0;
>      int r;
>  
> +    /* INT $n is not an exception, and is never in the exception bitmap. */
> +    if ( event->type == X86_ET_SW_INT )
> +        return false;

An alternative idea,

Since nhvm_vmcx_guest_intercepts_event() cannot tell an exception from
a software interrupt by itself, would it be cleaner to split the hook
in two and let hvm_inject_event() pick one by event->type?  Roughly:

    nhvm_vmcx_guest_intercepts_exception(v, vector, errcode)
    nhvm_vmcx_guest_intercepts_swint(v, vector)

SVM would check VMEXIT_EXCEPTION_DE + vector in the first and
VMEXIT_SWINT in the second.  VMX would keep nvmx_intercepts_exception()
as it is, with its ASSERT(vector < 32) still meaning "exceptions only",
and the second hook would simply return false, as INT $n never causes a
VM exit on VMX.  That also avoids passing the whole struct x86_event
to the hooks.


