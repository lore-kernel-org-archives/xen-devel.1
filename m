From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Question about patch "svm: fix incorrect TSC
 scaling"
Date: Tue, 29 May 2018 07:40:54 -0600
Message-ID: <5B0D586602000078001C6A53@prv1-mh.provo.novell.com>
References: <386b302f-c1f3-49fa-9276-9db826401912@default>
 <5B0D23D002000078001C67F9@prv1-mh.provo.novell.com>
 <0a292fa2-6ab6-f343-e9e9-85284a31e269@oracle.com>
 <d7b61830-2b81-4dc0-bbab-a409c7ff5dda@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gyld=iq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fNfV6-0002Cg-Lc
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 14:21:24 +0000
In-Reply-To: <d7b61830-2b81-4dc0-bbab-a409c7ff5dda@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: Haozhong Zhang <haozhong.zhang@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, brian.woods@amd.com, Joao Martins <joao.m.martins@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA1LjE4IGF0IDEyOjMxLCA8ZG9uZ2xpLnpoYW5nQG9yYWNsZS5jb20+IHdyb3Rl
OgoKPiAKPiBPbiAwNS8yOS8yMDE4IDA2OjIzIFBNLCBEb25nbGkgWmhhbmcgd3JvdGU6Cj4+IAo+
PiAKPj4gT24gMDUvMjkvMjAxOCAwNTo1NiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBP
biAyOC4wNS4xOCBhdCAxNDoyNSwgPGRvbmdsaS56aGFuZ0BvcmFjbGUuY29tPiB3cm90ZToKPj4+
PiBJIGFtIHdyaXRpbmcgdG8gYXNrIGFib3V0IGJlbG93IHBhdGNoIGFzIEkgYW0gbm90IGZhbWls
aWFyIHdpdGggQU1EIHRzYwo+Pj4+IHNjYWxpbmc6Cj4+Pj4KPj4+PiAgY29tbWl0IDExZWVjYTY1
MTI2ZTUxZjAzYTg4MzkwNzc1MWQ1Y2NiZTRmMzVhYTMKPj4+PiAgQXV0aG9yOiBIYW96aG9uZyBa
aGFuZyA8aGFvemhvbmcuemhhbmdAaW50ZWwuY29tPgo+Pj4+ICBEYXRlOiAgIFR1ZSBEZWMgOCAw
OTo0NjoxMiAyMDE1ICswMTAwCj4+Pj4KPj4+PiAgICAgIHN2bTogZml4IGluY29ycmVjdCBUU0Mg
c2NhbGluZwo+Pj4+ICAKPj4+PiAgICAgIFNWTSBUU0MgcmF0aW8gaXMgaW5jb3JyZWN0bHkgdXNl
ZCBpbiB0aGUgY3VycmVudAo+Pj4+ICAgICAgc3ZtX2dldF90c2Nfb2Zmc2V0KCkuIFRoaXMgcGF0
Y2ggcmVwbGFjZXMgdGhlIHNjYWxpbmcgbG9naWMgaW4KPj4+PiAgICAgIHN2bV9nZXRfdHNjX29m
ZnNldCgpIHdpdGggYSBjb3JyZWN0IGltcGxlbWVudGF0aW9uLgo+Pj4+ICAKPj4+PiAgICAgIFNp
Z25lZC1vZmYtYnk6IEhhb3pob25nIFpoYW5nIDxoYW96aG9uZy56aGFuZ0BpbnRlbC5jb20+Cj4+
Pj4gICAgICBSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3Jh
Y2xlLmNvbT4KPj4+Pgo+Pj4+Cj4+Pj4gVGhlIGJlbG93IGVxdWF0aW9uIGlzIHVzZWQgaW4gdGhl
IGFib3ZlIHBhdGNoOgo+Pj4+Cj4+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4+IGhv
c3RfdHNjICogcmF0aW8gKiAyXi0zMi4KPj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
Cj4gSW5kZWVkLCBJIGhhdmUgYW4gZXh0cmEgcXVlc3Rpb24gdGhhdCB3aHkgMl4tMzIgaXMgaW52
b2x2ZWQgaGVyZT8KPiAKPiBJcyBpdCBiZWNhdXNlIHdlIHdvdWxkIGxpa2UgdG8gaWdub3JlIHRo
ZSBmcmFnIHBhcnQgYW5kIG9ubHkgY29uc2lkZXIgdGhlCj4gbGVhZGluZyBpbnRlZ2VyIHBhcnQ/
IFdoeSBub3QganVzdCB1c2UgImhvc3RfdHNjICogcmF0aW8iPwoKUXVvdGluZyB0aGUgUE06ICJU
aGUgVFNDIFJhdGlvIE1TUiBzcGVjaWZpZXMgdGhlIFRTQ1JhdGlvIHZhbHVlIGFzIGEKZml4ZWQt
cG9pbnQgYmluYXJ5IG51bWJlciBpbiA4LjMyIGZvcm1hdCwgLi4uIiBJT1cgdGhpcyBpcyB0byBj
b252ZXJ0CnJhdGlvIGZyb20gaXRzIHByZXNlbnRhdGlvbiAodWludDY0X3QpIHRvIGl0cyBwdXJw
b3NlIChhIGZpeGVkIHBvaW50IHZhbHVlCndpdGggOCBbcmVhbGx5IDMyXSBiaXRzIHJlcHJlc2Vu
dGluZyB0aGUgaW50ZWdlciBwYXJ0IGFuZCAzMiBiaXRzIG9mCmZyYWN0aW9uKS4gV2UgdmVyeSBj
ZXJ0YWlubHkgZG9uJ3Qgd2FudCB0byBpZ25vcmUgdGhlIGZyYWN0aW9uYWwgcGFydC4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
