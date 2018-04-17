From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 8/8] x86/SVM: Add AMD AVIC key handler
Date: Tue, 17 Apr 2018 07:36:02 -0600
Message-ID: <5AD5F84202000078001BC1AF@prv1-mh.provo.novell.com>
References: <cover.1522794651.git.Janakarajan.Natarajan@amd.com>
 <604e789d707b7232e46ed97a9a72dc9def581f0f.1522794651.git.Janakarajan.Natarajan@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <604e789d707b7232e46ed97a9a72dc9def581f0f.1522794651.git.Janakarajan.Natarajan@amd.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA0LjE4IGF0IDAxOjAxLCA8SmFuYWthcmFqYW4uTmF0YXJhamFuQGFtZC5jb20+
IHdyb3RlOgo+IEFkZGluZyBuZXcga2V5LWhhbmRsZXIgImoiIGZvciBkdW1waW5nIEFWSUMtcmVs
YXRlZCBpbmZvcm1hdGlvbi4KCkNvbnNpZGVyaW5nIGhvdyBmZXcga2V5cyB3ZSBoYXZlIGxlZnQs
IEkgaGF2ZSBzaWduaWZpY2FudCByZXNlcnZhdGlvbnMgYWdhaW5zdAphZGRpbmcgc3VjaCBhIG5h
cnJvdyBwdXJwb3NlIGtleS4gSWYgeW91IHJlYWxseSB3YW50IHRvIGV4cG9zZSBzdWNoIGluZm9y
bWF0aW9uLAphZGQgaXQgdG8gYSBzdWl0YWJsZSBleGlzdGluZyBrZXkgb3IgaW50cm9kdWNlIGEg
c3lzY3RsLgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9hdmljLmMKPiArKysgYi94ZW4v
YXJjaC94ODYvaHZtL3N2bS9hdmljLmMKPiBAQCAtMjgsNiArMjgsNyBAQAo+ICAjaW5jbHVkZSA8
YXNtL2h2bS9zdXBwb3J0Lmg+Cj4gICNpbmNsdWRlIDxhc20vaHZtL3N2bS9hdmljLmg+Cj4gICNp
bmNsdWRlIDxhc20vaHZtL3ZsYXBpYy5oPgo+ICsjaW5jbHVkZSA8eGVuL2tleWhhbmRsZXIuaD4K
PiAgI2luY2x1ZGUgPGFzbS9wMm0uaD4KPiAgI2luY2x1ZGUgPGFzbS9wYWdlLmg+CgpQbGVhc2Ug
aW5zZXJ0IG5ldyBpbmNsdWRlcyBpbiBhIG1vcmUgbG9naWNhbCBtYW5uZXIgKHdoZXJlIHBvc3Np
YmxlIHdlIGFzayBmb3IKdGhlbSB0byBiZSBzb3J0ZWQgYWxwaGFiZXRpY2FsbHksIGJ1dCB0aGF0
IG1heSBub3QgbWFrZSBzZW5zZSBoZXJlLCBidXQgYXQKbGVhc3QgZ3JvdXAgaXQgd2l0aCBvdGhl
ciB4ZW4vIG9uZXMpLgoKPiBAQCAtNDksNiArNTAsMTEgQEAKPiAgICovCj4gIGJvb2wgc3ZtX2F2
aWMgPSAwOwo+ICAKPiArc3RhdGljIGlubGluZSBib29sIHN2bV9pc19hdmljX2RvbWFpbihzdHJ1
Y3QgZG9tYWluICpkKQoKY29uc3QKCj4gK3sKPiArICAgIHJldHVybiAoIGQtPmFyY2guaHZtX2Rv
bWFpbi5zdm0uYXZpY19waHlzaWNhbF9pZF90YWJsZSAhPSAwICk7CgpTdHJheSBibGFua3MgKGFu
ZCB1bm5lY2Vzc2FyeSBwYXJlbnRoZXNlcyBhbnl3YXkpLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
