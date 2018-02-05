From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/3] x86/svm: add EFER SVME support for
	VGIF/VLOAD
Date: Mon, 05 Feb 2018 10:02:27 -0700
Message-ID: <5A789C3302000078001A5674@prv-mh.provo.novell.com>
References: <20180131203525.21660-1-brian.woods@amd.com>
 <20180131203525.21660-3-brian.woods@amd.com>
 <5A782D4B02000078001A519C@prv-mh.provo.novell.com>
 <20180205164732.GB8527@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180205164732.GB8527@amd.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAyLjE4IGF0IDE3OjQ3LCA8YnJpYW4ud29vZHNAYW1kLmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBGZWIgMDUsIDIwMTggYXQgMDI6MDk6MTVBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IElmIHRoZSBsYXR0ZXIgY2hlY2sgd2FzIG1vdmVkIHRvIHRoZSBjYWxsZXIsIHRoZSB3
aG9sZSBmdW5jdGlvbgo+PiB3b3VsZCBwZXJoYXBzIGJlIGJldHRlciBwbGFjZWQgaW4gbmVzdGVk
c3ZtLmM/Cj4gCj4gSSB0aG91Z2h0IGFib3V0IHB1dHRpbmcgaXQgaW4gbmVzdGVkc3ZtLmMgYnV0
IEkgdGhvdWdodCBoYXZpbmcgaXQgYXMgYQo+IHN0YXRpYyBmdW5jdGlvbiB3b3VsZCBiZSBiZXR0
ZXIuICBJIGNvdWxkIG1vdmUgaXQgdG8gbmVzdGVkc3ZtLmMgCj4gdGhvdWdoLgo+IAo+PiBDYW4g
eW91IHBsZWFzZSBhdm9pZCAiPT0gMCIgYW5kICI9PSAxIiBvbiBib29sZWFuIGZpZWxkcyAoZXZl
bgo+PiBpZiwgbGlrZSBpbiB0aGUgY2FzZSBoZXJlLCB0aGUgYml0ZmllbGQgaGFzIHU2NCBhcyB1
bmRlcmx5aW5nIHR5cGUsCj4+IHdoaWNoIGlzIHNvcnQgb2YgcG9pbnRsZXNzKT8KPiAKPiBzdm0u
YyBpcyBvbGRlciBhbmQgdXNlcyAiPT0gWCIsIGFuZCBJIHdhcyB0cnlpbmcgdG8ga2VlcCBpdCBj
b25zaXN0ZW50Cj4gd2l0aGluIHRoZSBmaWxlLiAgRm9yIHRoaW5ncyBsaWtlIGlmICgpIHtcbix9
IFx7LCB3aGljaCBhcmUKPiBpbmNvbnNpc3RlbnQsIEkgYWx3YXlzIHVzZSBpZiAoKSBcbiBcey4g
IFNob3VsZCBJIG9ubHkgYmUgdXNpbmcgYm9vbGVhbj8KCldlbGwsIHVubGVzcyBvbmUgb2YgdGhl
IG1haW50YWluZXJzIG9mIHRoZSBmaWxlIG9iamVjdHMsIEkgdGhpbmsgaXQKd291bGQgYmUgYmV0
dGVyIHRvIGFkanVzdCB5b3VyIHBhdGNoLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
