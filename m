From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 2/8] ARM: VGIC: split gic.c to observe
 hardware/virtual GIC separation
Date: Tue, 6 Feb 2018 14:06:22 +0000
Message-ID: <a3bc065b-ce74-7728-e7b2-fa309ccd6f42@arm.com>
References: <20180205161925.11054-1-andre.przywara@arm.com>
 <20180205161925.11054-3-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xglg=fa=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ej3tN-0001K9-Tz
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2018 14:06:37 +0000
In-Reply-To: <20180205161925.11054-3-andre.przywara@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMi8wNS8yMDE4IDA0OjE5IFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMu
Ywo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMjYzYjQzMDA3NQo+
IC0tLSAvZGV2L251bGwKPiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYwo+IEBAIC0wLDAg
KzEsMzk2IEBACj4gKy8qCj4gKyAqIHhlbi9hcmNoL2FybS9naWMtdmdpYy5jCj4gKyAqCj4gKyAq
IEFSTSBHZW5lcmljIEludGVycnVwdCBDb250cm9sbGVyIHZpcnR1YWxpemF0aW9uIHN1cHBvcnQK
PiArICoKPiArICogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+Cj4gKyAqIENvcHlyaWdodCAoYykg
MjAxMSBDaXRyaXggU3lzdGVtcy4KPiArICoKPiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29m
dHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKPiArICogaXQgdW5k
ZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNo
ZWQgYnkKPiArICogdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24g
MiBvZiB0aGUgTGljZW5zZSwgb3IKPiArICogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVy
c2lvbi4KPiArICoKPiArICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3Bl
IHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCj4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsg
d2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCj4gKyAqIE1FUkNIQU5UQUJJTElU
WSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKPiArICogR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KPiArICovCj4gKwo+ICsj
aW5jbHVkZSA8eGVuL2xpYi5oPgo+ICsjaW5jbHVkZSA8eGVuL2lycS5oPgo+ICsjaW5jbHVkZSA8
eGVuL3NjaGVkLmg+Cj4gKyNpbmNsdWRlIDx4ZW4vZXJybm8uaD4KClBsZWFzZSBvcmRlciB0aGVt
IGFscGhhYmV0aWNhbGx5LiBXaXRoIHRoYXQ6CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
