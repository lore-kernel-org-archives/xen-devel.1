From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
Subject: Re: [PATCH RFC 0/6] Slotted channels for sync vm_events
Date: Wed, 6 Feb 2019 14:26:50 +0000
Message-ID: <bda834e7f6241dea248fb996c3f49ed76699ebb3.camel@bitdefender.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kUve=QN=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1grOAA-00074b-Fq
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 14:26:54 +0000
In-Reply-To: <cover.1545245243.git.ppircalabu@bitdefender.com>
Content-Language: en-US
Content-ID: <79F8F6E233A787499E86D74ACB82CBF3@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyMDE4LTEyLTE5IGF0IDIwOjUyICswMjAwLCBQZXRyZSBQaXJjYWxhYnUgd3JvdGU6
DQo+IFRoaXMgcGF0Y2hzZXQgaXMgYSByZXdvcmsgb2YgdGhlICJtdWx0aS1wYWdlIHJpbmcgYnVm
ZmVyIiBmb3INCj4gdm1fZXZlbnRzDQo+IHBhdGNoIGJhc2VkIG9uIEFuZHJldyBDb29wZXIncyBj
b21tZW50cy4NCj4gRm9yIHN5bmNocm9ub3VzIHZtX2V2ZW50cyB0aGUgcmluZyB3YWl0cXVldWUg
bG9naWMgd2FzIHVubmVjZXNzYXJ5IGFzDQo+IHRoZQ0KPiB2Y3B1IHNlbmRpbmcgdGhlIHJlcXVl
c3Qgd2FzIGJsb2NrZWQgdW50aWwgYSByZXNwb25zZSB3YXMgcmVjZWl2ZWQuDQo+IFRvIHNpbXBs
aWZ5IHRoZSByZXF1ZXN0L3Jlc3BvbnNlIG1lY2hhbmlzbSwgYW4gYXJyYXkgb2Ygc2xvdHRlZA0K
PiBjaGFubmVscw0KPiB3YXMgY3JlYXRlZCwgb25lIHBlciB2Y3B1LiBFYWNoIHZjcHUgcHV0cyB0
aGUgcmVxdWVzdCBpbiB0aGUNCj4gY29ycmVzcG9uZGluZyBzbG90IGFuZCBibG9ja3MgdW50aWwg
dGhlIHJlc3BvbnNlIGlzIHJlY2VpdmVkLg0KPiANCj4gSSdtIHNlbmRpbmcgdGhpcyBwYXRjaCBh
cyBhIFJGQyBiZWNhdXNlLCB3aGlsZSBJJ20gc3RpbGwgd29ya2luZyBvbg0KPiB3YXkgdG8NCj4g
bWVhc3VyZSB0aGUgb3ZlcmFsbCBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudCwgeW91ciBmZWVkYmFj
ayB3b3VsZCBiZSBhDQo+IGdyZWF0DQo+IGFzc2lzdGFuY2UuDQo+IA0KDQpJcyBhbnlvbmUgc3Rp
bGwgdXNpbmcgYXN5bmNocm9ub3VzIHZtX2V2ZW50IHJlcXVlc3RzPyAodGhlIHZjcHUgaXMgbm90
DQpibG9ja2VkIGFuZCBubyByZXNwb25zZSBpcyBleHBlY3RlZCkuDQpJZiBub3QsIEkgc3VnZ2Vz
dCB0aGF0IHRoZSBmZWF0dXJlIHNob3VsZCBiZSByZW1vdmVkIGFzIGl0DQooc2lnbmlmaWNhbnRs
eSkgaW5jcmVhc2VzIHRoZSBjb21wbGV4aXR5IG9mIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9u
Lg0KDQpNYW55IHRoYW5rcywNClBldHJlDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
