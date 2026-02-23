Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11176EC112B
	for <xen-devel@archiver.kernel.org>; Mon, 23 Feb 2026 20:41:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1239364.1540785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vucjh-0000nw-Dx; Mon, 23 Feb 2026 20:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239364.1540785; Mon, 23 Feb 2026 20:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vucjh-0000np-BQ; Mon, 23 Feb 2026 20:40:57 +0000
Received: by outflank-mailman (input) for mailman id 1239364;
 Mon, 23 Feb 2026 19:56:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9i6L=A3=linux-mail.net=dt@srs-se1.protection.inumbo.net>)
 id 1vuc2T-0003eB-Il
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 19:56:18 +0000
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4b2b1e3-10f1-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 20:56:13 +0100 (CET)
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
X-Inumbo-ID: b4b2b1e3-10f1-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux-mail.net;
	s=protonmail; t=1771876572; x=1772135772;
	bh=FC1oBOhuZpUKRYw5lx0dBf68onwW79KH3ApPc2koKCI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Zyyw9Kg5CFJ0af86va6+BcEVFZSXG6UvzTTKPOrW8JOIog+azGfiCBkl6IHQLApgg
	 mi/WqF78jhHDOCYy9xd6Yz4m5+kK9RA3L70bu0hMfeb72i2S7XjnB7adJ3jV8pF141
	 6wT3iQ0aG6EZiesL6nx0iWTfQeP3seFpptnSJBO2Vk7fjwO0Rd7jB4RJVQxJsscZ5C
	 gknfH26jLVXSB1ZlkZd+VfzLWSuCJ+pHdORd33hhw+p3nwwwomrLqqIEQAJvCxU83q
	 KPniOChXjpfJhE7iz53s/icndqW90Ubc0o6c3qvD65x/3t2WhxsE4Az3g/JXVZMS8q
	 X17DiYxypc/tA==
Date: Mon, 23 Feb 2026 19:56:07 +0000
To: jgross@suse.com
From: David Thomson <dt@linux-mail.net>
Cc: boris.ostrovsky@oracle.com, sstabellini@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, David Thomson <dt@linux-mail.net>
Subject: [PATCH] xen/acpi-processor: fix _CST detection using undersized evaluation buffer
Message-ID: <20260223195602.17122-1-dt@linux-mail.net>
Feedback-ID: 176297775:user:proton
X-Pm-Message-ID: daf5c815bc2d790a7f192f23fabc62b9ff00444f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

read_acpi_id() attempts to evaluate _CST using a stack buffer of
sizeof(union acpi_object) (48 bytes), but _CST returns a nested Package
of sub-Packages (one per C-state, each containing a register descriptor,
type, latency, and power) requiring hundreds of bytes. The evaluation
always fails with AE_BUFFER_OVERFLOW.

On modern systems using FFH/MWAIT entry (where pblk is zero), this
causes the function to return before setting the acpi_id_cst_present
bit. In check_acpi_ids(), flags.power is then zero for all Phase 2 CPUs
(physical CPUs beyond dom0's vCPU count), so push_cxx_to_hypervisor() is
never called for them.

On a system with dom0_max_vcpus=3D2 and 8 physical CPUs, only PCPUs 0-1
receive C-state data. PCPUs 2-7 are stuck in C0/C1 idle, unable to
enter C2/C3. This costs measurable wall power (4W observed on an Intel
Core Ultra 7 265K with Xen 4.20).

The function never uses the _CST return value -- it only needs to know
whether _CST exists. Replace the broken acpi_evaluate_object() call with
acpi_has_method(), which correctly detects _CST presence using
acpi_get_handle() without any buffer allocation. This brings C-state
detection to parity with the P-state path, which already works correctly
for Phase 2 CPUs.

Fixes: 59a568029181 ("xen/acpi-processor: C and P-state driver that uploads=
 said data to hypervisor.")
Signed-off-by: David Thomson <dt@linux-mail.net>
---
 drivers/xen/xen-acpi-processor.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-proces=
sor.c
index 2967039..67a4afc 100644
--- a/drivers/xen/xen-acpi-processor.c
+++ b/drivers/xen/xen-acpi-processor.c
@@ -379,11 +379,8 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *contex=
t, void **rv)
 =09=09=09 acpi_psd[acpi_id].domain);
 =09}
=20
-=09status =3D acpi_evaluate_object(handle, "_CST", NULL, &buffer);
-=09if (ACPI_FAILURE(status)) {
-=09=09if (!pblk)
-=09=09=09return AE_OK;
-=09}
+=09if (!acpi_has_method(handle, "_CST") && !pblk)
+=09=09return AE_OK;
 =09/* .. and it has a C-state */
 =09__set_bit(acpi_id, acpi_id_cst_present);
=20
--=20
2.34.1



