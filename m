Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEB2C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 09:35:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428411.1651174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8wu2-0007Co-FG; Tue, 22 Sep 2026 09:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428411.1651174; Tue, 22 Sep 2026 09:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8wu2-0007Cg-CF; Tue, 22 Sep 2026 09:35:06 +0000
Received: by outflank-mailman (input) for mailman id 1428411;
 Tue, 22 Sep 2026 09:35:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c877f7de00072c4@swg.vates.tech>)
 id 1x8wu1-0007CW-Ac
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 09:35:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8wu0-007I6H-NY
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 11:35:04 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c877f7de00072c4@swg.vates.tech>)
 id 6ab24bbc-bab6-0a2a0a5309dd-0a2a4504d164-36
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 11:35:04 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c877f7de00072c4@swg.vates.tech>)
 id 6ab24bc8-b57f-0a2a45040019-b9ff1c23ab3f-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 11:35:04 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0c877f7de00072c4.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 22 Sep 2026 09:35:00 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id CBAFA81DBE;
 Tue, 22 Sep 2026 11:34:59 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=RVehtOiNO368PKacXNEj57lZ8HSUNGevRwXwpFLJTZ4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=K4cSdBAGEr/U9/A4/O7IZrxgZ1kLp0ekfxPVEo2P8mnx1s16HbHju/LLd4ph/QYWC5JXPawa9
 CD628BqcyGDArpxODnsJY8Zqkc8YxaX4F+T3GuuQEhguFc7RdFW0DgCVVDLLVRCKq6NBsfpcU8k
 UJtxWiNm780LlJIX03jKAsTKfD93fuW5BsK7cpRchqxvhpt4qornD9pMuGRkob4/2n8aQdM2bpK
 DE4H+p4M+grfZqskhem5yLJmT7sH/j069V/Pcz3rOHKamdjiqz+cZ3LMAouRwzYXzI/01ZKpmSX
 z3igiJgyCyLVsAiHd/U0CxhkhEIdvbFHnPCcD16cyCug==
X-Zone-Loop: f1a5f5ad25b63c403131ed89a54b9e4b7e1cedc7dd33
x-campaign-type: default
x-transaction-id: f524bc06-081d-4175-b818-450274836687
x-swg-uid: 01-57d4bece-be98-4c4c-91f5-f617b4a93418
X-Mailer: Sweego
Message-ID:
 <1790069700.8631fc262581453bbf619ec5b2062170.1a0c877f7de00072c4@vates.tech>
x-swg-bid: 1790069700.8631fc262581453bbf619ec5b2062170.1a0c877f7de00072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 6/6] CI: run the riscv64 smoke test via QTB
 framework console-test
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <DLL2K0JJWNCB.17LYI7INCLTHX@amd.com>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823789.8631fc262581453bbf619ec5b2062170.1a0429a155d000c4f3@vates.tech>
 <DLL2K0JJWNCB.17LYI7INCLTHX@amd.com>
Date: Tue, 22 Sep 2026 11:34:54 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790069694; l=5865;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=ZLWLsKxExfBqzvdQb0cfTR7YXVQ+4A2Io838q9LVL5g=;
 b=ckErGsj57ggV5a6/Z2WQKTDe+V/XNMTfsCN9bPCH2T1bgsCn95fBlzA4OBFMxePZu41iW7LW2
 D+5yNr4VxfwBgwVfkIcrGfYzQWFaEdJNiIJKNr19rKm3ZnAdp6JWcjU
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790069699927
X-purgate-ID: tlsNG-ebf023/1790069704-C36C2B50-26F894B0/0/0
X-purgate-type: clean
X-purgate-size: 5869

