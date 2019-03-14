From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] xen/debug: make debugtrace more clever
 regarding repeating entries
Date: Thu, 14 Mar 2019 07:33:54 -0600
Message-ID: <5C8A5842020000780021EA3E@prv1-mh.provo.novell.com>
References: <20190314093733.18175-1-jgross@suse.com>
 <20190314093733.18175-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U6t1=RR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4QUf-0005cP-BH
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 13:33:57 +0000
In-Reply-To: <20190314093733.18175-3-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE5IGF0IDEwOjM3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIvY29u
c29sZS5jCj4gQEAgLTEyMjUsMTMgKzEyMjUsMjggQEAgdm9pZCBkZWJ1Z3RyYWNlX2R1bXAodm9p
ZCkKPiAgICAgIHdhdGNoZG9nX2VuYWJsZSgpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZCBkZWJ1
Z3RyYWNlX2FkZF90b19idWYoY2hhciAqYnVmKQo+ICt7Cj4gKyAgICBjaGFyICpwOwo+ICsKPiAr
ICAgIGZvciAoIHAgPSBidWY7ICpwICE9ICdcMCc7IHArKyApCj4gKyAgICB7Cj4gKyAgICAgICAg
ZGVidWd0cmFjZV9idWZbZGVidWd0cmFjZV9wcmQrK10gPSAqcDsKPiArICAgICAgICAvKiBBbHdh
eXMgbGVhdmUgYSBudWwgYnl0ZSBhdCB0aGUgZW5kIG9mIHRoZSBidWZmZXIuICovCj4gKyAgICAg
ICAgaWYgKCBkZWJ1Z3RyYWNlX3ByZCA9PSAoZGVidWd0cmFjZV9ieXRlcyAtIDEpICkKPiArICAg
ICAgICAgICAgZGVidWd0cmFjZV9wcmQgPSAwOwo+ICsgICAgfQo+ICt9Cj4gKwo+ICB2b2lkIGRl
YnVndHJhY2VfcHJpbnRrKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+ICB7Cj4gLSAgICBzdGF0aWMg
Y2hhciAgICBidWZbMTAyNF07Cj4gLSAgICBzdGF0aWMgdTMyIGNvdW50Owo+ICsgICAgc3RhdGlj
IGNoYXIgYnVmWzEwMjRdOwo+ICsgICAgc3RhdGljIGNoYXIgbGFzdF9idWZbMTAyNF07Cj4gKyAg
ICBzdGF0aWMgdTMyIGNvdW50LCBsYXN0X2NvdW50OwoKUGxlYXNlIGNoYW5nZSB0byB1aW50MzJf
dCBvciBldmVuIGJldHRlciBzaW1wbHkgdG8gdW5zaWduZWQgaW50LgoKPiBAQCAtMTI0MywyNSAr
MTI1OCwzMiBAQCB2b2lkIGRlYnVndHJhY2VfcHJpbnRrKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+
ICAKPiAgICAgIEFTU0VSVChkZWJ1Z3RyYWNlX2J1ZltkZWJ1Z3RyYWNlX2J5dGVzIC0gMV0gPT0g
MCk7Cj4gIAo+IC0gICAgc25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgIiV1ICIsICsrY291bnQp
Owo+IC0KPiAgICAgIHZhX3N0YXJ0KGFyZ3MsIGZtdCk7Cj4gLSAgICAodm9pZCl2c25wcmludGYo
YnVmICsgc3RybGVuKGJ1ZiksIHNpemVvZihidWYpIC0gc3RybGVuKGJ1ZiksIGZtdCwgYXJncyk7
Cj4gKyAgICAodm9pZCl2c25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgZm10LCBhcmdzKTsKClBs
ZWFzZSB0YWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgZHJvcCB0aGUgc3RyYXkgY2FzdC4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
