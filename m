Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BA7C5DF77
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 15:24:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393067.1631962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvzCF-0000zx-MR; Mon, 17 Aug 2026 15:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393067.1631962; Mon, 17 Aug 2026 15:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvzCF-0000zq-IG; Mon, 17 Aug 2026 15:24:19 +0000
Received: by outflank-mailman (input) for mailman id 1393067;
 Mon, 17 Aug 2026 15:24:18 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01052c27d000c4f3@swg.vates.tech>)
 id 1wvzCD-0000zk-Lf
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 15:24:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvzCD-008zaL-2P
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 17:24:17 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01052c27d000c4f3@swg.vates.tech>)
 id 6a832790-8faa-0a2a0a5109dd-0a2a4507b772-22
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 17:24:16 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01052c27d000c4f3@swg.vates.tech>)
 id 6a8327a0-b4ea-0a2a45070019-b9ff1c239e15-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 17:24:16 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a01052c27d000c4f3.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 17 Aug 2026 15:24:14 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id A67F982AC1;
 Mon, 17 Aug 2026 17:24:13 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=iyqTLxcoIuoA4+nTrE3S4JUxsdOAaqzYNJRVcQ8jxik=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=rO/p2aKr5iY77v9vZ7oKMWS59Gu446IHEzS0K7IvxaaarNr7wsTXShXVIz5r8bcbvAAaIZuTg
 +SdlCDv85Rr1bV6N7nFqT3Vv//5aMro+AR7csopxfijOEkPwetNuugheSa7Lz9/BhMGZokOU9P8
 FErpSsXU3+O6OMFhuvHexHv3ICyGkL1Gjvix1wIItniUrHJjXgCrSi40SJXmkK7ByZSS5H9B4Bs
 MMsBUvKd7K58kBbl0/FfFNM1bl1gAUyG00ogdM6PAoz7e0HERBFdq/e7i/LBT4a30N+oH8XlEBp
 IAKNUefmI05GTQmYv+LjPKkzDd/OLyJ8MEzGoxXyfFPg==
X-Zone-Loop: 8aea3a39ae41bfed07e789345454f9576ff56d6f4821
x-campaign-type: default
x-transaction-id: 5b67da8b-c8b1-42b5-b1bf-08de250e2704
x-swg-uid: 01-7a2d0b22-da37-4573-8447-c27ca7094380
X-Mailer: Sweego
Message-ID:
 <1786980254.8631fc262581453bbf619ec5b2062170.1a01052c27d000c4f3@vates.tech>
x-swg-bid: 1786980254.8631fc262581453bbf619ec5b2062170.1a01052c27d000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 6/6] CI: run the riscv64 smoke test via QTB framework
 console-test
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <1786378215.8631fc262581453bbf619ec5b2062170.19fec705e62000e099@vates.tech>
References: <20260810155543.927954-1-baptiste.le-duc@vates.tech>
 <1786378215.8631fc262581453bbf619ec5b2062170.19fec705e62000e099@vates.tech>
Date: Mon, 17 Aug 2026 17:24:08 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786980253; l=5466;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=iiVmNSOS82JHHFiKvvn7jK2GS2U81E53XodF+7Mstfk=;
 b=Im9yeNErabqwmpR5ZhDe2y75BwleX2/kXwcC+7r/9p1UTGfQ4IYlF9GZ6YM+iAu+BhBROZ0I1
 6js18SWLgKhDvpuqwaiEXhVctsw6riUBQYlU54tiaBmHPv6OorfWyoW
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786980253755
X-purgate-ID: tlsNG-ef75cf/1786980256-366DAAE4-8F5DFC8D/0/0
X-purgate-type: clean
X-purgate-size: 5470

On 2026-08-10 18:09 +0200, Baptiste Le Duc wrote:

During an internal review, Zheng Zhang (zhangzheng@iscas.ac.cn) pointed
out that this patch series defines the qemu-9.0.0 in riscv64-test-needs
of test.yaml, whereas we should use the QEMU bundled in the
13-qtb-riscv64 container.

I will fix this in v2 by resolving qemu-system-riscv64 from $PATH, since the
test runs inside the 13-qtb-riscv64 container.

As a consequence, the OpenSBI path in `binaries` in config.yaml is no longer
needed either: qemu-system-riscv64 uses the firmware bundled with it.

