From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 8/8] efi: drop original xen.efi code and
 build mechanism
Date: Wed, 04 Jul 2018 09:34:09 -0600
Message-ID: <5B3CE8F102000078001D1221@prv1-mh.provo.novell.com>
References: <1529418946-30114-1-git-send-email-daniel.kiper@oracle.com>
 <1529418946-30114-9-git-send-email-daniel.kiper@oracle.com>
 <5B34E7F802000078001CEE2F@prv1-mh.provo.novell.com>
 <20180704142505.GB26572@olila.local.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vtxc=ju=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fajnK-0000l5-DO
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 15:34:14 +0000
In-Reply-To: <20180704142505.GB26572@olila.local.net-space.pl>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA3LjE4IGF0IDE2OjI1LCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+IHdyb3Rl
Ogo+IE9uIFRodSwgSnVuIDI4LCAyMDE4IGF0IDA3OjUxOjUyQU0gLTA2MDAsIEphbiBCZXVsaWNo
IHdyb3RlOgo+PiA+Pj4gT24gMTkuMDYuMTggYXQgMTY6MzUsIDxkYW5pZWwua2lwZXJAb3JhY2xl
LmNvbT4gd3JvdGU6Cj4+ID4gVGhlbiByZW5hbWUgeGVuLm1iLmVmaSB0byB4ZW4uZWZpIGFuZCBk
cm9wIGFsbCByZWxhdGVkCj4+ID4gZGlmZmVyZW50aWF0b3JzIGluIHRoZSBjb2RlLgo+Pgo+PiBG
b3IgdGhpcyB5b3UnbGwgZmlyc3Qgb2YgYWxsIG5lZWQgdG8gY29udmluY2UgbWUgdGhhdCB0aGUg
YmluYXJ5IHlvdSBidWlsZCBpcwo+PiBhIGRyb3AtaW4gcmVwbGFjZW1lbnQgZm9yIHhlbi5lZmku
IEFzIG5vdGVkIGluIHRoZSByZXBsaWVzIHRvIGVhcmxpZXIKPj4gcGF0Y2hlcywgSSdtIGdldHRp
bmcgdGhlIGltcHJlc3Npb24gb2YgdGhpcyBub3QgYmVpbmcgdGhlIGNhc2UuIEEgZnVydGhlcgo+
PiBoaW50IHRvd2FyZHMgdGhpcyBpcyB0aGUgb3V0cmlnaHQgZGVsZXRpb24gb2YgeGVuL2FyY2gv
eDg2L2VmaS9ta3JlbG9jLmM6Cj4+IEhvdyBpcyB0aGUgWGVuIGltYWdlIGdvaW5nIHRvIGJlIHJl
bG9jYXRlZCB0aGF0IHdheSwgd2hlbiBsb2FkZWQgZnJvbQo+PiB0aGUgRUZJIHNoZWxsIG9yIGJv
b3QgbG9hZGVyPwo+IAo+IEl0IHdvcmtzIGJlY2F1c2UgYWxsIGFkZHJlc3NpbmcgaXMgcmVsYXRp
dmUgdG8gJXJpcC4gVG8gYmUgcHJlY2lzZSwgbmV3Cj4geGVuLmVmaSwgZWFybGllciB4ZW4ubWIu
ZWZpLCBjb250YWlucyBleGFjdGx5IHRoZSBzYW1lIGNvZGUgYXMgRUxGIGRvZXMuCj4gU28sIGlm
IEVMRiB3b3JrcyB3aXRob3V0IGFueSByZWxvY2F0aW9ucyB3aHkgUEUgc2hvdWxkIG5vdC4gRXNw
ZWNpYWxseSBvbgo+IHg4Ni02NC4gQWRkaXRpb25hbGx5LCBteSB0ZXN0cyBzaG93ZWQgdGhhdCBp
biBnZW5lcmFsIFVFRkkgaW1wbGVtZW50YXRpb25zCj4ganVzdCByZXF1aXJlIEJhc2UgUmVsb2Nh
dGlvbiBUYWJsZSBlbnRyeSBpbiBQRSBEYXRhIERpcmVjdG9yaWVzIHRvIHJlbG9jYXRlCj4gdGhl
IGltYWdlLgoKVGhlIHRoaW5nIEknbSBtaXNzaW5nIGluIHRoZSBzZXJpZXMgaXMgdGhlIGdlbmVy
YXRpb24gb2YgdGhlIHJlbG9jYXRpb25zIHRvCmdvIGludG8gdGhlIHNlY3Rpb24gcG9pbnRlZCB0
byBieSB0aGlzIERhdGEgRGlyZWN0b3J5IGVudHJ5LgoKPiBFdmVuIGl0IGNhbiBiZSBlbXB0eS4g
QXMgaXQgaXMgaW4gY3VycmVudCBwYXRjaHNldC4KCk5vLCBpdCBjYW4ndCBiZSBlbXB0eS4gSnVz
dCB0cnkgcmVtb3ZpbmcgdGhlIHJlbG9jYXRpb25zIGZyb20geGVuLmVmaSBhbmQKc2VlIHdoYXQg
eW91IGdldC4KCj4gVGhvdWdoIEkgYW0KPiBhZnJhaWQgYWJvdXQgbW9yZSBwaWNreSBVRUZJIHN0
dWZmIGFuZCBjb25zaWRlcmluZyBhZGRpdGlvbiBvZiBhdCBsZWFzdAo+IG9uZSAucmVsb2MgZW50
cnksIGZha2Ugb25lLCBhcyBMaW51eCBrZXJuZWwgZG9lcy4gQW5kIHRoaXMgcmlzZXMgYW5vdGhl
cgo+IHF1ZXN0aW9uOiBzaG91bGQgbm90IHdlIGFkZCAuYnNzIHNlY3Rpb24gaW50byBQRSBoZWFk
ZXI/IFJpZ2h0IG5vdyBpdCBpcwo+IGVtYmVkZGVkL2hpZGRlbiBpbiBQRSAudGV4dCBzZWN0aW9u
LgoKTXkgeGVuLmVmaSBkb2VzIGhhdmUgYSAuYnNzIHNlY3Rpb24uCgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
