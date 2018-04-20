From: "Natarajan, Janakarajan" <jnataraj@amd.com>
Subject: Re: [PATCH 3/8] x86/SVM: Add AVIC vmexit handlers
Date: Fri, 20 Apr 2018 15:02:06 -0500
Message-ID: <c13e4d5b-9010-cf2f-950f-e47bfc108eb2@amd.com>
References: <cover.1522794651.git.Janakarajan.Natarajan@amd.com>
 <29be8811f7cd22aecafddcfab330ed6cd67bdc0a.1522794651.git.Janakarajan.Natarajan@amd.com>
 <5AD5EF6D02000078001BC158@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AD5EF6D02000078001BC158@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8xNy8yMDE4IDc6NTggQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA0LjA0LjE4
IGF0IDAxOjAxLCA8SmFuYWthcmFqYW4uTmF0YXJhamFuQGFtZC5jb20+IHdyb3RlOgo+PiAtLS0g
YS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bGFwaWMuaAo+PiArKysgYi94ZW4vaW5jbHVkZS9h
c20teDg2L2h2bS92bGFwaWMuaAo+PiBAQCAtMTM3LDYgKzEzNywxMCBAQCB2b2lkIHZsYXBpY19p
cGkoc3RydWN0IHZsYXBpYyAqdmxhcGljLCB1aW50MzJfdCBpY3JfbG93LAo+PiB1aW50MzJfdCBp
Y3JfaGlnaCk7Cj4+ICAgCj4+ICAgaW50IHZsYXBpY19hcGljdl93cml0ZShzdHJ1Y3QgdmNwdSAq
diwgdW5zaWduZWQgaW50IG9mZnNldCk7Cj4+ICAgCj4+ICt2b2lkIHZsYXBpY19yZWdfd3JpdGUo
c3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludCBvZmZzZXQsIHVpbnQzMl90IHZhbCk7Cj4+ICsK
Pj4gK3VpbnQzMl90IHZsYXBpY19yZWFkX2FsaWduZWQoY29uc3Qgc3RydWN0IHZsYXBpYyAqdmxh
cGljLCB1bnNpZ25lZCBpbnQgb2Zmc2V0KTsKPiBJZiBtYWtpbmcgdGhlc2Ugbm9uLXN0YXRpYyBp
cyByZWFsbHkgbmVjZXNzYXJ5LCB0aGV5IHNob3VsZCAobmFtZS13aXNlKSBiZWNvbWUKPiBwcm9w
ZXIgcGFpcnMgb2Ygb25lIGFub3RoZXIsIGUuZy4gcmVuYW1lZCB0aGUgZm9ybWVyIHRvIHZsYXBp
Y19yZWdfcmVhZCgpLgo+Cj4gQWxzbyB3aGlsZSBoZXJlIHlvdSBwcm9wZXJseSB1c2UgdWludDMy
X3QsIGFsbW9zdCBldmVyeXdoZXJlIHlvdSB1c2UgdTMyLgo+IFBsZWFzZSBzd2l0Y2ggdGhpcyB0
aHJvdWdob3V0IHRoZSBzZXJpZXMsIGFuZCBvZiBjb3Vyc2UgZm9yIGFsbCBvdGhlciBmaXhlZAo+
IHdpZHRoIGludGVnZXIgdHlwZXMuCgpJbiB0aGUgY2FzZSBvZiB2bWNiLmgsIHdoZXJlIHRoZSBl
eGlzdGluZyB2YXJpYWJsZXMgdXNlIHUzMiwgdTY0IHdvdWxkIAp5b3Ugd2FudCBtZSB0byBoYXZl
IHVpbnQzMl90LAp1aW50NjRfdCBmb3IgdGhlIG5ldyBhdmljIHZhcmlhYmxlcz8KCj4KPiBKYW4K
Pgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
