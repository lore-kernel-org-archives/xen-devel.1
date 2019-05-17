From: Viktor Mitin <viktor.mitin.19@gmail.com>
Subject: Re: libxc: memory leak in handle_hvm_context
Date: Fri, 17 May 2019 14:56:44 +0300
Message-ID: <CAOcoXZbz6Yfjc=U+MEAPWL0g+wc44FpipM+AmrKJGMYeQPteJw@mail.gmail.com>
References: <CAOcoXZYuwoFDKexde=BJgexsv=DN5u_Y8WdLcOgveC+GvEAiuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FnXM=TR=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hRbTt-00044Y-1h
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 11:56:57 +0000
Received: by mail-it1-x131.google.com with SMTP id u16so10772190itc.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2019 04:56:56 -0700 (PDT)
In-Reply-To: <CAOcoXZYuwoFDKexde=BJgexsv=DN5u_Y8WdLcOgveC+GvEAiuA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Campbell <Ian.Campbell@citrix.com>, xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgaXMgbm8gbWVtb3J5IGxlYWsgaW4gY2FzZSB3aGVuIGhhbmRsZV9odm1fY29udGV4dCBm
dW5jdGlvbiBpcwpjYWxsZWQgbmV4dCB0aW1lLgpTbyB0aGUgY29kZSBzZWVtcyBvaywgcGxlYXNl
IGlnbm9yZSB0aGUgbWFpbCwgc29ycnkgZm9yIGNvbmZ1c2lvbi4KClRoYW5rcwoKT24gRnJpLCBN
YXkgMTcsIDIwMTkgYXQgMjo0OSBQTSBWaWt0b3IgTWl0aW4gPHZpa3Rvci5taXRpbi4xOUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gSGkgQWxsLAo+Cj4gSXQgc2VlbXMgdGhlcmUgaXMgYSBtZW1vcnkg
bGVhayBpbiBsaWJ4YyBmdW5jdGlvbiBoYW5kbGVfaHZtX2NvbnRleHQKPiAoaW4gZmlsZSB0b29s
cy9saWJ4Yy94Y19zcl9yZXN0b3JlX3g4Nl9odm0uYy4pLiBUaGVyZSBpcyBhIG1hbGxvYyBvZgo+
IHZhcmlhYmxlIHAgd2l0aG91dCBmcmVlLgo+IFBsZWFzZSB0YWtlIGEgbG9vay4KPgo+ICsvKgo+
ICsgKiBQcm9jZXNzIGFuIEhWTV9DT05URVhUIHJlY29yZCBmcm9tIHRoZSBzdHJlYW0uCj4gKyAq
Lwo+ICtzdGF0aWMgaW50IGhhbmRsZV9odm1fY29udGV4dChzdHJ1Y3QgeGNfc3JfY29udGV4dCAq
Y3R4LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGNfc3JfcmVjb3Jk
ICpyZWMpCj4gK3sKPiArICAgIHhjX2ludGVyZmFjZSAqeGNoID0gY3R4LT54Y2g7Cj4gKyAgICB2
b2lkICpwOwo+ICsKPiArICAgIHAgPSBtYWxsb2MocmVjLT5sZW5ndGgpOwo+ICsgICAgaWYgKCAh
cCApCj4gKyAgICB7Cj4gKyAgICAgICAgRVJST1IoIlVuYWJsZSB0byBhbGxvY2F0ZSAldSBieXRl
cyBmb3IgaHZtIGNvbnRleHQiLCByZWMtPmxlbmd0aCk7Cj4gKyAgICAgICAgcmV0dXJuIC0xOwo+
ICsgICAgfQo+ICsKPiArICAgIGZyZWUoY3R4LT54ODZfaHZtLnJlc3RvcmUuY29udGV4dCk7Cj4g
Kwo+ICsgICAgY3R4LT54ODZfaHZtLnJlc3RvcmUuY29udGV4dCA9IG1lbWNweShwLCByZWMtPmRh
dGEsIHJlYy0+bGVuZ3RoKTsKPiArICAgIGN0eC0+eDg2X2h2bS5yZXN0b3JlLmNvbnRleHRzeiA9
IHJlYy0+bGVuZ3RoOwo+ICsKPiArICAgIHJldHVybiAwOwo+ICt9Cj4KPiBUaGFua3MKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
