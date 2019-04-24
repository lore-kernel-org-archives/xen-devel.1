Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E04BC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 15:35:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15E2921773
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 15:35:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+5bkI5M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15E2921773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJJw1-0000Ca-Ui; Wed, 24 Apr 2019 15:35:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aie0=S2=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hJJw0-0000CN-L6
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 15:35:44 +0000
X-Inumbo-ID: 9edd011e-66a6-11e9-92d7-bc764e045a96
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9edd011e-66a6-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 15:35:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s15so25746924wra.12
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2019 08:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+s25ms4jcZn0OIFiUEXyBdZZ2ehrhJWg+1J2HomOBRI=;
 b=T+5bkI5Mc0cejIh1ZO/8UsqtVG2yrXk2QvLP2716LfeEwM0OA72xsw9sYiYgaM8xPz
 +zS1blRBXuorTDfMEjFTz+uhrWChljtYE5ZugE2bzi4i8kLc7MFD4ClnpjbPxLWX3fDo
 98XfmrCEIpMhXZlPbr9TyzofWXuLIbKj8JF0AVVigD893wpYIC6Ju/BrhjnXUMZTIhkU
 l4Djvv+aMkj/+k57UmN740XnGTWHelZUUhyycWzOFcX3bFASVOx8PStUqdDd4QNvnmFi
 ulRexSb1yfgPt1Mb8W7eqJpHaAfaId0+/qefYBSo0d9p8swWLaR/QVH5F+TKuNfxO/CU
 HwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+s25ms4jcZn0OIFiUEXyBdZZ2ehrhJWg+1J2HomOBRI=;
 b=brqphqj7s2h9Nc+gEA/IfKE6l4p0GL4tNNjTq/chEAYvc6tq42W6qRLLAH8ECHf0e1
 nXtrrPr3GavAUUSJNcZD6K8C90nv1GWBfkv/yGk5iG4MTb+yhePA4TapaRpz8Z+LRLAl
 E5y5Pq4dJ+9t74okiLslR9JnrVODC3ol2BUD2XqOE1hPCrGah+Kt03rtE3m6n5kgDnxN
 Hx8m/S6AyFi8Jx1MIGcgggcvwl8vFIp+8Dy0nkkPchmanjFCTDlaE1o7HKZ7go5G/2d2
 ogVeb1Uw93fwqxuQ0lO9WMHZv3YFXcNwtAaFL+66gSLlkqWkcWVnprfJ6XgMsn3xttnd
 709Q==
X-Gm-Message-State: APjAAAWuMAJLnzRAM1veCEpzDDqC/bfj9tUUEujOEEdoKFH/mVHljO58
 aPVo6KYdlUtQopp3FyjQaGT0RDHI81U2O68WlUM=
X-Google-Smtp-Source: APXvYqz3M68oLoAlCo1oNkTXUWwVPaA/HBEdzUGdOG4DDzKXZ6rpKyv/jfcnzJWMZlB+xAwKNmuei1hcUmddf1rJfAI=
X-Received: by 2002:a5d:6988:: with SMTP id g8mr554519wru.117.1556120142258;
 Wed, 24 Apr 2019 08:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
In-Reply-To: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 24 Apr 2019 09:35:05 -0600
Message-ID:
 <CABfawhkQyqM6Ha0xhR=riEqwof-HRc3JiD3+pwZ6pb-tdpxWpg@mail.gmail.com>
To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Subject: Re: [Xen-devel] VMI: singlestep event not received
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424153505._i0OdLmw-rOupfFG6iuxkBc4XK5ynlkiFspvEE2tmqE@z>

