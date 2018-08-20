From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH RESEND] x86/xen: enable early use of
 set_fixmap in 32-bit Xen PV guest
Date: Mon, 20 Aug 2018 19:20:17 -0400
Message-ID: <95bde638-877d-c9b4-0457-dfeea06fd7dc__10763.3806103424$1534807075$gmane$org@oracle.com>
References: <20180820152420.16004-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=r5nf=ld=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1frtRw-0006pt-8A
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 23:19:04 +0000
In-Reply-To: <20180820152420.16004-1-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMjAvMjAxOCAxMToyNCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBDb21taXQgN2Iy
NWI5Y2IwZGFkODMgKCJ4ODYveGVuL3RpbWU6IEluaXRpYWxpemUgcHYgeGVuIHRpbWUgaW4KPiBp
bml0X2h5cGVydmlzb3JfcGxhdGZvcm0oKSIpIG1vdmVkIHRoZSBtYXBwaW5nIG9mIHRoZSBzaGFy
ZWQgaW5mbyBhcmVhCj4gYmVmb3JlIHBhZ2V0YWJsZV9pbml0KCkuIFRoaXMgYnJlYWtzIGJvb3Rp
bmcgYXMgMzItYml0IFBWIGd1ZXN0IGFzIHRoZQo+IHVzZSBvZiBzZXRfZml4bWFwIGlzbid0IHBv
c3NpYmxlIGF0IHRoaXMgdGltZSBvbiAzMi1iaXQuCj4KPiBUaGlzIGNhbiBiZSB3b3JrZWQgYXJv
dW5kIGJ5IHBvcHVsYXRpbmcgdGhlIG5lZWRlZCBQTUQgb24gMzItYml0Cj4ga2VybmVsIGVhcmxp
ZXIuCj4KPiBJbiBvcmRlciBub3QgdG8gcmVpbXBsZW1lbnQgcG9wdWxhdGVfZXh0cmFfcHRlKCkg
dXNpbmcgZXh0ZW5kX2JyaygpCj4gZm9yIGFsbG9jYXRpbmcgbmV3IHBhZ2UgdGFibGVzIGV4dGVu
ZCBhbGxvY19sb3dfcGFnZXMoKSB0byBkbyB0aGF0IGluCj4gY2FzZSB0aGUgZWFybHkgcGFnZSB0
YWJsZSBwb29sIGlzIG5vdCB5ZXQgYXZhaWxhYmxlLgo+Cj4gRml4ZXM6IDdiMjViOWNiMGRhZDgz
ICgieDg2L3hlbi90aW1lOiBJbml0aWFsaXplIHB2IHhlbiB0aW1lIGluIGluaXRfaHlwZXJ2aXNv
cl9wbGF0Zm9ybSgpIikKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRl
Pgo+IC0tLQo+IFJlc2VuZGluZyB3aXRoIGNvcnJlY3RlZCBGaXhlczogdGFnCj4gQm9yaXMsIHBs
ZWFzZSB0YWtlIHRoaXMgdmlhIHRoZSBYZW4gdHJlZSAoVGhvbWFzIGFza2VkIHVzIHRvIGRvIHNv
KQoKQXBwbGllZCB0byBmb3ItbGludXMtMTliLgoKLWJvcmlzCgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