> qemu-smoke-riscv64-gcc drove QEMU through
> automation/scripts/qemu-smoke-riscv64.sh, an expect wrapper whose machine
> description (cpus, memory, device tree, console wiring) lived in the script
> itself. The QTB framework now owns all of that: machines come from the
> shared catalog, expectations from the test type's own YAML.
> 
> Turn .qemu-riscv64 into a template running qemu_smoke_riscv64.py <type> run
> <test> in the qtb-riscv64 container, machine and test picked per job
> through QTB_TEST_TYPE/QTB_TEST. The container comes from the test-artifacts
> registry, hence the new ARTIFACTS_REGISTRY next to the existing
> ARTIFACTS_REPO/ARTIFACTS_BRANCH. QTB_BINARIES_DIR points at the artifacts
> of the job in the new .riscv64-test-needs anchor (QEMU and its firmware),
> and QTB_LOG_DIR collects the per-console logs, kept on failure and on
> success.
> 
> Point qemu-smoke-riscv64-gcc at that template, running the console-test
> type on dom0less-1smp-0domu-1vcpu-aplic-imsic-null: a Xen-only machine, so
> the smoke check is Xen's own "All set up" on console 0, the same string the
> expect script waited for.
> 
> Drop automation/scripts/qemu-smoke-riscv64.sh as it has no caller left in
> the CI after this patch and drop smoke.serial from the .qemu-riscv64
> artifacts since no riscv64 job uses it anymore, the logs are now kept under
> QTB_LOG_DIR.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
>  .gitlab-ci.yml                           |  3 +++
>  automation/gitlab-ci/test.yaml           | 26 ++++++++++++++++++------
>  automation/scripts/qemu-smoke-riscv64.sh | 19 -----------------
>  3 files changed, 23 insertions(+), 25 deletions(-)
>  delete mode 100755 automation/scripts/qemu-smoke-riscv64.sh
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f42a9abeaa..15f93b8634 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -11,6 +11,9 @@ variables:
>    ARTIFACTS_BRANCH:
>      description: "Branch in test-artifacts to use"
>      value: master
> +  ARTIFACTS_REGISTRY:
> +    description: "Registry holding the test-artifacts containers"
> +    value: registry.gitlab.com/xen-project/hardware/test-artifacts
>    LINUX_JOB_X86_64:
>      description: "Job name in test-artifacts to use for Linux x86_64"
>      value: linux-6.6.56-x86_64
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 61adc1baff..4775d2cc4e 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -5,6 +5,11 @@
>    - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
>      when: on_success
>  
> +.riscv64-test-needs: &riscv64-test-needs
> +  - project: $ARTIFACTS_REPO
> +    job: qemu-9.0.0-riscv64
> +    ref: $ARTIFACTS_BRANCH
> +
>  .arm64-test-needs: &arm64-test-needs
>    - project: $ARTIFACTS_REPO
>      job: $LINUX_JOB_ARM64
> @@ -72,14 +77,21 @@
>      TEST_TIMEOUT_OVERRIDE: 120
>  
>  .qemu-riscv64:
> +  image: ${ARTIFACTS_REGISTRY}/${CONTAINER}
>    extends: .test-jobs-common
>    variables:
> -    CONTAINER: debian:13-riscv64
> -    LOGFILE: qemu-smoke-riscv64.log
> +    CONTAINER: debian:13-qtb-riscv64
> +    QTB_LOG_DIR: qtb-logs
> +    QTB_BINARIES_DIR: ${CI_PROJECT_DIR}/binaries
> +  script:
> +    - ./automation/scripts/qemu_smoke_riscv64.py
> +      ${QTB_TEST_TYPE}
> +      run
> +      ${QTB_TEST}
> +      --log-dir ${QTB_LOG_DIR}
>    artifacts:
>      paths:
> -      - smoke.serial
> -      - '*.log'
> +      - ${QTB_LOG_DIR}
>      when: always
>    tags:
>      - x86_64
> @@ -779,9 +791,11 @@ qemu-xtf-argo-x86_64-gcc-debug:
>  
>  qemu-smoke-riscv64-gcc:
>    extends: .qemu-riscv64
> -  script:
> -    - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
> +  variables:
> +    QTB_TEST_TYPE: console-test
> +    QTB_TEST: dom0less-1smp-0domu-1vcpu-aplic-imsic-null
>    needs:
> +    - *riscv64-test-needs
>      - debian-13-riscv64-gcc-debug
>  
>  qemu-smoke-ppc64le-powernv9-gcc:
> diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
> deleted file mode 100755
> index c0b1082a08..0000000000
> --- a/automation/scripts/qemu-smoke-riscv64.sh
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -#!/bin/bash
> -
> -set -ex -o pipefail
> -
> -# Run the test
> -rm -f smoke.serial
> -
> -export TEST_CMD="qemu-system-riscv64 \
> -    -M virt,aia=aplic-imsic \
> -    -cpu rv64,svpbmt=on \
> -    -smp 1 \
> -    -nographic \
> -    -m 2g \
> -    -kernel binaries/xen"
> -
> -export TEST_LOG="smoke.serial"
> -export PASSED="All set up"
> -
> -./automation/scripts/console.exp |& sed 's/\r\+$//'
> 
> 
> -- 
> Baptiste Le Duc | Vates Hypervisor & Kernel Engineer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech



