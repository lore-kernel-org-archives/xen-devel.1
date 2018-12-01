From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 04/25] argo: define argo_dprintk for subsystem
 debugging
Date: Fri, 30 Nov 2018 17:32:43 -0800
Message-ID: <1543627984-21394-5-git-send-email-christopher.w.clark@gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w5dn=ok=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gSuA0-0006Wn-4U
 for xen-devel@lists.xenproject.org; Sat, 01 Dec 2018 01:33:32 +0000
Received: by mail-io1-xd42.google.com with SMTP id t24so6094602ioi.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Nov 2018 17:33:31 -0800 (PST)
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

QSBjb252ZW5pZW5jZSBmb3Igd29ya2luZyBvbiBkZXZlbG9wbWVudCBvZiB0aGUgYXJnbyBzdWJz
eXN0ZW06CnRvZ2dsaW5nIGEgbG9jYWwgI2RlZmluZSB2YXJpYWJsZSB0dXJucyBvbiBqdXN0IHRo
ZSBkZWJ1ZyBtZXNzYWdlcwppbiB0aGlzIHN1YnN5c3RlbS4KCiAgcHJpbnRrKCJhcmdvOiAiIGZv
cm1hdCwgIyMgYXJncyApCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0
b3BoZXIuY2xhcms2QGJhZXN5c3RlbXMuY29tPgotLS0KIHhlbi9jb21tb24vYXJnby5jIHwgMTMg
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS94ZW4vY29tbW9uL2FyZ28uYyBiL3hlbi9jb21tb24vYXJnby5jCmluZGV4IDc2MDE3ZDQu
LjY5MTdmOTggMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vYXJnby5jCisrKyBiL3hlbi9jb21tb24v
YXJnby5jCkBAIC0xOSw2ICsxOSwxOSBAQAogI2luY2x1ZGUgPHhlbi9lcnJuby5oPgogI2luY2x1
ZGUgPHhlbi9ndWVzdF9hY2Nlc3MuaD4KIAorLyoKKyAqIERlYnVncworICovCisKKyNpZmRlZiBB
UkdPX0RFQlVHCisjZGVmaW5lIGFyZ29fZHByaW50ayhmb3JtYXQsIGFyZ3MuLi4pICAgICAgICAg
ICAgXAorICAgIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
KyAgICAgICAgcHJpbnRrKCJhcmdvOiAiIGZvcm1hdCwgIyMgYXJncyApOyAgICAgICBcCisgICAg
fSB3aGlsZSAoIDEgPT0gMCApCisjZWxzZQorI2RlZmluZSBhcmdvX2RwcmludGsoZm9ybWF0LCAu
Li4gKSAodm9pZCkwCisjZW5kaWYKKwogbG9uZwogZG9fYXJnb19tZXNzYWdlX29wKGludCBjbWQs
IFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnMSwKICAgICAgICAgICAgICAgICAgICBY
RU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZzIsCi0tIAoyLjEuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
