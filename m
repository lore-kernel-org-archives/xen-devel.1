From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 10/12] xen/arm: mm: Mark
 check_memory_layout_alignment_constraints as unused
Date: Wed, 27 Mar 2019 18:45:29 +0000
Message-ID: <20190327184531.30986-11-julien.grall@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h58V=R6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h9DYk-0001lv-Gk
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 18:45:58 +0000
In-Reply-To: <20190327184531.30986-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

Q2xhbmcgd2lsbCB0aHJvdyBhbiBlcnJvciBpZiBhIGZ1bmN0aW9uIGlzIHVudXNlZCB1bmxlc3Mg
eW91IHRlbGwKdG8gaWdub3JlIGl0LiBUaGlzIGNhbiBiZSBkb25lIHVzaW5nIF9fbWF5YmVfdW51
c2VkLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
LS0tCiB4ZW4vYXJjaC9hcm0vbW0uYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94
ZW4vYXJjaC9hcm0vbW0uYwppbmRleCAwMWFlMmNjY2MwLi5kMzc5MjUwNTFhIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94ZW4vYXJjaC9hcm0vbW0uYwpAQCAtMTYwLDcgKzE2
MCw4IEBAIHVuc2lnbmVkIGxvbmcgdG90YWxfcGFnZXM7CiBleHRlcm4gY2hhciBfX2luaXRfYmVn
aW5bXSwgX19pbml0X2VuZFtdOwogCiAvKiBDaGVja2luZyBWQSBtZW1vcnkgbGF5b3V0IGFsaWdu
bWVudC4gKi8KLXN0YXRpYyBpbmxpbmUgdm9pZCBjaGVja19tZW1vcnlfbGF5b3V0X2FsaWdubWVu
dF9jb25zdHJhaW50cyh2b2lkKSB7CitzdGF0aWMgX19tYXliZV91bnVzZWQgdm9pZCBjaGVja19t
ZW1vcnlfbGF5b3V0X2FsaWdubWVudF9jb25zdHJhaW50cyh2b2lkKQorewogICAgIC8qIDJNQiBh
bGlnbmVkIHJlZ2lvbnMgKi8KICAgICBCVUlMRF9CVUdfT04oWEVOX1ZJUlRfU1RBUlQgJiB+U0VD
T05EX01BU0spOwogICAgIEJVSUxEX0JVR19PTihGSVhNQVBfQUREUigwKSAmIH5TRUNPTkRfTUFT
Syk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
