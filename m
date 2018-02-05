From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] common/gnttab: Introduce command line
 feature controls
Date: Mon, 05 Feb 2018 05:56:56 -0700
Message-ID: <5A7862A802000078001A5336@prv-mh.provo.novell.com>
References: <1517495926-19425-1-git-send-email-andrew.cooper3@citrix.com>
 <5A7434AE02000078001A479D@prv-mh.provo.novell.com>
 <c38539c0-616a-f2b9-af91-78a34b5815ec@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c38539c0-616a-f2b9-af91-78a34b5815ec@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAyLjE4IGF0IDEyOjU1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDIvMDIvMTggMDg6NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwMS4w
Mi4xOCBhdCAxNTozOCwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gLS0t
IGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUubWFya2Rvd24KPj4+ICsrKyBiL2RvY3MvbWlz
Yy94ZW4tY29tbWFuZC1saW5lLm1hcmtkb3duCj4+PiBAQCAtOTE2LDYgKzkxNiwxOSBAQCBDb250
cm9scyBFUFQgcmVsYXRlZCBmZWF0dXJlcy4KPj4+ICAKPj4+ICBTcGVjaWZ5IHdoaWNoIGNvbnNv
bGUgZ2Ric3R1YiBzaG91bGQgdXNlLiBTZWUgKipjb25zb2xlKiouCj4+PiAgCj4+PiArIyMjIGdu
dHRhYgo+Pj4gKz4gYD0gTGlzdCBvZiBbIG1heF92ZXI6PGludGVnZXI+LCB0cmFuc2l0aXZlPTxi
b29sPiBdYAo+PiBJIHJlYWxpemUgeW91IGRvbid0IHdhbnQgdG8gY2hhbmdlIHRoaXMgYXMgcGVv
cGxlIGFscmVhZHkgdXNlIGl0LCBidXQKPj4gSSdkIHN0aWxsIGxpa2UgdG8gZ2l2ZSBteSB1c3Vh
bCBjb21tZW50OiBJJ2QgcHJlZmVyIGlmIHdlIGNvdWxkIGF2b2lkCj4+IGludHJvZHVjaW5nIGZ1
cnRoZXIgdW5kZXJzY29yZS1jb250YWluaW5nIChzdWIpb3B0aW9ucy4gSSByZWFsbHkgZG9uJ3QK
Pj4gdW5kZXJzdGFuZCB3aHkgZXZlcnlvbmUgZG9lcyB0aGlzOiBEYXNoZXMgYXJlIGVhc2llciB0
byB0eXBlIG9uCj4+IGFsbCBrZXlib2FyZHMgSSdtIGF3YXJlIG9mLCBhbmQgdGhlcmUncyBubyBu
ZWVkIHRvIG1pbWljIEMgaWRlbnRpZmllcgo+PiBuYW1lcyBmb3IgY29tbWFuZCBsaW5lIG9wdGlv
bnMuCj4gCj4gSSBjYW4gaW50cm9kdWNlIGEgbWF4LXZlciBhbGlhcyBpZiB5b3UgaW5zaXN0LCBi
dXQgZHJvcHBpbmcgbWF4X3ZlciBoZXJlCj4gaXMgZ29pbmcgdG8gYnJlYWsgdXNlcnMgd2hvIHRv
b2sgdGhpcyBwYXRjaCBmb3IgWFNBLTIyNi4KCkhlbmNlIHRoZSB3YXkgSSd2ZSB3b3JkZWQgbXkg
cmVwbHkgLSBJIGRvbid0IG1lYW4gdG8gaW5zaXN0IG9uCmNoYW5naW5nIHdoYXQgeW91IGhhdmUs
IG9yIHRoZSBpbnRyb2R1Y3Rpb24gb2YgYW4gYWxpYXMuIEkgbWVyZWx5CndhbnRlZCB0byBnaXZl
IHRoZSBjb21tZW50LCBpbiB0aGUgaG9wZSB0aGF0IGl0IGhlbHBzIHRvIGF2b2lkCmZ1dHVyZSB1
bmRlcnNjb3JlcyBpbiBjb21tYW5kIGxpbmUgb3B0aW9uIG5hbWVzLgoKSmFuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
