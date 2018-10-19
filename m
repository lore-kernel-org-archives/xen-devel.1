From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 15/16] x86: expose CONFIG_PV
Date: Fri, 19 Oct 2018 16:51:21 +0100
Message-ID: <7757f4fd-23dc-23f6-07de-b95dafe9c2f4@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <361027969ba66e280f2a47084ae7a5c416c798be.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wxwm=m7=citrix.com=prvs=8238c2210=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gDX3d-0005AY-BG
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 15:51:25 +0000
In-Reply-To: <361027969ba66e280f2a47084ae7a5c416c798be.1539959287.git-series.wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTAvMTggMTU6MjgsIFdlaSBMaXUgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAtLS0KPiB2MjogZ3Vlc3QgLT4gZG9tYWluCj4gLS0t
Cj4gIHhlbi9hcmNoL3g4Ni9LY29uZmlnIHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L0tjb25maWcgYi94
ZW4vYXJjaC94ODYvS2NvbmZpZwo+IGluZGV4IDU0OGNiZjkuLmM3ZTk3ZTIgMTAwNjQ0Cj4gLS0t
IGEveGVuL2FyY2gveDg2L0tjb25maWcKPiArKysgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwo+IEBA
IC0zNyw2ICszNywxNCBAQCBzb3VyY2UgImFyY2gvS2NvbmZpZyIKPiAgCj4gIGNvbmZpZyBQVgo+
ICAJZGVmX2Jvb2wgeQo+ICsJcHJvbXB0ICJQViBzdXBwb3J0Igo+ICsJLS0taGVscC0tLQo+ICsJ
ICBJbnRlcmZhY2VzIHRvIHN1cHBvcnQgUFYgZG9tYWlucyB3aGljaCBkb24ndCByZXF1aXJlIGhh
cmR3YXJlCj4gKwkgIHN1cHBvcnQgbGlrZSBJbnRlbCdzIFZULXggb3IgQU1EJ3MgU1ZNLgoKU29y
cnkgdG8gbml0cGljaywgYnV0IEknZCBzdWdnZXN0IHdvcmRpbmcgdGhpcyBhczoKCkludGVyZmFj
ZXMgdG8gc3VwcG9ydCBQViBkb21haW5zLsKgIFRoZXNlIHJlcXVpcmUgZ3Vlc3Qga2VybmVsIHN1
cHBvcnQgdG8KcnVuIGFzIGEgUFYgZ3Vlc3QsIGJ1dCBkb24ndCByZXF1aXJlIGFueSBzcGVjaWZp
YyBoYXJkd2FyZSBzdXBwb3J0LgoKRWl0aGVyIHdheSwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cgo+ICsKPiArCSAgVGhpcyBvcHRpb24gaXMg
bmVlZGVkIGlmIHlvdSB3YW50IHRvIHJ1biBQViBkb21haW5zLgo+ICsKPiArCSAgSWYgdW5zdXJl
LCBzYXkgWS4KPiAgCj4gIGNvbmZpZyBQVl9MSU5FQVJfUFQKPiAgICAgICAgIGJvb2wgIlN1cHBv
cnQgZm9yIFBWIGxpbmVhciBwYWdldGFibGVzIgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
