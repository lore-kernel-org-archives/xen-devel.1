From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 21/25] argo: add array_index_nospec to guard the
 result of the hash func
Date: Fri, 30 Nov 2018 17:33:00 -0800
Message-ID: <1543627984-21394-22-git-send-email-christopher.w.clark@gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w5dn=ok=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gSuAf-0007Fu-EF
 for xen-devel@lists.xenproject.org; Sat, 01 Dec 2018 01:34:13 +0000
Received: by mail-it1-x141.google.com with SMTP id a6so1217731itl.4
 for <xen-devel@lists.xenproject.org>; Fri, 30 Nov 2018 17:34:12 -0800 (PST)
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

VGhpcyBpcyBvdXQgb2YgYW4gYWJ1bmRhbmNlIG9mIGNhdXRpb24sIHNpbmNlIHRoaXMgaXMgYSB2
ZXJ5IGJhc2ljIGhhc2gKZnVuY3Rpb24sIGNob3NlbiBtb3JlIGZvciBpdHMgYnVja2V0IGRpc3Ry
aWJ1dGlvbiBwcm9wZXJ0aWVzIHRvIGNsdXN0ZXIgcmVsYXRlZApyaW5ncyByYXRoZXIgdGhhbiBm
b3IgY3J5cHRvZ3JhcGhpYyBzdHJlbmd0aCBvciBhbnkgdW5pZm9ybW5lc3Mgb2Ygb3V0cHV0LAph
bmQgaXQgb3BlcmF0ZXMgdXBvbiB2YWx1ZXMgc3VwcGxpZWQgYnkgdGhlIGd1ZXN0IGp1c3QgYmVm
b3JlIGJlaW5nIHVzZWQgYXMgYW4KYXJyYXkgaW5kZXguCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rv
cGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xhcms2QGJhZXN5c3RlbXMuY29tPgotLS0KIHhlbi9j
b21tb24vYXJnby5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9hcmdvLmMgYi94ZW4vY29t
bW9uL2FyZ28uYwppbmRleCAzOTc3OGZkLi5mYTk2OWFiIDEwMDY0NAotLS0gYS94ZW4vY29tbW9u
L2FyZ28uYworKysgYi94ZW4vY29tbW9uL2FyZ28uYwpAQCAtMjMsNiArMjMsNyBAQAogI2luY2x1
ZGUgPHhlbi9ldmVudC5oPgogI2luY2x1ZGUgPHhlbi9kb21haW5fcGFnZS5oPgogI2luY2x1ZGUg
PHhlbi9ndWVzdF9hY2Nlc3MuaD4KKyNpbmNsdWRlIDx4ZW4vbm9zcGVjLmg+CiAjaW5jbHVkZSA8
eGVuL3RpbWUuaD4KICNpbmNsdWRlIDx4c20veHNtLmg+CiAKQEAgLTEwOTQsNyArMTA5NSw3IEBA
IGFyZ29fcmluZ19maW5kX2luZm8oY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0
IGFyZ29fcmluZ19pZCAqaWQpCiAKICAgICBBU1NFUlQocndfaXNfbG9ja2VkKCZkLT5hcmdvLT5s
b2NrKSk7CiAKLSAgICBoYXNoID0gYXJnb19oYXNoX2ZuKGlkKTsKKyAgICBoYXNoID0gYXJyYXlf
aW5kZXhfbm9zcGVjKGFyZ29faGFzaF9mbihpZCksIEFSR09fSFRBQkxFX1NJWkUpOwogCiAgICAg
YXJnb19kcHJpbnRrKCJkLT5hcmdvPSVwLCBkLT5hcmdvLT5yaW5nX2hhc2hbJWRdPSVwIGlkPSVw
XG4iLAogICAgICAgICAgICAgICAgICBkLT5hcmdvLCBoYXNoLCBkLT5hcmdvLT5yaW5nX2hhc2hb
aGFzaF0uZmlyc3QsIGlkKTsKQEAgLTEzNDksNyArMTM1MCw4IEBAIGFyZ29fcmVnaXN0ZXJfcmlu
ZyhzdHJ1Y3QgZG9tYWluICpkLAogICAgICAgICAgICAgICAgIHJpbmdfaW5mby0+aWQgPSByaW5n
LmlkOwogICAgICAgICAgICAgICAgIElOSVRfSExJU1RfSEVBRCgmcmluZ19pbmZvLT5wZW5kaW5n
KTsKIAotICAgICAgICAgICAgICAgIGhhc2ggPSBhcmdvX2hhc2hfZm4oJnJpbmdfaW5mby0+aWQp
OworICAgICAgICAgICAgICAgIGhhc2ggPSBhcnJheV9pbmRleF9ub3NwZWMoYXJnb19oYXNoX2Zu
KCZyaW5nX2luZm8tPmlkKSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIEFSR09fSFRBQkxFX1NJWkUpOwogICAgICAgICAgICAgICAgIGhsaXN0X2FkZF9oZWFkKCZy
aW5nX2luZm8tPm5vZGUsICZkLT5hcmdvLT5yaW5nX2hhc2hbaGFzaF0pOwogCiAgICAgICAgICAg
ICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJhcmdvOiB2bSV1IHJlZ2lzdGVyaW5nIHJpbmcgKHZt
JXU6JXggdm0lZClcbiIsCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
