From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] xen: vcpu_migrate_start can be static
Date: Thu, 4 Apr 2019 15:13:36 +0100
Message-ID: <20190404141336.2276-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VYWF=SG=citrix.com=prvs=9901e81f4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hC39Q-00036M-Ur
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 14:15:32 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

SXQncyBub3QgdXNlZCBvdXRzaWRlIG9mIHNjaGVkdWxlLmMuCgpTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9jb21tb24vc2NoZWR1bGUuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3hlbi9jb21tb24vc2NoZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwppbmRl
eCAyNjI5OGMwOWZjLi4zOWI4N2E3NjgyIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxl
LmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCkBAIC01ODcsNyArNTg3LDcgQEAgc3RhdGlj
IHZvaWQgdmNwdV9tb3ZlX2xvY2tlZChzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IG5ld19j
cHUpCiAgKiByZXR1cm4gaWYgaXQgY2FuJ3QgKGJlY2F1c2UgdiBpcyBzdGlsbCBydW5uaW5nKTsg
aW4gdGhhdCBjYXNlCiAgKiB2Y3B1X21pZ3JhdGVfZmluaXNoKCkgd2lsbCBiZSBjYWxsZWQgYnkg
Y29udGV4dF9zYXZlZCgpLgogICovCi12b2lkIHZjcHVfbWlncmF0ZV9zdGFydChzdHJ1Y3QgdmNw
dSAqdikKK3N0YXRpYyB2b2lkIHZjcHVfbWlncmF0ZV9zdGFydChzdHJ1Y3QgdmNwdSAqdikKIHsK
ICAgICBzZXRfYml0KF9WUEZfbWlncmF0aW5nLCAmdi0+cGF1c2VfZmxhZ3MpOwogICAgIHZjcHVf
c2xlZXBfbm9zeW5jX2xvY2tlZCh2KTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
