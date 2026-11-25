Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CC4606A321
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 18:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=RNBVHBb2
Received: from list by lists.xenproject.org with outflank-mailman.1502719.1698693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWHLg-0002uH-1v; Wed, 25 Nov 2026 18:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502719.1698693; Wed, 25 Nov 2026 18:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWHLf-0002uA-VF; Wed, 25 Nov 2026 18:04:03 +0000
Received: by outflank-mailman (input) for mailman id 1502719;
 Wed, 25 Nov 2026 18:04:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xWHLd-0002u3-PR
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 18:04:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWHLc-008csi-Rx
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 19:04:00 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b0722d4-2eae-0a2a0a5409dd-0a2a45058f24-44
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 19:04:00 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b072310-4cb1-0a2a45050019-d1558031c4ea-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 19:04:00 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4bb6adaf0f1so53493905e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 10:04:00 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a12acsm565813105e9.8.2026.11.25.10.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 10:03:59 -0800 (PST)
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
        d=citrix.com; s=google; t=1795629840; x=1796234640; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JR1WAGkU3DfNhVKr38Y5FfGOD+zMszhvaE4j/G2f9lA=;
        b=RNBVHBb2PQ2VS/moCavx72yhO8yatIVCZaF7gkw3cz151MPtd6lEtYue0lcaxVx5W0
         PSsBIqod0ZdBe1i7i6EoFkGGkvl6OP22GNeQfpnC/NrIcxVYVuvk+JPbllkJnSunfJ31
         pqOXBb6WnCPiZmS5JOEUmOdkkqfivHlT+l3wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629840; x=1796234640;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JR1WAGkU3DfNhVKr38Y5FfGOD+zMszhvaE4j/G2f9lA=;
        b=IGpEQyBX06b1c9uCMEFykc4M5gl0TTmR4jQm3lSGagbYHvHPQELQBeAL/qcseBGRsI
         05YnlcYFUxRKIdCeOYqdupZ/S5ySCmJEWPlkT+n/LNEbDZrueHMX8g0KAaITfZ8EnFEz
         rCI4vQWwrr0cvM7z55GbtDk4PR3JiUJBp82hpkRSD+fGQ7ZciuvNTagSAmtNs/JyzR0i
         zGUAdQ/xD+dkw6wct2DqmJNc1y5D4vLQd+mKw21JJCCiJJBLNj3h+xBwpiyNQGGSEWyA
         ssLwVcz88kZPKr+gRW3+3y7Alfxn49joJmCdqfPOmP1oAhm7+aRPY0rZSzsW2QdQy+cD
         Nu4A==
X-Gm-Message-State: APuU4Z+SdgkHbGToXFpt32ThvSIhUh5ZvzUH2cd2YsxTrd0Ho/U9sU3K
	Td11VU5+4ZDbrcaP00KL2Ebs3zK6KacwMs7NNj9ju1bAw3IDB6aY1RsDNOdAh4eMpFAndV/K73M
	zLQkDUB0=
X-Gm-Gg: AZFdTZd2yUg6QyZrY/7XC7MfmWxhYB4nlf9JLiy1Dd0OTh+MK+bHMGzp8seoj+gdAJJ
	JJAc5OHst0EqvWck+xL2UgYB6zlyFYxDG6/0ksiapiTJu/Gg+zSpN6Diy4zkI3J2w1RXudQyauc
	AnmUsxxS07EtZ2JOHElDXbQqwWv82pXMNqlUP536opcHC99CFV8BGTmL+sGi6nkV6pENEl1YQYb
	la+E+HQHQEn5Rl4E2ReeUSHas/r0w0g39S8AZjQ7oGKXQjuQ10PBxNmq4/SVa3jEUyZoYUs5n7N
	b3lGS7pBJNv+u5ARqvQbvMBwV+xMRNAuJkO7LKiwBtX3Ge7G/GO2cPwIGc8LXVzKE5Deso9/2k9
	pHYnCJ+IUUhQ9f9X8ZE4hUsSeqriaJsOvXrs1sXyYOlvr0iuEBbJP3XIfyAVIzNXrH+CVk/AVMN
	zMJll8iHgjpU+xf9bMTchFdpvNKIYhHqt45eZB7TTponIb/UEhhnZRQe0qbxb6KqZ9B58lMzXxv
	0L/tZWqmVbxPEGPKqf3QpAu51TePOEuEzEiqU+0SUZ/QvX7i1rnPkuKEKIlJhjz0YFmpVXMQ82W
	gWdoLG/kofvwoZwl5/j6g+gk3t+nevpYlqFfFtrtuP3f9ZYt17qBzpa9yENPI4ppPjgYh/dCqMY
	3u0PImTi7mbWw/UacxP7TMxPD
