Return-Path: <SRS0=0mHu=7D=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F916C433DF
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2020 15:45:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A82D207D8
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2020 15:45:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYKeo4FG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A82D207D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbnNq-0005pv-8n; Thu, 21 May 2020 15:45:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OubW=7D=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jbnNo-0005pq-SZ
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 15:45:20 +0000
X-Inumbo-ID: 12d4b426-9b7a-11ea-ae69-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12d4b426-9b7a-11ea-ae69-bc764e2007e4;
 Thu, 21 May 2020 15:45:20 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x22so4730542lfd.4
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2020 08:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jm9exCPCFIMayaAFj2BX5Zlqia8v+/NT3eINPO+SFOQ=;
 b=rYKeo4FGTnkxQbo7HLwBIMoMx3jhFFPUHUtSEYn3fOKVqcc5D3OTmWwCtetulFNYrc
 8v2zODchHyIcebDd2yqWMb3vczuoysL5SiMUeoTxyOHi1O/3PinKyJmzjsOQPyTfHmmU
 ew61u49oTrWDL9B/HpgneRNH07CaZZjMXODSfm0Ak/+cK/yBgxPChR+tsZ5ua5icvCvN
 KlYMCiSm5mufOEl/flfcR0o2FI4nPmkowtVLp2dX0ptOhV+aXJBIIIqvoaGIxhOUI3zp
 7wbMFjU2nKlxqGL/sGrYfKDtfTSLopyM+8aTU9KZ6Zen0jcvs84T79MfJOJuryRRcgZF
 qAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jm9exCPCFIMayaAFj2BX5Zlqia8v+/NT3eINPO+SFOQ=;
 b=lm3npGRlcUT2G7YC2MdSkPAq50ypMjSdfBJnTtylpQASFy+tlKwkJi08pe8vf0PBAx
 w2AtCrvZNdFMZs9XOP1bVbpwGCcab0w7VOVDmfkfzg9+y0GD1/OgFNXylSzRT5KdSjwb
 5ayOACQBLjvcql/ZtRe7y1t5Yp/ovRMCKEkSHpZLEfu44DFji7St58SZHECt4rUJuDZX
 ZvHzkM9tO0HQfMP0f9lfhROr47unpsQe4Af6TonbanIyEZ1wyYbq9YmvgkO6+VincQBX
 03EWniJctmiyL2CHCrgsukV04az/gbkkK+6Nm5KKxkQvmYrqR8mSb+ST38xN2UH9mRtw
 5EAw==
X-Gm-Message-State: AOAM530Zs9iCCEBnJnDPQcCkg5cRJjP0m7AZ01/xkB+C730ePrl/IUIQ
 0ECq+iu/3r6C4IUBghzzaDXdbehRiky6odXE98qdO/Ka
X-Google-Smtp-Source: ABdhPJwP23FzXsaGMw8VXzt1+MZB3xI15t1l+4RKjcWda0IH/M/ldDMzeH3KrR9vn/rHCDsXf7IGZQlDTY3Aqt6/akQ=
X-Received: by 2002:a05:6512:3139:: with SMTP id
 p25mr5317196lfd.214.1590075918288; 
 Thu, 21 May 2020 08:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <49cc21c24b65ef5e1ce9810397c0fcd9d43f77f4.1590072675.git.rosbrookn@ainfosec.com>
In-Reply-To: <49cc21c24b65ef5e1ce9810397c0fcd9d43f77f4.1590072675.git.rosbrookn@ainfosec.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 21 May 2020 11:45:07 -0400
Message-ID: <CAEBZRSczH+baW+hV9MVnup4qPauu=uEZGK7EhrkFPy+pfS0Fmg@mail.gmail.com>
Subject: Re: [PATCH] golang/xenlight: add an empty line after DO NOT EDIT
 comment
To: Xen-devel <xen-devel@lists.xenproject.org>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> When generating documentation, pkg.go.dev and godoc.org assume a comment
> that immediately precedes the package declaration is a "package
> comment", and should be shown in the documentation. Add an empty line
> after the DO NOT EDIT comment in generated files to prevent these
> comments from appearing as "package comments."

George,

When I re-generated the code, there were also changes to
types/helpers.gen.go corresponding to recent changes from the linux
stubdom series. How should we make sure the xenlight package is
up-to-date for the 4.14 release?

Thanks,
NR

