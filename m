From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/5] x86/domain: Initialise vcpu debug
 registers correctly
Date: Fri, 26 Oct 2018 15:22:57 +0100
Message-ID: <afe9256a-088c-81d0-dd6d-3a9387e52f46@citrix.com>
References: <1539599780-14549-1-git-send-email-andrew.cooper3@citrix.com>
 <1539599780-14549-3-git-send-email-andrew.cooper3@citrix.com>
 <5BD3171402000078001F531D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BD3171402000078001F531D@prv1-mh.provo.novell.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMTAvMjAxOCAxNDozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTUuMTAuMTgg
YXQgMTI6MzYsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gLS0tIGEveGVu
L2FyY2gveDg2L2RvbWFpbi5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+PiBAQCAt
MzIzLDYgKzMyMywxOCBAQCB2b2lkIGZyZWVfdmNwdV9zdHJ1Y3Qoc3RydWN0IHZjcHUgKnYpCj4+
ICAgICAgZnJlZV94ZW5oZWFwX3BhZ2Uodik7Cj4+ICB9Cj4+ICAKPj4gKy8qIEluaXRpYWxpc2Ug
dmFyaW91cyByZWdpc3RlcnMgdG8gdGhlaXIgYXJjaGl0ZWN0dXJhbCBJTklUL1JFU0VUIHN0YXRl
LiAqLwo+PiArdm9pZCBhcmNoX3ZjcHVfcmVnc19pbml0KHN0cnVjdCB2Y3B1ICp2KQo+PiArewo+
PiArICAgIHYtPmFyY2gudXNlcl9yZWdzID0gKHR5cGVvZih2LT5hcmNoLnVzZXJfcmVncykpewo+
PiArICAgICAgICAucmZsYWdzID0gWDg2X0VGTEFHU19NQlMsCj4+ICsgICAgfTsKPiBTYWRseSB0
aGlzIGluaXRpYWxpemVyIGJyb2tlIHRoZSBidWlsZCBvbmNlIGFnYWluIGZvciBnY2MgNC4zLngu
CgpPaCAtIHRoYXQncyB1bmZvcnR1bmF0ZS7CoCBJIGd1ZXNzIGl0IHdpbGwgbmVlZCBhIG1lbXNl
dCBpbnN0ZWFkLgoKPiAoQXMgYSBzaWRlIG5vdGUsIHVzaW5nIC5lZmxhZ3MgaW5zdGVhZCBvZiAu
cmZsYWdzIHdvdWxkIGhhdmUgYQo+IGZhaXIgY2hhbmNlIG9mIGFuIG9taXR0ZWQgUkVYIHByZWZp
eC4pCgpZb3Ugc3BlY2lmaWNhbGx5IHJlcXVlc3RlZCByZmxhZ3Mgb3ZlciBlZmxhZ3MgaW4geW91
ciBwcmV2aW91cyByZXZpZXcuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
