From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PULL 04/15] xen_pt: Present the size of 64 bit BARs
 correctly
Date: Mon, 21 May 2018 12:34:53 -0700
Message-ID: <1526931304-7289-4-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1805211229070.4520@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mmjm=ii=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fKqaN-0000Sr-2t
 for xen-devel@lists.xenproject.org; Mon, 21 May 2018 19:35:11 +0000
In-Reply-To: <alpine.DEB.2.10.1805211229070.4520@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: peter.maydell@linaro.org, stefanha@gmail.com
Cc: sstabellini@kernel.org, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, stefanha@redhat.com, anthony.perard@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpUaGUgZnVs
bCBzaXplIG9mIHRoZSBCQVIgaXMgc3RvcmVkIGluIHRoZSBsb3dlciBQQ0lJT1JlZ2lvbi5zaXpl
LiBUaGUKdXBwZXIgUENJSU9SZWdpb24uc2l6ZSBpcyAwLiAgQ2FsY3VsYXRlIHRoZSBzaXplIG9m
IHRoZSB1cHBlciBoYWxmCmNvcnJlY3RseSBmcm9tIHRoZSBsb3dlciBoYWxmIG90aGVyd2lzZSB0
aGUgc2l6ZSByZWFkIGJ5IHRoZSBndWVzdCB3aWxsCmJlIGluY29ycmVjdC4KClNpZ25lZC1vZmYt
Ynk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgpBY2tlZC1ieTog
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KLS0tCiBody94ZW4v
eGVuX3B0X2NvbmZpZ19pbml0LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvaHcveGVuL3hlbl9wdF9jb25maWdfaW5pdC5jIGIvaHcveGVuL3hl
bl9wdF9jb25maWdfaW5pdC5jCmluZGV4IGEzY2UzM2UuLmFlZTMxYzYgMTAwNjQ0Ci0tLSBhL2h3
L3hlbi94ZW5fcHRfY29uZmlnX2luaXQuYworKysgYi9ody94ZW4veGVuX3B0X2NvbmZpZ19pbml0
LmMKQEAgLTUwNCw2ICs1MDQsOCBAQCBzdGF0aWMgaW50IHhlbl9wdF9iYXJfcmVnX3dyaXRlKFhl
blBDSVBhc3N0aHJvdWdoU3RhdGUgKnMsIFhlblBUUmVnICpjZmdfZW50cnksCiAgICAgICAgIGJh
cl9yb19tYXNrID0gWEVOX1BUX0JBUl9JT19ST19NQVNLIHwgKHJfc2l6ZSAtIDEpOwogICAgICAg
ICBicmVhazsKICAgICBjYXNlIFhFTl9QVF9CQVJfRkxBR19VUFBFUjoKKyAgICAgICAgYXNzZXJ0
KGluZGV4ID4gMCk7CisgICAgICAgIHJfc2l6ZSA9IGQtPmlvX3JlZ2lvbnNbaW5kZXggLSAxXS5z
aXplID4+IDMyOwogICAgICAgICBiYXJfZW11X21hc2sgPSBYRU5fUFRfQkFSX0FMTEY7CiAgICAg
ICAgIGJhcl9yb19tYXNrID0gcl9zaXplID8gcl9zaXplIC0gMSA6IDA7CiAgICAgICAgIGJyZWFr
OwotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
