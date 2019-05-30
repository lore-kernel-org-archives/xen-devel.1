From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH v2] gic: drop interrupts enabling on
 interrupts processing
Date: Thu, 30 May 2019 19:12:21 +0300
Message-ID: <c0de5da0-9986-ea97-b7d3-6902bd789c19@gmail.com>
References: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
 <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
 <20d30591-bc90-5321-2de9-a11f7d36cb11@gmail.com>
 <f0e27dd4-fc59-05d8-e910-b63c0d398c00@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dPnK=T6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hWNfH-0005To-DN
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 16:12:27 +0000
Received: by mail-lf1-x141.google.com with SMTP id b11so5486497lfa.5
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2019 09:12:25 -0700 (PDT)
In-Reply-To: <f0e27dd4-fc59-05d8-e910-b63c0d398c00@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Andre Przywara <andre.przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyOS4wNS4xOSAxODozMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEl0IHdvdWxkIGhhdmUg
YmVlbiBuaWNlIHRvIGF0IGxlYXN0IGZpeCB1cCB0aGUgY29tbWl0IG1lc3NhZ2Ugd2l0aCB0aGUg
dHlwb2VzIChhbmQgcmV3b3JkaW5nKSBJIG1lbnRpb25lZCBpbiBteSBwcmV2aW91cyBlLW1haWwu
Cj4gWW91ciBjb21taXQgbWVzc2FnZSBuZWVkcyB0byBleHBsYWluZWQgd2h5IHRoaXMgaXMgZmlu
ZSB0byBrZWVwIHRoZSBpbnRlcnJ1cHQgbWFza2VkIGEgYml0IGxvbmdlci4gSSB3cm90ZSB0aGUg
ZXhwbGFuYXRpb24gaW4gbXkgcHJldmlvdXMgZS1tYWlsIHNvIHlvdSBjYW4gYm9ycm93IHRoZSBy
YXRpb25hbGUgZnJvbSB0aGVyZS4KeGVuL2FybTogZ2ljOiBEZWZlciB0aGUgZGVjaXNpb24gdG8g
dW5tYXNrIGludGVycnVwdHMgdG8gZG9fe0xQSSwgSVJRfSgpCgpIYXZpbmcgaXJxcyBlbmFibGVk
IGhlcmUgbGVhdmVzIGEgcm9vbSBmb3IgdHJhcHBpbmcgYW5kIGdvaW5nIHRocm91Z2ggdGhlIHRy
YXAKcGF0aCBhZ2FpbiBpZiB3ZSBoYXZlIGEgbmV3IGd1ZXN0IGludGVycnVwdCBhcnJpdmVkIChl
dmVuIHdpdGggdGhlIHNhbWUgb3IKbG93ZXIgcHJpb3JpdHksIGFmdGVyIGBkZXNjLT5oYW5kbGVy
LT5lbmQoZGVzYylgIGluIGBkb19JUlEoKWApLgpLZWVwaW5nIGludGVycnVwdHMgZGlzYWJsZWQg
ZHVyaW5nIGd1ZXN0IGludGVycnVwdHMgcHJvY2Vzc2luZyBhbGxvd3MgYXMKYXZvaWRpbmcgZXhj
ZXNzaXZlIHRyYXBzIChhbmQgd2FzdGluZyBjcHUgY3ljbGVzIGZvciB0cmFwIHBhdGgpIHdoaWxl
IHRoZSBuZXcKaW50ZXJydXB0cyB3b3VsZCBiZSBwcm9jZXNzZWQgaW4gdGhlIGxvb3AgYW55d2F5
LiBQcm9jZXNzaW5nIGd1ZXN0IGludGVycnVwdHMgYnkKdGhlIGxvb3Agc2hvdWxkIG5vdCBpbnRy
b2R1Y2Ugc2lnbmlmaWNhbnQgYWRkaXRpb25hbCBsYXRlbmN5IGJlY2F1c2UKdmdpY19pbmplY3Rf
aXJxKC4uLikgYWxyZWFkeSBtYXNraW5nIHRoZSBpbnRlcnJ1cHRzIGluIG1vc3Qgb2YgdGhlIGNh
c2VzLgoKCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
