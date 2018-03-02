From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC QEMU PATCH v4 03/10] hostmem-xen: add a host
 memory backend for Xen
Date: Fri, 2 Mar 2018 11:50:09 +0000
Message-ID: <20180302115009.GF1799@perard.uk.xensource.com>
References: <20171207101812.23602-1-haozhong.zhang@intel.com>
 <20171207101812.23602-4-haozhong.zhang@intel.com>
 <20180227164147.GB1799@perard.uk.xensource.com>
 <20180228075654.gv22h2zd73peuyxm@hz-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=hmsr=fy=citrix.com=prvs=592ad6921=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1erjCW-0004ut-IX
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 11:50:12 +0000
Content-Disposition: inline
In-Reply-To: <20180228075654.gv22h2zd73peuyxm@hz-desktop>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Dan Williams <dan.j.williams@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjgsIDIwMTggYXQgMDM6NTY6NTRQTSArMDgwMCwgSGFvemhvbmcgWmhhbmcg
d3JvdGU6Cj4gT24gMDIvMjcvMTggMTY6NDEgKzAwMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+
ID4gT24gVGh1LCBEZWMgMDcsIDIwMTcgYXQgMDY6MTg6MDVQTSArMDgwMCwgSGFvemhvbmcgWmhh
bmcgd3JvdGU6Cj4gPiA+IEBAIC0xMDgsNyArMTA5LDEwIEBAIHZvaWQgcGNfZGltbV9tZW1vcnlf
cGx1ZyhEZXZpY2VTdGF0ZSAqZGV2LCBNZW1vcnlIb3RwbHVnU3RhdGUgKmhwbXMsCj4gPiA+ICAg
ICAgfQo+ID4gPiAgCj4gPiA+ICAgICAgbWVtb3J5X3JlZ2lvbl9hZGRfc3VicmVnaW9uKCZocG1z
LT5tciwgYWRkciAtIGhwbXMtPmJhc2UsIG1yKTsKPiA+ID4gLSAgICB2bXN0YXRlX3JlZ2lzdGVy
X3JhbSh2bXN0YXRlX21yLCBkZXYpOwo+ID4gPiArICAgIC8qIG1lbW9yeS1iYWNrZW5kLXhlbiBp
cyBub3QgYmFja2VkIGJ5IFJBTS4gKi8KPiA+ID4gKyAgICBpZiAoIXhlbl9lbmFibGVkKCkpIHsK
PiA+IAo+ID4gSXMgaXQgcG9zc2libGUgdG8gaGF2ZSB0aGUgc2FtZSBjb25kaXRpb24gYXMgdGhl
IG9uZSB1c2VkIGluCj4gPiBob3N0X21lbW9yeV9iYWNrZW5kX21lbW9yeV9jb21wbGV0ZT8gaS5l
LiBiYXNlIG9uIHdoZXRoZXIgdGhlIG1lbW9yeQo+ID4gcmVnaW9uIGlzIG1hcHBlZCBvciBub3Qg
KGJhY2tlbmQtPm1yLnJhbV9ibG9jaykuCj4gCj4gTGlrZSAiaWYgKCF4ZW5fZW5hYmxlZCgpIHx8
IGJhY2tlbmQtPm1yLnJhbV9ibG9jaykpIj8gTm8sIGl0IHdpbGwgbXV0ZQo+IHRoZSBhYm9ydGlv
biAodm1zdGF0ZV9yZWdpc3Rlcl9yYW0gLS0+IHFlbXVfcmFtX3NldF9pZHN0ciApIGNhdXNlZCBi
eQo+IHRoZSBjYXNlIHRoYXQgIWJhY2tlbmQtPm1yLnJhbV9ibG9jayBpbiB0aGUgbm9uLXhlbiBl
bnZpcm9ubWVudC4KCkluIG5vbi14ZW4gZW52aXJvbm1lbnQsIHZtc3RhdGVfcmVnaXN0ZXJfcmFt
KCkgd2lsbCBiZSBjYWxsZWQsIGJlY2F1c2UKIXhlbl9lbmFibGVkKCkgaXMgdHJ1ZSwgaXQgd291
bGQgbm90IG1hdHRlciBpZiB0aGVyZSBpcyBhIHJhbV9ibG9jayBvcgpub3QuCgpCdXQgaWYgdGhl
cmUgaXMgYSBtZW1vcnktYmFja2VuZCB0aGF0IGNhbiBydW4gaW4gYSB4ZW4gZW52aXJvbm1lbnQg
dGhhdApoYXZlIGEgcmFtX2Jsb2NrLCB2bXN0YXRlX3JlZ2lzdGVyX3JhbSB3b3VsZCBub3QgYmUg
Y2FsbGVkIGluIHRoZQpvcmlnaWFsIHBhdGNoLCBidXQgaWYgd2UgdXNlICgheGVuX2VuYWJsZWQo
KSB8fCB2bXN0YXRlX21yLT5yYW1fYmxvY2spCmFzIGNvbmRpdGlvbiB0aGVuIHZtc3RhdGVfcmVn
aXN0ZXJfcmFtIHdpbGwgYmUgY2FsbGVkLgoKSXMgdGhpcyBtYWtlIHNlbnNlPwoKPiA+ID4gKyAg
ICAgICAgdm1zdGF0ZV9yZWdpc3Rlcl9yYW0odm1zdGF0ZV9tciwgZGV2KTsKPiA+ID4gKyAgICB9
Cj4gPiA+ICAgICAgbnVtYV9zZXRfbWVtX25vZGVfaWQoYWRkciwgbWVtb3J5X3JlZ2lvbl9zaXpl
KG1yKSwgZGltbS0+bm9kZSk7Cj4gPiA+ICAKPiA+ID4gIG91dDoKCi0tIApBbnRob255IFBFUkFS
RAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
