Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FEFC10F03
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 18:17:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34461208E4
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 18:17:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="OJNVMKZj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34461208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIzy4-0002YZ-0s; Tue, 23 Apr 2019 18:16:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H2oZ=SZ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hIzy2-0002YU-V9
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 18:16:30 +0000
X-Inumbo-ID: e963cbca-65f3-11e9-aa30-53f062029de5
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e963cbca-65f3-11e9-aa30-53f062029de5;
 Tue, 23 Apr 2019 18:16:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556043388; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=GnilPb8C7khr/xqCpG4kwpdY2niFv8ONfHJ8BTzB6ZQ=;
 b=OJNVMKZjFYTcPeL78nuGzgZUoCpXpuXzvrjKPeiJJ620YU9XzUZ9SopEzK3OWofuNoybmPso
 yv4zq8c4MWJ/OmvKS6SXTMetAMgWabffaNL850rlY0wl9sdHN+8OPH8cGZZe0REny2wtS1qr
 VPaMVGdgJi7F8YwfmB2bl9OmXj8=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mxa.mailgun.org with ESMTP id 5cbf5679.7f15dc799230-smtp-out-n03;
 Tue, 23 Apr 2019 18:16:25 -0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id w15so1240992wmc.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2019 11:16:25 -0700 (PDT)
X-Gm-Message-State: APjAAAVHo75++NEOS+45LwPng4fd8be7Md3Ik6Qx0fDd9uu22OkUF9kg
 F2ly8XPH6pDtlbTXOTDVrFnOJbDyRQ5OOGNBfqU=
X-Google-Smtp-Source: APXvYqyZF5+jFCXthdP5dU9EVkdKZbnEj0My7vGwDhFsy1o4CvwoBDohMfHoR5mxCCWPf0cIySQZ7SdoEHemUFaCD0E=
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr3267419wmc.54.1556043384066; 
 Tue, 23 Apr 2019 11:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190423142959.12609-1-aisaila@bitdefender.com>
In-Reply-To: <20190423142959.12609-1-aisaila@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 23 Apr 2019 12:15:47 -0600
X-Gmail-Original-Message-ID: <CABfawhmhuHmdNXDNYh0LT3qYshHu0Bg0-nuPqtP-g08r2YPPeQ@mail.gmail.com>
Message-ID:
 <CABfawhmhuHmdNXDNYh0LT3qYshHu0Bg0-nuPqtP-g08r2YPPeQ@mail.gmail.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH v6] x86/altp2m: Aggregate get entry and
 populate into common funcs
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
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423181547.39tRSht1wwlnfMI8uvtXc4mAXWN4WLW0HQeozMYB1cc@z>

T24gVHVlLCBBcHIgMjMsIDIwMTkgYXQgODozMCBBTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQQo8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gVGhlIGNvZGUgZm9yIGdldHRpbmcg
dGhlIGVudHJ5IGFuZCB0aGVuIHBvcHVsYXRpbmcgd2FzIHJlcGVhdGVkIGluCj4gcDJtX2NoYW5n
ZV9hbHRwMm1fZ2ZuKCkgYW5kIGluIHAybV9zZXRfYWx0cDJtX21lbV9hY2Nlc3MoKS4KPgo+IFRo
ZSBjb2RlIGlzIG5vdyBpbiBvbmUgcGxhY2Ugd2l0aCBhIGJvb2wgcGFyYW0gdGhhdCBsZXRzIHRo
ZSBjYWxsZXIgY2hvb3NlCj4gaWYgaXQgcG9wdWxhdGVzIGFmdGVyIGdldF9lbnRyeSgpLgo+Cj4g
SWYgcmVtYXBwaW5nIGlzIGJlaW5nIGRvbmUgdGhlbiBib3RoIHRoZSBvbGQgYW5kIG5ldyBnZm4n
cyBzaG91bGQgYmUKPiB1bnNoYXJlZCBpbiB0aGUgaG9zdHAybSBmb3Iga2VlcGluZyB0aGluZ3Mg
Y29uc2lzdGVudC4gVGhlIHBhZ2UgdHlwZQo+IG9mIG9sZF9nZm4gd2FzIGFscmVhZHkgY2hlY2tl
ZCB3aGV0aGVyIGl0J3MgcDJtX3JhbV9ydyBhbmQgYmFpbCBpZiBpdAo+IHdhc24ndCBzbyBmdW5j
dGlvbmFsaXR5LXdpc2UgdGhpcyBqdXN0IHNpbXBsaWZpZXMgdGhpbmdzIGFzIGEgdXNlcgo+IGRv
ZXNuJ3QgaGF2ZSB0byByZXF1ZXN0IHVuc2hhcmluZyBtYW51YWxseSBiZWZvcmUgcmVtYXBwaW5n
Lgo+IE5vdywgaWYgdGhlIG5ld19nZm4gaXMgaW52YWxpZCBpdCBzaG91bGRuJ3QgcXVlcnkgdGhl
IGhvc3RwMm0gYXMKPiB0aGF0IGlzIGVmZmVjdGl2ZWx5IGEgcmVxdWVzdCB0byByZW1vdmUgdGhl
IGVudHJ5IGZyb20gdGhlIGFsdHAybS4KPiBCdXQgcHJvdmlkZWQgdGhhdCBzY2VuYXJpbyBpcyB1
c2VkIG9ubHkgd2hlbiByZW1vdmluZyBlbnRyaWVzIHRoYXQKPiB3ZXJlIHByZXZpb3VzbHkgcmVt
YXBwZWQvY29waWVkIHRvIHRoZSBhbHRwMm0sIHRob3NlIGVudHJpZXMgYWxyZWFkeQo+IHdlbnQg
dGhyb3VnaCBQMk1fQUxMT0MgfCBQMk1fVU5TSEFSRSBiZWZvcmUsIHNvIGl0IHdvbid0IGhhdmUg
YW4KPiBhZmZlY3Qgc28gdGhlIGNvcmUgZnVuY3Rpb24gZ2V0X2FsdHAybV9lbnRyeSgpIGlzIGNh
bGxpbmcKPiBfX2dldF9nZm5fdHlwZV9hY2Nlc3MoKSB3aXRoIFAyTV9BTExPQyB8IFAyTV9VTlNI
QVJFLgo+Cj4gYWx0cDJtX2dldF9lbnRyeV9kaXJlY3QoKSBpcyBhbHNvIGNhbGxlZCBpbiBwMm1f
c2V0X3N1cHByZXNzX3ZlKCkKPiBiZWNhdXNlIG9uIGEgbmV3IGFsdHAybSB2aWV3IHRoZSBmdW5j
dGlvbiB3aWxsIGZhaWwgd2l0aCBpbnZhbGlkIG1mbiBpZgo+IHAybS0+c2V0X2VudHJ5KCkgd2Fz
IG5vdCBjYWxsZWQgYmVmb3JlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Cj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxn
ZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1h
c0B0a2xlbmd5ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
