From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86: use invpcid to do global flushing
Date: Mon, 05 Mar 2018 06:24:37 -0700
Message-ID: <5A9D532502000078001AE87E@prv-mh.provo.novell.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
 <20180305095032.30062-3-wei.liu2@citrix.com>
 <5A9D38B102000078001AE77E@prv-mh.provo.novell.com>
 <14aeecce-d1fc-1671-473c-63a05f8ccd4c@citrix.com>
 <8952c717-ef99-7f79-4645-1a7fbed8aa7d@suse.com>
 <49504621-3129-3b42-46fe-aa7336bf318b@citrix.com>
 <5A9D4C1A02000078001AE816@prv-mh.provo.novell.com>
 <4359ed8b-6b6f-66fb-564a-cd86879a85b5@citrix.com>
 <e131c9c9-bd38-03fa-8279-fbc3fe4f4b8d@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zn8f=f3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1esq6d-00085d-GB
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 13:24:43 +0000
In-Reply-To: <e131c9c9-bd38-03fa-8279-fbc3fe4f4b8d@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAzLjE4IGF0IDE0OjExLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
NS8wMy8xOCAxMzo1NywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gV2hlbiB3ZSBzdGFydCB1c2lu
ZyBQQ0lEIGZvciB1c2VyIG1hcHBpbmdzLCB0aGVuIHdlIGRvbid0IG5lZWQgdGhlbSB0bwo+PiBi
ZSBnbG9iYWwsIGF0IHdoaWNoIHBvaW50IHdlIGNhbiByZXF1aXJlL2V4cGVjdCB0aGF0IHRoZSBv
bmx5IGdsb2JhbAo+PiBtYXBwaW5ncyBhcmUgaHlwZXJ2aXNvciBvbmVzIHdoaWNoIHdlIGV4cGVj
dCB0byByZW1haW4gY29ycmVjdCBhY3Jvc3MgYQo+PiB3cml0ZSB0byBjcjMuICBIb3dldmVyLCBp
ZiB3ZSBkbyB0aGlzLCB0aGVuIHdlIG5lZWQgdG8gdXNlIGEgYml0IG90aGVyCj4+IHRoYW4gUEFH
RV9HTE9CQUwgdG8gc2lnbmlmeSBndWVzdCB1c2VyIG1hcHBpbmdzLgo+PiAKPj4gSSB0aGluayB0
aGlzIGlzIGRvYWJsZSwgYnV0IEkgZG9uJ3QgdGhpbmsgaXQgaXMgZ29pbmcgdG8gYmUgdHJpdmlh
bCB0bwo+PiBnZXQgY29ycmVjdC4KPiAKPiBXaHkgd291bGQgd2Ugd2FudCB0byBrZWVwIGFueSBn
bG9iYWwgbWFwcGluZ3MgYXQgYWxsPyBXaGF0IGFyZSB0aGV5IGdvb2QKPiBmb3I/IFRvZGF5IHRo
ZSBvbmx5IGNhc2UgSSBjb3VsZCBmaW5kIHdoZXJlIHRoZXkgbWFrZSBzZW5zZSBhdCBhbGwgaXMK
PiBmb3IgNjQtYml0IHB2LWd1ZXN0cyB0byBrZWVwIGh5cGVydmlzb3IgbWFwcGluZ3MgaW4gdGhl
IFRMQiB3aGVuIHRoZQo+IGd1ZXN0IGlzIHN3aXRjaGluZyBiZXR3ZWVuIHVzZXIgYW5kIGtlcm5l
bCBtb2RlLgoKSHlwZXJ2aXNvciBhbmQgZ3Vlc3QgdXNlciBtYXBwaW5ncywgdGhhdCBpcy4KCkph
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
