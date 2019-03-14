From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] xen: some debug trace enhancements
Date: Thu, 14 Mar 2019 10:37:31 +0100
Message-ID: <20190314093733.18175-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X/If=RR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h4Mo5-0006uI-9B
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 09:37:45 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

V2hpbGUgZG9pbmcgc29tZSBzY2hlZHVsZXIgd29yayBJIHVzZWQgZGVidWcgdHJhY2UgZm9yIGRp
YWdub3NpcyBvZgpwcm9ibGVtcyBkdXJpbmcgZG9tMCBib290LiBUaGlzIHNtYWxsIHNlcmllcyBp
cyB0aGUgcmVzdWx0IG9mIGFkYXB0aW5nCmRlYnVnIHRyYWNlIHRvIG15IG5lZWRzLgoKSnVlcmdl
biBHcm9zcyAoMik6CiAgeGVuL2RlYnVnOiBtYWtlIGRlYnVndHJhY2UgY29uZmlndXJhYmxlIHZp
YSBLY29uZmlnCiAgeGVuL2RlYnVnOiBtYWtlIGRlYnVndHJhY2UgbW9yZSBjbGV2ZXIgcmVnYXJk
aW5nIHJlcGVhdGluZyBlbnRyaWVzCgogeGVuL0tjb25maWcuZGVidWcgICAgICAgICAgfCAgNyAr
KysrKysrCiB4ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyB8IDQ2ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9saWIuaCAgICAg
IHwgIDMgKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9u
cygtKQoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
