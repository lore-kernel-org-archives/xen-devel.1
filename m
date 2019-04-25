From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2 v2] x86/acpi: Improve suspend and resume
 process for Zhaoxin CPU
Date: Thu, 25 Apr 2019 14:42:15 +0100
Message-ID: <b4952c32-0162-7d92-ab11-825daae4dd06@citrix.com>
References: <1555663857-4173-1-git-send-email-fionali-oc@zhaoxin.com>
 <5CC1B46B0200007800229134@prv1-mh.provo.novell.com>
 <89dcdf84-214d-d100-e2a1-8bd151f215bd@citrix.com>
 <5CC1B818020000780022916A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PBl1=S3=citrix.com=prvs=0115b8627=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJee8-00008v-SZ
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 13:42:40 +0000
In-Reply-To: <5CC1B818020000780022916A@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, FionaLi-oc <fionali-oc@zhaoxin.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, cobechen@zhaoxin.com, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDQvMjAxOSAxNDozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjUuMDQuMTkg
YXQgMTU6MjUsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjUvMDQv
MjAxOSAxNDoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAxOS4wNC4xOSBhdCAxMDo1
MCwgPGZpb25hbGktb2NAemhhb3hpbi5jb20+IHdyb3RlOgo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni94ODZfNjQvdHJhcHMuYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMuYwo+
Pj4+IEBAIC0zMzQsNyArMzM0LDggQEAgdm9pZCBzdWJhcmNoX3BlcmNwdV90cmFwc19pbml0KHZv
aWQpCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxv
bmcpbHN0YXJfZW50ZXIpOwo+Pj4+ICAgICAgc3R1Yl92YSArPSBvZmZzZXQ7Cj4+Pj4gIAo+Pj4+
IC0gICAgaWYgKCBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgJiAoWDg2X1ZFTkRPUl9JTlRFTCB8
IFg4Nl9WRU5ET1JfQ0VOVEFVUikgCj4+ICkKPj4+PiArICAgIGlmICggYm9vdF9jcHVfZGF0YS54
ODZfdmVuZG9yICYKPj4+PiArICAgICAgICAoWDg2X1ZFTkRPUl9JTlRFTCB8IFg4Nl9WRU5ET1Jf
Q0VOVEFVUiB8IFg4Nl9WRU5ET1JfU0hBTkdIQUkpICkKPj4+PiAgICAgIHsKPj4+PiAgICAgICAg
ICAvKiBTWVNFTlRFUiBlbnRyeS4gKi8KPj4+PiAgICAgICAgICB3cm1zcmwoTVNSX0lBMzJfU1lT
RU5URVJfRVNQLCBzdGFja19ib3R0b20pOwo+Pj4gSG93IGlzIHRoaXMgaHVuayByZWxhdGVkIHRv
IHRoZSB0aXRsZSBvZiB0aGUgY2hhbmdlPyBJIHRoaW5rIHRoZQo+Pj4gdGl0bGUgd2FudHMgdG8g
YmUgYWRqdXN0ZWQuCj4+Pgo+Pj4gRnVydGhlcm1vcmUgZm9yIGFsbCBvZiB0aGUgY2hhbmdlcyBk
b25lLCB3b3VsZG4ndCB3ZSBiZXR0ZXIKPj4+IHN3aXRjaCB0byB1c2UgY3B1X2hhc19zZXA/IGlu
aXRfYW1kKCkgYXMgd2VsbCBhcyBkZWZhdWx0X2luaXQoKQo+Pj4gYWxyZWFkeSBjbGVhciB0aGlz
IGZsYWcuIEFuZHJldywgdGhvdWdodHM/Cj4+IEkgd29uZGVyZWQgZXhhY3RseSB0aGF0IGFmdGVy
IHF1ZXVpbmcgdGhpcyBwYXRjaCwgYnV0IGRpZG4ndCBnZXQgYXJvdW5kCj4+IHRvIGV4cGVyaW1l
bnRpbmcuCj4+Cj4+IFdlIGhhdmUgdG8gYmUgYSBsaXR0bGUgY2FyZWZ1bCB3aXRoIHRoZSBvcmRl
cmluZyBvZiBvcGVyYXRpb25zLiAKPj4gY3B1X2hhc19zZXAgaXMgdmlzaWJsZSBpbiBDUFVJRCBi
dXQgbmVlZHMgY2xvYmJlcmluZyBpbiBBTUQvSHlnb24gYmVmb3JlCj4+IGNwdV9oYXNfc2VwIGlz
IHNhZmUgdG8gdXNlIChhbHRob3VnaCBmb3IgdGhlIE1TUnMsIGl0IHNob3VsZCBiZSBzYWZlKS4K
PiB0cmFwX2luaXQoKSAoYW5kIGhlbmNlIHBlcmNwdV90cmFwc19pbml0KCkpIHJ1bnMgYWZ0ZXIs
IGluCj4gcGFydGljdWxhciwgaW5pdF9zcGVjdWxhdGlvbl9taXRpZ2F0aW9ucygpLCB3aGljaCBt
ZWFucyBhbGwKPiBmZWF0dXJlIGNvbGxlY3Rpb24gYW5kIG1hc3NhZ2luZyBtdXN0IGhhdmUgaGFw
cGVuZWQuIFNvCj4gdW5sZXNzIHlvdSBleHBsaWNpdGx5IHNheSBvdGhlcndpc2UsIEknZCBsaWtl
IHRvIGFzayBGaW9uYUxpCj4gdG8gc3VibWl0IGEgdjIgd2l0aCB0aGF0IGNoYW5nZSAoYW5kIHdp
dGggdGhlIG90aGVyIGNvc21ldGljCj4gYWRqdXN0bWVudHMgY2FycmllZCBvdXQpLgoKSSdsbCBk
cm9wIHRoaXMgcGF0Y2ggZnJvbSB4ODYtbmV4dC7CoCBPdmVyYWxsLCBJIHRoaW5rIGEgY3B1X2hh
c19zZXAKYmFzZWQgc29sdXRpb24gd291bGQgYmUgcHJlZmVyYWJsZS4KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
