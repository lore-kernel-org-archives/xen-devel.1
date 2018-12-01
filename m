From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 19/25] argo: limit the max number of notify
 requests in a single operation.
Date: Fri, 30 Nov 2018 17:32:58 -0800
Message-ID: <1543627984-21394-20-git-send-email-christopher.w.clark@gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w5dn=ok=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gSuAZ-00077b-TE
 for xen-devel@lists.xenproject.org; Sat, 01 Dec 2018 01:34:07 +0000
Received: by mail-io1-xd41.google.com with SMTP id k7so6061374iob.6
 for <xen-devel@lists.xenproject.org>; Fri, 30 Nov 2018 17:34:07 -0800 (PST)
In-Reply-To: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, James McKenzie <voreekf@madingley.org>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

VmVyeSBiYXNpYyBpbXBsZW1lbnRhdGlvbjogYSBmaXhlZCBsaW1pdCBvZiAyNTYuCgpTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xhcms2QGJhZXN5c3RlbXMu
Y29tPgotLS0KIHhlbi9jb21tb24vYXJnby5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9hcmdvLmMgYi94ZW4vY29t
bW9uL2FyZ28uYwppbmRleCBjYzkwOGY0Li4wODU4ZmIyIDEwMDY0NAotLS0gYS94ZW4vY29tbW9u
L2FyZ28uYworKysgYi94ZW4vY29tbW9uL2FyZ28uYwpAQCAtMjcsNiArMjcsNyBAQAogI2luY2x1
ZGUgPHhzbS94c20uaD4KIAogI2RlZmluZSBBUkdPX01BWF9SSU5HU19QRVJfRE9NQUlOICAgICAg
IDEyOFUKKyNkZWZpbmUgQVJHT19NQVhfTk9USUZZX0NPVU5UICAgICAgICAgICAyNTZVCiAKIERF
RklORV9YRU5fR1VFU1RfSEFORExFKGFyZ29fcGZuX3QpOwogREVGSU5FX1hFTl9HVUVTVF9IQU5E
TEUoYXJnb19hZGRyX3QpOwpAQCAtMTQ4MCw2ICsxNDgxLDEyIEBAIGFyZ29fbm90aWZ5KHN0cnVj
dCBkb21haW4gKmQsCiAgICAgICAgICAgICBpZiAoIHJldCApCiAgICAgICAgICAgICAgICAgYnJl
YWs7CiAKKyAgICAgICAgICAgIGlmICggcmluZ19kYXRhLm5lbnQgPiBBUkdPX01BWF9OT1RJRllf
Q09VTlQgKQorICAgICAgICAgICAgeworICAgICAgICAgICAgICAgIHJldCA9IC1FQUNDRVM7Cisg
ICAgICAgICAgICAgICAgYnJlYWs7CisgICAgICAgICAgICB9CisKICAgICAgICAgICAgIHsKICAg
ICAgICAgICAgICAgICAvKgogICAgICAgICAgICAgICAgICAqIFRoaXMgaXMgYSBndWVzdCBwb2lu
dGVyIHBhc3NlZCBhcyBhIGZpZWxkIGluIGEgc3RydWN0Ci0tIAoyLjEuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
