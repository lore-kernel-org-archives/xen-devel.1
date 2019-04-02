From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 44/49] xen: round up max vcpus to
 scheduling granularity
Date: Tue, 2 Apr 2019 09:49:14 +0200
Message-ID: <fa9da763-c3db-c298-d1e8-6220fe15e5e0@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-45-jgross@suse.com>
 <dcf13161-a427-d9a9-9998-b97daa51f7e1@citrix.com>
 <6c259488-c0ab-ec96-ee09-b76a9f402901@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fK7G=SE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hBEAd-0001y2-LZ
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 07:49:23 +0000
In-Reply-To: <6c259488-c0ab-ec96-ee09-b76a9f402901@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDQvMjAxOSAxMTo0NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwMS8wNC8yMDE5
IDEwOjUwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAyOS8wMy8yMDE5IDE1OjA5LCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOgo+Pj4gTWFrZSBzdXJlIHRoZSBudW1iZXIgb2YgdmNwdXMgaXMgYWx3
YXlzIGEgbXVsdGlwbGUgb2YgdGhlIHNjaGVkdWxpbmcKPj4+IGdyYW51bGFyaXR5LiBOb3RlIHRo
YXQgd2UgZG9uJ3Qgc3VwcG9ydCBhIHNjaGVkdWxpbmcgZ3JhbnVsYXJpdHkgYWJvdmUKPj4+IG9u
ZSBvbiBBUk0uCj4+Cj4+IEknbSBhZnJhaWQgdGhhdCBJIGRvbid0IHRoaW5rIHRoaXMgaXMgYSBj
bGV2ZXIgbW92ZS7CoCBJbiB0dXJuLCB0aGlzCj4+IGJyaW5ncyBpbnRvIHF1ZXN0aW9uIHRoZSBh
cHByb2FjaCB0byBpZGxlIGhhbmRsaW5nLgo+Pgo+PiBGaXJzdGx5LCB3aXRoIGEgcHJvcG9zZWQg
c29ja2V0IGdyYW51bGFyaXR5LCB0aGlzIHdvdWxkIGJlIDEyOCBvbiBzb21lCj4+IHN5c3RlbXMg
d2hpY2ggZXhpc3QgdG9kYXkuwqAgRnVydGhlcm1vcmUsIGNvbnNpZGVyIHRoZSBjYXNlIHdoZXJl
Cj4+IGNwdXBvb2wwIGhhcyBhIGdyYW51bGFyaXR5IG9mIDEsIGFuZCBhIHNlY29uZCBwb29sIGhh
cyBhIGdyYW51bGFyaXR5IG9mCj4+IDIuwqAgQSBkb21haW4gY2FuIGJlIGNyZWF0ZWQgd2l0aCBh
biBvZGQgbnVtYmVyIG9mIHZjcHVzIGFuZCBvcGVyYXRlIGluCj4+IHBvb2wwIGZpbmUsIGJ1dCBj
YW4ndCBub3cgYmUgbW92ZWQgdG8gcG9vbDEuCj4gCj4gRm9yIG5vdyBncmFudWxhcml0eSBpcyB0
aGUgc2FtZSBmb3IgYWxsIHBvb2xzLCBidXQgSSBwbGFuIHRvIGVuaGFuY2UKPiB0aGF0IGluIGZ1
dHVyZS4KPiAKPiBUaGUgYW5zd2VyIHRvIHRoYXQgcHJvYmxlbSBtaWdodCBiZSBlaXRoZXIgdG8g
YWxsb3cgZm9yIGxhdGVyIGFkZGl0aW9uCj4gb2YgZHVtbXkgdmNwdXMgKGUuZy4gYnkgc2l6aW5n
IG9ubHkgdGhlIHZjcHUgcG9pbnRlciBhcnJheSB0byB0aGUgbmVlZGVkCj4gbnVtYmVyKSwgb3Ig
dG8gcmVhbGx5IGRpc2FsbG93IG1vdmluZyBzdWNoIGEgZG9tYWluIGJldHdlZW4gcG9vbHMuCj4g
Cj4+IElmIGF0IGFsbCBwb3NzaWJsZSwgSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gdHJ5
IGFuZCByZXVzZSB0aGUgaWRsZQo+PiBjcHVzIGZvciBob2xlcyBsaWtlIHRoaXMuwqAgU2VlaW5n
IGFzIHlvdSd2ZSBiZWVuIHBsYXlpbmcgd2l0aCB0aGlzIGNvZGUKPj4gYSBsb3QsIHdoYXQgaXMg
eW91ciBhc3Nlc3NtZW50Pwo+IAo+IFRoaXMgd291bGQgYmUgcmF0aGVyIGNvbXBsaWNhdGVkLiBJ
J2QgZWl0aGVyIG5lZWQgdG8gc3dpdGNoIHZjcHVzCj4gZHluYW1pY2FsbHkgaW4gc2NoZWR1bGUg
aXRlbXMsIG9yIEknZCBuZWVkIHRvIHNwZWNpYWwgY2FzZSB0aGUgaWRsZQo+IHZjcHVzIGluIF9s
b3RzXyBvZiBwbGFjZXMuCgpJIGhhdmUgdGhvdWdodCBtb3JlIGFib3V0IHRoaXMgYW5kIG1heWJl
IEkgaGF2ZSBmb3VuZCBhIHdheSB0byBtYWtlIHRoYXQKbGVzcyBpbnRydXNpdmUgYXMgSSB0aG91
Z2h0IGluIHRoZSBiZWdpbm5pbmcuCgpJJ2xsIGdpdmUgaXQgYSB0cnkuLi4KCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
