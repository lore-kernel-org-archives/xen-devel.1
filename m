From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/9] vm_event: Simplify vm_event interface
Date: Fri, 31 May 2019 16:43:00 -0700
Message-ID: <12a39c6e-6e4e-1bbe-47e4-ad13769acdae@citrix.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <922965b261f4ca23bcb276d6907f36c892c2478b.1559224640.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zAi+=T7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWrB1-0004X7-Jf
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 23:43:11 +0000
In-Reply-To: <922965b261f4ca23bcb276d6907f36c892c2478b.1559224640.git.ppircalabu@bitdefender.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDUvMjAxOSAwNzoxOCwgUGV0cmUgUGlyY2FsYWJ1IHdyb3RlOgo+IFRoZSBkb21haW4g
cmVmZXJlbmNlIGNhbiBiZSBwYXJ0IG9mIHRoZSB2bV9ldmVudF9kb21haW4gc3RydWN0dXJlCj4g
YmVjYXVzZSBmb3IgZXZlcnkgY2FsbCB0byBhIHZtX2V2ZW50IGludGVyZmFjZSBmdW5jdGlvbiBi
b3RoIHRoZSBsYXR0ZXIKPiBhbmQgaXQncyBjb3JyZXNwb25kaW5nIGRvbWFpbiBhcmUgcGFzc2Vk
IGFzIHBhcmFtZXRlcnMuCgpJdCBjYW4sIGJ1dCB3aHkgaXMgYWRkaW5nIGEgYmFja3BvaW50ZXIg
aGVscGZ1bD8KCkkgYXNrIGJlY2F1c2UgSSBzZWUgNSByZWFkcyBvZiB2ZWQtPmQsIGFuZCBub3Ro
aW5nIHdoaWNoIGV2ZXIKaW5pdGlhbGlzZXMgaXQuCgpUaGlzIHNob3VsZCBiZSBzcGxpdCBpbnRv
IHR3byBwYXRjaGVzLsKgIFRoZSBmaXJzdCB3aGljaCBhZGRzIHRoZQpiYWNrcG9pbnRlciwgd2l0
aCB3b3JraW5nIGluaXRpYWxpc2F0aW9uLCBhbmQgdGhlIHNlY29uZCB3aGljaCBkcm9wcyB0aGUK
c3RydWN0IGRvbWFpbiBwYXJhbWV0ZXIgZnJvbSB0aGUgaW1wYWN0ZWQgQVBJcy4KCn5BbmRyZXcK
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9w
Mm0uYwo+IGluZGV4IDRjOTk1NDguLjYyNWZjOWIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2
L21tL3AybS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4gQEAgLTE3MDQsOCArMTcw
NCw3IEBAIHZvaWQgcDJtX21lbV9wYWdpbmdfcG9wdWxhdGUoc3RydWN0IGRvbWFpbiAqZCwgdW5z
aWduZWQgbG9uZyBnZm5fbCkKPiAgICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm0gPSBwMm1fZ2V0
X2hvc3RwMm0oZCk7Cj4gIAo+ICAgICAgLyogV2UncmUgcGFnaW5nLiBUaGVyZSBzaG91bGQgYmUg
YSByaW5nICovCj4gLSAgICBpbnQgcmMgPSB2bV9ldmVudF9jbGFpbV9zbG90KGQsIGQtPnZtX2V2
ZW50X3BhZ2luZyk7Cj4gLQo+ICsgICAgaW50IHJjID0gdm1fZXZlbnRfY2xhaW1fc2xvdChkLT52
bV9ldmVudF9wYWdpbmcpOwoKWW91J3ZlIGRyb3BwZWQgYSBuZXdsaW5lIGhlcmUsIHdoaWNoIHNo
b3VsZCBiZSByZXRhaW5lZC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
