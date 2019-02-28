From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 4/6] x86/vtd: Drop struct ir_ctrl
Date: Thu, 28 Feb 2019 06:07:47 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C96B425@SHSMSX104.ccr.corp.intel.com>
References: <1550862806-30236-1-git-send-email-andrew.cooper3@citrix.com>
 <1550862806-30236-5-git-send-email-andrew.cooper3@citrix.com>
 <f98f753cde8941b386580f599d5e45e5@AMSPEX02CL02.citrite.net>
 <5C73CAD00200007800219BF7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C73CAD00200007800219BF7@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IE1v
bmRheSwgRmVicnVhcnkgMjUsIDIwMTkgNzowMSBQTQo+IAo+ID4+PiBPbiAyNS4wMi4xOSBhdCAx
MTowOSwgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPiA+PiAgLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPiA+IFtzbmlwXQo+ID4+ICBzdHJ1Y3QgaW9tbXVfZmx1c2ggewo+ID4+
ICAgICAgaW50IF9fbXVzdF9jaGVjayAoKmNvbnRleHQpKHZvaWQgKmlvbW11LCB1MTYgZGlkLCB1
MTYgc291cmNlX2lkLAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHU4IGZ1
bmN0aW9uX21hc2ssIHU2NCB0eXBlLAo+ID4+IEBAIC01MjMsNyArNTE3LDYgQEAgc3RydWN0IGlv
bW11X2ZsdXNoIHsKPiA+PiAgfTsKPiA+Pgo+ID4+ICBzdHJ1Y3QgaW50ZWxfaW9tbXUgewo+ID4+
IC0gICAgc3RydWN0IGlyX2N0cmwgaXJfY3RybDsKPiA+PiAgICAgIHN0cnVjdCBpb21tdV9mbHVz
aCBmbHVzaDsKPiA+PiAgICAgIHN0cnVjdCBhY3BpX2RyaGRfdW5pdCAqZHJoZDsKPiA+PiAgfTsK
PiA+PiBAQCAtNTQzLDE2ICs1MzYsMTUgQEAgc3RydWN0IHZ0ZF9pb21tdSB7Cj4gPj4KPiA+PiAg
ICAgIHVpbnQ2NF90IHFpbnZhbF9tYWRkcjsgICAvKiBxdWV1ZSBpbnZhbGlkYXRpb24gcGFnZSBt
YWNoaW5lIGFkZHJlc3MKPiAqLwo+ID4+Cj4gPj4gKyAgICB1aW50NjRfdCBpcmVtYXBfbWFkZHI7
ICAgLyogaW50ZXJydXB0IHJlbWFwIHRhYmxlIG1hY2hpbmUgYWRkcmVzcyAqLwo+ID4+ICsgICAg
dW5zaWduZWQgaW50IGlyZW1hcF9udW07IC8qIHRvdGFsIG51bSBvZiB1c2VkIGludGVycnVwdCBy
ZW1hcCBlbnRyeQo+ICovCj4gPj4gKyAgICBzcGlubG9ja190IGlyZW1hcF9sb2NrOyAgLyogbG9j
ayBmb3IgaXJxIHJlbWFwcGluZyB0YWJsZSAqLwo+ID4+ICsKPiA+Cj4gPiBFbHNld2hlcmUgaW4g
dGhlIFhlbiBjb2RlYmFzZSB3ZSB0cnkgdG8gZ3JvdXAgcmVsYXRlZCBmaWVsZHMsIHNvIGhvdyBh
aG91dAo+ID4gdGhlIGZvbGxvd2luZz8KPiA+Cj4gPiBzdHJ1Y3Qgewo+ID4gICAgIHVpbnQ2NF90
IG1hZGRyOyAgIC8qIGludGVycnVwdCByZW1hcCB0YWJsZSBtYWNoaW5lIGFkZHJlc3MgKi8KPiA+
ICAgICB1bnNpZ25lZCBpbnQgbnVtOyAvKiB0b3RhbCBudW0gb2YgdXNlZCBpbnRlcnJ1cHQgcmVt
YXAgZW50cnkgKi8KPiA+ICAgICBzcGlubG9ja190IGxvY2s7ICAvKiBsb2NrIGZvciBpcnEgcmVt
YXBwaW5nIHRhYmxlICovCj4gPiB9IGlyZW1hcDsKPiA+Cj4gPiBZb3UnZCB0aGFuIGhhdmUgYSBm
YWlybHkgbWVjaGFuaWNhbCBqb2Igb2YgcmVwbGFjaW5nICdfJyB3aXRoICcuJyBpbiBhIGZldwo+
ID4gcGxhY2VzIGluIHlvdXIgcGF0Y2ggYnV0IEkgdGhpbmsgaXQgd291bGQgbG9vayBiZXR0ZXIg
b3ZlcmFsbC4KPiAKPiArMQo+IAoKYWdyZWUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
