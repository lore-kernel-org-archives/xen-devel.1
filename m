From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 07/10] arm: make it possible to disable
 the SMMU driver
Date: Tue, 22 May 2018 13:05:33 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805221303300.24793@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1805211743440.4520@sstabellini-ThinkPad-X260>
 <1526950408-18219-7-git-send-email-sstabellini@kernel.org>
 <5B03BAFF02000078001308AF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B03BAFF02000078001308AF@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: artem_mygaiev@epam.com, lars.kurth@citrix.com, sstabellini@kernel.org, andrii_anisov@epam.com, xen-devel@lists.xen.org, julien.grall@arm.com, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyMiBNYXkgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPi0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL0tjb25maWcKPiA+KysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
S2NvbmZpZwo+ID5AQCAtMSwzICsxLDExIEBACj4gID4KPiA+Y29uZmlnIEhBU19QQVNTVEhST1VH
SAo+ID5ib29sCj4gPisKPiA+K2NvbmZpZyBTTU1VdjIKPiA+Kwlib29sICJBUk0gU01NVXYxIGFu
ZCB2MiBkcml2ZXIiCj4gPisJZGVmYXVsdCB5Cj4gPisJZGVwZW5kcyBvbiBBUk0KPiAKPiBBbnRp
Y2lwYXRpbmcgZnVydGhlciBhZGRpdGlvbnMgaGVyZSwgSSB3b3VsZCBwcmVmZXIgdGhlICJpZiBB
Uk0iIGZvcm0sIGJ1dCBhcyBpdAo+IGRvZXNuJ3QgcmVhbGx5IG1hdHRlciByaWdodCBub3cgSSB3
b24ndCBpbnNpc3QuCgpJJ2xsIG1ha2UgdGhlIGNoYW5nZQoKIAo+ID4tLS0gYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUKPiA+KysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYXJtL01ha2VmaWxlCj4gPkBAIC0xLDIgKzEsMiBAQAo+ID5vYmoteSArPSBpb21tdS5vCj4g
Pi1vYmoteSArPSBzbW11Lm8KPiA+K29iai0kKFNNTVV2MikgKz0gc21tdS5vCj4gCj4gSXMgaW9t
bXUubyBpbiBhbnkgd2F5IHVzZWZ1bCB3aXRob3V0IHNtbXUubz8KClRoaW5ncyBsaWtlIGlvbW11
X2RvbWFpbl9pbml0IGFyZSBjYWxsZWQgdW5jb25kaXRpb25hbGx5IGZyb20gQVJNIGNvZGUKYXQg
dGhlIG1vbWVudCwgaXQgaXMgbm90IHF1aXRlIHBvc3NpYmxlIHRvIHNraXAgY29tcGlsYXRpb24g
dG9kYXkuIEFsc28sCml0IGlzIHNtYWxsLCBzbyBpdCBpcyBub3Qgd29ydGggaXQgSSB0aGluay4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