T24gU3VuLCBBcHIgMjEsIDIwMTkgYXQgNDoyNyBQTSBNYXRoaWV1IFRhcnJhbAo8bWF0aGlldS50
YXJyYWxAcHJvdG9ubWFpbC5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBJJ20gaGF2aW5nIGFuIGlz
c3VlIHdpdGggWGVuJ3MgVk1JIHN1YnN5c3RlbS4KPgo+IE15IGdvYWwgaXMgdG8gYnVpbGQgYSBz
bWFsbCBkZWJ1Z2dlciB0aGF0IGNhbiBicmVhayBhdCBhbiBhcHBsaWNhdGlvbidzIGVudHJ5cG9p
bnQKPiBvbiBXaW5kb3dzIFhQLCB3aGVuIGEgbmV3IHByb2Nlc3MgaXMgYmVpbmcgY3JlYXRlZC4K
Pgo+IFRvIGFjY29tcGxpc2ggdGhpcywgSSBmaXJzdCBzZXQgYSBzb2Z0d2FyZSBicmVha3BvaW50
IG9uIEtpVGhyZWFkU3RhcnR1cCAobnRvc2tybmwuZXhlKSwKPiB0aGVuIG9uIFJ0bFVzZXJUaHJl
YWRTdGFydCAobnRkbGwuZGxsKS4KPgo+IFRoZSBwcm9ibGVtIGlzIHRoYXQgUnRsVXNlclRocmVh
ZFN0YXJ0IGlzIHBhZ2VkLW91dCwgc28gaSdtIHRyeWluZyB0byByZWFjaCBpdCB2aWEgc2luZ2xl
c3RlcHBpbmcgYXMgYSBiYWNrdXAgc29sdXRpb24uCj4KPiBUbyBteSBzdXJwcmlzZSwgaXQgZGlk
bid0IHdvcmsgYXMgZXhwZWN0ZWQsIHNpbmNlIG15IGFwcGxpY2F0aW9uIGp1c3QgaGFuZ2VkLCB3
YWl0aW5nIGZvciB0aGUgbmV4dCBzaW5nbGVzdGVwIGV2ZW50Ogo+Cj4gLS1XYWl0aW5nIGZvciB4
ZW4gZXZlbnRzLi4uKDAgbXMpCj4gRGlzYWJsaW5nIHNpbmdsZSBzdGVwIG9uIHZjcHU6IDAKPiAt
LVJlbW92aW5nIE1URiBmbGFnIGZyb20gdmNwdSAwCj4gLS1TaHV0dGluZyBkb3duIHNpbmdsZSBz
dGVwIG9uIGRvbWFpbiAxCj4gLS1SZW1vdmluZyBNVEYgZmxhZyBmcm9tIHZjcHUgMAo+IC0tU3Rh
cnRpbmcgc2luZ2xlIHN0ZXAgb24gZG9tYWluIDEKPiBFbmFibGluZyBzaW5nbGUgc3RlcAo+IElO
Rk86V2luZG93c0RlYnVnQ29udGV4dDpbMTA1XSBhdDogMHg4MDZkMzJkNgo+IERpc2FibGluZyBz
aW5nbGUgc3RlcCBvbiB2Y3B1OiAwCj4gLS1SZW1vdmluZyBNVEYgZmxhZyBmcm9tIHZjcHUgMAo+
IC0tU2h1dHRpbmcgZG93biBzaW5nbGUgc3RlcCBvbiBkb21haW4gMQo+IC0tUmVtb3ZpbmcgTVRG
IGZsYWcgZnJvbSB2Y3B1IDAKPiAtLVN0YXJ0aW5nIHNpbmdsZSBzdGVwIG9uIGRvbWFpbiAxCj4g
LS1TZXR0aW5nIE1URiBmbGFnIG9uIHZjcHUgMAo+IEVuYWJsaW5nIHNpbmdsZSBzdGVwCj4gLS1X
YWl0aW5nIGZvciB4ZW4gZXZlbnRzLi4uKDEwMDAgbXMpCj4gLS1XYWl0aW5nIGZvciB4ZW4gZXZl
bnRzLi4uKDAgbXMpCj4gRGlzYWJsaW5nIHNpbmdsZSBzdGVwIG9uIHZjcHU6IDAKPiAtLVJlbW92
aW5nIE1URiBmbGFnIGZyb20gdmNwdSAwCj4gLS1TaHV0dGluZyBkb3duIHNpbmdsZSBzdGVwIG9u
IGRvbWFpbiAxCj4gLS1SZW1vdmluZyBNVEYgZmxhZyBmcm9tIHZjcHUgMAo+IC0tU3RhcnRpbmcg
c2luZ2xlIHN0ZXAgb24gZG9tYWluIDEKPiBFbmFibGluZyBzaW5nbGUgc3RlcAo+IElORk86V2lu
ZG93c0RlYnVnQ29udGV4dDpbMTA2XSBhdDogMHg4MDZkMzJkYwo+IERpc2FibGluZyBzaW5nbGUg
c3RlcCBvbiB2Y3B1OiAwCj4gLS1SZW1vdmluZyBNVEYgZmxhZyBmcm9tIHZjcHUgMAo+IC0tU2h1
dHRpbmcgZG93biBzaW5nbGUgc3RlcCBvbiBkb21haW4gMQo+IC0tUmVtb3ZpbmcgTVRGIGZsYWcg
ZnJvbSB2Y3B1IDAKPiAtLVN0YXJ0aW5nIHNpbmdsZSBzdGVwIG9uIGRvbWFpbiAxCj4gLS1TZXR0
aW5nIE1URiBmbGFnIG9uIHZjcHUgMAo+IEVuYWJsaW5nIHNpbmdsZSBzdGVwCj4gLS1XYWl0aW5n
IGZvciB4ZW4gZXZlbnRzLi4uKDEwMDAgbXMpCj4gLS1XYWl0aW5nIGZvciB4ZW4gZXZlbnRzLi4u
KDEwMDAgbXMpCj4gLS1XYWl0aW5nIGZvciB4ZW4gZXZlbnRzLi4uKDEwMDAgbXMpCj4gLS1XYWl0
aW5nIGZvciB4ZW4gZXZlbnRzLi4uKDEwMDAgbXMpCj4gLS1XYWl0aW5nIGZvciB4ZW4gZXZlbnRz
Li4uKDEwMDAgbXMpCj4gLS1XYWl0aW5nIGZvciB4ZW4gZXZlbnRzLi4uKDEwMDAgbXMpCj4gLS1X
YWl0aW5nIGZvciB4ZW4gZXZlbnRzLi4uKDEwMDAgbXMpCj4KPiBUaGUgcmVhc29uIHdoeSBpJ20g
ZGlzYWJsaW5nIGVuZCBlbmFibGluZyB0aGUgc2luZ2xlc3RlcCBzdWNjZXNzaXZlbHkgaXMgYmVj
YXVzZSBpIGFscmVhZHkKPiBoYXZlIGEgbGlidm1pIHNpbmdsZXN0ZXAgZXZlbnQgcmVnaXN0ZXJl
ZCwgd2l0aCB0aGUgTVRGIGZsYWcgZGlzYWJsZWQuCj4gSSBvbmx5IHVzZSBpdCBmb3IgYnJlYWtw
b2ludCByZWNvaWwgc2l0dWF0aW9ucy4KPiBJdCdzIGEgbGltaXRhdGlvbiBvZiB0aGUgbGlidm1p
IEFQSSB3aGVyZSB5b3UgY2Fubm90IG1vZGlmaWVkIGEgcmVnaXN0ZXJlZCBldmVudCB0byBlbmFi
bGUgc2luZ2xlc3RlcCBhdCB3aWxsLgoKSSdtIG5vdCBlbnRpcmVseSBzdXJlIHdoYXQgeW91IG1l
YW4gaGVyZSAoYW5kIHBlcmhhcHMgdGhhdCdzIGEKZGlzY3Vzc2lvbiB0byBiZSBtb3ZlZCB0byB0
aGUgTGliVk1JIGlzc3VlcyBwYWdlKS4gSWYgeW91IGFscmVhZHkgaGF2ZQphbiBldmVudCByZWdp
c3RlcmVkIGZvciBzaW5nbGVzdGVwcGluZyB3aHkgd291bGQgeW91IHdhbnQgdG8gZGlzYWJsZQpp
dCBqdXN0IHRvIHJlLWVuYWJsZSBpdD8gSWYgaXQncyBiZWNhdXNlIHlvdSBqdXN0IGhhdmUgdGhl
IGhhbmRsZXIKcmVnaXN0ZXJlZCB3aXRob3V0IE1URiBhY3R1YWxseSBhY3RpdmUsIHRoYXQncyBz
cGVjaWZpY2FsbHkgbWFkZSBmb3IKdGhlIHNpdHVhdGlvbiB3aGVyZSB0dXJuIG9uL29mZiBNVEYg
dXNpbmcgdGhlIFZNX0VWRU5UX1JFU1BPTlNFX0ZMQUcuCgpBbHNvLCB1c2luZyBNVEYgdG8gcmVh
Y2ggcGFydHMgb2YgdGhlIGNvZGUgdGhhdCBhcmUgc2V2ZXJhbCBodW5kcmVkCmluc3RydWN0aW9u
cyBkb3duIHRoZSBwaXBlIHdpbGwgbW9zdCBsaWtlbHkgbm90IHdvcmsgZHVlIHRvIHRoZQpleHRy
ZW1lIG92ZXJoZWFkIGl0IGFkZHMuIFlvdSBhcmUgbW9yZSBsaWtlbHkgdG8gZ2V0IGFuIGludGVy
cnVwdCBhbmQKbGFuZCBzb21ld2hlcmUgaW4gdGhlIGtlcm5lbCBsb25nIGJlZm9yZSB5b3UgcmVh
Y2ggeW91ciB0YXJnZXQuIEF0CmxlYXN0IHRoYXQgaGFzIGJlZW4gbXkgZXhwZXJpZW5jZS4gWW91
IGxpa2VseSB3YW50IHRvIGludmVzdGlnYXRlCm90aGVyIG9wdGlvbnMsIHN1Y2ggYXMgd2hhdCBS
YXp2YW4gcmVjb21tZW5kZWQuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
