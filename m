From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Suspicious code in p2m_set_altp2m_mem_access
Date: Wed, 3 Apr 2019 14:52:56 +0000
Message-ID: <b9e22669-5330-06fa-9799-7ccbc8955703@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=41FP=SF=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hBhG8-0005vC-UD
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 14:53:00 +0000
Content-Language: en-US
Content-ID: <FF0459F2ACB6AF4C842C2CB42D64BC5F@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "jbeulich@suse.com" <jbeulich@suse.com>, "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLA0KDQpJIGNhbWUgYWNyb3NzIHNvbWUgY29kZSBpbiB0aGUgcDJtX3NldF9hbHRwMm1f
bWVtX2FjY2VzcygpIHRoYXQgZG9lcyBub3QgDQpzZWVtIHJpZ2h0LiBPbiB0aGUgaW52YWxpZCBt
Zm4gYnJhbmNoIHRoZXJlIGlzIGEgdHJ5IHRvIHNldF9lbnRyeSgpIGFuZCANCmlmIHRoYXQgaXMg
bm90IHN1Y2Nlc3NmdWwgdGhlbiB0aGUgZnVuY3Rpb24gZG9lcyBub3QgcmV0dXJuIGFuZCBjYWxs
cyANCnNldF9lbnRyeSBhZ2FpbiBmb3IgUEFHRV9PUkRFUl80SyBldmVuIGlmIHRoZXJlIHdhcyBh
IGNoZWNrIHRoYXQgcGFnZSANCm9yZGVyIGlzIGRpZmZlcmVudCBmcm9tIFBBR0VfT1JERVJfNEsu
DQoNCmh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9eGVu
L2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYztoPWExNDRiYjBjZTQ5NDMxOGIwNDkzZGNmZjMxYmI1
ZTRlOGE3NDI5Njk7aGI9cmVmcy9oZWFkcy9zdGFnaW5nI2wyNzINCg0KSXMgdGhpcyBiZWhhdmlv
ciB3YW50ZWQ/DQoNClJlZ2FyZHMsDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
