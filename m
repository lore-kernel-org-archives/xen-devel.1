From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/7] xen/iommu: smmu-v3: Add Xen specific
 code to enable the ported driver
Date: Thu, 01 Mar 2018 07:21:12 -0700
Message-ID: <5A981A6802000078001AD629@prv-mh.provo.novell.com>
References: <20180209031055.21926-1-sameer.goel@linaro.org>
 <20180209031055.21926-6-sameer.goel@linaro.org>
 <24bed3b5-9951-fb85-f5f8-1e295d565994@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ib05=fx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1erP5C-0006WY-8u
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 14:21:18 +0000
In-Reply-To: <24bed3b5-9951-fb85-f5f8-1e295d565994@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Sameer Goel <sameer.goel@linaro.org>
Cc: sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>, mjaggi@caviumnetworks.com, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org, shankerd@codeaurora.org, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjAzLjE4IGF0IDE1OjA3LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDA5LzAyLzE4IDAzOjEwLCBTYW1lZXIgR29lbCB3cm90ZToKPj4gVGhpcyBkcml2ZXIgZm9s
bG93cyBhbiBhcHByb2FjaCBzaW1pbGFyIHRvIHNtbXUgZHJpdmVyLiBUaGUgaW50ZW50IGhlcmUK
Pj4gaXMgdG8gcmV1c2UgYXMgbXVjaCBMaW51eCBjb2RlIGFzIHBvc3NpYmxlLgo+PiAtIEdsdWUg
Y29kZSBoYXMgYmVlbiBpbnRyb2R1Y2VkIHRvIGJyaWRnZSB0aGUgQVBJIGNhbGxzLgo+PiAtIENh
bGxlZCBMaW51eCBmdW5jdGlvbnMgZnJvbSB0aGUgWGVuIElPTU1VIGZ1bmN0aW9uIGNhbGxzLgo+
PiAtIFhlbiBtb2RpZmljYXRpb25zIGFyZSBwcmVjZWRlZCBieSAvKlhlbjogY29tbWVudCAqLwo+
PiAtIHhlbi9saW51eF9jb21wYXQ6IEFkZCBhIExpbnV4IGNvbXBhdCBoZWFkZXIKPj4gICAgRm9y
IHBvcnRpbmcgZmlsZXMgZGlyZWN0bHkgZnJvbSBMaW51eCBpdCBpcyB1c2VmdWwgdG8gaGF2ZSBh
IGZ1bmN0aW9uIG1hcHBpbmcKPj4gICAgZGVmaW5pdGlvbnMgZnJvbSBMaW51eCB0byBYZW4uIFRo
aXMgZmlsZSBhZGRzIGNvbW1vbiBBUEkgZnVuY3Rpb25zIGFuZAo+PiAgICBvdGhlciBkZWZpbmVz
IHRoYXQgYXJlIG5lZWRlZCBmb3IgcG9ydGluZyBhcm0gU01NVSBkcml2ZXJzLgo+IAo+IEkgdW5k
ZXJzdGFuZCBSb2dlciBhc2tlZCBmb3IgaXQsIGJ1dCB0aGF0IHdhcyBub3QgYSByZWFsbHkgd2lz
ZSBjaG9pY2UgCj4gZ2l2ZW4gdGhlIHNpemUgb2YgdGhpcyBwYXRjaC4gQW55d2F5LCBsZXQncyBr
ZWVwIGl0IGxpa2UgdGhhdC4KPiAKPj4gCj4+IFNpZ25lZC1vZmYtYnk6IFNhbWVlciBHb2VsIDxz
YW1lZXIuZ29lbEBsaW5hcm8ub3JnPgo+PiAtLS0KPj4gICB4ZW4vYXJjaC9hcm0vcDJtLmMgICAg
ICAgICAgICAgICAgICAgIHwgICAxICsKPj4gICB4ZW4vZHJpdmVycy9LY29uZmlnICAgICAgICAg
ICAgICAgICAgIHwgICAyICsKPj4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vS2NvbmZp
ZyAgIHwgICA4ICsKPj4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUgIHwg
ICAxICsKPj4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12My5jIHwgODkyICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPj4gICB4ZW4vaW5jbHVkZS94ZW4vbGlu
dXhfY29tcGF0LmggICAgICAgIHwgIDg0ICsrKysKPiAKPiBZb3UgbmVlZCB0byBDQyB0aGUgUkVT
VCBtYWludGFpbmVycyBmb3IgdGhhdC4KCkFuZCB0byBiZSBob25lc3QsIEkgZmluZCBhZGRpbmcg
c3VjaCBkaXNndXN0aW5nLiBXZSd2ZSBpbXBvcnRlZApfbG90c18gb2Ygc3R1ZmYgZnJvbSBMaW51
eCwgeWV0IG5ldmVyIG5lZWRlZCB0aGluZ3MgbGlrZSBnZnAKZGVmaW5pdGlvbnMuIEknbSBmYXIg
ZnJvbSBjb252aW5jZWQgdGhhdCBjb252ZXJ0aW5nIHRoZSBuZXcgZmlsZQppbiBhdCBsZWFzdCBz
b21lIGJhc2ljIGFzcGVjdHMgdG8gIlhlbiB3b3JkaW5nIiB3b3VsZCBjb21wbGljYXRlCm1haW50
YWluaW5nIHRoYXQgZmlsZSBzaWduaWZpY2FudGx5LiBIZWFkZXJzIGluY2x1ZGVkIGF0IHRoZSB0
b3AKb2J2aW91c2x5IGNhbid0IHVzZSBsaW51eC8gYW55d2F5LCBzbyBpdCdzIG5ldmVyIGdvaW5n
IHRvIGJlIGEKdmVyYmF0aW0gY29weS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
