Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A046606A687
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 17:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=N/MnlgZ2
Received: from list by lists.xenproject.org with outflank-mailman.1502654.1698631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWH3d-0004Xs-5q; Wed, 25 Nov 2026 17:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502654.1698631; Wed, 25 Nov 2026 17:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWH3d-0004Xl-1G; Wed, 25 Nov 2026 17:45:25 +0000
Received: by outflank-mailman (input) for mailman id 1502654;
 Wed, 25 Nov 2026 17:45:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xWH3c-0004Xf-6F
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 17:45:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWH3a-008a14-QP
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 18:45:22 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b071e9c-bab6-0a2a0a5309dd-0a2a450bd5ae-48
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 18:45:22 +0100
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b071eb2-b7e8-0a2a450b0019-d155dd2ab472-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 18:45:22 +0100
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-492f0a1b685so4245582f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 09:45:22 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b205443sm37359968f8f.39.2026.11.25.09.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 09:45:21 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1795628722; x=1796233522; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q7DzJYr240WJVp1CrVHniYceiB9BYQhoE3iB8e0M/QA=;
        b=N/MnlgZ250elX5dtz56SfjSS7h/4LJ/LErpBYilVZ4efrtkGGGllM4jDPfKPc4dV5n
         KBmT4iHTAUfV7Em8ubegJivrpfnZNDLBMZOeykHc9ZluJ6zWv5NDU4SwoqHT0h9YrH85
         CT5IYo91l4EZkkVADdnXlOZ3h9G6LC0dFWiik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795628722; x=1796233522;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q7DzJYr240WJVp1CrVHniYceiB9BYQhoE3iB8e0M/QA=;
        b=0dQq5UTv63rVlAGxbgtykvNVyFtJxefdPdfn7ZIWOyUZc2/mOgLSwWEEKV+3h9dYRO
         aBD8Oxx69x1yH0siyR3Nc1picGW4nDuqVYyfs50fKdYj/wXSxUe8gwYxcR4gNljtOTlK
         02wMvmmxpwaho5+CY1xGQWRFUyUuYsTF/ib6/xqNbnyQcKH++6MD1zMg4++WAIfva9WP
         bwIQ1YYehTLqcohKQhrJXMIvXJA2MA1Dzwvo/NcKfsIggJK8l3h2aB9l3NLweWFn9pC0
         0mWg0u4wpZWXk0dj0hU0OaYJmij1ttlLEcp1py0k4UBMWKD79wMBaHZd07If1lRF4fVv
         /Bcg==
X-Gm-Message-State: APuU4Z9n35ZyoTG3ORqJXxtyep9ohW6+alnRX9EIWtUBJujJmvxgHfmr
	Mq5zQDh4CPtHFRyB728XRAICZdXO5dZpEdaEVjBAy6gcFtRMOAmO0Q4yOjoxu4O//c+4vdPbLNy
	+4rCqFCA=
X-Gm-Gg: AZFdTZcb077fLD6XcopNEGzKRV+/9yIRwpPj3j+zkcpmYIVNoJL5mkNQHF2RxVmm/Nk
	dFg3wG6N72C5Ljm5DrECzWqwmwL3NPZkbn8dxtYU8Qx5Ws7xibAwZ2Vb2jELUyOHY3U+J9SOp4D
	OjUxraUWiRM7lXpniTNhMl2WEhabzztWaAajQwsIFzOANPufOflX9Ozd+NBapC3tLuKGSszpd6F
	qH4wVQ3I4wWyLuk/1ANWe2+3Ui6/0WWVjbVSzgpUMF6AES9qf4XCb4BgfoaAApVixzJxwSSM918
	lA50ITqS0a0PDwLWxV6Y9onpDVJ2mM1qSr8wPFQxl4Oor47QVCbactCu4lrUFOHvNyHFT+AOxys
	OfS8BfQ9pABR2tUsJe4cP+mDgtrEJU1o5QaOnc6soaL0xz4ogOk1THq2/bDgV/NuOFaPrw6Ln00
	5lqK5FjbAxFqmdJHGvXL1uPz50GPq2zG9MQeT7Pp2Kq8B6QL8m9GeHe7kepQR0+TmnvQvFGNewa
	2ZampdObk5eYEKM8lFTp6O8Sb94me+ZHzw6gXGSa5qPT2NhzozV71tn5h0fTl42szajNkZKX+0p
	Gwz9rc3+H2CcrPoSWjz79XXCv69F4pPyy4BBrUSY0+iRJpFp+BiYi4MAQgmuFy27wUj0OBDKKj6
	eBq8=
X-Received: by 2002:a05:6000:2c13:b0:4a6:9f2f:4153 with SMTP id ffacd0b85a97d-4abaac57ba9mr35290778f8f.1.1795628721747;
        Wed, 25 Nov 2026 09:45:21 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] CI: Add a SecureBoot/UKI test
Date: Wed, 25 Nov 2026 17:45:19 +0000
Message-Id: <20261125174519.643860-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1795628722-A82F49EA-1C5D53E6/0/0
X-purgate-type: clean
X-purgate-size: 5615
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Debian 13 ships an OVMF image that is pre-enrolled with the snakeoil key.  The
only problem using this is that sbsign requires an interactive prompt for the
password, so arrange for container generation to strip the password; it's not
a secret.

Extend the qemu-xtf infrasturcture with a UKI variant, sign the result with
the snakeoil key, and use the snakeoil OVMF image.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Marek, I stol^W borrowed the vma and objtool runes from your related patch.
I'm not overly happy with adding more tests which clone XTF like this, but it
is easier to run manually than the full alpine version.

