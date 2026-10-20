Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313E4606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=DlmbDTnL
Received: from list by lists.xenproject.org with outflank-mailman.1455207.1668754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6FC-0008ET-Km; Tue, 20 Oct 2026 09:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455207.1668754; Tue, 20 Oct 2026 09:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6FC-0008EM-Ht; Tue, 20 Oct 2026 09:34:54 +0000
Received: by outflank-mailman (input) for mailman id 1455207;
 Tue, 20 Oct 2026 09:34:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xJ6FB-0008EG-EJ
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 09:34:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ6FA-00EhcT-Nx
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 11:34:52 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6ad735bb-bab6-0a2a0a5309dd-0a2a4503aaa4-4
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:34:52 +0200
Received: from [52.101.53.66]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6ad735bb-fae8-0a2a45030019-34653542e23e-4
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:34:52 +0200
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by LY0PR03MB850118.namprd03.prod.outlook.com (2603:10b6:404:222::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:34:50 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0522.016; Tue, 20 Oct 2026
 09:34:50 +0000
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
 b=YQbF3x92PJyH5nFY+DScOwh+ja+gTNsa7dHLGFEb6yvWFQbb+1wIR7/WB1rCAVQ8q7L3ztT0Bp3eRWNWHfSgbkTT5sjC8DmaMyYl6b3QXH/pf5QCPyOTK3t+mpOorkEB1TwExCDvl5Ukn1C4TzlTTvj22InKgCUqAvRMDQKeZu96TtsJXbyaISrfUTu5ZfUbYev/Rh0QX3YW7j7DAqjO52RWWOs7QsNHm9ISAJvI2mei7/rn5jgIvoEZ1QHprWOoIc2GfF6IbmcODVeG7oGCk/cFcmPTbY0heFUL26fMOxmNYPcNvl60tB5Rk66S/xAzLZCjlXr3DaJ6U7CvgxVulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cK1t4aEvfoRj8dRcTAZCYSgvG1RfubWFrwaJSPwHsxA=;
 b=ZPEmOkbt6rWlQomDn76njyO5x7C8wkESdmx92S/dvaHmz6a8l7tc4wKlXNXXH9tZhVdsLfe25dGS549lUOYuJAEpGPIUo+CxBIZd5OwP3OIrAasLNR3orHs28pdOHzl4dxL3nl+i9Ga+iAbc/quTdjEIJ+adcNaGixq7JQKLdBYTTT5Lp6AHMb4N/PFv0nz51dAsFs+lSfmFHgptzGvVQcm2NISimwgop1VjBMHxqVymaqqDvnqcC+tdyLSrHj8cKQ+GHJIJuaB2SY6d0MCcm8NomY5799Ub3kB+grQkm3XaVmDfI/OYWSPBhtk0T83tpY2dRbvc9uksdwvzuVxrRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cK1t4aEvfoRj8dRcTAZCYSgvG1RfubWFrwaJSPwHsxA=;
 b=DlmbDTnLzzngdcfn9+1ZA35aff6eUjv7MP7+hxyAdaS6JYOfJGHpnLFgyvtIp6xSeZuWvpUttZkOz8SUJmMy2B8fnVju4OM5ihmd6JuF0p8om17CBLcf41igLHmu+fHw+6l0wjA4IvBpOqA235RWoXI/fZwSTqbrsQ/Z1NSVYOY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stephen Cheng <stephen.cheng@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/np2m: flush the np2m on an SVM nested TLB flush
Date: Tue, 20 Oct 2026 17:34:32 +0800
Message-ID: <20261020093432.105318-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0158.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:cd::11)
 To CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|LY0PR03MB850118:EE_
