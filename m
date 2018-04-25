From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH for-4.11] x86/SVM: Fix intercepted {RD,
 WR}MSR for the SYS{CALL, ENTER} MSRs
Date: Wed, 25 Apr 2018 10:18:26 +0300
Message-ID: <53356c37-10ec-92cc-f508-b4f1cdbe6d4e@bitdefender.com>
References: <1524595891-4030-1-git-send-email-andrew.cooper3@citrix.com>
 <5AE0250302000078001BE396@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
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
ICBzd2l0Y2ggKCBtc3IgKQo+PiAgICAgICB7Cj4+ICAgICAgIGNhc2UgTVNSX0lBMzJfU1lTRU5U
RVJfQ1M6Cj4+ICsgICAgY2FzZSBNU1JfSUEzMl9TWVNFTlRFUl9FU1A6Cj4+ICsgICAgY2FzZSBN
U1JfSUEzMl9TWVNFTlRFUl9FSVA6Cj4gCj4gVGhlc2UgdGhyZWUgZG8gbm90IHJlcXVpcmUgc3lu
Yy1pbmcsIGFzIHRoZWlyIHZhbHVlcyBhcmVuJ3QgcmVhZCBmcm9tIHRoZSBWTUNCLgo+IChUaGV5
IGRvIHJlcXVpcmUgc3luYy1pbmcgb24gdGhlIHdyaXRlIHBhdGgpLgo+IAo+IEkgYWxzbyBkb24n
dCB0aGluayB0aGlzIGlzIGdvaW5nIHRvIGZ1bGx5IHJlc29sdmUgUmF6dmFuJ3MgaXNzdWUgKG5v
dCB0aGUgbGVhc3QKPiBiZWNhdXNlIHRoZSBjb2RlIHBhdGhzIHlvdSBhZGp1c3QgYXJlbid0IGlu
dm9sdmVkIGluIGhpcyBzY2VuYXJpbyk6IEFzCj4gcG9pbnRlZCBvdXQgaW4gYSBwcml2YXRlIG1h
aWwsIEkgdGhpbmsgdm1jYl9pbl9zeW5jIG5lZWRzIHRvIHN0YXJ0IG91dCBhcwo+IHRydWUgZm9y
IGEgdkNQVSwgYW5kIG1heSBuZWVkIHNldHRpbmcgdG8gdHJ1ZSB1cG9uIGNvbnRleHQgc2V0IGFu
ZC9vcgo+IHJlc2V0L2luaXQgZW11bGF0aW9uLgoKSXQgaW5kZWVkIGRvZXMgbm90IHNvbHZlIHRo
ZSB3aG9sZSBpc3N1ZSAtIEkndmUgdGVzdGVkIHRoZSBwYXRjaCBhcyBzb29uIAphcyBpdCB3YXMg
cG9zdGVkIChhbmQgSSd2ZSB0cmllZCBhIHNpbWlsYXIgc3RyYXRlZ3kgZm9yIExTVEFSIGFsb25l
IGFzIApwYXJ0IG9mIGRlYnVnZ2luZyBiZWZvcmUgbm90aWZ5aW5nIG9mIHRoZSBpc3N1ZSkuIEJ1
dCBJIHRoaW5rIEFuZHJldyAKbWVhbnQgaXQgYXMgYSBzZXBhcmF0ZSBwYXRjaCwgZml4aW5nIG9u
bHkgdGhlIGludGVyY2VwdCBwYXJ0LgoKSSdsbCB0ZXN0IHRoZSB2bWNiX2luX3N5bmMgc3VnZ2Vz
dGlvbiBBU0FQLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
