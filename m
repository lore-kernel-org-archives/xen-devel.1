From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] x86: use invpcid to do global flushing
Date: Mon, 5 Mar 2018 13:40:36 +0000
Message-ID: <89201233-4e3f-20d7-6101-95b4c11d0c09@citrix.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
 <20180305095032.30062-3-wei.liu2@citrix.com>
 <5A9D38B102000078001AE77E@prv-mh.provo.novell.com>
 <14aeecce-d1fc-1671-473c-63a05f8ccd4c@citrix.com>
 <8952c717-ef99-7f79-4645-1a7fbed8aa7d@suse.com>
 <49504621-3129-3b42-46fe-aa7336bf318b@citrix.com>
 <5A9D4C1A02000078001AE816@prv-mh.provo.novell.com>
 <4359ed8b-6b6f-66fb-564a-cd86879a85b5@citrix.com>
 <e131c9c9-bd38-03fa-8279-fbc3fe4f4b8d@suse.com>
 <5A9D532502000078001AE87E@prv-mh.provo.novell.com>
 <20180305133134.wwhuzeabzvmy2zaz@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fc0z=f3=citrix.com=prvs=595eaad67=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1esqMa-0001Y9-J6
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 13:41:12 +0000
In-Reply-To: <20180305133134.wwhuzeabzvmy2zaz@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMTggMTM6MzEsIFdlaSBMaXUgd3JvdGU6Cj4gT24gTW9uLCBNYXIgMDUsIDIwMTgg
YXQgMDY6MjQ6MzdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA1LjAzLjE4
IGF0IDE0OjExLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IE9uIDA1LzAzLzE4IDEzOjU3
LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+IFdoZW4gd2Ugc3RhcnQgdXNpbmcgUENJRCBmb3Ig
dXNlciBtYXBwaW5ncywgdGhlbiB3ZSBkb24ndCBuZWVkIHRoZW0gdG8KPj4+PiBiZSBnbG9iYWws
IGF0IHdoaWNoIHBvaW50IHdlIGNhbiByZXF1aXJlL2V4cGVjdCB0aGF0IHRoZSBvbmx5IGdsb2Jh
bAo+Pj4+IG1hcHBpbmdzIGFyZSBoeXBlcnZpc29yIG9uZXMgd2hpY2ggd2UgZXhwZWN0IHRvIHJl
bWFpbiBjb3JyZWN0IGFjcm9zcyBhCj4+Pj4gd3JpdGUgdG8gY3IzLiAgSG93ZXZlciwgaWYgd2Ug
ZG8gdGhpcywgdGhlbiB3ZSBuZWVkIHRvIHVzZSBhIGJpdCBvdGhlcgo+Pj4+IHRoYW4gUEFHRV9H
TE9CQUwgdG8gc2lnbmlmeSBndWVzdCB1c2VyIG1hcHBpbmdzLgo+Pj4+Cj4+Pj4gSSB0aGluayB0
aGlzIGlzIGRvYWJsZSwgYnV0IEkgZG9uJ3QgdGhpbmsgaXQgaXMgZ29pbmcgdG8gYmUgdHJpdmlh
bCB0bwo+Pj4+IGdldCBjb3JyZWN0Lgo+Pj4gV2h5IHdvdWxkIHdlIHdhbnQgdG8ga2VlcCBhbnkg
Z2xvYmFsIG1hcHBpbmdzIGF0IGFsbD8gV2hhdCBhcmUgdGhleSBnb29kCj4+PiBmb3I/IFRvZGF5
IHRoZSBvbmx5IGNhc2UgSSBjb3VsZCBmaW5kIHdoZXJlIHRoZXkgbWFrZSBzZW5zZSBhdCBhbGwg
aXMKPj4+IGZvciA2NC1iaXQgcHYtZ3Vlc3RzIHRvIGtlZXAgaHlwZXJ2aXNvciBtYXBwaW5ncyBp
biB0aGUgVExCIHdoZW4gdGhlCj4+PiBndWVzdCBpcyBzd2l0Y2hpbmcgYmV0d2VlbiB1c2VyIGFu
ZCBrZXJuZWwgbW9kZS4KPj4gSHlwZXJ2aXNvciBhbmQgZ3Vlc3QgdXNlciBtYXBwaW5ncywgdGhh
dCBpcy4KPj4KPiBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHRoZSByYXRpb25hbGUgYmVoaW5k
IGdsb2JhbCBndWVzdCBtYXBwaW5ncy4gSXMKPiBpdCB0byBrZWVwIGd1ZXN0IHVzZXIgbWFwcGlu
Z3Mgd2hlbiBzd2l0Y2hpbmcgdG8gZ3Vlc3Qga2VybmVsIG1vZGU/CgpZZXMgLSBpdCBpcyBhIHBl
cmZvcm1hbmNlIG9wdGltaXNhdGlvbiBzbyBvbiBndWVzdCB1c2VyID0+IGd1ZXN0IGtlcm5lbApj
b250ZXh0IHN3aXRjaCwgZ3Vlc3QgdXNlciBtYXBwaW5ncyBhcmUgc3RpbGwgcHJlc2VudCBpbiB0
aGUgVExCLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
