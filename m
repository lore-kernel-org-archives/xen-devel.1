Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D13606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=NTT5m8qQ
Received: from list by lists.xenproject.org with outflank-mailman.1463017.1673994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM0ZL-0003mE-AB; Wed, 28 Oct 2026 10:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463017.1673994; Wed, 28 Oct 2026 10:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM0ZL-0003m7-7R; Wed, 28 Oct 2026 10:07:43 +0000
Received: by outflank-mailman (input) for mailman id 1463017;
 Wed, 28 Oct 2026 10:07:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a181fac390000f79f@swg.vates.tech>)
 id 1xM0ZK-0003lv-3G
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 10:07:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM0ZJ-00DDzV-CZ
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 11:07:41 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a181fac390000f79f@swg.vates.tech>)
 id 6ae1c969-2eae-0a2a0a5409dd-0a2a4508e85e-22
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 11:07:41 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a181fac390000f79f@swg.vates.tech>)
 id 6ae1c96c-f659-0a2a45080019-b9ff1c23b649-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 11:07:41 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a181fac390000f79f.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 28 Oct 2026 10:07:37 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9FA5880CA5;
 Wed, 28 Oct 2026 11:07:36 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=aXZ0OgsGv+lyuglQvC4NwIKQ1iGFp8a8FzIYFVBSUcI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=NTT5m8qQsOWngTI4SrDdTBwufXMxjkUuSSeGgx7Cp+GbVh1+/X5AD7vBCHVLCahc3UI+6kRg8
 IOZTJAT423nPT/qfge7QygTq76vbtGKIen7wFsSmxO8xEaVn7ImP+IZ8N093sNWBWe6RanOzoWo
 L88XfVpZSnnfr9YAC8H6LHYUbWzVKsZ5rsbGSvCQe5siYcDY6v2Ct8sxM//6YCnEb9Nc+yNENgM
 zMpBqfn0FtGq0He6La8zUS/Lg7uAkeV9KGFDCWw7T4cfjnLm3mXBHjxSPqkk327M7vXFUCDBrbB
 UrIQGn1IIlKeAV6JVF9ywAsV+oxiSvsJa0H/aI/KrvYQ==
X-Zone-Loop: d042846dfc815170d969b11751446ae6fe4b25dd575a
x-campaign-type: default
x-transaction-id: 41327007-6b19-4134-bc02-83aba752dbbe
x-swg-uid: 01-4a285e68-9181-459a-977a-3c1cca42c17f
X-Mailer: Sweego
Message-ID:
 <1793182057.8631fc262581453bbf619ec5b2062170.1a181fac390000f79f@vates.tech>
x-swg-bid: 1793182057.8631fc262581453bbf619ec5b2062170.1a181fac390000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Wed, 28 Oct 2026 11:07:36 +0100
From: Anthony PERARD <anthony.perard@vates.tech>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 6/6] CI: run the riscv64 smoke test via QTB framework
 console-test
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823789.8631fc262581453bbf619ec5b2062170.1a0429a155d000c4f3@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1787823789.8631fc262581453bbf619ec5b2062170.1a0429a155d000c4f3@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.27d.dda3b12fb4b579bc.1a181fac121.942cc93773c8d460=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793182056737
X-purgate-ID: tlsNG-c1860d/1793182061-CE34587B-9CCD96F9/0/0
X-purgate-type: clean
X-purgate-size: 2542
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.27d.dda3b12fb4b579bc.1a181fac121.942cc93773c8d460=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 11:42:52AM +0200, Baptiste Le Duc wrote:
> diff --git a/automation/gitlab-ci/test=2Eyaml b/automation/gitlab-ci/tes=
t=2Eyaml
> index 61adc1baff=2E=2Ee9dd147380 100644
> --- a/automation/gitlab-ci/test=2Eyaml
> +++ b/automation/gitlab-ci/test=2Eyaml
> @@ -72,14 +72,21 @@
>      TEST_TIMEOUT_OVERRIDE: 120
> =20
>  =2Eqemu-riscv64:

Could you rename that template? The name should contain "qtb" since that
the tool used by the test template=2E

> +  image: ${ARTIFACTS_REGISTRY}/${CONTAINER}
>    extends: =2Etest-jobs-common
>    variables:
> -    CONTAINER: debian:13-riscv64
> -    LOGFILE: qemu-smoke-riscv64=2Elog
> +    CONTAINER: debian:13-qtb-riscv64
> +    QTB_LOG_DIR: qtb-logs
> +    QTB_BINARIES_DIR: ${CI_PROJECT_DIR}/binaries

Instead of an envvar, this could be a parameter to the main script, like
--log-dir is=2E

> +  script:
> +    - =2E/automation/scripts/qemu_smoke_riscv64=2Epy
> +      ${QTB_TEST_TYPE}
> +      run
> +      ${QTB_TEST}
> +      --log-dir ${QTB_LOG_DIR}
>    artifacts:
>      paths:
> -      - smoke=2Eserial
> -      - '*=2Elog'
> +      - ${QTB_LOG_DIR}
>      when: always
>    tags:
>      - x86_64
> @@ -779,8 +786,9 @@ qemu-xtf-argo-x86_64-gcc-debug:
> =20
>  qemu-smoke-riscv64-gcc:

Same here=2E

> diff --git a/automation/scripts/qemu-smoke-riscv64=2Esh b/automation/scr=
ipts/qemu-smoke-riscv64=2Esh
> deleted file mode 100755
> index c0b1082a08=2E=2E0000000000
> --- a/automation/scripts/qemu-smoke-riscv64=2Esh
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -#!/bin/bash
> -
> -set -ex -o pipefail
> -
> -# Run the test
> -rm -f smoke=2Eserial
> -
> -export TEST_CMD=3D"qemu-system-riscv64 \
> -    -M virt,aia=3Daplic-imsic \
> -    -cpu rv64,svpbmt=3Don \
> -    -smp 1 \
> -    -nographic \
> -    -m 2g \
> -    -kernel binaries/xen"
> -
> -export TEST_LOG=3D"smoke=2Eserial"
> -export PASSED=3D"All set up"
> -
> -=2E/automation/scripts/console=2Eexp |& sed 's/\r\+$//'

I you want to remove the exiting riscv test, can you do so in a
separated patch? Then we can decide separatly if the new test is indeed
a replacement of the current one=2E

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.27d.dda3b12fb4b579bc.1a181fac121.942cc93773c8d460=---

