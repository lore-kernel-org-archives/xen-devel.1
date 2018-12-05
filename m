From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: arm: xl vcpu-pin leads to oom-killer slashing
 processes
Date: Wed, 5 Dec 2018 14:40:07 +0200
Message-ID: <52353b63-5434-4b33-5ee7-e3a559563c6a@gmail.com>
References: <2c2385f9-515d-1c13-2618-d22d52901abc@gmail.com>
 <cfad156f-19ef-5e87-7af0-3dbbf361dc8a@arm.com>
 <9f2f6edf-c96d-fda9-851b-a2bae8fb25ec@gmail.com>
 <6bc804b4-df7a-08fd-9bf0-7384015a2b74@arm.com>
 <5f581369-55ad-345f-7837-48265fcd805a@gmail.com>
 <ee45a5c4-5097-a0e6-8099-f0a998cc3c88@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j75d=oo=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gUWTS-00025b-CZ
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 12:40:18 +0000
Received: by mail-lj1-x234.google.com with SMTP id 83-v6so18172599ljf.10
 for <xen-devel@lists.xenproject.org>; Wed, 05 Dec 2018 04:40:17 -0800 (PST)
In-Reply-To: <ee45a5c4-5097-a0e6-8099-f0a998cc3c88@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNS4xMi4xOCAxNDoxNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBZZXMsIGl0IHRoaW5r
cyBzby4gQnV0IGl0IGlzIG5vdCBsaW5rZWQgdG8gZG9tYWluIC4KPiAKPiBXaGF0IGRvIHlvdSBt
ZWFuPwpJdCBzaG91bGQgYmUgcmVhZCBhcyAiQnV0IGl0IGlzIG5vdCBsaW5rZWQgdG8gZG9tYWlu
IG1lbW9yeSBzaXplIi4KCj4gQSBtZW1vcnkgY29ycnVwdGlvbiBieSBYZW4gaXMgZXh0cmVtZWx5
IHVubGlrZWx5LiAKSSBiZWxpZXZlIGluIHRoYXQuCgo+IFNvIGl0IGxvb2tzIGxpa2UgdG8gbWUg
dGhpcyBpcyBhIHJlbGF0ZWQgdG8geW91ciBkb21haW4gKGtlcm5lbCBvciB1c2Vyc3BhY2UpLCBw
b3NzaWJseSBiZWNhdXNlIG1lbW9yeSBoYXMgbm90IGJlZW4gZnJlZWQgY29ycmVjdGx5LgpJdCBt
aWdodCBiZS4gQnV0IGhhcHBlbnMgb25seSB3aXRoIGFuZCByaWdodCBhZnRlciB2Y3B1IHBpbm5p
bmcuCgo+IEJlbG93IGEgbGlzdCBvZiBxdWVzdGlvbnMgdG8gYW5zd2VyOgo+ICDCoMKgwqDCoC0g
Q2FuIHlvdSBnaXZlIHRoZSBzdGVwcyB0byByZXByb2R1Y2UgaXQgZnJvbSBib290PwpUaGUgc3Rl
cCBpcyBzaW5nbGUgYW5kIHRyaXZpYWwsIGp1c3QgdHJ5IHRvIHBpbiB2Y3B1cyBmcm9tIERvbTAu
Cgo+ICDCoMKgwqDCoC0gSG93IG11Y2ggbWVtb3J5IGxlZnQgZG8geW91IGhhdmUgYmVmb3JlIGNh
bGxpbmcgeGwgdmNwdS1waW4/Ck1lbWluZm8gc2F5cwogICAgIHJvb3RAc2FsdmF0b3IteDp+IyBj
YXQgL3Byb2MvbWVtaW5mbwogICAgIE1lbVRvdGFsOiAgICAgICAgMjk5NTgyOCBrQgogICAgIE1l
bUZyZWU6ICAgICAgICAgMjgxMDM2MCBrQgogICAgIE1lbUF2YWlsYWJsZTogICAgMjc1ODQyMCBr
QgoKVG9wIHNheXM6CiAgICAgTWVtOiAxODU1OTJLIHVzZWQsIDI4MTAyMzZLIGZyZWUsIDIxMDIw
SyBzaHJkLCAwSyBidWZmLCA1MzAwMEsgY2FjaGVkCiAgICAgQ1BVOiAgIDAlIHVzciAgIDglIHN5
cyAgIDAlIG5pYyAgOTElIGlkbGUgICAwJSBpbyAgIDAlIGlycSAgIDAlIHNpcnEKCj4gIMKgwqDC
oMKgLSBXaGVuIGV4YWN0bHkgZG8geW91IHBpbiB0aGUgdkNQVXM/IChpLmUgaG93IGxvbmcgYWZ0
ZXIgYm9vdCkKUmlnaHQgYWZ0ZXIgbG9naW4uCgo+ICDCoMKgwqDCoC0gV2hhdCBhcmUgdGhlIG90
aGVyIHByb2dyYW1zIHJ1bm5pbmc/IEhvdyBtdWNoIG1lbW9yeSBhcmUgdGhleSB1c2luZz8KV2Vz
dG9uLCBzeXN0ZW1kIGRhZW1vbnMsIFhlbiBkYWVtb25zLCBvdGhlciBZb2N0byBkYWVtb25zLiBB
Y3R1YWxseSwgbm90aGluZyBzcGVjaWFsLgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
