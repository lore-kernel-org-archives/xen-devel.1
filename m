From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 3/3] tools: init scripts: make XEN_RUN_DIR and
 XEN_LOCK_DIR mode 700
Date: Thu,  7 Feb 2019 15:02:27 +0000
Message-ID: <20190207150227.6341-4-ian.jackson@eu.citrix.com>
References: <20190207150227.6341-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gno6=QO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1grlCD-0004Rf-RK
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 15:02:33 +0000
In-Reply-To: <20190207150227.6341-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlc2UgZGlyZWN0b3JpZXMgb3VnaHQgbm90IHRvIGJlIGV2ZW4gd29ybGQtcmVhZGFibGUuICBJ
ZiB0aGlzIHNjcmlwdApmb3Igc29tZSByZWFzb24gcnVucyB3aXRoIGEgbGF4IHVtYXNrIHRoZXkg
bWlnaHQgYmUgY3JlYXRlZApvdmVybHktd3JpdGVhYmxlLiAgQXZvaWQgYW55IHN1Y2ggYnVnIGJ5
IHNldHRpbmcgdGhlIG1vZGUgZXhwbGljaXRseS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRvb2xzL2hvdHBsdWcvTGludXgvaW5p
dC5kL3hlbmNvbW1vbnMuaW4gfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvaG90cGx1Zy9MaW51eC9pbml0
LmQveGVuY29tbW9ucy5pbiBiL3Rvb2xzL2hvdHBsdWcvTGludXgvaW5pdC5kL3hlbmNvbW1vbnMu
aW4KaW5kZXggYWE2MmU0YzkyZi4uN2ZkNjkwM2I5OCAxMDA2NDQKLS0tIGEvdG9vbHMvaG90cGx1
Zy9MaW51eC9pbml0LmQveGVuY29tbW9ucy5pbgorKysgYi90b29scy9ob3RwbHVnL0xpbnV4L2lu
aXQuZC94ZW5jb21tb25zLmluCkBAIC01Niw4ICs1Niw4IEBAIGRvX3N0YXJ0ICgpIHsKIAogCWZv
ciBtb2QgaW4gJEJBQ0tFTkRfTU9EVUxFUyA7IGRvIG1vZHByb2JlICIkbW9kIiAmPi9kZXYvbnVs
bCA7IGRvbmUKIAotCW1rZGlyIC1wICR7WEVOX1JVTl9ESVJ9Ci0JbWtkaXIgLXAgJHtYRU5fTE9D
S19ESVJ9CisJbWtkaXIgLW03MDAgLXAgJHtYRU5fUlVOX0RJUn0KKwlta2RpciAtbTcwMCAtcCAk
e1hFTl9MT0NLX0RJUn0KIAlta2RpciAtcCAke1hFTl9MT0dfRElSfQogCiAJQFhFTl9TQ1JJUFRf
RElSQC9sYXVuY2gteGVuc3RvcmUgfHwgZXhpdCAxCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
