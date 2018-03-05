From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86: use invpcid to do global flushing
Date: Mon, 05 Mar 2018 06:44:31 -0700
Message-ID: <5A9D57CF02000078001AE8B3@prv-mh.provo.novell.com>
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
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zn8f=f3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1esqPz-0001q4-Od
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 13:44:43 +0000
In-Reply-To: <20180305133134.wwhuzeabzvmy2zaz@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAzLjE4IGF0IDE0OjMxLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBNYXIgMDUsIDIwMTggYXQgMDY6MjQ6MzdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAwNS4wMy4xOCBhdCAxNDoxMSwgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6
Cj4+ID4gT24gMDUvMDMvMTggMTM6NTcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+ID4+IFdoZW4g
d2Ugc3RhcnQgdXNpbmcgUENJRCBmb3IgdXNlciBtYXBwaW5ncywgdGhlbiB3ZSBkb24ndCBuZWVk
IHRoZW0gdG8KPj4gPj4gYmUgZ2xvYmFsLCBhdCB3aGljaCBwb2ludCB3ZSBjYW4gcmVxdWlyZS9l
eHBlY3QgdGhhdCB0aGUgb25seSBnbG9iYWwKPj4gPj4gbWFwcGluZ3MgYXJlIGh5cGVydmlzb3Ig
b25lcyB3aGljaCB3ZSBleHBlY3QgdG8gcmVtYWluIGNvcnJlY3QgYWNyb3NzIGEKPj4gPj4gd3Jp
dGUgdG8gY3IzLiAgSG93ZXZlciwgaWYgd2UgZG8gdGhpcywgdGhlbiB3ZSBuZWVkIHRvIHVzZSBh
IGJpdCBvdGhlcgo+PiA+PiB0aGFuIFBBR0VfR0xPQkFMIHRvIHNpZ25pZnkgZ3Vlc3QgdXNlciBt
YXBwaW5ncy4KPj4gPj4gCj4+ID4+IEkgdGhpbmsgdGhpcyBpcyBkb2FibGUsIGJ1dCBJIGRvbid0
IHRoaW5rIGl0IGlzIGdvaW5nIHRvIGJlIHRyaXZpYWwgdG8KPj4gPj4gZ2V0IGNvcnJlY3QuCj4+
ID4gCj4+ID4gV2h5IHdvdWxkIHdlIHdhbnQgdG8ga2VlcCBhbnkgZ2xvYmFsIG1hcHBpbmdzIGF0
IGFsbD8gV2hhdCBhcmUgdGhleSBnb29kCj4+ID4gZm9yPyBUb2RheSB0aGUgb25seSBjYXNlIEkg
Y291bGQgZmluZCB3aGVyZSB0aGV5IG1ha2Ugc2Vuc2UgYXQgYWxsIGlzCj4+ID4gZm9yIDY0LWJp
dCBwdi1ndWVzdHMgdG8ga2VlcCBoeXBlcnZpc29yIG1hcHBpbmdzIGluIHRoZSBUTEIgd2hlbiB0
aGUKPj4gPiBndWVzdCBpcyBzd2l0Y2hpbmcgYmV0d2VlbiB1c2VyIGFuZCBrZXJuZWwgbW9kZS4K
Pj4gCj4+IEh5cGVydmlzb3IgYW5kIGd1ZXN0IHVzZXIgbWFwcGluZ3MsIHRoYXQgaXMuCj4+IAo+
IAo+IEknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgdGhlIHJhdGlvbmFsZSBiZWhpbmQgZ2xvYmFs
IGd1ZXN0IG1hcHBpbmdzLiBJcwo+IGl0IHRvIGtlZXAgZ3Vlc3QgdXNlciBtYXBwaW5ncyB3aGVu
IHN3aXRjaGluZyB0byBndWVzdCBrZXJuZWwgbW9kZT8KClllcywgZXhhY3RseSAoYW5kIGVzcGVj
aWFsbHkgd2hlbiAtIGxpa2UgZm9yIHNvbWUgc3lzY2FsbHMgLSB0aGVyZSdzCmEgZmFzdCB1c2Vy
LT5rZXJuZWwtPnVzZXIgcm91bmQgdHJpcCkuIFRoZSBnb2FsIGlzIHRvIGF2b2lkIGF0IGxlYXN0
CnNvbWUgb2YgdGhlIFRMQiByZWxvYWRzLCB3aGVuIHdlIGFscmVhZHkgY2FuJ3QgaGF2ZSBnbG9i
YWwgZ3Vlc3QKa2VybmVsIG1hcHBpbmdzLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
