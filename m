Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0622E606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=k0JIbbz6
Received: from list by lists.xenproject.org with outflank-mailman.1461585.1672629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLNX3-00078I-7b; Mon, 26 Oct 2026 16:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461585.1672629; Mon, 26 Oct 2026 16:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLNX3-00078B-4z; Mon, 26 Oct 2026 16:26:45 +0000
Received: by outflank-mailman (input) for mailman id 1461585;
 Mon, 26 Oct 2026 16:26:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1790908d4000f79f@swg.vates.tech>)
 id 1xLNX1-000785-Pm
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:26:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLNX0-007iNI-VF
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 17:26:42 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1790908d4000f79f@swg.vates.tech>)
 id 6adf7f1a-8faa-0a2a0a5109dd-0a2a45038550-40
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 17:26:42 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1790908d4000f79f@swg.vates.tech>)
 id 6adf7f42-fae8-0a2a45030019-b9ff1c12b64f-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 17:26:42 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1790908d4000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 16:26:37 +0000
Received: from [192.168.0.158]
 (cpc92322-cmbg19-2-0-cust1759.5-4.cable.virginm.net [86.26.38.224])
 (Authenticated sender: andriy.sultanov)
 by mail2.vates.fr (Postfix) with ESMTPSA id C09C981D36;
 Mon, 26 Oct 2026 17:26:36 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=R6I2EqCiYHw5uUSgZETXcCUbfXX6QPtH9rUWpXBi6pc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=k0JIbbz6KzlgAm1+ip7f59vGvmRXu1aah1v2TnRuyTSXNgaBLG/nsycuMWvTrXS3BdNe3VDYi
 U6EL6l+TxEkwG1mwx5wO9g8F6KdU6FHJ/3ytMkDiNjirG1hisUGIT3dFzzMIBXSaIGe3/IoRjSq
 VEJs+Ip0AvHuO29u95CLJmpKMfUCJ1VO7TqayOKUS2pFc+HwmWC8wV721wnlscE0Pcyw6wl/r45
 ZKASuEH8/o8dS9Dr+2PJEsCMsDdnChqKk+16xb4UyvNxbWcd00Npv1lu1tAwuZarCR0kfOWMrAX
 8BpCE0nceOSFGRm9oAIVs5+py8QELlcoYf1H0HLC8zsw==
X-Zone-Loop: 44b07b4f2a695872c0b6b30c7a2a6d30ce3900b319f0
x-campaign-type: default
x-transaction-id: b2e3c8f8-498e-4ce3-9485-7f934734110e
x-swg-uid: 01-e30dbad8-0ad2-46de-bb7d-9a628a4a6f70
X-Mailer: Sweego
Message-ID:
 <1793031997.8631fc262581453bbf619ec5b2062170.1a1790908d4000f79f@vates.tech>
x-swg-bid: 1793031997.8631fc262581453bbf619ec5b2062170.1a1790908d4000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Mon, 26 Oct 2026 16:26:36 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/ocaml: Gitlab CI test for bindings
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Julian Vetter <julian.vetter@vates.tech>
References: <20261026162039.1188760-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Andrii Sultanov <andriy.sultanov@vates.tech>
In-Reply-To: <20261026162039.1188760-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793031996978
X-purgate-ID: tlsNG-33051d/1793032002-77AF14E9-3A7BB412/0/0
X-purgate-type: clean
X-purgate-size: 4803
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/26/26 16:20, Andrew Cooper wrote:

