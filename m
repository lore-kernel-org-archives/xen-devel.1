From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH 2/3] x86/mem_sharing: replace use of
 page_lock/unlock with our own lock
Date: Thu, 25 Apr 2019 13:57:36 -0600
Message-ID: <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
References: <20190425153252.14795-1-tamas@tklengyel.com>
 <20190425153252.14795-2-tamas@tklengyel.com>
 <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cKnJ=S3=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hJkVe-0007K8-En
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 19:58:18 +0000
Received: by mail-wm1-f42.google.com with SMTP id w15so931237wmc.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 12:58:14 -0700 (PDT)
In-Reply-To: <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

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
