Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0507D778BF
	for <xen-devel@archiver.kernel.org>; Sat, 24 Jan 2026 01:00:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1212675.1523694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjS0E-0007Je-CV; Sat, 24 Jan 2026 00:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212675.1523694; Sat, 24 Jan 2026 00:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjS0E-0007JX-8z; Sat, 24 Jan 2026 00:59:50 +0000
Received: by outflank-mailman (input) for mailman id 1212675;
 Sat, 24 Jan 2026 00:59:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/rR=75=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vjS0C-0007JR-PG
 for xen-devel@lists.xenproject.org; Sat, 24 Jan 2026 00:59:48 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4b2f4b1-f8bf-11f0-9ccf-f158ae23cfc8;
 Sat, 24 Jan 2026 01:59:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 09681600C4;
 Sat, 24 Jan 2026 00:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3785CC4CEF1;
 Sat, 24 Jan 2026 00:59:35 +0000 (UTC)
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
X-Inumbo-ID: f4b2f4b1-f8bf-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769216376;
	bh=Z8+XmR/LBnoaml0EPPZ4/P2K9ONSHL1b8uYPC9VfypQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pzPb7EXEufzG8ojGBEgG67G8TO6a46VFv6numzCx0mDvDYGdm7kOmfo+IwgYc+Pyv
	 hJfn3XRf+jGtQWjIaiPBDrvyeDRsCWWaLILhuP9lMGJBbGg38RHSaU0xyUFrdmr3IT
	 olAHSuthOLyXAhA9S9dD5VaLn+DGQ0a8P2XPqtQfL4jO51p+moH+n4uTDuDJ0ulJhQ
	 /uzLOtvTD8mYBx7uUhrfnSncIsVs1ye6C4KcGOi4mD44R4gDbZl9j/B0fqDrir8Tgl
	 UTHcb4H4YYwblxDLqiw21dntNzEC8d8HIOckqIf9qeG7KKNb1Kh32JROYfBTgOSfTE
	 guJcqYg9D6CQw==
