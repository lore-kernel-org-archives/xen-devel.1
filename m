Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EC2606A33D
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 17:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=aTCqqSNH
Received: from list by lists.xenproject.org with outflank-mailman.1495001.1694217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjw9-0003de-MS; Wed, 18 Nov 2026 17:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495001.1694217; Wed, 18 Nov 2026 17:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjw9-0003dX-Jo; Wed, 18 Nov 2026 17:59:13 +0000
Received: by outflank-mailman (input) for mailman id 1495001;
 Wed, 18 Nov 2026 17:59:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xTjw9-0003dR-1I
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 17:59:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTjw8-00FUAW-E1
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 18:59:12 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6afde759-8faa-0a2a0a5109dd-0a2a450bdf78-24
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:59:12 +0100
Received: from [52.101.53.42]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6afde76f-b7e8-0a2a450b0019-3465352aca7b-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:59:12 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SJ0PR03MB5806.namprd03.prod.outlook.com (2603:10b6:a03:2d2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 17:59:08 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 17:59:07 +0000
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
 b=dWrQAaAJwwg2LNiBHRoLoEfXenv23iaqK3oxbqfpEbJ76SaHewqhK23rU4Fdj0Dz8JDV3zwlSTGplY99hso7cz5G8wY7FAa02pLdYBVOkr+yhLnACh84fBrSDuRvUnKHGNwqcppns+QlZ8/1CRUs9FhhtogcrbZgyQXQhCeBGsum53shkUOcToQf21JuNPlcBox8j5CpnM6Pcc1KyVY5ZfyCre+fmVElFRZ7tZETWra4jmsVeykn9IajEuL0x9IbWpGvF7/1O6HIx2Q0r37W8jlr7vLqPirAQZ+tM6QS5vIf+RJqmSoh1y49sQg6/FZ6vfIGhv/2GpydUgEVS+aWyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqQC8AAFnYdY/4wAeXiy43w4qzvIT5S/km0gWO5UOY8=;
 b=lrQwdQ80jAJO99gLDBFgkgN3ugB1OSfh8WmYeHptQoVC8CmvOXQBuQRTyhIvvUJtEWCeq3/X0Wl2N3+xiUCMnFiXtBnngX/j8A8LWQD/SJNpOU9jAal5I2oucE4NPwPtBydlzMTxSuphp5LelhKrXbiJyNPV7OqWT66D42ds0Vjq+aFt1AbQaOFPPjFOBNmKiEAqO9u/39dJxWhl1nYa3AxEd/7Y4LdyE3CKy7T3GLfWpCiUsZHbverOw7DOS1wpvqcYnVP7sFiquzjZR9M46UW6fCkrwduM0BBszTs7QiCr7JAnUWf0OxLUTldbn6OUkJFvUxR033aPlQu3Gy2Qbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqQC8AAFnYdY/4wAeXiy43w4qzvIT5S/km0gWO5UOY8=;
 b=aTCqqSNHjupwTIHEA2CqL2pjUu5+rL8A/VLlSpR955h5CkKHK4p69XGqkvNCrfsb/GeS2f1qxclziLarfnf0W1yaVHreYw+0UGRA0crMSQRFDlJ1rLmy+MRewsfE5FJ+F5Kv+FTButOwGQjMmsgT5EjFMCXPvM+kFyaFK5yhcIU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/nestedsvm: Don't restore L1's CR2 during VMEXIT
Date: Wed, 18 Nov 2026 17:58:52 +0000
Message-ID: <20261118175852.1683016-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0272.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::7) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SJ0PR03MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: cdef160c-ce47-4f45-bc55-08df459da426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|261009223027099003|56012099006|11063799006|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	xNqDGYWGDfFYEbgKb+wb27c7dUQ7DCsNhNOi32VH1wM8BNXa5gmUPPxulrtddyLeMpJmMnwvokf5cHIav8GVohdCWTae6mqpJFFRMTEtBL9r5vPglKdc0lETk2MAb8P4qbjaoEHKJFAgEvau7C25K8HxExfvrgfJ2QxAGYsrIRVgQ/vdEIeN/xTW6a0ZpGnIqAll2KU92kfcz7CyvGWNXLwVXfiqYNs3GRpK71rMOWcA006C7cTqjEl8zIis5mKn876wqSpv5zRUdbGfUY9tZ9UKnsMDcOM8LfpkHybJxfFedtpuUpC9RHo15gpS+pLL538v9qjVwGwzIiwMARmnI5VtIMBohjsAdo6s2k0MwKs9SkOZeowxHWR71qhV0MNEqb70wU0LmcdPRnbmbPA9ZuOBTNKynCr2Vyh2G/yYagshHnGodGDRjrK5NBA68RLJqEFo8NbQy7VE6iyuFKeBuGlOcUzi5N2Ih+NRWTgl5Ge0EVk/3GPzMb95HCYl7wBvFwPMUPDfFa5Epu2EYwbq0L5byUYkZcxakwyyiRP2dlp+BACi4n9p0LY13HNZvYEng2Jao0wkxYBiHC0SUgOAycTk9u/Ldaypn0VGbK3C2OaCbrKp0E/ZdwaO7gvc93K3yoLqV8JSt3vM7Vxi/Ywwmb5xrXrZbb60wf7tb/aJSD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q1tXXBlwNULPbUEwHdfpAQTU5a6pTX2ZFNWAKzmwqPVlr1OXhTfVqC8xDlE7?=
 =?us-ascii?Q?fziQ3iFELqAIEbXvBva2ereaSaR8FSoJtgoPF6vPzRUqgllNPWnE9knXdTNL?=
 =?us-ascii?Q?MLH+YLVrwP6v7BCcLpN0Tn6VY80k17KivjtbWweXRsYz55HS0pea5LaP8gCA?=
 =?us-ascii?Q?5a+JnQB0ryUCVnJQHIvpGG14xqB9gYKM2loOw5Fq4WBZv2ReZ5qTnFlH9+cA?=
 =?us-ascii?Q?Bic9YvyddmMs4oIQ0VEFBwQPq6mHZ0B1IfAYORpmtMtFlJRp+fBU29vh/FyY?=
 =?us-ascii?Q?QqPKRYQJX3tKyp2+rP45nTFh9Vi/EVF/JPFPFDzRFq5Dn6BgY3mw3PirC56U?=
 =?us-ascii?Q?7d9ukLJgIbwEhi4k+GkCXV2tp5HrmVlRTLlyqrfp5t6+A4AGRh1s0+C57+4h?=
 =?us-ascii?Q?b4hZNVR85ntvPYCGRYihQnsJ+IV4+WsmELDLJIf94LBJi4wLvXJk1Oml3lH7?=
 =?us-ascii?Q?BTkPI80rKh48mDS87O1cL5gyJStrSeyZSr3fSCQJTOqagvhWyoDumX+wHX3r?=
 =?us-ascii?Q?rhOJSDCrjHT1kZa04QjrVtRgJlNPznVCcBY1WW8NsiFHCAsGZ7xGLxtxtAxk?=
 =?us-ascii?Q?EadpLQgttDHDXQF2dVkyx82j5H8uUFjasSxrs+fzjde3Tg7TdLQ+PRud/fea?=
 =?us-ascii?Q?j6lHOOB9yXMTOXQMcpiIqLj8/3T1gX3h6iBv2p2lXP+nO7h2eK4nrQ0jpQFS?=
 =?us-ascii?Q?c5w9TOZs+awqb1kLv1JWb4R7QjW8GgQjVKu2qJH2gWm7RGVFWvdVeX6on6SA?=
 =?us-ascii?Q?6tRa25/qLIUDPMQ7BfGt4iDu3aoZY6bOEy5Y8i87VfunFy9sWkFGZMDbDB/L?=
 =?us-ascii?Q?FI27Y/snvs1KpzpX742TuT3P4AuqK8AI5B1DoW8SMhn20mbcBxhtPSQmhvob?=
 =?us-ascii?Q?rkCnNEmkd5fAjXiFGhtwlG9MbQVUJkqFtKlooprE3KzLSqGxpi/BnncQOPoL?=
 =?us-ascii?Q?BeqeISOrEGiqmfwlFikW69SJ5J5xtNhAhq9x30xeB8s3B6F6r//xqOfbesuz?=
 =?us-ascii?Q?I6EZOde+BOG+0IKRIMqbct9wn5cXx6QeBYOxGlO9N2RUZ1obwSJ8N5IDMxZZ?=
 =?us-ascii?Q?SITGCLgursGZrXcwd5HuD65CwaqnbHCotY4gp977be6WVhKF+ku9nDzGtz3E?=
 =?us-ascii?Q?AA+3pY8V4x11h7DH2LdrS1l9NPsA+ctSax4x/eLoZ2N46AIHPjLYyEsDTNFD?=
 =?us-ascii?Q?mtRuHnKa6YuP5El7vuixreOXFA+Mufv1rGE0pbv55nfN3gbgopXaIaARF60P?=
 =?us-ascii?Q?LYeIEODqX69VU4z3yzfIdHlf9ngnTWTXCT5lFKGrPpnyVrw3ESORFleDbFVW?=
 =?us-ascii?Q?6WDrNzm75E1101fhet6Mikt+mxAGBclqHOFDxKKMwErmROoEyNeqsGG5QhQW?=
 =?us-ascii?Q?TAmVR8dkzHqGGIQNMBM5Cw3OA7eUp0baCw5/zyWlavESqK+KwePg4oeIQnMK?=
 =?us-ascii?Q?e30fafhEGdqezrNoc5gldN2eCRPn1dvtrF2hcGzX6Ogx7Gl2+GOAvVEvDk4/?=
 =?us-ascii?Q?FjZ+48gWRm9Dgx57My+xR6lXfRnJ6xPRN7A5D4CFoeLJDXcgBIHGjE1bkwQY?=
 =?us-ascii?Q?Izk5k8shmPSV6L/6vBL9GQGYSgu5OuBrE9HLRF3nMbjJ5a/+LZHcT9iBUJlT?=
 =?us-ascii?Q?57sPUWfJ/7gDh/GE2IssmlwETO+own3zQECjT9KM6Hn6j7Fpx5HX3Jwoooin?=
 =?us-ascii?Q?bmSBYZFaFv/DvAiIdwZfuR3tnRi/MJM7w0CG05tKWWLsKIV/H3XxULbNTgMN?=
 =?us-ascii?Q?uvE9dqOb9UyOTxZsfLLPylqSp8EQgFg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdef160c-ce47-4f45-bc55-08df459da426
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 17:59:07.6981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cO8stdb4SiZiXBLUwgO+BBnaZSfN5oR6kUxIpMFPgju7ugUTKqVkEFeoRZplpkTxYetDmZ0gcKpp1e68lxRg2wppOjbmUBsh0+5XMHcbBa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5806
X-purgate-ID: tlsNG-42698a/1795024752-1A0C59EA-FBD6D3C5/0/0
X-purgate-type: clean
X-purgate-size: 1492
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

According to the APM, the host CR2 is not restored during a VMEXIT.

The state of CR2 after a VMRUN that exits with VMEXIT_INVALID is not
explicitly defined by the APM. After this change, CR2 in L1 after a
failed VMRUN may contain either the original L1 CR2 or the L2 CR2. This
is in line with the observed behaviour of real hardware.

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 81cae929dd05..5ddb0cda55bb 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -178,7 +178,6 @@ static int nsvm_vcpu_hostsave(struct vcpu *v, unsigned int inst_len)
      */
     n1vmcb->_efer = v->arch.hvm.guest_efer;
     n1vmcb->_cr0 = v->arch.hvm.guest_cr[0];
-    n1vmcb->_cr2 = v->arch.hvm.guest_cr[2];
     n1vmcb->_cr4 = v->arch.hvm.guest_cr[4];
 
     /* Remember the host interrupt flag */
@@ -232,8 +231,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_cr0 failed, rc: %u\n", rc);
 
-    /* CR2 */
-    v->arch.hvm.guest_cr[2] = n1vmcb->_cr2;
+    /* Sync the current CR2 to L1's VMCB */
     hvm_update_guest_cr(v, 2);
 
     /* CR3 */
-- 
2.56.0


