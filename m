Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56197C43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 19:58:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61EDD206BA
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 19:58:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="HDFafUIY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61EDD206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJkVf-0007KD-PZ; Thu, 25 Apr 2019 19:58:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cKnJ=S3=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hJkVe-0007K8-En
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 19:58:18 +0000
X-Inumbo-ID: 76f21810-6794-11e9-9de1-b368c609b318
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76f21810-6794-11e9-9de1-b368c609b318;
 Thu, 25 Apr 2019 19:58:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556222296; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=IVkqw6/F5bBwYBwvIaJs2A6WhLKeFs2vO9t92bXKg9A=;
 b=HDFafUIYkldeSe7kgLSwe53rVFtecFq9G8bYhqA/ifX9M0CPIBmqp5OmoMMdH6tPNZnCEaQW
 ItUk7HXz86J5n0ZqBS6fnc2aVX28v06sAk7FnmjhV850wBlr8RTZrwRrTZB8VU2cK26sOojV
 Jj7zRY3hMQPa5d4cquPa+6axLmk=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mxa.mailgun.org with ESMTP id 5cc21157.7fda94ec0fb0-smtp-out-n01;
 Thu, 25 Apr 2019 19:58:15 -0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id w15so931237wmc.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 12:58:14 -0700 (PDT)
X-Gm-Message-State: APjAAAUmkHfGGcL0u85cpGg3OQuyg8Ni4+n8dtunNZK1+eewMCQICzTq
 7UDvKYKAoKgEB4gwaC6jSfYo1TwDJPqfLbVHoBA=
X-Google-Smtp-Source: APXvYqxxQmG4Z+fNi7lG+ICn1/Rx6VsbUv71xh5Kv8MPpzcyj5cFk4XHEO8oqKQlY/ScT4c3VuMk84QbzS7BQ3tpK9s=
X-Received: by 2002:a1c:43c2:: with SMTP id q185mr4954210wma.53.1556222293700; 
 Thu, 25 Apr 2019 12:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190425153252.14795-1-tamas@tklengyel.com>
 <20190425153252.14795-2-tamas@tklengyel.com>
 <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
In-Reply-To: <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 25 Apr 2019 13:57:36 -0600
X-Gmail-Original-Message-ID: <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
Message-ID:
 <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH 2/3] x86/mem_sharing: replace use of
 page_lock/unlock with our own lock
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425195736.f66B3wnbBKgS_M3bIqECT-mft46EV3AgNJuAPtejWwM@z>

T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgMTI6NTggUE0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAyNS8wNC8yMDE5IDE2OjMyLCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5o
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCj4gPiBpbmRleCA2ZmFhNTYzMTY3Li41OTRkZTYx
NDhmIDEwMDY0NAo+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCj4gPiArKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPiA+IEBAIC0xMzMsNyArMTMzLDEwIEBAIHN0cnVjdCBw
YWdlX2luZm8KPiA+ICAgICAgICAgICAqIG9mIHNoYXJpbmcgc2hhcmUgdGhlIHZlcnNpb24gdGhl
eSBleHBlY3QgdG8uCj4gPiAgICAgICAgICAgKiBUaGlzIGxpc3QgaXMgYWxsb2NhdGVkIGFuZCBm
cmVlZCB3aGVuIGEgcGFnZSBpcyBzaGFyZWQvdW5zaGFyZWQuCj4gPiAgICAgICAgICAgKi8KPiA+
IC0gICAgICAgIHN0cnVjdCBwYWdlX3NoYXJpbmdfaW5mbyAqc2hhcmluZzsKPiA+ICsgICAgICAg
IHN0cnVjdCB7Cj4gPiArICAgICAgICAgICAgc3RydWN0IHBhZ2Vfc2hhcmluZ19pbmZvICppbmZv
Owo+ID4gKyAgICAgICAgICAgIHJ3bG9ja190IGxvY2s7Cj4gPiArICAgICAgICB9IHNoYXJpbmc7
Cj4gPiAgICAgIH07Cj4gPgo+ID4gICAgICAvKiBSZWZlcmVuY2UgY291bnQgYW5kIHZhcmlvdXMg
UEdDX3h4eCBmbGFncyBhbmQgZmllbGRzLiAqLwo+Cj4gSSdtIGFmcmFpZCB0aGlzIGlzIGEgbm8t
Z28sIGJ1dCBmb3Igc29tZSByZWFzb25zIHdoaWNoIGFyZSByYXRoZXIgbW9yZQo+IHN1YnRsZSB0
aGF0IHRoZXkgYXBwZWFyIGhlcmUuCj4KPiBUaGVyZSBpcyBvbmUgc3RydWN0IHBhZ2VfaW5mbyBw
ZXIgNGsgZnJhbWUsIGFuZCB5b3UndmUgYWRkZWQgYW4gZXh0cmEgMTYKPiBieXRlcywgdGFraW5n
IGl0IGZyb20gMzIgYnl0ZXMgdG8gNDggYnl0ZXMuCj4KPiBPdGhlciB0aGFuIG1ha2luZyBpdCBh
IG5vbi1wb3dlci1vZi0yIChuZXQgZGlmZnN0YXQgZ3Jvdy9zaHJpbms6IDI1Ni8yNwo+IHVwL2Rv
d246IDc3NTAvLTU2OTYgKDIwNTQpIGR1ZSB0byBsZXNzIGVmZmljaWVudCBhcml0aG1ldGljWzFd
KSwgdGhlCj4gZnJhbXRhYmxlIGhhcyBhIGZpeGVkIHZpcnR1YWwgc2l6ZSAoMTI4RyBieSBkZWZh
dWx0KSwgc28geW91J3ZlIGVuZGVkIHVwCj4gZHJvcHBpbmcgWGVuJ3MgbWVtb3J5IGxpbWl0ICgx
NlRCIGJ5IGRlZmF1bHQpIGJ5IDEvMy4KCkludGVyZXN0aW5nLCBJJ20gbm90IHN1cmUgSSBjb21w
bGV0ZWx5IGZvbGxvdyBidXQgZG9lcyB0aGlzIG1lYW4gdGhhdAp0aGlzIHN0cnVjdHVyZSBpcyBu
b3cgbm90IGFsbG93ZWQgdG8gZ3JvdywgbGlrZSBldmVyLCBvciB0aGF0IEkganVzdApuZWVkIHRv
IGFkZCBwYWRkaW5nIHRvIGZpeCB1cCBpdHMgYWxpZ25tZW50PwoKVGFtYXMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
