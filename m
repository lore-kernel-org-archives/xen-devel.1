From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] x86/svm: Fix svm_update_guest_efer() for
 domains using shadow paging
Date: Tue, 9 Oct 2018 05:26:40 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BDDEFE0@SHSMSX101.ccr.corp.intel.com>
References: <1538758946-12439-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1538758946-12439-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Tim Deegan <tim@xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogU2F0dXJkYXksIE9jdG9iZXIgNiwgMjAxOCAxOjAyIEFNDQo+IA0KPiBXaGVuIHVz
aW5nIHNoYWRvdyBwYWdpbmcsIEVGRVIuTlggaXMgYSBYZW4gY29udHJvbGxlZCBiaXQsIGFuZCBp
cyByZXF1aXJlZA0KPiBieQ0KPiB0aGUgc2hhZG93IHBhZ2VmYXVsdCBoYW5kbGVyIHRvIGRpc3Rp
bmd1aXNoIGluc3RydWN0aW9uIGZldGNoZXMgZnJvbSBkYXRhDQo+IGFjY2Vzc2VzLg0KPiANCj4g
VGhpcyBjYW4gYmUgb2JzZXJ2ZWQgYnkgYSBndWVzdCB3aGljaCBoYXMgTlggYW5kIFNNRVAgY2xl
YXIgYnV0IFNNQVANCj4gYWN0aXZlIGJ5DQo+IGF0dGVtcHRpbmcgdG8gZXhlY3V0ZSBjb2RlIG9u
IGEgdXNlciBtYXBwaW5nLiAgVGhlIGZpcnN0IGF0dGVtcHQgdG8gYnVpbGQNCj4gdGhlDQo+IHRh
cmdldCBzaGFkb3cgd2lsbCAjUEYgc28gaXMgaGFuZGxlZCBieSB0aGUgc2hhZG93IGNvZGUsIGJ1
dCB3aGVuIHdhbGtpbmcNCj4gdGhlDQo+IHRoZSBndWVzdCBwYWdldGFibGVzLCB0aGUgbGFjayBv
ZiBQRkVDX2luc25fZmV0Y2ggYmVpbmcgc2lnbmFsbGVkIGNhdXNlcyB0aGUNCj4gc2hhZG93IGNv
ZGUgdG8gbWlzdGFrZSB0aGUgaW5zdHJ1Y3Rpb24gZmV0Y2ggZm9yIGEgZGF0YSBmZXRjaCwgYW5k
IGJlbGlldmUNCj4gdGhhdCBpdCBpcyBhIHJlYWwgZ3Vlc3QgZmF1bHQuICBBcyBhIHJlc3VsdCwg
dGhlIGd1ZXN0IHJlY2VpdmVzICNQRlstZC1zclBdDQo+IGZvciBhbiBhY3Rpb24gd2hpY2ggc2hv
dWxkIGNvbXBsZXRlIHN1Y2Nlc3NmdWxseS4NCj4gDQo+IFRoZSBzdXNwaWNpb3VzLWxvb2tpbmcg
Z3ltbmFzdGljcyB3aXRoIExNRSBpcyBhY3R1YWxseSBhIHN1YnRsZSBjb3JuZXIgY2FzZQ0KPiB3
aXRoIHNoYWRvdyBwYWdpbmcuICBXaGVuIGRyb3BwaW5nIG91dCBvZiBMb25nIE1vZGUsIGEgZ3Vl
c3RzIGNob2ljZSBvZg0KPiBMTUUNCj4gYW5kIFhlbidzIGNob2ljZSBvZiBDUjAuUEcgY2F1c2Ug
aGFyZHdhcmUgdG8gb3BlcmF0ZSBpbiBMb25nIE1vZGUsIGJ1dA0KPiB0aGUNCj4gc2hhZG93IGNv
ZGUgdG8gb3BlcmF0ZSBpbiAyLW9uLTMgbW9kZS4NCj4gDQo+IEluIGFkZGl0aW9uIHRvIGRlc2Ny
aWJpbmcgdGhpcyBjb3JuZXIgY2FzZSBpbiB0aGUgU1ZNIHNpZGUsIGV4dGVuZCB0aGUNCj4gY29t
bWVudA0KPiBmb3IgdGhlIHNhbWUgZml4IG9uIHRoZSBWVC14IHNpZGUuICAoSSBoYXZlIGEgc3Vz
cGljaW9uIHRoYXQgSSd2ZSBqdXN0IHdvcmtlZA0KPiBvdXQgd2h5IFZULXggZG9lc24ndCB0b2xl
cmF0ZSBMTUEgIT0gTE1FIHdoZW4gVW5yZXN0cmljdGVkIEd1ZXN0IGlzIGNsZWFyLikNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
