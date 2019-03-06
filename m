From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v11 5/9] xen/x86: use DECLARE_BOUNDS as
 required
Date: Wed, 6 Mar 2019 13:38:16 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1903061318160.17248@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
 <1551825512-8975-5-git-send-email-sstabellini@kernel.org>
 <5C7FEBBC020000780021C308@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+lMa=RJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1h1eF1-0007ra-5X
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 21:38:19 +0000
In-Reply-To: <5C7FEBBC020000780021C308@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, ian.jackson@citrix.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCA2IE1hciAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDUuMDMuMTkg
YXQgMjM6MzgsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IEBAIC02MDAsNyAr
NjAyLDkgQEAgc3RhdGljIHZvaWQgbm9pbmxpbmUgaW5pdF9kb25lKHZvaWQpCj4gPiAgICAgIHVu
cmVnaXN0ZXJfaW5pdF92aXJ0dWFsX3JlZ2lvbigpOwo+ID4gIAo+ID4gICAgICAvKiBaZXJvIHRo
ZSAuaW5pdCBjb2RlIGFuZCBkYXRhLiAqLwo+ID4gLSAgICBmb3IgKCB2YSA9IF9faW5pdF9iZWdp
bjsgdmEgPCBfcChfX2luaXRfZW5kKTsgdmEgKz0gUEFHRV9TSVpFICkKPiA+ICsgICAgZm9yICgg
dmEgPSAoY2hhciAqKV9faW5pdF9iZWdpbjsKPiA+ICsgICAgICAgICAgaW5pdF9sdCh2YSwgX19p
bml0X2VuZCk7Cj4gPiArICAgICAgICAgIHZhICs9IFBBR0VfU0laRSApCj4gPiAgICAgICAgICBj
bGVhcl9wYWdlKHZhKTsKPiAKPiBBdCB0aGUgZXhhbXBsZSBvZiB0aGlzIC0gaXMgY2FzdGluZyBh
d2F5IG9mIGNvbnN0LW5lc3Mgbm90IGFsc28gYQo+IHBvdGVudGlhbCBjZXJ0aWZpY2F0aW9uIGhp
bmRyYW5jZT8KCkRhcm4sIHdlbGwgc3BvdHRlZCEgTm8sIGl0IGlzIG5vdCBwZXJtaXR0ZWQgKFJ1
bGUgMTEuOCkuCkluIHRoaXMgY2FzZSBjb25zdCBpcyBub3QgY29ycmVjdCBiZWNhdXNlIHdlIGFj
dHVhbGx5IG1vZGlmeSB0aGUgb2JqZWN0CmZldyBsaW5lcyBiZWxvdzoKCiAgYmFzZS0+cHJpdiA9
IDE7CgoKVGhpcyBpcyBwcm9ibGVtYXRpYy4gV2UgaGF2ZSBhbHNvIHRoZSBmb2xsb3dpbmcgaW5z
dGFuY2VzIGluIHRoaXMgc2VyaWVzCnRvIGRlYWwgd2l0aDoKCnhlbi9hcmNoL2FybS9wZXJjcHUu
YzpfZnJlZV9wZXJjcHVfYXJlYQogIGNoYXIgKnAgPSAoY2hhciAqKV9fcGVyX2NwdV9zdGFydCAr
IF9fcGVyX2NwdV9vZmZzZXRbY3B1XTsKCnhlbi9hcmNoL3g4Ni9wZXJjcHUuYzpfZnJlZV9wZXJj
cHVfYXJlYQogIGNoYXIgKnAgPSAoY2hhciAqKV9fcGVyX2NwdV9zdGFydCArIF9fcGVyX2NwdV9v
ZmZzZXRbY3B1XTsKCnhlbi9hcmNoL3g4Ni9zZXR1cC5jOmluaXRfZG9uZQogIGZvciAoIHZhID0g
KGNoYXIgKilfX2luaXRfYmVnaW47IGluaXRfbHQodmEsIF9faW5pdF9lbmQpOyB2YSArPSBQQUdF
X1NJWkUgKQoKeGVuL2FyY2gveDg2L2FsdGVybmF0aXZlLmM6YXBwbHlfYWx0ZXJuYXRpdmVzCiAg
Zm9yICggYSA9IGJhc2UgPSAoc3RydWN0IGFsdF9pbnN0ciAqKXN0YXJ0OyBhbHRfaW5zdHJfbHQo
YSwgZW5kKTsgYSsrICkKCgpJbiBhbGwgdGhlc2UgY2FzZXMgd2UgYWN0dWFsbHkgZW5kIHVwIG1v
ZGlmeWluZyB0aGUgb2JqZWN0LiBJIHN1Z2dlc3QKd2UgcmVtb3ZlIHRoZSBjb25zdCBmcm9tIGVp
dGhlciBfX0RFQ0xBUkVfQk9VTkRTIChzbyBmcm9tIGV2ZXJ5d2hlcmUpLApvciBqdXN0IGZvciBw
ZXJfY3B1LCBpbml0LCBhbmQgYWx0X2luc3RyIGJ5IGludHJvZHVjaW5nIGFub3RoZXIgTUFDUk8u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
