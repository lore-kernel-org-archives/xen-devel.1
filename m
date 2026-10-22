Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FDF606A32E
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 13:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZB2vDHHi
Received: from list by lists.xenproject.org with outflank-mailman.1458177.1670598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJsqN-0003kJ-HP; Thu, 22 Oct 2026 13:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458177.1670598; Thu, 22 Oct 2026 13:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJsqN-0003kB-D3; Thu, 22 Oct 2026 13:28:31 +0000
Received: by outflank-mailman (input) for mailman id 1458177;
 Thu, 22 Oct 2026 13:28:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xJsqM-0003k5-4V
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 13:28:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJsqL-00C248-6O
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 15:28:29 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ada0f7c-bab6-0a2a0a5309dd-0a2a450b9212-2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 15:28:29 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ada0f7d-b7e8-0a2a450b0019-d1558035b4ae-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 15:28:29 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a20c923847so3076805e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 06:28:29 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e258426f4sm12389209f8f.54.2026.10.22.06.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 06:28:27 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675708; x=1793280508; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qg7BHB5v9FDWAlFgYoBtMVRo7WwT7dQ4n8Bi+JAvx9k=;
        b=ZB2vDHHiPKMZA0rjtAIGdU1TMbRWwE2FEiG6XQ894oXFUp5PwskgSxsdJ9MKIShJeo
         A3LqEkQ2dzxUVeTG+ZrvrSWpC7bvt1unEdq/0DodE3xnSn4INcBm4mu8d7avm0rebHMU
         Xwxhyybfi4XZ452Xp1zcrhRSsqGUeuC0GHLuo5ic5K3cTkguSy53YpkmgNwu1rJicGij
         VLA0pZVGXBSi7WDlpptcP6dCeW23UnT5sEkjxyImy38Uqd/oW523pYJVQjDBSMD8BrtG
         zD3+Zym2ZhwzbD3G0LpB1o03ztjjWsJM3/SqB2Mq6kSHeVCnfhUvdgUytiGieJo85XWW
         myQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675708; x=1793280508;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qg7BHB5v9FDWAlFgYoBtMVRo7WwT7dQ4n8Bi+JAvx9k=;
        b=AIuEpExUF3G/A5H1ASPJsCzIcICtC/FLP5fKB7X+7eUttoDI8iiVSnle5f9sW1YTYV
         JQO4HYgaEJl62jKG2bk44NkEGC+czMlM6V9POLOzbcnucPXhNOtpImwfLIYF7j9ZdRJd
         IiQkbagnWKkTuqP8GWMUv91Bm1vrhYL9s8pWsut1VRrKeFF6w1Khv+yk8BJx6JBR38hX
         w1SDnTG9VrWSwqEigTorKgQS+7mAkY1A3+LHETucXQjSNUJOTkCyRi1tc2fhHnEbcga+
         7QY9CExuGkaL0zBQlQ/pDCQbTB7aye4fYgcb2lcZDRIivdWjdlQIy2Kcw4kw2bpBdlHx
         2law==
X-Forwarded-Encrypted: i=1; AKwUvBwVPdc9q9kTLzZSlKvniz3lAhq5ywOli9BIHbUKVqWgvxjF5XrXCPRymWh0EldhHOZHrB0YqoP2/4A=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLe2kF8mpG0Q1mzVCx5VyS5GQ6KIyXFRhCMe/e+hNAmrrYCeBc8
	ErPXt3zIy80PX33xSCxKeEauP9HPfIFPlYlNlIGLE+IKdyqyoyepTol1I382yQ==
