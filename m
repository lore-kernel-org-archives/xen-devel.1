From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v8 07/11] vpci/bars: add handlers to map the
 BARs
Date: Wed, 28 Feb 2018 12:13:42 +0000
Message-ID: <20180228121342.vkc6b5hugn5prkmt@MacBook-Pro-de-Roger.local>
References: <5A905C0902000078001AB15D@prv-mh.provo.novell.com>
 <5A93FB8202000078001ABAE7@prv-mh.provo.novell.com>
 <20180226180018.tqpxlkdjsamr5c3g@MacBook-Pro-de-Roger.local>
 <5A9525A802000078001AC0B0@prv-mh.provo.novell.com>
 <20180227092133.fynrrw7327kxh7nr@MacBook-Pro-de-Roger.local>
 <5A953A9802000078001AC158@prv-mh.provo.novell.com>
 <20180227115707.ckah2etzzr3ia56p@MacBook-Pro-de-Roger.local>
 <5A9574FB02000078001AC436@prv-mh.provo.novell.com>
 <20180228112050.pdrp65ytqehzudoi@MacBook-Pro-de-Roger.local>
 <5A96A1B902000078001ACA9C@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=j/eq=fw=citrix.com=prvs=5902857c7=roger.pau@srs-us1.protection.inumbo.net>)
 id 1er0eA-0005Uq-Ny
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 12:15:46 +0000
Content-Disposition: inline
In-Reply-To: <5A96A1B902000078001ACA9C@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, AndrewCooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, BorisOstrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjgsIDIwMTggYXQgMDQ6MzQ6MDFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI4LjAyLjE4IGF0IDEyOjIwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gSSd2ZSBiZWVuIGdpdmluZyBzb21lIHRob3VnaHQgdG8gdGhpcywgYW5kIEkgY2Fu
bm90IGZpbmQgYSBnb29kCj4gPiBzb2x1dGlvbi4gU28gZmFyIHRoZSBsZXNzIHdvcnNlIG9uZSB3
b3VsZCBiZToKPiA+IAo+ID4gICAgICstLS0tLS0tLS0tLS0tLSsgIFlFUyAgKy0tLS0tLS0tLSsK
PiA+ICAgICB8SXMgYnJva2VuIHNldD98LS0tLS0tPnxObyBhY3Rpb258Cj4gPiAgICAgKy0tLS0t
LS0tLS0tLS0tKyAgICAgICArLS0tLS0tLS0tKwo+ID4gICAgICAgICAgfAo+ID4gICAgICAgICAg
fCBOTwo+ID4gCSB8Cj4gPiAgICAgKy0tLS12LS0tLSsgICBTVUNDRVNTICArLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tKwo+ID4gICAgIHxtYXAvdW5tYXArLS0tLS0tLS0tLS0tPkNo
YW5nZSBkZWNvZGluZyBvciBST00gZW5hYmxlIGJpdHwKPiA+ICAgICArLS0tLSstLS0tKyAgICAg
ICAgICAgICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rCj4gPiAgICAgICAgICB8
Cj4gPiAgICAgICAgICB8RkFJTFVSRQo+ID4gICAgICAgICAgfAo+ID4gKy0tLS0tLS0tdi0tLS0t
LS0tLS0tLS0tLS0rCj4gPiB8Q2xlYXIgbWVtb3J5IGRlY29kaW5nIGJpdHwKPiA+IHxTZXQgYnJv
a2VuICAgICAgICAgICAgICAgfAo+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rCj4gPiAK
PiA+IExldCBtZSBrbm93IHdoYXQgeW91IHRoaW5rIG9mIHRoaXMuCj4gCj4gTG9va3MgcmVhc29u
YWJsZSwgbWF5YmUgd2l0aCAic2V0IGJyb2tlbiIgcmVwbGFjZWQgYnkgInNldAo+IGJyb2tlbiBp
ZiBEb20wLCBlbHNlIHJlbW92ZSBkZXZpY2UgZnJvbSBkb21haW4iLiBUaGlzIGF0IGxlYXN0Cj4g
cGFydGx5IGRlcGVuZHMgb24gaG93IHJlY292ZXJ5IGZyb20gImJyb2tlbiIgd291bGQgbG9vayBs
aWtlLAo+IGkuZS4gd2hldGhlciB0aGF0IHdvdWxkIGJlIGFwcGxpY2FibGUgKGFuZCBzYWZlKSBm
b3IgYSBEb21VIGFzCj4gd2VsbC4KCkkgd2lsbCBhZGQgdGhlICJyZW1vdmUgZGV2aWNlIGZyb20g
ZG9tYWluIiBmb3IgdGhlIERvbVUgY2FzZSBhbmQgcHV0CnRoaXMgYXMgYSBjb21tZW50IHNvbWV3
aGVyZS4gSU1PIGl0IGNhbiBhbHdheXMgYmUgaW1wcm92ZWQgaW4gdGhlCmZ1dHVyZSB3aXRoIGJl
dHRlciByZWNvdmVyeSBvcHRpb25zLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
