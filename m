Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A57CA5FC5
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 19:31:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437865.1656805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xC00u-0002qi-3w; Wed, 30 Sep 2026 19:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437865.1656805; Wed, 30 Sep 2026 19:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xC00u-0002qb-0K; Wed, 30 Sep 2026 19:30:48 +0000
Received: by outflank-mailman (input) for mailman id 1437865;
 Wed, 30 Sep 2026 19:30:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f3cc3da00003f66@swg.vates.tech>)
 id 1xC00t-0002qT-1H
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 19:30:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xC00r-0068VF-Oz
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 21:30:45 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f3cc3da00003f66@swg.vates.tech>)
 id 6abd6360-2eae-0a2a0a5409dd-0a2a450cab04-34
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 21:30:45 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f3cc3da00003f66@swg.vates.tech>)
 id 6abd6365-f479-0a2a450c0019-b9ff1c2390e9-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 21:30:45 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0f3cc3da00003f66.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 30 Sep 2026 19:30:43 +0000
Received: from Skynet-1 (lfbn-gre-1-317-75.w90-112.abo.wanadoo.fr
 [90.112.38.75]) (Authenticated sender: olivier.lambert@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2689581CA2;
 Wed, 30 Sep 2026 21:30:42 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=Kpd2jV7S7d6YBx5ym+oeKqua+T/Z4Y5AJYZSAtyvwqQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=Fse6S334g6hpF5jAhWMa33vHJGuWpp+xYWi2xLCSntjTM85/P6/PbYLi1T8vYTrsfFlZXjGIz
 7W4ATnQjJFk0w1N/b3W4nOcbTHKp0yztH/9oXYcLjthJf+7/2zyLABijSuJAtd2XRtfm6fAh5ip
 FPktmF68sLYJTAYtFJzldbmEzmZ8SxxEEgsY7ge0hKDwzrP/W9eomApeskY7W9xq+KhAbp/JksK
 etk2mogDPtiAQ7FqOeJWQcR6tQdYwNEHqXUg558IWrW7bivWs6FTe2KnWrIq/HnP1HcWuxE4ZGS
 CJQzVF/DiCIKUs4CU8/OEtzonXqD/zEGrtvQbthzFwPw==
X-Zone-Loop: becaa3a908a3e42b53f2b6bcd66239d0eff7406fcb2b
x-campaign-type: default
x-transaction-id: 14f70a98-d2c0-4e22-aef1-6670ab5187b5
x-swg-uid: 01-8dac6ee2-e6cc-46f5-ae7a-e5ac200a2744
X-Mailer: Sweego
Message-ID:
 <1790796643.8631fc262581453bbf619ec5b2062170.1a0f3cc3da00003f66@vates.tech>
x-swg-bid: 1790796643.8631fc262581453bbf619ec5b2062170.1a0f3cc3da00003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Olivier Lambert <olivier.lambert@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [RFC PATCH v2] x86/ACPI: optimise C3 entry on AMD CPUs
Date: Wed, 30 Sep 2026 19:30:27 +0000
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.55b.68ab02269abdac5e.1a0f3cc37d7.8965732be61e6872=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790796642263
X-purgate-ID: tlsNG-d25034/1790796645-5093EA5B-4D8B2ADE/0/0
X-purgate-type: clean
X-purgate-size: 3965

---=Part.55b.68ab02269abdac5e.1a0f3cc37d7.8965732be61e6872=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

All Zen or newer CPU which support C3 shares cache=2E Its not necessary to
flush the caches in software before entering C3=2E This will cause drop in
performance for the cores which share some caches=2E ARB_DIS is not used
with current AMD C state implementation=2E So set related flags correctly=
=2E

Signed-off-by: Deepak Sharma <deepak=2Esharma@amd=2Ecom>
Acked-by: Thomas Gleixner <tglx@linutronix=2Ede>
Signed-off-by: Rafael J=2E Wysocki <rafael=2Ej=2Ewysocki@intel=2Ecom>
Origin: https://git=2Ekernel=2Eorg/torvalds/p/a8fb40966f19
[Port to Xen=2E  Include Hygon=2E]
Assisted-by: Claude-Code:claude-opus-5-5
Signed-off-by: Olivier Lambert <olivier=2Elambert@vates=2Etech>
Reviewed-by: Jason Andryuk <jason=2Eandryuk@amd=2Ecom>
---

Notes:
    Changes in v2:
     - Resend with git send-email: my mail client stripped the whitespace =
from
       v1, so its diff could not be applied=2E  No code change=2E
     - Picked up Jason's Reviewed-by=2E
   =20
    Found on XCP-ng 8=2E3 (Xen 4=2E17=2E6) on a Ryzen 5 7600 (Zen 4, famil=
y 0x19)
    whose _CST lists C1 (HLT) plus C2 and C3 as SYSIO states (C3 exit
    latency 350us)=2E  With bm_check =3D=3D 0, every C3 entry executes WBI=
NVD=2E
   =20
    Measured under a VM-to-VM network load, in 25s windows:
     - ~140 WBINVD/s, 65-69us each on average, 300us at worst=2E
     - Spinning on each CPU in turn with IRQs off and reading the TSC show=
s
       gaps of up to 222us; none with this change=2E  The SMI count (PMC e=
vent
       0x2b, validated by counting cycles on the same counter) stayed at 0=
,
       and NMIs didn't line up with the gaps=2E
     - credit1's do_schedule() occasionally took up to 262us, with IRQs
       off; at most 4=2E4us with this change=2E
     - xenpm set-max-cstate 1 removes the stalls too, which points at C3
       entry=2E
   =20
    This change was booted and measured as a backport on 4=2E17=2E6 only=
=2E  On
    staging it is build-tested=2E  It also covers Hygon, as Linux does tod=
ay
    through X86_FEATURE_ZEN; the original Linux commit was AMD-only=2E
   =20
    This will conflict trivially with Alejandro's pending "x86/acpi: Migra=
te
    vendor checks to cpu_vendor()"; happy to rebase on top of it=2E
   =20
    Possibly a backport candidate=2E

 xen/arch/x86/acpi/cpu_idle=2Ec | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/xen/arch/x86/acpi/cpu_idle=2Ec b/xen/arch/x86/acpi/cpu_idle=
=2Ec
index 56b22a2=2E=2Eb2bca4d 100644
--- a/xen/arch/x86/acpi/cpu_idle=2Ec
+++ b/xen/arch/x86/acpi/cpu_idle=2Ec
@@ -1065,6 +1065,24 @@ static void acpi_processor_power_init_bm_check(stru=
ct acpi_processor_flags *flag
      */
     if ( c->vendor =3D=3D X86_VENDOR_INTEL )
         flags->bm_control =3D 0;
+
+    if ( (c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
+         c->family >=3D 0x17 )
+    {
+        /*
+         * For all AMD Zen or newer CPUs that support C3, caches
+         * should not be flushed by software while entering C3
+         * type state=2E Set bm_check to 1 so that Xen doesn't
+         * need to execute cache flush operation=2E
+         */
+        flags->bm_check =3D 1;
+        /*
+         * In current AMD C state implementation ARB_DIS is no longer
+         * used=2E So set bm_control to zero to indicate ARB_DIS is not
+         * required while entering C3 type state=2E
+         */
+        flags->bm_control =3D 0;
+    }
 }
=20
 #define VENDOR_INTEL                   (1)
--=20
2=2E53=2E0



-- 
Olivier Lambert | Vates CEO

XCP-ng & Xen Orchestra - Vates solutions
=
Book a meeting with me: https://calrs=2Evates=2Etech/u/olivier-lambert
web:=
 https://vates=2Etech
---=Part.55b.68ab02269abdac5e.1a0f3cc37d7.8965732be61e6872=---

