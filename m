Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE3BCC6B3A
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 13:21:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450537.1666002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHLP1-0001p1-NI; Thu, 15 Oct 2026 13:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450537.1666002; Thu, 15 Oct 2026 13:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHLP1-0001or-Jr; Thu, 15 Oct 2026 13:21:47 +0000
Received: by outflank-mailman (input) for mailman id 1450537;
 Thu, 15 Oct 2026 13:21:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13fb9a2d20008425@swg.vates.tech>)
 id 1xHLP0-0001oB-9g
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 13:21:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHLOz-00H2Lo-MV
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 15:21:45 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13fb9a2d20008425@swg.vates.tech>)
 id 6ad0d369-2eae-0a2a0a5409dd-0a2a4506862c-2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 15:21:45 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13fb9a2d20008425@swg.vates.tech>)
 id 6ad0d364-195a-0a2a45060019-b9ff1c12a6c9-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 15:21:41 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13fb9a2d20008425.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 15 Oct 2026 13:21:32 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id E48B380120;
 Thu, 15 Oct 2026 15:21:31 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=994Z2AwKWVseJVTVA5qO9/fH1rz5FCL4yb2kHAul2yk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=b1N/fFfo6b6cDynfyBg8hW8DCVgEWd09ehjvzySyMD7E2wqE1wKTsSUypTdXFYJO3BjI6L8Ok
 0YSEFTTpg4OZU8QsBa8zmqgsOUbEH96UeX6JPscjelOAJNnWOsazwqAHR7IjZa6QRm5P+sGJvBS
 breP2zv5jM+eiXAYCpMhxpwGVTPYggGEsg+P9aXGFa4qk86HeMws0FOD4v3PegTvOX29lEHl0nm
 Mb0MaQH7AfbCt5bp6AoYUG8Zw4HMm/5z1Ee0R6bXZv6zBYfOicVKSY+HTGO5PUtYMPWWKOavaRs
 dA+nLfaz7iCA1fV8kIKrx+08ut1NMwGyMpc3Fvs1sECQ==
X-Zone-Loop: 34655567a8ecf9afa5472571a0597ec249929519557c
x-campaign-type: default
x-transaction-id: ac05a02e-0c3d-4c24-8924-2d725a96c0a7
x-swg-uid: 01-c861ec83-9fc3-4f5d-8c3b-4555e70dc5ad
X-Mailer: Sweego
Message-ID:
 <1792070492.8631fc262581453bbf619ec5b2062170.1a13fb9a2d20008425@vates.tech>
x-swg-bid: 1792070492.8631fc262581453bbf619ec5b2062170.1a13fb9a2d20008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH 2/3] tools/tests: don't skip all of test-paging-mempool without an IOMMU
Date: Thu, 15 Oct 2026 15:21:22 +0200
In-Reply-To: <1792070250.8631fc262581453bbf619ec5b2062170.1a13fb5eee80008425@vates.tech>
References: <1792070250.8631fc262581453bbf619ec5b2062170.1a13fb5eee80008425@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.243.1e85d09599fae89b.1a13fb9a138.997487b0e243cbb3=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792070492472
X-purgate-ID: tlsNG-16d1c6/1792070501-F6A7477B-2F7F85ED/0/0
X-purgate-type: clean
X-purgate-size: 2391

---=Part.243.1e85d09599fae89b.1a13fb9a138.997487b0e243cbb3=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Commit 66c982a5d3 ("tests/paging-mempool: Extend to test P2M
relocation") added XEN_DOMCTL_CDF_iommu to the test domain=2E On hosts
without an IOMMU, Xen rejects the flag with -EINVAL and the whole test
is skipped, including the paging mempool tests that do not depend on it=2E
This is the case e=2Eg=2E for QEMU-based CI=2E

Only set XEN_DOMCTL_CDF_iommu if XEN_SYSCTL_PHYSCAP_directio is
reported, and skip just the relocation test otherwise=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 tools/tests/paging-mempool/test-paging-mempool=2Ec | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/tests/paging-mempool/test-paging-mempool=2Ec b/tools/te=
sts/paging-mempool/test-paging-mempool=2Ec
index 020ebd5f8f=2E=2Eb65a800d00 100644
--- a/tools/tests/paging-mempool/test-paging-mempool=2Ec
+++ b/tools/tests/paging-mempool/test-paging-mempool=2Ec
@@ -258,6 +258,12 @@ static int test_p2m_relocate_memory(void)
      */
     printf("Test p2m memory relocation\n");
=20
+    if ( !(create=2Eflags & XEN_DOMCTL_CDF_iommu) )
+    {
+        printf("  Skip: No IOMMU, can't force continuations\n");
+        return 0;
+    }
+
     rc =3D xc_domain_populate_physmap_exact(
         xch, domid, ARRAY_SIZE(physmap),
         9 /* order 2M */, 0 /* flags */, physmap);
@@ -390,6 +396,14 @@ int main(int argc, char **argv)
     if ( rc )
         err(1, "Failed to obtain physinfo");
=20
+    /*
+     * XEN_DOMCTL_CDF_iommu is only needed to force continuations in the
+     * relocation test=2E Without an IOMMU, Xen rejects the flag, so drop=
 it
+     * and skip only the relocation test rather than all tests=2E
+     */
+    if ( !(physinfo=2Ecapabilities & XEN_SYSCTL_PHYSCAP_directio) )
+        create=2Eflags &=3D ~XEN_DOMCTL_CDF_iommu;
+
 #if defined(__arm__) || defined(__aarch64__)
     if ( arch_capabilities_arm_gic_v3(physinfo=2Earch_capabilities) )
         create=2Earch=2Egic_version =3D XEN_DOMCTL_CONFIG_GIC_V3;
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.243.1e85d09599fae89b.1a13fb9a138.997487b0e243cbb3=---

