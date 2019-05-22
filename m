From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/3] tune preempt_[dis|en]able()
Date: Wed, 22 May 2019 11:45:46 +0200
Message-ID: <20190522094549.28397-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hTNoq-0006VH-8I
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 09:45:56 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgaXMgbm8gdXNlciBvZiB0aGUgcHJlZW1wdF9jb3VudCBmb3Igbm9uLWRlYnVnIGJ1aWxk
cy4gVGhpcyBzZXJpZXMKcmVtb3ZlcyBpdCBmb3IgdGhhdCBjYXNlLgoKSnVlcmdlbiBHcm9zcyAo
Myk6CiAgeGVuOiBkcm9wIGluX2F0b21pYygpCiAgeGVuOiBkcm9wIHByZWVtcHRfY291bnQoKSBm
b3Igbm9uLWRlYnVnIGJ1aWxkcwogIHhlbjogYnVpbGQgY29tbW9uL3ByZWVtcHQuYyBvbmx5IHdp
dGggQ09ORklHX0RFQlVHCgogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICB8IDE2IC0tLS0tLS0t
LS0tLS0tLS0KIHhlbi9jb21tb24vTWFrZWZpbGUgICAgICAgfCAgMiArLQogeGVuL2NvbW1vbi9w
cmVlbXB0LmMgICAgICB8ICA3IC0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9wcmVlbXB0LmggfCAg
OCArKysrKy0tLQogNCBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9u
cygtKQoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
