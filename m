From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/4] iommu: rename wrapper functions
Date: Thu, 6 Dec 2018 15:00:58 +0000
Message-ID: <18e22c25-9696-d264-8952-292aacc365ca@citrix.com>
References: <20181205112924.36470-1-paul.durrant@citrix.com>
 <20181205112924.36470-3-paul.durrant@citrix.com>
 <5C0935C30200007800203B69@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yzrh=op=citrix.com=prvs=871b93375=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gUvEy-0003rU-7m
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 15:07:00 +0000
In-Reply-To: <5C0935C30200007800203B69@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMjAxOCAxNDo0NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDUuMTIuMTgg
YXQgMTI6MjksIDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IEEgc3Vic2VxdWVu
dCBwYXRjaCB3aWxsIGFkZCBzZW1hbnRpY2FsbHkgZGlmZmVyZW50IHZlcnNpb25zIG9mCj4+IGlv
bW11X21hcC91bm1hcCgpIHNvLCBpbiBhZHZhbmNlIG9mIHRoYXQgY2hhbmdlLCB0aGlzIHBhdGNo
IHJlbmFtZXMgdGhlCj4+IGV4aXN0aW5nIGZ1bmN0aW9ucyB0byBpb21tdV9sZWdhY3lfbWFwL3Vu
bWFwKCkgYW5kIG1vZGlmaWVzIGFsbCBjYWxsLXNpdGVzLgo+PiBJdCBhbHNvIGFkanVzdHMgYSBj
b21tZW50IHRoYXQgcmVmZXJzIHRvIGlvbW11X21hcF9wYWdlKCksIHdoaWNoIHdhcyByZS0KPj4g
bmFtZWQgYnkgYSBwcmV2aW91cyBwYXRjaC4KPj4KPj4gVGhpcyBwYXRjaCBpcyBwdXJlbHkgY29z
bWV0aWMuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1
cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4KPiBJIGhhdmUgdG8gYWRtaXQgdGhhdCBJJ20gdW5kZWNpZGVk
IHdoZXRoZXIgdG8gYXNrIHRoYXQgdGhpcyBiZQo+IGNvbW1pdHRlZCBpbiB0aGUgc2FtZSBkZXZl
bG9wbWVudCB3aW5kb3cgd2hlcmUgYWxsIHRoZQo+ICJsZWdhY3kiIGluZml4ZXMgd291bGQgZ28g
YXdheSBhZ2FpbiwgaS5lLiBwcmVzdW1hYmx5IG9ubHkKPiBhZnRlciA0LjEyIG5vdy4KClRoZSBs
ZWdhY3kgaW5maXhlcyB3b250IGRpc2FwcGVhciB3aXRob3V0IGEgc3Vic3RhbnRpYWwgcXVhbnRp
dHkgb2YKY2xlYW51cCBhbmQgZml4aW5nIGluIHRoZSBQMk0gY29kZS4KClRoZSBQMk0gYW5kIElP
TU1VIGNvZGUgaXMgaW4gbXVjaCB0b28gYmlnIG9mIGEgbWVzcyB0byBiZSBjbGVhbmVkIHVwIGlu
Cm9uZSByZWxlYXNlIHJlbGVhc2UgY3ljbGUuwqAgSSBzcGVjaWZpY2FsbHkgc3VnZ2VzdGVkIHRo
ZSBsZWdhY3kgaW5maXggc28Kd2UgY2FuIGdldCB0aGUgbmV3IHByb3BlciBBUElzIGluIHBsYWNl
IGFuZCBzdGFydGluZyB0byBiZSB1c2VkLCB3aGlsZQplbnN1cmluZyB0aGF0IHdlIHdvbid0IGdh
aW4gbmV3IHVzZXJzIG9mIHRoZSBvbGQgaW50ZXJmYWNlcy4KCn5BbmRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