python3-virt-firmware isn't strictly needed right now, but it's useful to edit
OVMF_VARS when debugging.  A later strictnx test does need to use the package,
although that's in a Fedora container for other reasons.
---
 automation/build/debian/13-x86_64.dockerfile  | 11 +++
 automation/gitlab-ci/test.yaml                |  7 ++
 automation/scripts/include/xtf-x86_64-efi-uki | 71 +++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 automation/scripts/include/xtf-x86_64-efi-uki

diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
index 784299d52dc3..8efae0150a9b 100644
--- a/automation/build/debian/13-x86_64.dockerfile
+++ b/automation/build/debian/13-x86_64.dockerfile
@@ -57,8 +57,11 @@ RUN <<EOF
         # for test phase, qemu-* jobs
         busybox-static
         expect
+        openssl
         ovmf
+        python3-virt-firmware
         qemu-system-x86
+        sbsigntool
 
         # for build-each-commit-gcc
         ccache
@@ -66,6 +69,14 @@ RUN <<EOF
 
     apt-get -y --no-install-recommends install "${DEPS[@]}"
 
+    # Strip the password off the snakeoil key to avoid sbsigntool wanting an
+    # interactive prompt
+    openssl rsa \
+            -in  /usr/share/ovmf/PkKek-1-snakeoil.key \
+            -out /usr/share/ovmf/PkKek-1-snakeoil-nopass.key \
+            -passin pass:snakeoil
+    chmod 644 /usr/share/ovmf/PkKek-1-snakeoil-nopass.key
+
     rm -rf /var/lib/apt/lists*
 EOF
 
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 96127995d7be..cf4b7ed416b0 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -776,6 +776,13 @@ qemu-smoke-x86_64-gcc-efi:
   needs:
     - debian-13-x86_64-gcc-debug
 
+qemu-smoke-x86_64-gcc-efi-uki:
+  extends: .qemu-smoke-x86_64
+  script:
+    - ./automation/scripts/qemu-xtf.sh x86_64-efi-uki pv64 example 2>&1 | tee ${LOGFILE}
+  needs:
+    - debian-13-x86_64-gcc-debug
+
 qemu-xtf-argo-x86_64-gcc-debug:
   extends: .qemu-smoke-x86_64
   variables:
diff --git a/automation/scripts/include/xtf-x86_64-efi-uki b/automation/scripts/include/xtf-x86_64-efi-uki
new file mode 100644
index 000000000000..b47def06d49c
--- /dev/null
+++ b/automation/scripts/include/xtf-x86_64-efi-uki
@@ -0,0 +1,71 @@
+#!/bin/bash
+#
+# XTF test utilities (x86_64, EFI).
+#
+
+# Arch-specific environment overrides.
+function xtf_arch_prepare()
+{
+    export FW_PREFIX="${FW_PREFIX:-/usr/share/OVMF}"
+    export QEMU_PREFIX="${QEMU_PREFIX:-}"
+    export XEN_BINARY="${XEN_BINARY:-${WORKDIR}/xen.efi}"
+    export XEN_CMDLINE="${XEN_CMDLINE:-loglvl=all noreboot console_timestamps=boot console=com1}"
+    export XTF_SRC_BRANCH="${XTF_SRC_BRANCH:-master}"
+    export XTF_SRC_URI="${XTF_SRC_URI:-https://xenbits.xen.org/git-http/xtf.git}"
+    export XTF_SRC_VARIANTS="hvm64 pv64"
+}
+
+# Perform arch-specific XTF environment setup.
+function xtf_arch_setup()
+{
+    local esp_dir="${WORKDIR}/boot-esp"
+    local efi_dir="${esp_dir}/EFI/BOOT"
+
+    cat > ${WORKDIR}/xen.cfg <<EOF
+[global]
+default=test
+
+[test]
+options=${XEN_CMDLINE}
+kernel=kernel
+EOF
+
+    vma=$(objdump -h ${XEN_BINARY} | \
+              perl -ane 'if (/\..*/) { $vma=hex($F[2]) + hex($F[3]) }
+                         END { printf "0x%016x\n", ($vma + 0xfff) & ~0xfff }')
+
+    objcopy \
+        --add-section .config=${WORKDIR}/xen.cfg \
+        --change-section-vma .config=$vma \
+        --add-section .kernel=${XTF_BINARY} \
+        --change-section-vma .kernel=$(( $vma + 0x100000 )) \
+        ${XEN_BINARY} \
+        ${XEN_BINARY}.uki
+
+    mkdir -p ${efi_dir}
+
+    sbsign --key  /usr/share/ovmf/PkKek-1-snakeoil-nopass.key \
+           --cert /usr/share/ovmf/PkKek-1-snakeoil.pem \
+           --output ${efi_dir}/BOOTX64.EFI \
+           ${XEN_BINARY}.uki
+
+    local ovmf_code=${FW_PREFIX}/OVMF_CODE_4M.snakeoil.fd
+    local ovmf_vars=${FW_PREFIX}/OVMF_VARS_4M.snakeoil.fd
+    local ovmf_format=raw
+
+    cp $ovmf_code ${WORKDIR}/OVMF_CODE
+    cp $ovmf_vars ${WORKDIR}/OVMF_VARS
+
+    export TEST_CMD="${QEMU_PREFIX}qemu-system-x86_64 \
+        -no-reboot \
+        -nographic \
+        -monitor none \
+        -serial stdio \
+        -m 2048 \
+        -smp 2 \
+        -M q35,kernel-irqchip=split \
+        -drive if=pflash,format=${ovmf_format},readonly=on,file=${WORKDIR}/OVMF_CODE \
+        -drive if=pflash,format=${ovmf_format},file=${WORKDIR}/OVMF_VARS \
+        -drive file=fat:rw:${esp_dir},media=disk,index=0,format=raw \
+    "
+}
-- 
2.39.5


