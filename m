Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99ACC982DE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 05:30:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427083.1649717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8WbS-0007y9-4i; Mon, 21 Sep 2026 05:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427083.1649717; Mon, 21 Sep 2026 05:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8WbS-0007y2-1h; Mon, 21 Sep 2026 05:30:10 +0000
Received: by outflank-mailman (input) for mailman id 1427083;
 Mon, 21 Sep 2026 05:30:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1x8WbQ-0007xw-Kj
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 05:30:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8WbP-005UFM-Nz
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 07:30:07 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6ab0c0c5-2eae-0a2a0a5409dd-0a2a4505c29c-12
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 07:30:07 +0200
Received: from [52.101.61.1]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6ab0c0db-4cb1-0a2a45050019-34653d018eee-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 07:30:04 +0200
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by DM4PR03MB6936.namprd03.prod.outlook.com (2603:10b6:8:48::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 05:29:31 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 05:29:31 +0000
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
 b=dyzml29YmQDf5slJAdv80yxAFwrT902mNoECEA4OhMbczlmWMgM1+IS2kb3VRwUun8JXEU5mSz/37QBvKRhB8cwI/jV7kRFiv+cp4OsIRwIQ0McxhephGnObC7u6nh7uTewsXgv+IVbjhdvlp33tUBw+QEADrnERK1QRYFLroCQ2rk1ykagMek3u/nnzuQkQNJEuq1esxa0DU4zgWooBqyMKnE3Q97VTXbz2oAF7T7jibKeZ5SuJyoWMUAGhAfEalhWSe//sRQPQowJc2QSfE1CDeFexvm2nW3UgSsOcrK3RGqidI/EzALQfHzCduFfKzWsuFUrs7bH/JgHLJpPEBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzsOpapdRzQqFqWrZYgLA7mNlw9zTY9QDIWtDtt1w38=;
 b=xQQAoiuPKB/XbpZJqoEKexYTNRjKhS5NBhSRoOIFcIlHx6qUWPr9AgSGemiqY86FFGnubuE1DcWvDciBVj4MuGe9wC9iyUWwD842iMUQ2sCCUHnUCehXqA2VOZPF+VHmSViF08O/OCkJuy+azjfhTZ9D79yo7OEi7qLJaD6X13G7WT1b8QWWLJwQBMhvqxmcgV69WvT8PgqPgPyL0/w9rTmeqsy+LH6TmYCIFjwbtgSx6Ubek1wL2CwYi8jBLoUc3ACIvIjiwMCQNqGdtXR5Wf+OmejSe1fudCAm5OhszUlrJ7eo88Gl2eNl7mYS3RaqjcUIpVK/8kWlK36phKpmLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzsOpapdRzQqFqWrZYgLA7mNlw9zTY9QDIWtDtt1w38=;
 b=r5SKyKZOH5abtVIvZGP7LbVFe8bAk1qLcpQpGl+5lcI+vMuaTQTXuPciJTfF10mjKDAwejbiXnVPqXNEb+9sRVKGcs856loPwwYEQctsMGMj72gotHQtccWz79+FFYR+FKIGYoJTlOPZKMFi3f5u4U88zxYlGxpnYbWVifoXQjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stephen Cheng <stephen.cheng@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] x86/svm: require VMSAVEvirt for nested virt
