From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/msr: Fix fallout from mostly c/s 832c180
Date: Thu, 11 Apr 2019 19:28:25 +0100
Message-ID: <642bdef3-dead-2306-2f2f-35108586ee7d@citrix.com>
References: <1554832427-30567-1-git-send-email-andrew.cooper3@citrix.com>
 <1554884886189.62867@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1554884886189.62867@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDQvMjAxOSAwOToyOCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IEFnYWluLCBkaWdnaW5n
IGJhY2sgaW4gbWFpbC4uLgo+Cj4gLS0tLS0KPiBbRnJvbSBKYW5dCj4+ICsgICAgY2FzZSBNU1Jf
SUEzMl9CTkRDRkdTOgo+PiArICAgICAgICBpZiAoICFpc19odm1fZG9tYWluKGQpIHx8ICFjcC0+
ZmVhdC5tcHggfHwKPj4gKyAgICAgICAgICAgICAhaHZtX3NldF9ndWVzdF9ibmRjZmdzKHYsIHZh
bCkgKQo+PiArICAgICAgICAgICAgZ290byBncF9mYXVsdDsKPiBJbiBib3RoIGNhc2VzIHRoZSBp
c19odm1fKigpIGNoZWNrIGxvb2tzIHRvIGJlIHJlZHVuZGFudCwgYXMKPiBmb3IgUFYgZ3Vlc3Rz
IGNwLT5mZWF0Lm1weCBjYW4ndCBiZSBzZXQuIFBlcnNvbmFsbHkgSSdkIHByZWZlcgo+IHRoaXMg
dG8gYmUgYW4gQVNTRVJUKCkgaW5zdGVhZCwgYnV0IEknZCBsaXN0ZW4gdG8gQW5kcmV3IChhcwo+
IHRoZSBtYWluIGF1dGhvciBvZiB0aGlzIGNvZGUpIHNheWluZyBvdGhlcndpc2UuCgpJbiB0aGlz
IGNhc2UsIHRoZSBjb21waWxlci9saW5rZXJzIG9waW5pb24gaW4gdGhlIHNoaW0gYnVpbGQgZG9l
cwpwcm92aWRlIGEgdmVyeSBjbGVhciBhbnN3ZXIuwqAgVGhlIGNoZWNrIGlzIG5vdCByZWR1bmRh
bnQgYW5kIG11c3QgcmVtYWluLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
