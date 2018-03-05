From: Haozhong Zhang <haozhong.zhang@intel.com>
Subject: Re: [Qemu-devel] [RFC QEMU PATCH v4 03/10] hostmem-xen:
 add a host memory backend for Xen
Date: Mon, 5 Mar 2018 15:53:28 +0800
Message-ID: <20180305075328.6i77el735gnqf3gt__5222.27920960194$1520236352$gmane$org@hz-desktop>
References: <20171207101812.23602-1-haozhong.zhang@intel.com>
 <20171207101812.23602-4-haozhong.zhang@intel.com>
 <20180227164147.GB1799@perard.uk.xensource.com>
 <20180228075654.gv22h2zd73peuyxm@hz-desktop>
 <20180302115009.GF1799@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xzyw=f3=intel.com=haozhong.zhang@srs-us1.protection.inumbo.net>)
 id 1eskwG-0003lz-Gm
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 07:53:40 +0000
Content-Disposition: inline
In-Reply-To: <20180302115009.GF1799@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>, Chao Peng <chao.p.peng@linux.intel.com>, xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDIvMTggMTE6NTAgKzAwMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIFdlZCwg
RmViIDI4LCAyMDE4IGF0IDAzOjU2OjU0UE0gKzA4MDAsIEhhb3pob25nIFpoYW5nIHdyb3RlOgo+
ID4gT24gMDIvMjcvMTggMTY6NDEgKzAwMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiBP
biBUaHUsIERlYyAwNywgMjAxNyBhdCAwNjoxODowNVBNICswODAwLCBIYW96aG9uZyBaaGFuZyB3
cm90ZToKPiA+ID4gPiBAQCAtMTA4LDcgKzEwOSwxMCBAQCB2b2lkIHBjX2RpbW1fbWVtb3J5X3Bs
dWcoRGV2aWNlU3RhdGUgKmRldiwgTWVtb3J5SG90cGx1Z1N0YXRlICpocG1zLAo+ID4gPiA+ICAg
ICAgfQo+ID4gPiA+ICAKPiA+ID4gPiAgICAgIG1lbW9yeV9yZWdpb25fYWRkX3N1YnJlZ2lvbigm
aHBtcy0+bXIsIGFkZHIgLSBocG1zLT5iYXNlLCBtcik7Cj4gPiA+ID4gLSAgICB2bXN0YXRlX3Jl
Z2lzdGVyX3JhbSh2bXN0YXRlX21yLCBkZXYpOwo+ID4gPiA+ICsgICAgLyogbWVtb3J5LWJhY2tl
bmQteGVuIGlzIG5vdCBiYWNrZWQgYnkgUkFNLiAqLwo+ID4gPiA+ICsgICAgaWYgKCF4ZW5fZW5h
YmxlZCgpKSB7Cj4gPiA+IAo+ID4gPiBJcyBpdCBwb3NzaWJsZSB0byBoYXZlIHRoZSBzYW1lIGNv
bmRpdGlvbiBhcyB0aGUgb25lIHVzZWQgaW4KPiA+ID4gaG9zdF9tZW1vcnlfYmFja2VuZF9tZW1v
cnlfY29tcGxldGU/IGkuZS4gYmFzZSBvbiB3aGV0aGVyIHRoZSBtZW1vcnkKPiA+ID4gcmVnaW9u
IGlzIG1hcHBlZCBvciBub3QgKGJhY2tlbmQtPm1yLnJhbV9ibG9jaykuCj4gPiAKPiA+IExpa2Ug
ImlmICgheGVuX2VuYWJsZWQoKSB8fCBiYWNrZW5kLT5tci5yYW1fYmxvY2spKSI/IE5vLCBpdCB3
aWxsIG11dGUKPiA+IHRoZSBhYm9ydGlvbiAodm1zdGF0ZV9yZWdpc3Rlcl9yYW0gLS0+IHFlbXVf
cmFtX3NldF9pZHN0ciApIGNhdXNlZCBieQo+ID4gdGhlIGNhc2UgdGhhdCAhYmFja2VuZC0+bXIu
cmFtX2Jsb2NrIGluIHRoZSBub24teGVuIGVudmlyb25tZW50Lgo+IAo+IEluIG5vbi14ZW4gZW52
aXJvbm1lbnQsIHZtc3RhdGVfcmVnaXN0ZXJfcmFtKCkgd2lsbCBiZSBjYWxsZWQsIGJlY2F1c2UK
PiAheGVuX2VuYWJsZWQoKSBpcyB0cnVlLCBpdCB3b3VsZCBub3QgbWF0dGVyIGlmIHRoZXJlIGlz
IGEgcmFtX2Jsb2NrIG9yCj4gbm90LgoKU29ycnksIEkgcmVhbGx5IG1lYW50ICdpZiAoYmFja2Vu
ZC0+bXIucmFtX2Jsb2NrKScsIHdoaWNoIG1heSBtdXRlIHRoZQphYm9ydGlvbiBpbiBub24teGVu
IGVudmlyb25tZW50LiAnaWYgKCF4ZW5fZW5hYmxlZCgpKScga2VlcHMgdGhlCm9yaWdpbmFsIHNl
bWFudGljcyBpbiBub24teGVuIGVudmlyb25tZW50LCBzbyBpdCdzIHVubGlrZWx5IHRvIGJyZWFr
CnRoZSBub24teGVuIHVzYWdlLgoKSGFvemhvbmcKCj4gCj4gQnV0IGlmIHRoZXJlIGlzIGEgbWVt
b3J5LWJhY2tlbmQgdGhhdCBjYW4gcnVuIGluIGEgeGVuIGVudmlyb25tZW50IHRoYXQKPiBoYXZl
IGEgcmFtX2Jsb2NrLCB2bXN0YXRlX3JlZ2lzdGVyX3JhbSB3b3VsZCBub3QgYmUgY2FsbGVkIGlu
IHRoZQo+IG9yaWdpYWwgcGF0Y2gsIGJ1dCBpZiB3ZSB1c2UgKCF4ZW5fZW5hYmxlZCgpIHx8IHZt
c3RhdGVfbXItPnJhbV9ibG9jaykKPiBhcyBjb25kaXRpb24gdGhlbiB2bXN0YXRlX3JlZ2lzdGVy
X3JhbSB3aWxsIGJlIGNhbGxlZC4KPiAKPiBJcyB0aGlzIG1ha2Ugc2Vuc2U/Cj4gCj4gPiA+ID4g
KyAgICAgICAgdm1zdGF0ZV9yZWdpc3Rlcl9yYW0odm1zdGF0ZV9tciwgZGV2KTsKPiA+ID4gPiAr
ICAgIH0KPiA+ID4gPiAgICAgIG51bWFfc2V0X21lbV9ub2RlX2lkKGFkZHIsIG1lbW9yeV9yZWdp
b25fc2l6ZShtciksIGRpbW0tPm5vZGUpOwo+ID4gPiA+ICAKPiA+ID4gPiAgb3V0Ogo+IAo+IC0t
IAo+IEFudGhvbnkgUEVSQVJECj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
