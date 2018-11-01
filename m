From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v1] x86/hvm: Clean up may_defer from hvm_*
 helpers
Date: Thu, 1 Nov 2018 14:03:47 +0000
Message-ID: <2f29583a47a843b98b4a51980428cf15@AMSPEX02CL03.citrite.net>
References: <20181024091849.15572-1-aisaila@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE2B9E0@SHSMSX101.ccr.corp.intel.com>
 <73ab7fcd-59da-f160-3eda-a799349585a3@bitdefender.com>
 <5BDB069D02000078001424DF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n/vl=nm=citrix.com=prvs=836e25ed5=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gIDe0-0008D7-0k
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 14:08:20 +0000
In-Reply-To: <5BDB069D02000078001424DF@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <jbeulich@suse.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, "aisaila@bitdefender.com" <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "brian.woods@amd.com" <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
amJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDEgTm92ZW1iZXIgMjAxOCAxMzo1OQo+IFRvOiBy
Y29qb2NhcnVAYml0ZGVmZW5kZXIuY29tCj4gQ2M6IGJyaWFuLndvb2RzQGFtZC5jb207IHN1cmF2
ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tOwo+IGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tOyBBbmRy
ZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgUGF1bAo+IER1cnJhbnQgPFBh
dWwuRHVycmFudEBjaXRyaXguY29tPjsgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT47Cj4g
anVuLm5ha2FqaW1hQGludGVsLmNvbTsgS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+
OyB4ZW4tCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IGJvcmlzLm9zdHJvdnNreUBvcmFj
bGUuY29tOwo+IHRhbWFzQHRrbGVuZ3llbC5jb20KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxXSB4
ODYvaHZtOiBDbGVhbiB1cCBtYXlfZGVmZXIgZnJvbSBodm1fKiBoZWxwZXJzCj4gCj4gPj4+IFJh
enZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gMTEvMDEvMTggMTE6MzEg
QU0gPj4+Cj4gPk9uIDEwLzMwLzE4IDg6MTkgQU0sIFRpYW4sIEtldmluIHdyb3RlOgo+ID4+PiBG
cm9tOiBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSBbbWFpbHRvOmFpc2FpbGFAYml0ZGVmZW5kZXIu
Y29tXQo+ID4+PiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMjQsIDIwMTggNToxOSBQTQo+ID4+
Pgo+ID4+PiBUaGUgbWF5X2RlZmVyIHZhciB3YXMgbGVmdCB3aXRoIHRoZSBvbGRlciBib29sX3Qg
dHlwZS4gVGhpcyBwYXRjaAo+ID4+PiBjaGFuZ2VzIHRoZSB0eXBlIHRvIGJvb2wuCj4gPj4+Cj4g
Pj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIu
Y29tPgo+ID4+Cj4gPj4gUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwu
Y29tPgo+ID4KPiA+SSB0aGluayB0aGlzIHRyaXZpYWwgcGF0Y2ggaGFzIGFsbCB0aGUgYWNrcyBp
dCBuZWVkcyB0byBnbyBpbj8KPiAKPiBJdCBiZWluZyB0cml2aWFsLCBJIHdhcyBjb25zaWRlcmlu
ZyB0byBpZ25vcmUgdGhlIG5lZWQgZm9yIFBhdWwncyBhY2sgaW4KPiB0aGlzCj4gY2FzZSAod2hp
Y2ggaWlyYyBoYXMgbm90IGJlZW4gZ2l2ZW4gc28gZmFyKSwgYnV0IHNpbmNlIHlvdSBhc2sgLSBk
aWQgeW91Cj4gY2hlY2sgYmVmb3JlIGFza2luZz8gSSBjYW4gb25seSByZS1pdGVyYXRlIHRoYXQg
Z2VuZXJhbGx5IGl0IGlzIHRoZQo+IHN1Ym1pdHRlcgo+IHRvIGNoYXNlIGFja3MsIG5vdCBhbnkg
b2YgdGhlIHBvdGVudGlhbCBjb21taXR0ZXJzLgo+IAoKQXBvbG9naWVzLiBJIG1pc3NlZCB0aGlz
LiBDb25zaWRlciBpdC4uLgoKQWNrZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNp
dHJpeC5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
