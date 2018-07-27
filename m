From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC] tools/kdd: avoid adversarial
 optimisation hazard
Date: Fri, 27 Jul 2018 11:38:45 +0100
Message-ID: <20180727103844.2ngq47dolvs2tfkf@citrix.com>
References: <20180726104633.1439-1-wei.liu2@citrix.com>
 <23385.49305.975138.215676@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w1em=kl=citrix.com=prvs=7393717b7=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fj094-0005be-Rb
 for xen-devel@lists.xenproject.org; Fri, 27 Jul 2018 10:38:50 +0000
Content-Disposition: inline
In-Reply-To: <23385.49305.975138.215676@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdWwgMjYsIDIwMTggYXQgMDE6Mzc6NDVQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2VpIExpdSB3cml0ZXMgKCJbUEFUQ0ggUkZDXSB0b29scy9rZGQ6IGF2b2lkIGFkdmVy
c2FyaWFsIG9wdGltaXNhdGlvbiBoYXphcmQiKToKPiA+IFRoZXJlIGhhdmUgYmVlbiB0d28gYXR0
ZW1wdHMgdG8gZml4IGtkZCBidWlsZCB3aXRoIGdjYyA4LjEKPiA+ICg0MzdlMDBmZSBhbmQgMmRl
MmIxMGIpLCBidXQgYnVpbGRpbmcgd2l0aCBnY2MgOC4xIDMyIGJpdCBub24tZGVidWcKPiA+IGJ1
aWxkIHN0aWxsIHlpZWxkcyB0aGUgc2FtZSBlcnJvciBhcyBpbiA0MzdlMDBmZS4KPiA+IAo+ID4g
SWFuIHdyb3RlIGFib3V0IGFkdmVyc2FyaWFsIG9wdGltaXNhdGlvbiBpbiBbMF0sIG9uZSBvZiB0
aGUga2V5IHBvaW50cwo+ID4gaXMgdGhhdCBjb21wdXRpbmcgYW4gb3V0LW9mLWJvdW5kcyBwb2lu
dGVyIGlzIFVCLgo+IC4uLgo+ID4gRWxpbWluYXRlIHRoYXQgVUIgYnkgdXNpbmcgdWludHB0cl90
IHRvIGF2b2lkIHRoZSBjb21waWxlciByZWFjaGluZwo+ID4gdGhlIGNvbmNsdXNpb24gdGhhdCBv
ZmZzZXQgPD0gc2l6ZW9mKGN0cmwpLgo+IAo+IFNpbmNlIEkgd3JvdGUgbXkgY29tcGxhaW50LCB0
aGUgY29kZSBoYXMgYmVlbiByZWFycmFuZ2VkIHNvIHRoYXQgaXQKPiBkb2VzIG5vdCBjYWxsIG1l
bWNweSBpZiB0aGUgYm91bmRzIGNoZWNrIGZhaWxzLiAgbkF0LCBsZWFzdCB3aGF0IEkKPiB3cm90
ZSBlYXJsaWVyLAo+IAo+ICB8ICBUaGVyZWZvcmUgICgodWludDhfdCAqKSZjdHJsLmMzMikgKyBv
ZmZzZXQKPiAgfCAgKHdoaWNoIGlzIGNhY2x1bGF0ZWQgdW5jb25kaXRpb25hbGx5KQo+ICB8ICBp
cyB3aXRoaW4gdGhlIHN0YWNrIG9iamVjdCBgY3RybCcuICAgCj4gCj4gaXMgbm90IHRydWUgb2Yg
Y3VycmVudCBzdGFnaW5nLgo+IAo+IEl0J3Mgc3RpbGwgdmVyeSBvYnNjdXJlIGJlY2FhdXNlIHRo
aXMgdGVzdAo+IAo+ICAgICAgICAgaWYgKG9mZnNldCA+IHNpemVvZiBjdHJsLmMzMiB8fCBvZmZz
ZXQgKyBsZW4gPiBzaXplb2YgY3RybC5jMzIpIHsKPiAKPiBkZXBlbmRzIGNyaXRpY2FsbHkgb24g
dGhlIHNpemUgb2Ygb2Zmc2V0LCBldGMuCj4gCj4gSXMgaXQgbm90IHN0aWxsIHBvc3NpYmxlIHRo
YXQgdGhpcyB0ZXN0IGNvdWxkIGJlIGZvb2xlZCA/ICBTdXBwb3NlCj4gb2Zmc2V0IGlzIDB4ZmZm
ZmZmZmYuICBUaGVuIGJlZm9yZSB0aGUgdGVzdCwgb2Zmc2V0IGlzIDB4ZmZmZmZkMzMuCgpJbiB0
aGlzIGNhc2UsIHdvdWxkbid0IG9mZnNldCA+IHNpemVvZiBjdHJsLmMzMiBiZWNvbWVzIHRydWU/
CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
