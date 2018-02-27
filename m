From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 3/6] x86: Handle the Xen MSRs via the new
 guest_{rd, wr}msr() infrastructure
Date: Tue, 27 Feb 2018 01:28:29 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19101BF85@SHSMSX101.ccr.corp.intel.com>
References: <1519666519-16311-1-git-send-email-andrew.cooper3@citrix.com>
 <1519666519-16311-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519666519-16311-4-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgMjcsIDIwMTggMTozNSBBTQ0KPiANCj4gRGlzcGF0
Y2ggZnJvbSB0aGUgZ3Vlc3Rfe3JkLHdyfW1zcigpIGZ1bmN0aW9ucywgYWZ0ZXIgZmFsbGluZyB0
aHJvdWdoIGZyb20NCj4gdGhlDQo+ICFpc192aXJpZGlhbl9kb21haW4oKSBjYXNlLg0KPiANCj4g
UmVuYW1lIHtyZCx3cn1tc3JfaHlwZXJ2aXNvcl9yZWdzKCkgdG8gZ3Vlc3Rfe3JkLHdyfW1zcl94
ZW4oKSBmb3INCj4gY29uc2lzdGVuY3ksDQo+IGFuZCBiZWNhdXNlIHRoZSBfcmVncyBzdWZmaXgg
aXNuJ3QgdmVyeSBhcHByb3ByaWF0ZS4NCj4gDQo+IFVwZGF0ZSB0aGVtIHRvIHRha2UgYSB2Y3B1
IHBvaW50ZXIgcmF0aGVyIHRoYW4gcHJlc3VtaW5nIHRoYXQgdGhleSBhY3Qgb24NCj4gY3VycmVu
dCwgYW5kIHN3aXRjaCB0byB1c2luZyBYODZFTVVMXyogcmV0dXJuIHZhbHVlcy4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoN
ClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
