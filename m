From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v10 01/11] x86/cpu: Introduce
 vmce_save_vcpu_ctxt_one() func
Date: Thu, 05 Jul 2018 03:52:45 -0600
Message-ID: <5B3DEA6D02000078001D1675@prv1-mh.provo.novell.com>
References: <1530711147-23113-1-git-send-email-aisaila@bitdefender.com>
 <1530711147-23113-2-git-send-email-aisaila@bitdefender.com>
 <930e758583ea4627be7af70eaaae4b6a@AMSPEX02CL03.citrite.net>
 <1530780924.8880.39.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1530780924.8880.39.camel@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian.Jackson@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjA3LjE4IGF0IDEwOjU0LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IE9uIEpvLCAyMDE4LTA3LTA1IGF0IDA4OjQxICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6
Cj4+ID4gRnJvbTogQWxleGFuZHJ1IElzYWlsYSBbbWFpbHRvOmFpc2FpbGFAYml0ZGVmZW5kZXIu
Y29tXQo+PiA+IFNlbnQ6IDA0IEp1bHkgMjAxOCAxNDozMgo+PiA+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9jcHUvbWNoZWNrL3ZtY2UuYwo+PiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL3Zt
Y2UuYwo+PiA+IEBAIC0zNDksNiArMzQ5LDE4IEBAIGludCB2bWNlX3dybXNyKHVpbnQzMl90IG1z
ciwgdWludDY0X3QgdmFsKQo+PiA+ICAgICAgcmV0dXJuIHJldDsKPj4gPiAgfQo+PiA+IAo+PiA+
ICtzdGF0aWMgaW50IHZtY2Vfc2F2ZV92Y3B1X2N0eHRfb25lKHN0cnVjdCB2Y3B1ICp2LAo+PiA+
IGh2bV9kb21haW5fY29udGV4dF90ICpoKQo+PiA+ICsgewo+PiA+ICsgICAgc3RydWN0IGh2bV92
bWNlX3ZjcHUgY3R4dDsKPj4gPiArCj4+IE5vdCBteSBjYWxsLCBidXQgSSdkIGZlZWwgbW9yZSBj
b21mb3J0YWJsZSB3aXRoIG1lbXNldHRpbmcgY3R4dCB0bwo+PiB6ZXJvIGhlcmUuLi4KPiAKPiBJ
ZiB0aGVyZSB3aWxsIGJlIGEgbmV3IHZlcnNpb24gSSB3aWxsIGFkZCB0aGUgbWVtc2V0IHRvIDAK
ClRoZXJlIHdpbGwgbmVlZCB0byBiZSBhIG5ldyB2ZXJzaW9uIGZvciB0aGlzIGFsb25lLCBidXQg
cGxlYXNlIGFsbG93IHNvbWUKbW9yZSB0aW1lIGZvciBwZW9wbGUgdG8gbG9vayBhdCB5b3VyIHNl
cmllcy4gQXQgdGhlIHJhdGUgeW91J3ZlIGJlZW4Kc2VuZGluZyB2ZXJzaW9ucywgSSBoYXZlbid0
IGV2ZXIgbWFkZSBpdCBwYXN0IHRoZSBtaWRkbGUgb2YgeW91ciBzZXJpZXMuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
