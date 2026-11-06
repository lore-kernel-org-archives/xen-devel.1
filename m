Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA45606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 23:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Z57nykxv
Received: from list by lists.xenproject.org with outflank-mailman.1477519.1682950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPTBm-0006Zw-79; Fri, 06 Nov 2026 23:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477519.1682950; Fri, 06 Nov 2026 23:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPTBm-0006Zo-3M; Fri, 06 Nov 2026 23:17:42 +0000
Received: by outflank-mailman (input) for mailman id 1477519;
 Fri, 06 Nov 2026 23:17:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xPTBl-0006Zi-Gr
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 23:17:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPTBk-004xa6-Qk
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 00:17:40 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee5f87-2eae-0a2a0a5409dd-0a2a4505cdb8-30
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:17:40 +0100
Received: from [52.101.56.3]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee6013-4cb1-0a2a45050019-3465380326db-3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:17:40 +0100
Received: from CH0PR03CA0005.namprd03.prod.outlook.com (2603:10b6:610:b0::10)
 by FT1PR12MB227580.namprd12.prod.outlook.com (2603:10b6:170:e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 23:17:37 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:610:b0:cafe::7f) by CH0PR03CA0005.outlook.office365.com
 (2603:10b6:610:b0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 23:17:36 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 23:17:36 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 17:17:36 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 6 Nov 2026 17:17:35 -0600
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
 b=Et3rO4KZJwvxF5XWydi3uqffKyEwM75z/ExXb4rKVSzdW1t1baqQJcEYQZmOZmN9S0iZyeXnahVSF/qXAU+XgB9V2MKt+LfFmFHj15AbHeISGR3DDitOsISs3lHJtv6wXTP0rgelxzKs2RrBgPHotEBEKD3lsGjrGhFqnXW4KDMnS+ba59HTEz34h+vTw2916lUtUfL7TFbGdv8GOdHDNLhLTwycv4Fq06ecRj3UmLv+rxSibwQugjWrJK7/tFuBDCEhCcsbtMdxFpyMU4WKGn9WkR70hv1JjG33byKyLQBNfZbsvmztLV8N4NhQik1OBlsK7eq3q2zYhbwHo4nz/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oF1c2YLFZJ97GJ/QBH1SJYJ5NeZfcNSU6S44aYVqyKQ=;
 b=SGyTRf0ro9AbOarqv4ej48QFHEz+pJr2TPFfyGJshlicGRNoY275Wc2wewIG8cir6SCU/gZHLZxKzIfBKbc6M9ze2IWsQuu6EporWZfQBSlWy2ViuEHKzVn+bUH4TmW4/faTi7war3bPYMMWDp4eYkWYyBPlAYsaVrLR0zyRGGVqWM/Q5WB0bQegD/8xbN75FWYmUX0wTl8O4dy37dC7nfhQyiaF/HP5jHdNbSm3xngIuT+YYvb6aLEtJvIQY6HnPUuH4pCjplPQXrk11TS8FYcTwYRifxhhOnRbp1h7ouoQSn1z8hzE7844j4I6ARpN/6rAyg37uXZDMI1SsVL5/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oF1c2YLFZJ97GJ/QBH1SJYJ5NeZfcNSU6S44aYVqyKQ=;
 b=Z57nykxvZabtd9R646wYHuSo1aSHRwiRKTMsPcWgKjt0toNAABusNgoiTH538kip7HebpLEkxOMntNWSLI/A1h7BCUP/eHgzGRlGj6gctexIXrMIaLUnQ9kwzG7XepSVI/QV97Qu1LYLTd+H/OMSgUC8pcQaJDgg9a6MI4bBqnw=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH] tools/ocaml: Fix cleaning bindings test
