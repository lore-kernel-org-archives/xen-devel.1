From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] build: Rename as-insn-check to as-insn-add
Date: Thu, 22 Feb 2018 06:39:32 -0700
Message-ID: <5A8ED62402000078001AA691@prv-mh.provo.novell.com>
References: <1519296673-19470-1-git-send-email-andrew.cooper3@citrix.com>
 <5A8EB8A402000078001AA56C@prv-mh.provo.novell.com>
 <3ce4604a-1f4c-1ee3-cff1-884fd2c1226c@citrix.com>
 <5A8EC40A02000078001AA5CD@prv-mh.provo.novell.com>
 <511bbc13-b5c5-73a1-9f8c-47df50705d69@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <511bbc13-b5c5-73a1-9f8c-47df50705d69@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAyLjE4IGF0IDEzOjM5LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAwMi8yMi8yMDE4IDEyOjIyIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24g
MjIuMDIuMTggYXQgMTI6NDEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+
IE9uIDIyLzAyLzE4IDExOjMzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAyMi4wMi4x
OCBhdCAxMTo1MSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+PiBhcy1p
bnNuLWNoZWNrIG11dGF0ZXMgdGhlIHBhc3NlZC1pbiBmbGFncy4gIFJlbmFtZSBpdCB0byBhcy1p
bnNuLWFkZCwgaW4gbGluZQo+Pj4+PiB3aXRoIGNjLW9wdGlvbi1hZGQuICBVcGRhdGUgYWxsIGNh
bGxlcnMuCj4+Pj4gSSdtIG5vdCBjb252aW5jZWQgLSBjYy1vcHRpb24tYWRkIG1ha2VzIHJlbGF0
aXZlbHkgY2xlYXIgdGhhdAo+Pj4+IHNvbWV0aGluZyBpcyBiZWluZyBhZGRlZCB0byB0aGUgb3B0
aW9ucyBwYXNzZWQgdG8gQ0MuIElmIEkKPj4+PiB0YWtlIGFzLWluc24tYWRkIHRoaXMgd2F5LCB0
aGUgbWFjcm8gd291bGQgbmVlZCB0byBhZGQgYW4KPj4+PiBpbnNuIHRvIHRoZSBBUyBpbnZvY2F0
aW9uLiBXaGlsZSBJIGFncmVlIGFzLWluc24tY2hlY2sgZG9lc24ndAo+Pj4+IG1ha2UgY2xlYXIg
dGhhdCBpdCBhZGRzIGFueSBvcHRpb25zLCBJIHN0aWxsIGZpbmQgdGhpcyBsZXNzCj4+Pj4gbWlz
bGVhZGluZyB0aGFuIHRoZSBzdWdnZXN0ZWQgbmV3IG5hbWUuIExldCdzIHNlZSB3aGF0Cj4+Pj4g
b3RoZXJzIHRoaW5rLgo+Pj4KPj4+IEknbSBvcGVuIHRvIGJldHRlciBuYW1lIHN1Z2dlc3Rpb25z
Lgo+PiAKPj4gVGhlIGJlc3QgSSBjYW4gY29tZSB1cCB3aXRoIGlzLCB3ZWxsLCBhcy1pbnNuLWNo
ZWNrLCBhcyB0aGF0Cj4+IHJlYXNvbmFibHkgZGVzY3JpYmVzIGF0IGxlYXN0IHBhcnQgb2Ygd2hh
dCB0aGUgY29uc3RydWN0IGRvZXMuCj4+IGFzLWluc24tY2hlY2stYW5kLWFkZC1vcHRpb24sIGJl
c2lkZXMgYmVpbmcgdG9vIGxvbmcsIGlzbid0Cj4+IG1lYW5pbmdmdWxseSBiZXR0ZXIuCj4gCj4g
V2UncmUgZGVmaW5pdGVseSBnZXR0aW5nIGludG8gYmlrZXNoZWQgdGVycml0b3J5IGhlcmUuCgpJ
bmRlZWQsIGJ1dCBJIHRoaW5rIGEgY2hhbmdlIGluIG5hbWUgc2hvdWxkIGJlIGFuIGltcHJvdmVt
ZW50LApub3QgZ29pbmcgZnJvbSBvbmUgcXVlc3Rpb25hYmxlIG5hbWUgdG8gYW5vdGhlciBxdWVz
dGlvbmFibGUKb25lLgoKPiAgSSBhZ3JlZSB3aXRoCj4gQW5keSB0aGF0ICdjaGVjaycgZG9lc24n
dCByZWFsbHkgY29udmV5IHRoYXQgc29tZXRoaW5nIGNoYW5nZWQuICBJcyB0aGUKPiBjaGVjay1h
bmQtYWRkICJhZGQgaXQgaWYgaXQgZG9lc24ndCBleGlzdCBhbHJlYWR5Ij8gIE9yIGFkZCBpdCBp
ZiBzb21lCj4gb3RoZXIgY2hlY2sgcGFzc2VzIC8gZmFpbHM/CgpJdCBpcyAiY2hlY2sgaWYgdGhp
cyBwaWVjZSBvZiBhc3NlbWJseSBhc3NlbWJsZXMgYW5kIGFkZCB0aGUKcHJvdmlkZWQgb3B0aW9u
IHRvIHRoZSBpbmRpY2F0ZWQgdmFyaWFibGUiLCBleHRlbmRlZCBieSBSb2dlcidzCnBhdGNoIHRv
ICIuLi4sIGFuZCBhZGQgdGhlIG90aGVyIHByb3ZpZGVkIG9wdGlvbiBpZiBpdCBkb2Vzbid0CmFz
c2VtYmxlIi4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
