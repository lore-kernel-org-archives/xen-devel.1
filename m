From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH RFC 1/3] x86/vpt: execute callbacks for
 masked interrupts
Date: Mon, 26 Feb 2018 14:12:33 +0000
Message-ID: <20180226141233.cchks6fsz545g77i@MacBook-Pro-de-Roger.local>
References: <20180223132743.59804-1-roger.pau@citrix.com>
 <20180223132743.59804-2-roger.pau@citrix.com>
 <20180226123554.ep76zgkatb2zswv4@citrix.com>
 <20180226124810.77uqvmdm7nodm32f@MacBook-Pro-de-Roger.local>
 <5A94140302000078001ABCA4@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=4q6f=fu=citrix.com=prvs=588a07e6a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eqJXP-000501-Js
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 14:13:55 +0000
Content-Disposition: inline
In-Reply-To: <5A94140302000078001ABCA4@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Stefan Bader <stefan.bader@canonical.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMjYsIDIwMTggYXQgMDY6MDQ6NTFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI2LjAyLjE4IGF0IDEzOjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gTW9uLCBGZWIgMjYsIDIwMTggYXQgMTI6MzU6NTRQTSArMDAwMCwgV2VpIExp
dSB3cm90ZToKPiA+PiBPbiBGcmksIEZlYiAyMywgMjAxOCBhdCAwMToyNzo0MVBNICswMDAwLCBS
b2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPj4gPiAgaW50IHB0X3VwZGF0ZV9pcnEoc3RydWN0IHZj
cHUgKnYpCj4gPj4gPiAgewo+ID4+ID4gICAgICBzdHJ1Y3QgbGlzdF9oZWFkICpoZWFkID0gJnYt
PmFyY2guaHZtX3ZjcHUudG1fbGlzdDsKPiA+PiA+ICsgICAgTElTVF9IRUFEKHB1cmdlZCk7Cj4g
Pj4gCj4gPj4gdG9fcHVyZ2U/Cj4gPiAKPiA+IE15IHBvaW50IGlzIHRoYXQgdGhleSBoYXZlIGFs
cmVhZHkgYmVlbiBwdXJnZWQgZnJvbSB0aGUgcHQtPmxpc3QsIGJ1dAo+ID4gSSByZWFsbHkgZG9u
J3QgaGF2ZSBhIHByZWZlcmVuY2UuCj4gPiAKPiA+PiA+ICAgICAgc3RydWN0IHBlcmlvZGljX3Rp
bWUgKnB0LCAqdGVtcCwgKmVhcmxpZXN0X3B0Owo+ID4+ID4gICAgICB1aW50NjRfdCBtYXhfbGFn
Owo+ID4+ID4gICAgICBpbnQgaXJxLCBpc19sYXBpYywgcHRfdmVjdG9yOwo+ID4+ID4gQEAgLTI2
Nyw3ICsyODksMTAgQEAgaW50IHB0X3VwZGF0ZV9pcnEoc3RydWN0IHZjcHUgKnYpCj4gPj4gPiAg
ICAgICAgICAgICAgewo+ID4+ID4gICAgICAgICAgICAgICAgICAvKiBzdXNwZW5kIHRpbWVyIGVt
dWxhdGlvbiAqLwo+ID4+ID4gICAgICAgICAgICAgICAgICBsaXN0X2RlbCgmcHQtPmxpc3QpOwo+
ID4+ID4gLSAgICAgICAgICAgICAgICBwdC0+b25fbGlzdCA9IDA7Cj4gPj4gPiArICAgICAgICAg
ICAgICAgIGlmICggcHQtPmNiICkKPiA+PiA+ICsgICAgICAgICAgICAgICAgICAgIGxpc3RfYWRk
KCZwdC0+bGlzdCwgJnB1cmdlZCk7Cj4gPj4gPiArICAgICAgICAgICAgICAgIGVsc2UKPiA+PiA+
ICsgICAgICAgICAgICAgICAgICAgIHB0LT5vbl9saXN0ID0gMDsKPiA+PiA+ICAgICAgICAgICAg
ICB9Cj4gPj4gPiAgICAgICAgICAgICAgZWxzZQo+ID4+ID4gICAgICAgICAgICAgIHsKPiA+PiA+
IEBAIC0yODMsNiArMzA4LDcgQEAgaW50IHB0X3VwZGF0ZV9pcnEoc3RydWN0IHZjcHUgKnYpCj4g
Pj4gPiAgICAgIGlmICggZWFybGllc3RfcHQgPT0gTlVMTCApCj4gPj4gPiAgICAgIHsKPiA+PiA+
ICAgICAgICAgIHNwaW5fdW5sb2NrKCZ2LT5hcmNoLmh2bV92Y3B1LnRtX2xvY2spOwo+ID4+ID4g
KyAgICAgICAgZXhlY3V0ZV9jYWxsYmFja3ModiwgJnB1cmdlZCk7Cj4gPj4gCj4gPj4gSXQgd291
bGQgYmUgYmV0dGVyIHRvIGNoZWNrIGlmIHRoZSBsaXN0IGlzIG5vdCBlbXB0eSBiZWZvcmUgY2Fs
bGluZyB0aGUKPiA+PiBmdW5jdGlvbiB0byBhdm9pZCB0aGUgZXh0cmEgbG9jayAvIHVubG9jay4K
PiA+IAo+ID4gVGhlIGxvY2sgaXMgYWxzbyBwcm90ZWN0aW5nIHRoZSAncHVyZ2VkJyBsaXN0LCBz
byBJIHRoaW5rIHRoYXQgZm9yCj4gPiBjb25zaXN0ZW5jeSB0aGUgbG9jayBuZWVkcyB0byBiZSBo
ZWxkIGJlZm9yZSBhY2Nlc3NpbmcgaXQuCj4gCj4gQnV0IHRoYXQncyBhIGxvY2FsIGxpc3QsIGlz
bid0IGl0PyBOby1vbmUgZWxzZSBjYW4gYWNjZXNzIGl0LgoKZGVzdHJveV9wZXJpb2RpY190aW1l
IGNhbiBzdGlsbCByZW1vdmUgaXRlbXMgZnJvbSB0aGlzIGxpc3QsIGlmIGEKdGltZXIgdGhhdCdz
IG9uIHRoZSAncHVyZ2VkJyBsaXN0IGlzIGRlc3Ryb3llZCBiZXR3ZWVuIGFkZGVkIHRvIHRoZQps
aXN0IGFuZCBleGVjdXRpbmcgdGhlIGNhbGxiYWNrLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
