From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] fix smt=0 fallout
Date: Wed, 29 Aug 2018 20:23:00 +0200
Message-ID: <20180829182302.9977-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cgjg=lm=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fv57X-0006Qn-Bt
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 18:23:11 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

V2l0aCBzbXQ9MCBzb21lIG91dHB1dCBvZiB4bCBpcyB3cm9uZy4gRml4IGl0LgoKSnVlcmdlbiBH
cm9zcyAoMik6CiAgdG9vbHMvbGlieGw6IGNvcnJlY3QgdmNwdSBhZmZpbml0eSBvdXRwdXQgd2l0
aCBzcGFyc2UgcGh5c2ljYWwgY3B1IG1hcAogIHhlbjogZmlsbCB0b3BvbG9neSBpbmZvIGZvciBv
bmxpbmUgY3B1cyBvbmx5CgogdG9vbHMveGwveGxfdmNwdS5jICB8IDQgKystLQogeGVuL2NvbW1v
bi9zeXNjdGwuYyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
