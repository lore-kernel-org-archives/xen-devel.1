From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC v1 48/74] x86/guest: unmask console event
	channel
Date: Thu, 4 Jan 2018 13:05:59 +0000
Message-ID: <20180104130625.28605-49-wei.liu2@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/p+y=d7=citrix.com=prvs=535dfbe76=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eX5ZQ-0003g2-V9
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 13:28:32 +0000
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

RnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KVG8gYmUgc3F1
YXNoZWQgd2l0aCAieDg2L2d1ZXN0OiB1c2UgUFYgY29uc29sZSBmb3IgWGVuL0RvbTAgSS9PIgot
LS0KIHhlbi9kcml2ZXJzL2NoYXIveGVuX3B2X2NvbnNvbGUuYyB8IDQgKysrKwogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIveGVu
X3B2X2NvbnNvbGUuYyBiL3hlbi9kcml2ZXJzL2NoYXIveGVuX3B2X2NvbnNvbGUuYwppbmRleCA1
ZTQ5NGJjNzJhLi4yZGY3ZDk4MmJhIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9jaGFyL3hlbl9w
dl9jb25zb2xlLmMKKysrIGIveGVuL2RyaXZlcnMvY2hhci94ZW5fcHZfY29uc29sZS5jCkBAIC0z
Nyw2ICszNyw3IEBAIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0sodHhfbG9jayk7CiAKIHZvaWQgX19p
bml0IHB2X2NvbnNvbGVfaW5pdCh2b2lkKQogeworICAgIHN0cnVjdCBldnRjaG5fdW5tYXNrIHVu
bWFzazsKICAgICBsb25nIHI7CiAgICAgdWludDY0X3QgcmF3X3BmbiA9IDAsIHJhd19ldnRjaG4g
PSAwOwogCkBAIC01OCw2ICs1OSw5IEBAIHZvaWQgX19pbml0IHB2X2NvbnNvbGVfaW5pdCh2b2lk
KQogICAgIGNvbnNfcmluZyA9IChzdHJ1Y3QgeGVuY29uc19pbnRlcmZhY2UgKilmaXhfdG9fdmly
dChGSVhfUFZfQ09OU09MRSk7CiAgICAgY29uc19ldnRjaG4gPSByYXdfZXZ0Y2huOwogCisgICAg
dW5tYXNrLnBvcnQgPSByYXdfZXZ0Y2huOworICAgIEJVR19PTih4ZW5faHlwZXJjYWxsX2V2ZW50
X2NoYW5uZWxfb3AoRVZUQ0hOT1BfdW5tYXNrLCAmdW5tYXNrKSk7CisKICAgICBwcmludGsoIklu
aXRpYWxpc2VkIFBWIGNvbnNvbGUgYXQgMHglcCB3aXRoIHBmbiAlI2x4IGFuZCBldnRjaG4gJSN4
XG4iLAogICAgICAgICAgICAgY29uc19yaW5nLCByYXdfcGZuLCBjb25zX2V2dGNobik7CiAgICAg
cmV0dXJuOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
