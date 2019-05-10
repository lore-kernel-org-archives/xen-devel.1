From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/4] xen/watchdog: Code and API improvements to
 the domain watchdog
Date: Fri, 10 May 2019 19:28:00 +0100
Message-ID: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KsvH=TK=citrix.com=prvs=026b205b0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hPAFe-0006vF-7P
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 18:28:10 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig <christian.lindig@citrix.com>, Pau Ruiz Safont <pau.safont@citrix.com>, Julien Grall <julien.grall@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBhIG1vc3RseSB0byBhZGRyZXNzIGEgY29ybmVyIGNhc2Ugd2hlbiB1c2luZyB3YXRj
aGRvZ3MsIHdoZW4gYSBkb21haW4Kd2lzaGVzIHRvIGNlYXNlIGZlbmNpbmcgYWN0aXZpdGVzIGFu
ZCBjbGVhbmx5IHJlYm9vdC4KClBhdGNoZXMgMSB0byAzIGFyZSBqdXN0IGNvZGUgaW1wcm92ZW1l
bnRzIGluIGRvbWFpbl93YXRjaGRvZygpLiAgUGF0Y2ggNAppbnRyb2R1Y2VzIHRoZSBuZXcgZnVu
Y3Rpb25hbGl0eS4KCkFuZHJldyBDb29wZXIgKDQpOgogIHhlbi93YXRjaGRvZzogRm9sZCBleGl0
IHBhdGhzIHRvIGhhdmUgYSBzaW5nbGUgdW5sb2NrCiAgeGVuL3dhdGNoZG9nOiBSZWFycmFuZ2Ug
dGhlIGxvZ2ljIHRvIGZvbGQgdGhlIHRpbWVyLWFybWluZyBwYXRocwogIHhlbi93YXRjaGRvZzog
RHJvcCBhbGwgbG9ja2VkIG9wZXJhdGlvbnMgb24gdGhlIHdhdGNoZG9nX2ludXNlX21hcAogIHhl
bi93YXRjaGRvZzogU3VwcG9ydCBkaXNhYmxlIGFsbCB3YXRjaGRvZyB0aW1lcnMgaW4gb25lIGdv
CgogeGVuL2NvbW1vbi9zY2hlZHVsZS5jICAgICAgfCA0NyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9wdWJsaWMvc2NoZWQuaCB8ICA2
ICsrKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMo
LSkKCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