Date: Mon, 21 Sep 2026 13:29:09 +0800
Message-ID: <20260921052910.580298-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260727071709.196088-1-stephen.cheng@citrix.com>
References: <20260727071709.196088-1-stephen.cheng@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU0P306CA0035.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:29::16) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|DM4PR03MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: 043f297b-063c-4a8e-3a9a-08df17a15030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|22082099003|18002099003|56012099006|5023799004|11063799006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	jEzGD114D4tupxpwiZkLDtUrFO4qO4LZrv2+Q1/J9ISdEOiiiRC+b2C8Y/Dg/LE6QrKQyg88cYr4S0zDoHNHqVrYbjCAR3KTa3wTZ6WZ9aiAfqzdOKw1ILe0fAFFQrOfrnb5Yxy5zjpsVKzbbeE1AifkpG1Nf6IjmZ4SCisy8Au9p3yQ/33e24SOdutrykjvn2l4NzpWVZlW3+SuF7o+W8BONZlsCnGD4mrVwQBklWpfHWEhpfGyWejhp4AHOxBu2DIK8rd3Vtc5WTVtnBRS6p8G0SR4YbOoOoVXFtjOIccshSGctb1rWVxyCkFsvUVLXjnCcYjc7VYmkqM23kumDibYDlBD57raHEZ0bA+T2B0piDg8hcYeJUJakr05RYIpbZsUxHEYRSnLtczRGCn/cWpAaqCNkxjsgJSWmL0NAt+slWvL/jRlhar7zIkn3S6XYgFrZXEHgYPUdJEGRbbiBfWjkoHouAMVPmPUE00VAMhig+1hJS2VK0kHLCdwxZw1fLESs4IbW5g74e7Cv9leNgYZrptcO9W1wGYMeXfJV3JrkTKZLet65PCPkC26QAQLseqBFXyjxxyeO1kj+PMGWojv53Ex46ii1d/hV/GHydw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QDcpEwicQ7c1cWlUahQisGJcJeBncVNxywaQW4ax2POhos2Z6TmhGbLewHRx?=
 =?us-ascii?Q?562I7N1pBABmsHNtyg03hS8oi884hM3c77Hxu1Ig+eWSzm4ADcT/MCPyLJEq?=
 =?us-ascii?Q?fzT+2oHrFieMJyuZZEWDhbZrszQBOmRe3xSkJceA/xvsjfAY07XVdPIBgS5H?=
 =?us-ascii?Q?DXMSv7B/mzsedsGzZeuVOVrWLIapo1PT4Pu2lR4P02HHrFveRzjSuBoRSNxu?=
 =?us-ascii?Q?GuOd7pg8cib1PhTD4yydjxdRsEeltM5QURAVCcOhvlBwiU4PKzAh4LrzmQ2Q?=
 =?us-ascii?Q?TVG2VQLMJK3UJ6SBeH9fuGQ37QZ1v8bxAhoJQyiajOqFI4oTPXtKrWg71KHB?=
 =?us-ascii?Q?lOAZxBMQOmm6+9wOe97+X7mN6F5Fz22V6oGJbvuiKeWCRBgDcmeRhxmtBm0I?=
 =?us-ascii?Q?A3rUgvRDlT2gMKkxvX3Vd58/5u5zp4mXc/JZo4M5kvwpMNoyKf9lCZNzXte/?=
 =?us-ascii?Q?VjgvWPnP2AkpIRu9Vlx70BDqOZ7vw+0kyNhWQcgfg/Pvxd78Oi/OBD/bPYYA?=
 =?us-ascii?Q?5HGp1hC28rG5PDezh+MVZ4WcgQO+K8l1VfywFW/xfTBF7CfIFqiRmxLjE6l3?=
 =?us-ascii?Q?qPyhZstZHJkELtYXx3h0sRvma1WirsbKEZied0P9tyXHIaT6HQ3OJ0ZPjxa3?=
 =?us-ascii?Q?zsAKmFgb+g6T7/t4GIfWLSQ42sAoqyvHlu6aLCmzq7dTwU+Q5Y7R6p6HuMyV?=
 =?us-ascii?Q?Vw9KVMSEwRUpkVyd6/F4FJ/loepwSb3GwH5NItkZ4sGwwdmH9z6GNCOD4XST?=
 =?us-ascii?Q?NiyE7OaGo03ZEqH0JjtOgpA/iF8/6xBZiX73HegF7QbzVft1i70B8MDzasal?=
 =?us-ascii?Q?616w7ztW8tiK/rrK50MObqxQDw1DOm1iL+B/MriIBijXe4xLP/NVYjJvrHS0?=
 =?us-ascii?Q?zDsF2MQHpwd3o/FeA/9QURcGFpszv5KEVHE4pySLMCOMwa96U50A+vB9aBID?=
 =?us-ascii?Q?d6gmNprQQBqQ/OXOuIRe++V7uFo7Q4f0meFfeQkkYTCgaAW8hvzyt+hMuI9i?=
 =?us-ascii?Q?Rip6fCFqhBCI1t5qfrHaOwG0OVDdBOvrGaMtBR/sJnjpxQDOgcGwWruLGHfU?=
 =?us-ascii?Q?jWGwjzmSVOcUP5tX79wC3oVJ6PNe1k663D3mD9wKcklWyfX1AOAIwtKAfpy/?=
 =?us-ascii?Q?LSf5sVXTKCGILoFFJDeZHjpnAZuIXghPsR3H2uf7bNmjYn30YrPxCtpMAwVl?=
 =?us-ascii?Q?d81RoatL9T1/Y4Ymde1yqte/3VIHz7HAJAAlQ2HEjfc8K5a4WAE184yzP4I6?=
 =?us-ascii?Q?UTmBeXVyS2CdmjYGWmI+/8KI0qzIxOXcuL8IjJ0+A1Flo7AiNyCPf2H32L9V?=
 =?us-ascii?Q?hMstR9scWU+B1Lutk81iMn54dDXlZw8uBcUAGG3r8DBtePKswieLpkMEuDDM?=
 =?us-ascii?Q?VqSf4D+/rHFq2sjcwKRmlZ5Pdqb6PQ3wD0/kmcRgkWtcnrqIRX3HGrNR/Shf?=
 =?us-ascii?Q?BbUQRUmSUyn7gFwOdCC/US+DkPES21zc8+91bwe+jpoZ3W1xcOhL7MW6H/5N?=
 =?us-ascii?Q?LjZp18OGJZ1exyjYKRwnTqWH4+RwkctTptnrrl3KK68VajaUxGvmou/oJG/M?=
 =?us-ascii?Q?KIw8QpiOClRxPUTtWkqMVubPoRivarLAgwQXK81drRTYuIyb+L7+O3GRoEpC?=
 =?us-ascii?Q?11bBm+pDJjz09wiQMVyzGDYdHz0rav3f8UYeQH/QczptMo5MJegtL1zHOtfq?=
 =?us-ascii?Q?2cnCO3LSfVkA2niE6Y4/JkFFU+OBEFrFqkN6U9sujsYhtnv6TmYb5AMNc2o6?=
 =?us-ascii?Q?Nox4CZ+FeQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 043f297b-063c-4a8e-3a9a-08df17a15030
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 05:29:31.5437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFsxc31iRth5YXyDlgEENrZQTZPELT1Yhqv9ux/R1TJ5Dcf1FpumuFLWxrZVRQZq/9k8im7Uva0OZEuKxAqhKmpwEDWS2f6Eb016Q7Gv6Cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6936
X-purgate-ID: tlsNG-c201ff/1789968604-243112A1-FC72515E/0/0
X-purgate-type: clean
X-purgate-size: 4743

