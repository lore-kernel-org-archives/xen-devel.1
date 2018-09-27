From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 1/2] mem_access: Fix npfec.kind
 propagation
Date: Thu, 27 Sep 2018 01:04:35 -0600
Message-ID: <5BAC810302000078001EC6E9@prv1-mh.provo.novell.com>
References: <20180926164741.13405-1-george.dunlap@citrix.com>
 <02c6bddf-933c-5348-73eb-25d6d826d30b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gbjr=mj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g5QLo-0008FL-Kb
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 07:04:40 +0000
In-Reply-To: <02c6bddf-933c-5348-73eb-25d6d826d30b@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas.lengyel@zentific.com>, aisaila@bitdefender.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA5LjE4IGF0IDE5OjAwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjYvMDkvMTggMTc6NDcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9h
Y2Nlc3MuYwo+PiBAQCAtMjMyLDEyICsyMzIsMTIgQEAgYm9vbCBwMm1fbWVtX2FjY2Vzc19jaGVj
ayhwYWRkcl90IGdwYSwgdW5zaWduZWQgbG9uZyBnbGEsCj4+ICAgICAgICAgIHsKPj4gICAgICAg
ICAgICAgIHJlcS0+dS5tZW1fYWNjZXNzLmZsYWdzIHw9IE1FTV9BQ0NFU1NfR0xBX1ZBTElEOwo+
PiAgICAgICAgICAgICAgcmVxLT51Lm1lbV9hY2Nlc3MuZ2xhID0gZ2xhOwo+PiAtCj4+IC0gICAg
ICAgICAgICBpZiAoIG5wZmVjLmtpbmQgPT0gbnBmZWNfa2luZF93aXRoX2dsYSApCj4+IC0gICAg
ICAgICAgICAgICAgcmVxLT51Lm1lbV9hY2Nlc3MuZmxhZ3MgfD0gTUVNX0FDQ0VTU19GQVVMVF9X
SVRIX0dMQTsKPj4gLSAgICAgICAgICAgIGVsc2UgaWYgKCBucGZlYy5raW5kID09IG5wZmVjX2tp
bmRfaW5fZ3B0ICkKPj4gLSAgICAgICAgICAgICAgICByZXEtPnUubWVtX2FjY2Vzcy5mbGFncyB8
PSBNRU1fQUNDRVNTX0ZBVUxUX0lOX0dQVDsKPj4gICAgICAgICAgfQo+PiArCj4+ICsgICAgICAg
IGlmICggbnBmZWMua2luZCA9PSBucGZlY19raW5kX3dpdGhfZ2xhICkKPj4gKyAgICAgICAgICAg
IHJlcS0+dS5tZW1fYWNjZXNzLmZsYWdzIHw9IE1FTV9BQ0NFU1NfRkFVTFRfV0lUSF9HTEE7Cj4+
ICsgICAgICAgIGVsc2UgaWYgKCBucGZlYy5raW5kID09IG5wZmVjX2tpbmRfaW5fZ3B0ICkKPj4g
KyAgICAgICAgICAgIHJlcS0+dS5tZW1fYWNjZXNzLmZsYWdzIHw9IE1FTV9BQ0NFU1NfRkFVTFRf
SU5fR1BUOwo+IAo+IE5pdC4gIE5ld2xpbmUgaGVyZSBwbGVhc2UsIGFzIGl0IGlzIG5vdCBsb2dp
Y2FsbHkgcmVsYXRlZCB3aXRoIHRoZSBibG9jawo+IGJlbG93LgoKQW5kLCBkZXNwaXRlIGl0IGJl
aW5nIGp1c3QgdHdvIGNvbXBhcmlzb25zLCBwZXJoYXBzIGJldHRlciB0bwptYWtlIGl0IGEgc3dp
dGNoKCkgYXQgdGhlIHNhbWUgdGltZT8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
