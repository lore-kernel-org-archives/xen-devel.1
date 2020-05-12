Return-Path: <SRS0=FkqA=62=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF97C2D0F8
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2020 23:37:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58C1A206F5
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2020 23:37:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ubl2/3C1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58C1A206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYeSU-0007LN-D1; Tue, 12 May 2020 23:37:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9uWS=62=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jYeST-0007LI-Ls
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 23:37:09 +0000
X-Inumbo-ID: 7e9f1246-94a9-11ea-9887-bc764e2007e4
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e9f1246-94a9-11ea-9887-bc764e2007e4;
 Tue, 12 May 2020 23:37:08 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id 8so9312479lfp.4
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 16:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c8OXBEOBsZxAuz+wtveao7AIP9q5uFAQmVv2I4n8v/Y=;
 b=Ubl2/3C1UHclGBsf0UVUgHFxH026AYLF+OyeWHtzn6wES4hNF/ColxeZMCJR2ps3Kq
 IXGU8F+75V0q59EQjpppm40tgVf3G+OvjQ3nX5r43cW8jqZbdOPd6zd+UuzLjbei3ShX
 FcFBIhK5hbnp6lgPZ5oSLtLYOkPoCAzS41bt54kn5vFyoGIpN8SQyabBWwPcnQQvzvp9
 dnwRHWJX/ZIOewNdflVqrtLreA2H/3EKhkXUQdfvHwAUpe0fpKRII+YmZBxw+UOkOxOz
 xQ1KHIGPIbs6Cr8y1TWSNU/NzoaCakPVbuZm9aHcQgC31cjj58Y8NL68dI2grJDeOZoH
 4p0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c8OXBEOBsZxAuz+wtveao7AIP9q5uFAQmVv2I4n8v/Y=;
 b=RdNSW7aDScTZ6lxilZoj493unNwaK/WELHGqmtPAhhVwMTmotpDkG2uPsCNSwu5/6V
 6uG16PCZxPkLXIi8wK+uEj0qwi/cDigzVtPc7BDMfYStnLR+mKcPFBC/RuWS+mAPYQzt
 ROQoF49OsLhrY+9vr5WQeOs4B43ST4+lM6dUTYswUbg/98O669vdqIHgYLqC5kzr+27c
 kLydqlzUx/8Zc0gho3xkZXnGsbS46NwXXJZ2KUuNSyiAw8J04PMlvSmvpwx0UXPXZozv
 FSo6QzhxzHwuEpclABWoOoyxxmJ84iSmxpZayrPiwW9L0GjaTowkmgV4zFasZLlxB4kQ
 MywQ==
X-Gm-Message-State: AOAM5332h5Nyb8iNlyPwEEsWICqIz6G1xrY+4TbnRcn3M+mdy9/56/aU
 dDJYuDsX4A7vsdfJKQ0sP27egDITLntiwxPQJqA=
X-Google-Smtp-Source: ABdhPJw8xRMgxRg/LloyAaGN8zxkmSEaExUQJnCATegUctJuJMwNWCT5HrwXlb+5ZLgKIRyjy0MahbqLZ+5oscm9TRA=
X-Received: by 2002:ac2:5384:: with SMTP id g4mr16115722lfh.1.1589326627823;
 Tue, 12 May 2020 16:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588282027.git.rosbrookn@ainfosec.com>
 <c38afab85d9fc005edade229896008a4ad5a1929.1588282027.git.rosbrookn@ainfosec.com>
 <3ED0B49D-123C-4925-B3A0-4FA0B44DF9F0@citrix.com>
 <CAEBZRSdWCJo9kBnNv6Jqt76E3fb8DDX6C4zndMtvrhngEzGHxg@mail.gmail.com>
 <294923FB-07D4-4CEB-9B29-3450DB454000@citrix.com>
In-Reply-To: <294923FB-07D4-4CEB-9B29-3450DB454000@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Tue, 12 May 2020 19:36:56 -0400
Message-ID: <CAEBZRSeFptOcLQ5sVyP6k4cmaqUwx9=HabnzPXfwBb+ih3nduQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] golang/xenlight: init xenlight go module
To: George Dunlap <George.Dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> The whole point of running =E2=80=98go build=E2=80=99 is to make sure tha=
t *the code we just copied* =E2=80=94 the code right now in our own local t=
ree, perhaps which was just generated =E2=80=94 actually compiles.

I understand that, and in my tests that's the outcome.

> It looks like when we add the `go.mod` further up the tree, it makes `go =
build` ignore the GOPATH environment variable we=E2=80=99re giving it, whic=
h causes the build failure.  But your =E2=80=9Cfix=E2=80=9D doesn=E2=80=99t=
 make it use the in-tree go code again; instead it looks like it causes `go=
 build` command to go and fetch the most recent `master` version from xenbi=
ts, ignoring the go code in the tree completely. :-)

The GOPATH is "ignored" because it is obsolete in module-aware go
(this is one of the primary motivations of modules). The build fails
(without changing XEN_GOCODE_URL) because xenproject.golang.org is
*not* the module in the local tree, and the subsequent fetch fails.
However, when the correct import path (after updating XEN_GOCODE_URL)
is used, go is smart enough to realize we're trying to build our local
module and will not do a fetch.

However, I'm more than happy to just use `go build` instead of `go
install` in that make target.

Thanks
-NR

