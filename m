From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1 2/2] common/page_alloc: don't idle-scrub
 before microcode update
Date: Tue, 27 Nov 2018 03:29:26 -0700
Message-ID: <5BFD1C8602000078002004A3@prv1-mh.provo.novell.com>
References: <20181127100034.4257-1-sergey.dyasli@citrix.com>
 <20181127100034.4257-3-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181127100034.4257-3-sergey.dyasli@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjExLjE4IGF0IDExOjAwLCA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPiB3cm90
ZToKPiAtLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9zZXR1
cC5jCj4gQEAgLTkzMyw2ICs5MzMsOCBAQCB2b2lkIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQg
bG9uZyBib290X3BoeXNfb2Zmc2V0LAo+ICAgICAgLyogVE9ETzogc21wX2NwdXNfZG9uZSgpOyAq
Lwo+ICAKPiAgICAgIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEFURV9zbXBfYm9vdGVkOwo+ICsgICAg
LyogV2FrZSB1cCBzZWNvbmRhcnkgQ1BVcyB0byBzdGFydCBpZGxlIG1lbW9yeSBzY3J1YmJpbmcg
Ki8KPiArICAgIHNtcF9zZW5kX2V2ZW50X2NoZWNrX21hc2soJmNwdV9vbmxpbmVfbWFwKTsKClRo
ZSBjb21tZW50IGluIGNvbnRleHQgaXMsIEkgdGhpbmssIGEgcHJldHR5IGdvb2Qgc3VnZ2VzdGlv
bgp3aGVyZSB0aGlzIG5ldyBjb2RlIChhbmQgcG9zc2libHkgYWxzbyB0aGUgc2V0dGluZyBvZiBz
eXN0ZW1fc3RhdGUsCmJ1dCBJJ20gbGVzcyBzdXJlIHdpdGggdGhhdCkgc2hvdWxkIGxpdmUsIGVz
cGVjaWFsbHkgb24gdGhlIHg4NiBzaWRlCndoZXJlIHRoaXMgZnVuY3Rpb24gYWxyZWFkeSBleGlz
dHMuCgo+IC0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4gKysrIGIveGVuL2NvbW1vbi9w
YWdlX2FsbG9jLmMKPiBAQCAtMTI2MSw2ICsxMjYxLDEzIEBAIGJvb2wgc2NydWJfZnJlZV9wYWdl
cyh2b2lkKQo+ICAgICAgbm9kZWlkX3Qgbm9kZTsKPiAgICAgIHVuc2lnbmVkIGludCBjbnQgPSAw
Owo+ICAgIAo+ICsgICAgLyoKPiArICAgICAqIERvbid0IHN0YXJ0IHNjcnViYmluZyB1bnRpbCBh
bGwgc2Vjb25kYXJ5IENQVXMgaGF2ZSBib290ZWQgYW5kCj4gKyAgICAgKiB1cGRhdGVkIHRoZWly
IG1pY3JvY29kZS4KPiArICAgICAqLwo+ICsgICAgaWYgKCBzeXN0ZW1fc3RhdGUgPCBTWVNfU1RB
VEVfc21wX2Jvb3RlZCApCj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOwoKQXMgc2FpZCBvbiBhbm90
aGVyIHN1Yi10aHJlYWQsIEkgdGhpbmsgc2NydWJiaW5nIHNob3VsZG4ndCBiZQpkZWxheWVkIHVu
Y29uZGl0aW9uYWxseS4gUXVpdGUgYSBiaXQgb2YgcHJvZ3Jlc3MgY2FuIHByZXN1bWFibHkKYmUg
bWFkZSBhbHJlYWR5IGJ5IHRoZSBDUFVzIGFzIHRoZXkgY29tZSBvbmxpbmUsIHdoaWxlIG90aGVy
cwphcmUgc3RpbGwgYmVpbmcgb25saW5lZC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
