From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] xen/debug: make debugtrace more clever
 regarding repeating entries
Date: Thu, 14 Mar 2019 13:40:26 +0000
Message-ID: <cdc2be3d-b1ed-f95b-782b-a7601912c2d0@citrix.com>
References: <20190314093733.18175-1-jgross@suse.com>
 <20190314093733.18175-3-jgross@suse.com> <5C8A5842020000780021EA3E@suse.com>
 <98776ed5-42f7-2c42-aacb-acc9b549598f@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rzje=RR=citrix.com=prvs=969ff7116=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h4Qe8-0006dM-Q4
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 13:43:44 +0000
In-Reply-To: <98776ed5-42f7-2c42-aacb-acc9b549598f@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOSAxMzozOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxNC8wMy8yMDE5
IDE0OjMzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTQuMDMuMTkgYXQgMTA6MzcsIDxq
Z3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gLS0tIGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xl
LmMKPj4+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4+PiBAQCAtMTIyNSwxMyAr
MTIyNSwyOCBAQCB2b2lkIGRlYnVndHJhY2VfZHVtcCh2b2lkKQo+Pj4gICAgICB3YXRjaGRvZ19l
bmFibGUoKTsKPj4+ICB9Cj4+PiAgCj4+PiArc3RhdGljIHZvaWQgZGVidWd0cmFjZV9hZGRfdG9f
YnVmKGNoYXIgKmJ1ZikKPj4+ICt7Cj4+PiArICAgIGNoYXIgKnA7Cj4+PiArCj4+PiArICAgIGZv
ciAoIHAgPSBidWY7ICpwICE9ICdcMCc7IHArKyApCj4+PiArICAgIHsKPj4+ICsgICAgICAgIGRl
YnVndHJhY2VfYnVmW2RlYnVndHJhY2VfcHJkKytdID0gKnA7Cj4+PiArICAgICAgICAvKiBBbHdh
eXMgbGVhdmUgYSBudWwgYnl0ZSBhdCB0aGUgZW5kIG9mIHRoZSBidWZmZXIuICovCj4+PiArICAg
ICAgICBpZiAoIGRlYnVndHJhY2VfcHJkID09IChkZWJ1Z3RyYWNlX2J5dGVzIC0gMSkgKQo+Pj4g
KyAgICAgICAgICAgIGRlYnVndHJhY2VfcHJkID0gMDsKPj4+ICsgICAgfQo+Pj4gK30KPj4+ICsK
Pj4+ICB2b2lkIGRlYnVndHJhY2VfcHJpbnRrKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+Pj4gIHsK
Pj4+IC0gICAgc3RhdGljIGNoYXIgICAgYnVmWzEwMjRdOwo+Pj4gLSAgICBzdGF0aWMgdTMyIGNv
dW50Owo+Pj4gKyAgICBzdGF0aWMgY2hhciBidWZbMTAyNF07Cj4+PiArICAgIHN0YXRpYyBjaGFy
IGxhc3RfYnVmWzEwMjRdOwo+Pj4gKyAgICBzdGF0aWMgdTMyIGNvdW50LCBsYXN0X2NvdW50Owo+
PiBQbGVhc2UgY2hhbmdlIHRvIHVpbnQzMl90IG9yIGV2ZW4gYmV0dGVyIHNpbXBseSB0byB1bnNp
Z25lZCBpbnQuCj4gT2theS4KPgo+Pj4gQEAgLTEyNDMsMjUgKzEyNTgsMzIgQEAgdm9pZCBkZWJ1
Z3RyYWNlX3ByaW50ayhjb25zdCBjaGFyICpmbXQsIC4uLikKPj4+ICAKPj4+ICAgICAgQVNTRVJU
KGRlYnVndHJhY2VfYnVmW2RlYnVndHJhY2VfYnl0ZXMgLSAxXSA9PSAwKTsKPj4+ICAKPj4+IC0g
ICAgc25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgIiV1ICIsICsrY291bnQpOwo+Pj4gLQo+Pj4g
ICAgICB2YV9zdGFydChhcmdzLCBmbXQpOwo+Pj4gLSAgICAodm9pZCl2c25wcmludGYoYnVmICsg
c3RybGVuKGJ1ZiksIHNpemVvZihidWYpIC0gc3RybGVuKGJ1ZiksIGZtdCwgYXJncyk7Cj4+PiAr
ICAgICh2b2lkKXZzbnByaW50ZihidWYsIHNpemVvZihidWYpLCBmbXQsIGFyZ3MpOwo+PiBQbGVh
c2UgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGRyb3AgdGhlIHN0cmF5IGNhc3QuCj4gV2lsbCBk
by4KCkJvdGggY2FuIGJlIGRvbmUgb24gY29tbWl0LCBzdXJlbHk/Cgp+QW5kcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
