Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A249CC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 13:22:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450538.1666011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHLP4-00023E-2L; Thu, 15 Oct 2026 13:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450538.1666011; Thu, 15 Oct 2026 13:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHLP3-000236-Ur; Thu, 15 Oct 2026 13:21:49 +0000
Received: by outflank-mailman (input) for mailman id 1450538;
 Thu, 15 Oct 2026 13:21:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13fb9a6560008425@swg.vates.tech>)
 id 1xHLP2-0001yX-IS
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 13:21:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHLP1-00H2NG-VP
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 15:21:47 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13fb9a6560008425@swg.vates.tech>)
 id 6ad0d369-bab6-0a2a0a5309dd-0a2a4506863a-8
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 15:21:47 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13fb9a6560008425@swg.vates.tech>)
 id 6ad0d364-195a-0a2a45060019-b9ff1c12a6c9-4
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 15:21:47 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13fb9a6560008425.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 15 Oct 2026 13:21:33 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9D40A82B1B;
 Thu, 15 Oct 2026 15:21:32 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=Tn8t9m1cvZ8eErG1VUqIp9xR9MpDpiXQ5lbx+uFtkS4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=mqWoI4ovIH+FA6P6x+uxVWeOrSpTArftGa6cfl1ChNQKmbubUMPo5jagpHKlao5WP/O5/rqkO
 c6CclcuDKj+9LGU09PEP/Q+/QH30Y6zJxHJD2xXPc6eFuNB8HcEpfGA4FUHelAQt0CLliWvzLqY
 OYeUWmcNM3vBrdC4/LeIQ+VdIhZpRqpPjtM8VEsmAhNwCmTnkfkIAci+rGCilvHC4sOKgA4XC9A
 Q4whSLVhTJ/zqU64deKNG/4hFSWrLeLflWfomeax50HXUBu3NHJ1Do8tfJYRAgLCATjGd8UqdWW
 pjD6Hppjf0ei3OUDh/eXqH3HxgGw/ZZdEfvW7VQYEESg==
X-Zone-Loop: f25508eb7cb5979d8723953df0cf7c19a9382d65a856
x-campaign-type: default
x-transaction-id: 1f2eb63c-f1ff-4eec-b7a2-39b2945b2cab
x-swg-uid: 01-8ecdd480-5c83-415f-b315-504d28ebe569
X-Mailer: Sweego
Message-ID:
 <1792070493.8631fc262581453bbf619ec5b2062170.1a13fb9a6560008425@vates.tech>
x-swg-bid: 1792070493.8631fc262581453bbf619ec5b2062170.1a13fb9a6560008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH 3/3] automation: run tools/tests on arm64 under QEMU
Date: Thu, 15 Oct 2026 15:21:23 +0200
In-Reply-To: <1792070250.8631fc262581453bbf619ec5b2062170.1a13fb5eee80008425@vates.tech>
References: <1792070250.8631fc262581453bbf619ec5b2062170.1a13fb5eee80008425@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.244.cdffe731ec7b89e7.1a13fb9a3f1.14a6e143a9d8b062=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792070493169
X-purgate-ID: tlsNG-16d1c6/1792070507-F5A0C77B-5CEB33D9/0/0
X-purgate-type: clean
X-purgate-size: 5590

