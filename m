Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA34C606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 21:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=HbA0e2X2
Received: from list by lists.xenproject.org with outflank-mailman.1504056.1699628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWgd6-0006py-9J; Thu, 26 Nov 2026 21:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504056.1699628; Thu, 26 Nov 2026 21:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWgd6-0006ot-3F; Thu, 26 Nov 2026 21:03:44 +0000
Received: by outflank-mailman (input) for mailman id 1504056;
 Thu, 26 Nov 2026 21:03:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xWgd4-0006Ub-Re
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 21:03:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWgd4-00Gh7b-8I
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 22:03:42 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b089e8b-e002-0a2a0a5209dd-0a2a4505d4c0-32
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 22:03:42 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b089eae-4cb1-0a2a45050019-d155802eb94f-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 22:03:42 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4bb6886d30aso71204735e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 13:03:42 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88442693sm570536295e9.1.2026.11.26.13.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 13:03:41 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1795727022; x=1796331822; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1jlOXeKT1EOgFt75DzMKWpcXSq6wZJ1CMqIY0d3xiX4=;
        b=HbA0e2X24H95G3Ip39R1myeXovobXZxrZsaaFGswv6aXquRtq8wfFe/Y2f4+MWQTia
         mD98tOETb/aqf7t1xiV1xXFLekIyWovyIvjAATWyxkhr4zazjlCPduO4oqrmGHHAGWOb
         bhdC3FrQw3LzY9Zbwo+xZQAlIehhO/NBE3Mc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795727022; x=1796331822;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jlOXeKT1EOgFt75DzMKWpcXSq6wZJ1CMqIY0d3xiX4=;
        b=x0q77aMVpE3Mq1kOKam+jpmDCvniWMxtK/EVIkZAp647435ozutoAl+FKiImU+bn30
         mT8ZQWlzh2mtZ4asJLL/pkFooVNf9S5gFjQwx6d/9/+8XbcrSIwYzIDOJ2PJQSo38yQb
         CSeZEvTvLOm2LSXvf4maFAFMpWkMXH7Viv1GHDHG2Ve7+2qX3mym3YPz5ALKaLVSBjmX
         8+LBYpauMqsv7z5/4a9ZPLiIbc8GmltVuSu9u03UkQcpXWSPW9tuw138aIIdPl2ZYFWA
         moknCURpxtdDdrL/5tbwp8lZrwjAvICi1hNk+DqllRB6XcFg20ftN/aMK3jBGJ+Fbd9V
         0hEg==
X-Gm-Message-State: APuU4Z8yARRB7MOKjI04MSR082KDhjrCnfi7kVCaXf0Ifv71jZ5yh32/
	FAhjlksYV6IZYVc7rc50Qm2PUkuf9aB6PirqDXSf7Oo0D2Dw9xiTPKrfqvqy/dqsJDY7LUSgf42
	J5UtU8zc=
X-Gm-Gg: AZFdTZdc8nUIsFX4XB4bUB8nGN9hutVavXT65FKY4jizZYHVV99owJGusv+4W6YwTLw
	qWfkkwsQf+BbJAVnUcD2QQQ/+AjNTfPdcjpaiChaMMejU5EuwCkEXlLOjG3CMmkXpw2N/fVt6M8
	LeGiIv/B9BeqTrIkFk7pTxQ5riqU81KzMVU635Oz8jyB5j9x6+yV2StWpbWGJH6yv4LJebK976Q
	aS2MfjGOMAjAYIKIBX0nBb9nQUhNlHkqUo39j/GFKn8Az8Hy12++Y9Zjq2kqt4f8K5OCV5idVs7
	xVoao7DJKxCkrrjMjuSc1mujYtNXidXqViPwqEq9tcJUNrT55zQIoRhUR5mZJVS9L0pw+fnlzcx
	jmbg5jQ5Fb8euEcTT2BIjjOtHhZRsge23GWrGcgjd9e/+W1EzrAEYqCTVhxf0+6XtwzFAElLSIc
	xhtsM6jRBX3+RygVAWqGwrmDP955fTTrvgCpW2nW9xIazgkBVmvvyWLtBXnj1xpTTYKZbKBGGDx
	rBqTMQMWp+g74m4ahLqY6+TFGu5Y/fsN8QBeKMaeQpbsewVNvTM3vrj3jrDlPZOf2UMcbshFG3D
	mIfYHkpZGjuE4Ysvd9oJ7B/b436KyxwLa3jZKEvOq/e64UMrttni772QDlZbn5jQ6W/MWP7wErE
	oIIQ=
X-Received: by 2002:a05:600c:3b84:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb888074bbmr540846405e9.12.1795727021384;
        Thu, 26 Nov 2026 13:03:41 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Frediano Ziglio <freddy77@gmail.com>
Subject: [PATCH 4/4] CI: Add an EFI/StrictNX test
Date: Thu, 26 Nov 2026 21:03:37 +0000
Message-Id: <20261126210337.746228-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261126210337.746228-1-andrew.cooper3@citrix.com>
References: <20261126210337.746228-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1795727022-24D1E2A1-1A0C9607/0/0
X-purgate-type: clean
X-purgate-size: 5317
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roger Pau Monné <roger.pau@citrix.com>

While most of our testing of this nature happens in a Debian container,
Debian's strictnx build of OVMF is buggy at the time of writing.  See:

  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1154178

Fedora have non-strict StrictNX enabled in their SecureBoot build of OVMF, but
by default it prints a warning on failure and then relaxes permissions.  It
can be turned into strict StrictNX mode with an extra -fw_cfg setting, making
it actually usable in a CI scenario.

Unlike Debian, Fedora has no equivalent of the enrolled snake-oil key, so for
simplicity sake just turn off SecureBoot for now.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Frediano Ziglio <freddy77@gmail.com>

As Fedora 45 is new this series, I've already deployed the container with
these additions.
---
 automation/build/fedora/45-x86_64.dockerfile  |  7 ++
 automation/gitlab-ci/test.yaml                |  9 +++
 .../scripts/include/xtf-x86_64-efi-strictnx   | 64 +++++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 automation/scripts/include/xtf-x86_64-efi-strictnx

diff --git a/automation/build/fedora/45-x86_64.dockerfile b/automation/build/fedora/45-x86_64.dockerfile
index 5a1764c7ee55..e470f19eedb4 100644
--- a/automation/build/fedora/45-x86_64.dockerfile
+++ b/automation/build/fedora/45-x86_64.dockerfile
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
index cf4b7ed416b0..cfde4d05c6e8 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -783,6 +783,15 @@ qemu-smoke-x86_64-gcc-efi-uki:
   needs:
     - debian-13-x86_64-gcc-debug
 
+qemu-smoke-x86_64-gcc-efi-strictnx:
+  extends: .qemu-smoke-x86_64
+  variables:
+    CONTAINER: fedora:45-x86_64
+  script:
+    - ./automation/scripts/qemu-xtf.sh x86_64-efi-strictnx pv64 example 2>&1 | tee ${LOGFILE}
+  needs:
+    - fedora-45-x86_64-gcc-debug
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


