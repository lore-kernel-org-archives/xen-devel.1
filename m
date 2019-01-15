From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] doc: correct default scheduler in
 xen-command-line.pandoc
Date: Tue, 15 Jan 2019 12:45:41 +0100
Message-ID: <27bc85da-176d-8580-e891-b3a23d117b8f@suse.com>
References: <20190115113510.27121-1-jgross@suse.com>
 <9702a712-278d-583a-976a-9255caac6214@citrix.com>
 <16cd9a9e-e879-7869-d494-f439c6499d13@suse.com>
 <0bebf5d6-a1ab-b9bb-d12f-be0e92eefe5c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=93tI=PX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gjNA8-0002Ro-NB
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 11:45:44 +0000
In-Reply-To: <0bebf5d6-a1ab-b9bb-d12f-be0e92eefe5c@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDEvMjAxOSAxMjo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNS8wMS8yMDE5
IDExOjQwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAxNS8wMS8yMDE5IDEyOjM4LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOgo+Pj4gT24gMTUvMDEvMjAxOSAxMTozNSwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPj4+PiBXZSBoYXZlIHN3aXRjaGVkIHRvIGNyZWRpdDIuIExldCB0aGUgZG9jdW1lbnRh
dGlvbiByZWZsZWN0IHRoYXQuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4gLS0tCj4+Pj4gIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1s
aW5lLnBhbmRvYyB8IDIgKy0KPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hlbi1jb21tYW5k
LWxpbmUucGFuZG9jIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCj4+Pj4gaW5k
ZXggZDM5YmNlZTkyOC4uZTI0ZTNhNDVlNCAxMDA2NDQKPj4+PiAtLS0gYS9kb2NzL21pc2MveGVu
LWNvbW1hbmQtbGluZS5wYW5kb2MKPj4+PiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGlu
ZS5wYW5kb2MKPj4+PiBAQCAtMTcwNSw3ICsxNzA1LDcgQEAgd2l0aCByZWFkIGFuZCB3cml0ZSBw
ZXJtaXNzaW9ucy4KPj4+PiAgIyMjIHNjaGVkCj4+Pj4gID4gYD0gY3JlZGl0IHwgY3JlZGl0MiB8
IGFyaW5jNjUzIHwgcnRkcyB8IG51bGxgCj4+Pj4gIAo+Pj4+IC0+IERlZmF1bHQ6IGBzY2hlZD1j
cmVkaXRgCj4+Pj4gKz4gRGVmYXVsdDogYHNjaGVkPWNyZWRpdDJgCj4+Pj4gIAo+Pj4+ICBDaG9v
c2UgdGhlIGRlZmF1bHQgc2NoZWR1bGVyLgo+Pj4+ICAKPj4+IExpa2UgWFNNLCB0aGlzIGlzIEtj
b25maWcgY29udHJvbGxlZCwgbm90IGEgc3RhdGljIGRlZmF1bHQsIGFuZCBhbHNvCj4+PiBkZXBl
bmRzIG9uIHRoZSBjb21waWxlZCBzY2hlZHVsZXJzLsKgIFRoaXMgc2hvdWxkIHJlYWQgc29tZXRo
aW5nIGxpa2U6Cj4+Pgo+Pj4+IERlZmF1bHQ6IHNlbGVjdGFibGUgdmlhIEtjb25maWcuwqAgRGVw
ZW5kcyBvbiBlbmFibGVkIHNjaGVkdWxlcnMuCj4+IFRoZSBLY29uZmlnIGRlZmF1bHQgaXMgY3Jl
ZGl0Mi4KPiAKPiBPbmx5IHdoZW4gY3JlZGl0MiBpcyBjb21waWxlZCBpbiwgd2hpY2ggaXNuJ3Qg
ZXZlbiB0aGUgdGhlIGNhc2UgZm9yIGFsbAo+IEtjb25maWcgZnJhZ21lbnRzIHdlIGhhdmUgaW4g
dHJlZS4KCkkgc3RpbGwgdGhpbmsgaXQgaXMgc2Vuc2libGUgdG8gc3BlY2lmeSBhbiBhY3R1YWwg
ZGVmYXVsdCBoZXJlLgoKQWRkaW5nIG90aGVyIGNhdmVhdHMgZm9yIHNwZWNpYWwgS2NvbmZpZyB2
YXJpYW50cyBtaWdodCBiZSBva2F5LCBidXQKdGhpcyBzaG91bGQgYmUgYW5vdGhlciBwYXRjaCB0
aGVuIChwb3N0IDQuMTIgcHJvYmFibHkpLgoKSW4gdGhlIGVuZCBvbmUgb2YgdGhlIGZlYXR1cmVz
IGhpZ2hsaWdodGVkIGZvciA0LjEyIHdpbGwgYmU6CgoiQ3JlZGl0IDIgaXMgbm93IHRoZSBkZWZh
dWx0IHNjaGVkdWxlciIuCgpPdXIgZG9jdW1lbnRhdGlvbiBzaG91bGQgcmVmbGVjdCB0aGF0LgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
