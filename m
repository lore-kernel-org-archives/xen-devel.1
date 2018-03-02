From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 14/16] xen/grant: Switch
 common/grant_table.c to use typesafe MFN
Date: Fri, 02 Mar 2018 09:12:34 -0700
Message-ID: <5A99860202000078001ADF3B@prv-mh.provo.novell.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-15-julien.grall@arm.com>
 <5A9981C102000078001ADEDA@prv-mh.provo.novell.com>
 <3345768a-a6be-812e-fb74-4f2e57665486@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <3345768a-a6be-812e-fb74-4f2e57665486@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjAzLjE4IGF0IDE2OjU5LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDAyLzAzLzE4IDE1OjU0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjEuMDIuMTgg
YXQgMTU6MDIsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+PiBAQCAtODcyLDcgKzg3
OSw3IEBAIG1hcF9ncmFudF9yZWYoCj4+PiAgICAgICBzdHJ1Y3QgZ3JhbnRfdGFibGUgKmxndCwg
KnJndDsKPj4+ICAgICAgIHN0cnVjdCB2Y3B1ICAgKmxlZDsKPj4+ICAgICAgIGdyYW50X2hhbmRs
ZV90IGhhbmRsZTsKPj4+IC0gICAgdW5zaWduZWQgbG9uZyAgZnJhbWUgPSAwOwo+Pj4gKyAgICBt
Zm5fdCBmcmFtZSA9IF9tZm4oMCk7Cj4+IAo+PiBJZiB0aGUgaW5pdGlhbGl6ZXIgaXMgbmVlZGVk
IGF0IGFsbCwgSSB0aGluayBpdCBzaG91bGQgYWdhaW4gYmVjb21lCj4+IElOVkFMSURfTUZOLiBT
YW1lIGluIGEgZmV3IG90aGVyIHBsYWNlcy4KPiAKPiBJIGRpZG4ndCBzd2l0Y2ggdG8gSU5WQUxJ
RF9NRk4gYmVjYXVzZSBJIHdhc24ndCBzdXJlIGlmIHNvbWUgcGxhY2UgaW4gCj4gdGhlIGNvZGUg
d2hlcmUgcmVseWluZyBvbiAwLiBJZiB5b3UgdGhpbmsgaXQgaXMgZmluZSwgdGhlbiBJIGFtIG1v
cmUgCj4gdGhhbmsgaGFwcHkgdG8gc3dpdGNoIHRvIElOVkFMSURfTUZOLgoKV2VsbCwgYXMgc2Fp
ZCAtIGl0IGxvb2tzIGFzIGlmIHRoZSBpbml0aWFsaXplciBpc24ndCBuZWVkZWQgYXQgYWxsLCBp
bgp3aGljaCBjYXNlIGl0J3MgdmFsdWUgcmVhbGx5IGlzIGEgZG9uJ3QgY2FyZS4KCkphbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
