From: "DeGraaf, Daniel G" <dgdegra@nsa.gov>
Subject: Re: [PATCH v3 11/15] xsm,
 argo: XSM control for argo register
Date: Mon, 7 Jan 2019 23:07:27 +0000
Message-ID: <BA190A75E8413C49BB9E1D2B85D118118CBCC2F6@MSMR-GH1-UEA01.corp.nsa.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eyHh=PP=nsa.gov=dgdegra@srs-us1.protection.inumbo.net>)
 id 1ggdzZ-0001C6-NV
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 23:07:33 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Christopher Clark' <christopher.w.clark@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSCB2MyAxMS8xNV0geHNtLCBhcmdvOiBYU00gY29udHJvbCBmb3Ig
YXJnbyByZWdpc3Rlcg0KPiANCj4gWFNNIGNvbnRyb2xzIGZvciBhcmdvIHJpbmcgcmVnaXN0cmF0
aW9uIHdpdGggdHdvIGRpc3RpbmN0IGNhc2VzLCB3aGVyZQ0KPiB0aGUgcmluZyBiZWluZyByZWdp
c3RlcmVkIGlzOg0KPiANCj4gMSkgU2luZ2xlIHNvdXJjZTogIHJlZ2lzdGVyaW5nIGEgcmluZyBm
b3IgY29tbXVuaWNhdGlvbiB0byByZWNlaXZlIG1lc3NhZ2VzDQo+ICAgICAgICAgICAgICAgICAg
ICBmcm9tIGEgc3BlY2lmaWVkIHNpbmdsZSBvdGhlciBkb21haW4uDQo+ICAgIERlZmF1bHQgcG9s
aWN5OiBhbGxvdy4NCj4gDQo+IDIpIEFueSBzb3VyY2U6ICAgICByZWdpc3RlcmluZyBhIHJpbmcg
Zm9yIGNvbW11bmljYXRpb24gdG8gcmVjZWl2ZSBtZXNzYWdlcw0KPiAgICAgICAgICAgICAgICAg
ICAgZnJvbSBhbnksIG9yIGFsbCwgb3RoZXIgZG9tYWlucyAoaWUuIHdpbGRjYXJkKS4NCj4gICAg
RGVmYXVsdCBwb2xpY3k6IGRlbnksIHdpdGggcnVudGltZSBwb2xpY3kgY29uZmlndXJhdGlvbiB2
aWEgYm9vdHBhcmFtLg0KPiANCj4gVGhlIGV4aXN0aW5nIGFyZ28tbWFjIGJvb3QgcGFyYW1ldGVy
IGluZGljYXRlcyBhZG1pbmlzdHJhdG9yIHByZWZlcmVuY2UgZm9yDQo+IGVpdGhlciBwZXJtaXNz
aXZlIG9yIHN0cmljdCBhY2Nlc3MgY29udHJvbCwgd2hpY2ggd2lsbCBhbGxvdyBvciBkZW55DQo+
IHJlZ2lzdHJhdGlvbiBvZiBhbnktc2VuZGVyIHJpbmdzLg0KPiANCj4gVGhpcyBjb21taXQgbW9k
aWZpZXMgdGhlIHNpZ25hdHVyZSBvZiBjb3JlIFhTTSBob29rIGZ1bmN0aW9ucyBpbiBvcmRlciB0
bw0KPiBhcHBseSAnY29uc3QnIHRvIGFyZ3VtZW50cywgbmVlZGVkIGluIG9yZGVyIGZvciAnY29u
c3QnIHRvIGJlIGFjY2VwdGVkIGluDQo+IHNpZ25hdHVyZSBvZiBmdW5jdGlvbnMgdGhhdCBpbnZv
a2UgdGhlbS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3Rv
cGhlci5jbGFyazZAYmFlc3lzdGVtcy5jb20+DQoNCkFja2VkLWJ5OiBEYW5pZWwgRGUgR3JhYWYg
PGRnZGVncmFAdHljaG8ubnNhLmdvdj4NCg0KV2hpbGUgaXQgZG9lcyBub3QgbmVlZCB0byBiZSBh
IHBhcnQgb2YgdGhpcyBwYXRjaCwgc29tZXdoZXJlIGluIHRoZSBzZXJpZXMgeW91IHNob3VsZCBh
ZGQgYSBydWxlIGFsbG93aW5nIHRoZXNlIGZlYXR1cmVzIHRvIGJlIHVzZWQgYnkgZ3Vlc3RzIGlu
IHRoZSBkZWZhdWx0IFhTTSBwb2xpY3k7IHRvb2xzL2ZsYXNrL3BvbGljeS9tb2R1bGVzL2d1ZXN0
X2ZlYXR1cmVzLnRlIGlzIHdoZXJlIGZlYXR1cmVzIGxpa2UgdGhpcyBoYXZlIHByZXZpb3VzbHkg
YmVlbiBoYW5kbGVkLiAgU2luY2UgeW91J3JlIGFkZGluZyBwZXJtaXNzaW9ucyBvbmUgYXQgYSB0
aW1lLCB5b3UgY291bGQgYWRkIHRoZSBydWxlcyBhbGwgYXQgb25jZSBvciBhcyBhIHBhcnQgb2Yg
dGhlIHBhdGNoIGFkZGluZyB0aGUgdmVjdG9yLg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
