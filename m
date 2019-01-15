From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 09/14] argo: implement the sendv op;
 evtchn: expose send_guest_global_virq
Date: Tue, 15 Jan 2019 17:19:41 +0100
Message-ID: <20190115161941.2njuwtk66o4y6fza@mac>
References: <1547544466-21135-1-git-send-email-christopher.w.clark@gmail.com>
 <1547544466-21135-10-git-send-email-christopher.w.clark@gmail.com>
 <20190115154929.m4vhdpokhn5mubbv@mac>
 <5C3E0601020000780020DF35@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2vyh=PX=citrix.com=prvs=911eac428=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gjRUT-0003hA-EZ
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 16:23:01 +0000
Content-Disposition: inline
In-Reply-To: <5C3E0601020000780020DF35@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMDk6MTA6NDFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE1LjAxLjE5IGF0IDE2OjQ5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMDE6Mjc6NDFBTSAtMDgwMCwgQ2hyaXN0
b3BoZXIgQ2xhcmsgd3JvdGU6Cj4gPj4gK3N0YXRpYyBpbnQKPiA+PiArcGVuZGluZ19yZXF1ZXVl
KGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBhcmdvX3JpbmdfaW5mbyAqcmluZ19pbmZv
LAo+ID4+ICsgICAgICAgICAgICAgICAgZG9taWRfdCBzcmNfaWQsIHVuc2lnbmVkIGludCBsZW4p
Cj4gPj4gK3sKPiA+PiArICAgIHN0cnVjdCBobGlzdF9ub2RlICpub2RlOwo+ID4+ICsgICAgc3Ry
dWN0IHBlbmRpbmdfZW50ICplbnQ7Cj4gPj4gKwo+ID4+ICsgICAgQVNTRVJUKExPQ0tJTkdfTDMo
ZCwgcmluZ19pbmZvKSk7Cj4gPj4gKwo+ID4+ICsgICAgaGxpc3RfZm9yX2VhY2hfZW50cnkoZW50
LCBub2RlLCAmcmluZ19pbmZvLT5wZW5kaW5nLCBub2RlKQo+ID4+ICsgICAgewo+ID4+ICsgICAg
ICAgIGlmICggZW50LT5kb21haW5faWQgPT0gc3JjX2lkICkKPiA+PiArICAgICAgICB7Cj4gPj4g
KyAgICAgICAgICAgIC8qCj4gPj4gKyAgICAgICAgICAgICAqIFJldXNlIGFuIGV4aXN0aW5nIHF1
ZXVlIGVudHJ5IGZvciBhIG5vdGlmaWNhdGlvbiByYXRoZXIgdGhhbiBhZGQKPiA+PiArICAgICAg
ICAgICAgICogYW5vdGhlci4gSWYgdGhlIGV4aXN0aW5nIGVudHJ5IGlzIHdhaXRpbmcgZm9yIGEg
c21hbGxlciBzaXplIHRoYW4KPiA+PiArICAgICAgICAgICAgICogdGhlIGN1cnJlbnQgbWVzc2Fn
ZSB0aGVuIGFkanVzdCB0aGUgcmVjb3JkIHRvIHdhaXQgZm9yIHRoZQo+ID4+ICsgICAgICAgICAg
ICAgKiBjdXJyZW50IChsYXJnZXIpIHNpemUgdG8gYmUgYXZhaWxhYmxlIGJlZm9yZSB0cmlnZ2Vy
aW5nIGEKPiA+PiArICAgICAgICAgICAgICogbm90aWZpY2F0aW9uLgo+ID4+ICsgICAgICAgICAg
ICAgKiBUaGlzIGFzc2lzdHMgdGhlIHdhaXRpbmcgc2VuZGVyIGJ5IGVuc3VyaW5nIHRoYXQgd2hl
bmV2ZXIgYQo+ID4+ICsgICAgICAgICAgICAgKiBub3RpZmljYXRpb24gaXMgdHJpZ2dlcmVkLCB0
aGVyZSBpcyBzdWZmaWNpZW50IHNwYWNlIGF2YWlsYWJsZQo+ID4+ICsgICAgICAgICAgICAgKiBm
b3IgKGF0IGxlYXN0KSBhbnkgb25lIG9mIHRoZSBtZXNzYWdlcyBhd2FpdGluZyB0cmFuc21pc3Np
b24uCj4gPj4gKyAgICAgICAgICAgICAqLwo+ID4+ICsgICAgICAgICAgICBpZiAoIGVudC0+bGVu
IDwgbGVuICkKPiA+PiArICAgICAgICAgICAgICAgIGVudC0+bGVuID0gbGVuOwo+ID4gCj4gPiBO
aXQ6Cj4gPiAKPiA+IGVudC0+bGVuID0gbWF4KGVudC0+bGVuLCBsZW4pOwo+IAo+IEkgZG9uJ3Qg
dGhpbmsgdXNlIG9mIG1heCgpIHNob3VsZCBiZSBhIHJlcXVpcmVtZW50IGluIGNhc2VzIHdoZXJl
Cj4gb25lIG9mIHRoZSBpdGVtcyBjb21wYXJlZCBpcyBhbHNvIHRoZSB2YWx1ZSB0byB1cGRhdGUu
IEknbSBub3QKPiBldmVuIGNvbnZpbmNlZCBpdCBoZWxwcyByZWFkYWJpbGl0eSBvZiB0aGUgc291
cmNlcywgbGV0IGFsb25lIHRoZQo+IHF1YWxpdHkgb2YgZ2VuZXJhdGVkIGNvZGUuCgpUaGVuIGRp
c3JlZ2FyZCB0aGUgY29tbWVudC4gSXQncyBsaWtlbHkgSSBnb3QgdXNlZCB0byB0aGlzIHN0eWxl
IGFuZApmaW5kIGl0IGVhc2llciB0byByZWFkLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
