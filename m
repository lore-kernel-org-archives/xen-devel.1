From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC v1 60/74] xen/pvshim: set max_pages to the
	value of tot_pages
Date: Thu, 4 Jan 2018 13:06:11 +0000
Message-ID: <20180104130625.28605-61-wei.liu2@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/p+y=d7=citrix.com=prvs=535dfbe76=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eX5fN-0002ak-RH
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 13:34:41 +0000
In-Reply-To: <20180104130625.28605-1-wei.liu2@citrix.com>
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
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9wdi9zaGlt
LmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMgYi94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCmluZGV4
IGMyNGFkYWNiYzcuLjQ2Zjc3MzYyYTcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9zaGlt
LmMKKysrIGIveGVuL2FyY2gveDg2L3B2L3NoaW0uYwpAQCAtMTk1LDYgKzE5NSwxMiBAQCB2b2lk
IF9faW5pdCBwdl9zaGltX3NldHVwX2RvbShzdHJ1Y3QgZG9tYWluICpkLCBsNF9wZ2VudHJ5X3Qg
Kmw0c3RhcnQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc29sZV9tZm4sIHZwaHlz
bWFwKTsKICAgICAgICAgY29uc29sZWRfc2V0X3JpbmdfYWRkcihwYWdlKTsKICAgICB9CisKKyAg
ICAvKgorICAgICAqIFNldCB0aGUgbWF4IHBhZ2VzIHRvIHRoZSBjdXJyZW50IG51bWJlciBvZiBw
YWdlcyB0byBwcmV2ZW50IHRoZQorICAgICAqIGd1ZXN0IGZyb20gZGVwbGV0aW5nIHRoZSBzaGlt
IG1lbW9yeSBwb29sLgorICAgICAqLworICAgIGQtPm1heF9wYWdlcyA9IGQtPnRvdF9wYWdlczsK
IH0KIAogc3RhdGljIHZvaWQgd3JpdGVfc3RhcnRfaW5mbyhzdHJ1Y3QgZG9tYWluICpkKQotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
