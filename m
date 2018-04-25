From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.11] x86/SVM: Fix intercepted {RD,
 WR}MSR for the SYS{CALL, ENTER} MSRs
Date: Wed, 25 Apr 2018 08:59:15 +0100
Message-ID: <85701572-ba7a-707a-d89b-1b353013c89e@citrix.com>
References: <1524595891-4030-1-git-send-email-andrew.cooper3@citrix.com>
 <5AE0250302000078001BE396@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AE0250302000078001BE396@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Xen-devel <xen-devel@lists.xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, brian.woods@amd.com
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDQvMjAxOCAwNzo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjQuMDQuMTgg
YXQgMjA6NTEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gLS0tIGEveGVu
L2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vc3Zt
LmMKPj4gQEAgLTE4ODMsNiArMTg4MywyMiBAQCBzdGF0aWMgaW50IHN2bV9tc3JfcmVhZF9pbnRl
cmNlcHQodW5zaWduZWQgaW50IG1zciwgdWludDY0X3QgKm1zcl9jb250ZW50KQo+PiAgICAgIHN3
aXRjaCAoIG1zciApCj4+ICAgICAgewo+PiAgICAgIGNhc2UgTVNSX0lBMzJfU1lTRU5URVJfQ1M6
Cj4+ICsgICAgY2FzZSBNU1JfSUEzMl9TWVNFTlRFUl9FU1A6Cj4+ICsgICAgY2FzZSBNU1JfSUEz
Ml9TWVNFTlRFUl9FSVA6Cj4gVGhlc2UgdGhyZWUgZG8gbm90IHJlcXVpcmUgc3luYy1pbmcsIGFz
IHRoZWlyIHZhbHVlcyBhcmVuJ3QgcmVhZCBmcm9tIHRoZSBWTUNCLgo+IChUaGV5IGRvIHJlcXVp
cmUgc3luYy1pbmcgb24gdGhlIHdyaXRlIHBhdGgpLgoKU2VlIHRoZSBUT0RPIGxpc3QgaW4gdGhl
IHBhdGNoIGNvbW1lbnQuwqAgVGhpcyBpcyBhIHF1aXJrIG9mIGNyb3NzLXZlbmRvcgpsb2dpYyBi
ZWluZyB1c2VkIHVubmVjZXNzYXJpbHkgaW4gdGhlIGNvbW1vbiBjYXNlLCBhbmQgaXNuJ3QgZ29p
bmcgdG8KcmVtYWluIGxpa2UgdGhpcy4KCj4gSSBhbHNvIGRvbid0IHRoaW5rIHRoaXMgaXMgZ29p
bmcgdG8gZnVsbHkgcmVzb2x2ZSBSYXp2YW4ncyBpc3N1ZSAobm90IHRoZSBsZWFzdAo+IGJlY2F1
c2UgdGhlIGNvZGUgcGF0aHMgeW91IGFkanVzdCBhcmVuJ3QgaW52b2x2ZWQgaW4gaGlzIHNjZW5h
cmlvKTogQXMKPiBwb2ludGVkIG91dCBpbiBhIHByaXZhdGUgbWFpbCwgSSB0aGluayB2bWNiX2lu
X3N5bmMgbmVlZHMgdG8gc3RhcnQgb3V0IGFzCj4gdHJ1ZSBmb3IgYSB2Q1BVLCBhbmQgbWF5IG5l
ZWQgc2V0dGluZyB0byB0cnVlIHVwb24gY29udGV4dCBzZXQgYW5kL29yCj4gcmVzZXQvaW5pdCBl
bXVsYXRpb24uCgpObyAtIGl0IHdvbnQsIGJ1dCBpdHMgb2J2aW91c2x5IGJyb2tlbiBhbmQgd2ls
bCBiZSB0aGUgc2Vjb25kIGJ1ZyB0byBiZQpoaXQgYnkgaW50cm9zcGVjdGlvbiwgd2hlbiBpbnRl
cmNlcHRpb24gb2YgdGhlc2UgTVNScyBpcyBhY3RpdmUuCgpJdCBqdXN0IHNvIGhhcHBlbmVkIHRo
YXQgaXQgd2FzIHRoZSBlYXNpZXIgaXNzdWUgdG8gZ2V0IHN0YXJ0ZWQgd2l0aC4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