X-MS-Office365-Filtering-Correlation-Id: b462f676-5141-4012-6c8b-08df2e8d62ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	g0U0vhXOqprcaY1G+OQDKRfPTZmLo76QMfsB/YENbl3pYPhFBYndx9BvfV5+iWsRrEBoMIbtIB5CUhh84tZIrYzkRTSQn81nG+K1JOcwTRpizx+korFjqlg/mJvKu5QVVjR3/bynI9XNSYHqStu00/gfdgrdWhhnwlLSZbD4ohvahsbvPVCBhlmiJz/M6dObOL67aLyPtThn8C12J9tIaQFGAbfa9tZvW5Vsy7GW89+YxhE8rQn2ohvCQTFZQll4tKfrJk6KC4OEgMxdWeOEacWGK0sIxKIigz9eUfAJ7VKAijqjphY5zdVVfYHvMfJpSHZXyvIUVw2zo/Sz8onclI1WaNGb+nvVJu6ea3DE3BNYh/F8yZ53IJE9PulluRvzSs3Ev273PZ5ZkUFblWW3QxYz6mHS+u3vgmmVIu/oXgF87pSjg8rq/4zNyGsMIESDolhN9iSWIMIa9iNZ0Z8Qz/Xglbf/OZJZjmGP3JH6I0NbzZ6G7UI96Pjj55PwTqbajPkbw9mWNSZJ6qv7ujZkXC773h/LYvZ8NcWg7NQ5jamSRNSd1R0ZtzW3tZfJDLI7+VaVkOW0y1/vbQSHCEN2N+oDy1t4eNkUu/ipuA90NbHDEQ+thVZuhWxP/AH00EU+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sJOp49k7BkzLzeJWyNZIrtO0khpn1PFOHur0A0lh5eY0H/MwYFbbAFaCmAab?=
 =?us-ascii?Q?BQ8Oo7/Y3lYIPt92aZGDvLTTYhomiTEXBs92Gr+zGsmCBOGM9a+N7D9p7zA0?=
 =?us-ascii?Q?n2q4G2UBUK4jGt3ReFpiwV9INfsl9b70egVO4c41Fgqai48je5DmIpH/OuFa?=
 =?us-ascii?Q?kVfoknPseCeHlp775Oi960rTrNjsTp7JoNrLtkP/kGgzD3wNAhDl//dDNGnU?=
 =?us-ascii?Q?goA0W64gTzJdPSrZA/nnYqOkwDLIQsvXT39KqlyytUHaKAm3FQUNONfzcHt0?=
 =?us-ascii?Q?NAXj7Fp0SZJ7+WGv0uYJZvzFOrKIkSesNwa+N929bcor+tN/r+b6RnyaXEwc?=
 =?us-ascii?Q?uJHMA4s1WOXp6Hp2+JPWuk6PQWhnRjWvem3+EjmigX+Flkrqdt4o+drhADbO?=
 =?us-ascii?Q?hfCGXBtI+ePnT5s9eBu/O3JmOAd4qsxr6+rLDYUkPHOiP4kFfTnc4H/Ve/dw?=
 =?us-ascii?Q?0SQLFb6mPIK1F/xYuwI3E5/roBqdHpPKsJSA5k8cM8+anbJ+3NnrCoS3YbVk?=
 =?us-ascii?Q?WO8RFXWETFx65rXkg/BYIQSSEtCqB/O/+jldhKobsM2xy0+Yk/o82IqedIhh?=
 =?us-ascii?Q?I21/0VcsHfEK802R/UPbLwRYw34nQBdd0nFimOWkRbtMYjek4bVIMyBssoU3?=
 =?us-ascii?Q?WoTZemmaqFirTqKC+x94hwjwd7k3ku6XxgQnIrd0BFmSiVUaYWY3Uhw8/eSN?=
 =?us-ascii?Q?xk/iLaaTECbdNA/5eT46TnhG987DCNCS5H4tMdcNh8CwkVAtcqalUwHjOvyC?=
 =?us-ascii?Q?+mkvVrwxrhsCNnuJGkSe6PFnlM9cnpc+0Gq/HDd6VRH68n4alA2TiDjtNNeD?=
 =?us-ascii?Q?pRCqauhHH7+johb/3JkO/VFJxGt3cyEogONBEKSywPOzkCPUDHJU/6QglJ3U?=
 =?us-ascii?Q?R24xU2A2WiETZf+KnEDuLWdEElGNZCSVR8yCf5e6VUg8NkW+Y1cuHvs4g4AT?=
 =?us-ascii?Q?abmjPkPev/08q93Sm+wBq9Fy4mPUlU0MgStxWpWJPr4M9CW3zl6W3RPqKfL6?=
 =?us-ascii?Q?9+H4luL7m4E/CyW4UoVMgjjG1Ps/AhT3+uRCWHFYHwhi1iZRFRULevV/LCSv?=
 =?us-ascii?Q?QybW+7fJST6sg0ytKchznYqnIeNWBqUZ6GrkD/FTkOiNfCojpBsk4Xm/MA3s?=
 =?us-ascii?Q?6683pzgd9CD8Pdl4bm8BCE21mkjatFImU3J6xrC8kLmlyFCKal+lMoDzfxnH?=
 =?us-ascii?Q?aS0u78FCwZWdzhTG7TYRccLXo5FzNRDch/mWbOyJHMHIsKDnDu1+4NF6lwQy?=
 =?us-ascii?Q?vg5TV6cDw8xpoj5ONBf/bpefDwPugzPUzjOVCTmUKw4PRrZrkMa1GcDuLXph?=
 =?us-ascii?Q?zH9xvAbSvrpNTBqZoUlj39+rGqymq88t1bdVal6rlIERNYdhZI4amAMP12mI?=
 =?us-ascii?Q?3az4OfD0vi98+Vx9yHXDBx1zcus+o/UHJ8c5CWGLOebm9q3gW+N+aeqY/xAP?=
 =?us-ascii?Q?+5rNAeVHJ2qHKQ74Yzr+vUEtmzPphlBbaBZF/z31rvWksIYFGPP7XFplYx5L?=
 =?us-ascii?Q?7OrkIj0Y+VxdlEhZy0DzqDn7iVS2G6lbBAMquEOywPgHVB2Z/9sqkj90l3Xd?=
 =?us-ascii?Q?P6yvw/Qhauod5KKLpZ41Yog5wcn3js/FGlFfAlDddHDig4xlUOMuCyjfIwdf?=
 =?us-ascii?Q?jCVax+A92avLfDEPAbLZuvc2AqxvidG8VwBdvKHGe3kGrkqNw7UvQ7uuMwG6?=
 =?us-ascii?Q?9Bwc9QDykU8zyOOyr3dbJjGq4z2UxbQ4NKgO0NhUSUDloXSk6DqdqCmORfWa?=
 =?us-ascii?Q?CPqCfYjF+g=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b462f676-5141-4012-6c8b-08df2e8d62ff
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:34:50.0507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bybcPal3vhPsKQ5NhR+ToDnfsDGjMSTZa17Yrq5MdPlF2Ft27EM+aC+G5spYBFCNaz75XJ072fM2WEVgNeBKG+GJtr9RjXNqSYzGGb/Yxcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR03MB850118
X-purgate-ID: tlsNG-33051d/1792488892-6FEC24E9-FB9CE0BC/0/0
X-purgate-type: clean
X-purgate-size: 2269
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On SVM, L1 flushes what is cached from its nested page tables by setting
TLB_CONTROL or using a new ASID on VMRUN.  Either sets nv_flushp2m, which
p2m_get_nestedp2m_locked() handles by only dropping nv_p2m.  Since np2ms
are shared between vCPUs, the lookup then finds the np2m for the same
N_CR3 and reuses it as is, so L2 keeps the mappings from before L1 changed
its NPT.

