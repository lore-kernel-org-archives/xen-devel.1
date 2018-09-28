From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/2] xen: make opt_xen_console true before
 console initialisation
Date: Fri, 28 Sep 2018 16:53:27 +0100
Message-ID: <20180928155327.ecbrkbcny7luwqxg@zion.uk.xensource.com>
References: <20180928082437.15140-1-wei.liu2@citrix.com>
 <20180928082437.15140-3-wei.liu2@citrix.com>
 <5BAE43F202000078001ECF13@prv1-mh.provo.novell.com>
 <20180928151207.kinkppv7klym6zoe@zion.uk.xensource.com>
 <5BAE469C02000078001ECF54@prv1-mh.provo.novell.com>
 <20180928152324.w4rozilb7iajr6qn@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rttn=mk=citrix.com=prvs=802525662=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g5v5A-0003sk-1z
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 15:53:32 +0000
Content-Disposition: inline
In-Reply-To: <20180928152324.w4rozilb7iajr6qn@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMjgsIDIwMTggYXQgMDQ6MjM6MjRQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBGcmksIFNlcCAyOCwgMjAxOCBhdCAwOToxOTo1NkFNIC0wNjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPiA+ID4+PiBPbiAyOC4wOS4xOCBhdCAxNzoxMiwgPHdlaS5saXUyQGNpdHJpeC5jb20+
IHdyb3RlOgo+ID4gPiBPbiBGcmksIFNlcCAyOCwgMjAxOCBhdCAwOTowODozNEFNIC0wNjAwLCBK
YW4gQmV1bGljaCB3cm90ZToKPiA+ID4+ID4+PiBPbiAyOC4wOS4xOCBhdCAxMDoyNCwgPHdlaS5s
aXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gPj4gPiAtLS0gYS94ZW4vZHJpdmVycy9jaGFyL2Nv
bnNvbGUuYwo+ID4gPj4gPiArKysgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwo+ID4gPj4g
PiBAQCAtOTEsNyArOTEsOCBAQCBzdGF0aWMgdWludDMyX3QgY29ucmluZ2MsIGNvbnJpbmdwOwo+
ID4gPj4gPiAgc3RhdGljIGludCBfX3JlYWRfbW9zdGx5IHNlcmNvbl9oYW5kbGUgPSAtMTsKPiA+
ID4+ID4gIAo+ID4gPj4gPiAgI2lmZGVmIENPTkZJR19YODYKPiA+ID4+ID4gLXN0YXRpYyBib29s
IF9fcmVhZF9tb3N0bHkgb3B0X2NvbnNvbGVfeGVuOyAvKiBjb25zb2xlPXhlbiAqLwo+ID4gPj4g
PiArLyogU2V0IHRvIHRydWUgYXQgc3RhcnQgb2YgZGF5IHRvIGNhdGNoIGVhcmx5IGJvb3QgaXNz
dWVzICovCj4gPiA+PiA+ICtzdGF0aWMgYm9vbCBfX3JlYWRfbW9zdGx5IG9wdF9jb25zb2xlX3hl
biA9IHRydWU7IC8qIGNvbnNvbGU9eGVuICovCj4gPiA+PiAKPiA+ID4+IFdoZW4gQW5kcmV3IHN1
Z2dlc3RlZCB0aGlzLCBpaXJjIGhlIHNhaWQgdG8gbWFrZSB0aGUgdmFyaWFibGUKPiA+ID4+IHRy
aXN0YXRlLiBPdGhlcndpc2UgLi4uCj4gPiA+IAo+ID4gPiBJIGZpZ3VyZSBpdCBkb2Vzbid0IG5l
ZWQgdG8gYmUgdHJpc3RhdGUuCj4gPiA+IAo+ID4gPj4gCj4gPiA+PiA+IEBAIC04MjEsNiArODIy
LDEwIEBAIHZvaWQgX19pbml0IGNvbnNvbGVfaW5pdF9wcmVpcnEodm9pZCkKPiA+ID4+ID4gIAo+
ID4gPj4gPiAgICAgIHNlcmlhbF9pbml0X3ByZWlycSgpOwo+ID4gPj4gPiAgCj4gPiA+PiA+ICsj
aWZkZWYgQ09ORklHX1g4Ngo+ID4gPj4gPiArICAgIG9wdF9jb25zb2xlX3hlbiA9IGZhbHNlOwo+
ID4gPj4gPiArI2VuZGlmCj4gPiA+PiAKPiA+ID4+IC4uLiB5b3UgcG9zc2libHkgb3ZlcnJpZGUg
YSB1c2VyIHNwZWNpZmllZCAidHJ1ZSIgaGVyZS4KPiA+ID4gCj4gPiA+IERvIEk/IFRoaXMgaXMg
cmlnaHQgYmVmb3JlIG9wdGlvbiBwYXJzaW5nLCBkdXJpbmcgd2hpY2ggb3B0X2NvbnNvbGVfeGVu
Cj4gPiA+IGlzIHNldC4KPiA+IAo+ID4gSG1tLCBJIHNlZSAtIEkgZGlkbid0IHJlY2FsbCB3ZSBz
dGlsbCBoYXZlIHRoaXMgYWQgaG9jIHBhcnNpbmcgaW4KPiA+IHBsYWNlLCBpbnN0ZWFkIG9mIHVz
aW5nIGN1c3RvbV9wYXJhbSgpLiBCdXQgaXNuJ3QgdGhpcyB0b28gZWFybHkgdGhlbiwKPiA+IGFz
IG1lc3NhZ2VzIGlzc3VlZCBmcm9tIHRoZSBwYXJzaW5nIGNvZGUgdGhlbiB3b3VsZCBub3QgYmUg
dmlzaWJsZT8KPiAKPiBUbyBtZSBpdCBkb2Vzbid0IG1ha2UgYW55dGhpbmcgd29yc2UgdGhhbiBi
ZWZvcmUuIEJ1dCBJIHNlZSB5b3VyIHBvaW50Lgo+IEkgd2lsbCBzZWUgaWYgdGhlcmUgaXMgYW4g
ZWFzeSB3YXkgdG8gZml4IHRoaXMuCgpBdCB0aGUgbW9tZW50IHRoZSBvcmRlcmluZyBvZiB0aGUg
b3B0aW9ucyBtYXR0ZXIsIHdoaWNoIG1lYW5zIGlmICJ4ZW4iCmlzIG5vdCB0aGUgZmlyc3Qgb3B0
aW9uIHdlIGNhbiBsb3NlIG91dHB1dC4KCkkgdGhpbmsgb25lIGVhc3kgd2F5IG9mIGltcHJvdmlu
ZyBpcyB0byBwYXJzZSBvcHRfY29uc29sZSB0d2ljZS4gVGhlCmZpcnN0IHRpbWUgc29sZWx5IGxv
b2tzIGZvciAieGVuIiBhbmQgdGhlIHNlY29uZCB0aW1lIHBhcnNlcyB0aGUgcmVzdApvcHRpb25z
LgoKCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
