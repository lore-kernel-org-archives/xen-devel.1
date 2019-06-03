From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH v3 12/14] xen/x86: p2m: Rework printk format in
 audit_p2m()
Date: Mon,  3 Jun 2019 17:03:48 +0100
Message-ID: <20190603160350.29806-13-julien.grall@arm.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXpRf-0002A3-0D
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 16:04:23 +0000
In-Reply-To: <20190603160350.29806-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T25lIG9mIHRoZSBwcmludGsgZm9ybWF0IGluIGF1ZGl0X3AybSgpIG1heSBiZSBkaWZmaWN1bHQg
dG8gcmVhZCBhcyBpdAppcyBub3QgY2xlYXIgd2hhdCBpcyB0aGUgZmlyc3QgbnVtYmVyLgoKRnVy
dGhlcm1vcmUsIHRoZSBmb3JtYXQgY2FuIG5vdyB0YWtlIGFkdmFudGFnZSBvZiAlcGQuCgpTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKLS0tCiAgICBD
aGFuZ2VzIGluIHYzOgogICAgICAgIC0gUGF0Y2ggYWRkZWQKLS0tCiB4ZW4vYXJjaC94ODYvbW0v
cDJtLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9t
bS9wMm0uYwppbmRleCBlMDNmMGFlNjMwLi4yMDhjMTk2NjY3IDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvbW0vcDJtLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC0yODM4LDggKzI4
MzgsNyBAQCB2b2lkIGF1ZGl0X3AybShzdHJ1Y3QgZG9tYWluICpkLAogCiAgICAgICAgIGlmICgg
b2QgIT0gZCApCiAgICAgICAgIHsKLSAgICAgICAgICAgIFAyTV9QUklOVEsoIndyb25nIG93bmVy
ICUjbHggLT4gJXAoJXUpICE9ICVwKCV1KVxuIiwKLSAgICAgICAgICAgICAgICAgICAgICAgbWZu
LCBvZCwgKG9kP29kLT5kb21haW5faWQ6LTEpLCBkLCBkLT5kb21haW5faWQpOworICAgICAgICAg
ICAgUDJNX1BSSU5USygibWZuICUiUFJJX21mbiIgb3duZXIgJXBkICE9ICVwZFxuIiwgbWZuLCBv
ZCwgZCk7CiAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgfQogCi0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
