From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/5] x86/msr: Fix handling of
 MSR_AMD_PATCHLEVEL/MSR_IA32_UCODE_REV
Date: Fri, 05 Apr 2019 03:20:13 -0600
Message-ID: <5CA71DCD0200007800224CFF@prv1-mh.provo.novell.com>
References: <1554409592-28572-1-git-send-email-andrew.cooper3@citrix.com>
 <1554409592-28572-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1554409592-28572-6-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA0LjE5IGF0IDIyOjI2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L21zci5jCj4gKysrIGIveGVuL2FyY2gveDg2L21zci5j
Cj4gQEAgLTEzNSw2ICsxMzUsMjcgQEAgaW50IGd1ZXN0X3JkbXNyKGNvbnN0IHN0cnVjdCB2Y3B1
ICp2LCB1aW50MzJfdCBtc3IsIHVpbnQ2NF90ICp2YWwpCj4gICAgICAgICAgLyogTm90IG9mZmVy
ZWQgdG8gZ3Vlc3RzLiAqLwo+ICAgICAgICAgIGdvdG8gZ3BfZmF1bHQ7Cj4gIAo+ICsgICAgY2Fz
ZSBNU1JfQU1EX1BBVENITEVWRUw6Cj4gKyAgICAgICAgQlVJTERfQlVHX09OKE1TUl9JQTMyX1VD
T0RFX1JFViAhPSBNU1JfQU1EX1BBVENITEVWRUwpOwo+ICsgICAgICAgIC8qCj4gKyAgICAgICAg
ICogQU1EIGFuZCBJbnRlbCB1c2UgdGhlIHNhbWUgTVNSIGZvciB0aGUgY3VycmVudCBtaWNyb2Nv
ZGUgdmVyc2lvbi4KPiArICAgICAgICAgKgo+ICsgICAgICAgICAqIFRoZXJlIGlzIG5vIG5lZWQg
dG8ganVtcCB0aHJvdWdoIHRoZSBTRE0tcHJvdmlkZWQgaG9vcHMgZm9yIEludGVsLgo+ICsgICAg
ICAgICAqIEEgZ3Vlc3QgbWlnaHQgaXRzZWxmIHBlcmZvcm0gdGhlICJ3cml0ZSAwLCBDUFVJRCwg
cmVhZCIgc2VxdWVuY2UsCj4gKyAgICAgICAgICogYnV0IHNlcnZpY2luZyB0aGUgQ1BVSUQgZm9y
IHRoZSBndWVzdCB0eXBpY2FsbHkgd29udCByZXN1bHQgaW4KPiArICAgICAgICAgKiBhY3R1YWxs
eSBleGVjdXRpbmcgYSBDUFVJRCBpbnN0cnVjdGlvbi4KPiArICAgICAgICAgKgo+ICsgICAgICAg
ICAqIEFzIGEgZ3Vlc3QgY2FuJ3QgaW5mbHVlbmNlIHRoZSB2YWx1ZSBvZiB0aGlzIE1TUiwgdGhl
IHZhbHVlIHdpbGwgYmUKPiArICAgICAgICAgKiBmcm9tIFhlbidzIGxhc3QgbWljcm9jb2RlIGxv
YWQsIHdoaWNoIGNhbiBiZSBmb3J3YXJkZWQgc3RyYWlnaHQgdG8KPiArICAgICAgICAgKiB0aGUg
Z3Vlc3QuCj4gKyAgICAgICAgICovCj4gKyAgICAgICAgaWYgKCAhKGNwLT54ODZfdmVuZG9yICYg
KFg4Nl9WRU5ET1JfSU5URUwgfFg4Nl9WRU5ET1JfQU1EKSkgfHwKCk5pdDogVGhlcmUncyBhIG1p
c3NpbmcgYmxhbmsgYWZ0ZXIgdGhlIHwgaGVyZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
