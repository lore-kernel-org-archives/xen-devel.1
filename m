Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B002C88E77
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 20:30:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422085.1647656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6Zms-00030h-IX; Tue, 15 Sep 2026 20:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422085.1647656; Tue, 15 Sep 2026 20:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6Zms-00030a-FZ; Tue, 15 Sep 2026 20:29:54 +0000
Received: by outflank-mailman (input) for mailman id 1422085;
 Tue, 15 Sep 2026 20:29:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0a6c2e2a000072c4@swg.vates.tech>)
 id 1x6Zmq-00030U-5c
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 20:29:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6Zmn-003bMQ-TI
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 22:29:49 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0a6c2e2a000072c4@swg.vates.tech>)
 id 6aa9aaa7-bab6-0a2a0a5309dd-0a2a4507ab20-14
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 22:29:49 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0a6c2e2a000072c4@swg.vates.tech>)
 id 6aa9aabd-b4ea-0a2a45070019-b9ff1c12a9c7-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 22:29:49 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0a6c2e2a000072c4.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 15 Sep 2026 20:29:44 +0000
Received: from [172.20.10.2] (155.89.66.37.rev.sfr.net [37.66.89.155])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id E4D3681FCC;
 Tue, 15 Sep 2026 22:29:43 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=9vXBUfxgjPFp3KmZ37GOIdI1MCaV70rvftemLG1fgbY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=X1nw4nOoqDObMXjk3AvMkJOGYInTC/bvukQR/YDkj8iszXYF3HoPe09fhN9A97zOWMNK76B0K
 3YKfdJRoa2ntGTU5Y6c4OK5QRdLrTBp6axatLXGnMFHN+2UixfNYTq1U/86z/4imucXELwjOPRK
 BevCOGnkGpFuTOpqcicb6HDTFimNOjLcIT40/FtBD6mtpv5i9mm0WvSddlqSf635ddl92iC2/H2
 DqxuBLlJZu9zzRlMdrnkCw6RTLfEOcFBC7xJ3l6y6zNvRGwaMaNrG1Eho3rX1hGlr40NkjWP9as
 yn0Qg90aaZ28rGHCjw9lo1RbsYHfVdfsPPZBRS6fiZFg==
X-Zone-Loop: 15c720a56699ee382656ff14473537110d73d1d216b4
x-campaign-type: default
x-transaction-id: 98e19032-3a67-4cc8-a3dc-0bc06e6ad841
x-swg-uid: 01-00f0ce25-2e75-42d4-bd56-72852f229583
X-Mailer: Sweego
Message-ID:
 <1789504185.8631fc262581453bbf619ec5b2062170.1a0a6c2e2a000072c4@vates.tech>
