From: Doug Goldstein <cardoe@cardoe.com>
Subject: [RFC PATCH 5/6] ci: add cfg to use GitLab CI to build
Date: Mon, 12 Mar 2018 22:31:30 -0500
Message-ID: <68deb8da8d5c756cfcddb6351af7779243e8e013.1520911150.git-series.cardoe@cardoe.com>
References: <cover.fc61971d5999dddd95c2bee5d18d572bfcc28399.1520911150.git-series.cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <cover.fc61971d5999dddd95c2bee5d18d572bfcc28399.1520911150.git-series.cardoe@cardoe.com>
In-Reply-To: <cover.fc61971d5999dddd95c2bee5d18d572bfcc28399.1520911150.git-series.cardoe@cardoe.com>
References: <cover.fc61971d5999dddd95c2bee5d18d572bfcc28399.1520911150.git-series.cardoe@cardoe.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWRkZWQgYSBHaXRMYWIgQ0kgY29uZmlnIHdoaWNoIGhhcyBhIGxvdCBtb3JlIGZsZXhpYmlsaXR5
IHRvIGFsbG93IHVzIHRvCnRlc3QgYSBsb3QgbW9yZSBkaXN0cm8gY29uZmlndXJhdGlvbnMgdGhh
biBUcmF2aXMgY2FuIGFuZCBldmVuIGJ1aWxkCnRlc3Qgb24gRnJlZUJTRC4KClNpZ25lZC1vZmYt
Ynk6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KLS0tCiAuZ2l0bGFiLWNpLnlt
bCB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAzNCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgLmdpdGxhYi1jaS55bWwKCmRp
ZmYgLS1naXQgYS8uZ2l0bGFiLWNpLnltbCBiLy5naXRsYWItY2kueW1sCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAuLmNjYzIyMzcKLS0tIC9kZXYvbnVsbAorKysgYi8uZ2l0bGFi
LWNpLnltbApAQCAtMCwwICsxLDM0IEBACitzdGFnZXM6CisgIC0gYnVpbGQKKworY2VudG9zLTct
MjoKKyAgc3RhZ2U6IGJ1aWxkCisgIGltYWdlOiByZWdpc3RyeS5naXRsYWIuY29tL2NhcmRvZS94
ZW4vY2VudG9zOjcuMgorICB2YXJpYWJsZXM6CisgICAgQ0M6IGdjYworICBzY3JpcHQ6CisgICAg
LSAuL3NjcmlwdHMvdHJhdmlzLWJ1aWxkCisKK2RlYmlhbi1qZXNzaWU6CisgIHN0YWdlOiBidWls
ZAorICBpbWFnZTogcmVnaXN0cnkuZ2l0bGFiLmNvbS9jYXJkb2UveGVuL2RlYmlhbjpqZXNzaWUK
KyAgdmFyaWFibGVzOgorICAgIENDOiBnY2MKKyAgc2NyaXB0OgorICAgIC0gLi9zY3JpcHRzL3Ry
YXZpcy1idWlsZAorCit1YnVudHUtdHJ1c3R5OgorICBzdGFnZTogYnVpbGQKKyAgaW1hZ2U6IHJl
Z2lzdHJ5LmdpdGxhYi5jb20vY2FyZG9lL3hlbi91YnVudHU6dHJ1c3R5CisgIHZhcmlhYmxlczoK
KyAgICBDQzogZ2NjCisgIHNjcmlwdDoKKyAgICAtIC4vc2NyaXB0cy90cmF2aXMtYnVpbGQKKwor
dWJ1bnR1LXhlbmlhbDoKKyAgc3RhZ2U6IGJ1aWxkCisgIGltYWdlOiByZWdpc3RyeS5naXRsYWIu
Y29tL2NhcmRvZS94ZW4vdWJ1bnR1OnhlbmlhbAorICB2YXJpYWJsZXM6CisgICAgQ0M6IGdjYwor
ICBzY3JpcHQ6CisgICAgLSAuL3NjcmlwdHMvdHJhdmlzLWJ1aWxkCi0tIApnaXQtc2VyaWVzIDAu
OS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
