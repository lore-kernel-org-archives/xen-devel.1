Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8EB606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 11:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=suBFj4It
Received: from list by lists.xenproject.org with outflank-mailman.1465567.1676082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMkXo-0002wp-3E; Fri, 30 Oct 2026 11:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465567.1676082; Fri, 30 Oct 2026 11:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMkXo-0002wi-0R; Fri, 30 Oct 2026 11:13:12 +0000
Received: by outflank-mailman (input) for mailman id 1465567;
 Fri, 30 Oct 2026 11:13:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xMkXm-0002wc-Uv
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 11:13:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMkXm-00DIwp-3C
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 12:13:10 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ae47bc5-2eae-0a2a0a5409dd-0a2a4502bf80-2
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 12:13:10 +0100
Received: from [209.85.128.172] (helo=mail-yw1-f172.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ae47bc4-6ca4-0a2a45020019-d15580acddc9-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 12:13:09 +0100
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-8b09e07e149so4552287b3.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 04:13:09 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793358788; cv=none;
        d=google.com; s=arc-20260327;
        b=Na1GaoRi1eGZrn3g5vqFilW/4j874AQ3hj5iXQTk4gnLtpTroytsDyXxwvbrnpGZ4I
         zyQ2bqt3Ppec5wyz6jfI8qT2EzH/hiIXamaxam+Z2FS7tbDy8KgO7gPVxswyQAblJycY
         7k9DWOZt3rQlzF1LcA4uDUqNsrkQxb8wurEMhNSz1Ry+wqxjIQ4Bf+aHf5BAamlQq9DL
         Mt+N2717Zon0w5/HIUApW28lHYkiDqpchlFkmyRNhr2qOM/mrbnpoy+oJFRvZyXeKJAE
         5IeKL2FgCcG6BfKISx32M9lOoRzfZ2ZFIptJWZWKpqe/4evYkz6rC1m12Sammg9ayW7Q
         z1Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5LUWZT5k5KvOS94ligsCtD+U9+DDcG+IL6eyG0y0saE=;
        fh=3EgVbjOIb5K9tD+0KroAY8Fz8mPHYGh8aQONqXayqLk=;
        b=gQOuOxDfrcvzetgU2Q6rq4EBDYFfzGB9I0SiGm4a4GFmXQAd4IQJwpv7tTxbXCjAr5
         W9/ANVBL0q37+bGlAFCrB7Vh04ps3jmpu+1pm6GCYL1lSBfFrfN+dscXSB30U19E8RdP
         pzommA7XKCK4dlPQiItL3Wu0Xfen+SMOpOoI4ikRN6QfAZo5+hiYDhWjPMJdp7lAnMCD
         4iaaF72iUtGN2Op2m+uHdQ6hZB4sOZI4GKu6W892K6nTeEsOJWg4J4ZWkDtuibLqcyd0
         +WZvCTlWlKdsiA6y79rmVksv83LfFq3xhEbwElQH6YdERsVSGAElqWKWfdrvGWJXLnjK
         G0wQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793358788; x=1793963588; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5LUWZT5k5KvOS94ligsCtD+U9+DDcG+IL6eyG0y0saE=;
        b=suBFj4It3KqeCQVvJrwgYiLCbBfMK+Mfi93VtvbHzRx61ZBgngxx3oXBDwG+lfiRgX
         nfSDvwBHGHBERZ0H1V3EAdEFVLUgypWabufELVLcrHJL3guklt+R0YjW++3FN3dgHBHt
         wq2lfRgtYHSc4I4tpqq3jIGFzGxZheHKy5CovH0d4KrBm5il2IWqrZQs6lV70aEqwJ5W
         ce2odTMPaqhThYUYeOgaDAlOlo4HRi5pJTknb42nXNANNFCjxtYB02gPufXrxucG4v2A
         yuC6AEIoYWXNqPIynoXme51Anl1PtqjllsV6Lr4d42cqYtaNuPnH9o0qlJSwHhSBbVul
         yryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358788; x=1793963588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LUWZT5k5KvOS94ligsCtD+U9+DDcG+IL6eyG0y0saE=;
        b=eN0DYMhq7HUoJIV6JtGJY2JpO/47T7mqDV3GV1+ptlFwOtHWWAV4dIsZwfWl7T6Dpx
         SWee/2F9ngDhHK3QLFGz2Wx4K3l8ZC/NEx3a84pSYIxJOiOYMIKgwUy6DUU8vfHOIQxr
         be6Rz4oUWy2zpNDD/Q3DsO1XY81RYCKTbGy+OCN3gtZEAxUEdvn8FeZdGNXenYfAGmWm
         oLknxPr68p0HxFNvYCXtway1f7AJm9S9oV+BBhVfMjRcpmJGevb4k3RHCLY9xAxtTMDb
         rl5U5dKsZ40M2gbuR5aBQcHt6F+TCzlSIbcY7BiwvxKUQhec9yl+fA7PyoQudxR0jmri
         YVwA==
X-Forwarded-Encrypted: i=1; AKwUvBzAdQeGlYo3DwrXklshR5/TMx6nMDSjoMj0TNhH5GzM7eduWwOdbdVvLmMpMCSggDks/b12VwxKV4U=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJrdFxPMKg0nRhHXmalTKnlunPt2uMMnMyoZktOQFdX9qlKoTQf
	zOwdDm9JjK0sO5PJV9emOZi7ikcwLFC77MdtZrn3nQDcSoGPNNxSKHMF+2lzlFkcqOjJl4XSjaC
	SJx0UYXCT0diN9ofcST387reDDK2tZ0WNzBtTAuJswg==
X-Gm-Gg: AYBFou3A1Q+g91flhGJH2LbRlW7mcQCeIhG8KI/c+m4J3ivhfgUGjK6aSjMbizFzQxR
	GR7n/MTFubX6idvngflBf/PaUPcWBxKc5u0fqngNAtqgYlzPCVqKnn/1LKPCwOrohWU1b3wTNqh
	slbpGq79eEHK/0VjOjsMhVhdsZmRkOwFw/r6NA5xtFgaB6gurug9s5PWqu9XQm0u6tQlC3wPrFr
	d1CQLgONYQeaCZlvOnVdzQI4dilZWSMw/xD4DCnBPkS2nlXTtjSG/9Sb6cMWfOjUTa0cZ8d6DB2
	ihwa7zk7NK/xykhmOS0LSLc6FJJHZ3XVpGH52Enp+/tI2NGxqqJC+lgv3bcwSTOvK3u5H7DSK/B
	EOcRckJUKuxo5hBQXoIIJxmh1Bq6X1MsJ7SIvnME1POb5MsEt2hHZmyhtMVzSyECTkxowi1Sbqw
	mq4eINEMc50cSJHz1Il8mKgg==
X-Received: by 2002:a05:690c:e1d9:10b0:8b0:f0cc:db0e with SMTP id
 00721157ae682-8b2b676ba6fmr7498147b3.78.1793358788267; Fri, 30 Oct 2026
 04:13:08 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260911143627.2743803-1-berrange@redhat.com> <20260911143627.2743803-10-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-10-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2026 11:12:55 +0000
X-Gm-Features: AclHuK8tWRtaAMh4OSG81o0Myk5Bd8TN4g8UgRz9NIr2z73xVEtamgvTgzkRr-c
Message-ID: <CAFEAcA8GwF=EdaqvO7OBNZY1ku8LWNH5giveZYXSVnmk9JWfng@mail.gmail.com>
Subject: Re: [PATCH 09/28] hw/net: mark e1000, e1000e, IGB, rtl8139 & sPAPR
 VLAN as secure
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
	qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1793358789-F04A62AC-6B977E93/0/0
X-purgate-type: clean
X-purgate-size: 919
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 11 Sept 2026 at 15:42, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> Historically most NICs are only interesting for non-virtualization
> use cases and have not been written with malicious guests in mind.
>
> As a general rule either virtio-net or xen-net should be used in
> all virtualized guests requiring a security boundary.
>
> There are a handful of exceptions resulting from historical usage
> in the x86 world, to support virtualized guests lacking virtio
> support.
>
> Thus the rtl8139, e1000, e1000e & IGB NICs are declared to provide
> a security boundary.

You've said in several bugs (e.g.
https://gitlab.com/qemu-project/qemu/-/work_items/3872 )
that igb wasn't covered by the virtualization use case.

I don't care either way, but I wanted to check since I've been
marking igb bugs as non-confidential when triaging on the
basis of that...

thanks
-- PMM

