Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ECCF8D752
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2026 14:21:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1283528.1565723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDNai-0004sy-AP; Thu, 16 Apr 2026 14:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283528.1565723; Thu, 16 Apr 2026 14:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDNai-0004sr-64; Thu, 16 Apr 2026 14:21:12 +0000
Received: by outflank-mailman (input) for mailman id 1283528;
 Thu, 16 Apr 2026 14:21:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wDNag-0004sk-RF
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:21:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDNag-00EKYV-81
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 16:21:10 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e0f052-2eae-0a2a0a5409dd-0a2a4509bd4e-18
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:21:10 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e0f056-2497-0a2a45090019-d155802cb0f6-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:21:10 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-483487335c2so88860995e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 07:21:10 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f096d110sm59803515e9.11.2026.04.16.07.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 07:21:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776349269; x=1776954069; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8WDmI4uDUxJdH9DUf7wtpMI5KiM27kuS/AB0o2KQnY0=;
        b=cfyEpxftkkHGYoWYvV2FnztBlT3G2uIBrLiOKnjx9t4SpeJ9uNfCrUohsl+qsMHmIO
         jEmtM01BSfZ6ALk+JwcmLGykokFNGKTAiiV40fNe8UMZDkk90O5w/xKpnPoWPPQCK7/H
         Wrz+v2rnzgJwrTKfsU8kOetG7u73SkZ8LXvyzqjvUcZ3EYQQLRn5taFFMDH7kwrxYm15
         S45kzAxaRaEApLvSkxIBXWGMP8U62fdi9ZkXah3lAoHvGi3KPE2+p9k53pfDnwcabwae
         TOgnfL7c85gjd0IpU8plMv7FMCrdp3foYl6PPj+3L0iSDR8B3bm+InT3UXjR2+SsPiXW
         j/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776349269; x=1776954069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WDmI4uDUxJdH9DUf7wtpMI5KiM27kuS/AB0o2KQnY0=;
        b=bqrkbTNV02WgcDw7/oDgV7GVpebTLCBP9jIWqZPPKazjUR8cfuAs2veBxFv1lJE2Op
         N9/uwO3CeTpB6m2tssFTm5trAsuZfXPK3YjQ5PAUOl6L2MQL/dFiG/a/Gk/5svRglYZY
         Qx//PVKrVlQyt76i63S1PDAsryUrZob6hYU0HYB6aBOpIE+EagoJHXMzZLJcGeLSbUen
         3xjogpUFHDz1h6tReSlkgQ93jS+51Urdnq6ZmvROfnaCANwmfyuOpCPKOu/+PMWQWGYZ
         dY28iHWTYSL+XPuLU1xD8pHpbSz2V+3IhpjW9XOl6lJZOKuQJ3406J6MflS+ZQCORDyQ
         W6Ng==
X-Gm-Message-State: AOJu0YwOiRwWb/r/D2kHIHQcFdSATY+GtIWfyuOLeN9XtPqdDqYe130u
	0CaMxV+vUZ0ldbbw5oniSnUBlfJlyFTASG3s2oyIfZcLxlb8dzvDzO/Q7wAyBQ==
X-Gm-Gg: AeBDieudGWjvHstcltIvOBSdR14Kp+xJG0n4GwH5I+0OwwJoHxzSp/cw2u0rkktjUvE
	ScdlgIS8J1dP7lqR8wgtEzf+1IZXBphw0TxTEWvtJIcKGU6lyM6vCr1LeS2eLNJJ92JVixiyCv7
	nqj8/EEQN3InsyXaPOi4JpnhFBAEpJGnRU9iHIlbmV3dOblD5Va+/Xf4s4nb+Cgl3yFpLOZ1n82
	j+Uh9FPZGSH+WirfdfnXxcLX9WJvWn2QD5iLHFTmEfiOGErl8GSBtjhzjMmPpkU1cXgqFSoiJWD
	FtnhSqU2sV0vNgjUiMR7jUhYO4eHxcbF+4/CXr6PlirUpw9D0nzO/fEvr02UTL+1yu5oB8ucOq9
	+7mw+D0MJ5lLSlf6nY0srU+nfWsAtKkfXXHhVmCJ7Yv/bu3EWxNiJkx3nd6t1CYaQD3TGpfm3ef
	myFw1sk/u62JTwGA4VDkAW0Dd5Vgjf8iT/YWt3hzkh0Kcfc2AINpBK60xHEXAx1AW2S1v4InMjt
	KLw47bQvJeUOcQ=
