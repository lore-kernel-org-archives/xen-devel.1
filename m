From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V4] x86/hvm: fix domain crash when CR3 has
 the noflush bit set
Date: Thu, 15 Feb 2018 10:25:16 -0700
Message-ID: <5A85D08C02000078001A82EE@prv-mh.provo.novell.com>
References: <1518174113-2567-1-git-send-email-rcojocaru@bitdefender.com>
 <5A85C87802000078001A82AC@prv-mh.provo.novell.com>
 <7dda9477-f998-10f6-e259-ec00d1ec49ff@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <7dda9477-f998-10f6-e259-ec00d1ec49ff@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: bitweasil@cryptohaze.com, tamas@tklengyel.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAyLjE4IGF0IDE3OjU3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDIvMTggMTY6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni94ODYtZGVmbnMuaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni94ODYtZGVmbnMuaAo+Pj4gQEAgLTQzLDYgKzQzLDExIEBACj4+PiAgI2RlZmluZSBYODZfQ1Iw
X1BHICAgICAgICAgICAgICAweDgwMDAwMDAwIC8qIFBhZ2luZyAgICAgICAgICAgICAgICAgICAo
UlcpIAo+IAo+Pj4gKi8KPj4+ICAKPj4+ICAvKgo+Pj4gKyAqIEludGVsIENQVSBmbGFncyBpbiBD
UjMKPj4+ICsgKi8KPj4+ICsjZGVmaW5lIFg4Nl9DUjNfTk9GTFVTSCAgICAweDgwMDAwMDAwMDAw
MDAwMDAKPj4gUGxlYXNlIGFkZCB0aGUgVUxMIHN1ZmZpeCwgc28gdGhlIGluc24gZW11bGF0b3Ig
Y291bGQgZXZlbnR1YWxseQo+PiB1c2UgdGhpcyB3aXRob3V0IGJyZWFraW5nIHRoZSAzMi1iaXQg
dGVzdCBoYXJuZXNzIGJ1aWxkLgo+IAo+IF9BQyguLi4gLCBVTEwpIHBsZWFzZS4gIElmIFhlbiBk
b2VzIHN0YXJ0IHVzaW5nIFBDSUQsIHRoZW4gd2Ugd2lsbCBuZWVkCj4gdGhpcyB1c2FibGUgaW4g
YXNtLgoKT2gsIG9mIGNvdXJzZSAtIGFueSBjb25zdGFudHMgaW4gaGVhZGVycyB1c2FibGUgYnkg
YXNzZW1ibHkgZmlsZXMKc2hvdWxkIGhhdmUgc3VmZml4ZXMsIGlmIGFueSwgYXR0YWNoZWQgdmlh
IF9BQygpLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
