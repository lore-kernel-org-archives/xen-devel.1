Return-Path: <SRS0=1DY5=BW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F77DC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2020 17:43:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C9BE20781
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2020 17:43:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=trmm.net header.i=@trmm.net header.b="x3zn6dVh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C9BE20781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5umA-0008Fe-6V; Wed, 12 Aug 2020 17:42:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LFni=BW=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1k5um9-0008FZ-0w
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 17:42:57 +0000
X-Inumbo-ID: 9ddaa9bd-cdeb-4a29-9891-5170fa170552
Received: from mail-40131.protonmail.ch (unknown [185.70.40.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ddaa9bd-cdeb-4a29-9891-5170fa170552;
 Wed, 12 Aug 2020 17:42:54 +0000 (UTC)
Date: Wed, 12 Aug 2020 17:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1597254173;
 bh=TncjQOnANMp/VJE2TG6+QX42ZO3WtSPCWr/QYT0LTKM=;
 h=Date:To:From:Reply-To:Subject:From;
 b=x3zn6dVh0rznrzRzzDah5hzza0Ec61+Dt4ZSm9S9bpOnaPkqsrdtejmV0RsWzWfsi
 mfYuDnacvo/0Bvjh7xR0jnI9nlQsAV8F+1hPBC3VUz5Yg4J/ZCmhrun/kaUzcRJXo+
 bb1NFVKUti2515BaSa+3eWjY52a4J5wGO0xrUJLI=
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Trammell Hudson <hudson@trmm.net>
Subject: [PATCH] arch/x86/setup.c: Ignore early boot parameters like
 no-real-mode
Message-ID: <On7D3GbE8WWWH3f-1bSvUFQDxFcHP3yg6NdfvffgKqPRjQmJKsPBKsPgCCEEHbt9r2A3yxvf3gARonkKF9M_n1f3UfLEFpnZ29J2-Jc35ls=@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There are parameters in xen/arch/x86/boot/cmdline.c that
are only used early in the boot process, so handlers are
necessary to avoid an "Unknown command line option" in
dmesg.

This also updates ignore_param() to generate a temporary
variable name so that the macro can be used more than once
per file.

Signed-off-by: Trammell hudson <hudson@trmm.net>

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c9b6af8..4b15e06 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -679,6 +679,15 @@ static void __init noreturn reinit_bsp_stack(void)
     reset_stack_and_jump_nolp(init_done);
 }

+/*
+ * x86 early command line parsing in xen/arch/x86/boot/cmdline.c
+ * has options that are only used during the very initial boot process,
+ * so they can be ignored now.
+ */
+ignore_param("no-real-mode");
+ignore_param("edd");
+ignore_param("edid");
+
 /*
  * Some scripts add "placeholder" to work around a grub error where it ate=
 the
  * first parameter.
diff --git a/xen/include/xen/param.h b/xen/include/xen/param.h
index c2fd075..b77f7f2 100644
--- a/xen/include/xen/param.h
+++ b/xen/include/xen/param.h
@@ -35,6 +35,10 @@ extern const struct kernel_param __setup_start[], __setu=
p_end[];
     __attribute__((__aligned__(1))) char
 #define __kparam          __param(__initsetup)

+#define __TEMP_NAME(base,line) base##_##line
+#define _TEMP_NAME(base,line) __TEMP_NAME(base,line)
+#define TEMP_NAME(base) _TEMP_NAME(base,__LINE__)
+
 #define custom_param(_name, _var) \
     __setup_str __setup_str_##_var[] =3D _name; \
     __kparam __setup_##_var =3D \
@@ -71,9 +75,9 @@ extern const struct kernel_param __setup_start[], __setup=
_end[];
           .len =3D sizeof(_var), \
           .par.var =3D &_var }
 #define ignore_param(_name)                 \
-    __setup_str setup_str_ign[] =3D _name;    \
-    __kparam setup_ign =3D                    \
-        { .name =3D setup_str_ign,            \
+    __setup_str TEMP_NAME(__setup_str_ign)[] =3D _name;    \
+    __kparam TEMP_NAME(__setup_ign) =3D                    \
+        { .name =3D TEMP_NAME(__setup_str_ign),            \
           .type =3D OPT_IGNORE }

 #ifdef CONFIG_HYPFS


