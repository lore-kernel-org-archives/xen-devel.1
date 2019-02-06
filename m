From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v5 8/9] common/grant_table:
 block speculative out-of-bound accesses
Date: Wed, 06 Feb 2019 08:53:04 -0700
Message-ID: <5C5B02E00200007800214606@prv1-mh.provo.novell.com>
References: <c755dfdd-3c1e-5ccd-983f-11d0b35bb342@suse.com>
 <1548772997-32742-1-git-send-email-nmanthey@amazon.de>
 <1548772997-32742-9-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0104A7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C5AF49B0200007800214548@prv1-mh.provo.novell.com>
 <0f80318d-7454-2055-694c-c22b40a7ddb0@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1grPVh-0007I8-8N
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 15:53:13 +0000
In-Reply-To: <0f80318d-7454-2055-694c-c22b40a7ddb0@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjAyLjE5IGF0IDE2OjA2LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBP
biAyLzYvMTkgMTU6NTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyOS4wMS4xOSBhdCAx
NTo0MywgPG5tYW50aGV5QGFtYXpvbi5kZT4gd3JvdGU6Cj4+PiBAQCAtOTYzLDYgKzk2NSw5IEBA
IG1hcF9ncmFudF9yZWYoCj4+PiAgICAgICAgICBQSU5fRkFJTCh1bmxvY2tfb3V0LCBHTlRTVF9i
YWRfZ250cmVmLCAiQmFkIHJlZiAlI3ggZm9yIGQlZFxuIiwKPj4+ICAgICAgICAgICAgICAgICAg
IG9wLT5yZWYsIHJndC0+ZG9tYWluLT5kb21haW5faWQpOwo+Pj4gIAo+Pj4gKyAgICAvKiBNYWtl
IHN1cmUgdGhlIGFib3ZlIGNoZWNrIGlzIG5vdCBieXBhc3NlZCBzcGVjdWxhdGl2ZWx5ICovCj4+
PiArICAgIG9wLT5yZWYgPSBhcnJheV9pbmRleF9ub3NwZWMob3AtPnJlZiwgbnJfZ3JhbnRfZW50
cmllcyhyZ3QpKTsKPj4+ICsKPj4+ICAgICAgYWN0ID0gYWN0aXZlX2VudHJ5X2FjcXVpcmUocmd0
LCBvcC0+cmVmKTsKPj4+ICAgICAgc2hhaCA9IHNoYXJlZF9lbnRyeV9oZWFkZXIocmd0LCBvcC0+
cmVmKTsKPj4+ICAgICAgc3RhdHVzID0gcmd0LT5ndF92ZXJzaW9uID09IDEgPyAmc2hhaC0+Zmxh
Z3MgOiAmc3RhdHVzX2VudHJ5KHJndCwgb3AtPnJlZik7Cj4+IEp1c3QgRlRSIC0gdGhpcyBpcyBh
IGNhc2Ugd2hlcmUgdGhlIGNoYW5nZSwgYWNjb3JkaW5nIHRvIHByaW9yCj4+IGRpc2N1c3Npb24s
IGlzIHByZXR0eSB1bmxpa2VseSB0byBoZWxwIGF0IGFsbC4gVGhlIGNvbXBpbGVyIHdpbGwgaGF2
ZQo+PiBhIGhhcmQgdGltZSByZWFsaXppbmcgdGhhdCBpdCBjb3VsZCBrZWVwIHRoZSByZXN1bHQg
aW4gYSByZWdpc3RlciBwYXN0Cj4+IHRoZSBhY3RpdmVfZW50cnlfYWNxdWlyZSgpIGludm9jYXRp
b24sIGFzIHRoYXQgLSBkdWUgdG8gdGhlIHNwaW4KPj4gbG9jayBhY3F1aXJlZCB0aGVyZSAtIGFj
dHMgYXMgYSBjb21waWxlciBiYXJyaWVyLiBBbmQgbG9va2luZyBhdAo+PiBnZW5lcmF0ZWQgY29k
ZSAoZ2NjIDguMikgY29uZmlybXMgdGhhdCB0aGVyZSdzIGEgcmVsb2FkIGZyb20gdGhlCj4+IHN0
YWNrLgo+IEkgY291bGQgY2hhbmdlIHRoaXMgYmFjayB0byBhIHByaW9yIHZlcnNpb24gdGhhdCBw
cm90ZWN0cyBlYWNoIHJlYWQKPiBvcGVyYXRpb24uCgpUaGF0IG9yIHVzZSBibG9ja19zcGVjdWxh
dGlvbigpIHdpdGggYSBjb21tZW50IGV4cGxhaW5pbmcgd2h5LgoKQWxzbyAtIHdoeSBhcmUgdGhl
cmUgbm8gY2hhbmdlcyBhdCBhbGwgdG8gdGhlIHVubWFwX2dyYW50X3JlZigpIC8KdW5tYXBfYW5k
X3JlcGxhY2UoKSBjYWxsIHBhdGhzPyBOb3RlIGluIHBhcnRpY3VsYXIgdGhlIHNlY3VyaXR5CnJl
bGF0ZWQgY29tbWVudCBuZXh0IHRvIHRoZSBib3VuZHMgY2hlY2sgb2Ygb3AtPnJlZiB0aGVyZS4g
SSd2ZQpnb25lIHRocm91Z2ggZWFybGllciByZXZpZXcgcm91bmRzLCBidXQgSSBjb3VsZG4ndCBm
aW5kIGFuIGluZGljYXRpb24KdGhhdCB0aGlzIG1pZ2h0IGhhdmUgYmVlbiB0aGUgcmVzdWx0IG9m
IHJldmlldyBmZWVkYmFjay4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
