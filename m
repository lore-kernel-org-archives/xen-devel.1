Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB0ECD6E7D
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2026 15:10:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1329626.1593667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVWBq-0000bZ-W6; Fri, 05 Jun 2026 15:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329626.1593667; Fri, 05 Jun 2026 15:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVWBq-0000bS-TM; Fri, 05 Jun 2026 15:10:30 +0000
Received: by outflank-mailman (input) for mailman id 1329626;
 Fri, 05 Jun 2026 15:10:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e9855de55000701b@swg.vates.tech>)
 id 1wVWBp-0000bM-EG
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 15:10:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVWBo-007ull-Q3
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 17:10:28 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e9855de55000701b@swg.vates.tech>)
 id 6a22e6d2-e002-0a2a0a5209dd-0a2a4502e84a-30
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 17:10:28 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e9855de55000701b@swg.vates.tech>)
 id 6a22e6e4-af86-0a2a45020019-b9ff1c1299b9-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 17:10:28 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e9855de55000701b.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Jun 2026 15:10:24 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 343D586F95;
 Fri,  5 Jun 2026 17:10:24 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=3Gd497NwynVuYnx1wxip5K73NBAkHHiDcX66soXhUVw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Fd0qw+LDYsDs5SCATEPcuBYUAae+e2SSMK7l3zAdlWjs3Mb30RULWiSuyrQICnx7h54oupsZx
 FyKpyEBzHXI1FtFkolywQFn2lrgLEZnuVj8fvYSaazCZmjJSvN1OE2kPA8PEa4M2YNn11Mg/r1w
 SQolgJ4F+uwAqPIdN3ewxrn29IGI7ufpMtVJPiVt1/QeDQVhdR9M6I4jJTnJTV2s8K+t24/pS+e
 a6YTTpkm1c/ziTcL4Mj3SmbdrxhRuFlAmPxIefau4TIGOzwZiDibWDFzzaRIbgX/HAZ5g5/EUVE
 mfVZZOYH3U+ZYV2dwqanKOFVh8kLmZtEN9TMOYcGCFuw==
X-Zone-Loop: 346f52ea2103883e3466676fddd0429c59b79abdaea0
x-campaign-type: default
x-transaction-id: 8f41960a-1bf4-498d-9654-3883c0dce58a
x-swg-uid: 01-b9569bf7-a03f-410c-969e-c80de46f7c59
X-Mailer: Sweego
Message-ID:
 <1780672224.8631fc262581453bbf619ec5b2062170.19e9855de55000701b@vates.tech>
x-swg-bid: 1780672224.8631fc262581453bbf619ec5b2062170.19e9855de55000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 5 Jun 2026 17:10:23 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.22 v2 4/5] tests/numa: add unit tests for NUMA
 setup logic
References: <20260603191836.77955-1-roger.pau@citrix.com>
 <20260603191836.77955-5-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260603191836.77955-5-roger.pau@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.20a1.395280c869809a50.19e9855dc1d.df5c4d7d81352596=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1780672224286
X-purgate-ID: tlsNG-720697/1780672228-81B70161-0B45548D/0/0
X-purgate-type: clean
X-purgate-size: 2068

---=Part.20a1.395280c869809a50.19e9855dc1d.df5c4d7d81352596=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 09:18:35PM +0200, Roger Pau Monne wrote:
> diff --git a/tools/tests/numa/Makefile b/tools/tests/numa/Makefile
> new file mode 100644
> index 000000000000=2E=2E5235f9d6297f
> --- /dev/null
> +++ b/tools/tests/numa/Makefile
> +
> +=2EPHONY: uninstall
> +uninstall:
> +	$(RM) -- $(patsubst %,$(DESTDIR)$(LIBEXEC)/tests/%,$(TARGETS))

There's a simpler way to write this, with
    $(addprefix $(DESTDIR)$(LIBEXEC)/tests/,$(TARGETS))
But that's ok to=2E

> +
> +numa=2Eh: $(XEN_ROOT)/xen/include/xen/numa=2Eh
> +	sed -e '/^#[[:space:]]*include/d' <$< >$@
> +
> +CFLAGS +=3D -D__XEN_TOOLS__
> +CFLAGS +=3D $(APPEND_CFLAGS)
> +CFLAGS +=3D $(CFLAGS_xeninclude)
> +
> +test-numa: test-numa=2Ec numa=2Eh
> +	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*=2Eo) -o $@ $< $(APPEND_CFLAGS)

$* should be undefined here=2E
So we have $(CFLAGS_=2Eo), but that variable doesn't exit either=2E
You could remove $(CFLAGS_$*=2Eo), it's not use here=2E

Also, $(APPEND_CFLAGS) is added twice, once via $(CFLAGS) and a second
time on the command line=2E I think the one added to $(CFLAGS) should be
removed=2E

> diff --git a/tools/tests/numa/test-numa=2Ec b/tools/tests/numa/test-numa=
=2Ec
> new file mode 100644
> index 000000000000=2E=2Ebced68d4d7f1
> --- /dev/null
> +++ b/tools/tests/numa/test-numa=2Ec
> +
> +        for ( j =3D 0;
> +              j < ARRAY_SIZE(tests[i]=2Eaffinity) && tests[i]=2Eaffinit=
y[j]=2Eend;

Why do you test the value `=2Eend` ? ARRAY_SIZE is likely enough as the
test array is static=2E Same thing later, with the `ram` array=2E


Anyway, it's all look good enough to me:
Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.20a1.395280c869809a50.19e9855dc1d.df5c4d7d81352596=---

