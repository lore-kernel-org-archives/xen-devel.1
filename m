Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D8A606A32A
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 12:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=J9KJwhoN
Received: from list by lists.xenproject.org with outflank-mailman.1505001.1699980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvII-0000Yy-7b; Fri, 27 Nov 2026 12:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505001.1699980; Fri, 27 Nov 2026 12:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvII-0000Yr-4b; Fri, 27 Nov 2026 12:43:14 +0000
Received: by outflank-mailman (input) for mailman id 1505001;
 Fri, 27 Nov 2026 12:43:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hfranco@baylibre.com>) id 1xWvIG-0000Yc-FL
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 12:43:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWvIF-001OHF-Rp
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 13:43:11 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hfranco@baylibre.com>)
 id 6b097ada-8faa-0a2a0a5109dd-0a2a4509e1e2-18
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 13:43:11 +0100
Received: from [209.85.222.53] (helo=mail-ua1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hfranco@baylibre.com>)
 id 6b097ade-be1a-0a2a45090019-d155de35e56a-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 13:43:11 +0100
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-98c7798ce74so2226367241.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 04:43:11 -0800 (PST)
Received: from localhost ([2804:14c:4c5:8bf0:96eb:98f3:8775:4ebc])
 by smtp.gmail.com with UTF8SMTPSA id
 ada2fe7eead31-7d6e81cee49sm25709956137.8.2026.11.27.04.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 04:43:09 -0800 (PST)
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
        d=baylibre.com; s=google; t=1795783390; x=1796388190; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4sqd47Bv5ETj4koyQeAyB/SUgctqaKPP0ZHucGdu5KA=;
        b=J9KJwhoNkvib19ciFjVxEBP+/PJpTDkJoY5o75vC80qFsN1v9OkTcswWliEkwK9jfu
         4H5hIKY1t/3EZQEUkTG3xft7hSiXQTlOgi3+djE4GCyVYtNyIxb1r4juSxiahOT/DPYI
         sFoQMlmPQkRGKWR8vBd2DfFHiHleYqjoVFb1NL0v0IokiQ/agkpx1sSr20WNDxksS20G
         /alb6N8qmz/URJWfNdpAhHF9DoYWzvpWE8e9sfHWa0JJolbWmzcWNte5+2XazM3TgzKi
         Jx6d4gGgUloDwzJMXiuARCxO3avfAmAyfgIQc4mTAavboA5NEPg4s/zyCNe1Lw+oEd5g
         ubAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783390; x=1796388190;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4sqd47Bv5ETj4koyQeAyB/SUgctqaKPP0ZHucGdu5KA=;
        b=2sYb0m1YK6SMGH+1XZkCfEbcU8fF/ULMPVXd0popMRxnBdDI6Q36wmeysnUIYpQVD9
         Lox7C95czyFJ3X995zB7HCq9La5e7kPhBBohQfbGuiz8iVq5yvII+IP053fKI2cU7Td9
         1HSsU2c4WpciNSx5aBvAUeV4M0lyW4YCPYDKK1M/j5h61ls+t2uz6FPqh/s54rG3uAST
         z0f3MutQzEHCYHpWpbbgOrhWkDEgdwWTNELW7QDxHDDQ4YG/6baD4x7Iq/8X533Zobuz
         KLd25uGGuyolcSVF6QfO+IFS5fdJQA8rhebfXu/ClvjnBCYAD8xnG3akbYtWGY8kKwOd
         2KSw==
X-Gm-Message-State: APuU4Z+WjVCMg5KjSZ6Ru7F9cRiTJ41edKlsIhsIDtuOm1/ozGdIBpB9
	sT8xiY3NP51QK8NEmGqHWqRtAqCfeAgI6K1ZfD0EYAZZBmRRWzSY3rZMqhtf2mTXhfV/i1037ux
	vobkF
