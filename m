Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EE8606A327
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 00:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JAR5FNcn
Received: from list by lists.xenproject.org with outflank-mailman.1502958.1698888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWNlr-0002HK-Vv; Thu, 26 Nov 2026 00:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502958.1698888; Thu, 26 Nov 2026 00:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWNlr-0002HD-T2; Thu, 26 Nov 2026 00:55:31 +0000
Received: by outflank-mailman (input) for mailman id 1502958;
 Thu, 26 Nov 2026 00:55:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1xWNlq-0002H7-Cl
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 00:55:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWNlp-006rbv-Eg
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 01:55:29 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6b078355-8faa-0a2a0a5109dd-0a2a4506ac46-18
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 01:55:29 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6b07837f-195a-0a2a45060019-aceafc1f9452-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 01:55:29 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 18653400D8;
 Thu, 26 Nov 2026 00:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0932C1F000C4;
 Thu, 26 Nov 2026 00:55:25 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654527;
	bh=3Kb6Cm9FnDBHwS8OADLtuESF2ptEcMk1KWYATsuAHFk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=JAR5FNcnV1aHJRGNAikmUy7ZWUayOD1r/8e+vrbZbg8auzituWJ3iyCGCL8crUVDY
	 oFH3CmYKdg8azaT0vUAJOT4T1s7opWJOq41lh3xuI+SJiWJIdReyrRWzVC1bi5/9M0
	 eODt1k4dlcrReOsEKvbiTScph22yMKFSnrccUGH6b9XRswFThZtNGG13mDBItzm7om
	 8DA3xSP10smwUBU+ItK8V6d88esTRI7ffztKKS2RfoAdm1kk5a8fOVOOEwUoY4Ptpk
	 sNiIND6hL5HC1XAfCnp3mM84YO/h3pZ60u48t8CTBj+yJNFTA46+VBwQV36+XWu4Tx
	 /oCiQHJG1jO7A==
