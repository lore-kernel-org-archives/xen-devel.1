Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBA5606A32D
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 23:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zFvq01+P
Received: from list by lists.xenproject.org with outflank-mailman.1477481.1682931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPT9y-0004oG-Dz; Fri, 06 Nov 2026 23:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477481.1682931; Fri, 06 Nov 2026 23:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPT9y-0004o7-9W; Fri, 06 Nov 2026 23:15:50 +0000
Received: by outflank-mailman (input) for mailman id 1477481;
 Fri, 06 Nov 2026 23:15:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xPT9w-0004Z2-Ip
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 23:15:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPT9v-00EGLl-Vo
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 00:15:47 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee5f7b-bab6-0a2a0a5309dd-0a2a450ab500-12
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:15:47 +0100
Received: from [52.101.48.9]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee5fa1-f2d2-0a2a450a0019-34653009e761-3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:15:47 +0100
Received: from SA9PR13CA0084.namprd13.prod.outlook.com (2603:10b6:806:23::29)
 by CHBPR12MB475823.namprd12.prod.outlook.com (2603:10b6:610:404::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 23:15:40 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:23:cafe::4e) by SA9PR13CA0084.outlook.office365.com
 (2603:10b6:806:23::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Fri, 6
 Nov 2026 23:15:40 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 23:15:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 17:15:39 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 17:15:39 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 6 Nov 2026 17:15:38 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LonxG4/MvoHEi+sRtcDq3aG3k5a3gjNDRTyWcocczB8pArb+7Uk89IyJOxuW/Wc+QdMqR5CRI9D2VGpDnMq5cjQI2VGmQFkpaiawugTq0Yeu/M2vEXy2vvJazKvLDPNx8hSjmxL0ZKFAy6KYWPyRvrAhf9CwvPiuk0h5QD0ly+i7BE+Awnx9cj6+eaeu/kAZC6SSkZwOn3aatVn5kFw1gfa7ofUBpSiLFQlhS89nhsqMVTAlZVyEW0eWIgPNMrC/hnqBTs5YMsvQB7l3TfcvNbugOmKKUaME8t8TBa0E6vCg97mWisdKLa3YSQU/o/7FnlZLWVXS5pUl5SYn5jeL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qW04KrBo1BQ1A4z0aq6PiSVs1MGzV3/rsYoQoWCzVI=;
 b=yNsNFikp1R+y5E97aCUzZR5u05BAsup7NYAqjXGnw2vHhMwOYwXW5b/26p0VzgnmVLfA3Ji3fJJuONJ6VHjOX+bx71xzmHF1AwJ6IexfpwaCrZGlI2TpwqE8ns69++BNfcaHNF4e8T8BLFAgfwcextvfjz1MKmQGUn9kr8KufQCq4+FkQCcCL1IisNqyT1b74olbTVbdJvr1+p1iiNvF9HzDZlBf34vK6MV48xw8IMoPCIfhAkEtQeISKj7ofUJ/rjnRC7e7LW3wPrKXG3iZQCCMGKB8UL5NerNMHdilVeG1RYPd5IXM/pq97znkhkbr8hBie6jVNMmOeKvy9zQwWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qW04KrBo1BQ1A4z0aq6PiSVs1MGzV3/rsYoQoWCzVI=;
 b=zFvq01+PpeelCRCSiyHhfH1LE9ufOKMY/yQlqyfQxNjqlcWi8wvtBWSmpqsbyE0K8yALry9o9cA1VeA6Zx1/qA8I1x9iL45mxp2MhfNDrm4kFP3qt12OEyYTtF/vVIqIV7eTrd05Lm/aK/3B5QgA3FnQ1duJmQtA36srrCdm8Gg=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap
	<gwd@xenproject.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 3/4] tools/libxl: add emulated TPM support backed by swtpm
