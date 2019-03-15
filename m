From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/2] xen: some debug trace enhancements
Date: Fri, 15 Mar 2019 07:35:55 +0100
Message-ID: <20190315063557.24814-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YWx5=RS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h4gRq-0007iM-EB
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 06:36:06 +0000
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
KysrKysrCiB4ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyB8IDQ0ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4vbGliLmggICAgICB8
ICAzICstLQogMyBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMo
LSkKCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
