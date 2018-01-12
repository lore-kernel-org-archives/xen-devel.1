From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 52/62] xen/pvshim: set max_pages to the value
	of tot_pages
Date: Fri, 12 Jan 2018 11:29:00 +0000
Message-ID: <20180112112910.16762-53-wei.liu2@citrix.com>
References: <20180112112910.16762-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=clhg=eh=citrix.com=prvs=54360ad83=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eZxz0-000371-NA
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2018 11:58:50 +0000
In-Reply-To: <20180112112910.16762-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClNvIHRoYXQgdGhl
IGd1ZXN0IGlzIG5vdCBhYmxlIHRvIGRlcGxldGUgdGhlIG1lbW9yeSBwb29sIG9mIHRoZSBzaGlt
Cml0c2VsZiBieSB0cnlpbmcgdG8gYmFsbG9vbiB1cC4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9wdi9zaGltLmMgfCA2ICsrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9wdi9zaGltLmMgYi94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCmluZGV4IDZkYzFlZTQ1ZDcuLmUz
ZTEwMWE1YjEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMKKysrIGIveGVuL2Fy
Y2gveDg2L3B2L3NoaW0uYwpAQCAtMjA0LDYgKzIwNCwxMiBAQCB2b2lkIF9faW5pdCBwdl9zaGlt
X3NldHVwX2RvbShzdHJ1Y3QgZG9tYWluICpkLCBsNF9wZ2VudHJ5X3QgKmw0c3RhcnQsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKGh5cGVyY2FsbF9mbl90ICopcHZfc2hpbV9ncmFu
dF90YWJsZV9vcCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoaHlwZXJjYWxsX2Zu
X3QgKilwdl9zaGltX2dyYW50X3RhYmxlX29wKTsKICAgICBndWVzdCA9IGQ7CisKKyAgICAvKgor
ICAgICAqIFNldCB0aGUgbWF4IHBhZ2VzIHRvIHRoZSBjdXJyZW50IG51bWJlciBvZiBwYWdlcyB0
byBwcmV2ZW50IHRoZQorICAgICAqIGd1ZXN0IGZyb20gZGVwbGV0aW5nIHRoZSBzaGltIG1lbW9y
eSBwb29sLgorICAgICAqLworICAgIGQtPm1heF9wYWdlcyA9IGQtPnRvdF9wYWdlczsKIH0KIAog
c3RhdGljIHZvaWQgd3JpdGVfc3RhcnRfaW5mbyhzdHJ1Y3QgZG9tYWluICpkKQotLSAKMi4xMS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
