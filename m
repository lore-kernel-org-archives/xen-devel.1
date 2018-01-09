From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6.5 19/26] x86/hvm: Permit guests direct
 access to MSR_{SPEC_CTRL, PRED_CMD}
Date: Tue, 9 Jan 2018 12:03:10 +0000
Message-ID: <08573966-b274-056d-8055-703b7b814805@citrix.com>
References: <1515024955-13390-1-git-send-email-andrew.cooper3@citrix.com>
 <1515024955-13390-20-git-send-email-andrew.cooper3@citrix.com>
 <5A4E0785020000780019AD72@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A4E0785020000780019AD72@prv-mh.provo.novell.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDEvMTggMDk6NTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Cj4+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9tc3IuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvbXNyLmMKPj4gQEAgLTEzMiw3ICsxMzIs
OCBAQCBpbnQgZ3Vlc3RfcmRtc3IoY29uc3Qgc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IG1zciwg
dWludDY0X3QgKnZhbCkKPj4gICAgICBjYXNlIE1TUl9TUEVDX0NUUkw6Cj4+ICAgICAgICAgIGlm
ICggIWNwLT5mZWF0LmlicnNiICkKPj4gICAgICAgICAgICAgIGdvdG8gZ3BfZmF1bHQ7Cj4+IC0g
ICAgICAgICp2YWwgPSB2cC0+c3BlY19jdHJsLmd1ZXN0Owo+PiArICAgICAgICAqdmFsID0gKHZw
LT5zcGVjX2N0cmwuZGlyZWN0X2FjY2Vzcwo+PiArICAgICAgICAgICAgICAgID8gdnAtPnNwZWNf
Y3RybC5ob3N0IDogdnAtPnNwZWNfY3RybC5ndWVzdCk7Cj4+ICAgICAgICAgIGJyZWFrOwo+IFRv
IHJlY2FwLCBJIGhhZCBhc2tlZCB3aGV0aGVyIHRoaXMgaXMgdmFsaWQgYWhlYWQgb2YgbGF0ZXIg
Y2hhbmdlcywKPiB3aGljaCB5b3UgcmVwbGllZCB0byBzYXlpbmcgdGhpcyB3b24ndCBoYXZlIGFu
eSAiYnkgbm90IHBlcm1pdHRpbmcKPiB0aGUgZ3Vlc3QgYW55IGFjY2VzcyB1bnRpbCBwYXRjaCAy
NSIuIEluIHdoaWNoIGNhc2UgYXQgdGhlIHZlcnkKPiBsZWFzdCB0aGUgcGF0Y2ggdGl0bGUgaXMg
bWlzbGVhZGluZy4gWWV0IEkgZG9uJ3QgZXZlbiBhZ3JlZSB3aXRoIHdoYXQKPiB5b3Ugc2F5IC0g
cGF0Y2ggMjUgb25seSBmaWRkbGVzIHdpdGggQ1BVSUQgYml0cy4gRGlkIHlvdSBwZXJoYXBzCj4g
bWVhbiB0byBzYXkgIkJ5IG5vdCBwZXJtaXR0aW5nIGEgd2VsbCBiZWhhdmVkIGd1ZXN0IGFueSBh
Y2Nlc3MKPiB1bnRpbCBwYXRjaCAyNSwiIGFzIG9uZSB0cnlpbmcgdG8gYWNjZXNzIHRoZSBNU1Jz
IHdpdGhvdXQgY29uc3VsdGluZwo+IHRoZSBDUFVJRCBiaXRzIHdvdWxkIGJlIGFibGUgdG8gc3Rh
cnRpbmcgd2l0aCB0aGUgcGF0Y2ggaGVyZSBhaXVpPwoKVGhlIGd1ZXN0IGFjY2VzcyBiaXQgYmVp
bmcgY2xlYXIgaW4gY3B1ZmVhdHVyZXNldC5oIG1lYW5zIHRoYXQgdGhlCm1heGltdW0gZmVhdHVy
ZXNldCBjYWxjdWxhdGlvbnMgZm9yIGd1ZXN0cyB3aWxsIGd1YXJhbnRlZSB0aGF0CmNwLT5mZWF0
LmlicnNiIGlzIGN1cnJlbnRseSBmYWxzZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
