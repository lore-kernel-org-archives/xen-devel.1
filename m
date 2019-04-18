Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AEBC10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 11:54:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 261752083D
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 11:54:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=thegrail.co header.i=@thegrail.co header.b="Fcs9wdnZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 261752083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thegrail.co
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH5cj-00039i-Cv; Thu, 18 Apr 2019 11:54:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=htIB=SU=onedefence.com=dylanger@srs-us1.protection.inumbo.net>)
 id 1hH5ch-00039X-Rs
 for xen-devel@lists.xen.org; Thu, 18 Apr 2019 11:54:35 +0000
X-Inumbo-ID: bb8b7dc9-61d0-11e9-92d7-bc764e045a96
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bb8b7dc9-61d0-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 11:54:34 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id c16so1461993otn.4
 for <xen-devel@lists.xen.org>; Thu, 18 Apr 2019 04:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thegrail.co; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l268rZlBV2CyyKpjs8nBF6uSs/zg3i/i/pBEyEtjTQQ=;
 b=Fcs9wdnZvpt72fLk8KhkZnZCikCHwOmm9cEVAa+wPqkULO4Kdq63pdTaaV/0p7wfdt
 WGJn5svFPJZL2EFql07FR96KAXQOeh3VHE5a+dbqCCvM2M5RasQ7fIND0g79c2D55WYk
 zLyAUrcCH2ISjdGEOLf7X9+0OCjAH97qgkhNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l268rZlBV2CyyKpjs8nBF6uSs/zg3i/i/pBEyEtjTQQ=;
 b=naKiov6MLkZ0AyiAsXPfqjCu11RJ4hixhZDkau9I9rw6VyeYYNIjp3wdUjZKug7DXP
 rtkZE4f33aAe0v7bKrjF5es1PNoxFqcyaCiZp3+18uoiX0nm4RkCnBXRw8W6VpV579YL
 ZileuwWEXydY5VlYThFriHa2cLfWUcJUdd8P0AxjQzehvMetOCxF9sMuu87s9525Jyff
 cHe75MJpGLVXr6Oj2627NjaJHIrPS5c3coM1guW+a7qJ6k3MVQru0Fgzj5GnpptzoY2Q
 b/rN3HbjySwcOgkxvKF7kJGHVqygCAgn0ilOXGIkIe6tPr+kIslPUoNDq/xZGvToYR0d
 PUOA==
X-Gm-Message-State: APjAAAVQrr+F2CqEkcIobyHTieT13ldE09ta5iABCOxpUcDU3b7rt8JL
 za6RpjfpPbGPnbBvN2PPMllHBWwvChjPEcB76uPmGg==
X-Google-Smtp-Source: APXvYqyKt0M2hs1d4GDJQoKSPqojd4SMXs2xALs811nstxWXaoaYVmBkdxLlgP239nG5s8ACYl6AedlxB09cKrlzUVk=
X-Received: by 2002:a05:6830:15:: with SMTP id
 c21mr55590072otp.182.1555588473412; 
 Thu, 18 Apr 2019 04:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190418085634.3629-1-dylanger@thegrail.co>
 <53b32c69-b0b4-5441-c8e2-299769eabf8f@citrix.com>
 <CANJ4vQ1nOuFZw0kk0dWEsx4Q0h8YE2H8gRzg422cRf65FAkncg@mail.gmail.com>
 <660adf6f-a574-d1cb-44a3-871b8d076a54@citrix.com>
In-Reply-To: <660adf6f-a574-d1cb-44a3-871b8d076a54@citrix.com>
From: Dylanger Daly <dylanger@thegrail.co>
Date: Thu, 18 Apr 2019 12:54:21 +0100
Message-ID:
 <CANJ4vQ3TpPpqoiP5uXXVXjjUCkzwKYGTztCe2g34s_EUy2ghig@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] Add Undervolt MSRs to wrmsr function.
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
Cc: Dylanger Daly <dylanger@thegrail.co>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418115421.SilLKwNBih9CxDSFAQ1NcajkDF4U_VtfOv1nCudhZG4@z>

SSdtIHJ1bm5pbmcgYW4gaTctODU1MFUgb24gYSBIdWF3ZWkgTWF0ZWJvb2sgWCBQcm8uIFJ1bm5p
bmcgUXViZXMgT1MgSQp1c2VkIHRvIGlkbGUgfjYwQywgd2l0aCB0aGVzZSBNU1JzIGVuYWJsZWQs
IEkndmUgYmVlbiBhYmxlIHRvIGdldApzdGFibGUgfjQ1LTU1Qy4KCkknbSBub3QgdG9vIHN1cmUs
IGJ1dCBJIHRoaW5rIGl0IHdhcyByZXZlcnNlIGVuZ2luZWVyZWQgZnJvbSBJbnRlbCdzClhUVSBU
b29sLiBQZXJoYXBzIGl0J3MgYmVoaW5kIE5EQXM/IEknbSBub3QgdG9vIHN1cmUKCk1TUiAxNTAg
aXMgd2hlcmUgeW91J3JlIGFwcGx5aW5nIHRoZSBVbmRlcnZvbHQgVm9sdGFnZSBPZmZzZXRzLgoK
T24gVGh1LCBBcHIgMTgsIDIwMTkgYXQgMTI6MTIgUE0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAxOC8wNC8yMDE5IDEwOjE5LCBEeWxhbmdl
ciBEYWx5IHdyb3RlOgo+ID4gTm8gd29ycmllcyBBbmRyZXcsIGl0IHdhcyBteSBmaXJzdCBwYXRj
aCwgdGhhbmsgeW91IGZvciB0aGUgcmVzcG9uc2UuCj4gPgo+ID4gSXQncyBiYXNlZCBvbiBYZW4g
NC44Cj4gPgo+ID4gRG9tMCBzaG91bGQgYmUgY29udHJvbGxpbmcgaXQsIGJ1dCBJIHdhc24ndCBh
d2FyZSBvZiB0aGUgU2VjdXJpdHkKPiA+IGltcGxpY2F0aW9ucy4KPiA+Cj4gPiBUaGUgc2NvcGUg
aXNuJ3Qgd2VsbCBkb2N1bWVudGVkOgo+ID4gIGh0dHBzOi8vcmVzc21hbi5vcmcvcG9zdHMvMjAx
OC0wNi0yNi12b2x0YWdlLXRlbXBlcmF0dXJlLXRkcC10aGlua3BhZC8KPiA+Cj4gPiBNb3JlIGV4
cGVyaW1lbnRhbCBhcyBpdCB3b3JrZWQgd2l0aCBteSBMYXB0b3AuCj4KPiBXaGljaCBDUFUgZXhh
Y3RseT8KPgo+IE1TUl9URU1QRVJBVFVSRV9UQVJHRVQgaXMgZG9jdW1lbnRlZC4gIEl0IGhhcyBw
YWNrYWdlIHNjb3BlLCBidXQgdGhlCj4gYXZhaWxhYmlsaXR5IG9mIGNlcnRhaW4gZmllbGRzIGlz
IG1vZGVsIHNwZWNpZmljIChidXQgY29uc2lzdGVudCwgYXQgbGVhc3QpLgo+Cj4gSSBjYW4ndCBm
aW5kIGFueSBkb2N1bWVudGF0aW9uIG9uIE1TUiAxNTAgYXQgYWxsLgo+Cj4gfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
