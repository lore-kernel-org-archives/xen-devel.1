Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5D7606A33A
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 11:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ud/qdSgN
Received: from list by lists.xenproject.org with outflank-mailman.1496094.1694739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU01T-00048H-DW; Thu, 19 Nov 2026 11:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496094.1694739; Thu, 19 Nov 2026 11:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU01T-000489-A0; Thu, 19 Nov 2026 11:09:47 +0000
Received: by outflank-mailman (input) for mailman id 1496094;
 Thu, 19 Nov 2026 11:09:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xU01S-000482-Cl
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 11:09:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU01R-000JQZ-E2
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:09:45 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afed8ea-2eae-0a2a0a5409dd-0a2a450ce84a-38
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:09:45 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afed8f9-f479-0a2a450c0019-d155802bb9ba-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:09:45 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4bb6886d30aso18870795e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 03:09:45 -0800 (PST)
Received: from ?IPV6:2a01:cb15:80c6:e800:d2ca:523:c712:18a6?
 (2a01cb1580c6e800d2ca0523c71218a6.ipv6.abo.wanadoo.fr.
 [2a01:cb15:80c6:e800:d2ca:523:c712:18a6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8538b09bsm50463665e9.4.2026.11.19.03.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 03:09:44 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795086585; x=1795691385; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kgd7tljBbSyJljch8P3A/KuRX44rni7MNKcH1t48G8=;
        b=Ud/qdSgNr25YZBQMW4/dQDWA3wKnNxJDzeSJOtoWIiEqIaunQ5oabIv3dFbzRVGCR2
         8hHMR9K2BRVMphGb0MJibyBhu/O8AGc1bPEj9OqBh6Dd/yTFPgSmiwFpK/OItl+qWxjd
         AK0UqFhqoPMicrezo22rW/huk/GDw/0x48M5alMt+V/pnd73Ga2yavUU8IGxVF99WgOk
         BMyAc/5NXI1/08p8ZFeaDocKmh1h9aklB3QmWFOWVjC3qpaeK9k0Z5PG894Bus2wubZo
         MO6auAGvREdGt/fX8NTUIc+y3mNZiCQI9xEPNG6RN43USI757qgAfspfNJJVm6aHjVx8
         WbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795086585; x=1795691385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4kgd7tljBbSyJljch8P3A/KuRX44rni7MNKcH1t48G8=;
        b=22FbGk7VNv5GxuHMrZ1ezZkn0mpkBEfxU3wAvqeanone5mpbpOs8x8My5e2Q3gfYlE
         Gf1FV+7xHxbNKXk5iEj29s/o71jhS10c1J91FQwR+soav9PVk132Jgbd9rbyZLvxiKH1
         ntwU1+EqVauGsznRRIe6ieL+ho+ugbegL1cBChUGCakYdDHSW5mUsRxhKRhlsy0+/At6
         +WzoUx2kNKm+OFCX2+RM7ViziquEkdqYLaYNnDPFqGN8UNBZ+qbAuZSTkPX8T17EhxkA
         TeBeacBRW3g/G3piWuYvPbZpoFjT1visprsSp+ipec8o7rJGbRfaOIBXgmToRKvmu30m
         Y+ng==
X-Forwarded-Encrypted: i=1; AL+hErGqOsqtzll0uXLD4RpOViwgm8sda2zlZGDER7zPU2yAWnl+6x0rjVdY01jAx0hZejGEBTvobLipBgI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/QS5awRUsb6qsLmx5oQBnc2e8SXMIBZHZrfzZ2JA229ZJ8k3p6
	4tTMx08jRKqmgR4EAjFq94B7BiAkMrVaw4bjKXbPfC1RohgU4TDRRTfA
X-Gm-Gg: AYBFou0FgF6+dD/DGmlcxlfmASXGZqXBk1zXggocgn4BZQeo/mpyLd0fz369toQZUOn
	ugTB9Nn19p3RYW2IauotqYimO3WnwXMfVgXrZqFatPqIei05G24Hb0RNee4shfJ401p8XtdQxVG
	YIWqlpFR7Kt8MHnHVNsgnqKDL+Ud3uK2Ok8/yUyM+0aj4hi7SxNWoR5cIYAP2qNQTSooZjzBqNJ
	tJxgGsXKrcHhF0PK8/nA4QA+P/cGQCjo2oUskohvP2SB3noQwf53n+6OAoUchWmktMbT/g25/Pn
	zWepzpdDMv+sSmxWBAzVvJ7JpNEE9zTMGXbeHjJR48+iVqYIbIrGw7n7bSJFO0K9Q0FHTmBARqy
	83mrK3u2//5IXGySJ2cVnSF+ectbCsmxcq04Yu/f3m9lXEoccIv212mWnY6VyVIcJ6BuGeO3mVA
	xPq/jVriAUxnvgIpoZnEy9OWDP9dOpHAEuy4r112f9qH9BR4n9APW46V7PRBfd6kKPf1Vy7r/Pn
	t1Bga4FhfkQfDPUiZRdsvdLR/ryuaPl9HIy65vlROPKKfO0zeyvvco2uuB8jRY5iGkWd90QuSPU
	mw2xCkOvdIPAZcrtXuLsf4CBn1+f3gQxKkxnrg/rw7Jx+BdLSwlThAufuF2xgBe4wGlbKkBNqGM
	0sAJFYLPjng5S7N+8WTXDofGXXdLRip52ZSBk+WfRovzu+8eaJEADhX2lNrGLV4Qb3hJ/x3o=
X-Received: by 2002:a05:600c:1c1f:b0:4bb:6847:7943 with SMTP id 5b1f17b1804b1-4bb7da28927mr124545535e9.26.1795086584840;
        Thu, 19 Nov 2026 03:09:44 -0800 (PST)
Message-ID: <4c8566e0-86ca-4c18-90a4-1f44e4db6df2@gmail.com>
Date: Thu, 19 Nov 2026 12:09:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] CI: add a Debian 13 riscv64 QTB container
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Zhang Zheng <zhangzheng@iscas.ac.cn>
References: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
 <1793714905.8631fc262581453bbf619ec5b2062170.1a1a1bd621c000403d@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1793714905.8631fc262581453bbf619ec5b2062170.1a1a1bd621c000403d@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1795086585-020C1A5B-94C59988/10/63158204843
X-purgate-type: spam
X-purgate-size: 3135
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/3/26 3:08 PM, Baptiste Le Duc wrote:
> The riscv64 QTB tests use QTB (QEMU Test Bench) Python package. QTB is part
> of AMD's work on the 'safety' branch [1] of their QEMU fork and is not
> upstream in QEMU yet. The tests also need pytest and qemu-system-riscv64.
> 
> Add debian:13-riscv64-qtb, a Debian Trixie container with those packages
> and the QTB package installed from the python/ directory of AMD's QEMU
> fork, at the commit pinned by QEMU_REPO/QEMU_COMMIT. Make it available to
> containerize script as trixie-riscv64-qtb.
> 
> QTB depends on pexpect, ptyprocess, pygdbmi and qemu.qmp. Rather than
> fetching them from PyPI, install them from the wheels vendored in the
> python/wheels/ directory of the same fork commit, with pip --no-index.
> 
> [1] https://gitlab.com/xen-project/people/amd/qemu/-/tree/safety?ref_type=heads
> 
> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> The CI jobs running the tests in this container come in a later patch.
> ---
> Changes in v3:
> - Move the container from test-artifacts to xen.git (automation/build/),
>    renamed debian:13-riscv64-qtb.
> - Install the QTB dependencies from the wheels vendored in the fork, with
>    pip --no-index.
> - Add pytest, drop jinja2, yaml and device-tree-compiler.
> - Comment that the pinned commit is the tip of the safety branch.
> - Reword the commit title and message.
> ---
>   automation/build/debian/13-riscv64-qtb.dockerfile | 47 +++++++++++++++++++++++
>   automation/scripts/containerize                   |  1 +
>   2 files changed, 48 insertions(+)
> 
> diff --git a/automation/build/debian/13-riscv64-qtb.dockerfile b/automation/build/debian/13-riscv64-qtb.dockerfile
> new file mode 100644
> index 0000000000..34ca1f2b7d
> --- /dev/null
> +++ b/automation/build/debian/13-riscv64-qtb.dockerfile
> @@ -0,0 +1,47 @@
> +# syntax=docker/dockerfile:1
> +FROM --platform=linux/amd64 debian:trixie-slim
> +LABEL maintainer.name="The Xen Project"
> +LABEL maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +
> +ARG QEMU_REPO=https://gitlab.com/xen-project/people/amd/qemu.git
> +# Tip of the safety branch
> +ARG QEMU_COMMIT=24cd7e5c0d7e4db8e651f091d0b9da2e7c58dbab
> +
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
> +        git
> +        python3-minimal
> +        python3-pip

Nit: the other dockerfiles put the comment on its own line after "DEPS=(".
Also, python3-pip already pulls in python3, so python3-minimal looks
redundant.

Other LGTM:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I've also tested it by:

$ podman build -t qtb-review -f 
automation/build/debian/13-riscv64-qtb.dockerfile automation/build/debian

And it looks everything is on the place so:

Tested-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