Flush that np2m before reusing it, as nested VMX does via
np2m_flush_base() on INVEPT.

Fixes: 6df4b481b0c5 ("x86/np2m: implement sharing of np2m between vCPUs")
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
Assisted-by: Claude:claude-opus-5-5
---
Ross Lagerwall has a partial fix for this in the XenServer internal patch
queue, which was also part of v1 of Chunjie Zhu's "x86/nestedsvm: rework
nested VMRUN/VMEXIT handling" series (patch 5/5, dropped in v2):
https://lore.kernel.org/xen-devel/20260924091605.344577-1-chunjie.zhu@citrix.com/

It flushes nv_p2m, the np2m this vCPU used last, before dropping it:

         if ( nv->nv_flushp2m && nv->nv_p2m )
    +    {
    +        p2m = nv->nv_p2m;
    +        if ( p2m )
    +            p2m_flush_table(p2m);
             nv->nv_p2m = NULL;
    +    }

That covers a vCPU re-entering the same N_CR3, but not one entering an
N_CR3 whose np2m another vCPU filled: on its first VMRUN (nv_p2m is NULL),
with an ASID new to it, or when switching N_CR3.  This patch flushes the
np2m for the incoming N_CR3 instead, which covers all of these.

Tested with an XTF test that is not yet upstream: L1 repoints an NPT
entry, then enters L2 on another vCPU or N_CR3 under a new ASID.  L2 saw
the old frame before this patch and sees the new one with it.

 xen/arch/x86/mm/p2m.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 027b9ae69b..52cadd9b25 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1547,7 +1547,11 @@ p2m_get_nestedp2m_locked(struct vcpu *v)
         p2m_lock(p2m);
 
         if ( p2m->np2m_base == np2m_base )
+        {
+            if ( nv->nv_flushp2m )
+                p2m_flush_table_locked(p2m);
             goto found;
+        }
 
         p2m_unlock(p2m);
     }
-- 
2.49.0


