From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH for-4.11] x86/SVM: Fix intercepted {RD,
 WR}MSR for the SYS{CALL, ENTER} MSRs
Date: Wed, 25 Apr 2018 11:12:48 +0300
Message-ID: <470322f9-1618-9edb-4497-4d25140385e3@bitdefender.com>
References: <1524595891-4030-1-git-send-email-andrew.cooper3@citrix.com>
 <5AE0250302000078001BE396@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AE0250302000078001BE396@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, brian.woods@amd.com, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMjUvMjAxOCAwOTo0OSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjQuMDQu
MTggYXQgMjA6NTEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0v
c3ZtLmMKPj4gQEAgLTE4ODMsNiArMTg4MywyMiBAQCBzdGF0aWMgaW50IHN2bV9tc3JfcmVhZF9p
bnRlcmNlcHQodW5zaWduZWQgaW50IG1zciwgdWludDY0X3QgKm1zcl9jb250ZW50KQo+PiAgICAg
IHN3aXRjaCAoIG1zciApCj4+ICAgICAgewo+PiAgICAgIGNhc2UgTVNSX0lBMzJfU1lTRU5URVJf
Q1M6Cj4+ICsgICAgY2FzZSBNU1JfSUEzMl9TWVNFTlRFUl9FU1A6Cj4+ICsgICAgY2FzZSBNU1Jf
SUEzMl9TWVNFTlRFUl9FSVA6Cj4gCj4gVGhlc2UgdGhyZWUgZG8gbm90IHJlcXVpcmUgc3luYy1p
bmcsIGFzIHRoZWlyIHZhbHVlcyBhcmVuJ3QgcmVhZCBmcm9tIHRoZSBWTUNCLgo+IChUaGV5IGRv
IHJlcXVpcmUgc3luYy1pbmcgb24gdGhlIHdyaXRlIHBhdGgpLgo+IAo+IEkgYWxzbyBkb24ndCB0
aGluayB0aGlzIGlzIGdvaW5nIHRvIGZ1bGx5IHJlc29sdmUgUmF6dmFuJ3MgaXNzdWUgKG5vdCB0
aGUgbGVhc3QKPiBiZWNhdXNlIHRoZSBjb2RlIHBhdGhzIHlvdSBhZGp1c3QgYXJlbid0IGludm9s
dmVkIGluIGhpcyBzY2VuYXJpbyk6IEFzCj4gcG9pbnRlZCBvdXQgaW4gYSBwcml2YXRlIG1haWws
IEkgdGhpbmsgdm1jYl9pbl9zeW5jIG5lZWRzIHRvIHN0YXJ0IG91dCBhcwo+IHRydWUgZm9yIGEg
dkNQVSwgYW5kIG1heSBuZWVkIHNldHRpbmcgdG8gdHJ1ZSB1cG9uIGNvbnRleHQgc2V0IGFuZC9v
cgo+IHJlc2V0L2luaXQgZW11bGF0aW9uLgoKRG9pbmcgYXJjaF9zdm0tPnZtY2JfaW5fc3luYyA9
IDE7IGluIGNvbnN0cnVjdF92bWNiKCkgZG9lcyBzb2x2ZSB0aGUKaXNzdWUuIEkgY2FuJ3QgdW5m
b3J0dW5hdGVseSB0ZXN0IGlmIGl0IGFsc28gbmVlZHMgc2V0dGluZyBpbiBvdGhlcgpwbGFjZXMg
YXMgb3VyIGludGVybmFsIHBhdGNoZXMgc3RpbGwgbmVlZCBzb21lIHdvcmsgc28gaW50cm9zcGVj
dGlvbiBpcwpub3QgeWV0IGZ1bGx5IGZ1bmN0aW9uYWwgb24gU1ZNIChtZW1fYWNjZXNzIGV2ZW50
cyBzcGVjaWZpY2FsbHkgYXJlIGEKYml0IG9mIGEgcHJvYmxlbSkuCgoKVGhhbmtzLApSYXp2YW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