Date: Fri, 6 Nov 2026 18:17:32 -0500
Message-ID: <20261106231732.482518-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|FT1PR12MB227580:EE_
X-MS-Office365-Filtering-Correlation-Id: de5e4e46-eb38-4bcb-d51d-08df3c5c252a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|261026140227099003|11063799006|56012099006|261022075727099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261102123227099003|261028144727099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	jarpEoupajFm3HvwiVXDjel2TXn1y+xZLKbChXcvCPr0DQDkJ6yKrSnBgs01WevegdRBbuQ3Ud9c+uLaBaLplz0jOOB3xf1zSGAS000UEco4Bj4unC9HnMfetT46cR/GBQeUH1DonA27vKKK1wmYodYhN8VHgRQWKJ6hdWD+XqwfshIWZxZ593JpDa8W6lTi3HFfqBTCj5quSEx5T0fWxk1h+L7F3kN+nIt9WRpAsPQM74yHvZkgUUanJgrpGB0Npip2vGfZRgd6BDqPMsQN3hJiwa0huYww9T5ZbxXecmT87KcWs8sicOlP0rGQZJf6Dt+36m0g0Od4tTD0n+Fu4zv4PUE4jtZkqQt9F9geEkAbWNddQyeSbJbt/g/iBaN+zGDYlJMLL78uHvcrH9BOqouoVP4v/B5GLFuvwTmxd52FbXzaHSK+9tRxClrrxbVH3+vTQTH3dVHYmbRgyNFJ5HhI9l2MJf0qj7fnBc0DtDsK2y/rBeCAaoOtYPu5tHcOYLbZw/7atCGzbDw7PrkW+MlROkOdE7T+FKUC30Oi7ASuCFKqCg3ZahLnDf/OF2gp3t45cgB3ogMJRa7j2s11nOMH5pA7hMraXaHgg0TnVB6WOMQJar3IsOyV1C4aS8jdeQWPfNuLdEI4iQlvyEBAsNIFmLiQ7psuDfiyPDtpiK+2KXMNI3iJkUW1peP+Ljj3Ti399K4gqd3ZiqBgeMs0Hg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261026140227099003)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261102123227099003)(261028144727099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GkvneLir6h0uFZYhPpi0zfWQeyKGGTUrGmsUC3oVQUV+AmjbW7i04b5F4zi1Y0mJpVRyniarawGn3Tqe/bG1ZzV/4Yh8duakMrkB8zqxkhJnMfSIzCpEQs/rSRnRl95pZU/zTT1wvzBrnVpFA7IXSH9USnK6ncPp6B7daJCAxhg4MuDr2Tn9gVFJVv0bZS09NbheHYsmbzLyVcea5/rJMnkDMQRJASQFktBQzfVsVm9joAVNYYzgDYdKZSdm+p4718sdKm9EqfUp1apSZZWambrK5VGz6+2xNKboBRQ6zwAsiC2bXQapqCKSliYJyKMohV8iI6/mFnEYlSN2TrIEDTu3GM0DF9JtqvSVU6AcNIgef2hOTRXRlq9dth/ZgzEVG8C9uHSBFw757Bh7C/tSrLpgrFnNt38HX2nGqx8wbz5y8opyT90DtcmGlHC0gJqM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 23:17:36.7701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de5e4e46-eb38-4bcb-d51d-08df3c5c252a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR12MB227580
X-purgate-ID: tlsNG-c201ff/1794007060-F68B62A1-59DDE55C/0/0
X-purgate-type: clean
X-purgate-size: 1693
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

make clean fails in the bindings tests:

make[7]: Entering directory '/home/amd/xen/tools/ocaml/tests/bindings'
rm -f .*.d *.o *.so *.a *.cmo *.cmi *.cma *.cmx *.cmxa *.cmxs *.annot *.spot *.spit unix.cmxa -ccopt -L -ccopt ....
rm: invalid option -- 'c'
Try 'rm --help' for more information.

Split the compiler flags out of the LIBS variable, since LIBS is passed
to rm.  The individual *.cxma files are deleted in their respective
directories.

Fixes: d97847e858f1 ("tools/ocaml: Gitlab CI test for bindings")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/ocaml/tests/bindings/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/ocaml/tests/bindings/Makefile b/tools/ocaml/tests/bindings/Makefile
index 75f8babbaf..98fcb7aa5b 100644
--- a/tools/ocaml/tests/bindings/Makefile
+++ b/tools/ocaml/tests/bindings/Makefile
@@ -10,8 +10,8 @@ OCAMLINCLUDE += \
 	-I $(OCAML_TOPLEVEL)/libs/xc \
 	-I $(OCAML_TOPLEVEL)/libs/eventchn
 
-LIBS = \
-	unix.cmxa \
+LIBS = unix.cmxa
+LIBFLAGS = \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/mmap $(OCAML_TOPLEVEL)/libs/mmap/xenmmap.cmxa \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/eventchn $(OCAML_TOPLEVEL)/libs/eventchn/xeneventchn.cmxa \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/xc $(OCAML_TOPLEVEL)/libs/xc/xenctrl.cmxa \
@@ -21,7 +21,7 @@ LIBS = \
 PROGRAMS = test-ocaml-bindings
 OCAML_PROGRAM = test-ocaml-bindings
 
-test-ocaml-bindings_LIBS = $(LIBS)
+test-ocaml-bindings_LIBS = $(LIBS) $(LIBFLAGS)
 test-ocaml-bindings_MLSORTED = $(shell $(OCAMLDEP) -sort $(OBJS:=.ml))
 test-ocaml-bindings_OBJS = $(test-ocaml-bindings_MLSORTED:.ml=)
 
-- 
2.34.1