X-Gm-Gg: AZFdTZfIHLmzxTRFXgVoj8vxEhQSl8Q5mbPu+SftjqkxsKVyTFGDJPze72oYAugO9ra
	sEQ5DttxlCP8i1lmEFHxsaaRpNiLIH8pCNwYiv/LytXZm6fBKGaZRJYWJD7Zw/U8zOqHANRA61E
	T7yNhkO+0gI4/znMoNP3gfldMnkyuGq81d/DcZFyA6BCIGe0mqGzo3JMp4XIq2VIrYYm1jvK632
	Ue9/pKZvV7e39+UM6fO5Wgp2TyLZlneMqf1NCmwVpKCwIzZiLekTg3Ppr8DtKD65vuXQMcrlP63
	AltcfP4+KrYQvd7YPK9JZjmITiPwYKpC8uevXzRDVhvbRmkVXM6OPB6JCkSUJo239WNc5ryTLTV
	li9dM195RdRxJCCR45Me4uX82ynd9S4Fsp2Ff1IfCe3+yfEZm7SKpIqTLMZH17sLLOfxmqi/g/9
	/gt1G3C1PNjtEeG97HKj5liw/UFRrCRPxH1hKZUmiuEaZxL/v5NPLH9da/6A8K938QqDkn5GmRK
	qRnRejGnGqy5qqh5BORsVXn8dFzFuinNKh+juCYTYKCCvnNSqouvj5RavH7WBtaoj+jZ/INrVpO
	MLpyE92VQDE4WQL2IyJRSJEZEoR+Iy8ZTfEnIGFFQ32ueAhTcdfnBUZ1flHo9UpyUdAUAhdX3MU
	+loy6Gv4X
X-Received: by 2002:a05:6102:4414:b0:7c3:68c9:d24b with SMTP id ada2fe7eead31-7d739459e90mr11025744137.17.1795783389984;
        Fri, 27 Nov 2026 04:43:09 -0800 (PST)
Date: Fri, 27 Nov 2026 09:43:07 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
	Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>, 
	Zhang Zheng <zhangzheng@iscas.ac.cn>
Subject: Re: [PATCH v3 5/6] CI: add a riscv64 smoke test job using the QTB
 console-test
Message-ID: <ze5mdn4bfgup3232nfocnu3qc4pyibjmjhgu4xj5x773wn6eh4@6xfxompnwcmo>
References: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
 <1793714907.8631fc262581453bbf619ec5b2062170.1a1a1bd68c1000403d@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1793714907.8631fc262581453bbf619ec5b2062170.1a1a1bd68c1000403d@vates.tech>
X-purgate-ID: tlsNG-bad1c0/1795783391-BC4CB034-D8577685/0/0
X-purgate-type: clean
X-purgate-size: 2634
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 03:08:13PM +0100, Baptiste Le Duc wrote:
> Add QTB console-test in CI next to the existing qemu-smoke-riscv64-gcc
> job, which is left unchanged.
> 
> Add .qemu-qtb-riscv64, a template running the pytest module named by
> QTB_TEST in the debian:13-riscv64-qtb container. --binaries-dir points
> at the artifacts of the job, Xen from the build job. The per-test logs
> are collected under qtb-logs, kept on failure and on success, and the
> JUnit report is uploaded so GitLab shows per-test results.
> 
> Add qemu-smoke-qtb-riscv64-gcc job on top of it, running test_console.py:
> its test boots Xen alone on one pCPU and waits for "All set up" on
> Xen's console, the same string as the existing qemu-smoke-riscv64-gcc.
> 
> Both jobs use Debian's QEMU and its bundled OpenSBI.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Reviewed-by: Hiago De Franco <hfranco@baylibre.com>

> ---
> Changes in v3:
> - Add the QTB job next to qemu-smoke-riscv64-gcc instead of replacing it,
>   the drop moves to its own patch.
> - Rename the template and job with "qtb".
> - Run pytest and upload its JUnit report.
> - Use the container from xen.git, drop ARTIFACTS_REGISTRY.
> ---
>  automation/gitlab-ci/test.yaml | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 96127995d7..dcf75e4674 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -84,6 +84,26 @@
>    tags:
>      - x86_64
>  
> +.qemu-qtb-riscv64:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: debian:13-riscv64-qtb
> +  script:
> +    - python3 -m pytest
> +      "automation/scripts/qtb/riscv/tests/${QTB_TEST}"
> +      -p no:cacheprovider
> +      --log-dir qtb-logs
> +      --binaries-dir "${CI_PROJECT_DIR}/binaries"
> +      --junitxml tests-junit.xml
> +  artifacts:
> +    paths:
> +      - qtb-logs
> +    reports:
> +      junit: tests-junit.xml
> +    when: always
> +  tags:
> +    - x86_64
> +
>  .qemu-ppc64le:
>    extends: .test-jobs-common
>    variables:
> @@ -792,6 +812,13 @@ qemu-smoke-riscv64-gcc:
>    needs:
>      - debian-13-riscv64-gcc-debug
>  
> +qemu-smoke-qtb-riscv64-gcc:
> +  extends: .qemu-qtb-riscv64
> +  variables:
> +    QTB_TEST: test_console.py
> +  needs:
> +    - debian-13-riscv64-gcc-debug
> +
>  qemu-smoke-ppc64le-powernv9-gcc:
>    extends: .qemu-ppc64le
>    script:
> 
> -- 
> 2.56.0
> 
> 

-- 
Hiago

