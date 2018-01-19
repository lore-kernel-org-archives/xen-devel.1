From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [OSSTEST PATCH v2 07/19] ts-host-install: don't use
 the new nic naming scheme
Date: Fri, 19 Jan 2018 17:12:08 +0000
Message-ID: <20180119171208.m3nlhqb2xartlwbw@citrix.com>
References: <20171031135203.11537-1-wei.liu2@citrix.com>
 <20171031135203.11537-8-wei.liu2@citrix.com>
 <bca1c4ed-c061-3510-e80d-69802a8ac806@linaro.org>
 <3c780892-4aac-1532-d09a-f5e2ce803fdf@linaro.org>
 <20180119142124.h2ldgdssch7duy4s@citrix.com>
 <23138.9721.667173.922904@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=pswu=eo=citrix.com=prvs=5505d9d7e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ecaDB-000556-52
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 17:12:17 +0000
Content-Disposition: inline
In-Reply-To: <23138.9721.667173.922904@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@linaro.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTksIDIwMTggYXQgMDU6MDg6MDlQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW09TU1RFU1QgUEFUQ0ggdjIg
MDcvMTldIHRzLWhvc3QtaW5zdGFsbDogZG9uJ3QgdXNlIHRoZSBuZXcgbmljIG5hbWluZyBzY2hl
bWUiKToKPiA+IE9uIEZyaSwgRGVjIDE1LCAyMDE3IGF0IDAzOjQ1OjA2UE0gKzAwMDAsIEp1bGll
biBHcmFsbCB3cm90ZToKPiA+ID4gSSBkdWcgYSBiaXQgbW9yZSwgc28gJ2ZvcmNlIGludGVyZmFj
ZScgd2lsbCBjcmVhdGUgdGhlCj4gPiA+IC9ldGMvdWRldi9ydWxlcy5kLzcwLXBlcnNpc3RlbnQt
bmV0LnJ1bGVzIGZvciB0aGUgaW5zdGFsbGVyIGluaXRyZC4KPiA+ID4gCj4gPiA+IEhvd2V2ZXIs
IGl0IGRvZXMgbm90IGdldCBjb3BpZWQgdG8gdGhlIGluc3RhbGxlZCBEZWJpYW4uIEZvciB0aGUg
bW9tZW50LCBJCj4gPiA+IHdvcmthcm91bmQgdGhpcyBieSBjb3B5aW5nIHRoZSBmaWxlIGluIG92
ZXJsYXkvIHNvIGl0IGdldCBpbnN0YWxsZWQuCj4gPiAKPiA+IEkgdHJpZWQgdGhhdCBhcyB3ZWxs
LCBidXQgdGhhdCdzIHdyb25nLgo+ID4gCj4gPiBUaGF0IHdvdWxkIG1ha2UgdGhlIGdlbmVyYXRl
ZCBydWxlIGdldCBjb3BpZWQgaW4gdG8gdGhlIGhvc3QgaW5pdHJkLAo+ID4gd2hpY2ggZW5kcyB1
cCBiZWluZyB1c2VkIGFzIHRoZSBndWVzdHMgaW5pdHJkIChhdCBsZWFzdCBvbiB4ODYpLCB0aGVu
Cj4gPiB0aGUgZ3Vlc3Qgd2lsbCBoaWphY2sgdGhlIGhvc3QncyBJUCBhZGRyZXNzICghKS4KPiAK
PiA/Pz8KPiAKPiAxLiBwZXJzaXN0ZW50LW5ldC5ydWxlcyBjb250YWlucyBpbmZvcm1hdGlvbiBz
YXlpbmcgImlmIG5pYyB3aXRoCj4gYWRkcmVzcyBhYTpiYjpjYzpkZDplZTpmZiBzaG93cyB1cCwg
Y2FsbCBpdCBldGgyOyBhbHNvLCBkbyBub3QgY2FsbAo+IGFueXRoaW5nIGVsc2UgZXRoMiIuICBT
byBpdCBoYXMgbm90aGluZyB0byBkbyB3aXRoIGlwIGFkZHJlc3Nlcy4KClRoZSBydWxlIGlzIGdl
bmVyYXRlZCBieSBvc3N0ZXN0LCB3aGljaCBzYXlzICJwbGVhc2UgbWFrZSB0aGlzIG5pYyBoYXZl
Cm1hYyBhZGRyZXNzIFhYWFgiLiBUaGF0IHdvdWxkIGNhdXNlIHRoZSBndWVzdCB0byBoYXZlIHRo
ZSBzYW1lIG1hYwphZGRyZXNzIGFzIHRoZSBob3N0LiBXaGVuIHRoZSBndWVzdCBpcyB1cCBhbmQg
YXNrcyBESENQIHNlcnZlciBmb3IgYW4KSVAsIGl0IGdldHMgdGhlIGhvc3QncyBJUC4KCj4gCj4g
Mi4gaW5pdHJkcyBkb24ndCBuZWVkIHRvIGJyaW5nIHVwIHRoZSBuZXR3b3JrIHNvIEknbSBub3Qg
c3VyZSB3aHkgdGhpcwo+IHdvdWxkIGVuZCB1cCB0aGVyZS4gIElmIGl0IGRvZXMsIHdlIGNvdWxk
IGFkZCBzb21ldGhpbmcgdG8gdGhlCj4gaW5pdHJhbWZzLXRvb2xzIGNvbmZpZyB0byBzdG9wIGl0
Lgo+IAoKaW5pdHJhbWZzLXRvb2xzIGRvZXMgdGhhdC4gSSdtIG5vdCBhd2FyZSBvZiBhbiBvcHRp
b24gdG8gc3RvcCBpdCBmcm9tCmRvaW5nIHRoYXQuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
