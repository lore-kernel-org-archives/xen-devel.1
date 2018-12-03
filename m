From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] iommu: elide flushing for higher order
 map/unmap operations
Date: Mon, 03 Dec 2018 03:21:12 -0700
Message-ID: <5C05039802000078002021AE@prv1-mh.provo.novell.com>
References: <20181130104518.39981-1-paul.durrant@citrix.com>
 <20181130104518.39981-3-paul.durrant@citrix.com>
 <71db9ae1-ce10-be1e-ea16-3adeaf49927f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=czp0=om=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gTlNl-00045D-Gc
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 10:23:17 +0000
In-Reply-To: <71db9ae1-ce10-be1e-ea16-3adeaf49927f@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjExLjE4IGF0IDEzOjQ5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzAvMTEvMjAxOCAxMDo0NSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiArZW51bSBp
b21tdV9mbHVzaF90eXBlCj4+ICt7Cj4+ICsgICAgSU9NTVVfRkxVU0hfbm9uZSwgLyogbm8gZmx1
c2ggcmVxdWlyZWQgKi8KPj4gKyAgICBJT01NVV9GTFVTSF9hZGRlZCwgLyogbm8gbW9kaWZpZWQg
ZW50cmllcywganVzdCBhZGRpdGlvbmFsIGVudHJpZXMgKi8KPiAKPiBJT01NVV9GTFVTSF9pbnZh
bGlkID8gIEkgdGhpbmsgaXQgaXMgbW9yZSBkZXNjcmlwdGl2ZSBvZiB0aGUgc2NlbmFyaW8gaW4K
PiB3aGljaCBpdCBpcyB1c2VkLgoKVGhpcyByZWFkcyBpbiBhIHByZXR0eSBtaXNsZWFkaW5nIHdh
eSB0byBtZS4gSU9NTVVfRkxVU0hfbmV3Cm9yIElPTU1VX0ZMVVNIX25ld19lbnRzIHBlcmhhcHM/
IE90b2ggSSB3YXMgcXVpdGUgb2theSB3aXRoCnRoZSBuYW1lIFBhdWwgaGFkIGNob3Nlbi4KCj4+
IEBAIC0xNzcsNyArMTg0LDggQEAgc3RydWN0IGlvbW11X29wcyB7Cj4+ICAgICAgICogb3RoZXIg
YnkgdGhlIGNhbGxlciBpbiBvcmRlciB0byBoYXZlIG1lYW5pbmdmdWwgcmVzdWx0cy4KPj4gICAg
ICAgKi8KPj4gICAgICBpbnQgX19tdXN0X2NoZWNrICgqbWFwX3BhZ2UpKHN0cnVjdCBkb21haW4g
KmQsIGRmbl90IGRmbiwgbWZuX3QgbWZuLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IGZsYWdzKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBmbGFncywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGVudW0gaW9tbXVfZmx1c2hfdHlwZSAqZmx1c2hfdHlwZSk7Cj4gCj4gTWFpbnRhaW5p
bmcgdGhlIGZsdXNoIHR5cGUgYnkgcG9pbnRlciBpcyBxdWl0ZSBhd2t3YXJkLgo+IAo+IEhvdyBh
Ym91dCBmb2xkaW5nIGEgcG9zaXRpdmUgZmx1c2ggdHlwZSBpbiB3aXRoIG5lZ2F0aXZlIGVycm9y
cz8gIGkuZS4KPiBtYXBfcGFnZSgpIGJlY29tZXMgPCAwIG9uIGVycm9yLCAwIGZvciBzdWNjZXNz
L25vIGZsdXNoIGFuZCA+MCBmb3IKPiBzdWNjZXNzL3cgZmx1c2guCj4gCj4gSSB0aGluayB0aGUg
cmVzdWx0IHdvdWxkIGJlIHJhdGhlciBjbGVhbmVyIHRvIHJlYWQuCgpJdCB3b3VsZCwgYnV0IG1h
cHBpbmcgb3BlcmF0aW9ucyB3aXRoIGhpZ2hlciBvcmRlcnMgbWF5IGZhaWwKX2FuZF8gcmVxdWly
ZSBmbHVzaGluZy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
