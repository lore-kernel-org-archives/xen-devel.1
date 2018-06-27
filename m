From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/3] libxc/cpuid: minor fixes
Date: Wed, 27 Jun 2018 16:32:11 +0200
Message-ID: <20180627143214.35751-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zznj=jn=citrix.com=prvs=709ecfd17=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fYBVK-00066n-53
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 14:33:06 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGlzIHNlcmllcyBjb250YWluIHNvbWUgbWlub3IgZml4ZXMgZm9yIGNwdWlkIGhl
YWRlciBmaWxlIGdlbmVyYXRpb24KYW5kIGEgY291cGxlIG9mIGZpeGVzIGZvciBsaWJ4YyByZWxh
dGVkIGNwdWlkIGZ1bmN0aW9ucy4KClRoYW5rcywgUm9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDMp
OgogIHg4Ni9jcHVpZDogZml4IGdlbmVyYXRpb24gb2YgYXV0byBjcHVpZCBoZWFkZXIKICBsaWJ4
YzogZml4IHN0YWxlIFBWSCBjb21tZW50CiAgbGlieGM6IGRvIG5vdCByZXR1cm4gYSB2YWx1ZSBm
cm9tIHhjX2NwdWlkX3BvbGljeQoKIHRvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jIHwgMTQgKysr
KysrLS0tLS0tLS0KIHhlbi9pbmNsdWRlL01ha2VmaWxlICAgICAgIHwgIDIgKy0KIDIgZmlsZXMg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
