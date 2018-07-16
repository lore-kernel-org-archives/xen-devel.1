From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/8] x86: (command line option to) avoid use
 of secondary hyper-threads
Date: Mon, 16 Jul 2018 13:37:53 +0100
Message-ID: <4043e550-20d0-11b8-07b7-8274afc96957@citrix.com>
References: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
 <5B45F3C702000078001D316D@prv1-mh.provo.novell.com>
 <55886b2f-e5bb-c2c5-b6e5-a5d0c898b876@citrix.com>
 <5B485F0E02000078001D3ABE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pxdv=ka=citrix.com=prvs=728a4bfaa=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ff2n4-00029p-Qa
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 12:39:46 +0000
In-Reply-To: <5B485F0E02000078001D3ABE@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDcvMTggMDk6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDEyLjA3LjE4IGF0
IDE3OjQ1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDExLzA3LzE4
IDEzOjEwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFu
ZC1saW5lLm1hcmtkb3duCj4+PiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJr
ZG93bgo+Pj4gQEAgLTEwNDAsNiArMTA0MCwxMyBAQCBpZGVudGljYWwgdG8gdGhlIGJvb3QgQ1BV
IHdpbGwgYmUgcGFya2VkCj4+PiAgIyMjIGhwZXRicm9hZGNhc3QgKHg4NikKPj4+ICA+IGA9IDxi
b29sZWFuPmAKPj4+ICAKPj4+ICsjIyMgaHQgKHg4NikKPj4gSSdkIHN1Z2dlc3Qgc210IHJhdGhl
ciB0aGFuIGh0IGhlcmUuICBTTVQgaXMgdGhlIHRlY2huaWNhbCB0ZXJtLCB3aGlsZQo+PiBIVCBp
cyBJbnRlbCdzIG1hcmtldGluZyBuYW1lLgo+IEhtbSwgbWFueSBCSU9TZXMgKGlmIHRoZSBoYXZl
IHN1Y2ggYW4gb3B0aW9uKSB0YWxrIGFib3V0IEhULCB3aGljaAo+IHRvIG1lIG1ha2VzICJodCIg
YSBjbG9zZXIgbWF0Y2guIEhvdyBhYm91dCB3ZSBhbGxvdyBib3RoPwoKVGhhdCdzIGJlY2F1c2Ug
YSBCSU9TIGlzIGN1c3RvbSB0byB0aGUgaGFyZHdhcmUgaXQgcnVucyBvbi4KCkhhdmUgeW91IHRy
aWVkIHNldHRpbmcgdXAgYW4gYWxpYXMgYmVmb3JlPyAoZ2l2ZW4gdGhlIHNwZWNpZmljCmRlZmlj
aWVuY3kgb2YgdGhlICpfcGFyYW0oKSBpbmZyYXN0cnVjdHVyZSBpbiB0aGlzIGFyZWEpwqAgSSdt
IGRvbid0CnRoaW5rIGFuIGFsaWFzIGlzIHdvcnRoIHRoZSBlZmZvcnQuCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