Date: Wed, 25 Nov 2026 16:55:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] CI: Add a SecureBoot/UKI test
In-Reply-To: <20261125174519.643860-1-andrew.cooper3@citrix.com>
Message-ID: <941c953b-54c2-5321-61d8-a455e73fc6d4@kernel.org>
References: <20261125174519.643860-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-179127885-1795654526=:2648157"
X-purgate-ID: tlsNG-16d1c6/1795654529-FDA0C77B-E52A7CC6/0/0
X-purgate-type: clean
X-purgate-size: 6352
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-179127885-1795654526=:2648157
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 25 Nov 2026, Andrew Cooper wrote:
> Debian 13 ships an OVMF image that is pre-enrolled with the snakeoil key.  The
> only problem using this is that sbsign requires an interactive prompt for the
> password, so arrange for container generation to strip the password; it's not
> a secret.
> 
> Extend the qemu-xtf infrasturcture with a UKI variant, sign the result with
> the snakeoil key, and use the snakeoil OVMF image.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Marek, I stol^W borrowed the vma and objtool runes from your related patch.
> I'm not overly happy with adding more tests which clone XTF like this, but it
> is easier to run manually than the full alpine version.
> 
> python3-virt-firmware isn't strictly needed right now, but it's useful to edit
> OVMF_VARS when debugging.  A later strictnx test does need to use the package,
> although that's in a Fedora container for other reasons.
> ---
>  automation/build/debian/13-x86_64.dockerfile  | 11 +++
>  automation/gitlab-ci/test.yaml                |  7 ++
>  automation/scripts/include/xtf-x86_64-efi-uki | 71 +++++++++++++++++++
>  3 files changed, 89 insertions(+)
>  create mode 100644 automation/scripts/include/xtf-x86_64-efi-uki
> 
> diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
> index 784299d52dc3..8efae0150a9b 100644
> --- a/automation/build/debian/13-x86_64.dockerfile
> +++ b/automation/build/debian/13-x86_64.dockerfile
> @@ -57,8 +57,11 @@ RUN <<EOF
>          # for test phase, qemu-* jobs
>          busybox-static
>          expect
> +        openssl
>          ovmf
> +        python3-virt-firmware
>          qemu-system-x86
> +        sbsigntool
>  
>          # for build-each-commit-gcc
>          ccache
> @@ -66,6 +69,14 @@ RUN <<EOF
>  
>      apt-get -y --no-install-recommends install "${DEPS[@]}"
>  
> +    # Strip the password off the snakeoil key to avoid sbsigntool wanting an
> +    # interactive prompt
> +    openssl rsa \
> +            -in  /usr/share/ovmf/PkKek-1-snakeoil.key \
> +            -out /usr/share/ovmf/PkKek-1-snakeoil-nopass.key \
> +            -passin pass:snakeoil
> +    chmod 644 /usr/share/ovmf/PkKek-1-snakeoil-nopass.key
> +
>      rm -rf /var/lib/apt/lists*
>  EOF
>  
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 96127995d7be..cf4b7ed416b0 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -776,6 +776,13 @@ qemu-smoke-x86_64-gcc-efi:
>    needs:
>      - debian-13-x86_64-gcc-debug
>  
> +qemu-smoke-x86_64-gcc-efi-uki:
> +  extends: .qemu-smoke-x86_64
> +  script:
> +    - ./automation/scripts/qemu-xtf.sh x86_64-efi-uki pv64 example 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - debian-13-x86_64-gcc-debug
> +
>  qemu-xtf-argo-x86_64-gcc-debug:
>    extends: .qemu-smoke-x86_64
>    variables:
> diff --git a/automation/scripts/include/xtf-x86_64-efi-uki b/automation/scripts/include/xtf-x86_64-efi-uki
> new file mode 100644
> index 000000000000..b47def06d49c
> --- /dev/null
> +++ b/automation/scripts/include/xtf-x86_64-efi-uki
> @@ -0,0 +1,71 @@
> +#!/bin/bash
> +#
> +# XTF test utilities (x86_64, EFI).
> +#
> +
> +# Arch-specific environment overrides.
> +function xtf_arch_prepare()
> +{
> +    export FW_PREFIX="${FW_PREFIX:-/usr/share/OVMF}"
> +    export QEMU_PREFIX="${QEMU_PREFIX:-}"
> +    export XEN_BINARY="${XEN_BINARY:-${WORKDIR}/xen.efi}"
> +    export XEN_CMDLINE="${XEN_CMDLINE:-loglvl=all noreboot console_timestamps=boot console=com1}"
> +    export XTF_SRC_BRANCH="${XTF_SRC_BRANCH:-master}"
> +    export XTF_SRC_URI="${XTF_SRC_URI:-https://xenbits.xen.org/git-http/xtf.git}"
> +    export XTF_SRC_VARIANTS="hvm64 pv64"
> +}
> +
> +# Perform arch-specific XTF environment setup.
> +function xtf_arch_setup()
> +{
> +    local esp_dir="${WORKDIR}/boot-esp"
> +    local efi_dir="${esp_dir}/EFI/BOOT"
> +
> +    cat > ${WORKDIR}/xen.cfg <<EOF
> +[global]
> +default=test
> +
> +[test]
> +options=${XEN_CMDLINE}
> +kernel=kernel
> +EOF
> +
> +    vma=$(objdump -h ${XEN_BINARY} | \
> +              perl -ane 'if (/\..*/) { $vma=hex($F[2]) + hex($F[3]) }
> +                         END { printf "0x%016x\n", ($vma + 0xfff) & ~0xfff }')
> +
> +    objcopy \
> +        --add-section .config=${WORKDIR}/xen.cfg \
> +        --change-section-vma .config=$vma \
> +        --add-section .kernel=${XTF_BINARY} \
> +        --change-section-vma .kernel=$(( $vma + 0x100000 )) \
> +        ${XEN_BINARY} \
> +        ${XEN_BINARY}.uki
> +
> +    mkdir -p ${efi_dir}
> +
> +    sbsign --key  /usr/share/ovmf/PkKek-1-snakeoil-nopass.key \
> +           --cert /usr/share/ovmf/PkKek-1-snakeoil.pem \
> +           --output ${efi_dir}/BOOTX64.EFI \
> +           ${XEN_BINARY}.uki
> +
> +    local ovmf_code=${FW_PREFIX}/OVMF_CODE_4M.snakeoil.fd
> +    local ovmf_vars=${FW_PREFIX}/OVMF_VARS_4M.snakeoil.fd
> +    local ovmf_format=raw
> +
> +    cp $ovmf_code ${WORKDIR}/OVMF_CODE
> +    cp $ovmf_vars ${WORKDIR}/OVMF_VARS
> +
> +    export TEST_CMD="${QEMU_PREFIX}qemu-system-x86_64 \
> +        -no-reboot \
> +        -nographic \
> +        -monitor none \
> +        -serial stdio \
> +        -m 2048 \
> +        -smp 2 \
> +        -M q35,kernel-irqchip=split \
> +        -drive if=pflash,format=${ovmf_format},readonly=on,file=${WORKDIR}/OVMF_CODE \
> +        -drive if=pflash,format=${ovmf_format},file=${WORKDIR}/OVMF_VARS \
> +        -drive file=fat:rw:${esp_dir},media=disk,index=0,format=raw \
> +    "
> +}
> -- 
> 2.39.5
> 
--8323329-179127885-1795654526=:2648157--