X-Gm-Gg: AYBFou24Q/1iIN9xirVQjFkp0SZcf3aEJBp6JpEu6Y3AG8QTYmMJjh2WRnqJqGKaBMA
	4bN179e1SNi+nYtrfaG50HayvNEGK+NQZY1ZrzoxovTS3j3XyX3L41T9AfeEC304HXrYnYd6hx4
	4PjnkN3dhNHMUnNLiXQ28jutYGC+Uhw3Q6/1Q+Gt9/8yflCqmQxkiUXu8qxDOyRTI3P5p1DFvQl
	Amsoh9o13WQNz6hZnL20RbbB52NawwMk1kx0wALBvTR5H3q0zp+5z0dxYOBCI/PuFZVLqWoV5N1
	O7iIAlrcspPE7di0yDNukG5Stn8vCq+tW+uv5DXNz5iRnqsnjotNsjd/3lvwBTUG9xvIJV3ECog
	zie436iAbFm7/6eoGTROdAmmZqVgpuVwMJQw92Wyw3UdgWlboHgELGboGWqXmnpY6K+Bxk+2dSt
	rQOxNlGXVLB7zurPSDACnLKQu0rg3qDb0mu22UGt9o4xPHzSpZr8Le0PPQjD4uTUrwbbTmxg7BV
	W9OU09CyobtxdN0hHCf5KgdhC7Gt22LaW7YD9jgk7Lda/dqGfeXXPCV1lF4xGtxdJcS9h8w2pZp
	raWffBRy8sjY1NLgsCGUJnQH6vAm
X-Received: by 2002:a05:600c:b86:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4a1fdd2fa6cmr111360115e9.14.1792675708355;
        Thu, 22 Oct 2026 06:28:28 -0700 (PDT)
Message-ID: <846f2ec6-da73-4f12-b46f-5e9f841e35ad@gmail.com>
Date: Thu, 22 Oct 2026 15:28:26 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] Add a QTB container to run the Xen riscv64 tests
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823787.8631fc262581453bbf619ec5b2062170.1a0429a0db7000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1787823787.8631fc262581453bbf619ec5b2062170.1a0429a0db7000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1792675709-2C59A9EA-A439C875/10/63158204843
X-purgate-type: spam
X-purgate-size: 5692
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 8/27/26 11:42 AM, Baptiste Le Duc wrote:
> QTB (QEMU Test Bench) is a Python framework, developed as part of AMD's Xen
> safety initiative, that drives a live QEMU instance over qtest and QMP. It
> gives a test full access to the machine while the emulation runs: read and
> write the consoles, inspect the registers and the memory, inject interrupts.
> 
> For now the riscv64 CI tests only use it to read the Xen console in the
> smoke test, since DomU is not supported yet. Once it is, the same
> framework will read and write the DomU consoles and inject IRQs, so the
> tests can assert an interrupt reaches the expected guest and vCPU.
> 
> QTB is not upstream in QEMU yet, though it is planned to be, so get the
> framework from AMD's fork gitlab.com/xen-project/people/amd/qemu and
> pip-installs qemu.qtb from it.

s/pip-installs/pip-install/

It would also be good to say explicitly that only the Python package
comes from the fork, while the emulator itself is Debian's
qemu-system-riscv64.

> 
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
>   containerize                            |  1 +
>   images/debian/13-qtb-riscv64.dockerfile | 45 +++++++++++++++++++++++++

This is more a question for the CI maintainers: should this container
live in test-artifacts at all?

So far test-artifacts only holds containers for building its own
artifacts (kernels, rootfs, microcode), which xen.git then pulls in via
cross-project needs:. The containers the xen.git test jobs run in,
including debian:13-riscv64, which already carries
qemu-system-riscv64 for the test phase, and the hardware runner ones,
are all built from automation/build/ in xen.git and pulled from
XEN_REGISTRY.

Having it as automation/build/debian/13-qtb-riscv64.dockerfile in
xen.git would keep the container next to its only user, avoid the new
ARTIFACTS_REGISTRY variable and the image: override in patch 6, and
drop the "must land first" ordering between two repositories.

