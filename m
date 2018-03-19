From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 6/7] x86: add iommu_op to query reserved
	ranges
Date: Mon, 19 Mar 2018 09:13:34 -0600
Message-ID: <5AAFE1AE02000078001B384D@prv-mh.provo.novell.com>
References: <20180212104714.1922-1-paul.durrant@citrix.com>
 <20180212104714.1922-7-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=eu9s=gj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1exwTp-0003IB-8o
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 15:13:45 +0000
In-Reply-To: <20180212104714.1922-7-paul.durrant@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjAyLjE4IGF0IDExOjQ3LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pb21tdV9vcC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2lv
bW11X29wLmMKPiBAQCAtMjIsNiArMjIsNTggQEAKPiAgI2luY2x1ZGUgPHhlbi9ldmVudC5oPgo+
ICAjaW5jbHVkZSA8eGVuL2d1ZXN0X2FjY2Vzcy5oPgo+ICAjaW5jbHVkZSA8eGVuL2h5cGVyY2Fs
bC5oPgo+ICsjaW5jbHVkZSA8eGVuL2lvbW11Lmg+Cj4gKwo+ICtzdHJ1Y3QgZ2V0X3JkbV9jdHh0
IHsKPiArICAgIHVuc2lnbmVkIGludCBtYXhfZW50cmllczsKPiArICAgIHVuc2lnbmVkIGludCBu
cl9lbnRyaWVzOwo+ICsgICAgWEVOX0dVRVNUX0hBTkRMRSh4ZW5faW9tbXVfcmVzZXJ2ZWRfcmVn
aW9uX3QpIHJlZ2lvbnM7Cj4gK307Cj4gKwo+ICtzdGF0aWMgaW50IGdldF9yZG0oeGVuX3Bmbl90
IHN0YXJ0LCB4ZW5fdWxvbmdfdCBuciwgdTMyIGlkLCB2b2lkICphcmcpCj4gK3sKPiArICAgIHN0
cnVjdCBnZXRfcmRtX2N0eHQgKmN0eHQgPSBhcmc7Cj4gKwo+ICsgICAgaWYgKCBjdHh0LT5ucl9l
bnRyaWVzIDwgY3R4dC0+bWF4X2VudHJpZXMgKQo+ICsgICAgewo+ICsgICAgICAgIHhlbl9pb21t
dV9yZXNlcnZlZF9yZWdpb25fdCByZWdpb24gPSB7Cj4gKyAgICAgICAgICAgIC5zdGFydF9iZm4g
PSBzdGFydCwKPiArICAgICAgICAgICAgLm5yX2ZyYW1lcyA9IG5yLAo+ICsgICAgICAgIH07Cj4g
Kwo+ICsgICAgICAgIGlmICggY29weV90b19ndWVzdF9vZmZzZXQoY3R4dC0+cmVnaW9ucywgY3R4
dC0+bnJfZW50cmllcywgJnJlZ2lvbiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDEpICkKPiArICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4gKyAgICB9Cj4gKwo+ICsg
ICAgY3R4dC0+bnJfZW50cmllcysrOwo+ICsKPiArICAgIHJldHVybiAxOwo+ICt9Cj4gKwo+ICtz
dGF0aWMgaW50IGlvbW11b3BfcXVlcnlfcmVzZXJ2ZWQoc3RydWN0IHhlbl9pb21tdV9vcF9xdWVy
eV9yZXNlcnZlZCAqb3ApCj4gK3sKPiArICAgIHN0cnVjdCBnZXRfcmRtX2N0eHQgY3R4dCA9IHsK
PiArICAgICAgICAubWF4X2VudHJpZXMgPSBvcC0+bnJfZW50cmllcywKPiArICAgICAgICAucmVn
aW9ucyA9IG9wLT5yZWdpb25zLAo+ICsgICAgfTsKPiArICAgIGludCByYzsKPiArCj4gKyAgICBp
ZiAob3AtPnBhZCAhPSAwKQo+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiArICAgIHJj
ID0gaW9tbXVfZ2V0X3Jlc2VydmVkX2RldmljZV9tZW1vcnkoZ2V0X3JkbSwgJmN0eHQpOwo+ICsg
ICAgaWYgKCByYyApCj4gKyAgICAgICAgcmV0dXJuIHJjOwo+ICsKPiArICAgIC8qIFBhc3MgYmFj
ayB0aGUgYWN0dWFsIG51bWJlciBvZiByZXNlcnZlZCByZWdpb25zICovCj4gKyAgICBvcC0+bnJf
ZW50cmllcyA9IGN0eHQubnJfZW50cmllczsKPiArCj4gKyAgICBpZiAoIGN0eHQubnJfZW50cmll
cyA+IGN0eHQubWF4X2VudHJpZXMgKQo+ICsgICAgICAgIHJldHVybiAtRU5PQlVGUzsKPiArCj4g
KyAgICByZXR1cm4gMDsKPiArfQoKT25lIG1vcmUgbm90ZSBoZXJlOiBBcyBpdCBsb29rcyB3ZSBj
YW4gb25seSBob3BlIHRoZXJlIHdvbid0IGJlCnRvbyBtYW55IFJNUlJzLCBhcyB0aGUgbnVtYmVy
IG9mIGVudHJpZXMgdGhhdCBjYW4gYmUgcmVxdWVzdGVkCmhlcmUgaXMgYmFzaWNhbGx5IHVuYm91
bmRlZC4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
