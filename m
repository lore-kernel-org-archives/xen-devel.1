From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 1/3] x86/vpt: execute callbacks for
 masked interrupts
Date: Mon, 26 Feb 2018 06:04:51 -0700
Message-ID: <5A94140302000078001ABCA4@prv-mh.provo.novell.com>
References: <20180223132743.59804-1-roger.pau@citrix.com>
 <20180223132743.59804-2-roger.pau@citrix.com>
 <20180226123554.ep76zgkatb2zswv4@citrix.com>
 <20180226124810.77uqvmdm7nodm32f@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=uzez=fu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eqISk-0006Wg-Ti
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 13:05:02 +0000
In-Reply-To: <20180226124810.77uqvmdm7nodm32f@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Stefan Bader <stefan.bader@canonical.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAyLjE4IGF0IDEzOjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgRmViIDI2LCAyMDE4IGF0IDEyOjM1OjU0UE0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6
Cj4+IE9uIEZyaSwgRmViIDIzLCAyMDE4IGF0IDAxOjI3OjQxUE0gKzAwMDAsIFJvZ2VyIFBhdSBN
b25uZSB3cm90ZToKPj4gPiAgaW50IHB0X3VwZGF0ZV9pcnEoc3RydWN0IHZjcHUgKnYpCj4+ID4g
IHsKPj4gPiAgICAgIHN0cnVjdCBsaXN0X2hlYWQgKmhlYWQgPSAmdi0+YXJjaC5odm1fdmNwdS50
bV9saXN0Owo+PiA+ICsgICAgTElTVF9IRUFEKHB1cmdlZCk7Cj4+IAo+PiB0b19wdXJnZT8KPiAK
PiBNeSBwb2ludCBpcyB0aGF0IHRoZXkgaGF2ZSBhbHJlYWR5IGJlZW4gcHVyZ2VkIGZyb20gdGhl
IHB0LT5saXN0LCBidXQKPiBJIHJlYWxseSBkb24ndCBoYXZlIGEgcHJlZmVyZW5jZS4KPiAKPj4g
PiAgICAgIHN0cnVjdCBwZXJpb2RpY190aW1lICpwdCwgKnRlbXAsICplYXJsaWVzdF9wdDsKPj4g
PiAgICAgIHVpbnQ2NF90IG1heF9sYWc7Cj4+ID4gICAgICBpbnQgaXJxLCBpc19sYXBpYywgcHRf
dmVjdG9yOwo+PiA+IEBAIC0yNjcsNyArMjg5LDEwIEBAIGludCBwdF91cGRhdGVfaXJxKHN0cnVj
dCB2Y3B1ICp2KQo+PiA+ICAgICAgICAgICAgICB7Cj4+ID4gICAgICAgICAgICAgICAgICAvKiBz
dXNwZW5kIHRpbWVyIGVtdWxhdGlvbiAqLwo+PiA+ICAgICAgICAgICAgICAgICAgbGlzdF9kZWwo
JnB0LT5saXN0KTsKPj4gPiAtICAgICAgICAgICAgICAgIHB0LT5vbl9saXN0ID0gMDsKPj4gPiAr
ICAgICAgICAgICAgICAgIGlmICggcHQtPmNiICkKPj4gPiArICAgICAgICAgICAgICAgICAgICBs
aXN0X2FkZCgmcHQtPmxpc3QsICZwdXJnZWQpOwo+PiA+ICsgICAgICAgICAgICAgICAgZWxzZQo+
PiA+ICsgICAgICAgICAgICAgICAgICAgIHB0LT5vbl9saXN0ID0gMDsKPj4gPiAgICAgICAgICAg
ICAgfQo+PiA+ICAgICAgICAgICAgICBlbHNlCj4+ID4gICAgICAgICAgICAgIHsKPj4gPiBAQCAt
MjgzLDYgKzMwOCw3IEBAIGludCBwdF91cGRhdGVfaXJxKHN0cnVjdCB2Y3B1ICp2KQo+PiA+ICAg
ICAgaWYgKCBlYXJsaWVzdF9wdCA9PSBOVUxMICkKPj4gPiAgICAgIHsKPj4gPiAgICAgICAgICBz
cGluX3VubG9jaygmdi0+YXJjaC5odm1fdmNwdS50bV9sb2NrKTsKPj4gPiArICAgICAgICBleGVj
dXRlX2NhbGxiYWNrcyh2LCAmcHVyZ2VkKTsKPj4gCj4+IEl0IHdvdWxkIGJlIGJldHRlciB0byBj
aGVjayBpZiB0aGUgbGlzdCBpcyBub3QgZW1wdHkgYmVmb3JlIGNhbGxpbmcgdGhlCj4+IGZ1bmN0
aW9uIHRvIGF2b2lkIHRoZSBleHRyYSBsb2NrIC8gdW5sb2NrLgo+IAo+IFRoZSBsb2NrIGlzIGFs
c28gcHJvdGVjdGluZyB0aGUgJ3B1cmdlZCcgbGlzdCwgc28gSSB0aGluayB0aGF0IGZvcgo+IGNv
bnNpc3RlbmN5IHRoZSBsb2NrIG5lZWRzIHRvIGJlIGhlbGQgYmVmb3JlIGFjY2Vzc2luZyBpdC4K
CkJ1dCB0aGF0J3MgYSBsb2NhbCBsaXN0LCBpc24ndCBpdD8gTm8tb25lIGVsc2UgY2FuIGFjY2Vz
cyBpdC4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
