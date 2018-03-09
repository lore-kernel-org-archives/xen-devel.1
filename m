From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] Move missing items from
 docs/misc/qemu-xen-security to SUPPORT.md
Date: Fri, 09 Mar 2018 03:08:32 -0700
Message-ID: <5AA26B3002000078001B01C0@prv-mh.provo.novell.com>
References: <20180308173719.14791-1-lars.kurth@citrix.com>
 <23201.30331.17592.424886@mariner.uk.xensource.com>
 <8473046C-FDDE-436E-963C-2965F183F013@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ibp0=f7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1euEx5-0007ZP-1g
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 10:08:39 +0000
In-Reply-To: <8473046C-FDDE-436E-963C-2965F183F013@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: Ian Jackson <Ian.Jackson@citrix.com>, "committers@xenproject.org" <committers@xenproject.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAzLjE4IGF0IDE5OjA3LCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToK
PiDvu79PbiAwOC8wMy8yMDE4LCAxODo0NCwgIklhbiBKYWNrc29uIiA8aWFuLmphY2tzb25AY2l0
cml4LmNvbT4gd3JvdGU6Cj4gCj4gICAgIExhcnMgS3VydGggd3JpdGVzICgiW1BBVENIXSBNb3Zl
IG1pc3NpbmcgaXRlbXMgZnJvbSBkb2NzL21pc2MvcWVtdS14ZW4tc2VjdXJpdHkgdG8gU1VQUE9S
VC5tZCIpOgo+ICAgICA+IHg4Ni9FbXVsYXRlZCBwbGF0Zm9ybSBkZXZpY2VzIChRRU1VKToKPiAg
ICAgPiAtIEFkZWQgUENJIGhvc3QgYnJpZGdlIChhcyBpbiB4ZW4uZ2l0OmRvY3MvbWlzYy9xZW11
LXhlbi1zZWN1cml0eSkKPiAgICAgPiBOZXc6IHg4Ni9FbXVsYXRlZCBTdG9yYWdlIEltYWdlIEZv
cm1hdHMKPiAgICAgPiAtIEFkZGVkIHJhdywgcWNvdywgcWNvdzIsIHZoZCAoYXMgaW4geGVuLmdp
dDpkb2NzL21pc2MvcWVtdS14ZW4tc2VjdXJpdHkpCj4gICAgID4geDg2L0VtdWxhdGVkIGdyYXBo
aWNzIChRRU1VKQo+ICAgICA+IC0gRml4ZWQgdHlwbyAoc3RkdmdhKQo+ICAgICA+IC0gQWRkZWQg
eGVuZmIgKGFzIGluIHhlbi5naXQ6ZG9jcy9taXNjL3FlbXUteGVuLXNlY3VyaXR5KQo+ICAgICA+
IHg4Ni9FbXVsYXRlZCBpbnB1dCAoUUVNVSk6Cj4gICAgID4gLSBBZGRlZCB4ZW5mYiBrZXlib2Fy
ZC9tb3VzZSAoYXMgaW4geGVuLmdpdDpkb2NzL21pc2MvcWVtdS14ZW4tc2VjdXJpdHkpCj4gICAg
ID4gCj4gICAgID4gRGVsZXRlIHhlbi5naXQ6ZG9jcy9taXNjL3FlbXUteGVuLXNlY3VyaXR5IGFz
IG5vdyBub3QgbmVlZGVkCj4gICAgIAo+ICAgICBMR1RNLiAgVGhhbmtzLgo+ICAgICAKPiAgICAg
QWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+ICAgICAK
PiAgICAgV2Ugc2hvdWxkIHdhaXQgYSBiaXQgd2l0aCBjb21taXR0aW5nIGluIGNhc2Ugc29tZW9u
ZSB3YW50cyB0byBvYmplY3QKPiAgICAgZm9yIHNvbWUgcmVhc29uLi4uCj4gICAgIAo+ICAgICBJ
YW4uCj4gICAgCj4gQEphbjogdGhpcyBzaG91bGQgYmUgYmFja3BvcnRlZCB0byA0LjEwIGFsc28K
CkknbGwgdHJ5IHRvIHJlbWVtYmVyIHRoYXQsIGJ1dCBsZXQncyBmaXJzdCBnZXQgaXQgaW50byBt
YXN0ZXIgKGFuZCBhcwp5b3UndmUgbGlrZWx5IHNlZW4sIEknbSBub3QgZW50aXJlbHkgaGFwcHkg
d2l0aCB0aGlzIGZpcnN0IHZlcnNpb24pLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
