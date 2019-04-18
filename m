From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 05/21] starvation: Teach
 sg-report-flight about starved step state
Date: Thu, 18 Apr 2019 17:31:42 +0100
Message-ID: <20190418163158.11408-6-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xK-00021J-Bn
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:10 +0000
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2UgYXJlIGdvaW5nIHRvIHVzZSB0aGlzIGZvciBzaXR1YXRpb25zIHdoZXJlIHRoZSByZXNvdXJj
ZXMgdG8gcnVuIHRoZQp0ZXN0IHdlcmVuJ3QgYXZhaWxhYmxlLiAgSW4gZ2VuZXJhbCB3ZSBhcmUg
Z29pbmcgdG8gdHJlYXQgdGhpcyBhcyBub3QKYSByZWdyZXNzaW9uLgoKU2lnbmVkLW9mZi1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogc2ctcmVwb3J0LWZs
aWdodCB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NnLXJlcG9ydC1mbGlnaHQgYi9zZy1yZXBvcnQtZmxpZ2h0
CmluZGV4IGExYWRmOTUyLi4yNjc3YzQ3OSAxMDA3NTUKLS0tIGEvc2ctcmVwb3J0LWZsaWdodAor
KysgYi9zZy1yZXBvcnQtZmxpZ2h0CkBAIC04MDUsOSArODA1LDkgQEAgRU5ECiAgICAgICAgICAg
ICBuZXh0OwogICAgICAgICB9CiAKLQlpZiAoJHN0IGVxICdibG9ja2VkJykgewotCSAgICBwcmlu
dCBNUk8gImJsb2NrZWQgJHMtPntqb2J9ICRzLT57dGVzdGlkfVxuIjsKLQkgICAgcHJpbnQgREVC
VUcgIiBibG9ja2VkLCBjYWxsIGl0IGp1c3RpZmlhYmxlXG4iOworCWlmICgkc3QgZXEgJ2Jsb2Nr
ZWQnIG9yICRzdCBlcSAnc3RhcnZlZCcpIHsKKwkgICAgcHJpbnQgTVJPICIkc3QgJHMtPntqb2J9
ICRzLT57dGVzdGlkfVxuIjsKKwkgICAgcHJpbnQgREVCVUcgIiAkc3QsIGNhbGwgaXQganVzdGlm
aWFibGVcbiI7CiAJICAgICRmYWlsdi0+e1N1bW1hcnl9PSAnbi9hJzsKICAgICAgICAgICAgICRm
YWlsdi0+e0Jsb2NrZXJ9PSAnJzsKIAkgICAgbmV4dDsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
