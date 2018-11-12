From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/5] xen/domain: Audit config->max_vcpus
 during {, arch_}check_domain_config()
Date: Mon, 12 Nov 2018 01:21:00 -0700
Message-ID: <5BE937EC02000078001FAB54@prv1-mh.provo.novell.com>
References: <1538751289-1109-1-git-send-email-andrew.cooper3@citrix.com>
 <1538751289-1109-4-git-send-email-andrew.cooper3@citrix.com>
 <5BBB5F8B02000078001EF9C9@prv1-mh.provo.novell.com>
 <3d04b7cf-bf72-40dc-70e7-054367a40d0f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <3d04b7cf-bf72-40dc-70e7-054367a40d0f@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjExLjE4IGF0IDE5OjQ0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDgvMTAvMTggMTQ6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pgo+Pj4gLS0tIGEv
eGVuL2NvbW1vbi9kb21haW4uYwo+Pj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYwo+Pj4gQEAg
LTI5Nyw2ICsyOTcsOSBAQCBzdGF0aWMgaW50IGNoZWNrX2RvbWFpbl9jb25maWcoc3RydWN0IAo+
IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpCj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgWEVOX0RPTUNUTF9DREZfeHNfZG9tYWluKSApCj4+PiAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPj4+ICAKPj4+ICsgICAgaWYgKCBjb25maWctPm1heF92Y3B1cyA8IDEgKQo+Pj4g
KyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+PiArCj4+PiAgICAgIHJldHVybiBhcmNoX2NoZWNr
X2RvbWFpbl9jb25maWcoY29uZmlnKTsKPj4+ICB9Cj4+IEFueSByZWFzb24geW91IGRvbid0IHJl
bW92ZSB0aGUgbm93IHJlZHVuZGFudCBjaGVjayBmcm9tCj4+IGRvbWFpbl9jcmVhdGUoKSwgd2hp
Y2ggd291bGQgYWxsb3cgZGl0Y2hpbmcgYWx0b2dldGhlciB4ODYncwo+PiBkb21haW5fbWF4X3Zj
cHVzKCk/Cj4gCj4gVGhhdCdzIGRvbmUgaW4gdGhlIG5leHQgcGF0Y2gsIHRvIHNpbXBsaWZ5IHRo
aXMgb25lLgoKWWVhaCwgSSBoYWQgbm90aWNlZCB0aGlzIG9uY2UgSSBnb3QgdGhlcmUuIEhhbGYg
YSBzZW50ZW5jZSBpbiB0aGUKZGVzY3JpcHRpb24gdG8gZXhwbGFpbiB0aGUgbm93IHBvc3NpYmxl
IGNsZWFudXAgaXMgZGVmZXJyZWQKaW50ZW50aW9uYWxseSB3b3VsZCBoYXZlIGhlbHBlZCwgYnV0
IHRoYXQncyBmaW5lIGluIGFueSBldmVudC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
