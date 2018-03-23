From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [RFC PATCH 07/12] hvmloader: allocate MMCONFIG area
 in the MMIO hole + minor code refactoring
Date: Fri, 23 Mar 2018 13:52:25 +0000
Message-ID: <a23a6e12c38142a989a5ca34870b228a@AMSPEX02CL03.citrite.net>
References: <20180320085048.orjv67qtwhe35ntl@MacBook-Pro-de-Roger.local>
 <20180321105840.00004698@gmail.com>
 <20180321090911.qd6epofdaywc4blb@MacBook-Pro-de-Roger.local>
 <20180322002540.000032f1@gmail.com>
 <20180321152017.bv32mt4bpxaa7zfr@MacBook-Pro-de-Roger.local>
 <20180322025656.00005281@gmail.com>
 <20180321171504.afl75q77kji34ybo@MacBook-Pro-de-Roger.local>
 <20180322084958.0000571c@gmail.com>
 <20180322095716.5y2hdyh6xp7nto3g@MacBook-Pro-de-Roger.local>
 <20180322222922.00006f7c@gmail.com>
 <20180322124402.wal7zdhadswqg3qk@MacBook-Pro-de-Roger.local>
 <20180323013105.00002a99@gmail.com>
 <4c586feb8e864f3591934c24b0b1ceba@AMSPEX02CL03.citrite.net>
 <5AB4F55402000078001B5818@gwmail.emea.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=p6qq=gn=citrix.com=prvs=613a7f4d3=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1ezN7L-0006gv-SY
 for xen-devel@lists.xenproject.org; Fri, 23 Mar 2018 13:52:27 +0000
In-Reply-To: <5AB4F55402000078001B5818@gwmail.emea.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, 'Alexey G' <x1917x@gmail.com>, Ian Jackson <Ian.Jackson@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24gQmVoYWxmDQo+IE9mIEph
biBCZXVsaWNoDQo+IFNlbnQ6IDIzIE1hcmNoIDIwMTggMTE6MzkNCj4gVG86IFBhdWwgRHVycmFu
dCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+DQo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1DQo+IDx3ZWkubGl1MkBjaXRyaXguY29tPjsg
QW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47DQo+ICdBbGV4ZXkgRycg
PHgxOTE3eEBnbWFpbC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFudGhv
bnkNCj4gUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24gPElh
bi5KYWNrc29uQGNpdHJpeC5jb20+Ow0KPiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1JGQyBQQVRDSCAwNy8xMl0gaHZt
bG9hZGVyOiBhbGxvY2F0ZSBNTUNPTkZJRw0KPiBhcmVhIGluIHRoZSBNTUlPIGhvbGUgKyBtaW5v
ciBjb2RlIHJlZmFjdG9yaW5nDQo+IA0KPiA+Pj4gT24gMjMuMDMuMTggYXQgMTE6MjksIDxQYXVs
LkR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6DQo+ID4gTm8sIHRoYXQncyBub3QgcXVpdGUgcmln
aHQuIE9ubHkgcWVtdS10cmFkIChhbmQgc3R1YmRvbSkgYXJlICdkZWZhdWx0JyBpb3JlcQ0KPiA+
IHNlcnZlcnMuIFVwc3RyZWFtIFFFTVUgaGFzIHJlZ2lzdGVyZWQgaW5kaXZpZHVhbCBQQ0kgZGV2
aWNlcyB3aXRoIFhlbiBmb3INCj4gPiBzb21lIHRpbWUgbm93LCBhbmQgaGVuY2UgZ2V0cyBwcm9w
ZXIgUENJIGNvbmZpZyBJT1JFUXMuIEFsc28gd2UgcmVhbGx5DQo+IHJlYWxseQ0KPiA+IHdhbnQg
ZGVmYXVsdCBpb3JlcSBzZXJ2ZXJzIGFzIHRoZWlyIGludGVyZmFjZSB0byBYZW4gaXMgZnJhZ2ls
ZSBhbmQgaGFzIG9ubHkNCj4gPiBqdXN0IG5hcnJvd2x5IGF2b2lkZWQgYmVpbmcgYSBzZWN1cml0
eSBpc3N1ZS4NCj4gDQo+IERpZCB5b3UgbWlzcyBzb21lICJkb24ndCIgb3IgInRvIGdvIGF3YXki
Pw0KPiANCg0KT29wcywgeWVzISAidG8gZ28gYXdheSIgZGVmaW5pdGVseS4NCg0KICBQYXVsDQoN
Cj4gSmFuDQo+IA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