Date: Fri, 23 Jan 2026 16:59:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v2 1/4] tests: fixup domid make fragment
In-Reply-To: <20260111041145.553673-2-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2601231643350.7192@ubuntu-linux-20-04-desktop>
References: <20260111041145.553673-1-dmukhin@ford.com> <20260111041145.553673-2-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 10 Jan 2026, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> There can be multiple test harnesses per one test target (e.g. harness.h
> and harness2.h). Account for that by further parametrizing existing
> emit-harness-nested-rule().
> 
> Add guard against HOSTCC != CC (similarly to how its done in PDX unit test).
> 
> Account for multiple test targets in install and uninstall make targets.
> 
> Introduce CFLAGS dedicated for find-next-bit.c only to avoid contaminating
> global CFLAGS.
> 
> Honor mocked hypervisor header over tools/include/xen symlinks.
> 
> Finally, add some clarifications for the functions.
> 
> Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v1:
> - updated commentaries
> - added ability to select the harness header filename
> - fixup for picking up mocked header files
> ---
>  tools/tests/domid/Makefile | 63 ++++++++++++++++++++++++++------------
>  1 file changed, 44 insertions(+), 19 deletions(-)
> 
> diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
> index 753129029ed9..dd22a25b038a 100644
> --- a/tools/tests/domid/Makefile
> +++ b/tools/tests/domid/Makefile
> @@ -4,36 +4,55 @@
>  #
>  # Copyright 2025 Ford Motor Company
>  
> -XEN_ROOT=$(CURDIR)/../../..
> -include $(XEN_ROOT)/tools/Rules.mk
> -
>  TESTS := test-domid
>  
> +XEN_ROOT = $(CURDIR)/../../..
> +include $(XEN_ROOT)/tools/Rules.mk
> +
>  define list-c-headers
>  $(shell sed -n \
>      's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
>  endef
>  
> -# NB: $1 cannot be a list
> +# Generate mock environment by replicating header file hierarchy;
> +# each header file will point to a harness header.
> +#
> +# $1 target
> +# $2 list of test harnesses
>  define emit-harness-nested-rule
> -$(1): $(CURDIR)/harness.h
> -	mkdir -p $$(@D);
> -	ln -sf $$< $$@;
> +$(1): $(2)
> +	set -e; \
> +	mkdir -p $$(@D); \
> +	for i in $(2); do [ -e $$@ ] || ln -s $$$$i $$@; done
 
Are you sure this is correct? Everything seems to be escaped too many
times? Shouldn't this be:

  $(1): $(2)
        set -e; \
        mkdir -p "$(@D)"; \
        for i in $(2); do \
                [ -e "$@" ] || ln -s "$$i" "$@"; \
        done
  endef



>  endef
>  
> +# Helper function to emit mocked hypervisor code dependencies.
> +#
> +# $1 Harness file name.
> +# $2 Mocked hypervisor file name.
> +# $3 List of dependencies to mock.
>  define emit-harness-rules
> -$(foreach x,$(2),$(call emit-harness-nested-rule,$(CURDIR)/generated/$(x)))
> -$(1:.c=.o): $(addprefix $(CURDIR)/generated/,$(2))
> +$(foreach x,$(3),$(call emit-harness-nested-rule,\
> +                        $(CURDIR)/generated/$(x),\
> +                        $(addprefix $(CURDIR)/,$(1))))
> +$(2:.c=.o): $(addprefix $(CURDIR)/generated/,$(3))
>  endef
>  
>  define emit-harness-deps
> -$(if $(strip $(2)),$(call emit-harness-rules,$1,$2),)
> +$(if $(strip $(3)),$(call emit-harness-rules,$1,$2,$3),)
>  endef
>  
> +# Emit dependencies for mocked hypervisor code.
> +#
> +# $1 Hypervisor file name.
> +# $2 Hypervisor source path.
> +# $3 Harness header file name (optional).
>  define vpath-with-harness-deps
>  vpath $(1) $(2)
> -$(call emit-harness-deps,$(1),$(call list-c-headers,$(2)$(1)))
> +$(call emit-harness-deps,$(or $(strip $(3)),harness.h),\
> +                         $(1),\
> +                         $(call list-c-headers,$(2)$(1)))
>  endef
>  
>  .PHONY: all
> @@ -41,7 +60,11 @@ all: $(TESTS)
>  
>  .PHONY: run
>  run: $(TESTS)
> +ifeq ($(CC),$(HOSTCC))
>  	set -e; $(foreach t,$(TESTS),./$(t);)
> +else
> +	$(warning HOSTCC != CC, will not run test)
> +endif
>  
>  .PHONY: clean
>  clean:
> @@ -55,25 +78,27 @@ distclean: clean
>  .PHONY: install
>  install: all
>  	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
> -	$(INSTALL_PROG) test-domid $(DESTDIR)$(LIBEXEC)/tests
> +	set -e; $(foreach t,$(TESTS),$(INSTALL_PROG) $t $(DESTDIR)$(LIBEXEC)/tests;)
>  
>  .PHONY: uninstall
>  uninstall:
> -	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/test-domid
> +	set -e; $(foreach t,$(TESTS),$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$t;)
>  
>  CFLAGS += -D__XEN_TOOLS__
> +
>  # find-next-bit.c
> -CFLAGS += '-DEXPORT_SYMBOL(x)=' \
> +CFLAGS-find-next-bit.c += '-DEXPORT_SYMBOL(x)=' \
>            -Dfind_first_bit \
>            -Dfind_first_zero_bit \
>            -Dfind_next_bit \
>            -Dfind_next_bit_le \
>            -Dfind_next_zero_bit_le
> -CFLAGS += $(APPEND_CFLAGS)
> -CFLAGS += $(CFLAGS_xeninclude)
> -CFLAGS += -I./generated/
>  
> -LDFLAGS += $(APPEND_LDFLAGS)

APPEND_CFLAGS and APPEND_LDFLAGS are lost?


> +find-next-bit.o: CFLAGS += $(CFLAGS-find-next-bit.c)
> +
> +# Honor mocked hypervisor header over tools/include/xen symlinks
> +CFLAGS += -I$(CURDIR)/generated/
> +CFLAGS += $(CFLAGS_xeninclude)
>  
>  vpath find-next-bit.c $(XEN_ROOT)/xen/lib/
>  
> @@ -83,6 +108,6 @@ vpath find-next-bit.c $(XEN_ROOT)/xen/lib/
>  $(eval $(call vpath-with-harness-deps,domid.c,$(XEN_ROOT)/xen/common/))
>  
>  test-domid: domid.o find-next-bit.o test-domid.o
> -	$(CC) $^ -o $@ $(LDFLAGS)
> +	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

My understanding is that $(LDFLAGS) should be last, e.g.:

$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)


>  -include $(DEPS_INCLUDE)
> -- 
> 2.52.0
> 