On 2026-09-21 16:37 +0200, Alejandro Vallejo wrote:
> On Thu Aug 27, 2026 at 11:42 AM CEST, Baptiste Le Duc wrote:
> > qemu-smoke-riscv64-gcc drove QEMU through
> > automation/scripts/qemu-smoke-riscv64.sh, an expect wrapper whose machine
> > description (cpus, memory, device tree, console wiring) lived in the script
> > itself. The QTB framework now owns all of that: machines come from the
> > shared catalog, expectations from the test type's own YAML.
> >
> > Turn .qemu-riscv64 into a template running qemu_smoke_riscv64.py <type> run
> > <test> in the qtb-riscv64 container, machine and test picked per job
> > through QTB_TEST_TYPE/QTB_TEST. The container comes from the test-artifacts
> > registry, hence the new ARTIFACTS_REGISTRY next to the existing
> > ARTIFACTS_REPO/ARTIFACTS_BRANCH. QTB_BINARIES_DIR points at the artifacts
> > of the job (Xen only currently, but aims to have initrd and linux images
> > when dom0less will be supported). QTB_LOG_DIR collects the per-console
> > logs, kept on failure and on success.
> >
> > Point qemu-smoke-riscv64-gcc at that template, running the console-test
> > type on dom0less-1smp-0domu-1vcpu-aplic-imsic-null: a Xen-only machine, so
> > the smoke check is Xen's own "All set up" on console 0, the same string the
> > expect script waited for.
> >
> > Drop automation/scripts/qemu-smoke-riscv64.sh as it has no caller left in
> > the CI after this patch and drop smoke.serial from the .qemu-riscv64
> > artifacts since no riscv64 job uses it anymore, the logs are now kept under
> > QTB_LOG_DIR.
> >
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> 
Hi Alejandro,
> This is all quite large and monolithic to review quickly, but I can
> already tell you that replacing a <50LoC test with such a massive
> infra bench is probably not quite what you want at this point in time.
Thanks a lot for this quick review. Sorry for these long patches, I will
split them to make the review easier.
> 
> IMO, you ought to keep the existing test in place and perhaps integrate
> the new infra with new tests that would be complicated without it.
> Things like injecting bizarre interrupts (NMI?) and capture expected
> behaviour.
> 
> Or even duplicating the existing test would be fine. Build confidence in
> it and only after you really trust it do remove your previous smoke.
Oh I don't know we could proceed this way... Duplicate seems then to be
a good idea. The aim of this patch series was above all to introduce the
the core framework which will be used to inject interrupts.
console_test.py replaces the old smoke test but adds per-domU console
testing, which goes beyond the original scope. I'll trim it to match.
> My .05 cents at least.
Thanks again!
> Cheers,
> Alejandro
> 
> > ---
> >  .gitlab-ci.yml                           |  3 +++
> >  automation/gitlab-ci/test.yaml           | 20 ++++++++++++++------
> >  automation/scripts/qemu-smoke-riscv64.sh | 19 -------------------
> >  3 files changed, 17 insertions(+), 25 deletions(-)
> >  delete mode 100755 automation/scripts/qemu-smoke-riscv64.sh
> >
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index f42a9abeaa..15f93b8634 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -11,6 +11,9 @@ variables:
> >    ARTIFACTS_BRANCH:
> >      description: "Branch in test-artifacts to use"
> >      value: master
> > +  ARTIFACTS_REGISTRY:
> > +    description: "Registry holding the test-artifacts containers"
> > +    value: registry.gitlab.com/xen-project/hardware/test-artifacts
> >    LINUX_JOB_X86_64:
> >      description: "Job name in test-artifacts to use for Linux x86_64"
> >      value: linux-6.6.56-x86_64
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> > index 61adc1baff..e9dd147380 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -72,14 +72,21 @@
> >      TEST_TIMEOUT_OVERRIDE: 120
> >  
> >  .qemu-riscv64:
> > +  image: ${ARTIFACTS_REGISTRY}/${CONTAINER}
> >    extends: .test-jobs-common
> >    variables:
> > -    CONTAINER: debian:13-riscv64
> > -    LOGFILE: qemu-smoke-riscv64.log
> > +    CONTAINER: debian:13-qtb-riscv64
> > +    QTB_LOG_DIR: qtb-logs
> > +    QTB_BINARIES_DIR: ${CI_PROJECT_DIR}/binaries
> > +  script:
> > +    - ./automation/scripts/qemu_smoke_riscv64.py
> > +      ${QTB_TEST_TYPE}
> > +      run
> > +      ${QTB_TEST}
> > +      --log-dir ${QTB_LOG_DIR}
> >    artifacts:
> >      paths:
> > -      - smoke.serial
> > -      - '*.log'
> > +      - ${QTB_LOG_DIR}
> >      when: always
> >    tags:
> >      - x86_64
> > @@ -779,8 +786,9 @@ qemu-xtf-argo-x86_64-gcc-debug:
> >  
> >  qemu-smoke-riscv64-gcc:
> >    extends: .qemu-riscv64
> > -  script:
> > -    - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
> > +  variables:
> > +    QTB_TEST_TYPE: console-test
> > +    QTB_TEST: dom0less-1smp-0domu-1vcpu-aplic-imsic-null
> >    needs:
> >      - debian-13-riscv64-gcc-debug
> >  
> > diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
> > deleted file mode 100755
> > index c0b1082a08..0000000000
> > --- a/automation/scripts/qemu-smoke-riscv64.sh
> > +++ /dev/null
> > @@ -1,19 +0,0 @@
> > -#!/bin/bash
> > -
> > -set -ex -o pipefail
> > -
> > -# Run the test
> > -rm -f smoke.serial
> > -
> > -export TEST_CMD="qemu-system-riscv64 \
> > -    -M virt,aia=aplic-imsic \
> > -    -cpu rv64,svpbmt=on \
> > -    -smp 1 \
> > -    -nographic \
> > -    -m 2g \
> > -    -kernel binaries/xen"
> > -
> > -export TEST_LOG="smoke.serial"
> > -export PASSED="All set up"
> > -
> > -./automation/scripts/console.exp |& sed 's/\r\+$//'
> 
> 
> 



