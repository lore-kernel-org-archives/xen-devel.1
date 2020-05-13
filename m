Return-Path: <SRS0=3ye+=63=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E92C433F2
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2020 15:01:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76D0B216C4
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2020 14:54:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2H12gZr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76D0B216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYsm7-0004no-7s; Wed, 13 May 2020 14:54:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WltO=63=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jYsm6-0004nj-0b
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 14:54:22 +0000
X-Inumbo-ID: a07f3316-9529-11ea-b9cf-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a07f3316-9529-11ea-b9cf-bc764e2007e4;
 Wed, 13 May 2020 14:54:21 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id u15so18148707ljd.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2020 07:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MG4vWe3NIOB9tnvJ17Qc4t/qYEXvgRhyiC2qniHyU/k=;
 b=k2H12gZr1sQXZ9wpU5TmOsUIBCVUbUetwkMzzphq+P+yy1ZBfUPv8ArJSmt2a+Glpv
 C/CRUjn+hiAyt3AH2dvdzWgU6v2QWRezdrIw9iGutCTu20tZeHjMehxzsYS4q3omKv8L
 Y2mqifbJpX4Fus+LUruqv03Gcq//tSYBNMLG683Y02MCcVQgID+eVTHJjLnYf1UkE+LE
 mAAHe//+SO4C/cvIh2YEN/SUc6LYii0yJ5veIaCBOHSUi19/oyPU07+x1A/niJwv8Dss
 0y7yIK7WB8m6baZe/DZBX8vBBkUDBC8nTiPgsiEkKOh53nuGMBKYc62tmqmJCbdLZ6tf
 msJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MG4vWe3NIOB9tnvJ17Qc4t/qYEXvgRhyiC2qniHyU/k=;
 b=Oe+OKiEJ4dI52hDSWYqxjWQL4IVywFjJF/aBZG9fs6YkuWasmWS7c+GbPvVUlqnOQV
 KHBJjJL5ou4EDhkpK+rOexki0jldDD6Zx5nefhETiNnxu2IgjnY4gay8Jyqp6rtu1XE5
 lNUkv+3HHA48JbmmpcgAS+ZvCys3IFxBY/19zQ7/vUXqvi6l0hJpgZ7iFqhD/b9Pj0gw
 jlQwpvUHe39yQ/S299tl/3xWKIxhSjJqtwgKntL8zGDiB+dAcPDQkidAxse28ZuV2LWu
 dKf8hTDkAYenyC6eQQl4P1qD+aaMxJ6vXB6HBPIjSfdRN2SDPnUkPA3e1+fT5t1l8Voa
 d2hA==
X-Gm-Message-State: AOAM533pNMqZd64B1c32Di6g9JsaXHY62Iy+66/eOoipqgb+GDHvRact
 6CmTqeA7w5pcYnTDAcJRATpEPFF/3aALdiWgwqU=
X-Google-Smtp-Source: ABdhPJxTvniAg8zbY+XkcgO+vXyN8uFTid/vsVXDFzdHJ1s5bCuUGIwZAtPr6KyNlqSadG8DDhY/d2j9CSQRTeEWLQA=
X-Received: by 2002:a2e:7215:: with SMTP id n21mr16390295ljc.199.1589381660260; 
 Wed, 13 May 2020 07:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200513135552.24329-1-andrew.cooper3@citrix.com>
 <20200513135552.24329-3-andrew.cooper3@citrix.com>
In-Reply-To: <20200513135552.24329-3-andrew.cooper3@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 13 May 2020 10:54:08 -0400
Message-ID: <CAKf6xpuD46CEwc3et33_1g4SXYOJzcYehjHPV97P1HdKwkASLg@mail.gmail.com>
Subject: Re: [PATCH] x86/build: Unilaterally disable -fcf-protection
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Stefan Bader <stefan.bader@canonical.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 13, 2020 at 9:56 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> Xen doesn't support CET-IBT yet.  At a minimum, logic is required to enable it
> for supervisor use, but the livepatch functionality needs to learn not to
> overwrite ENDBR64 instructions.
>
> Furthermore, Ubuntu enables -fcf-protection by default, along with a buggy
> version of GCC-9 which objects to it in combination with
> -mindirect-branch=thunk-extern (Fixed in GCC 10, 9.4).
>
> Various objects (Xen boot path, Rombios 32 stubs) require .text to be at the
> beginning of the object.  These paths explode when .note.gnu.properties gets
> put ahead of .text and we end up executing the notes data.
>
> Disable -fcf-protection for all embedded objects.
>
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

I have not re-tested this posting, but I tested an equivalent change
~2 weeks ago (in case that counts for Tested-by).

-Jason

