From: Ian Jackson <ian.jackson@citrix.com>
Subject: [PATCH v2] tools/libfsimage: Set soname to 4.12 not
 0.4.12
Date: Mon, 15 Oct 2018 18:15:50 +0100
Message-ID: <23492.52038.194767.361454@mariner.uk.xensource.com>
References: <20181015152306.4613-1-ian.jackson@eu.citrix.com>
 <f2192c33-39b7-09d9-8772-f024884bc22c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w2gt=m3=citrix.com=prvs=81941a82a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gC6TD-0003oA-RE
 for xen-devel@lists.xenproject.org; Mon, 15 Oct 2018 17:15:55 +0000
In-Reply-To: <f2192c33-39b7-09d9-8772-f024884bc22c@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1BBVENIXSB0b29scy9saWJmc2ltYWdlOiBTZXQg
c29uYW1lIHRvIDQuMTIgbm90IDAuNC4xMiIpOgo+IFRoZSBwcmV2YWlsaW5nIHN0eWxlIGlzOgo+
IAo+IE1BSk9SID0gNC4xMgo+IE1JTk9SID0gMAo+IAo+IHdoaWNoIGlzIHVzZWQgYnkgYWxsIG90
aGVyIGxpYnJhcmllcy4KCkVyciwgc29ycnkuCgpGcm9tIDNkNWQ0M2ZhOGEyM2I2M2VjZDVhYmFm
MGZmY2JkZGNlYzgzMDZhZjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpUbzogeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6
IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkRhdGU6IE1vbiwgMTUgT2N0IDIwMTggMTY6
MjA6MjYgKzAxMDAKU3ViamVjdDogW1BBVENIIHYyXSB0b29scy9saWJmc2ltYWdlOiBTZXQgc29u
YW1lIHRvIDQuMTIgbm90IDAuNC4xMgoKVGhpcyB3YXMgc2V0IHRvIDAuNC4xMiBieSBhY2NpZGVu
dCBpbgogIGM2OWE2YWNhODUyMmM3ZjY3Njk1M2U1NjE5MTU4NDM4MWFkZjJjMDYKICB0b29scy9s
aWJmc2ltYWdlOiBCdW1wIHNvbmFtZSB0byA0LjEyCgpUaGUgZXh0cmEgMC4gaXMgaGFybWxlc3Mg
YnV0IHVnbHkuICBXZSBzaG91bGQgYmUgc29tZXdoYXQgY29uc2lzdGVudC4KClJlcG9ydGVkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCnYyOiBVc2UgY29u
dmVudGlvbmFsIE1BSk9SPTQuMTIgTUlOT1I9MAotLS0KIHRvb2xzL2xpYmZzaW1hZ2UvY29tbW9u
L01ha2VmaWxlIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYmZzaW1hZ2UvY29tbW9uL01ha2VmaWxl
IGIvdG9vbHMvbGliZnNpbWFnZS9jb21tb24vTWFrZWZpbGUKaW5kZXggZjIwZTEzOTRhOC4uYjlm
YjE1ZmNhZCAxMDA2NDQKLS0tIGEvdG9vbHMvbGliZnNpbWFnZS9jb21tb24vTWFrZWZpbGUKKysr
IGIvdG9vbHMvbGliZnNpbWFnZS9jb21tb24vTWFrZWZpbGUKQEAgLTEsOCArMSw4IEBACiBYRU5f
Uk9PVCA9ICQoQ1VSRElSKS8uLi8uLi8uLgogaW5jbHVkZSAkKFhFTl9ST09UKS90b29scy9saWJm
c2ltYWdlL1J1bGVzLm1rCiAKLU1BSk9SID0gMAotTUlOT1IgPSA0LjEyCitNQUpPUiA9IDQuMTIK
K01JTk9SID0gMAogCiBMREZMQUdTLSQoQ09ORklHX1N1bk9TKSA9IC1XbCwtTSAtV2wsbWFwZmls
ZS1TdW5PUwogTERGTEFHUy0kKENPTkZJR19MaW51eCkgPSAtV2wsbWFwZmlsZS1HTlUKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
