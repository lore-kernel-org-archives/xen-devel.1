Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E74EC98309
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 09:21:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429943.1652595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JAi-0005qB-Sk; Wed, 23 Sep 2026 09:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429943.1652595; Wed, 23 Sep 2026 09:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JAi-0005q4-Pu; Wed, 23 Sep 2026 09:21:48 +0000
Received: by outflank-mailman (input) for mailman id 1429943;
 Wed, 23 Sep 2026 09:21:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1x9JAh-0005nb-DL
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 09:21:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9JAg-0079P3-QP
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 11:21:46 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ab39a28-2eae-0a2a0a5409dd-0a2a450acb6e-10
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:21:46 +0200
Received: from [52.101.57.31]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ab39a28-f2d2-0a2a450a0019-3465391fa556-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:21:45 +0200
Received: from LV3PR03MB7609.namprd03.prod.outlook.com (2603:10b6:408:283::12)
 by BL4PR03MB8106.namprd03.prod.outlook.com (2603:10b6:208:591::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 09:21:43 +0000
Received: from LV3PR03MB7609.namprd03.prod.outlook.com
 ([fe80::146d:1d33:b619:386c]) by LV3PR03MB7609.namprd03.prod.outlook.com
 ([fe80::146d:1d33:b619:386c%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 09:21:43 +0000
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
 b=HI5bySuzJHbhGWoESuQoIz6iLJP9PmdB0Y31zwgAtfInKoOY54Rs3kimHRW1Wb77kWHv4rabJGWZ7ZquhgK42Pnl9ouiJ8s/EqXhIXyyiNLt2zd3tPkpfP9JE1IsGAkdwGkzoKlGv7G+AfnjzTK+qFZymrOxsMUDU+Y0JlRfx/WwXS8UJsdyR0948/DPId0M1OcilS7huIQjmSMQthdRttUtTSWLvqIYx+kdHPswdWcnQlTj3HF8gIE/v/HOTmdhydOs1iBalQcpxmKcJgw23CAdh2sW1xdeEp16aM7rfZBxk/rl5BlEbXbKy57ftQ6MY1WyZevdN+yfG7DgxVFC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQtCMr71u/dFmTTBykUGImfeS0Mu9gUyzujoZ62TAUA=;
 b=G7th76gRGCPrDB8N7wul0NfMb9oB+7EHcZg/hOcqN5dTJ70IF7EG1uNGs4pVmW3aO8QQiET/pWTfeSj3QGYEZhDGJeTYi8JKDd1SqqsYAIJ52a3Q8uVXkRzI4bNXxXnjqtIRJhJI/B/K/w2Az7M8M5JNsaPGeVLdVl9OmAAjwjD1H8neOYL4cqcPMqcSQu+C9zFfgOoFI52RkHnIBK7LiALTKX5DL5VJ/aNQp7vc3ZN0JQ49oFA+8JYMOmCS/LL3g2DxpwEPVsc8IeouHLXNN8o6mjmcSTi7b2x24VQ1A38q3anv/9FhdvFkt97xEaPnQwkwAhO8XCt+/PJPu+s7OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQtCMr71u/dFmTTBykUGImfeS0Mu9gUyzujoZ62TAUA=;
 b=ZGO4lUn7sYe1EGIktAujkPhANWNfkFvfnpcXk7VFL6TX68+yheOJo4QsQ4m/kL4LgXCaXhBxlGHvFGQ6XEyFQAfV3+/ua5CUuR1fvbQaTLLYvEH7vJpKKmrxX2T0VVXPC4wdwI2d68KHXibUHxfL4pKtJ6qZuvJnoSIfEHVHdw8=
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
Subject: =?UTF-8?q?=5BPATCH=C2=A0v1=205/5=5D=20x86/nestedsvm=3A=20fix=20up?=
Date: Wed, 23 Sep 2026 17:20:45 +0800
Message-Id: <b72ef69715f9e7e6a797045b0091489842d5e563.1790146987.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1790146987.git.chunjie.zhu@citrix.com>
References: <cover.1790146987.git.chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KUZPR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:34::15) To LV3PR03MB7609.namprd03.prod.outlook.com
 (2603:10b6:408:283::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR03MB7609:EE_|BL4PR03MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: 95495295-45ea-47f4-9eab-08df19541548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	qjkZxIh0Uz7t5kUhHLiDUNqAS8Q5r054YK8KzKEG5rR0RYgj5ZStVjxg/NBEfKZA/6Wx1/4WtZHDRVklkkRpnaccz8Rdg48E13PZOgyQXPsvgFlM9b9RAbQkW5adTOxVpNY/8PdxvvkNNRnyhsD63Vt91tVgSNIqQ46yv8PemQdaJpmlXMpvVrjLHFXm89DqVWhanbfQqFc4xxoUjuZL0C82veRXA7F4LlD3RwHfXkhTGW0/DtQ9dvR7c8Bb65KNp0sQtX/TDfUU20DxaSEsHC8UzNK8nZpDoYF5Kkwy0E5scKCd+cdo7izkcoTjBIGgRWVpxTK0WNErja7Um8uiatNiELnxss7YRUN+ET9rvy+Si6HIccfmOG0WmRqvHcMoAExoxMI/7QEgcStwq7aasWRA8xkwYswTTLdnVV/OmmXmkMiosHRpq0QcqtMMMQ33Wm1iRhMNxhEXiScZ/Y+iC5Xap0NxKq0qw9PGmeQ/7dxwTzTGgOBJ9iIO/FcPa2ur90wJfCRL6HTHOTLMkkROMr4UGUkzf5HcSeYy+ml4K4u10bH8gllnEbVmGkIBbVo9QGLwN8j75VkhwO/Zeb//lcDaTf0jsCBlF/QWVaUKWXIhD6o42Ki00e9caW2smTsdaeP+a/yVA2NfGDG2QAru745RtVI9zQTPUxklKdhH07o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7609.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkVxUHBNOURxYjVaUkRwRXFEN0lOcm16cUtJcEpaMDhNT2pYMEtIR1REbXBW?=
 =?utf-8?B?M0lxZlV5dVQ1eDJQTVROTklpMTRvdS9obWE4ejFEZjBaOTU5dlZ1VElTTS9Z?=
 =?utf-8?B?cWVqN2c0KzlxSkVqdGp6WUNJdWNPTGFCYjA3L0ZKWXVINjk1Q0RIYmFnOUFw?=
 =?utf-8?B?SzcySDIrWTVRSjg0TW1Ha1hOQUVibHhXNEozbTEySUNlZzlmZXplQW5rWkVD?=
 =?utf-8?B?OWp5ZnJmN1FrRThzNTdGaTkyTktxUWtUYkV1QUhpMWpIeEc0TTcvcENWQm1r?=
 =?utf-8?B?L0RxeEZaMVNXUE0yS1N6QWJhOU9vQzM5eEJoTnZNK2czZjV2WmF2M1BCM3Iy?=
 =?utf-8?B?MkVOYkhseFM1Z0xWVWNIMkUyQzlBeTRSODF1Z2dVQzVZTDVZVUpxZkE3dWdM?=
 =?utf-8?B?aVZXYTdhZlJoc09wRE4xWmlNSmpJLzBHUDFEaHNYZW01ZTZIM0NqWXFmdjJx?=
 =?utf-8?B?RDFMTXJiNU9DRXJWSU5RcEM0S1FLRFNYUFVxbThHVFdiejE1b2ozMDIwbWhH?=
 =?utf-8?B?aGltcXZFQllGUVA1WlNSL01La2JhNDN6VTF1VkZIbW1zWGR0TU9NY1YwYlFh?=
 =?utf-8?B?dXlKdzdpa0lsaGJoNmZPYWNtVlpRWCs0cTRNem5nbzVBdWhWZzRkRHhWNW83?=
 =?utf-8?B?Yk5WaGdDakhOVGJoQzlUTEtPSi92VEg5dkpsNzVJVmw5YVhSVDhPL09xNlM3?=
 =?utf-8?B?alpmOGtPQ1VReVpEbGlkSEVuelZoZm9ESTk2N1hIVHFLTUszcm83U213V0w5?=
 =?utf-8?B?ZDA5aHpSUFN2ZThpY1JsZ2FCQk43ZktyVC9tV2xrbkt0MnMwSW5BYlh1MTZj?=
 =?utf-8?B?cEd2NDdFWUdURHhMMElUZTl6Q1pCam5uMzNaVUw3bllrMTQxQjk1YXJlZDNK?=
 =?utf-8?B?TlczRG9sZ0R0K1BIRVR3T2RKMDJoMFBlWDhTWjVRN2gyWTV6VjR5Q0ZqNTVR?=
 =?utf-8?B?cGg4VHQxMWNwMU82WU8vQ3ZnTjlEL3VINzZYYU1lcVFJOXVwNEd6V3lzZWh0?=
 =?utf-8?B?UFo5ZnltWlIvZERNTEJHM3FTMHI1Zm5QbXhDYTVtKy9TdUtyMHJCQ0hsRjhX?=
 =?utf-8?B?WVh3UmNnV3R2QkVpZ28vMVNyK1JSbmlOL1dsSkRpNkxkczhDbng0TmZNQWdR?=
 =?utf-8?B?KzM2bUI3eU4vYTYvdE0wQWs0MUVQYmc1S3REVVFxUHJnMGhmRmhQQUJaZmxJ?=
 =?utf-8?B?SUhlLzMzT1h4MGhNZ2hmOUdKWWV2SXdvVjRoK0c1VUw5dS9uZWp5emlYQ1gr?=
 =?utf-8?B?cWd3N21td2RocXVqRmwzQU5pUEZWOWlySjZmQ0lDbmpvS25ZWVRXbElZcWhB?=
 =?utf-8?B?MzExUXJZK3BCZTgvU29FVnphSTBmMmVLTDNiYW9YYWsxc1ZycGVKekp0bVR1?=
 =?utf-8?B?ZEhNMVRiamNKQUhtOUZSN3F5Q01ySlB4UStHeWR6aTBvL0ZNZ0s3UDNJMHB6?=
 =?utf-8?B?cmFOaVBpcmlEUG9JNUI4aUJpRDVuNHdENU9tdmpMbHhXK0RKZDh1cFNWaFRM?=
 =?utf-8?B?Uko0M0ttUjdCcUtoSVRXR1pWTGFpeEcvWWk0NWxtNlBqUmRHSGU2UjhNTEVZ?=
 =?utf-8?B?RGFyMW5SWFNrc1ZWbHkvRU1LOHRjMyt0WWZxUC84cUFPK1M3RmlwR1JPMm5B?=
 =?utf-8?B?TGw0YkxLV1BHZlQrRHdmWVhhRVk5enlMNTJZeFlQdlNQcllna1B4NFIwaERv?=
 =?utf-8?B?SWFqSEpKQXlyQjN3ZXRCSEhvR0pNS0IwSWpVK0ZMMkNKMzhXSm5LbzBQVXpL?=
 =?utf-8?B?dXcyRi9jeCs4NVNERHFQVFZyTFh4cTYvcDlVNnBlVEtLRVVHWDF3NEJ2TkxM?=
 =?utf-8?B?bWhISG9lb3Q2UHlnTTVYSGhmdmRCdlJWQTVIeURpU2ZMcndUN2lKQTc3ckpI?=
 =?utf-8?B?WmpKVUY5aE1rMVVtb3Jka09JcWdVT0hoQ1hHY1pkVHZjZEozYnp2VDdHREVh?=
 =?utf-8?B?eFZxYnp4MXo5WWpBZzdOdGtJYTdWT0xuWDcyTjFYRjIrMHBPTElhUVdpOU5M?=
 =?utf-8?B?YnA2aTMvSE81T2pRQTVzTXpaK3RsRHI0VTM3T01USTlSWjNBM2NtUC83eWox?=
 =?utf-8?B?ZkJ0NDN3a3h1KzRCOGpXZTg4L1lrb1VIaXRwekQ4MUN5ck9pb29GWkV3MExQ?=
 =?utf-8?B?eXhhVHJnaG5IU2RrSFpYL2N1SERrRXd3S0h6azhGaUxKWWU0d0dvN004VUp5?=
 =?utf-8?B?d3lHdlgxTE10dEx1VlVzV3JQalZQcHR3dDRBaDNjRUUxZ2gyLzNKWWdBTFJ6?=
 =?utf-8?B?MVQxbVh5SG9BTE5adlBaR1BvZHB5U25aUGNaVExFUGowaGpYNjAzUmVvUEUx?=
 =?utf-8?B?OVdTa3hmTVFhbk1zcXFmWElmck8vRmpodGF1ZXRCMllIMXRHMHlDdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95495295-45ea-47f4-9eab-08df19541548
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7609.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:21:43.8150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k14H2l2yzMa+ibbypHdADQu8RrAMSADTQGfyRhiaTqkEd0w+Ef232JbXxUDpYfRtVCwfIdbXyH0K4fvHnc+vjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR03MB8106
X-purgate-ID: tlsNG-4011c0/1790155305-59DDFCFC-5C11B661/0/0
X-purgate-type: clean
X-purgate-size: 3673

From: Chunjie Zhu <chunjie.zhu@citrix.com>

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 19 ++++++++++++++++---
 xen/arch/x86/hvm/svm/vmcb.c      |  9 +++++----
 xen/arch/x86/mm/p2m.c            |  5 +++++
 3 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 82e01e513e69..91872af8aa7b 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -355,7 +355,7 @@ static void nestedsvm_vmcb_set_nestedp2m(struct vcpu *v,
     vcpu_nestedsvm(v).ns_vmcb_hostcr3 = vvmcb->_h_cr3;
 
     p2m = p2m_get_nestedp2m(v);
-    n2vmcb->_h_cr3 = pagetable_get_paddr(p2m_get_pagetable(p2m));
+    vmcb_set_h_cr3(n2vmcb, pagetable_get_paddr(p2m_get_pagetable(p2m)));
 }
 
 void nsvm_vcpu_update_nestedp2m(struct vcpu *v)
@@ -373,6 +373,7 @@ void nsvm_vcpu_update_nestedp2m(struct vcpu *v)
         return;
 
     p2m = p2m_get_nestedp2m(v);
+    nv->stale_np2m = false;
 
     /*
      * This may happen if we've handled VMEXIT_NPF at the same time as a
@@ -383,8 +384,6 @@ void nsvm_vcpu_update_nestedp2m(struct vcpu *v)
          vmcb_get_h_cr3(nv->nv_n2vmcx) !=
          pagetable_get_paddr(p2m_get_pagetable(p2m)) )
         nestedsvm_vmcb_set_nestedp2m(v, nv->nv_vvmcx, nv->nv_n2vmcx);
-
-    nv->stale_np2m = false;
 }
 
 static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
@@ -1024,6 +1023,20 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     struct vmcb_struct *ns_vmcb = nv->nv_vvmcx;
     struct vmcb_struct *n2vmcb = nv->nv_n2vmcx;
 
+    ASSERT(v == current);
+
+    /*
+     * The physical VMCB fields covered by VMSAVE/VMLOAD may not be in sync
+     * with v's vmcb if a context switch happened since the last VMLOAD.
+     * VMSAVE below would otherwise capture stale/foreign register state
+     * into the L1 shadow VMCB.
+     */
+    if ( v->arch.hvm.svm.vmcb_sync_state == vmcb_needs_vmload )
+    {
+        svm_vmload_pa(v->arch.hvm.svm.vmcb_pa);
+        v->arch.hvm.svm.vmcb_sync_state = vmcb_in_sync;
+    }
+
     svm_vmsave_pa(nv->nv_n1vmcx_pa);
 
     /* Cache guest physical address of virtual vmcb
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 5354c4f1b85f..2f7053ed7eec 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -357,10 +357,11 @@ bool svm_vmcb_isvalid(
         PRINTF("CR0: bits [63:32] are not zero (%#"PRIx64")\n", cr0);
 
     if ( (cr0 & X86_CR0_PG) &&
-         ((cr3 & 7) ||
-          ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) && (cr3 & 0xfe0)) ||
-          ((efer & EFER_LMA) &&
-           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr))) )
+         ((!(cr4 & X86_CR4_PCIDE) &&
+           ((cr3 & 7) ||
+            ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) &&
+             (cr3 & 0xfe0)))) ||
+          (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr)) )
         PRINTF("CR3: MBZ bits are set (%#"PRIx64")\n", cr3);
 
     valid = hvm_cr4_guest_valid_bits(v->domain);
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 027b9ae69be3..d1fafc479c78 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1517,7 +1517,12 @@ p2m_get_nestedp2m_locked(struct vcpu *v)
     np2m_base &= ~(0xfffULL);
 
     if ( nv->nv_flushp2m && nv->nv_p2m )
+    {
+        p2m = nv->nv_p2m;
+        if ( p2m )
+            p2m_flush_table(p2m);
         nv->nv_p2m = NULL;
+    }
 
     nestedp2m_lock(d);
     p2m = nv->nv_p2m;
-- 
2.34.1


