Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA39606A331
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256 header.s=google header.b=TBXjU632
Received: from list by lists.xenproject.org with outflank-mailman.1501218.1697264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVsSw-0001dy-Co; Tue, 24 Nov 2026 15:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501218.1697264; Tue, 24 Nov 2026 15:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVsSw-0001dr-A9; Tue, 24 Nov 2026 15:29:54 +0000
Received: by outflank-mailman (input) for mailman id 1501218;
 Tue, 24 Nov 2026 15:29:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vitalii.komisarenko@essensium.com>)
 id 1xVsSt-0001dl-Si
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 15:29:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVsSs-009z4X-Ox
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:29:50 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vitalii.komisarenko@essensium.com>)
 id 6b05ad63-bab6-0a2a0a5309dd-0a2a450ceaf8-32
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 16:29:50 +0100
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vitalii.komisarenko@essensium.com>)
 id 6b05ad6e-f479-0a2a450c0019-d155dd2ad85f-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 16:29:50 +0100
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-498f5fa5103so2788800f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 07:29:50 -0800 (PST)
Received: from vk-HP-Laptop-14-ep1xxx (ptr-94-109-41-161.dyn.orange.be.
 [94.109.41.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4b33a596f9csm9250963f8f.12.2026.11.24.07.29.49
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 07:29:49 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=mind.be header.i="@mind.be" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1795534190; x=1796138990; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=acqc+s/Er8LH4l5HiJNGiLJSQqIrl8UyhK8RVjgGrIU=;
        b=TBXjU632Y7PCxo7iODjScR8VM0/bMyHhBa4yZvNEFJO6c4AALvW2OUEKfuIC+twjnG
         NstsE/YTiJlzdL0OJWXtLVN8goAPmWzVZwj8OniMyAYk6GWAB29hCo9WicNtiyrPubTo
         uCj/gcH03V13r/HK0BXRQ0ckGftLP2pg1O8FcKq8aTU+47oqtHq6Lj/ZpL2ied5zWr4Z
         bryg5QrkFjN5X8CBILZ+zSyipZQfa44/xTtLegosQlCR6JsqFaYVz/Sy0PaopRB66tne
         h46Ku883B5adQkFG00HyiEzHFba1GpkQJUKMOvk8/X+qtSIkJHyuOVoLqt770zzlkSsO
         tN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534190; x=1796138990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=acqc+s/Er8LH4l5HiJNGiLJSQqIrl8UyhK8RVjgGrIU=;
        b=C8TzQgSvMfxXy1et/jDLuPedjY/5IgNNYBPIWQZ/Fr5GWwHj1hvCVeDZX6UkKWVuQ8
         Gqp6R+R9g5I8mXcA7tEI4/qY9ecD3KPhQrfif5Gff5OLANq/VDHW6RV9zH5j00Edksmb
         vvvhTXxVcK1bhhYvJIr1gN2o069d8kGl4hK2XXqD+inZum3sLDjqIM4YM7Yf5fFvyyUU
         JmJ299yE5OPcr9es2Hv4Sz9EWzzxybkuJP1sPWnHMJSQxxP5n+PvSf2E+PkcZeia3hef
         HF6p2JdwHINBMfoKfG67mZm9O4q4AmdXte6JZcnBB5ae+ZqEaf13q7TFPsULFiBsp8S4
         NiXg==
X-Gm-Message-State: APuU4Z8gTiNwHkSQu2/7cYGPlCq3zyp02XyQXo6FlmeU1uEHdJYxUoJ1
	cYKbLk2w89NZ6iP/6BdchDZ1XpaM30QWEGYjM4IODthGXDCTGpzry8Oq3ig1V1CVDZAmvWYJBbZ
	fSzZzVN4=
X-Gm-Gg: AZFdTZfDb8N+YcyDwPwwtO/EKxxYrl7rmoJY5RRtn9t6HGa0b+Xp6wiL7QZJN/yJMtG
	w8f/CHZ734ZT5T8PDOupioFWu9gbp2fglr8UBSKLVijzmjKuZYnidBlaGiYB1Odu6YAA0qTG1XV
	NZLWgqCtYxVAUlQMCCTNiizgNUiKGnPmqYakK20q8Ppkaa43oxr7KtrBXwzJ7RRNtb14t/QHmav
	528yxiPLtQWr834ctvtODFXlrGvqaePjvTAHL4nMoTvsI6Bdte9+N3Aa/LprTZxaOtfEkQ6w2IQ
	GRFIx9JC3JoVm/MYBnDSgav8ySI7AsPCtt/ACGNUiBgeiodAal3k52gqv0iV9N4Nl0mjUV1q94I
	412LM8whcnGE8jl7AdAQy2iOw2cDDULH0aeE01J/75tLYW0hordXb7S6MoQIQbcQpKvQRwuyvmM
	79diTsiXMZbv0kaa0gbrWx00xQjgBJCAM6sKc8Q+RbwLpHP5Dmrma9/rFwBT7g5ZGEPV0pFKQQ7
	7dedW0IIT1rsDYflemJRjEyB4EIQUV1nNCO4qtG02trn9IR9uhiii3tWs6QF8inXoYQlbPTheIS
	DWui9zK0NxJ0VwUCuMVEfF6gn8gjSNelAPPCfwfnLmGAUBmTJQCgLvcifGEITjW9vvZJpNRJAsT
	+NDI6TnU6SA==
X-Received: by 2002:a05:6000:470b:b0:4a6:ac28:eb57 with SMTP id ffacd0b85a97d-4abb3678d7cmr30494184f8f.17.1795534189545;
        Tue, 24 Nov 2026 07:29:49 -0800 (PST)
From: Vitalii Komisarenko <vitalii.komisarenko@mind.be>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] Add design note for using ceedling for tests
Date: Tue, 24 Nov 2026 16:29:47 +0100
Message-ID: <20261124152947.1403644-1-vitalii.komisarenko@mind.be>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1795534190-008CDA5B-3B6569B5/0/0
X-purgate-type: clean
X-purgate-size: 25385
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Vitalii Komisarenko <vitalii.komisarenko@mind.be>
Signed-off-by: Hugo Cornelis <hugo.cornelis@essensium.com>
---
 .../fusa-ceedling-design-note.rst             | 575 ++++++++++++++++++
 1 file changed, 575 insertions(+)
 create mode 100644 docs/fusa/test_framework/fusa-ceedling-design-note.rst

diff --git a/docs/fusa/test_framework/fusa-ceedling-design-note.rst b/docs/fusa/test_framework/fusa-ceedling-design-note.rst
new file mode 100644
index 0000000000..4bee0b9b74
--- /dev/null
+++ b/docs/fusa/test_framework/fusa-ceedling-design-note.rst
@@ -0,0 +1,575 @@
+:orphan:
+
+====================================================
+Unit Testing Xen for Functional Safety with Ceedling
+====================================================
+
+:Date: 2026-10-27
+:Author: Vitalii Komisarenko, Hugo Cornelis
+:Audience: Xen FuSa team
+:Purpose: Design note -- the approach, rationale and developer guide for writing
+          Xen functional-safety test procedures with Ceedling.
+:Status: Draft
+
+.. contents::
+   :local:
+   :depth: 2
+
+Summary
+=======
+
+The Xen Functional Safety (FuSa) effort verifies each low-level
+requirement with executable test code -- a *test procedure* (TP) --
+that traces back to the requirement it checks.  We write those TPs
+with **Ceedling** (the Unity assertion library and the CMock mocking
+generator, orchestrated by Ceedling).
+
+These three properties make Ceedling a good fit:
+
+* **Auto-mocking.** CMock generates mocks from headers, so a single
+  Xen function can be isolated from its dependencies without
+  hand-written stubs (such as device tree, platform, and per-CPU
+  state).
+* **Configurable toolchain.** Ceedling lets us override the compiler
+  and the test runner, so tests are cross-compiled for ARM64 and
+  executed under ``qemu`` on the target ISA.
+* **Mature documentation.** Ceedling, Unity and CMock are well
+  documented and the configuration is self-documenting.  This lowers
+  onboarding cost and supports tool-qualification reasoning.
+
+Consequently, the FuSa effort does not need to modify the Xen source
+under test.
+
+The rest of this note gives the rationale (why Ceedling), the
+framework mechanics (how it works), and a step-by-step developer guide
+with a complete worked example.
+
+
+Context and goals
+=================
+
+The FuSa approach is **requirements-based**:
+
+#. For each target function the control flow is analysed into
+   low-level requirements (LLRs).
+
+#. Each LLR gets test cases (TCs) with boundary-value sub-cases.
+
+#. Each sub-case gets an executable test procedure (TP).
+
+#. Related LLRs trace back to the same high-level requirement (HLR).
+   An HLR is authored by taking a product requirement plus the
+   function's design spec and stating, in a "shall" form, what the
+   implementation does to fulfil it.
+
+
+Traceability is maintained from the test code back up to the
+high-level requirements.  TPs are at the bottom of the ``HLR -> LLR ->
+TC -> TP`` chain.
+
+Testing Xen source at this granularity has to satisfy several
+constraints:
+
+* **C, at function granularity.** The units under test are individual
+  Xen functions in C code (for example ``preinit_xen_time``).
+* **Isolation from the rest of the hypervisor.** A C code function may
+  pull in device-tree lookups, platform hooks, per-CPU state and ARM
+  system registers.  These must be replaced with controllable
+  substitutes.
+* **The ARM target ISA.** The code reads ARM CPU registers and is
+  built for ARM64.  Tests should be executed on that ISA.
+* **Boundary-value, sub-case-structured tests.** TCs define
+  equivalence classes, normal-range boundary values, and robustness
+  conditions, with one TP per sub-case.
+* **Traceability and evidence.** Each TP carries the TC ID it
+  realises.  The effort must evidence requirement compliance and
+  robustness alongside structural code coverage.
+* **No source modification.** Instrumenting a function for testing
+  must not change the Xen source under test.
+
+
+The decision: Ceedling
+======================
+
+What we chose
+-------------
+
+**Ceedling** is a Ruby-orchestrated bundling of the **Unity**
+assertion library and the **CMock** mocking generator.  It is chosen
+as the unit-test framework for FuSa test procedures.  Tests live in
+``xen-integration/automation/ceedling_test``, are built with an ARM64
+cross-toolchain and are executed under ``qemu``.
+
+
+How it meets our needs
+----------------------
+
+Each constraint above maps onto a concrete capability (the mechanics
+are detailed under `How Ceedling works`_):
+
+* **C-native testing.** Unity's ``TEST_ASSERT_*`` macros and CMock's
+  generated mocks are plain C.  There is no C++/C impedance when
+  asserting on C types or mocking C functions.
+* **Auto-mocking of dependencies.** CMock generates a mock from a
+  header by prefixing ``mock_`` (this is configurable) and isolating
+  the unit under test without hand-written stubs.
+* **White-box access to internals.** A TP compiles the unit under test
+  so a test can drive internal paths and read file-scope state to test
+  internals without editing the source.
+* **Execution on the ARM target.** Ceedling's configurable tools
+  cross-build with ``aarch64-linux-gnu-gcc`` and run the executable
+  under ``qemu``, reflecting real ARM system-register
+  behaviour.
+* **A mocking model that matches boundary-value TCs.** Each sub-case
+  is expressed as a small, explicit set of expectations with one TP
+  per sub-case.
+* **Coverage evidence.** Ceedling's ``gcov`` plugin produces statement and
+  branch-coverage reports tying executed TPs to the LLR branches they
+  cover (``./runtest.sh coverage``).  The same TPs also build with
+  ``clang-19`` and ``llvm-cov`` source-based coverage
+  (``./runtest.sh coverage-llvm``), which adds MC/DC.
+* **Zero source footprint.** The source stays untouched at all times.
+  A ``panic`` is intercepted by a small link-time shim.
+* **Mature documentation and a self-documenting configuration.**
+  Ceedling, Unity and CMock are well documented
+  (`throwtheswitch.org <https://www.throwtheswitch.org/>`_),
+  and the main Ceedling configuration file ``project.yml`` is
+  commented option by option.  This makes onboarding straightforward
+  and supports evaluation of tool workflows by users.
+
+
+Alternatives considered
+-----------------------
+
+* **Unity + CMock wired up by hand.** This is essentially what
+  Ceedling *is*, minus the orchestration, mock generation and
+  configuration.  Adopting Ceedling avoids rebuilding that
+  boilerplate.
+* **GoogleTest / GoogleMock.** These are C++-centric.  Mocking plain C
+  functions and white-box testing of C static code is awkward and it
+  adds an unused C++ toolchain.
+* **In-hypervisor / kernel-style harnesses (e.g. KUnit-like).** These
+  run tests inside or close to a running system rather than isolating
+  a single function.  They do not give the per-function isolation or
+  the requirement-to-test mapping that the FuSa process needs.
+* **A bespoke harness.** Reinvents mocking and a runner, carries
+  ongoing maintenance and has no ecosystem or documentation.
+
+
+Trade-offs and limitations
+--------------------------
+
+* **Ruby / Ceedling dependency.** Ceedling is a Ruby gem; CI must
+  install Ruby and the gem and it is version-sensitive (for example it
+  is installed with ``--no-document`` to work around an RDoc crash on
+  Debian bookworm's Ruby). Downstream safety baselines pin
+  the exact gem version in ``test_configure.sh`` for reproducible verification.
+* **CMock fragility on complex headers.** Generating mocks from real
+  Xen headers needs tuning and sometimes post-processing of the
+  generated mocks (this is explained in the harness ``README.md``).
+* **White-box coupling.** Compiling the ``.c`` in and overriding
+  macros ties a TP to the source's internal structure.  Consequently,
+  refactoring a unit can break tests.
+* **qemu execution cost.** Running on the ARM target adds build and
+  runtime overhead and requires managing prebuilt kernel/rootfs
+  artifacts and ``qemu`` images.
+
+
+Partials (not used) and static functions
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Ceedling's ``partial`` module can expose ``static``/``inline``
+functions and file-scoped ``static`` variables for direct testing, by
+stripping the keywords and compiling a rewritten source file.  Xen
+uses many ``static`` functions, so in principle partials would help.
+
+On this project, ``static`` functions are generally treated as
+implementation details tested through public entry points, so the
+``partials`` module is **not used**.  Note that because the ``.c`` file
+is included directly, file-scope static functions and variables are
+already in scope if an LLR or structural coverage objective requires
+direct invocation.
+
+
+How Ceedling works
+==================
+
+Unity and CMock
+---------------
+
+**Unity** provides the assertions (``TEST_ASSERT_TRUE``,
+``TEST_ASSERT_EQUAL_*``, ...) and the test runner scaffolding.
+**CMock** generates mock implementations of dependency functions so
+the unit under test can be exercised in isolation and its
+interactions checked.  Ceedling wires both together and drives the
+build.
+
+
+Auto-mocking (the ``mock_`` API)
+--------------------------------
+
+Including ``mock_<header_filename>.h`` makes CMock generate a mock of
+every function that ``<header_filename>.h`` declares (the ``mock_``
+prefix is configured in ``project.yml``).  Each mocked function gains
+a family of control functions, the ones used in the TPs being:
+
+* ``<fn>_ExpectAnyArgsAndReturn(value)`` -- expect a call (any
+  arguments) and return ``value``.
+* ``<fn>_IgnoreAndReturn(value)`` -- allow any number of calls, return
+  ``value``; used for calls on the path that are not the point of the
+  sub-case.
+* ``<fn>_ReturnThruPtr_<arg>(ptr)`` -- fill an out-parameter through
+  its pointer.
+
+
+
+The white-box test file
+-----------------------
+
+A ``*.tp.c`` file compiles the unit under test *in*, under a
+``CEEDLING_TEST`` guard, after including the mocks and redirecting
+anything that cannot be mocked through a header:
+
+
+.. code-block:: c
+
+    #ifdef CEEDLING_TEST
+    #include "test_support.h"
+
+    #include "mock_device_tree.h"     // CMock mocks of the dependencies
+    #include "mock_platform.h"        // (mock_cpu.h, mock_event.h,
+    /* ... mock_softirq.h, mock_vgic.h, ... */
+    #include "panic_trap.h"           // trap panic() instead of aborting
+    #include "unity.h"
+    #include <asm/time.h>
+
+    #define SYSTEM_CLKFREQ (1000 * 1000 * 1000) // 1GHz
+
+    // Redirect what cannot be mocked through a header to local fakes:
+    #define get_cycles        fake_get_cycles
+    #define READ_SYSREG(reg)  fake_read_sysreg(#reg)
+
+    #include "time.c"                  // the unit under test, compiled in
+
+    #undef get_cycles
+    #undef READ_SYSREG
+    #endif
+
+``setUp`` runs before each test and resets the fixtures, including the
+panic trap:
+
+
+.. code-block:: c
+
+    void setUp(void)
+    {
+        test_device_node.used_by = 0;
+        read_sysreg_count = 0;
+        mock_rate = 0;
+        mock_cntfrq_el0 = SYSTEM_CLKFREQ;
+        cpu_khz = 0;
+        panic_trap_reset();
+    }
+
+
+This is what "white-box" means here: the test sees the unit's
+internals (file-scope variables such as a device node's ``used_by`` or
+``cpu_khz``) and can inject fakes for low-level accessors -- all
+without touching the Xen source.
+
+
+Trapping ``panic``
+------------------
+
+Some requirements are about calling ``panic`` (stopping
+initialization).  A real ``panic`` would end the test process, so
+``libpanic_trap`` provides a ``panic`` definition that records the
+call and ``longjmp``\ s back:
+
+
+.. code-block:: c
+
+    bool panic_trap_run(void (*fn)(void)) {
+        panic_active = 1;
+        if (setjmp(panic_env) == 0) {
+            fn();                 // returned normally -> no panic
+            panic_active = 0;
+            return false;
+        }
+        panic_active = 0;         // longjmp'd here from panic() -> panicked
+        return true;
+    }
+
+
+So ``panic_trap_run(fn)`` returns ``true`` if ``fn`` panicked and
+``false`` if it returned normally -- exactly what a pass/fail
+assertion needs. (For functions with arguments or return values,
+wrap the call in a parameterless local helper function).
+
+
+Cross-compilation and execution under QEMU
+------------------------------------------
+
+Ceedling's default runner executes the compiled test natively; the
+Arm-target execution is built on its configurability rather than
+provided out of the box.  In ``project.yml`` the ``:tools:`` point
+compilation and linking at ``aarch64-linux-gnu-gcc``, and the test
+runner is a project script (``test/script/run_qemu.sh``).  Tests are
+therefore cross-built for arm64 and run under **full-system QEMU** (a
+booted arm64 kernel/rootfs that executes the test), and the QEMU
+return code becomes the pass/fail result.  The operational side of
+this -- setup and commands -- is in `Developing a test procedure`_.
+
+
+Developing a test procedure
+===========================
+
+
+Prerequisites and one-time setup
+--------------------------------
+
+The harness targets ARM64 and runs under ``qemu``, so it needs a
+cross-toolchain, ``qemu`` and Ceedling.  ``test_configure.sh``
+automates the setup:
+
+* installs ``gcc-aarch64-linux-gnu``, ``libc6-dev-arm64-cross``,
+  ``qemu-system-arm``, ``ipxe-qemu``, ``ruby`` and the tools needed to
+  build Xen, and a pinned ``ceedling`` gem (the version is set in
+  ``test_configure.sh``);
+* resolves ``XEN_SOURCE`` and builds Xen for arm64 if its
+  autogenerated headers (``asm-offsets.h``, ``compile.h``) are absent;
+* prepares the ``qemu`` kernel/rootfs images from prebuilt artifacts;
+* generates ``project.yml`` from ``project.yml.in`` with
+  ``XEN_SOURCE`` resolved.
+
+
+Harness layout and configuration
+--------------------------------
+
+
+.. code-block:: text
+
+    automation/ceedling_test/
+        project.yml.in                     configuration template (XEN_SOURCE substituted in)
+        gcov.yml                           Ceedling mixin for "runtest.sh coverage" (gcov)
+        llvm-cov.yml                       Ceedling mixin for "runtest.sh coverage-llvm" (clang)
+        test_configure.sh                  one-time environment setup
+        runtest.sh                         build / clean / run / coverage wrapper around ceedling
+        test/
+            test_xen_time.tp.c             TPs for the time target
+            test_xen_pt.tp.c               TPs for the pt target
+            script/run_qemu.sh             QEMU runner invoked as the test executable
+            script/run_qemu_gcov.sh        QEMU runner for gcov runs; collects the .gcda files
+            script/make_llvm_project.rb    derives project-llvm.yml (clang compiler and linker)
+            script/compare_coverage.py     writes coverage/comparison.md from both reports
+            support/llvm-profile-list.txt  limits clang instrumentation to xen/arch/arm/*.c
+        libpanic_trap/                     link-time shim that traps panic()
+
+
+Key choices in ``project.yml`` and what they do in practice:
+
+* ``:defines:`` adds ``CEEDLING_TEST`` to every test build.  The
+  ``*.tp.c`` files use it to guard the mock includes, the macro overrides
+  and the ``#include`` of the unit under test.
+* ``:tools:`` sets ``:test_compiler:`` and ``:test_linker:`` to
+  ``aarch64-linux-gnu-gcc``, so tests are built for arm64, and
+  ``:test_fixture:`` to ``test/script/run_qemu.sh``, which runs the test
+  executable under QEMU and turns its exit code into the pass/fail result.
+* ``:cmock:`` controls how mocks behave:
+
+  * ``:mock_prefix: 'mock_'`` -- including ``mock_<header>.h`` in a test
+    is what makes Ceedling generate a mock of that header.
+  * ``:when_ptr: :compare_data`` -- for a pointer argument, an
+    expectation compares the data pointed to, not the pointer value.
+  * ``:enforce_strict_ordering: true`` -- expected calls must happen in
+    the order they were set, across all mocks; an out-of-order call fails
+    the test.  ``:fail_on_unexpected_calls: true`` also fails any call
+    that has no expectation.
+  * ``:treat_externs: :include`` -- functions declared ``extern`` in a
+    header are mocked as well.
+  * ``:treat_inlines: :exclude`` -- ``static inline`` functions in headers
+    are not mocked; their real bodies are compiled into the test, so their
+    own dependencies must be mocked or available.
+
+* ``:gcov:`` in ``project.yml`` is not used for coverage runs.  The
+  ``gcov.yml`` mixin, merged by ``./runtest.sh coverage``, enables the
+  ``gcov`` plugin and sets the arm64 tools, the ``qemu`` runner and the
+  ``gcovr`` reports; see `Building and running`_.
+
+
+Worked example: ``preinit_xen_time`` "no compatible timer node"
+---------------------------------------------------------------
+
+
+The requirement and test chain
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+* **HLR** ``xen-req-a4fd1852-...`` (`time.hlr.req.md`_)
+* **LLR** ``xen-req-a589eb2d-...`` -- *the* ``preinit_xen_time``
+  *function shall, via* ``panic``\ *, stop system initialization when*
+  ``dt_find_matching_node`` *fails to find a compatible timer node.*
+  Trace Parent -> the HLR.  (`time.llr.req.md`_)
+* **TC** ``xen-tc-9130877d-2309-468b-af15-d4d1bdabed98``
+  (`time.tc.md`_), Requirement -> the LLR, with two sub-cases:
+
+  * **SC-01** -- a compatible node *is* found -> ``preinit_xen_time``
+    must **not** panic.
+  * **SC-02** -- no compatible node is found
+    (``dt_find_matching_node`` returns ``NULL``) ->
+    ``preinit_xen_time`` must panic.
+
+* **TP** -- one function per sub-case, in ``test_xen_time.tp.c``.
+
+
+The test procedures
+~~~~~~~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    /// @procedureId xen-tc-9130_TP-01
+    /// @testCaseId  xen-tc-9130877d-2309-468b-af15-d4d1bdabed98
+    /// @subCase     xen-tc-9130-SC-01
+    void test_xen_tc_9130_TP_01(void)
+    {
+        dt_find_matching_node_ExpectAnyArgsAndReturn(&test_device_node);
+        dt_property_read_u32_IgnoreAndReturn(false);
+        platform_init_time_IgnoreAndReturn(SUCCEED);
+
+        TEST_ASSERT_FALSE(panic_trap_run(preinit_xen_time));   // did not panic
+    }
+
+    /// @procedureId xen-tc-9130_TP-02
+    /// @testCaseId  xen-tc-9130877d-2309-468b-af15-d4d1bdabed98
+    /// @subCase     xen-tc-9130-SC-02
+    void test_xen_tc_9130_TP_02(void)
+    {
+        dt_find_matching_node_ExpectAnyArgsAndReturn(NULL);    // no timer node
+
+        TEST_ASSERT_TRUE(panic_trap_run(preinit_xen_time));    // must panic
+    }
+
+
+Reading it line by line:
+
+* ``dt_find_matching_node_ExpectAnyArgsAndReturn(...)`` drives the
+  branch: returning a node exercises SC-01, returning ``NULL``
+  exercises SC-02.
+* ``_IgnoreAndReturn`` allows the other calls on the path without
+  making them the point of the sub-case.
+* ``panic_trap_run(preinit_xen_time)`` invokes the unit under test
+  through the trap; ``TEST_ASSERT_FALSE`` / ``TEST_ASSERT_TRUE``
+  assert the no-panic / panic outcome.
+
+The three tags are the links back up the chain: ``@subCase`` to the TC
+sub-case, ``@testCaseId`` to the TC, ``@procedureId`` naming this TP.
+The function name follows ``test_xen_tc_<first 8 digits of TC id>_TP_<nn>``,
+one function per sub-case (using 8 hex digits avoids collisions across
+large test suites).
+
+
+Adding a test procedure
+-----------------------
+
+#. **Find the TC and its sub-cases** and the LLR it verifies.
+#. **Choose the target's *.tp.c** (e.g. ``test_xen_time.tp.c``); add a
+   new ``test_<area>.tp.c`` only for a new target.
+#. **Add mocks for any new dependency** by including its
+   ``mock_<header_filename>.h``; for a dependency with no mockable
+   header, add a local fake and a macro override (as with
+   ``READ_SYSREG``).
+#. **Write one function per sub-case**, named ``test_xen_tc_<first 8
+   hexadecimal digits of TC id>_TP_<nn>``, with the three tags.
+#. **Set expectations from the sub-case's Condition**, using the TC's
+   boundary values.  For each valid partition these are ``min`` and ``max``,
+   the values just inside them (``min+1``, ``max-1``), and the robustness
+   values just outside (``min-1``, ``max+1``) where the type allows them, so
+   the number of values depends on the partitions and the type.  Omit
+   impossible combinations.
+#. **Assert the expected output** with the appropriate
+   ``TEST_ASSERT_*``; for a panic path, assert on
+   ``panic_trap_run(...)``.
+#. **Reset any new fixtures in** ``setUp``.
+
+
+Building and running
+--------------------
+
+From the harness directory, ``runtest.sh`` wraps ``ceedling``:
+
+.. code-block:: bash
+
+    ./runtest.sh build        # build all tests, do not run
+    ./runtest.sh all          # run all tests
+    ./runtest.sh time         # run only test_xen_time.tp
+    ./runtest.sh rebuild      # clobber + build
+    ./runtest.sh coverage     # clobber + build + coverage report
+    ./runtest.sh clean        # clobber build output
+
+
+or ``ceedling`` directly (``ceedling test:all``, ``ceedling
+test:test_xen_time.tp``).  On first run ``runtest.sh`` generates
+``project.yml`` from the template.  Tests are cross-built and run
+under ``qemu``.  The ``qemu`` return code becomes the result (see the
+"``qemu`` Return Code" section of the harness ``README.md``).  For
+coverage, run ``./runtest.sh coverage``.  It merges the ``gcov.yml`` mixin,
+runs every test under ``qemu`` with coverage, and writes ``gcovr`` reports
+(HTML, text, Cobertura, JSON) to ``build/artifacts/gcov/gcovr/``.  Only the
+Xen sources under ``xen/arch/arm/`` are instrumented and reported, so the
+figures exclude the TPs, Unity, CMock and the mocks.
+
+
+``./runtest.sh coverage-llvm`` builds the same TPs with ``clang-19`` and
+``llvm-cov`` source-based coverage (``WITH_LLVM_COV=1 ./test_configure.sh``
+installs the toolchain) and adds MC/DC, which ``gcov`` from gcc 12 does not
+report.  ``./runtest.sh coverage-all`` runs both and writes
+``coverage/comparison.md``.  The two reports are complementary.  ``gcov``
+measures code built by gcc, the compiler ``test_configure.sh`` builds Xen
+with, but its line and function attribution depends on what the optimizer
+inlined or removed.  ``llvm-cov`` maps counts to source regions, so its
+figures do not depend on the optimizer, and it measures MC/DC, but it
+measures a clang build.  Where the two disagree on which lines or functions
+are countable, the difference points at object code that is not directly
+traceable to the source, which a Level A structural coverage analysis has
+to account for.
+
+
+Conventions
+-----------
+
+* Mocks are prefixed ``mock_``; CMock enforces strict ordering and
+  compares pointed-to data -- set expectations in call order.
+* One TP function per TC sub-case; keep the three traceability tags
+  accurate.
+* Drive branches through mock return values and inputs; use the TC's
+  boundary values.
+* Keep the unit under test unmodified -- isolate with mocks, macro
+  overrides and the panic trap, never by editing Xen source.
+* ``static`` functions are normally covered through the public entry
+  point.  This is not all or none: when an LLR or coverage objective needs
+  one exercised directly, call it from the TP (the ``.c`` file is compiled
+  in) or through a small test-only wrapper.
+
+
+References
+==========
+
+* Harness setup, run details, mock generation and QEMU return code:
+  https://gitlab.com/xen-project/fusa/xen-integration/-/blob/test-airworthy/automation/ceedling_test/README.md
+* Example mock usage (``xen-integration`` MR !26):
+  https://gitlab.com/xen-project/fusa/xen-integration/-/merge_requests/26
+* Ceedling (Unity + CMock): https://www.throwtheswitch.org/ceedling
+
+
+.. Long source links are defined here and referenced by short names in the text.
+
+.. _time.hlr.req.md: https://gitlab.com/xen-project/fusa/requirements/-/blob/master/
+   design_reqs/domain_creation_and_runtime/domain_fully_emulated_resources/arm64/
+   time/time.hlr.req.md#high-level-requirement-xen-req-a4fd1852-3611-4f54-ac3b-fe2fa91abd52
+
+.. _time.llr.req.md: https://gitlab.com/xen-project/fusa/requirements/-/blob/master/
+   design_reqs/domain_creation_and_runtime/domain_fully_emulated_resources/arm64/
+   time/time.llr.req.md#low-level-requirement-xen-req-a589eb2d-abdf-4671-b1f9-f3b03d0f9e57
+
+.. _time.tc.md: https://gitlab.com/xen-project/fusa/test_specifications/-/blob/master/
+   domain_creation_and_runtime/domain_fully_emulated_resources/arm64/
+   time/time.tc.md#test-case-xen-tc-9130877d-2309-468b-af15-d4d1bdabed98
-- 
2.53.0