>   2 files changed, 46 insertions(+)
>   create mode 100644 images/debian/13-qtb-riscv64.dockerfile
> 
> diff --git a/containerize b/containerize
> index dad9afa..477b670 100755
> --- a/containerize
> +++ b/containerize
> @@ -31,6 +31,7 @@ case "_${CONTAINER}" in
>       _alpine-3.24-arm64-base) CONTAINER="${BASE}/alpine:3.24-arm64-base" ;;
>       _alpine-3.24-arm64-build) CONTAINER="${BASE}/alpine:3.24-arm64-build" ;;
>       _alpine-3.24-x86_64-base) CONTAINER="${BASE}/alpine:3.24-x86_64-base" ;;
> +    _debian-13-qtb-riscv64) CONTAINER="${BASE}/debian:13-qtb-riscv64" ;;
>       _alpine-3.24-x86_64-build|_) CONTAINER="${BASE}/alpine:3.24-x86_64-build" ;;

It seems like these lines are sorted/grouped by architecture name. So I 
think it will be better to put _debian-13-qtb-riscv64 here.


>   esac
>   
> diff --git a/images/debian/13-qtb-riscv64.dockerfile b/images/debian/13-qtb-riscv64.dockerfile
> new file mode 100644
> index 0000000..86215d3
> --- /dev/null
> +++ b/images/debian/13-qtb-riscv64.dockerfile
> @@ -0,0 +1,45 @@
> +# syntax=docker/dockerfile:1
> +FROM --platform=linux/amd64 debian:trixie-slim
> +LABEL maintainer.name="The Xen Project"
> +LABEL maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +
> +ARG QEMU_REPO=https://gitlab.com/xen-project/people/amd/qemu.git
> +ARG QEMU_COMMIT=24cd7e5c0d7e4db8e651f091d0b9da2e7c58dbab
> +

This commit is currently the tip of the 'safety' branch, and no tag
points to it. If that branch gets rebased, the commit may become
unreachable and the container will no longer rebuild. Could a tag be
created for it in the fork?

> +RUN <<EOF
> +#!/bin/bash
> +    set -eu
> +
> +    useradd --create-home user
> +
> +    apt-get update
> +
> +    DEPS=(# Base environment
> +        ca-certificates
> +        device-tree-compiler
> +        git
> +        python3-jinja2
> +        python3-minimal
> +        python3-pip
> +        python3-yaml
> +
> +        # Qemu for test phase
> +        qemu-system-riscv64
> +    )
> +
> +    apt-get -y --no-install-recommends install "${DEPS[@]}"
> +
> +    # QTB framework
> +    git init /tmp/qemu
> +    git -C /tmp/qemu fetch --depth 1 "$QEMU_REPO" "$QEMU_COMMIT"
> +    git -C /tmp/qemu checkout FETCH_HEAD
> +    pip install --break-system-packages /tmp/qemu/python[qtb]

Please quote the argument: unquoted, /tmp/qemu/python[qtb] is a glob
matching /tmp/qemu/python{q,t,b}, and it works only because none of
them exists.

Also, this fetches qemu.qmp, pexpect, pygdbmi and ptyprocess from PyPI
with only lower bounds, so the result depends on when the container is
built: building it now installs qemu.qmp 0.0.6, while the fork ships
0.0.5. The fork already bundles wheels for all of the [qtb]
dependencies in python/wheels/, so they can be installed offline. I've
checked that the following works, with python3-setuptools added to
DEPS:

     pip install --break-system-packages --no-index --no-build-isolation \
         --find-links /tmp/qemu/python/wheels "/tmp/qemu/python[qtb]"

Minor: python3-pytest isn't installed, so the unit tests from patch 4
can't be run in this container, although the README asks only for
"the prerequisites above plus pytest". It would be convenient to have
it here.

FWIW, I've built the container and run the smoke test from this series
in it against a locally built riscv64 Xen (console-test run
dom0less-1smp-0domu-1vcpu-aplic-imsic-null): it passes.

~ Oleksii

> +
> +    rm -rf /tmp/qemu
> +    rm -rf /var/lib/apt/lists/*
> +EOF
> +
> +USER user
> +WORKDIR /build


