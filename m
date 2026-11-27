Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE24F606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lURjGK7A
Received: from list by lists.xenproject.org with outflank-mailman.1505010.1699990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvJ1-00011t-Fo; Fri, 27 Nov 2026 12:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505010.1699990; Fri, 27 Nov 2026 12:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvJ1-00011k-C4; Fri, 27 Nov 2026 12:43:59 +0000
Received: by outflank-mailman (input) for mailman id 1505010;
 Fri, 27 Nov 2026 12:43:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hfranco@baylibre.com>) id 1xWvIz-00011Y-R6
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 12:43:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWvIz-00BVbK-7L
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 13:43:57 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hfranco@baylibre.com>)
 id 6b097b06-8faa-0a2a0a5109dd-0a2a4503db4c-8
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 13:43:57 +0100
Received: from [209.85.217.42] (helo=mail-vs1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hfranco@baylibre.com>)
 id 6b097b0b-fae8-0a2a45030019-d155d92af074-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 13:43:56 +0100
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-7cc53938a8fso5567119137.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 04:43:56 -0800 (PST)
Received: from localhost ([2804:14c:4c5:8bf0:96eb:98f3:8775:4ebc])
 by smtp.gmail.com with UTF8SMTPSA id
 a1e0cc1a2514c-99e6e033aafsm24705679241.7.2026.11.27.04.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 04:43:54 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=baylibre.com header.i="@baylibre.com" header.h="In-Reply-To:Content-Disposition:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795783435; x=1796388235; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ziX2lGb4vLQ52l0pifSeIE3jsSzjI8Wb3oiF1rpsICs=;
        b=lURjGK7Ao4DrlYUKNQRdtetsPmKEPBw8shhfNtCYJfZWvg5g+zxGcp9BU4YY7h4Jdo
         z8Y2BaGqk0y31+4ojMOFn//1lmiNwfePDPJRL31Gv3uBd1DLmTjdYzGEsb2+y3cf9hrD
         +I7bFiAIUj/kZa+qR9DfX/lv5ElDMsFQfhw3oDzXauJbGcoaZJW/YDllKkBFidh8Wg7Z
         1GxMJmG7ulHArB/7Pudf6YUOK/jzcbnvPdNQHlQgcKsNcIeNPEs8TVp33KygOT4HBlUj
         u/xgAfT6LJhxoe2M44q+7bk2+UcWkR+9j5D9tnf3ViJuZL6WqhvX/CrF1kGaGuDeUUq3
         a7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783435; x=1796388235;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziX2lGb4vLQ52l0pifSeIE3jsSzjI8Wb3oiF1rpsICs=;
        b=2XeglWfgTjONllTrP1sEbhNw2DbaVR5hNCS6Q8uM8zOBVvNUzVPPSNGOVFlPzD08wa
         1vLuLJ69b6hNpjGCeWwG9QAFCm27IzGNgZUFivCXBO4LefIVLiOlQJxIkQfR9TnXdkAx
         PHAuK5/sM8lVdjQ1C6wTgaFKvjoXUjy8tojwof+v/uWKpA7tKWyXgZpaXYWYwuOHoFkH
         y6HCQu4+knSBrXO2Stije5TPsErXEXzltFUP8SLAS1AelsY+F5qE2/GOVuejIYv4nJos
         7ji0/Cj36+Vfv1uVpc+TAZFmXOuqxxZF473dEqhILyvpwx1281cG8LzTYgPjgWQVzpWQ
         T8Ng==
X-Gm-Message-State: APuU4Z9uerfeAojTGeSuQ3qKfEZ/eznwtcspfsH9k6aU7/GqAcrzlMy3
	sEZyFSiTYnp3DeMf9WVtd/lXwzxvLZAjQ0fEmLqIWZO2aJdJzKysl7t9Vxm0OD/6UoempNAJvMK
	3b5aX