X-Received: by 2002:a05:600c:8883:b0:488:9e54:94c8 with SMTP id 5b1f17b1804b1-488d689cf93mr278742385e9.31.1776349269213;
        Thu, 16 Apr 2026 07:21:09 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 0/3] dom0less: various updates
Date: Thu, 16 Apr 2026 16:20:57 +0200
Message-ID: <cover.1776340422.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1776349270-93979A53-23B95089/10/73395122804
X-purgate-type: spam
X-purgate-size: 3822

This patch series introduces a new field to track not-yet-used phandles as there
are some use cases where RISC-V needs to know which phandle number could
be used for generating a device tree node.

For example, on the RISC-V side in make_cpus_node() [1] it is necessary to know
which phandle number is unused to use it for device tree node generation.

Here is an example of generated guest DTB:
    cpus {
    ...
      cpu@0 {
    ...
        interrupt-controller {
          compatible = "riscv,cpu-intc";
          #interrupt-cells = <0x1>;
          interrupt-controller;
          phandle = <0xfdea>;
        };
      };
    };

    /soc/imsics@28000000 {

      interrupts-extended = <0xfdea 0x9 >;

      phandle = <0xfdeb>;
    };

    /soc/aplic@d000000 {
    ...
      msi-parent = <0xfdeb>;
      phandle = <0x1>;
    };

Note that phandles for imsic and riscv,cpu-intc are generated in this example
not by get_next_free_phandle(), that is why they have such big numbers.

For non-RISC-V people, APLIC is an interrupt controller (something like GIC in
Arm), IMSIC is an interrupt controller that provides MSI and connects to
each CPU.

So (based on the DTS above) for APLIC, kinfo->phandle_intc is reused, which
will also be re-used for the device node's interrupt property. For all others, I
just introduced GUEST_PHANDLE_LAST [2] and used it for generation [3]. But I expect
that it could be useful for other architectures too so I just moved it to common
and re-use pfdt to understand what the maximum used phandle is.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/interrupt-controller/riscv%2Ccpu-intc.txt
[2] https://lore.kernel.org/xen-devel/ccd6d21b224b478c88ca5f2fdd2d1dd507671510.1773157782.git.oleksii.kurochko@gmail.com/
[3] https://lore.kernel.org/xen-devel/fd64b8526a23e9d7775b9b48c5a933b0673c4fba.1773157782.git.oleksii.kurochko@gmail.com/
           *************************************

Another thing introduced in this patch series is moving domain type to common
code as several architectures (ARM and RISC-V for now) use them and it
looks pretty architecture-independent. Also, is_64bit_domain() is used by
dom0less common code, so I found it useful also to move is_{32,64}bit_domain
macros to common code.

           *************************************

And the last thing is changing the prototype of make_cpus_node() to be aligned
with other make_*_node() and since RISC-V will need access to the free_phandle field
(even if it will be moved to kinfo->arch.free_phandle) and for the reason that
this ->free_phandle is updated in make_*_node(), the kinfo argument is passed as
non-const.

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2457632124

Oleksii Kurochko (3):
  xen/dom0less: introduce free_phandle in struct kernel_info
  xen/dom0less: pass kernel_info struct instead of fdt to
    make_cpus_node()
  xen: introduce CONFIG_HAS_DOMAIN_TYPE

 xen/arch/Kconfig                        |  3 ++
 xen/arch/arm/Kconfig                    |  1 +
 xen/arch/arm/arm64/domctl.c             |  4 +-
 xen/arch/arm/dom0less-build.c           | 14 -------
 xen/arch/arm/domain_build.c             | 11 +++---
 xen/arch/arm/include/asm/domain.h       | 12 ------
 xen/arch/arm/include/asm/kernel.h       |  4 --
 xen/arch/arm/kernel.c                   | 10 ++---
 xen/common/device-tree/dom0less-build.c | 51 ++++++++++++++++++-------
 xen/include/xen/dom0less-build.h        |  2 -
 xen/include/xen/domain.h                | 13 +++++++
 xen/include/xen/fdt-domain-build.h      |  8 +++-
 xen/include/xen/fdt-kernel.h            |  8 ++++
 xen/include/xen/sched.h                 |  4 ++
 14 files changed, 86 insertions(+), 59 deletions(-)

-- 
2.53.0


