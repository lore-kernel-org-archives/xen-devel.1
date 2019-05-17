From: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: libxc: memory leak in handle_hvm_context
Date: Fri, 17 May 2019 12:23:49 +0000
Message-ID: <1558095829281.70695@citrix.com>
References: <CAOcoXZYuwoFDKexde=BJgexsv=DN5u_Y8WdLcOgveC+GvEAiuA@mail.gmail.com>,
 <CAOcoXZbz6Yfjc=U+MEAPWL0g+wc44FpipM+AmrKJGMYeQPteJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gdXm=TR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRbu1-0006Zj-FO
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 12:23:57 +0000
In-Reply-To: <CAOcoXZbz6Yfjc=U+MEAPWL0g+wc44FpipM+AmrKJGMYeQPteJw@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Viktor Mitin <viktor.mitin.19@gmail.com>, Ian Campbell <Ian.Campbell@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
List-Id: xen-devel@lists.xenproject.org

KEFwb2xvZ2llcyBmb3IgdXNlIG9mIG91dGxvb2sgLSBJJ20gaGF2aW5nIGVtYWlsIHByb2JsZW1z
IGF0bSkuCgpUaGVyZSBpcyBubyBtZW1vcnkgbGVhayBhdCBhbGwuCgp4ID0gbWVtY3B5KHksIC4u
Lik7CgppcyBhbiAieCA9IHk7IiBhc3NpZ25tZW50IGluIGRpc2d1aXNlLiAgUmVjYWxsIHRoYXQg
bWVtY3B5KCkgcmV0dXJucyB5LCBhbmQgaXNuJ3QgYSB2b2lkIGZ1bmN0aW9uLgoKfkFuZHJldwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyb206IFZpa3RvciBNaXRp
biA8dmlrdG9yLm1pdGluLjE5QGdtYWlsLmNvbT4KU2VudDogMTcgTWF5IDIwMTkgMTI6NTYKVG86
IEFuZHJldyBDb29wZXI7IElhbiBDYW1wYmVsbDsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCkNjOiBWb2xvZHlteXIgQmFiY2h1awpTdWJqZWN0OiBSZTogbGlieGM6IG1lbW9yeSBsZWFr
IGluIGhhbmRsZV9odm1fY29udGV4dAoKVGhlcmUgaXMgbm8gbWVtb3J5IGxlYWsgaW4gY2FzZSB3
aGVuIGhhbmRsZV9odm1fY29udGV4dCBmdW5jdGlvbiBpcwpjYWxsZWQgbmV4dCB0aW1lLgpTbyB0
aGUgY29kZSBzZWVtcyBvaywgcGxlYXNlIGlnbm9yZSB0aGUgbWFpbCwgc29ycnkgZm9yIGNvbmZ1
c2lvbi4KClRoYW5rcwoKT24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMjo0OSBQTSBWaWt0b3IgTWl0
aW4gPHZpa3Rvci5taXRpbi4xOUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgQWxsLAo+Cj4gSXQg
c2VlbXMgdGhlcmUgaXMgYSBtZW1vcnkgbGVhayBpbiBsaWJ4YyBmdW5jdGlvbiBoYW5kbGVfaHZt
X2NvbnRleHQKPiAoaW4gZmlsZSB0b29scy9saWJ4Yy94Y19zcl9yZXN0b3JlX3g4Nl9odm0uYy4p
LiBUaGVyZSBpcyBhIG1hbGxvYyBvZgo+IHZhcmlhYmxlIHAgd2l0aG91dCBmcmVlLgo+IFBsZWFz
ZSB0YWtlIGEgbG9vay4KPgo+ICsvKgo+ICsgKiBQcm9jZXNzIGFuIEhWTV9DT05URVhUIHJlY29y
ZCBmcm9tIHRoZSBzdHJlYW0uCj4gKyAqLwo+ICtzdGF0aWMgaW50IGhhbmRsZV9odm1fY29udGV4
dChzdHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgeGNfc3JfcmVjb3JkICpyZWMpCj4gK3sKPiArICAgIHhjX2ludGVyZmFjZSAq
eGNoID0gY3R4LT54Y2g7Cj4gKyAgICB2b2lkICpwOwo+ICsKPiArICAgIHAgPSBtYWxsb2MocmVj
LT5sZW5ndGgpOwo+ICsgICAgaWYgKCAhcCApCj4gKyAgICB7Cj4gKyAgICAgICAgRVJST1IoIlVu
YWJsZSB0byBhbGxvY2F0ZSAldSBieXRlcyBmb3IgaHZtIGNvbnRleHQiLCByZWMtPmxlbmd0aCk7
Cj4gKyAgICAgICAgcmV0dXJuIC0xOwo+ICsgICAgfQo+ICsKPiArICAgIGZyZWUoY3R4LT54ODZf
aHZtLnJlc3RvcmUuY29udGV4dCk7Cj4gKwo+ICsgICAgY3R4LT54ODZfaHZtLnJlc3RvcmUuY29u
dGV4dCA9IG1lbWNweShwLCByZWMtPmRhdGEsIHJlYy0+bGVuZ3RoKTsKPiArICAgIGN0eC0+eDg2
X2h2bS5yZXN0b3JlLmNvbnRleHRzeiA9IHJlYy0+bGVuZ3RoOwo+ICsKPiArICAgIHJldHVybiAw
Owo+ICt9Cj4KPiBUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
