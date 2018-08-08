From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: PVH dom0 creation fails - the system freezes
Date: Wed, 8 Aug 2018 12:11:38 +0200
Message-ID: <20180808101138.vququpbfcrfhsciy@mac>
References: <1532681311565.24220@amazon.com>
 <20180727091109.mpkin3m7cgfriydj@mac.bytemobile.com>
 <1533209784969.4697@amazon.com>
 <20180802135517.uhga6o4lb6lhylzy@mac>
 <c464ac5b-2bc2-2c7c-0755-44eca8dd2990@amazon.com>
 <20180808080806.kzueiarxxu6npyli@mac>
 <1b08ca5c921b41429f71667dbf4ced87@AMSPEX02CL03.citrite.net>
 <20180808085119.b54tbeftryvy427s@mac>
 <4c4c7ad4-cf4c-fb9f-edff-bded4d9df7f9@amazon.com>
 <20180808094428.pj5pyv5upzmcdt3f@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xhyf=kx=citrix.com=prvs=751fb83b8=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fnLRS-00030G-9f
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 10:11:46 +0000
Content-Disposition: inline
In-Reply-To: <20180808094428.pj5pyv5upzmcdt3f@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: bercarug@amazon.com
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <Paul.Durrant@citrix.com>, David Woodhouse <dwmw2@infradead.org>, Jan Beulich <JBeulich@suse.com>, "Belgun, Adrian" <abelgun@amazon.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMDgsIDIwMTggYXQgMTE6NDQ6MjhBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBJIGp1c3QgcmVhbGl6ZWQgdGhhdCBJJ3ZlIGRyb3BwZWQgYSBjaHVuayBmcm9t
IG15IHNlcmllcyB3aGlsZQo+IHJlYmFzaW5nLCBjb3VsZCB5b3UgcGxlYXNlIHRyeSBhZ2FpbiB3
aXRoIHRoZSBmb2xsb3dpbmcgZGlmZiBhcHBsaWVkCj4gb24gdG9wIG9mIG15IHNlcmllcz8KPiAK
PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMgYi94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYwo+IGluZGV4IDZhZWM0M2VkMWEuLjYyNzFk
OGI2NzEgMTAwNjQ0Cj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMK
PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYwo+IEBAIC0yMDksNyAr
MjA5LDEzIEBAIHZvaWQgX19od2RvbV9pbml0IGFyY2hfaW9tbXVfaHdkb21faW5pdChzdHJ1Y3Qg
ZG9tYWluICpkKQo+ICAgICAgICAgIGlmICggIWh3ZG9tX2lvbW11X21hcChkLCBwZm4sIG1heF9w
Zm4pICkKPiAgICAgICAgICAgICAgY29udGludWU7Cj4gIAo+IC0gICAgICAgIHJjID0gaW9tbXVf
bWFwX3BhZ2UoZCwgcGZuLCBwZm4sIElPTU1VRl9yZWFkYWJsZXxJT01NVUZfd3JpdGFibGUpOwo+
ICsgICAgICAgIGlmICggaW9tbXVfdXNlX2hhcF9wdChkKSApCj4gKyAgICAgICAgewo+ICsgICAg
ICAgICAgICBBU1NFUlQoaXNfaHZtX2RvbWFpbihkKSk7Cj4gKyAgICAgICAgICAgIHJjID0gc2V0
X2lkZW50aXR5X3AybV9lbnRyeShkLCBwZm4sIHAybV9hY2Nlc3NfcncsIDApOwo+ICsgICAgICAg
IH0KPiArICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgIHJjID0gaW9tbXVfbWFwX3BhZ2UoZCwg
cGZuLCBwZm4sIElPTU1VRl9yZWFkYWJsZXxJT01NVUZfd3JpdGFibGUpOwo+ICAgICAgICAgIGlm
ICggcmMgKQo+ICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgIiBkJWQ6IElPTU1V
IG1hcHBpbmcgZmFpbGVkOiAlZFxuIiwKPiAgICAgICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9p
ZCwgcmMpOwoKSSd2ZSBwdXNoZWQgYSBuZXcgdmVyc2lvbiB0aGF0IGhhcyB0aGlzIGNodW5rLCBz
byBpdCBtaWdodCBiZSBlYXNpZXIKZm9yIHlvdSB0byBqdXN0IGZldGNoIGFuZCB0ZXN0OgoKZ2l0
Oi8veGVuYml0cy54ZW4ub3JnL3Blb3BsZS9yb3lnZXIveGVuLmdpdCBpb21tdV9pbmNsdXNpdmVf
djQKClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