Virtual VMLOAD/VMSAVE lets an L1 guest execute VMLOAD and VMSAVE
without intercepts.  Without it, Xen has to map the L1-provided VMCB
and re-execute each instruction in L0, handling a complex,
security-sensitive subset of state on the way.

Make VMSAVEvirt a hard requirement for nested SVM.  The
cpu_has_svm_vloadsave test in svm_nested_features_on_efer_update() is
then redundant, as nested virt now requires the feature, and is
dropped.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
---
Changes in v3:
 - Rebase onto staging.  No functional change from v2.

Changes in v2:
 - Keep the VMLOAD/VMSAVE handlers rather than removing them; the insn
   emulator will need them wired up regardless of older parts (Jan).

Jan - v2 dropped the handler removal you objected to, but got no
response.  Resending rebased in case it was missed.

v1: https://lore.kernel.org/xen-devel/20260727071709.196088-1-stephen.cheng@citrix.com/
v2: https://lore.kernel.org/xen-devel/20260730030303.71388-1-stephen.cheng@citrix.com/

 docs/designs/nested-svm-cpu-features.md | 17 +++++++++++++++++
 xen/arch/x86/hvm/svm/nestedsvm.c        | 16 +++++++++++-----
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/docs/designs/nested-svm-cpu-features.md b/docs/designs/nested-svm-cpu-features.md
index ce168e68e1b..eed40a958c4 100644
--- a/docs/designs/nested-svm-cpu-features.md
+++ b/docs/designs/nested-svm-cpu-features.md
@@ -109,3 +109,20 @@ leaf 8000000A:edx
   Using it in L0 reduces the chance that we'll make some sort of error
   in the decode path.  And if hardware supports it, it's easy enough
   to provide to the L1.