x-swg-bid: 1789504185.8631fc262581453bbf619ec5b2062170.1a0a6c2e2a000072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 15 Sep 2026 22:29:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] CI: run the riscv64 smoke test via QTB framework
 console-test
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, zhangzheng@iscas.ac.cn,
 alejandro.garciavallejo@amd.com
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <20260827094301.338069-6-baptiste.le-duc@vates.tech>
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Content-Language: en-US
Autocrypt: addr=baptiste.le-duc@vates.tech; keydata=
 xsBNBGoPSX8BCADSuTikqW3FD4mscQugY1thRaKlIhcJ2G9YCWYXAlp+xosvTlzfIftOZZim
 750MLvyKtLPkQzB6TZtFZBiexSraaF/MdDKRTT5DcVa3r7ZnHgqMclWlPa4ioysS4yFcJanL
 cyNOT7HUFvIdirMMqiViedfYtS0GORPBBPVISD6ClMz3ecHIxqllfq9CHYQn4amKEfHmh6tm
 Rufo4Gjl6x8cUFZZlRQf+aCmUzdSPA0P5u3sueYH1uEz4w/jbD53MlKqzCvxUeOsfS2swTQA
 6mS9jIgOjNadpUTOzKfDHMgFirtG+HFpm45Nwp6KQizxgDVOfTnOfVHm5Gwqm3ETl9y5ABEB
 AAHNPEJhcHRpc3RlIExlIER1YyAoVmF0ZXMgWXViaWtleSkgPGJhcHRpc3RlLmxlLWR1Y0B2
 YXRlcy50ZWNoPsLAjgQTAQoAOBYhBGiSJ6HgW88MgT/gfu2Cu2XL9M6QBQJqD0l/AhsDBQsJ
 CAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEO2Cu2XL9M6QuMcH/ihiy/Nrxp919AmY0ENnc0NK
 r/2LDvW/hrX4FfbpxAmrGmQ7MU1aQTk0JDbfcsG8OYH6wO5sqnXb1gz50YrEdpfVSbHz5YTZ
 EhDIxE4g7NrvJZh3Qc0m0CAyjYTNHen7J6olVaCMjrOH7uRHUYZ7Pl3am9mZosfLmez/aWJO
 a6ihQxBXHI75brlk1teIURkep2kP7P0Flmfl4cA//saREoTF7GXCtjOSQk/xg8PP0Sswqp5G
 TdJptn3FQn6lAzfz0eFSYqkaoX2c2k1MDa7o+UX9cfGPL8ybMKnYkasLxck6eOWGJWf+YTrm
 ga/r0kBaftmqNDgt5nI2jNTDwZcT9g3OwE0Eag9JfwEIAM6IWbuBSvz+erv27oGDDpo8M6Fp
 dGUvft7v+WceHUfxiXpYFx9qgIU6XGy6y+3lJMAvNcltS8DuhioqMlfKRSYGKZlpliY65dNP
 557IuM4ctVJ+I9CVclvv9eahARQKgF5auLJAAlvGSmU+ufNvlwTUmLIRcrPviTmB6X5jJYc+
 fiNeyI0HcsgcN21C0r62tUCypuZ+vgEJXw2bx1V8mVGZKxdGJPh58QF6kRK+xmd4kEComLGV
 BeM6BcVOtEjDcGNC0tLhXb0p9g1Ys55iA8sd6s4WacyolW2J6rwmcOkjiWexWw1caYgIWAV1
 004M3gwUaOz0dGq2i7HQ0AiVfVkAEQEAAcLAdgQYAQoAIBYhBGiSJ6HgW88MgT/gfu2Cu2XL
 9M6QBQJqD0l/AhsMAAoJEO2Cu2XL9M6QovYH/RjstyL5o/V5K74ylBtz0j5t3pLX5JKbwApi
 656rGgDdqElImyvvZppNMl/mgHNzvxmfFAhJXnSX9f1fqVEQKOGEhLUastnl/ssBiE5x7btM
 V0GAffxXbXJZbVv4b/DI+gVrOPc2YXlVwruapvTZNtD3hqPrkjrmq5WTtGR2loIVSe62hmh0
 BGD2Fy79b/hYWyBqhayPBEjwGW75u4/yn+Yqy1PgG3hIcvg7GSuT3akhHZSB2Mbguzcoyf9Q
 DJl6t33JxPRkkNrEdkPPmRlQCTSiUkVjKqMDF3jlINWsJ5t4jKFsNF91ksdw7aQgiX+tQIpE
 ugMC1NuNi5dDGip66bw=
In-Reply-To: <20260827094301.338069-6-baptiste.le-duc@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789504184416
X-purgate-ID: tlsNG-ef75cf/1789504189-A50CDAE4-0D15E59F/0/0
X-purgate-type: clean
X-purgate-size: 4441

Ping

On 8/27/26 11:43 AM, Baptiste Le Duc wrote:
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
> of the job (Xen only currently, but aims to have initrd and linux images
> when dom0less will be supported). QTB_LOG_DIR collects the per-console
> logs, kept on failure and on success.
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
>   .gitlab-ci.yml                           |  3 +++
>   automation/gitlab-ci/test.yaml           | 20 ++++++++++++++------
>   automation/scripts/qemu-smoke-riscv64.sh | 19 -------------------
>   3 files changed, 17 insertions(+), 25 deletions(-)
>   delete mode 100755 automation/scripts/qemu-smoke-riscv64.sh
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f42a9abeaa..15f93b8634 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -11,6 +11,9 @@ variables:
>     ARTIFACTS_BRANCH:
>       description: "Branch in test-artifacts to use"
>       value: master
> +  ARTIFACTS_REGISTRY:
> +    description: "Registry holding the test-artifacts containers"
> +    value: registry.gitlab.com/xen-project/hardware/test-artifacts
>     LINUX_JOB_X86_64:
>       description: "Job name in test-artifacts to use for Linux x86_64"
>       value: linux-6.6.56-x86_64
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 61adc1baff..e9dd147380 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -72,14 +72,21 @@
>       TEST_TIMEOUT_OVERRIDE: 120
>   
>   .qemu-riscv64:
> +  image: ${ARTIFACTS_REGISTRY}/${CONTAINER}
>     extends: .test-jobs-common
>     variables:
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
>     artifacts:
>       paths:
> -      - smoke.serial
> -      - '*.log'
> +      - ${QTB_LOG_DIR}
>       when: always
>     tags:
>       - x86_64
> @@ -779,8 +786,9 @@ qemu-xtf-argo-x86_64-gcc-debug:
>   
>   qemu-smoke-riscv64-gcc:
>     extends: .qemu-riscv64
> -  script:
> -    - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
> +  variables:
> +    QTB_TEST_TYPE: console-test
> +    QTB_TEST: dom0less-1smp-0domu-1vcpu-aplic-imsic-null
>     needs:
>       - debian-13-riscv64-gcc-debug
>   
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