Date: Fri, 6 Nov 2026 18:15:25 -0500
Message-ID: <20261106231526.482418-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106231526.482418-1-jason.andryuk@amd.com>
References: <20261106231526.482418-1-jason.andryuk@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|CHBPR12MB475823:EE_
X-MS-Office365-Filtering-Correlation-Id: 12aa9c87-d8c5-4586-5560-08df3c5bdf9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|22082099003|18002099003|6133799003|10067099003|3023799007|11063799006|5023799004|261102123227099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261022105027099003|261021123027099003|56012099006|261009223027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	Q0JExgQlcPTvWGYtNddg3rvBJsroePEnBfULG/X2VmR71Jmu3aRgJt0YRhC7ickeS6Q0gpgZ3ygNMdIpdbPR3POqmBkgnIBHkE8yJmja4CctCnAR9xd1y+fIAcXrOvK4ABfa7jgLwi1L0zNJ2WCTJ/CBQGt5lDqOECq+heaNKQbdU+VsKqRBESTIOIXpMIg+WBGv49Jy8LrrOSA624WqvmpOMXWMTycipFvgzNfWxiF4xRkhaUZmOQB67UmGbYtMbeCK442y+5R4eu57U2nHwKpOhXai3GHsoAGfsekQwm5Ub6hHKtQ/OG2OF9tdY713xpvUJO4v8nTTMX3vM+sdoPeHtjrPz+8ecLFGckMvHzeVejKJLNRiYnRg09kXpinriYJIHchoekNB2LiYULVjqaHbSXilbtux3dcGG+zF+ClS2CF9soPJuS3Qkc63F6KEhKv0T6KkMTwd2NHpinyl2bm8FzcziCrjqb95LaKMPl1pTEEqaX2ELPY+5K5yWVMQWMsOL+Z7iMml8lQPFlwokayAH45nvk7nV00yUuhIGIcoXqONuDaI8wqBCmKKYs3QgkwGyYEcGwJHKmShBA4U1U45w7Ylu/X17vbjfqo8QM7aRQQpHjF/U7lLClk5O7MtRCVoXsyKIlqF9L3Y53V4YIl1Nh/Ak9dvCKbOP0zdkuaMB8popvAuzlWPonx/Dax5Yg7FEX9mYCu9qEBbyD6yuw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007)(11063799006)(5023799004)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261022105027099003)(261021123027099003)(56012099006)(261009223027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HSo9L9nGUrDJ71nMJN79JxL6tZjMJkumYe9MMV+IeiSlgnWrm9NVDzrr8yt3RznjdBmxjzIoRvanX2UtA8xT8EmaV3pqLKra6Pd2HUrKSA/9w5VjSN7IrmwdneVHlqxmjT91dYlNYxjIyaLbQKmlEeYZaQYTfeCuLpdbBX5db8cZy+f2SJuWoY+zP2ByZB/BT4CYe61LiEmahrm+kkRFIxbx/ZCn31zUO2Pe/zd9S8z6iGMzIJq96NaEUDTd/e+ZnZsm4Y2k1gaoQyXzq1sJDhhN5IfbnQvc/0GDKQzEDeowM3DGSj/9JqKye72YOdTfAy0afKli+frER73HNrMPq0KxI0X8KqM0AdU7h5zOlPl5ZWKetHtu2MivM3I+Wo4tMiDXJTXw5YBXTXi8zSrbL7+ztiwzLR4kTSBr23gr7vJgasOHOo//n4yYxERmhuCQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 23:15:40.0488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12aa9c87-d8c5-4586-5560-08df3c5bdf9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB475823
X-purgate-ID: tlsNG-4011c0/1794006947-514C7CFC-D715718F/0/0
X-purgate-type: clean
X-purgate-size: 24118
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for an emulated TPM.  QEMU emulates the device and uses
swtpm for the backend.  swtpm is started first and QEMU connects to it.

Add the xl.cfg options are:
tpm_version
tpm_statedir
tpm_statefile
tpm_interface
tpm_loglevel
tpm_swtpm_override

When tpm_version is absent, no TPM is configured.  tpm_version must be 1
or 2, and exactly one of tpm_statedir or tpm_statefile must be
specified.  tpm_statefile is only supported for swtpm 0.7 and later, so
tpm_statedir is provided for compatiblity.  tpm_interface can be either
tis or crb.  tpm_loglevel is passed to swtpm when non-zero, with swtpm
logging to /var/log/xen/swtpm-<domain>.log.  tpm_swtpm_override specifies
the swtpm executable path; otherwise swtpm is found via PATH.

On x86, TPM 1.2 only supports TIS, while TPM 2.0 may use either and
defaults to CRB.

libxl typically tracks spawned daemons through xenstore keys - like QEMU
writing its "state" key as "running".  swtpm does not write to
xenstores, so that is not used.  Instead the daemon is launched first
and then QEMU launches and connects to it.  If there is a failure,
the QEMU log messages will list tpm in the error message.

`interface` is a Go keyword, so the binding generator needs to specify
that.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 docs/man/xl.cfg.5.pod.in             |  36 ++++++
 tools/golang/xenlight/gengotypes.py  |   2 +-
 tools/golang/xenlight/helpers.gen.go |  48 ++++++++
 tools/golang/xenlight/types.gen.go   |  17 +++
 tools/include/libxl.h                |  10 ++
 tools/libs/light/libxl_create.c      |  46 +++++++-
 tools/libs/light/libxl_dm.c          | 161 +++++++++++++++++++++++++++
 tools/libs/light/libxl_domain.c      |   3 +
 tools/libs/light/libxl_internal.h    |   4 +
 tools/libs/light/libxl_types.idl     |  17 +++
 tools/libs/light/libxl_x86.c         |  18 +++
 tools/xl/xl_parse.c                  |  20 ++++
 12 files changed, 380 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index b19c25c8d1..c12d2dc4db 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -821,6 +821,42 @@ value is optional if this is a guest domain.
 
 =back
 
+=item B<tpm_version=NUMBER>
+
+Provides an emulated TPM to a QEMU-based HVM guest, backed by B<swtpm(8)>.
+The TPM version to emulate is either B<1> for TPM 1.2 or B<2> for TPM 2.0.
+When this option is not specified, no TPM is provided and the other
+B<tpm_*> options are ignored.
+
+One of B<tpm_statefile> or B<tpm_statedir> is required, but not both.
+
+=item B<tpm_statefile="PATH">
+
+Path to a single file in which B<swtpm> stores the persistent TPM state.
+This uses the C<--tpmstate backend-uri=file://PATH> option added in swtpm
+version 0.7.0.
+
+=item B<tpm_statedir="PATH">
+
+Path to a directory in which B<swtpm> stores the persistent TPM state.
+
+=item B<tpm_interface="tis"|"crb">
+
+The TPM interface presented to the guest.  B<tis> is the TPM Interface
+Specification (FIFO) interface and B<crb> is the Command Response Buffer
+interface.  B<tpm_version=1> only supports B<tis>, while B<tpm_version=2>
+supports either and defaults to B<crb>.
+
+=item B<tpm_swtpm_override="PATH">
+
+Path to the B<swtpm> executable.  By default, B<swtpm> is searched for in
+B<PATH>.
+
+=item B<tpm_loglevel=NUMBER>
+
+The B<swtpm> log level. When non-zero, B<swtpm> logs to
+F</var/log/xen/swtpm-DOMAIN.log>. Defaults to B<0> (no log).
+
 =item B<p9=[ "9PFS_SPEC_STRING", "9PFS_SPEC_STRING", ...]>
 
 Creates a Xen 9pfs connection to share a filesystem from the backend to the
diff --git a/tools/golang/xenlight/gengotypes.py b/tools/golang/xenlight/gengotypes.py
index e4eb7ca1c1..628772d45d 100644
--- a/tools/golang/xenlight/gengotypes.py
+++ b/tools/golang/xenlight/gengotypes.py
@@ -28,7 +28,7 @@ builtin_type_names = {
 }
 
 # Some go keywords that conflict with field names in libxl structs.
-go_keywords = ['type', 'func']
+go_keywords = ['type', 'func', 'interface']
 
 go_builtin_types = ['bool', 'string', 'int', 'byte',
                     'uint16', 'uint32', 'uint64']
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 6ab23a708f..58e6179374 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1076,6 +1076,48 @@ return fmt.Errorf("converting field Quota: %v", err)
  return nil
  }
 
+// NewTpm returns an instance of Tpm initialized with defaults.
+func NewTpm() (*Tpm, error) {
+var (
+x Tpm
+xc C.libxl_tpm)
+
+C.libxl_tpm_init(&xc)
+defer C.libxl_tpm_dispose(&xc)
+
+if err := x.fromC(&xc); err != nil {
+return nil, err }
+
+return &x, nil}
+
+func (x *Tpm) fromC(xc *C.libxl_tpm) error {
+ x.Statefile = C.GoString(xc.statefile)
+x.Statedir = C.GoString(xc.statedir)
+x.SwtpmOverride = C.GoString(xc.swtpm_override)
+x.Version = int(xc.version)
+x.Loglevel = int(xc.loglevel)
+x.Interface = TpmInterface(xc._interface)
+
+ return nil}
+
+func (x *Tpm) toC(xc *C.libxl_tpm) (err error){defer func(){
+if err != nil{
+C.libxl_tpm_dispose(xc)}
+}()
+
+if x.Statefile != "" {
+xc.statefile = C.CString(x.Statefile)}
+if x.Statedir != "" {
+xc.statedir = C.CString(x.Statedir)}
+if x.SwtpmOverride != "" {
+xc.swtpm_override = C.CString(x.SwtpmOverride)}
+xc.version = C.int(x.Version)
+xc.loglevel = C.int(x.Loglevel)
+xc._interface = C.libxl_tpm_interface(x.Interface)
+
+ return nil
+ }
+
 // NewDomainBuildInfo returns an instance of DomainBuildInfo initialized with defaults.
 func NewDomainBuildInfo(dtype DomainType) (*DomainBuildInfo, error) {
 var (
@@ -1242,6 +1284,9 @@ if err := x.DmRestrict.fromC(&xc.dm_restrict);err != nil {
 return fmt.Errorf("converting field DmRestrict: %v", err)
 }
 x.Tee = TeeType(xc.tee)
+if err := x.Tpm.fromC(&xc.tpm);err != nil {
+return fmt.Errorf("converting field Tpm: %v", err)
+}
 x.Type = DomainType(xc._type)
 switch x.Type{
 case DomainTypeHvm:
@@ -1626,6 +1671,9 @@ if err := x.DmRestrict.toC(&xc.dm_restrict); err != nil {
 return fmt.Errorf("converting field DmRestrict: %v", err)
 }
 xc.tee = C.libxl_tee_type(x.Tee)
+if err := x.Tpm.toC(&xc.tpm); err != nil {
+return fmt.Errorf("converting field Tpm: %v", err)
+}
 xc._type = C.libxl_domain_type(x.Type)
 switch x.Type{
 case DomainTypeHvm:
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 39bf9962d1..55b02ffcd7 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -553,6 +553,22 @@ type XsQuotaList struct {
 Quota []XsQuotaItem
 }
 
+type TpmInterface int
+const(
+TpmInterfaceDefault TpmInterface = 0
+TpmInterfaceTis TpmInterface = 1
+TpmInterfaceCrb TpmInterface = 2
+)
+
+type Tpm struct {
+Statefile string
+Statedir string
+SwtpmOverride string
+Version int
+Loglevel int
+Interface TpmInterface
+}
+
 type DomainBuildInfo struct {
 MaxVcpus int
 AvailVcpus Bitmap
@@ -612,6 +628,7 @@ NestedHvm Defbool
 Apic Defbool
 DmRestrict Defbool
 Tee TeeType
+Tpm Tpm
 Type DomainType
 TypeUnion DomainBuildInfoTypeUnion
 ArchArm struct {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index d294fb36bd..8b431b708d 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1563,6 +1563,16 @@ void libxl_mac_copy(libxl_ctx *ctx, libxl_mac *dst, const libxl_mac *src);
  */
 #define LIBXL_HAVE_XENSTORE_QUOTA
 
+/*
+ * LIBXL_HAVE_TPM
+ *
+ * If this is defined the tpm member of struct domain_build_info is
+ * available.  When its version is non-zero, libxl starts swtpm to
+ * provide an emulated TPM to a QEMU-based HVM guest.  Its interface
+ * member selects the TPM interface (TIS or CRB) presented to the guest.
+ */
+#define LIBXL_HAVE_TPM
+
 typedef char **libxl_string_list;
 void libxl_string_list_dispose(libxl_string_list *sl);
 int libxl_string_list_length(const libxl_string_list *sl);
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index a8b0c8c500..94a2a0129f 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -230,6 +230,43 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
     if (!b_info->event_channels)
         b_info->event_channels = 1023;
 
+    if (b_info->tpm.version) {
+        if (b_info->tpm.version != 1 && b_info->tpm.version != 2) {
+            LOG(ERROR, "TPM version must be 1 or 2.");
+            return ERROR_INVAL;
+        }
+
+        if (b_info->tpm.statefile && !b_info->tpm.statefile[0]) {
+            LOG(ERROR, "TPM statefile must not be empty.");
+            return ERROR_INVAL;
+        }
+
+        if (b_info->tpm.statedir && !b_info->tpm.statedir[0]) {
+            LOG(ERROR, "TPM statedir must not be empty.");
+            return ERROR_INVAL;
+        }
+
+        if (b_info->tpm.swtpm_override && !b_info->tpm.swtpm_override[0]) {
+            LOG(ERROR, "TPM swtpm_override must not be empty.");
+            return ERROR_INVAL;
+        }
+
+        if (b_info->tpm.statefile && b_info->tpm.statedir) {
+            LOG(ERROR, "Only one of TPM statefile or statedir may be specified.");
+            return ERROR_INVAL;
+        }
+
+        if (!b_info->tpm.statefile && !b_info->tpm.statedir) {
+            LOG(ERROR, "TPM statefile or statedir must be specified.");
+            return ERROR_INVAL;
+        }
+
+        if (b_info->tpm.loglevel < 0) {
+            LOG(ERROR, "TPM loglevel must not be negative.");
+            return ERROR_INVAL;
+        }
+    }
+
     rc = libxl_get_physinfo(CTX, &info);
     if (rc) {
         LOG(ERROR, "failed to get hypervisor info");
@@ -487,7 +524,7 @@ int libxl__domain_build(libxl__gc *gc,
         vments[4] = "start_time";
         vments[5] = GCSPRINTF("%jd.%02d", (intmax_t)start_time.tv_sec,(int)start_time.tv_usec/10000);
 
-        localents = libxl__calloc(gc, 13, sizeof(char *));
+        localents = libxl__calloc(gc, 17, sizeof(char *));
         i = 0;
         localents[i++] = "platform/acpi";
         localents[i++] = libxl__acpi_defbool_val(info) ? "1" : "0";
@@ -510,6 +547,13 @@ int libxl__domain_build(libxl__gc *gc,
         }
         localents[i++] = "platform/device-model";
         localents[i++] = (char *)libxl_device_model_version_to_string(info->device_model_version);
+        if (info->tpm.version) {
+            localents[i++] = "platform/tpm_version";
+            localents[i++] = GCSPRINTF("%d", info->tpm.version);
+            localents[i++] = "platform/tpm-interface";
+            localents[i++] = (char *)libxl_tpm_interface_to_string(
+                                         info->tpm.interface);
+        }
 
         break;
     case LIBXL_DOMAIN_TYPE_PV:
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 511ec76a65..843b8e29eb 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -931,6 +931,22 @@ out:
     return rc;
 }
 
+static const char *libxl__swtpm_socket_path(libxl__gc *gc, uint32_t domid)
+{
+    return GCSPRINTF("%s/swtpm-%u.sock", libxl__run_dir_path(), domid);
+}
+
+static void libxl__dm_add_tpm_args(libxl__gc *gc, flexarray_t *dm_args,
+                                   int guest_domid)
+{
+    const char *sock = libxl__swtpm_socket_path(gc, guest_domid);
+
+    flexarray_append_pair(dm_args, "-chardev",
+                          GCSPRINTF("socket,id=chrtpm,path=%s", sock));
+    flexarray_append_pair(dm_args, "-tpmdev",
+                          "emulator,id=tpm0,chardev=chrtpm");
+}
+
 static int libxl__build_device_model_args_new(libxl__gc *gc,
     const char *dm, int guest_domid,
     const libxl_domain_config *guest_config,
@@ -1615,6 +1631,14 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
         flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID", GCSPRINTF("%d", guest_domid));
 
+        if (b_info->tpm.version) {
+            libxl__dm_add_tpm_args(gc, dm_args, guest_domid);
+            flexarray_append_pair(dm_args, "-device",
+                GCSPRINTF("%s,tpmdev=tpm0",
+                          b_info->tpm.interface == LIBXL_TPM_INTERFACE_CRB ?
+                          "tpm-crb" : "tpm-tis"));
+        }
+
         if (b_info->u.hvm.hdtype == LIBXL_HDTYPE_AHCI)
             flexarray_append_pair(dm_args, "-device", "ahci,id=ahci0");
         for (i = 0; i < num_disks; i++) {
@@ -1980,6 +2004,75 @@ static int libxl__write_stub_dmargs(libxl__gc *gc,
     return rc;
 }
 
+/*
+ * Build the swtpm command line.  swtpm is run in --daemon mode: the
+ * process we exec forks the actual daemon and exits once the control
+ * socket is ready, so QEMU can connect to it immediately afterwards.
+ */
+static char **libxl__swtpm_argv(libxl__gc *gc, uint32_t domid,
+                                const libxl_domain_config *guest_config)
+{
+    const libxl_domain_build_info *b_info = &guest_config->b_info;
+    const libxl_domain_create_info *c_info = &guest_config->c_info;
+    const char *sock = libxl__swtpm_socket_path(gc, domid);
+    const char *pidfile = GCSPRINTF("%s/swtpm-%u.pid",
+                                    libxl__run_dir_path(), domid);
+    flexarray_t *args = flexarray_make(gc, 16, 1);
+    const char *tpmstate;
+
+    if (b_info->tpm.statefile)
+        tpmstate = GCSPRINTF("backend-uri=file://%s", b_info->tpm.statefile);
+    else
+        tpmstate = GCSPRINTF("dir=%s", b_info->tpm.statedir);
+
+    flexarray_vappend(args,
+                      b_info->tpm.swtpm_override ?: "swtpm", "socket",
+                      "--tpmstate", tpmstate,
+                      "--ctrl", GCSPRINTF("type=unixio,path=%s", sock),
+                      NULL);
+    if (b_info->tpm.version == 2)
+        flexarray_append(args, "--tpm2");
+    if (b_info->tpm.loglevel)
+        flexarray_vappend(args, "--log",
+            GCSPRINTF("file=%s/swtpm-%s.log,level=%d",
+                      XEN_LOG_DIR, c_info->name, b_info->tpm.loglevel),
+            NULL);
+    if (b_info->device_model_user)
+        flexarray_vappend(args, "--runas", b_info->device_model_user, NULL);
+    flexarray_vappend(args, "--daemon",
+                      "--pid", GCSPRINTF("file=%s", pidfile), NULL);
+    flexarray_append(args, NULL);
+
+    return (char **)flexarray_contents(args);
+}
+
+int libxl__destroy_swtpm(libxl__gc *gc, uint32_t domid)
+{
+    const char *pidfile = GCSPRINTF("%s/swtpm-%u.pid",
+                                    libxl__run_dir_path(), domid);
+    const char *sock = libxl__swtpm_socket_path(gc, domid);
+    void *data = NULL;
+    int datalen = 0;
+    pid_t pid;
+
+    /* No pidfile means swtpm was never started for this domain. */
+    if (libxl_read_file_contents(CTX, pidfile, &data, &datalen))
+        return 0;
+
+    pid = data ? atoi(libxl__strndup(gc, data, datalen)) : 0;
+    free(data);
+
+    if (pid > 0 && kill(pid, SIGTERM) && errno != ESRCH)
+        LOGED(ERROR, domid, "failed to kill swtpm [%d]", pid);
+
+    if (unlink(pidfile) && errno != ENOENT)
+        LOGED(ERROR, domid, "failed to remove %s", pidfile);
+    if (unlink(sock) && errno != ENOENT)
+        LOGED(ERROR, domid, "failed to remove %s", sock);
+
+    return 0;
+}
+
 static int libxl__store_libxl_entry(libxl__gc *gc, uint32_t domid,
                                     const char *name, const char *value)
 {
@@ -1994,6 +2087,7 @@ static void dmss_init(libxl__dm_spawn_state *dmss)
 {
     libxl__ev_qmp_init(&dmss->qmp);
     libxl__ev_time_init(&dmss->timeout);
+    libxl__ev_child_init(&dmss->swtpm_child);
 }
 
 static void dmss_dispose(libxl__gc *gc, libxl__dm_spawn_state *dmss)
@@ -2629,6 +2723,10 @@ static void device_model_probe_spawn_outcome(libxl__egc *egc,
      libxl__dm_spawn_state *dmss, int rc);
 static void device_model_launch(libxl__egc *egc,
     libxl__dm_spawn_state *dmss, int rc);
+static void device_model_swtpm_cb(libxl__egc *egc,
+    libxl__ev_child *child, pid_t pid, int status);
+static void device_model_spawn_qemu(libxl__egc *egc,
+    libxl__dm_spawn_state *dmss, int rc);
 static void device_model_postconfig_chardev(libxl__egc *egc,
     libxl__ev_qmp *qmp, const libxl__json_object *response, int rc);
 static void device_model_postconfig_vnc(libxl__egc *egc,
@@ -2875,6 +2973,69 @@ static void device_model_probe_spawn_outcome(libxl__egc *egc,
 
 static void device_model_launch(libxl__egc *egc,
     libxl__dm_spawn_state *dmss, int rc)
+{
+    STATE_AO_GC(dmss->spawn.ao);
+    const libxl_domain_build_info *b_info = &dmss->guest_config->b_info;
+    const int domid = dmss->guest_domid;
+    pid_t pid;
+
+    if (rc)
+        goto out;
+
+    if (!b_info->tpm.version) {
+        device_model_spawn_qemu(egc, dmss, 0);
+        return;
+    }
+
+    /* Remove any stale pidfile so teardown can't read a previous pid. */
+    rc = libxl__remove_file(gc, GCSPRINTF("%s/swtpm-%u.pid",
+                                          libxl__run_dir_path(), domid));
+    if (rc)
+        goto out;
+
+    pid = libxl__ev_child_fork(gc, &dmss->swtpm_child, device_model_swtpm_cb);
+    if (pid == -1) {
+        rc = ERROR_FAIL;
+        goto out;
+    }
+    if (!pid) {
+        /* child */
+        char **argv = libxl__swtpm_argv(gc, domid, dmss->guest_config);
+        int null = open("/dev/null", O_RDWR);
+        char **arg;
+
+        LOGD(DEBUG, domid, "Spawning swtpm %s with arguments:", argv[0]);
+        for (arg = argv; *arg; arg++)
+            LOGD(DEBUG, domid, "  %s", *arg);
+
+        setsid();
+        libxl__exec(gc, null, null, null, argv[0], argv, NULL);
+        /* not reached */
+    }
+    return;
+
+out:
+    device_model_spawn_qemu(egc, dmss, rc);
+}
+
+static void device_model_swtpm_cb(libxl__egc *egc,
+    libxl__ev_child *child, pid_t pid, int status)
+{
+    libxl__dm_spawn_state *dmss = CONTAINER_OF(child, *dmss, swtpm_child);
+    STATE_AO_GC(dmss->spawn.ao);
+    int rc = 0;
+
+    if (status) {
+        libxl_report_child_exitstatus(CTX, LIBXL__LOG_ERROR, "swtpm",
+                                      pid, status);
+        rc = ERROR_FAIL;
+    }
+
+    device_model_spawn_qemu(egc, dmss, rc);
+}
+
+static void device_model_spawn_qemu(libxl__egc *egc,
+    libxl__dm_spawn_state *dmss, int rc)
 {
     STATE_AO_GC(dmss->spawn.ao);
     libxl_ctx *ctx = CTX;
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 37fcd92871..5f2ca8da7d 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -1275,6 +1275,9 @@ static void dm_destroy_cb(libxl__egc *egc,
         libxl__qmp_cleanup(gc, target_domid);
     }
 
+    /* Terminate the emulated TPM backend, if any.  No-op otherwise. */
+    libxl__destroy_swtpm(gc, domid);
+
     dis->drs.ao = ao;
     dis->drs.domid = domid;
     dis->drs.callback = devices_destroy_cb;
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index b65e0064b9..c561d3bc33 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4106,6 +4106,7 @@ struct libxl__dm_spawn_state {
     libxl__spawn_state spawn;
     libxl__ev_qmp qmp;
     libxl__ev_time timeout;
+    libxl__ev_child swtpm_child;
     libxl__dm_resume_state dmrs;
     libxl__qemu_available_opts qemu_opts;
     const char *dm;
@@ -4123,6 +4124,9 @@ _hidden void libxl__spawn_local_dm(libxl__egc *egc, libxl__dm_spawn_state*);
  */
 _hidden int libxl__local_dm_preexec_restrict(libxl__gc *gc);
 
+/* swtpm (emulated TPM) backend for a QEMU-based HVM guest. */
+_hidden int libxl__destroy_swtpm(libxl__gc *gc, uint32_t domid);
+
 /* Stubdom device models. */
 
 typedef struct {
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index ce697303b6..dc6790b821 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -584,6 +584,22 @@ libxl_xs_quota_list = Struct("xs_quota_list", [
     ("quota", Array(libxl_xs_quota_item, "num_quota"))
     ])
 
+libxl_tpm_interface = Enumeration("tpm_interface", [
+    (0, "default"),
+    (1, "tis"),
+    (2, "crb"),
+    ])
+
+# Emulated TPM backed by swtpm.  A version of 0 means no TPM.
+libxl_tpm = Struct("tpm", [
+    ("statefile", string),
+    ("statedir",  string),
+    ("swtpm_override", string),
+    ("version",   integer, {'init_val': '0'}),
+    ("loglevel",  integer, {'init_val': '0'}),
+    ("interface", libxl_tpm_interface),
+    ])
+
 libxl_domain_build_info = Struct("domain_build_info",[
     ("max_vcpus",       integer),
     ("avail_vcpus",     libxl_bitmap),
@@ -658,6 +674,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("apic",             libxl_defbool),
     ("dm_restrict",      libxl_defbool),
     ("tee",              libxl_tee_type),
+    ("tpm",              libxl_tpm),
     ("u", KeyedUnion(None, libxl_domain_type, "type",
                 [("hvm", Struct(None, [("firmware",         string),
                                        ("bios",             libxl_bios_type),
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 9e8b48372d..3182cfc9df 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -825,6 +825,24 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
     libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
     libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, false);
 
+    if (b_info->tpm.version && b_info->type == LIBXL_DOMAIN_TYPE_PVH) {
+        LOG(ERROR, "TPM is not supported for PVH guests on x86.");
+        return ERROR_INVAL;
+    }
+
+    /* TPM 1.2 only supports TIS.  TPM 2.0 supports TIS or CRB. */
+    if (b_info->tpm.version) {
+        if (b_info->tpm.interface == LIBXL_TPM_INTERFACE_DEFAULT)
+            b_info->tpm.interface = b_info->tpm.version == 2 ?
+                                    LIBXL_TPM_INTERFACE_CRB :
+                                    LIBXL_TPM_INTERFACE_TIS;
+        if (b_info->tpm.version == 1 &&
+            b_info->tpm.interface != LIBXL_TPM_INTERFACE_TIS) {
+            LOG(ERROR, "TPM version 1 only supports the tis interface.");
+            return ERROR_INVAL;
+        }
+    }
+
     if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
         /*
          * The config parameter "altp2m" replaces the parameter "altp2mhvm".
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 0ccece3e8a..1fed322380 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -3060,6 +3060,26 @@ skip_usbdev:
         }
     }
 
+    if (!xlu_cfg_get_long(config, "tpm_version", &l, 0)) {
+        b_info->tpm.version = l;
+
+        xlu_cfg_replace_string(config, "tpm_statefile",
+                               &b_info->tpm.statefile, 0);
+        xlu_cfg_replace_string(config, "tpm_statedir",
+                               &b_info->tpm.statedir, 0);
+        xlu_cfg_replace_string(config, "tpm_swtpm_override",
+                               &b_info->tpm.swtpm_override, 0);
+        if (!xlu_cfg_get_long(config, "tpm_loglevel", &l, 0))
+            b_info->tpm.loglevel = l;
+
+        if (!xlu_cfg_get_string(config, "tpm_interface", &buf, 0) &&
+            (libxl_tpm_interface_from_string(buf, &b_info->tpm.interface) ||
+             b_info->tpm.interface == LIBXL_TPM_INTERFACE_DEFAULT)) {
+            fprintf(stderr, "xl: tpm_interface must be tis or crb\n");
+            exit(EXIT_FAILURE);
+        }
+    }
+
     if (!xlu_cfg_get_string (config, "sve", &buf, 1)) {
         e = libxl_sve_type_from_string(buf, &b_info->arch_arm.sve_vl);
         if (e) {
-- 
2.34.1


