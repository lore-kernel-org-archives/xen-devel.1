From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] dom_cow is needed for mem-sharing only
Date: Fri, 31 May 2019 10:13:38 -0700
Message-ID: <ce4543b6-d8d0-aa62-cc80-1aebb01abcd7@citrix.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zAi+=T7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWl6C-0004Xs-5D
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 17:13:48 +0000
In-Reply-To: <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDUvMjAxOSAwMjozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQSBjb3VwbGUgb2YgYWRq
dXN0bWVudHMgYXJlIG5lZWRlZCB0byBjb2RlIGNoZWNraW5nIGZvciBkb21fY293LCBidXQKPiBz
aW5jZSB0aGVyZSBhcmUgcHJldHR5IGZldyBpdCBpcyBwcm9iYWJseSBiZXR0ZXIgdG8gYWRqdXN0
IHRob3NlIHRoYW4KPiB0byBzZXQgdXAgYW5kIGtlZXAgYXJvdW5kIGEgbmV2ZXIgdXNlZCBkb21h
aW4uCj4KPiBUYWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgdGlnaHRlbiBhIEJVR19PTigpIGluIGVt
dWwtcHJpdi1vcC5jOnJlYWRfY3IoKS4KPiAoQXJndWFibHkgdGhpcyBwZXJoYXBzIHNob3VsZG4n
dCBiZSBhIEJVR19PTigpIGluIHRoZSBmaXJzdCBwbGFjZS4pCgpZZXMgLSBpdCBzaG91bGQgYmUg
QVNTRVJUX1VOUkVBQ0hBQkxFKCkvZG9tYWluX2NyYXNoKCkKCkknbSBub3QgZnVzc2VkIGlmIHRo
aXMgZG9uZSBhcyBwYXJ0IG9mIHRoaXMgcGF0Y2gsIG9yIHNwbGl0IG91dApzZXBhcmF0ZWx5LsKg
IEl0IGFsbW9zdCBkb2Vzbid0IHNlZW0gd29ydGggc3BsaXR0aW5nIG91dC4KCj4gLS0tIGEveGVu
L2luY2x1ZGUveGVuL21tLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbW0uaAo+IEBAIC02NDQs
NiArNjQ0LDkgQEAgc3RhdGljIGlubGluZSB2b2lkIGZpbHRlcmVkX2ZsdXNoX3RsYl9tYQo+ICAK
PiAgLyogUHJpdmF0ZSBkb21haW4gc3RydWN0cyBmb3IgRE9NSURfWEVOLCBET01JRF9JTywgZXRj
LiAqLwo+ICBleHRlcm4gc3RydWN0IGRvbWFpbiAqZG9tX3hlbiwgKmRvbV9pbywgKmRvbV9jb3c7
Cj4gKyNpZm5kZWYgQ09ORklHX0hBU19NRU1fU0hBUklORwo+ICsjIGRlZmluZSBkb21fY293IE5V
TEwKPiArI2VuZGlmCj4gIAo+ICBlbnVtIFhFTlNIQVJFX2ZsYWdzIHsKPiAgICAgIFNIQVJFX3J3
LAo+Cj4KPgoKV2hhdCBpcyB3cm9uZyB3aXRoCgojaWZkZWYgQ09ORklHX0hBU19NRU1fU0hBUklO
RwpleHRlcm4gc3RydWN0IGRvbWFpbiAqZG9tX2NvdzsKI2Vsc2UKIyBkZWZpbmUgZG9tX2NvdyBO
VUxMCiNlbmRpZgoKd2hpY2ggaXMgaG93IHdlIHVzdWFsbHkgZXhwcmVzcyB0aGluZ3MgbGlrZSB0
aGlzP8KgIFN1cmUsIGl0cyBhIHRpbnkgYml0CmxvbmdlciB0byB3cml0ZSwgYnV0IGl0IGlzIGVh
c2llciB0byBmb2xsb3cuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
