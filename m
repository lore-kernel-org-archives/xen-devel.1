From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH] x86/nmi: lower initial watchdog frequency
 to avoid boot hangs
Date: Wed, 7 Feb 2018 13:54:19 +0000
Message-ID: <7a037a7f-1243-b89f-475e-b25fa6dda6b5@citrix.com>
References: <1517865522-3248-1-git-send-email-igor.druzhinin@citrix.com>
 <5A79E0CB02000078001A5BBA@prv-mh.provo.novell.com>
 <990db14d-4ee2-bf95-20b4-1a050fc8fc9e@citrix.com>
 <5A79E49A02000078001A5C07@prv-mh.provo.novell.com>
 <b6c539a3-e720-ab09-9feb-8ca91f67379a@citrix.com>
 <5A7AD13D02000078001A5F03@prv-mh.provo.novell.com>
 <c00ada03-04d6-9ed8-55a1-1473cac092d8@citrix.com>
 <5A7B086E02000078001A6095@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A7B086E02000078001A6095@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDIvMTggMTM6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA3LjAyLjE4IGF0
IDE0OjAxLCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3JvdGU6Cj4+IFNvIGZhciB0aGUg
aXNzdWUgY29uZmlybWVkOgo+PiBEZWxsIFBvd2VyRWRnZSBSNzQwLCBIdWF3ZWkgc3lzdGVtcyBi
YXNlZCBvbiBYZW9uIEdvbGQgNjE1MiAodGhlIG9uZQo+PiB0aGF0IGl0IHdhcyB0ZXN0ZWQgb24p
LCBJbnRlbCBTMjYwMFhYLCBldGMuCj4+Cj4+IEFsc28gc2VlOgo+PiBodHRwczovL2J1Z3MueGVu
c2VydmVyLm9yZy9icm93c2UvWFNPLTc3NCAKPj4KPj4gV2VsbCwgbm8td2F0Y2hkb2cgaXMgd2hh
dCB3ZSBjdXJyZW50bHkgcmVjb21tZW5kIGluIHRoYXQgY2FzZSBidXQgd2UKPj4gaG9wZWQgdGhl
cmUgaXMgYSBnZW5lcmFsIHNvbHV0aW9uIGhlcmUgZnJvbSBYZW4gc2lkZS4gWW91IGhhdmUgeW91
cgo+PiBwb2ludCB0aGF0IHRoZXkgc2hvdWxkIGZpeCB0aGlzIG9uIHRoZWlyIHNpZGUgYmVjYXVz
ZSBpdCdzIHRoZWlyIGZhdWx0Cj4+IGluZGVlZC4gQnV0IHRoZSB1c2VyIGV4cGVyaWVuY2UgaXMg
YWxzbyBpbXBvcnRhbnQgZm9yIHVzIEkgdGhpbmsuCj4gCj4gT2YgY291cnNlLCBoZW5jZSB0aGUg
c3VnZ2VzdGlvbiBvZiBwb3NzaWJsZSBhbHRlcm5hdGl2ZSB3b3JrYXJvdW5kcy4KPiBJbXBhY3Rp
bmcgZXZlcnlvbmUgaXMsIGFzIHNhaWQsIG5vdCBhIGRlc2lyYWJsZSBhcHByb2FjaCBpbiBhIGNh
c2UKPiBsaWtlIHRoaXMgb25lLiBJIGFsc28gY29udGludWUgdG8gZGlzbGlrZSB0aGUgc2VlbWlu
Z2x5IHJhbmRvbSBkaXZpc2lvbgo+IGJ5IDEwLgo+IAo+IEphbgo+IAoKVGhlcmUgaXMgYWxzbyBh
IHdvcmthcm91bmQgYnkgaW5pdGlhbGl6aW5nIHRoZSB3YXRjaGRvZyBsYXRlciAoYWZ0ZXIgU01Q
CmJvb3RzdHJhcCkgb24gQ1BVMCAtIGFzIExpbnV4IGRvZXMgQUZBSUsuIEJ1dCBJIGRvbid0IHRo
aW5rIHRoaXMgd291bGQKYmUgYWNjZXB0YWJsZSBlaXRoZXIuCgpJZ29yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
