From: Rian Quinn <rianquinn@gmail.com>
Subject: Re: [PATCH RFC 00/49] xen: add core scheduling support
Date: Fri, 29 Mar 2019 12:35:13 -0600
Message-ID: <CANmpu8VQCQhOqkAjm6u0cbhqKKHQNy_BY2NPY7BBTARow-O2bg@mail.gmail.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <5C9E3C3D0200007800222FB0@suse.com>
 <19e960b1-bcfd-45cb-7993-6af5bd407266@suse.com>
 <2d8735fa29e3c7add47b8e4c467760bfffc90b09.camel@suse.com>
 <63d8e13a-2dee-916a-61d4-7d69c7bb0a4d@suse.com>
 <CANmpu8WGcEfztp2VNAKKV+Uz2cUqw6yzweJU-19++cNdKRZ3tA@mail.gmail.com>
 <2a41fbd5-c90b-1e2a-3aeb-15308ea5f254@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hR2+=SA=gmail.com=rianquinn@srs-us1.protection.inumbo.net>)
 id 1h9wLh-0007wY-Me
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 18:35:29 +0000
Received: by mail-ed1-x543.google.com with SMTP id x14so2892552eds.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Mar 2019 11:35:28 -0700 (PDT)
In-Reply-To: <2a41fbd5-c90b-1e2a-3aeb-15308ea5f254@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Robert VanVossen <Robert.VanVossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Joshua Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

TWFrZXMgc2Vuc2UuIFRoZSByZWFzb24gSSBhc2sgaXMgd2UgY3VycmVudGx5IGhhdmUgdG8gZGlz
YWJsZSBIVCBkdWUKdG8gTDFURiB1bnRpbCBhIHNjaGVkdWxlciBjaGFuZ2UgaXMgbWFkZSB0byBh
ZGRyZXNzIHRoZSBpc3N1ZSBhbmQgdGhlCiMxIHF1ZXN0aW9uIGV2ZXJ5b25lIGFza3MgaXMgd2hh
dCB3aWxsIHRoYXQgZG8gdG8gcGVyZm9ybWFuY2Ugc28gYW55CmluZm8gb24gdGhhdCB0b3BpYyBh
bmQgaG93IGEgcGF0Y2ggbGlrZSB0aGlzIHdpbGwgYWRkcmVzcyB0aGUgTDFURgppc3N1ZSBpcyBt
b3N0IGhlbHBmdWwuCgpPbiBGcmksIE1hciAyOSwgMjAxOSBhdCAxMTo0OSBBTSBBbmRyZXcgQ29v
cGVyCjxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDI5LzAzLzIwMTkg
MTc6MzksIFJpYW4gUXVpbm4gd3JvdGU6Cj4gPiBPdXQgb2YgY3VyaW9zaXR5LCBoYXMgdGhlcmUg
YmVlbiBhbnkgcmVzZWFyY2ggZG9uZSBvbiB3aGV0aGVyIG9yIG5vdAo+ID4gaXQgbWFrZXMgbW9y
ZSBzZW5zZSB0byBqdXN0IGRpc2FibGUgQ1BVIHRocmVhZGluZyB3aXRoIHJlc3BlY3QgdG8KPiA+
IG92ZXJhbGwgcGVyZm9ybWFuY2U/IEluIHNvbWUgb2YgdGhlIHRlc3RpbmcgdGhhdCB3ZSBkaWQg
d2l0aCBPcGVuWFQsCj4gPiB3ZSBub3RpY2VkIGluIHNvbWUgb2Ygb3VyIHRlc3RzIGEgcGVyZm9y
bWFuY2UgaW5jcmVhc2Ugd2hlbgo+ID4gaHlwZXJ0aHJlYWRpbmcgd2FzIGRpc2FibGVkLiBJIHdv
dWxkIGJlIGN1cmlvdXMgd2hhdCBvdGhlciByZXNlYXJjaAo+ID4gaGFzIGJlZW4gZG9uZSBpbiB0
aGlzIHJlZ2FyZC4KPiA+Cj4gPiBFaXRoZXIgd2F5LCBpZiB0aHJlYWRpbmcgaXMgZW5hYmxlZCwg
Z3JvdXBpbmcgdXAgdGhyZWFkcyBtYWtlcyBhIGxvdAo+ID4gb2Ygc2Vuc2UgV1JUIHNvbWUgb2Yg
dGhlIHJlY2VudCBzZWN1cml0eSBpc3N1ZXMgdGhhdCBoYXZlIGNvbWUgdXAgd2l0aAo+ID4gSW50
ZWwgQ1BVcy4KPgo+IFRoZXJlIGhhcyBiZWVuIHBsZW50eSBvZiBhY2FkZW1pYyByZXNlYXJjaCBk
b25lLCBhbmQgdGhlcmUgYXJlIHJlYWwKPiB1c2VjYXNlcyB3aGVyZSBkaXNhYmxpbmcgSFQgaW1w
cm92ZXMgcGVyZm9ybWFuY2UuCj4KPiBIb3dldmVyLCB0aGVyZSBhcmUgcGxlbnR5IHdoZW4gaXQg
ZG9lc24ndC4gIER1cmluZyBMMVRGIHRlc3RpbmcsCj4gWGVuU2VydmVyIG1lYXN1cmVkIG9uZSB0
eXBpY2FsIHVzZWNhc2UgKGFncmVnYXRlIHNtYWxsIHBhY2tldCBJTwo+IHRocm91Z2hwdXQsIHdo
aWNoIGlzIHJlcHJlc2VudGF0aXZlIG9mIGEgbG9hZCBvZiB3ZWJzZXJ2ZXIgVk1zKSB3aGljaAo+
IHRvb2sgYSA2MCUgcGVyZiBoaXQuCj4KPiAxMCUgb2YgdGhpcyB3YXMgdGhlIHJhdyBMMURfRkxV
U0ggaGl0LCB3aGlsZSA1MCUgb2YgaXQgd2FzIGFjdHVhbGx5IGR1ZQo+IHRvIHRoZSBpbmNyZWFz
ZWQgSU8gbGF0ZW5jeSBvZiBoYWx2aW5nIHRoZSBudW1iZXIgb2YgdmNwdXMgd2hpY2ggY291bGQK
PiBiZSBydW4gY29uY3VycmVudGx5Lgo+Cj4gQXMgZm9yIGNvcmUgYXdhcmUgc2NoZWR1bGluZywg
ZXZlbiBpZiBub3RoaW5nIGVsc2UsIGdyb3VwaW5nIHRoaW5ncyB1cAo+IHdpbGwgZ2V0IHlvdSBi
ZXR0ZXIgY2FjaGUgc2hhcmluZyBmcm9tIHRoZSBWTSdzIHBvaW50IG9mIHZpZXcuCj4KPiBBcyB5
b3UgY2FuIHByb2JhYmx5IHRlbGwsIHRoZSBhbnN3ZXIgaXMgZmFyIHRvbyB3b3JrbG9hZCBkZXBl
bmRlbnQgdG8KPiBjb21lIHVwIHdpdGggYSBnZW5lcmFsIHJ1bGUsIGJ1dCBhdCBsZWFzdCBoYXZp
bmcgdGhlIG9wdGlvbnMgYXZhaWxhYmxlCj4gd2lsbCBsZXQgcGVvcGxlIGV4cGVyaW1lbnQuCj4K
PiB+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
