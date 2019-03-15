From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86/e820: fix build with gcc9
Date: Fri, 15 Mar 2019 16:07:03 +0000
Message-ID: <3130469f-2e88-ce93-198d-3a5214c89e40@citrix.com>
References: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
 <5C80F30F020000780021C623@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OIle=RS=citrix.com=prvs=970d66146=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h4pdd-0007qO-18
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 16:24:53 +0000
In-Reply-To: <5C80F30F020000780021C623@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Charles Arnold <CARNOLD@suse.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDMvMjAxOSAxMDozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gZTgyMC5jOiBJbiBmdW5j
dGlvbiDigJhjbGlwX3RvX2xpbWl04oCZOgo+IC4uLi94ZW4vaW5jbHVkZS9hc20vc3RyaW5nLmg6
MTA6MjY6IGVycm9yOiDigJhfX2J1aWx0aW5fbWVtbW92ZeKAmSBvZmZzZXQgWy0xNiwgLTM2XSBp
cyBvdXQgb2YgdGhlIGJvdW5kcyBbMCwgMjA0ODRdIG9mCj4gb2JqZWN0IOKAmGU4MjDigJkgd2l0
aCB0eXBlIOKAmHN0cnVjdCBlODIwbWFw4oCZIFstV2Vycm9yPWFycmF5LWJvdW5kc10KPiAgICAx
MCB8ICNkZWZpbmUgbWVtbW92ZShkLCBzLCBuKSBfX2J1aWx0aW5fbWVtbW92ZShkLCBzLCBuKQo+
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+Cj4gZTgyMC5jOjQwNDoxMzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmG1lbW1v
dmXigJkKPiAgIDQwNCB8ICAgICAgICAgICAgIG1lbW1vdmUoJmU4MjAubWFwW2ldLCAmZTgyMC5t
YXBbaSsxXSwKPiAgICAgICB8ICAgICAgICAgICAgIF5+fn5+fn4KPiBlODIwLmM6MzY6MTY6IG5v
dGU6IOKAmGU4MjDigJkgZGVjbGFyZWQgaGVyZQo+ICAgIDM2IHwgc3RydWN0IGU4MjBtYXAgZTgy
MDsKPiAgICAgICB8ICAgICAgICAgICAgICAgIF5+fn4KPgo+IFdoaWxlIEkgY2FuJ3Qgc2VlIHdo
ZXJlIHRoZSBuZWdhdGl2ZSBvZmZzZXRzIHdvdWxkIGNvbWUgZnJvbSwgY29udmVydGluZwo+IHRo
ZSBsb29wIGluZGV4IHRvIHVuc2lnbmVkIHR5cGUgaGVscHMuIFRha2UgdGhlIG9wcG9ydHVuaXR5
IGFuZCBhbHNvCj4gY29udmVydCBzZXZlcmFsIG90aGVyIGxvY2FsIHZhcmlhYmxlcyBhbmQgY29w
eV9lODIwX21hcCgpJ3Mgc2Vjb25kCj4gcGFyYW1ldGVyIHRvIHVuc2lnbmVkIGludCAoYW5kIGJv
b2wgaW4gb25lIGNhc2UpLgo+Cj4gUmVwb3J0ZWQtYnk6IENoYXJsZXMgQXJub2xkIDxjYXJub2xk
QHN1c2UuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiwg
d2l0aCBvbmUgcmVxdWVzdC4KCj4KPiAtLS0gYS94ZW4vYXJjaC94ODYvZTgyMC5jCj4gKysrIGIv
eGVuL2FyY2gveDg2L2U4MjAuYwo+IEBAIC0zMDQsNyArMzAwLDcgQEAgaW50IF9faW5pdCBzYW5p
dGl6ZV9lODIwX21hcChzdHJ1Y3QgZTgyMAo+ICAgKiB0aGlua3BhZCA1NjB4LCBmb3IgZXhhbXBs
ZSwgZG9lcyBub3QgY29vcGVyYXRlIHdpdGggdGhlIG1lbW9yeQo+ICAgKiBkZXRlY3Rpb24gY29k
ZS4pCj4gICAqLwo+IC1zdGF0aWMgaW50IF9faW5pdCBjb3B5X2U4MjBfbWFwKHN0cnVjdCBlODIw
ZW50cnkgKiBiaW9zbWFwLCBpbnQgbnJfbWFwKQo+ICtzdGF0aWMgaW50IF9faW5pdCBjb3B5X2U4
MjBfbWFwKHN0cnVjdCBlODIwZW50cnkgKiBiaW9zbWFwLCB1bnNpZ25lZCBpbnQgbnJfbWFwKQo+
ICB7Cj4gICAgICAvKiBPbmx5IG9uZSBtZW1vcnkgcmVnaW9uIChvciBuZWdhdGl2ZSk/IElnbm9y
ZSBpdCAqLwoKVGhpcyBjb21tZW50IGlzIG5vdyBzdGFsZS7CoCBJJ2QganVzdCBkcm9wIHRoZSBi
aXQgaW4gYnJhY2tldHMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