---=Part.244.cdffe731ec7b89e7.1a13fb9a3f1.14a6e143a9d8b062=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Currently the tests from tools/tests/* are only run on x86 hardware=2E So,
add jobs running them in dom0 under QEMU on arm64, for both GICv2 and
GICv3=2E

Like qemu-smoke-dom0-arm64=2Esh, boot Xen and dom0 via U-Boot and
ImageBuilder, and run them with automation/scripts/run-tools-tests=2E The
JUnit output is printed on the console and extracted from the log
afterwards, as there is no network access to the guest to get it=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 automation/gitlab-ci/test=2Eyaml               |  23 ++++
 automation/scripts/qemu-tools-tests-arm64=2Esh | 105 +++++++++++++++++++
 2 files changed, 128 insertions(+)
 create mode 100755 automation/scripts/qemu-tools-tests-arm64=2Esh

diff --git a/automation/gitlab-ci/test=2Eyaml b/automation/gitlab-ci/test=
=2Eyaml
index 96127995d7=2E=2Ef6110f764e 100644
--- a/automation/gitlab-ci/test=2Eyaml
+++ b/automation/gitlab-ci/test=2Eyaml
@@ -581,6 +581,29 @@ qemu-smoke-dom0-arm64-gcc-debug:
     - *arm64-test-needs
     - alpine-3=2E24-arm64-gcc-debug
=20
+=2Eqemu-tools-tests-arm64:
+  extends: =2Eqemu-arm64
+  artifacts:
+    paths:
+      - tools-tests=2Eserial
+      - '*=2Elog'
+      - tests-junit=2Exml
+    reports:
+      junit: tests-junit=2Exml
+  needs:
+    - *arm64-test-needs
+    - alpine-3=2E24-arm64-gcc-debug
+
+qemu-tools-tests-arm64-gcc-debug-gicv2:
+  extends: =2Eqemu-tools-tests-arm64
+  script:
+    - =2E/automation/scripts/qemu-tools-tests-arm64=2Esh gicv2 2>&1 | tee=
 ${LOGFILE}
+
+qemu-tools-tests-arm64-gcc-debug-gicv3:
+  extends: =2Eqemu-tools-tests-arm64
+  script:
+    - =2E/automation/scripts/qemu-tools-tests-arm64=2Esh gicv3 2>&1 | tee=
 ${LOGFILE}
+
 qemu-smoke-dom0less-arm64-gcc:
   extends: =2Eqemu-arm64
   script:
diff --git a/automation/scripts/qemu-tools-tests-arm64=2Esh b/automation/s=
cripts/qemu-tools-tests-arm64=2Esh
new file mode 100755
index 0000000000=2E=2E0d82c0055a
--- /dev/null
+++ b/automation/scripts/qemu-tools-tests-arm64=2Esh
@@ -0,0 +1,105 @@
+#!/bin/bash
+
+# Run the tests from tools/tests/* in dom0, under QEMU=2E
+#
+# Usage: qemu-tools-tests-arm64=2Esh gicv2|gicv3
+
+set -ex -o pipefail
+
+test_variant=3D$1
+
+case "${test_variant}" in
+    gicv2) gic_version=3D2 ;;
+    gicv3) gic_version=3D3 ;;
+    *)
+        echo "Unrecognised test_variant '${test_variant}'" >&2
+        exit 1
+        ;;
+esac
+
+passed=3D"tools tests passed"
+failed=3D"tools tests failed"
+
+# Dom0 rootfs
+cd binaries
+cp rootfs=2Ecpio=2Egz dom0-rootfs=2Ecpio=2Egz
+cat xen-tools=2Ecpio=2Egz >> dom0-rootfs=2Ecpio=2Egz
+
+# test-local configuration
+mkdir -p rootfs
+cd rootfs
+mkdir -p etc/local=2Ed root
+cp -a =2E=2E/=2E=2E/automation/scripts/run-tools-tests root/
+echo "#!/bin/bash
+
+bash /etc/init=2Ed/xencommons start
+
+if /root/run-tools-tests /usr/lib/xen/tests /tmp/tests-junit=2Exml; then
+    result=3D\"${passed}\"
+else
+    result=3D\"${failed}\"
+fi
+
+echo '@@@ JUNIT BEGIN'
+cat /tmp/tests-junit=2Exml
+echo '@@@ JUNIT END'
+echo \"\${result}\"
+" > etc/local=2Ed/xen=2Estart
+chmod +x etc/local=2Ed/xen=2Estart
+find =2E | cpio -R 0:0 -H newc -o | gzip >> =2E=2E/dom0-rootfs=2Ecpio=2Eg=
z
+cd =2E=2E/=2E=2E
+
+qemu-system-aarch64 \
+   -machine virtualization=3Dtrue \
+   -cpu cortex-a57 -machine type=3Dvirt,gic-version=3D${gic_version} \
+   -m 2048 -smp 2 -display none \
+   -machine dumpdtb=3Dbinaries/virt=2Edtb
+
+# XXX disable pl061 to avoid Linux crash
+fdtput binaries/virt=2Edtb -p -t s /pl061@9030000 status disabled
+
+# ImageBuilder
+echo 'MEMORY_START=3D"0x40000000"
+MEMORY_END=3D"0xC0000000"
+
+DEVICE_TREE=3D"virt=2Edtb"
+XEN=3D"xen"
+DOM0_KERNEL=3D"Image"
+DOM0_RAMDISK=3D"dom0-rootfs=2Ecpio=2Egz"
+XEN_CMD=3D"console=3Ddtuart dom0_mem=3D1024M console_timestamps=3Dboot"
+
+NUM_DOMUS=3D0
+
+LOAD_CMD=3D"tftpb"
+UBOOT_SOURCE=3D"boot=2Esource"
+UBOOT_SCRIPT=3D"boot=2Escr"' > binaries/config
+rm -rf imagebuilder
+git clone --depth 1 https://gitlab=2Ecom/xen-project/imagebuilder=2Egit
+bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binari=
es/config
+
+
+# Run the test
+rm -f tools-tests=2Eserial
+export TEST_CMD=3D"qemu-system-aarch64 \
+    -machine virtualization=3Dtrue \
+    -cpu cortex-a57 -machine type=3Dvirt,gic-version=3D${gic_version} \
+    -m 2048 -monitor none -serial stdio \
+    -smp 2 \
+    -no-reboot \
+    -device virtio-net-pci,netdev=3Dn0 \
+    -netdev user,id=3Dn0,tftp=3Dbinaries \
+    -bios /usr/lib/u-boot/qemu_arm64/u-boot=2Ebin"
+
+export UBOOT_CMD=3D"virtio scan; dhcp; tftpb 0x40000000 boot=2Escr; sourc=
e 0x40000000"
+export BOOT_MSG=3D"Latest ChangeSet: "
+export TEST_LOG=3D"tools-tests=2Eserial"
+export PASSED=3D"${passed}|${failed}"
+
+=2E/automation/scripts/console=2Eexp |& sed 's/\r\+$//'
+
+# Extract the JUnit report from the console, dropping any interleaved Xen
+# messages=2E
+sed -e 's/\r\+$//' -e '1,/^@@@ JUNIT BEGIN$/d' -e '/^@@@ JUNIT END$/,$d' =
\
+    tools-tests=2Eserial | grep -v '^(XEN)' > tests-junit=2Exml
+
+grep -q "^${passed}$" <(sed 's/\r\+$//' tools-tests=2Eserial)
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.244.cdffe731ec7b89e7.1a13fb9a3f1.14a6e143a9d8b062=---

