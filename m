From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v2 03/18] argo: define argo_dprintk for
 subsystem debugging
Date: Wed, 19 Dec 2018 22:39:00 -0800
Message-ID: <1545287955-27684-4-git-send-email-christopher.w.clark@gmail.com>
References: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZmS=O5=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gZrzf-0005pc-BX
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 06:39:39 +0000
Received: by mail-it1-x144.google.com with SMTP id w18so1422057ite.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Dec 2018 22:39:38 -0800 (PST)
In-Reply-To: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QSBjb252ZW5pZW5jZSBmb3Igd29ya2luZyBvbiBkZXZlbG9wbWVudCBvZiB0aGUgYXJnbyBzdWJz
eXN0ZW06CnRvZ2dsaW5nIGEgbG9jYWwgI2RlZmluZSB2YXJpYWJsZSB0dXJucyBvbiBqdXN0IHRo
ZSBkZWJ1ZyBtZXNzYWdlcwppbiB0aGlzIHN1YnN5c3RlbS4KClNpZ25lZC1vZmYtYnk6IENocmlz
dG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci5jbGFyazZAYmFlc3lzdGVtcy5jb20+Ci0tLQpDaGFu
Z2VzIHNpbmNlIHYxOgoKdjEgIzA0IGZlZWRiYWNrLCBKYW46CiAgICByZW1vdmUgZG8td2hpbGUg
ZnJvbSBkZWZpbml0aW9uCiAgICBmdWxseSBwYXJlbnRoZXNpemUgdGhlIG1hY3JvIGV4cGFuc2lv
bgogICAgcmVtb3ZlIGNvZGUgc25pcHBldCBmcm9tIHRoZSBjb21taXQgbWVzc2FnZQogICAgYWRk
ICNkZWZpbmUgQVJHT19ERUJVRyAwIHRvIHRoZSBmaWxlCgpDb3JyZWN0IHBsdXJhbCBjb21tZW50
IHRvIHNpbmdsYXIKCiB4ZW4vY29tbW9uL2FyZ28uYyB8IDEzICsrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9hcmdv
LmMgYi94ZW4vY29tbW9uL2FyZ28uYwppbmRleCBjZWZkNjRmLi45OGY0MGI1IDEwMDY0NAotLS0g
YS94ZW4vY29tbW9uL2FyZ28uYworKysgYi94ZW4vY29tbW9uL2FyZ28uYwpAQCAtMTksNiArMTks
MTkgQEAKICNpbmNsdWRlIDx4ZW4vZXJybm8uaD4KICNpbmNsdWRlIDx4ZW4vZ3Vlc3RfYWNjZXNz
Lmg+CiAKKy8qCisgKiBEZWJ1ZworICovCisKKy8qIFNldCBBUkdPX0RFQlVHIHRvIDEgaGVyZSB0
byBlbmFibGUgbW9yZSBkZWJ1ZyBtZXNzYWdlcyAqLworI2RlZmluZSBBUkdPX0RFQlVHIDAKKwor
I2lmZGVmIEFSR09fREVCVUcKKyNkZWZpbmUgYXJnb19kcHJpbnRrKGZvcm1hdCwgYXJncy4uLikg
cHJpbnRrKCJhcmdvOiAiIGZvcm1hdCwgIyMgYXJncyApCisjZWxzZQorI2RlZmluZSBhcmdvX2Rw
cmludGsoZm9ybWF0LCAuLi4gKSAoKHZvaWQpMCkKKyNlbmRpZgorCiBsb25nCiBkb19hcmdvX21l
c3NhZ2Vfb3AodW5zaWduZWQgaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBh
cmcxLAogICAgICAgICAgICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJn
MiwKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