> ... as building and interpreting Ocaml objects in C is rather fragile.
>
> For C producing objects for Ocaml to consume, one trick to check validity is
> Gc.compact() which forces a major sweep, walking all objects.  If this doesn't
> segfault, then we at least got the pointer <-> integer aspect right.
>
> For now, start with a very simple version call.  (Re)introduce
> tools/ocaml/tests and add test-ocaml-bindings which is installed into
> $(DESTDIR)$(LIBEXEC)/tests to be picked up automatically with the other dom0
> tests.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Andrii Sultanov <andriy.sultanov@vates.tech>
> CC: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
> CC: Julian Vetter <julian.vetter@vates.tech>
>
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2990559670/test_report
> ---
>   tools/ocaml/Makefile                  |  1 +
>   tools/ocaml/tests/Makefile            |  8 +++++++
>   tools/ocaml/tests/bindings/.gitignore |  1 +
>   tools/ocaml/tests/bindings/Makefile   | 34 +++++++++++++++++++++++++++
>   tools/ocaml/tests/bindings/main.ml    | 19 +++++++++++++++
>   5 files changed, 63 insertions(+)
>   create mode 100644 tools/ocaml/tests/Makefile
>   create mode 100644 tools/ocaml/tests/bindings/.gitignore
>   create mode 100644 tools/ocaml/tests/bindings/Makefile
>   create mode 100644 tools/ocaml/tests/bindings/main.ml
>
> diff --git a/tools/ocaml/Makefile b/tools/ocaml/Makefile
> index 7252eb23d798..e570e30a6e8d 100644
> --- a/tools/ocaml/Makefile
> +++ b/tools/ocaml/Makefile
> @@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
>   
>   SUBDIRS := libs
>   SUBDIRS += xenstored
> +SUBDIRS += tests
>   
>   .NOTPARALLEL:
>   # targets here must be run in order, otherwise we can try
> diff --git a/tools/ocaml/tests/Makefile b/tools/ocaml/tests/Makefile
> new file mode 100644
> index 000000000000..e9f3557f1219
> --- /dev/null
> +++ b/tools/ocaml/tests/Makefile
> @@ -0,0 +1,8 @@
> +XEN_ROOT = $(CURDIR)/../../..
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +SUBDIRS-y :=
> +SUBDIRS-y += bindings
> +
> +.PHONY: all clean install distclean uninstall
> +all clean distclean install uninstall: %: subdirs-%
> diff --git a/tools/ocaml/tests/bindings/.gitignore b/tools/ocaml/tests/bindings/.gitignore
> new file mode 100644
> index 000000000000..6e9a7f429b49
> --- /dev/null
> +++ b/tools/ocaml/tests/bindings/.gitignore
> @@ -0,0 +1 @@
> +test-ocaml-bindings
> diff --git a/tools/ocaml/tests/bindings/Makefile b/tools/ocaml/tests/bindings/Makefile
> new file mode 100644
> index 000000000000..75f8babbafca
> --- /dev/null
> +++ b/tools/ocaml/tests/bindings/Makefile
> @@ -0,0 +1,34 @@
> +XEN_ROOT = $(CURDIR)/../../../..
> +OCAML_TOPLEVEL = $(CURDIR)/../..
> +include $(OCAML_TOPLEVEL)/common.make
> +
> +OBJS = main
> +
> +OCAMLINCLUDE += \
> +	-I $(OCAML_TOPLEVEL)/libs/xb \
> +	-I $(OCAML_TOPLEVEL)/libs/mmap \
> +	-I $(OCAML_TOPLEVEL)/libs/xc \
> +	-I $(OCAML_TOPLEVEL)/libs/eventchn
> +
> +LIBS = \
> +	unix.cmxa \
> +	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/mmap $(OCAML_TOPLEVEL)/libs/mmap/xenmmap.cmxa \
> +	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/eventchn $(OCAML_TOPLEVEL)/libs/eventchn/xeneventchn.cmxa \
> +	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/xc $(OCAML_TOPLEVEL)/libs/xc/xenctrl.cmxa \
> +	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/xb $(OCAML_TOPLEVEL)/libs/xb/xenbus.cmxa \
> +	-ccopt -L -ccopt $(XEN_ROOT)/tools/libs/ctrl
> +
> +PROGRAMS = test-ocaml-bindings
> +OCAML_PROGRAM = test-ocaml-bindings
> +
> +test-ocaml-bindings_LIBS = $(LIBS)
> +test-ocaml-bindings_MLSORTED = $(shell $(OCAMLDEP) -sort $(OBJS:=.ml))
> +test-ocaml-bindings_OBJS = $(test-ocaml-bindings_MLSORTED:.ml=)
> +
> +all: test-ocaml-bindings
> +
> +install: all
> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
> +	$(INSTALL_PROG) test-ocaml-bindings $(DESTDIR)$(LIBEXEC)/tests
> +
> +include $(OCAML_TOPLEVEL)/Makefile.rules
> diff --git a/tools/ocaml/tests/bindings/main.ml b/tools/ocaml/tests/bindings/main.ml
> new file mode 100644
> index 000000000000..785837e270ad
> --- /dev/null
> +++ b/tools/ocaml/tests/bindings/main.ml
> @@ -0,0 +1,19 @@
> +open Printf
> +
> +let xch = Xenctrl.interface_open ()
> +
> +let test_xenversion () =
> +  let ver = Xenctrl.version xch in
> +  printf "Xen version: %d.%d%s\n" ver.major ver.minor ver.extra
> +
> +
> +let () =
> +  printf "Test Ocaml Bindings\n%!";
> +
> +  test_xenversion ();
> +
> +  printf "Starting GC.compact()\n%!";
> +  Gc.compact ();
> +  printf "GC done\n";
> +
> +  ()
>
> base-commit: 46678752be2d97f61317d793408a59927a429847
Acked-by: Andrii Sultanov <andriy.sultanov@vates.tech>

