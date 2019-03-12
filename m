From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] SVM: fix build after "make nested page-fault
 tracing and logging consistent"
Date: Tue, 12 Mar 2019 09:24:45 -0600
Message-ID: <5C87CF3D020000780021DD02@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rfzp=RP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h3jGv-0004sD-SV
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 15:24:53 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

U29tZSBjb21waWxlciB2ZXJzaW9ucyBkb24ndCByZWNvZ25pemUgdGhhdCAibWZuIiBjYW4ndCBy
ZWFsbHkgYmUgdXNlZAp1bmluaXRpYWxpemVkIGluIHN2bV9kb19uZXN0ZWRfcGdmYXVsdCgpLiBU
byBiZSBvbiB0aGUgc2FmZSBzaWRlLCBhZGQgYW4KaW5pdGlhbGl6ZXIgZm9yIHAybXQgYXMgd2Vs
bC4KClJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94
ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0u
YwpAQCAtMTc2Miw4ICsxNzYyLDggQEAgc3RhdGljIHZvaWQgc3ZtX2RvX25lc3RlZF9wZ2ZhdWx0
KHN0cnVjdAogewogICAgIGludCByZXQ7CiAgICAgdW5zaWduZWQgbG9uZyBnZm4gPSBncGEgPj4g
UEFHRV9TSElGVDsKLSAgICBtZm5fdCBtZm47Ci0gICAgcDJtX3R5cGVfdCBwMm10OworICAgIG1m
bl90IG1mbiA9IElOVkFMSURfTUZOOworICAgIHAybV90eXBlX3QgcDJtdCA9IHAybV9pbnZhbGlk
OwogICAgIHAybV9hY2Nlc3NfdCBwMm1hOwogICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm0gPSBO
VUxMOwogCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
