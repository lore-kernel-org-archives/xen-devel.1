From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 11/15] cross builds: ts-kernel-build:
 Support cross target armhf
Date: Wed, 1 May 2019 11:48:35 +0100
Message-ID: <20190501104839.21621-12-ian.jackson@eu.citrix.com>
References: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmnG-0005Yx-NM
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:48:54 +0000
In-Reply-To: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkFj
a2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDQzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgotLS0KdjI6IERyb3AgSE9TVENDPSBz
ZXR0aW5nCi0tLQogdHMta2VybmVsLWJ1aWxkIHwgMTkgKysrKysrKysrKysrKysrKysrLQogMSBm
aWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS90cy1rZXJuZWwtYnVpbGQgYi90cy1rZXJuZWwtYnVpbGQKaW5kZXggNzJjYTk4YTEuLjcxZWRh
NDhkIDEwMDc1NQotLS0gYS90cy1rZXJuZWwtYnVpbGQKKysrIGIvdHMta2VybmVsLWJ1aWxkCkBA
IC0yMSw2ICsyMSw3IEBAIEJFR0lOIHsgdW5zaGlmdCBASU5DLCBxdyguKTsgfQogdXNlIE9zc3Rl
c3Q7CiB1c2UgT3NzdGVzdDo6VGVzdFN1cHBvcnQ7CiB1c2UgT3NzdGVzdDo6QnVpbGRTdXBwb3J0
OwordXNlIENhcnA7CiAKIHRzcmVhZGNvbmZpZygpOwogCkBAIC00OCw5ICs0OSwyNCBAQCBteSAk
cGFybXMgPSAkYXJjaHBhcm1zLT57ICRye2FyY2h9IH07CiAKIHN1YiBlbmFibGVfeGVuX2NvbmZp
ZyAoKTsKIAorb3VyICRhcmNoX2VudnZhcnMgPSAnJzsKKwogc3ViIGNtZCAoJCQpIHsKICAgICBt
eSAoJHRpbWVvdXQsICRzY3JpcHQpID0gQF87Ci0gICAgdGFyZ2V0X2NtZF9idWlsZCgkaG8sICR0
aW1lb3V0LCAkYnVpbGRkaXIsICRzY3JpcHQpOworICAgIHRhcmdldF9jbWRfYnVpbGQoJGhvLCAk
dGltZW91dCwgJGJ1aWxkZGlyLCAkYXJjaF9lbnZ2YXJzLiRzY3JpcHQpOworfQorCitzdWIgY2hl
Y2thcmNoICgpIHsKKyAgICByZXR1cm4gaWYgJHJ7YXJjaH0gZXEgJGhvLT57QXJjaH07CisgICAg
bXkgJGNjID0gJ2djYyc7CisgICAgaWYgKCRye2FyY2h9IGVxICdhcm1oZicpIHsKKwl0YXJnZXRf
aW5zdGFsbF9wYWNrYWdlcygkaG8sICJjcm9zc2J1aWxkLWVzc2VudGlhbC0kcnthcmNofSIpOwor
CSRhcmNoX2VudnZhcnMgPSA8PEVORDsKKyAgICBleHBvcnQgQVJDSD1hcm0gQ1JPU1NfQ09NUElM
RT1hcm0tbGludXgtZ251ZWFiaWhmLQorRU5ECisgICAgfSBlbHNlIHsKKwljb25mZXNzICJ1bmtu
b3duIGNyb3NzIHRhcmdldCAoZ251ICdob3N0JykgJHJ7YXJjaH0iOworICAgIH0KIH0KIAogc3Vi
IGNoZWNrb3V0ICgpIHsKQEAgLTQ1MCw2ICs0NjYsNyBAQCBzdWIgZndpbnN0YWxsICgpIHsKIEVO
RAogfQogCitjaGVja2FyY2goKTsKIGNoZWNrb3V0KCk7CiBjb25maWcoKTsKIGJ1aWxkKCk7Ci0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
