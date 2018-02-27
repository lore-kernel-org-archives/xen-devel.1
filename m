From: julien.grall@arm.com
Subject: [PATCH 0/3] xen/arm: Rework the way to allocate event
	channel IRQ for hwdom
Date: Tue, 27 Feb 2018 15:15:52 +0000
Message-ID: <20180227151555.1953-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=r2zm=fv=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eqgzF-0005Et-Dm
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 15:16:13 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: stewart.hildebrand@dornerworks.com, andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkhpIGFsbCwKClRoaXMg
cGF0Y2ggc2VyaWVzIHdhcyB0cmlnZ2VyZWQgYnkgY29tbWl0IDExZTdkZDk1OGQgInhlbi9hcm06
IGRvbWFpbl9idWlsZGVyOgppcnEgc2FuaXR5IGNoZWNrIGxvZ2ljIGZpeCIgdGhhdCBpcyB2YWxp
ZCBidXQgYnJlYWsgc29tZSBhc3N1bXB0aW9uIGluIHRoZQpjdXJyZW50IFhlbi4gUmF0aGVyIHRo
YW4gcmVtb3ZpbmcgYSB1c2VmdWwgQlVHX09OKCksIHRoaXMgc2VyaWVzIHJld29yawp0aGUgZXZl
bnQgY2hhbm5lbCBJUlEgYWxsb2NhdGlvbiBmb3IgdGhlIGhhcmR3YXJlIGRvbWFpbi4KClRoZSBs
YXN0IHBhdGNoIG9mIHRoZSBzZXJpZXMgd2lsbCByZWluc3RhbmNlIGNvbW1pdCAxMWU3ZGQ5NThk
LgoKQ2hlZXJzLAoKSnVsaWVuIEdyYWxsICgyKToKICB4ZW4vYXJtOiBkb21haW5fYnVpbGQ6IFBy
ZXBhcmUgRFRCL0FDUEkgdGFibGVzIGFmdGVyIHNwZWNpZmljIG1hcHBpbmdzCiAgeGVuL2FybTog
ZG9tYWluX2J1aWxkOiBSZXdvcmsgdGhlIHdheSB0byBhbGxvY2F0ZSB0aGUgZXZlbnQgY2hhbm5l
bAogICAgaW50ZXJydXB0CgpTdGV3YXJ0IEhpbGRlYnJhbmQgKDEpOgogIHhlbi9hcm06IGRvbWFp
bl9idWlsZGVyOiBpcnEgc2FuaXR5IGNoZWNrIGxvZ2ljIGZpeAoKIHhlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYyB8IDk1ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDQ5IGRlbGV0aW9ucygtKQoK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
