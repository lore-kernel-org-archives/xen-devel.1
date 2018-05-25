From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH] ap-common: Switch to Linux 4.14 by
 default on X86.
Date: Fri, 25 May 2018 15:44:53 +0100
Message-ID: <1527259493-6383-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=igij=im=citrix.com=prvs=6765940ff=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fMDxy-00042w-Sc
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 14:45:14 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Julien Grall <julien.grall@linaro.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

TGludXggNC45IGlzIGdldHRpbmcgYSBiaXQgbG9uZyBpbiB0aGUgdG9vdGguICA0LjE0IGlzIGFu
IExUUyBicmFuY2gKYW5kIHRoZSBvc3N0ZXN0LXRlc3RlZCB2ZXJzaW9uIHNlZW1zIHJlYXNvbmFi
bHkgZ29vZC4gIEkgcmFuIGEgc3BlY2lhbApyZXBvcnRbMV0gdG8gc2VlIHdoYXQgdG8gZXhwZWN0
IGFuZCBpdCByZXBvcnRlZCBubyByZWdyZXNzaW9ucy4KCkFjY29yZGluZ2x5IEkgYW0gZ29pbmcg
dG8gc3dpdGNoIHRvIHVzaW5nIExpbnV4IDQuMTQgYnkgZGVmYXVsdCBmb3IKbW9zdCBYODYgcnVu
cyBpbiBvc3N0ZXN0LiAgQVJNIHRlc3RzIGFyZSBub3QgYWZmZWN0ZWQgYXQgdGhpcyB0aW1lOwp0
aGV5IHVzZSB0aGVpciBvd24gbGludXgtYXJtLXhlbiBicmFuY2ggd2hpY2ggaXMgdXBkYXRlZCBi
eSB0aGUgWGVuCkFSTSBtYWludGFpbmVycy4KClsxXSAuL3NnLXJlcG9ydC1mbGlnaHQgLS10aGF0
LWxpbnV4PTZiYTg5YjUyYmE2OTE2YmM3YTNkMzkwZDcwOTUxZTk5MmMwY2EzOWUgLS10aGlzLWxp
bnV4PWQ4ODcwMGY3OTQ0OGZjOGYwMzYxN2Q0ZjE5MjljMzk2NzZmOGQxZTQgLS1icmFuY2hlcy1h
bHNvPWxpbnV4LTQuOSxsaW51eC00LjE0LGxpbnV4LWFybS14ZW4gMTIyOTc0IHxsZXNzCgpDQzog
Qm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ0M6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNDOiBLb25y
YWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNDOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBl
dS5jaXRyaXguY29tPgotLS0KIGFwLWNvbW1vbiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FwLWNvbW1vbiBiL2FwLWNv
bW1vbgppbmRleCBlYzZlMDEwLi41ZTdjZmRlIDEwMDY0NAotLS0gYS9hcC1jb21tb24KKysrIGIv
YXAtY29tbW9uCkBAIC02MSw3ICs2MSw3IEBACiAKIDogJHtQVVNIX1RSRUVfTElOVVg6PSRYRU5C
SVRTOi9ob21lL3hlbi9naXQvbGludXgtcHZvcHMuZ2l0fQogOiAke0JBU0VfVFJFRV9MSU5VWDo9
Z2l0Oi8veGVuYml0cy54ZW4ub3JnL2xpbnV4LXB2b3BzLmdpdH0KLTogJHtCQVNFX1RBR19MSU5V
WDo9dGVzdGVkL2xpbnV4LTQuOX0KKzogJHtCQVNFX1RBR19MSU5VWDo9dGVzdGVkL2xpbnV4LTQu
MTR9CiA6ICR7QkFTRV9UQUdfTElOVVhfQVJNOj10ZXN0ZWQvbGludXgtYXJtLXhlbn0KIAogaWYg
WyAieCR7VFJFRV9MSU5VWH0iID0geCBdOyB0aGVuCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
