From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] VT-d: reconcile iommu_inclusive_mapping
 and iommu=dom0-strict
Date: Mon, 11 Jun 2018 06:41:10 -0600
Message-ID: <5B1E6DE602000078001CA04B@prv1-mh.provo.novell.com>
References: <20180608153030.3227-1-paul.durrant@citrix.com>
 <20180608153030.3227-3-paul.durrant@citrix.com>
 <20180611102541.b2mahbw2mfqmdmbq@mac>
 <fc498cd9d0994ca083285fbd80d5067f@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hpdw=i5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fSM8K-0003es-3f
 for xen-devel@lists.xenproject.org; Mon, 11 Jun 2018 12:41:16 +0000
In-Reply-To: <fc498cd9d0994ca083285fbd80d5067f@AMSPEX02CL03.citrite.net>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA2LjE4IGF0IDEyOjMxLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUKPj4gU2VudDogMTEgSnVuZSAyMDE4IDExOjI2Cj4+
IE9uIEZyaSwgSnVuIDA4LCAyMDE4IGF0IDA0OjMwOjMwUE0gKzAxMDAsIFBhdWwgRHVycmFudCB3
cm90ZToKPj4gPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4+ID4gKysr
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+PiA+IEBAIC01Miw3ICs1Miw3IEBA
IGN1c3RvbV9wYXJhbSgiaW9tbXUiLCBwYXJzZV9pb21tdV9wYXJhbSk7Cj4+ID4gIGJvb2xfdCBf
X2luaXRkYXRhIGlvbW11X2VuYWJsZSA9IDE7Cj4+ID4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlv
bW11X2VuYWJsZWQ7Cj4+ID4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGZvcmNlX2lvbW11Owo+PiA+
IC1ib29sX3QgX19od2RvbV9pbml0ZGF0YSBpb21tdV9kb20wX3N0cmljdDsKPj4gPiArYm9vbF90
IF9fcmVhZF9tb3N0bHkgaW9tbXVfZG9tMF9zdHJpY3Q7Cj4+IAo+PiBJJ20gbm90IHN1cmUgd2h5
IHlvdSBuZWVkIHRvIGNoYW5nZSB0aGUgYXR0cmlidXRlcyBvZgo+PiBpb21tdV9kb20wX3N0cmlj
dCwgQUZBSUNUIGl0J3Mgc3RpbGwgb25seSB1c2VkIGluIGh3ZG9tX2luaXQgKG9yIGluaXQpCj4+
IGZ1bmN0aW9ucz8KPj4gCj4gCj4gVGhhdCdzIHRydWUgYXQgdGhpcyBwb2ludC4gSSBwbGFuIHRv
IGNoYW5nZSBpdCBhcyBwYXJ0IG9mIFBWLUlPTU1VLiBUQkggCj4gdGhvdWdoIEkgcHJlZmVyIHRo
ZSBjb25zaXN0ZW5jeSBidXQgSSBjYW4gZHJvcCB0aGUgY2hhbmdlIGlmIHRoZXJlIGFyZSBhbnkg
Cj4gbWFqb3Igb2JqZWN0aW9ucy4KClllcywgcGxlYXNlIGNoYW5nZSBpdCBvbmx5IGF0IHRoZSBw
b2ludCBpdCBuZWVkcyBjaGFuZ2luZy4KCkphbgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
