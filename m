Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D49CC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 13:17:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450528.1665983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHLKv-000891-0v; Thu, 15 Oct 2026 13:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450528.1665983; Thu, 15 Oct 2026 13:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHLKu-00088u-UN; Thu, 15 Oct 2026 13:17:32 +0000
Received: by outflank-mailman (input) for mailman id 1450528;
 Thu, 15 Oct 2026 13:17:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13fb5eee80008425@swg.vates.tech>)
 id 1xHLKu-00088n-Bd
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 13:17:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHLKt-0094OD-OK
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 15:17:31 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13fb5eee80008425@swg.vates.tech>)
 id 6ad0d255-2eae-0a2a0a5409dd-0a2a450ae5f0-44
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 15:17:31 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13fb5eee80008425@swg.vates.tech>)
 id 6ad0d26b-f2d2-0a2a450a0019-b9ff1c2293cf-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 15:17:31 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13fb5eee80008425.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 15 Oct 2026 13:17:30 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3508080120;
 Thu, 15 Oct 2026 15:17:29 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=jAbBj+wsBsZDd6u/2JMsKbdYrnUVx/b1Z4ZsIkWPV5E=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=noNbtlJ3i7MgFTTxo0yOWnlAFus/5ORyJZsSVtFbdi0u60w42UOohVb+gFq7dT4itFiogW3vB
 MqNAnN0RFhcK6wrlvbl38nWLWCWwZm5Ja+jJpYagXb8PkmsjigKQcDAtqrxP5tiQIz8S3LwpjHs
 7cXwCBQLieaOwzdKQvO83qsa16ZtgmnmUCPW7L4yDsqUUaOVvt8GBxZZJe0GIlKUav1l+DQl8o/
 Qi2yGhy7RJBiWUFB5G9px0SKCZB4TEG+Se+YAZ/SRKAYtqUtbMYs5Nr3/Q+eoTRu4kAb40NAhbN
 9viVtVnAFcFNeWas9yuGiM/DRcsZyrmLmKGKsEpwOPDw==
X-Zone-Loop: 2a2ead255c93d38a1fb26af7852a8300b078b9f58a86
x-campaign-type: default
x-transaction-id: cbedb5ed-7c80-4c28-8aab-cdc95aff35ac
x-swg-uid: 01-c7ca2cc6-d784-4a00-b39c-fed3b830c512
X-Mailer: Sweego
Message-ID:
 <1792070250.8631fc262581453bbf619ec5b2062170.1a13fb5eee80008425@vates.tech>
x-swg-bid: 1792070250.8631fc262581453bbf619ec5b2062170.1a13fb5eee80008425
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
Subject: [PATCH 0/3] Add QEMU ARM tools-tests
Date: Thu, 15 Oct 2026 15:17:23 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.241.d5e31cb4a1135668.1a13fb5ec71.9b335bfea2028a15=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792070249585
X-purgate-ID: tlsNG-4011c0/1792070251-59DDFCFC-0B55000A/0/0
X-purgate-type: clean
X-purgate-size: 2241

---=Part.241.d5e31cb4a1135668.1a13fb5ec71.9b335bfea2028a15=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Michal and Andrew,
as promised the tests=2E I saw that neither of the 3 tests you mentioned
failing (test-mem-claim, test-paging-mempool and test-resource) actually
runs on ARM=2E So, I have fixed them in regards to my other patchset
(explicitly specifying a GIC version), but I also fixed the issue with
the page pool=2E Each test gained a call to xc_set_paging_mempool_size(),
so they don't fail after the domain creation=2E Then I have added an entry
for the CI to run these tests under QEMU in the CI=2E

Andrew I have slightly modified your test-paging-mempool=2E Because, as
far as I understand only the test-p2m-relocate-memory actually needs an
IOMMU, all the other tests run without one=2E So, I added a check for
XEN_DOMCTL_CDF_iommu and skip only that test=2E
I can also leave this test set alone if you prefer and skip it in its
entirety=2E The other alternative would be to start QEMU with a '-M
iommu=3Dsmmuv3' and compile XEN with CONFIG_EXPERT=3Dy and
CONFIG_ARM_SMMU_V3=3Dy=2E Then we could run all these tests on ARM in QEMU
as well=2E But this would require some more modifications to the XEN
config for those tests=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Julian Vetter (3):
  tools/tests: fix domain creation on ARM
  tools/tests: don't skip all of test-paging-mempool without an IOMMU
  automation: run tools/tests on arm64 under QEMU

 automation/gitlab-ci/test=2Eyaml                |  23 ++++
 automation/scripts/qemu-tools-tests-arm64=2Esh  | 105 ++++++++++++++++++
 tools/tests/mem-claim/test-mem-claim=2Ec        |  15 +++
 =2E=2E=2E/paging-mempool/test-paging-mempool=2Ec      |  48 +++++++-
 tools/tests/resource/test-resource=2Ec          |  21 ++++
 5 files changed, 211 insertions(+), 1 deletion(-)
 create mode 100755 automation/scripts/qemu-tools-tests-arm64=2Esh

--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.241.d5e31cb4a1135668.1a13fb5ec71.9b335bfea2028a15=---

