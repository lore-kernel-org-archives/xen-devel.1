From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] vpci/msi: fix update of bound MSI
 interrupts
Date: Mon, 14 May 2018 08:59:33 -0600
Message-ID: <5AF9A45502000078001C28A2@prv1-mh.provo.novell.com>
References: <20180508092359.6829-1-roger.pau@citrix.com>
 <20180508092547.7017-1-roger.pau@citrix.com>
 <5AF9813102000078001C2792@prv1-mh.provo.novell.com>
 <20180514142745.giejgb3sdnnw3nbh@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=r2k+=ib=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fIEwu-0006bp-BP
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 14:59:40 +0000
In-Reply-To: <20180514142745.giejgb3sdnnw3nbh@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjA1LjE4IGF0IDE2OjI3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgTWF5IDE0LCAyMDE4IGF0IDA2OjI5OjM3QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDguMDUuMTggYXQgMTE6MjUsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXNpLmMKPj4gPiArKysgYi94ZW4v
YXJjaC94ODYvaHZtL3Ztc2kuYwo+PiA+IEBAIC02OTksNiArNjk5LDI5IEBAIHN0YXRpYyBpbnQg
dnBjaV9tc2lfdXBkYXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1aW50MzJfdCBkYXRh
LAo+PiA+ICAgICAgcmV0dXJuIDA7Cj4+ID4gIH0KPj4gPiAgCj4+ID4gK2ludCB2cGNpX21zaV9h
cmNoX3VwZGF0ZShzdHJ1Y3QgdnBjaV9tc2kgKm1zaSwgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBk
ZXYpCj4+ID4gK3sKPj4gPiArICAgIGludCByYzsKPj4gPiArCj4+ID4gKyAgICBBU1NFUlQobXNp
LT5hcmNoLnBpcnEgIT0gSU5WQUxJRF9QSVJRKTsKPj4gPiArCj4+ID4gKyAgICBwY2lkZXZzX2xv
Y2soKTsKPj4gPiArICAgIHJjID0gdnBjaV9tc2lfdXBkYXRlKHBkZXYsIG1zaS0+ZGF0YSwgbXNp
LT5hZGRyZXNzLCBtc2ktPnZlY3RvcnMsCj4+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICBt
c2ktPmFyY2gucGlycSwgbXNpLT5tYXNrKTsKPj4gPiArICAgIGlmICggcmMgKQo+PiA+ICsgICAg
ewo+PiA+ICsgICAgICAgIHNwaW5fbG9jaygmcGRldi0+ZG9tYWluLT5ldmVudF9sb2NrKTsKPj4g
PiArICAgICAgICB1bm1hcF9kb21haW5fcGlycShwZGV2LT5kb21haW4sIG1zaS0+YXJjaC5waXJx
KTsKPj4gCj4+IFRoaXMgbG9va3MgcXVpdGUgdW5kZXNpcmFibGUgLSBhIGZhaWxlZCB1cGRhdGUg
c2hvdWxkIGxlYXZlIHRoZSBpbnRlcnJ1cHQgaW4gaXRzCj4+IHByaW9yIHN0YXRlIHJhdGhlciB0
aGFuIHVuYmluZGluZyBpdC4gSXMgdGhhdCBvdmVybHkgZGlmZmljdWx0IHRvIGFjaGlldmU/Cj4g
Cj4gT2gsIFRCSCBJIHdvdWxkIGV4cGVjdCB0aGF0IHdyaXRpbmcgYW4gaW52YWxpZCBkYXRhIG9y
IGFkZHJlc3MgZmllbGRzCj4gd2lsbCBkaXNhYmxlIE1TSSBpbnN0ZWFkIG9mIGtlZXAgdXNpbmcg
dGhlIG9sZCB2YWx1ZXMuIEknbSBub3Qgc3VyZSBJCj4gc2VlIHRoZSByZWFzb24gdG8ga2VlcCB1
c2luZyB0aGUgb2xkIHZhbHVlcywgY2VydGFpbmx5IHRoYXQgY291bGQgbWFrZQo+IHNvbWV0aGlu
ZyBlbHNlIGdvIHZlcnkgd29ua3kgaW5zaWRlIG9mIHRoZSBndWVzdCBpdHNlbGYuCgpZZWFoLCB0
cnVlLCBuZWl0aGVyIGlzIHByb3BlciBiZWhhdmlvciBjb21wYXJpbmcgdG8gYSBzaW1wbGUgY29u
ZmlnIHNwYWNlCndyaXRlICh3aGljaCBjYW4ndCByZWFsbHkgZmFpbCkuIENyYXNoaW5nIHRoZSBn
dWVzdCBtYXkgYmUgYSBtb3JlIGFwcHJvcHJpYXRlCmFjdGlvbiBoZXJlIHRoZW4uIEJ1dCB3aXRo
IHdoYXQgeW91IHNheSBJJ2QgYWxzbyBiZSBmaW5lIGlmIHlvdSBrZXB0IGl0IGFzIGlzLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
