Return-Path: <SRS0=JcWn=3N=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0951C2D0DB
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jan 2020 14:08:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EBE22075D
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jan 2020 14:08:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5MOSFjL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EBE22075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuzcr-0007sf-6M; Fri, 24 Jan 2020 14:07:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GXWj=3N=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1iuzcp-0007sZ-SC
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 14:07:55 +0000
X-Inumbo-ID: ea6734b0-3eb2-11ea-b833-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea6734b0-3eb2-11ea-b833-bc764e2007e4;
 Fri, 24 Jan 2020 14:07:55 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 9so1189079lfq.10
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2020 06:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3gf7T4bfXMVuSHQMT6KjeqFAETEV9g4AtkyHa3+lneM=;
 b=r5MOSFjLC3CZcwIdvPKW+UT2+5Ol+ODgLFuzEmP8P8hPV5uir3VX2rpB9m+NMxDwWI
 DE5h42LdfxQNWxlMkJb/KSPmcivMjP4il32WZImLMJBPZmqHe4LGgV1NOmE8038a91+V
 +JdskxzYr0bJ9Zo0z7XhaLtZd8aiee3uacilsTaZfC9g5LCuNRPXWZmi0BhIFPduyirH
 2l0/GtmXIqG6WI0F3Mp7K9lBkxd/z341mBdBPks1pYMowP1Y74RDs1g9ya0Pul2vzpLM
 Crpd1smcrrZMP/FDvjyoaHEFr92GPhRm12lV8p2/1/4qhvYE1GyAN9pG71uBLRjpsSEk
 k4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3gf7T4bfXMVuSHQMT6KjeqFAETEV9g4AtkyHa3+lneM=;
 b=t5N/PFIS8qo3N0/XT/eZ/4g8B6xLiouW/yUOtIL6p/c9gv3KZaNsiIjlpxl110mz6e
 H/f9YfvWCoE5NZpQBJWz4VzNv7QTLI0Hc/QUOo/vOu6hddYoV4mjas2AN7UsvI8TDv0s
 1ZZVgCURGd7PPn379uM/8zzbcZVc0fh4Khs/xhzarpjDWYA00wqI35ko21qp573tjyYY
 +1GVcdXhLcWv+JEN0whylpcMMbjgZtWRJchrJoqb711yOKF1z51mR5/m7D9d0eq/I6Nq
 /9VzH2A9qTLWaUIGFw3nOEBQlb33tqXIJT7djzlRntSKNemcTe30AxExi0Nse2Hjc29m
 YM/Q==
X-Gm-Message-State: APjAAAVoEiRj6K6zOpJ/w+D01e9wo9mXZj5fM6Jnp74p/Ut9y8BxU0G9
 clWTUmN3zPUCZmqCcbnKmHsAgv9SYY6Tjwrw3/w=
X-Google-Smtp-Source: APXvYqwU9+5ni7r+do6mfWGChpM5ARYVOH5s8h232ikwtDhk5BsFRiRJXIk+EWFWnJF55W+wl/vmuTEQEBV3R/YvoJE=
X-Received: by 2002:ac2:4214:: with SMTP id y20mr1466350lfh.212.1579874874195; 
 Fri, 24 Jan 2020 06:07:54 -0800 (PST)
MIME-Version: 1.0
References: <1284035258.1445298.1579543677315.ref@mail.yahoo.com>
 <1284035258.1445298.1579543677315@mail.yahoo.com>
 <20200122012713.GB2995@mail-itl>
 <1699773700.2581218.1579712175340@mail.yahoo.com>
 <20200122190133.GS2507@mail-itl>
In-Reply-To: <20200122190133.GS2507@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 24 Jan 2020 09:07:43 -0500
Message-ID: <CAKf6xpvEpmCtF_7qr4XwJhJYHYj1=M=0KmxUNXXuTEYRGP9VAg@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] HVM Driver Domain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, tosher 1 <akm2tosher@yahoo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjIsIDIwMjAgYXQgMjowMyBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBK
YW4gMjIsIDIwMjAgYXQgMDQ6NTY6MTVQTSArMDAwMCwgdG9zaGVyIDEgd3JvdGU6Cj4gPiBIaSBN
YXJlaywKPiA+Cj4gPiBUaGFua3MgZm9yIHlvdXIgcmVzcG9uc2UuIFRoZSBzZXJ2ZXIgbWFjaGlu
ZSBJIGFtIHVzaW5nIGZvciB0aGlzIHNldHVwIGlzIGFuIHg4Nl82NCBJbnRlbCBYZW9uLiBGb3Ig
dGhlIERvbTAsIEkgYW0gdXNpbmcgVWJ1bnR1IDE4LjA0IHJ1bm5pbmcgb24ga2VybmVsIHZlcnNp
b24gNS4wLjAtMzctZ2VuZXJpYy4gTXkgWGVuIHZlcnNpb24gaXMgNC45LjIuCj4gPgo+ID4gRm9y
IHRoZSBIVk0gZHJpdmVyIGRvbWFpbiwgSSBhbSB1c2luZyBVYnVudHUgMTguMDQgcnVubmluZyBv
biBrZXJuZWwgdmVyc2lvbiA1LjAuMC0yMy1nZW5lcmljLiBJIGFtIGRvaW5nIGEgTklDIFBDSSBw
YXNzdGhyb3VnaCB0byB0aGlzIGRvbWFpbi4gVGhlIFhlbiBjb25maWcgZmlsZSBmb3IgdGhpcyBk
b21haW4gbG9va3MgbGlrZSB0aGUgZm9sbG93aW5nLgo+ID4KPiA+IGJ1aWxkZXIgPSAiaHZtIgo+
ID4gbmFtZSA9ICJ1YnVudHUtZG9tZW50LWh2bSIKClRoaXMgbmFtZS4uLgoKPiA+IG1lbW9yeSA9
ICIyMDQ4Igo+ID4gcGNpID0gWyAnMDE6MDAuMCxwZXJtaXNzaXZlPTEnIF0KPiA+IHZjcHVzID0g
MQo+ID4gZGlzayA9IFsncGh5Oi9kZXYvdmcvdWJ1bnR1LWh2bSxoZGEsdyddCj4gPiB2bmMgPSAx
Cj4gPiBib290PSJjIgoKPHNuaXA+Cgo+ID4gbmFtZSA9ICJ1YnVudHVfb25fdWJ1bnR1Igo+ID4g
Ym9vdGxvYWRlciA9ICIvdXNyL2xpYi94ZW4tNC45L2Jpbi9weWdydWIiCj4gPiBtZW1vcnkgPSAx
MDI0Cj4gPiB2Y3B1cyA9IDEKPiA+IHZpZiA9IFsgJ2JhY2tlbmQ9dWJ1bnR1LWRvbW5ldC1odm0s
YnJpZGdlPXhlbmJyMScgXQoKLi4uYW5kIHRoaXMgbmFtZSBkb24ndCBtYXRjaC4KClJlZ2FyZHMs
Ckphc29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
