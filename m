Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD48BFD7F92
	for <xen-devel@archiver.kernel.org>; Fri, 27 Feb 2026 10:58:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1242574.1542959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvvYE-0004VC-Np; Fri, 27 Feb 2026 10:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242574.1542959; Fri, 27 Feb 2026 10:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvvYE-0004V5-Jg; Fri, 27 Feb 2026 10:58:30 +0000
Received: by outflank-mailman (input) for mailman id 1242574;
 Fri, 27 Feb 2026 10:58:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kH+Z=A7=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vvvYD-0004Ur-2r
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 10:58:29 +0000
Received: from na1pdmzitismtp02.tibco.com (unknown [160.101.131.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e74d17c-13cb-11f1-b164-2bf370ae4941;
 Fri, 27 Feb 2026 11:58:28 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id C298D81CEB9E;
 Fri, 27 Feb 2026 05:57:55 -0500 (EST)
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
X-Inumbo-ID: 3e74d17c-13cb-11f1-b164-2bf370ae4941
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 0/4] Fix building tools/tests/x86_emulator with clang-21
Date: Fri, 27 Feb 2026 10:58:19 +0000
Message-ID: <cover.1772189234.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changed since v1:
 * filed upstream bug and added reference for integrated-as issue
 * use .ifndef directive instead of volatile workaround
 * fixed 2 more undefined behaviour warnings from fsanitize=undefined

This makes the tests build (but not yet run) with clang.

I dropped the ifdef __clang__ patch:  compiling just x86-emulate.c with
clang and the rest with GCC fails too, so there are probably some
implicit assumptions about x86_emulate not modifying some registers (but
when compiled with clang it does). I don't have a good solution for
these, and I don't understand what most of these tests are trying to
test.
For example I don't see how this tests the result of the emulator,
where rc is entirely computed by the asm block (and with clang the
result here is 0xfffe instead of 0xffff):
```
        asm volatile ( "pcmpeqb %%xmm1, %%xmm1\n"
                       put_insn(movq_from_mem2, "movq 32(%0), %%xmm1")
                       :: "c" (NULL) );

        set_insn(movq_from_mem2);
        rc = x86_emulate(&ctxt, &emulops);
        if ( rc != X86EMUL_OKAY || !check_eip(movq_from_mem2) )
            goto fail;
        asm ( "pcmpgtb %%xmm0, %%xmm0\n\t"
              "pcmpeqb %%xmm1, %%xmm0\n\t"
              "pmovmskb %%xmm0, %0" : "=r" (rc) );
        if ( rc != 0xffff )
            goto fail;
```

After fixing the bugs reported by UBSAN/MSAN (and disabling the memset
wrapper which causes it to infloop) the tests still fail.
Using -Os doesn't help either.

valgrind also fails here, but that could be a bug in valgrind:
Testing mulx (%eax),%ecx,%ebx...        failed!

Edwin Török (4):
  tools/tests/x86_emulator: avoid duplicate symbol error with clang
  tools/tests/x86_emulator: fix build on clang-21
  tools/tests/x86_emulator: fix undefined behaviour in shift
  tools/tests/x86_emulator: avoid passing NULL to memcpy

 tools/tests/x86_emulator/Makefile            |  5 +++++
 tools/tests/x86_emulator/test_x86_emulator.c | 14 ++++++++++----
 2 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.47.3


