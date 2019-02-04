From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH RFC v2 1/2] x86/emulate: Move
 hvmemul_linear_to_phys
Date: Mon, 4 Feb 2019 14:00:40 +0200
Message-ID: <fb615746-d8c4-40b9-7d1c-37ad1818343f@bitdefender.com>
References: <20190111153657.13532-1-aisaila@bitdefender.com>
 <982cf63a-8062-5e96-3a6c-02cbc8bcc9fb@bitdefender.com>
 <4b350789912046acaa1dc73934835429@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P7Cd=QL=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gqcvf-0000BS-90
 for xen-devel@lists.xenproject.org; Mon, 04 Feb 2019 12:00:47 +0000
In-Reply-To: <4b350789912046acaa1dc73934835429@AMSPEX02CL03.citrite.net>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Alexandru Stefan ISAILA' <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi80LzE5IDE6NTUgUE0sIFBhdWwgRHVycmFudCB3cm90ZToKPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KPj4gRnJvbTogQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgW21haWx0bzphaXNh
aWxhQGJpdGRlZmVuZGVyLmNvbV0KPj4gU2VudDogMDQgRmVicnVhcnkgMjAxOSAxMTozNwo+PiBU
bzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4+IENjOiBQYXVsIER1cnJhbnQgPFBh
dWwuRHVycmFudEBjaXRyaXguY29tPjsgamJldWxpY2hAc3VzZS5jb207IEFuZHJldwo+PiBDb29w
ZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPjsgUm9nZXIKPj4gUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb207Cj4+IHRhbWFzQHRrbGVuZ3llbC5jb207IEdlb3JnZSBEdW5sYXAg
PEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT4KPj4gU3ViamVjdDogUmU6IFtQQVRDSCBSRkMgdjIg
MS8yXSB4ODYvZW11bGF0ZTogTW92ZSBodm1lbXVsX2xpbmVhcl90b19waHlzCj4+Cj4+IFBpbmcs
IGFueSB0aG91Z2h0cyBvbiB0aGlzIGFyZSBhcHByZWNpYXRlZC4KPj4KPj4gUmVnYXJkcywKPj4g
QWxleAo+Pgo+PiBPbiAxMS4wMS4yMDE5IDE3OjM3LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3
cm90ZToKPj4+IFRoaXMgaXMgZG9uZSBzbyBodm1lbXVsX2xpbmVhcl90b19waHlzKCkgY2FuIGJl
IGNhbGxlZCBmcm9tCj4+PiBodm1lbXVsX21hcF9saW5lYXJfYWRkcigpCj4+Pgo+IAo+IEkgaGF2
ZSBubyBvYmplY3Rpb24gdG8gcHVyZSBjb2RlIG1vdmVtZW50IGZvciB0aGlzIHB1cnBvc2UuIEkg
Y2VydGFpbmx5IHByZWZlciBpdCB0byBmb3J3YXJkIGRlY2xhcmF0aW9uIG9mIHN0YXRpY3MuClRo
YW5rcyBmb3IgdGhlIHJlcGx5IQoKV2UncmUgYWxzbyBhZnRlciB0aG91Z2h0cyBvbiB0aGUgd2hv
bGUgc2VyaWVzIChyZXBseWluZyB0byB0aGlzIHNwZWNpZmljIApwYXRjaCBpbnN0ZWFkIG9mIHRo
ZSBjb3ZlciBsZXR0ZXIgd2FzIGFuIGFjY2lkZW50KS4KCldlIGV4cGVjdCB0aGUgc2Vjb25kIHBh
dGNoIHRvIGJlIG1vcmUgY29udHJvdmVyc2lhbCBhbmQgaW4gc29tZSBuZWVkIG9mIApkZXRhaWxl
ZCBzY3J1dGlueS4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
