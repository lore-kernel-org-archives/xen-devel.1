From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Wed, 19 Dec 2018 18:40:03 +0100
Message-ID: <20181219174003.prbkwhmkmga7cx45@mac.citrite.net>
References: <20181123085402.663pdh75rhqtxsf4@mac>
 <67fa7dc6-3aff-a5fd-4105-dce19a89448c@bitdefender.com>
 <20181127113205.ohli6saatlwid7ua@mac>
 <516bea73-f88a-9f96-9619-fa32f9726dca@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P3F3=O4=citrix.com=prvs=884ac7dec=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gZfpf-0008AQ-Mx
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 17:40:31 +0000
Content-Disposition: inline
In-Reply-To: <516bea73-f88a-9f96-9619-fa32f9726dca@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>, Andrei Vlad LUTAS <vlutas@bitdefender.com>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMTksIDIwMTggYXQgMDQ6NDk6NDNQTSArMDAwMCwgQWxleGFuZHJ1IFN0ZWZh
biBJU0FJTEEgd3JvdGU6Cj4gT24gMjcuMTEuMjAxOCAxMzozMiwgUm9nZXIgUGF1IE1vbm7DqSB3
cm90ZToKPiA+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGFkZCBzb21lIGtpbmQgb2YgZmxhZyB0
byB0aGUgZW11bGF0b3IgdG8KPiA+IHNpZ25hbCB3aGV0aGVyIHAybSByZXN0cmljdGlvbnMgc2hv
dWxkIGJlIGVuZm9yY2VkL2lnbm9yZWQ/Cj4gPiBodm1lbXVsX2FjcXVpcmVfcGFnZSBzZWVtcyBs
aWtlIGEgc3VpdGFibGUgcGxhY2UsIGJ1dCBJJ20gbm90IHRoYXQKPiA+IGZhbWlsaWFyIHdpdGgg
dGhlIGVtdWxhdG9yLgo+ID4gCj4gPiBUaGVuIHlvdSBjb3VsZCBnZW5lcmF0ZSB2bSBldmVudHMg
ZnJvbSB0aGUgZW11bGF0b3IgaXRzZWxmLCB3aGljaAo+ID4gQUZBSUNUIGlzIHRoZSBvbmx5IHdh
eSB0byBoYW5kbGUgdGhpcyBpbnN0cnVjdGlvbiBleGVjdXRpb24gaXNzdWUuCj4gCj4gSSd2ZSBi
ZWVuIHRlc3Rpbmcgd2hhdCBwbGFjZSB3b3VsZCBiZSB0aGUgYmVzdCB0byBoYXZlIHRoZSBlbXVs
YXRvciBzZW5kIAo+IGEgZXZlbnQgYW5kIGl0IHR1cm5zIG91dCB0aGUgaHZtZW11bF9hY3F1aXJl
X3BhZ2UgaXMgbm90IG9rLiBXaGF0IHdvcmtlZCAKPiBmb3JtIG1lIHdhcyBoYXZpbmcgdGhlIGVt
dWxhdG9yIHNlbmQgd3JpdGUgYWNjZXNzIHZpb2xhdGlvbnMgZnJvbSAKPiBodm1lbXVsX21hcF9s
aW5lYXJfYWRkcigpLiBIZXJlIEkgY2FuIGdldCB0aGUgZ2ZuLCBnbGEgYW5kIG9mZnNldCBmb3Ig
Cj4gdGhlIGV2ZW50Lgo+IAo+IEZvciB0aGUgZXhlYyBhY2Nlc3MgdmlvbGF0aW9uIEkndmUgdHJp
ZWQgdG8gc2VuZCBldmVudHMgZnJvbSAKPiBodm1lbXVsX2luc25fZmV0Y2goKSBidXQgdGhlcmUg
aXMgYSBwcm9ibGVtIHRvIGdldCB0aGUgc2FtZSB2YXJpYWJsZXMgCj4gZm9yIHRoZSBldmVudC4g
SXMgdGhlcmUgYSB3YXkgdG8gZ28gYXJvdW5kIGFuZCBnZXQgdGhvc2UgcGFyYW1zIGZvciB0aGUg
Cj4gZXZlbnQ/IEFueSB0aG91Z2h0cyBhcmUgYXBwcmVjaWF0ZWQuCgpZb3UgaGF2ZSB0aGUgSVAg
aW4gaHZtZW11bF9pbnNuX2ZldGNoLCBjYW4ndCB5b3UgZ2V0IHRoZSBnZm4gZnJvbQp0aGVyZT8g
RWl0aGVyIGRpcmVjdGx5IG9yIGJ5IHRyYW5zbGF0aW5nIHRoZSBnbGEgdG8gYSBnZm4gaWYgdGhl
IGd1ZXN0CmlzIHJ1bm5pbmcgd2l0aCBwYWdpbmcgZW5hYmxlZD8KClJvZ2VyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
