From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] vpci/msi: fix update of bound MSI
 interrupts
Date: Mon, 14 May 2018 06:29:37 -0600
Message-ID: <5AF9813102000078001C2792@prv1-mh.provo.novell.com>
References: <20180508092359.6829-1-roger.pau@citrix.com>
 <20180508092547.7017-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=r2k+=ib=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fICbo-0002ZQ-Ho
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 12:29:44 +0000
In-Reply-To: <20180508092547.7017-1-roger.pau@citrix.com>
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

Pj4+IE9uIDA4LjA1LjE4IGF0IDExOjI1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm1zaS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92
bXNpLmMKPiBAQCAtNjk5LDYgKzY5OSwyOSBAQCBzdGF0aWMgaW50IHZwY2lfbXNpX3VwZGF0ZShj
b25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdWludDMyX3QgZGF0YSwKPiAgICAgIHJldHVybiAw
Owo+ICB9Cj4gIAo+ICtpbnQgdnBjaV9tc2lfYXJjaF91cGRhdGUoc3RydWN0IHZwY2lfbXNpICpt
c2ksIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+ICt7Cj4gKyAgICBpbnQgcmM7Cj4gKwo+
ICsgICAgQVNTRVJUKG1zaS0+YXJjaC5waXJxICE9IElOVkFMSURfUElSUSk7Cj4gKwo+ICsgICAg
cGNpZGV2c19sb2NrKCk7Cj4gKyAgICByYyA9IHZwY2lfbXNpX3VwZGF0ZShwZGV2LCBtc2ktPmRh
dGEsIG1zaS0+YWRkcmVzcywgbXNpLT52ZWN0b3JzLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgbXNpLT5hcmNoLnBpcnEsIG1zaS0+bWFzayk7Cj4gKyAgICBpZiAoIHJjICkKPiArICAgIHsK
PiArICAgICAgICBzcGluX2xvY2soJnBkZXYtPmRvbWFpbi0+ZXZlbnRfbG9jayk7Cj4gKyAgICAg
ICAgdW5tYXBfZG9tYWluX3BpcnEocGRldi0+ZG9tYWluLCBtc2ktPmFyY2gucGlycSk7CgpUaGlz
IGxvb2tzIHF1aXRlIHVuZGVzaXJhYmxlIC0gYSBmYWlsZWQgdXBkYXRlIHNob3VsZCBsZWF2ZSB0
aGUgaW50ZXJydXB0IGluIGl0cwpwcmlvciBzdGF0ZSByYXRoZXIgdGhhbiB1bmJpbmRpbmcgaXQu
IElzIHRoYXQgb3Zlcmx5IGRpZmZpY3VsdCB0byBhY2hpZXZlPyBBdCB0aGUKdmVyeSBsZWFzdCBm
b3Igc2luZ2xlLXZlY3Rvci1NU0kgaXQgbG9va3MgdG8gbWUgYXMgaWYgbm90aGluZyBuZWVkZWQg
ZG9pbmcgaGVyZQphdCBhbGwgdG8gaGF2ZSBqdXN0IHRoaXMgbmV0IGVmZmVjdC4gSWYgc28sIHRo
YXQgc3BlY2lhbCBjYXNlIGlzIHByb2JhYmx5CndvcnRod2hpbGUgdG8gaGF2ZSwgdG9nZXRoZXIg
d2l0aCBhIGNvbW1lbnQgb24gd2h5IHRoZSBzYW1lIGlzbid0CmZlYXNpYmxlIC8gZGVzaXJhYmxl
IGZvciB0aGUgbXVsdGkgdmVjdG9yIGNhc2UuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
