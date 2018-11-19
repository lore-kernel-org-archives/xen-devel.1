From: Juergen Gross <jgross@suse.com>
Subject: Re: Guest soft lockups with "xen: make xen_qlock_wait()
 nestable"
Date: Mon, 19 Nov 2018 08:05:03 +0100
Message-ID: <ecb78f93-2dbb-1e90-5be6-f71a1050ef31@suse.com>
References: <3a55659d-4d7e-ea03-0c46-cd115ff1d8f9@eikelenboom.it>
 <c007d98d-1744-f40c-a801-8c1956605d29@suse.com>
 <9e2d3c8a-07b8-dcf8-fb52-0071b63b92d2@eikelenboom.it>
 <4a3e30f5-917e-ea54-0ff9-8135ee3bd4a4@suse.com>
 <5a0a87ee-c029-b503-fce0-54dc55793685@eikelenboom.it>
 <25d57755-d2db-3c7e-d72c-7f2ad612ae91@suse.com>
 <1a44de8669e05d8d895661464bd61cc635f49387.camel@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rtps=n6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gOdcJ-0006Zx-SX
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 07:05:07 +0000
In-Reply-To: <1a44de8669e05d8d895661464bd61cc635f49387.camel@infradead.org>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Woodhouse <dwmw2@infradead.org>, Sander Eikelenboom <linux@eikelenboom.it>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMTEvMjAxOCAwMDoyMiwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIFRodSwgMjAx
OC0xMS0wOCBhdCAxMToxOCArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT2gsIHNvcnJ5
LiBPZiBjb3Vyc2UgaXQgZG9lcy4gRGVyZWZlcmVuY2luZyBhIHBlcmNwdSB2YXJpYWJsZQo+PiBk
aXJlY3RseSBjYW4ndCB3b3JrLiBIb3cgc2lsbHkgb2YgbWUuCj4+Cj4+IFRoZSBhdHRhY2hlZCB2
YXJpYW50IHNob3VsZCByZXBhaXIgdGhhdC4gVGVzdGVkIHRvIG5vdCBicmVhayBib290aW5nLgo+
IAo+IFN0cmljdGx5IHNwZWFraW5nLCBzaG91bGRuJ3QgeW91IGhhdmUgYW4gYXRvbWljX2luaXQo
KSBpbiB0aGVyZQo+IHNvbWV3aGVyZT8KCmF0b21pY190IHZhcmlhYmxlcyBpbml0aWFsaXplZCB3
aXRoIDAgKGUuZy4gc3RhdGljIG9uZXMpIHNlZW0gbm90IHRvCnJlcXVpcmUgYXRvbWljX2luaXQo
KSAob3IgQVRPTUlDX0lOSVQpLiBEb2N1bWVudGF0aW9uL2F0b21pY190LnR4dApkb2Vzbid0IG1l
bnRpb24gdGhlIG5lZWQgdG8gdXNlIGl0IGluIHRoaXMgY2FzZS4gU28gSSBndWVzcyBpdCBpcyBh
Cm1hdHRlciBvZiB0YXN0ZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