X-Received: by 2002:a05:600c:5303:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb88785d24mr361625175e9.0.1795629839861;
        Wed, 25 Nov 2026 10:03:59 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH RFC] CI: Add an EFI/StrictNX test
Date: Wed, 25 Nov 2026 18:03:57 +0000
Message-Id: <20261125180357.647799-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1795629840-728B62A1-D396206A/0/0
X-purgate-type: clean
X-purgate-size: 5244
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roger Pau Monne <roger.pau@citrix.com>

While most of our testing of this nature happens in a Debian container,
Debian's strictnx build of OVMF is buggy at the time of writing.  See:

  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1154178

Fedora have non-strict StrictNX enabled in their SecureBoot build of OVMF, but
by default it prints a warning on failure and then relaxes permissions.  It
can be turned into strict StrictNX mode with an extra -fw_cfg setting, making
it actually usable in a CI scenario.

Unlike Debian, Fedora has no equivelent of the enroled snakeoil key, so for
simplicity sake just turn off SecureBoot for now.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Adapted from a previous patch of Rogers.  Not for applying yet, as Xen is not
compatible with StrictNX.

However, I want to rebuild the container including these new packages for ease
of testing, so this wants a cusory review at least.
---
 automation/build/fedora/43-x86_64.dockerfile  |  7 ++
 automation/gitlab-ci/test.yaml                |  9 +++
 .../scripts/include/xtf-x86_64-efi-strictnx   | 64 +++++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 automation/scripts/include/xtf-x86_64-efi-strictnx

diff --git a/automation/build/fedora/43-x86_64.dockerfile b/automation/build/fedora/43-x86_64.dockerfile
index 0a2329e2dc37..a9f69b4cdc95 100644
--- a/automation/build/fedora/43-x86_64.dockerfile
+++ b/automation/build/fedora/43-x86_64.dockerfile
@@ -67,6 +67,13 @@ RUN <<EOF
         glib2-devel
         pixman-devel
         ninja-build
+
+        # for test phase, qemu-* jobs
+        edk2-ovmf
+        expect
+        python3-virt-firmware
+        qemu-img
+        qemu-system-x86
     )
 
     dnf -y --setopt=install_weak_deps=False install "${DEPS[@]}"
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index cf4b7ed416b0..4673815b484f 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -783,6 +783,15 @@ qemu-smoke-x86_64-gcc-efi-uki:
   needs:
     - debian-13-x86_64-gcc-debug
 
+qemu-smoke-x86_64-gcc-efi-strictnx:
+  extends: .qemu-smoke-x86_64
+  variables:
+    CONTAINER: fedora:43-x86_64
+  script:
+    - ./automation/scripts/qemu-xtf.sh x86_64-efi-strictnx pv64 example 2>&1 | tee ${LOGFILE}
+  needs:
+    - debian-13-x86_64-gcc-debug
+
 qemu-xtf-argo-x86_64-gcc-debug:
   extends: .qemu-smoke-x86_64
   variables:
diff --git a/automation/scripts/include/xtf-x86_64-efi-strictnx b/automation/scripts/include/xtf-x86_64-efi-strictnx
new file mode 100644
index 000000000000..49a87c7dd91f
--- /dev/null
+++ b/automation/scripts/include/xtf-x86_64-efi-strictnx
@@ -0,0 +1,64 @@
+#!/bin/bash
+#
+# XTF test utilities (x86_64, EFI).
+#
+
+# Arch-specific environment overrides.
+function xtf_arch_prepare()
+{
+    export FW_PREFIX="${FW_PREFIX:-/usr/share/edk2/ovmf}"
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
+    # Generate EFI boot environment
+    mkdir -p ${efi_dir}
+    cp ${XEN_BINARY} ${efi_dir}/BOOTX64.EFI
+    cp ${XTF_BINARY} ${efi_dir}/kernel
+
+    cat > ${efi_dir}/BOOTX64.cfg <<EOF
+[global]
+default=test
+
+[test]
+options=${XEN_CMDLINE}
+kernel=kernel
+EOF
+
+    # Fedora has StrictNX built into in the SecureBoot image, but by default
+    # it is permissive and only prints a warning.  It's made strict by an
+    # extra -fw_cfg setting.
+    local ovmf_code=${FW_PREFIX}/OVMF_CODE_4M.secboot.qcow2
+    local ovmf_vars=${FW_PREFIX}/OVMF_VARS_4M.secboot.qcow2
+    local ovmf_format=qcow2
+
+    cp $ovmf_code ${WORKDIR}/OVMF_CODE
+    cp $ovmf_vars ${WORKDIR}/OVMF_VARS
+
+    # Xen.efi isn't signed, so turn SecureBoot off.
+    virt-fw-vars --inplace ${WORKDIR}/OVMF_VARS --set-false SecureBootEnable
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
+        -fw_cfg name=opt/org.tianocore/StrictNX,string=yes \
+    "
+}
-- 
2.39.5