X-Gm-Gg: AZFdTZcWs8bVyoEcDdqwyM4K9RODvOuf3UD4pfRkQwcDg3ayIcKG/kTRVK0qkbD9su/
	t+D4Pcwnx6kSAE9o01c3ebvjFISJAUiSRmOPWzncK1QBXP4yCkL3qcZzZ09dpd4cRBZc/jxF9bT
	eb64/ZeKETpplrMOfsyt1O1FqXWpDYFdqljZeICxkwLze0KnNrpsDfnBDsU0tj1d4yo4Ea5wpGW
	d4JrxF6phIf3TdGkHgrXVzke3HJPkIwS//93wY7rXV9OaG/ALNDyq7YqlKuzHiBUpjaha05olT7
	kh1tpSkCYEXoiNtPxXqct1cA9VTgJ6mt3YRtJntHEHXYcYH/Io79hvMF+f9BxexhlL12cCmetG8
	+Xsw8LuiiuzWUhu7JUynK33RR+si94oxN0MDh/nLBTt2E+ga6nQaJzm8qEpfee+pO0deDKLEHFI
	kuoDlHz0ldji2deByQqgysBsg3AomDOWBUXB9PHK0Ne1OiiNlTCLX+CINZ8EZlR8YiEDSFgVbtF
	gWJDtecsYnnxFSWwe3LkWC67kdI0XKMXQ57f2YJsO7yQYlCj6yE+JwAjpUp38MYnd7AM3hLeuGx
	kZkRaFgNSs6AQEWvX9KTjpggiDSp83kLfrlJxb8TlK7FUPZUhfIbAHvajcgZTm6I2DJQQbrT3oU
	sdgz8v0ULfJWWIKkZsu1GdRpJntekcA==
X-Received: by 2002:a05:6102:5043:b0:7d2:d9c0:2e96 with SMTP id ada2fe7eead31-7d73967a571mr15049804137.31.1795783434944;
        Fri, 27 Nov 2026 04:43:54 -0800 (PST)
Date: Fri, 27 Nov 2026 09:43:51 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
	Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>, 
	Zhang Zheng <zhangzheng@iscas.ac.cn>
Subject: Re: [PATCH v3 6/6] CI: drop the riscv64 expect-based smoke test
Message-ID: <l5svfrrmtdmyrtimpifvv3piley4g27njdqb65nii6s6remf5t@dm35o7yofrca>
References: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
 <1793714907.8631fc262581453bbf619ec5b2062170.1a1a1bd69c6000403d@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1793714907.8631fc262581453bbf619ec5b2062170.1a1a1bd69c6000403d@vates.tech>
X-purgate-ID: tlsNG-33051d/1795783436-758824E9-4A9FFAE2/0/0
X-purgate-type: clean
X-purgate-size: 2903
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 03:08:14PM +0100, Baptiste Le Duc wrote:
> qemu-smoke-qtb-riscv64-gcc boots Xen alone and waits for the same
> "All set up" string on Xen's console as qemu-smoke-riscv64-gcc, so the
> latter is redundant.
> 
> Drop qemu-smoke-riscv64-gcc, its .qemu-riscv64 template and
> automation/scripts/qemu-smoke-riscv64.sh, which has no caller left.
> 
> Kept as a separate patch so it can be deferred until the QTB job has
> proven itself.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Reviewed-by: Hiago De Franco <hfranco@baylibre.com>

> ---
> The debian:13-riscv64 container still installs qemu-system-riscv64 and
> expect for the test phase, although nothing tests in it anymore. As it
> needs a rebuild, dropping them is left to a follow-up if needed.
> ---
> Changes in v3:
> - New patch, split out of v2 "CI: run the riscv64 smoke test via QTB
>   framework console-test".
> ---
>  automation/gitlab-ci/test.yaml           | 20 --------------------
>  automation/scripts/qemu-smoke-riscv64.sh | 19 -------------------
>  2 files changed, 39 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index dcf75e4674..13f7ddfc7b 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -71,19 +71,6 @@
>    variables:
>      TEST_TIMEOUT_OVERRIDE: 120
>  
> -.qemu-riscv64:
> -  extends: .test-jobs-common
> -  variables:
> -    CONTAINER: debian:13-riscv64
> -    LOGFILE: qemu-smoke-riscv64.log
> -  artifacts:
> -    paths:
> -      - smoke.serial
> -      - '*.log'
> -    when: always
> -  tags:
> -    - x86_64
> -
>  .qemu-qtb-riscv64:
>    extends: .test-jobs-common
>    variables:
> @@ -805,13 +792,6 @@ qemu-xtf-argo-x86_64-gcc-debug:
>    needs:
>      - alpine-3.24-x86_64-gcc-debug
>  
> -qemu-smoke-riscv64-gcc:
> -  extends: .qemu-riscv64
> -  script:
> -    - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
> -  needs:
> -    - debian-13-riscv64-gcc-debug
> -
>  qemu-smoke-qtb-riscv64-gcc:
>    extends: .qemu-qtb-riscv64
>    variables:
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
> -- 
> 2.56.0
> 
> 

-- 
Hiago

