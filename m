From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] xen: some scheduler related simplifications
Date: Thu, 14 Mar 2019 10:59:51 +0100
Message-ID: <20190314095953.11752-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X/If=RR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h4N9d-0000YZ-My
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 10:00:01 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hpbGUgd29ya2luZyBvbiB0aGUgc2NoZWR1bGVyIEkgbmVlZGVkIHRvIG1vZGlmeSBzb21lIGJp
dHMgd2hpY2ggYXJlCndvcnRoIHRvIGJlIGNvbnNpZGVyZWQgYXMgYSBzdGFuZC1hbG9uZSBpbXBy
b3ZlbWVudCBJTU8uCgpKdWVyZ2VuIEdyb3NzICgyKToKICB4ZW46IGludHJvZHVjZSBhIGNwdW1h
c2sgd2l0aCBhbGwgYml0cyBzZXQKICB4ZW4vc2NoZWQ6IGRvbid0IGRpc2FibGUgc2NoZWR1bGVy
IG9uIGNwdXMgZHVyaW5nIHN1c3BlbmQKCiB4ZW4vYXJjaC94ODYvaW9fYXBpYy5jICAgIHwgICA0
ICstCiB4ZW4vY29tbW9uL2NwdS5jICAgICAgICAgIHwgICA0ICsrCiB4ZW4vY29tbW9uL2NwdXBv
b2wuYyAgICAgIHwgICAyICstCiB4ZW4vY29tbW9uL3NjaGVkdWxlLmMgICAgIHwgMTYzICsrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL3hl
bi9jcHVtYXNrLmggfCAgIDIgKwogNSBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAx
MjIgZGVsZXRpb25zKC0pCgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
