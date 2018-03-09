From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] Move missing items from
 docs/misc/qemu-xen-security to SUPPORT.md
Date: Fri, 9 Mar 2018 10:32:23 +0000
Message-ID: <f3c5d615-84e6-0796-705b-26450f2894a4@citrix.com>
References: <20180308173719.14791-1-lars.kurth@citrix.com>
 <23201.30331.17592.424886@mariner.uk.xensource.com>
 <8473046C-FDDE-436E-963C-2965F183F013@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zp9h=f7=citrix.com=prvs=599713481=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1euFK7-00022m-32
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 10:32:27 +0000
In-Reply-To: <8473046C-FDDE-436E-963C-2965F183F013@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "committers@xenproject.org" <committers@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDgvMjAxOCAwNjowNyBQTSwgTGFycyBLdXJ0aCB3cm90ZToKPiAKPiDvu79PbiAwOC8w
My8yMDE4LCAxODo0NCwgIklhbiBKYWNrc29uIiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gCj4gICAgIExhcnMgS3VydGggd3JpdGVzICgiW1BBVENIXSBNb3ZlIG1pc3NpbmcgaXRl
bXMgZnJvbSBkb2NzL21pc2MvcWVtdS14ZW4tc2VjdXJpdHkgdG8gU1VQUE9SVC5tZCIpOgo+ICAg
ICA+IHg4Ni9FbXVsYXRlZCBwbGF0Zm9ybSBkZXZpY2VzIChRRU1VKToKPiAgICAgPiAtIEFkZWQg
UENJIGhvc3QgYnJpZGdlIChhcyBpbiB4ZW4uZ2l0OmRvY3MvbWlzYy9xZW11LXhlbi1zZWN1cml0
eSkKPiAgICAgPiBOZXc6IHg4Ni9FbXVsYXRlZCBTdG9yYWdlIEltYWdlIEZvcm1hdHMKPiAgICAg
PiAtIEFkZGVkIHJhdywgcWNvdywgcWNvdzIsIHZoZCAoYXMgaW4geGVuLmdpdDpkb2NzL21pc2Mv
cWVtdS14ZW4tc2VjdXJpdHkpCj4gICAgID4geDg2L0VtdWxhdGVkIGdyYXBoaWNzIChRRU1VKQo+
ICAgICA+IC0gRml4ZWQgdHlwbyAoc3RkdmdhKQo+ICAgICA+IC0gQWRkZWQgeGVuZmIgKGFzIGlu
IHhlbi5naXQ6ZG9jcy9taXNjL3FlbXUteGVuLXNlY3VyaXR5KQo+ICAgICA+IHg4Ni9FbXVsYXRl
ZCBpbnB1dCAoUUVNVSk6Cj4gICAgID4gLSBBZGRlZCB4ZW5mYiBrZXlib2FyZC9tb3VzZSAoYXMg
aW4geGVuLmdpdDpkb2NzL21pc2MvcWVtdS14ZW4tc2VjdXJpdHkpCj4gICAgID4gCj4gICAgID4g
RGVsZXRlIHhlbi5naXQ6ZG9jcy9taXNjL3FlbXUteGVuLXNlY3VyaXR5IGFzIG5vdyBub3QgbmVl
ZGVkCj4gICAgIAo+ICAgICBMR1RNLiAgVGhhbmtzLgo+ICAgICAKPiAgICAgQWNrZWQtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+ICAgICAKPiAgICAgV2Ugc2hv
dWxkIHdhaXQgYSBiaXQgd2l0aCBjb21taXR0aW5nIGluIGNhc2Ugc29tZW9uZSB3YW50cyB0byBv
YmplY3QKPiAgICAgZm9yIHNvbWUgcmVhc29uLi4uCj4gICAgIAo+ICAgICBJYW4uCj4gICAgCj4g
QEphbjogdGhpcyBzaG91bGQgYmUgYmFja3BvcnRlZCB0byA0LjEwIGFsc28KCkkgdGhpbmsgd2Ug
c2hvdWxkIGJhY2twb3J0IGFueSB1cGRhdGVzIHRvIFNVUFBPUlQubWQsIGJ1dCBJIGRvbid0IHRo
aW5rCndlIHNob3VsZCByZW1vdmUgcWVtdS14ZW4tc2VjdXJpdHkgaW4gNC4xMC4gIFRoYXQncyBu
b3QgdGhlIGtpbmQgb2YKdGhpbmcgd2Ugc2hvdWxkIHJlYWxseSBkZWxldGUgaW4gYSBwb2ludCBy
ZWxlYXNlLgoKTGFycywgbWF5YmUgd2hlbiB5b3UgcmUtc3VibWl0IHlvdSBjb3VsZCBtYWtlIHRo
aXMgdHdvIHBhdGNoZXMgLS0gb25lIHRvCnVwZGF0ZSBTVVBQT1JULm1kICh3aGljaCB3b3VsZCBi
ZSBiYWNrcG9ydGVkKSBhbmQgb25lIHRvIHJlbW92ZQpxZW11LXhlbi1zZWN1cml0eSAod2hpY2gg
d291bGQgbm90IGJlKT8KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