+
+- 15 `VLoadSave` *Virtual VMLOAD/VMSAVE*: Require for L0
+
+  Without this feature Xen has to intercept the L1 hypervisor's VMLOAD
+  and VMSAVE instructions and emulate them by re-executing the real
+  instruction on a mapped copy of the L1-supplied VMCB.  That path
+  handles a complex, security-sensitive subset of state (the hidden
+  segment descriptors for FS/GS/TR/LDTR plus the SYSCALL/SYSENTER
+  MSRs), so on faithfulness grounds we'd much rather let the hardware
+  do it.  When present, the instructions execute natively in the guest
+  without a #VMEXIT, which is both simpler and faster.
+
+  Whether to provide it to the L1 is a separate question, deliberately
+  left for a later change.  It needs care over whether an L2's
+  `vloadsave_enable` should follow L0's setting or L1's, and over what
+  should happen if L1 leaves the feature disabled without intercepting
+  VMLOAD/VMSAVE.
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a8b15d6eae0..6f9ba3c89a1 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -573,7 +573,10 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* Keep the host values of the fs, gs, ldtr, tr, kerngsbase,
      * star, lstar, cstar, sfmask, sysenter_cs, sysenter_esp,
-     * sysenter_eip. These are handled via VMSAVE/VMLOAD emulation.
+     * sysenter_eip. These are not transferred by VMRUN/#VMEXIT; they
+     * are moved directly to/from the L1-provided VMCB by the guest's
+     * own VMSAVE/VMLOAD, which run natively (VMSAVEvirt is required
+     * for nested virt).
      */
 
     /* PAT */
@@ -1108,7 +1111,10 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* Keep the l2 guest values of the fs, gs, ldtr, tr, kerngsbase,
      * star, lstar, cstar, sfmask, sysenter_cs, sysenter_esp,
-     * sysenter_eip. These are handled via VMSAVE/VMLOAD emulation.
+     * sysenter_eip. These are not transferred by VMRUN/#VMEXIT; they
+     * are moved directly to/from the L1-provided VMCB by the guest's
+     * own VMSAVE/VMLOAD, which run natively (VMSAVEvirt is required
+     * for nested virt).
      */
 
     /* CR2 */
@@ -1559,8 +1565,7 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
     if ( nsvm_efer_svm_enabled(v) )
     {
         if ( !vmcb->virt_ext.fields.vloadsave_enable &&
-             paging_mode_hap(v->domain) &&
-             cpu_has_svm_vloadsave )
+             paging_mode_hap(v->domain) )
         {
             vmcb->virt_ext.fields.vloadsave_enable = 1;
             general2_intercepts  = vmcb_get_general2_intercepts(vmcb);
@@ -1618,5 +1623,6 @@ void __init start_nested_svm(struct hvm_function_table *hvm_function_table)
         cpu_has_svm_lbrv &&
         cpu_has_svm_nrips &&
         cpu_has_svm_flushbyasid &&
-        cpu_has_svm_decode;
+        cpu_has_svm_decode &&
+        cpu_has_svm_vloadsave;
 }
-- 
2.49.0


