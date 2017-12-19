From: Sameer Goel <sameer.goel@linaro.org>
Subject: [RFC v4 1/8] Port WARN_ON_ONCE() from Linux
Date: Mon, 18 Dec 2017 20:16:56 -0700
Message-ID: <20171219031703.23420-2-sameer.goel@linaro.org>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ximu=dp=linaro.org=sameer.goel@srs-us1.protection.inumbo.net>)
 id 1eR8P2-0006aG-UC
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 03:17:12 +0000
Received: by mail-pf0-x244.google.com with SMTP id y89so10605546pfk.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2017 19:17:11 -0800 (PST)
In-Reply-To: <20171219031703.23420-1-sameer.goel@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, julien.grall@arm.com, mjaggi@caviumnetworks.com
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, george.dunlap@eu.citrix.com, Andrew.Cooper3@citrix.com, andre.przywara@linaro.org, jbeulich@suse.com, Sameer Goel <sameer.goel@linaro.org>, Ian.Jackson@citrix.com, nd@arm.com, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

UG9ydCBXQVJOX09OX09OQ0UgbWFjcm8gZnJvbSBMaW51eC4KClNpZ25lZC1vZmYtYnk6IFNhbWVl
ciBHb2VsIDxzYW1lZXIuZ29lbEBsaW5hcm8ub3JnPgotLS0KIHhlbi9pbmNsdWRlL3hlbi9saWIu
aCB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9saWIuaCBiL3hlbi9pbmNsdWRlL3hlbi9saWIuaApp
bmRleCBlZDAwYWUxMzc5Li44MzIwNmMwODQ4IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4v
bGliLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2xpYi5oCkBAIC0xMSw2ICsxMSwxNyBAQAogI2Rl
ZmluZSBCVUdfT04ocCkgIGRvIHsgaWYgKHVubGlrZWx5KHApKSBCVUcoKTsgIH0gd2hpbGUgKDAp
CiAjZGVmaW5lIFdBUk5fT04ocCkgZG8geyBpZiAodW5saWtlbHkocCkpIFdBUk4oKTsgfSB3aGls
ZSAoMCkKIAorI2RlZmluZSBXQVJOX09OX09OQ0UocCkJKHsgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKKyAgICBzdGF0aWMgYm9vbCBfX3NlY3Rpb24oIi5kYXRhLnVubGlrZWx5IikgX193YXJu
ZWQ7IFwKKyAgICBpbnQgX19yZXRfd2Fybl9vbmNlID0gISEocCk7ICAgICAgICAgICAgICAgICAg
ICBcCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAorICAgIGlmICh1bmxpa2VseShfX3JldF93YXJuX29uY2UgJiYgIV9fd2FybmVkKSkgeyAgIFwK
KyAgICAgICAgX193YXJuZWQgPSB0cnVlOyAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisg
ICAgICAgIFdBUk5fT04oMSk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAg
IH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICB1
bmxpa2VseShfX3JldF93YXJuX29uY2UpOyAgICAgICAgICAgICAgICAgICAgICBcCit9KQorCiAj
aWYgX19HTlVDX18gPiA0IHx8IChfX0dOVUNfXyA9PSA0ICYmIF9fR05VQ19NSU5PUl9fID49IDYp
CiAvKiBGb3JjZSBhIGNvbXBpbGF0aW9uIGVycm9yIGlmIGNvbmRpdGlvbiBpcyB0cnVlICovCiAj
ZGVmaW5lIEJVSUxEX0JVR19PTihjb25kKSAoeyBfU3RhdGljX2Fzc2VydCghKGNvbmQpLCAiISgi
ICNjb25kICIpIik7IH0pCi0tIAoyLjE0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
