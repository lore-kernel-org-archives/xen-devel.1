From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/2] x86: use invpcid to do global flushing
Date: Mon, 5 Mar 2018 13:31:34 +0000
Message-ID: <20180305133134.wwhuzeabzvmy2zaz@citrix.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yt/y=f3=citrix.com=prvs=595ca3bc4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1esqDQ-0000dd-4M
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 13:31:44 +0000
Content-Disposition: inline
In-Reply-To: <5A9D532502000078001AE87E@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMDUsIDIwMTggYXQgMDY6MjQ6MzdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA1LjAzLjE4IGF0IDE0OjExLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToK
PiA+IE9uIDA1LzAzLzE4IDEzOjU3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4+IFdoZW4gd2Ug
c3RhcnQgdXNpbmcgUENJRCBmb3IgdXNlciBtYXBwaW5ncywgdGhlbiB3ZSBkb24ndCBuZWVkIHRo
ZW0gdG8KPiA+PiBiZSBnbG9iYWwsIGF0IHdoaWNoIHBvaW50IHdlIGNhbiByZXF1aXJlL2V4cGVj
dCB0aGF0IHRoZSBvbmx5IGdsb2JhbAo+ID4+IG1hcHBpbmdzIGFyZSBoeXBlcnZpc29yIG9uZXMg
d2hpY2ggd2UgZXhwZWN0IHRvIHJlbWFpbiBjb3JyZWN0IGFjcm9zcyBhCj4gPj4gd3JpdGUgdG8g
Y3IzLiAgSG93ZXZlciwgaWYgd2UgZG8gdGhpcywgdGhlbiB3ZSBuZWVkIHRvIHVzZSBhIGJpdCBv
dGhlcgo+ID4+IHRoYW4gUEFHRV9HTE9CQUwgdG8gc2lnbmlmeSBndWVzdCB1c2VyIG1hcHBpbmdz
Lgo+ID4+IAo+ID4+IEkgdGhpbmsgdGhpcyBpcyBkb2FibGUsIGJ1dCBJIGRvbid0IHRoaW5rIGl0
IGlzIGdvaW5nIHRvIGJlIHRyaXZpYWwgdG8KPiA+PiBnZXQgY29ycmVjdC4KPiA+IAo+ID4gV2h5
IHdvdWxkIHdlIHdhbnQgdG8ga2VlcCBhbnkgZ2xvYmFsIG1hcHBpbmdzIGF0IGFsbD8gV2hhdCBh
cmUgdGhleSBnb29kCj4gPiBmb3I/IFRvZGF5IHRoZSBvbmx5IGNhc2UgSSBjb3VsZCBmaW5kIHdo
ZXJlIHRoZXkgbWFrZSBzZW5zZSBhdCBhbGwgaXMKPiA+IGZvciA2NC1iaXQgcHYtZ3Vlc3RzIHRv
IGtlZXAgaHlwZXJ2aXNvciBtYXBwaW5ncyBpbiB0aGUgVExCIHdoZW4gdGhlCj4gPiBndWVzdCBp
cyBzd2l0Y2hpbmcgYmV0d2VlbiB1c2VyIGFuZCBrZXJuZWwgbW9kZS4KPiAKPiBIeXBlcnZpc29y
IGFuZCBndWVzdCB1c2VyIG1hcHBpbmdzLCB0aGF0IGlzLgo+IAoKSSdtIG5vdCBzdXJlIEkgdW5k
ZXJzdGFuZCB0aGUgcmF0aW9uYWxlIGJlaGluZCBnbG9iYWwgZ3Vlc3QgbWFwcGluZ3MuIElzCml0
IHRvIGtlZXAgZ3Vlc3QgdXNlciBtYXBwaW5ncyB3aGVuIHN3aXRjaGluZyB0byBndWVzdCBrZXJu
ZWwgbW9kZT8KCihBIG5vcm1hbCBrZXJuZWwgbGlrZSBMaW51eCBtYWtlcyBnbG9iYWwga2VybmVs
IG1hcHBpbmdzLCBidXQgb2J2LiB3ZQpjYW4ndCBkbyB0aGF0IGluIDY0Yml0IFBWIGd1ZXN0cyBi
ZWNhdXNlIGtlcm5lbCBpcyBhbHNvIGluIHJpbmczLikKCldlaS4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
