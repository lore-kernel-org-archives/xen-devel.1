From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: [GRUB PATCH 0/2] verifiers: Fallout cleanup
Date: Thu,  6 Dec 2018 14:40:31 +0100
Message-ID: <20181206134033.19884-1-daniel.kiper__45711.1554257155$1544103597$gmane$org@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tpbq=op=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1gUttx-0003jg-Gv
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 13:41:13 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: grub-devel@gnu.org, xen-devel@lists.xenproject.org
Cc: phcoder@gmail.com, xudong.hao@intel.com, leif.lindholm@linaro.org, julien.grall@arm.com, farrah.chen@intel.com, ross.philipson@oracle.com, lee.jones@linaro.org, fu.wei@linaro.org
List-Id: xen-devel@lists.xenproject.org

SGV5LAoKWWVhaCwgZmFsbG91dCBjbGVhbnVwIGFmdGVyIHZlcmlmaWVycyBpbnRyb2R1Y3Rpb24u
IFNvcnJ5IGFib3V0IHRoYXQuCgpOb3cgSSB0ZXN0IGJ1aWxkIGFsbCB4ODYgYW5kIEFSTSBzdXBw
b3J0ZWQgcGxhdGZvcm1zLiBJIGFtIGdvaW5nIHRvCmFkZCBvdGhlcnMgdG8gbXkgdGVzdCBzY3Jp
cHQgc29vbiB0byBhdm9pZCBzdWNoIG1lc3MgaW4gdGhlIGZ1dHVyZS4KCkRhbmllbAoKIGdydWIt
Y29yZS9sb2FkZXIvYXJtNjQveGVuX2Jvb3QuYyB8ICA4ICsrKystLS0tCiBncnViLWNvcmUvbG9h
ZGVyL2kzODYveGVuLmMgICAgICAgfCAxNCArKysrKysrLS0tLS0tLQogaW5jbHVkZS9ncnViL2Zp
bGUuaCAgICAgICAgICAgICAgIHwgIDUgKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0
aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpEYW5pZWwgS2lwZXIgKDIpOgogICAgICB2ZXJpZmll
cnM6IFhlbiBmYWxsb3V0IGNsZWFudXAKICAgICAgdmVyaWZpZXJzOiBBUk0gWGVuIGZhbGxvdXQg
Y2xlYW51cAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
