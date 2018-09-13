From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 5/7] memory: add
 check_get_page_from_gfn() as a wrapper...
Date: Thu, 13 Sep 2018 07:22:57 -0600
Message-ID: <5B9A64B102000078001E83C8@prv1-mh.provo.novell.com>
References: <20180913103153.33377-1-paul.durrant@citrix.com>
 <20180913103153.33377-6-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jl0+=l3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g0RaI-0005jM-Sq
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 13:23:02 +0000
In-Reply-To: <20180913103153.33377-6-paul.durrant@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA5LjE4IGF0IDEyOjMxLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jCj4gKysrIGIveGVuL2FyY2gveDg2
L2h2bS9lbXVsYXRlLmMKPiBAQCAtMzUzLDMzICszNTMsMjAgQEAgc3RhdGljIGludCBodm1lbXVs
X2RvX2lvX2J1ZmZlcigKPiAgCj4gIHN0YXRpYyBpbnQgaHZtZW11bF9hY3F1aXJlX3BhZ2UodW5z
aWduZWQgbG9uZyBnbWZuLCBzdHJ1Y3QgcGFnZV9pbmZvICoqcGFnZSkKPiAgewo+IC0gICAgc3Ry
dWN0IGRvbWFpbiAqY3Vycl9kID0gY3VycmVudC0+ZG9tYWluOwo+IC0gICAgcDJtX3R5cGVfdCBw
Mm10Owo+IC0KPiAtICAgICpwYWdlID0gZ2V0X3BhZ2VfZnJvbV9nZm4oY3Vycl9kLCBnbWZuLCAm
cDJtdCwgUDJNX1VOU0hBUkUpOwo+IC0KPiAtICAgIGlmICggKnBhZ2UgPT0gTlVMTCApCj4gLSAg
ICAgICAgcmV0dXJuIFg4NkVNVUxfVU5IQU5ETEVBQkxFOwo+IC0KPiAtICAgIGlmICggcDJtX2lz
X3BhZ2luZyhwMm10KSApCj4gKyAgICBzd2l0Y2ggKCBjaGVja19nZXRfcGFnZV9mcm9tX2dmbihj
dXJyZW50LT5kb21haW4sIF9nZm4oZ21mbiksIGZhbHNlLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgTlVMTCwgcGFnZSkgKQo+ICAgICAgewo+IC0gICAgICAgIHB1dF9w
YWdlKCpwYWdlKTsKPiAtICAgICAgICBwMm1fbWVtX3BhZ2luZ19wb3B1bGF0ZShjdXJyX2QsIGdt
Zm4pOwo+IC0gICAgICAgIHJldHVybiBYODZFTVVMX1JFVFJZOwo+IC0gICAgfQo+ICsgICAgY2Fz
ZSAwOgo+ICsgICAgICAgIGJyZWFrOwo+ICAKPiAtICAgIGlmICggcDJtX2lzX3NoYXJlZChwMm10
KSApCj4gLSAgICB7Cj4gLSAgICAgICAgcHV0X3BhZ2UoKnBhZ2UpOwo+ICsgICAgY2FzZSAtRUFH
QUlOOgo+ICAgICAgICAgIHJldHVybiBYODZFTVVMX1JFVFJZOwo+IC0gICAgfQo+ICAKPiAtICAg
IC8qIFRoaXMgY29kZSBzaG91bGQgbm90IGJlIHJlYWNoZWQgaWYgdGhlIGdtZm4gaXMgbm90IFJB
TSAqLwo+IC0gICAgaWYgKCBwMm1faXNfbW1pbyhwMm10KSApCgpUaGlzIGdldHMgcmVwbGFjZWQg
YnkgCgogICAgaWYgKCAhcDJtX2lzX3JhbShwMm10KSB8fCAoIXJlYWRvbmx5ICYmIHAybV9pc19y
ZWFkb25seShwMm10KSkgKQoKaW4gdGhlIGZ1bmN0aW9uLCB3aGljaCBJJ20gYWZyYWlkIGRvZXMg
bm90IGZ1bGZpbGwgdGhlIGNsYWltIG9mCiJ0aGUgZGVzaXJlZCBzZW1hbnRpYyBpcyB0aGUgc2Ft
ZSIsIHNpbmNlIHRoZXJlIGFyZSAob3IgYXQgdGhlCnZlcnkgbGVhc3QgY291bGQgYmUsIHlldCB5
b3UgYWxzbyBkb24ndCB3YW50IHRvIGludHJvZHVjZQpsYXRlbnQgYnVncykgdHlwZXMgd2hpY2gg
ZmFsbCBpbnRvIG5laXRoZXIgY2F0ZWdvcnkuIFdvdWxkIGl0CnBlcmhhcHMgbWFrZSBzZW5zZSB0
byBkZWZlciBwMm10IGNoZWNrcyBiZXlvbmQKcGFnaW5nL3NoYXJlZCB0byB0aGUgY2FsbGVyIHdo
ZW4gcGFzc2luZyBhIHJlc3BlY3RpdmUKbm9uLU5VTEwgcG9pbnRlciBpbnRvIHRoZSBmdW5jdGlv
bj8gVGhpcyBpcyB0aGUgbW9yZSB0aGF0LCBhcwppcyBsb29rcywgdGhpcyAib25seSBhbG1vc3Qg
dGhlIHNhbWUiIGFwcGxpZXMgdG8gYWxsIG9mIHRoZQppbnN0YW5jZXMgeW91IHJlcGxhY2UsIHdo
aWNoIG1ha2VzIG1lIGV2ZW4gd29uZGVyIHdoZXRoZXIKdGhlIHAybXQgcG9pbnRlciBtaWdodCBu
ZWVkIHRvIGJlIG1hbmRhdG9yeSB0byBiZSBwYXNzZWQgaW4uCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
