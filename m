From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 5/9] viridian: separate interrupt related
 enlightenment implementations...
Date: Mon, 05 Nov 2018 05:51:12 -0700
Message-ID: <5BE03CC002000078001F7FE7@prv1-mh.provo.novell.com>
References: <20181031124335.23867-1-paul.durrant@citrix.com>
 <20181031124335.23867-6-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=5iqt=nq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gJeLg-00030y-Gz
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 12:51:20 +0000
In-Reply-To: <20181031124335.23867-6-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjEwLjE4IGF0IDEzOjQzLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC0tLSAvZGV2L251bGwKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3N5bmlj
LmMKPiBAQCAtMCwwICsxLDIyNSBAQAo+ICsvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiAqCj4gKyAqIHN5
bmljLmMKPiArICoKPiArICogQW4gaW1wbGVtZW50YXRpb24gb2Ygc29tZSBpbnRlcnJ1cHQgcmVs
YXRlZCBWaXJpZGlhbiBlbmxpZ2h0ZW5tZW50cy4KPiArICogU2VlIE1pY3Jvc29mdCdzIEh5cGVy
dmlzb3IgVG9wIExldmVsIEZ1bmN0aW9uYWwgU3BlY2lmaWNhdGlvbi4KPiArICogZm9yIG1vcmUg
aW5mb3JtYXRpb24uCj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgPHhlbi9kb21haW5fcGFnZS5oPgo+
ICsjaW5jbHVkZSA8eGVuL2h5cGVyY2FsbC5oPgo+ICsjaW5jbHVkZSA8eGVuL3NjaGVkLmg+Cj4g
KyNpbmNsdWRlIDx4ZW4vdmVyc2lvbi5oPgo+ICsKPiArI2luY2x1ZGUgPGFzbS9hcGljLmg+Cj4g
KyNpbmNsdWRlIDxhc20vaHZtL3N1cHBvcnQuaD4KPiArCj4gK3N0YXRpYyB2b2lkIGR1bXBfdnBf
YXNzaXN0KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQoKV2l0aCB0aGUgbmFtZSBjaGFuZ2UgdG8gc3lu
aWMsIGlzIHRoZSBfdnBfIGluZml4IGhlcmUgYW5kIGluIGEgZmV3Cm90aGVyIHBsYWNlcyByZXRh
aW5lZCBpbnRlbnRpb25hbGx5PwoKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92aXJp
ZGlhbi5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmlyaWRpYW4uaAo+IEBAIC05
LDYgKzksNzQgQEAKPiAgI2lmbmRlZiBfX0FTTV9YODZfSFZNX1ZJUklESUFOX0hfXwo+ICAjZGVm
aW5lIF9fQVNNX1g4Nl9IVk1fVklSSURJQU5fSF9fCj4gIAo+ICsjaW5jbHVkZSA8YXNtL2h2bS9z
YXZlLmg+Cj4gKwo+ICsvKiBWaXJpZGlhbiBNU1IgbnVtYmVycy4gKi8KPiArI2RlZmluZSBIVl9Y
NjRfTVNSX0dVRVNUX09TX0lEICAgICAgICAgICAgICAgICAgIDB4NDAwMDAwMDAKCkFyZSB0aGVz
ZSBuZWVkZWQgb3V0c2lkZSBvZiB4ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuLyA/IElmIG5vdCwK
cGxlYXNlIGludHJvZHVjZSBhIGxvY2FsIGhlYWRlciB0aGVyZSByYXRoZXIgdGhhbiBwb2xsdXRp
bmcKZXZlcnkgQ1UncyBuYW1lIHNwYWNlLiBPdGhlciBkZWZpbml0aW9ucyBhbmQgZGVjbGFyYXRp
b24gbG9jYWwKdG8gdGhlIFZpcmlkaWFuIGltcGxlbWVudGF0aW9uIHNob3VsZCB0aGVuIGdvIHRo
ZXJlIHRvbywgcmF0aGVyCnRoYW4gaGVyZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
