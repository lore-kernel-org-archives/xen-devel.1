From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen: only clobber multicall elements without
 error
Date: Fri, 23 Nov 2018 14:25:16 +0100
Message-ID: <20181123132516.28681-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=h732=oc=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gQBSS-0000AF-QX
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 13:25:20 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

SW4gZGVidWcgYnVpbGRzIHRoZSBoeXBlcnZpc29yIHdpbGwgZGVsaWJlcmF0ZWx5IGNsb2JiZXIg
cHJvY2Vzc2VkCmVsZW1lbnRzIG9mIHRoZSBtdWx0aWNhbGwgc3RydWN0dXJlLiBJbiBvcmRlciB0
byBlYXNlIGRpYWdub3N0aWMgZGF0YQpwcmludG91dCBpbiB0aGUgYWZmZWN0ZWQgZ3Vlc3Qgb25s
eSBjbG9iYmVyIGVsZW1lbnRzIHdoaWNoIGRpZG4ndApyZXR1cm4gYW4gZXJyb3IuCgpTaWduZWQt
b2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2NvbW1vbi9t
dWx0aWNhbGwuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9tdWx0aWNhbGwuYyBiL3hlbi9jb21tb24vbXVsdGljYWxsLmMKaW5k
ZXggNWExOTllYmY4Zi4uNDg2MjI2MTljZSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9tdWx0aWNh
bGwuYworKysgYi94ZW4vY29tbW9uL211bHRpY2FsbC5jCkBAIC03NCw2ICs3NCw3IEBAIGRvX211
bHRpY2FsbCgKICAgICAgICAgQVNTRVJUX05PVF9JTl9BVE9NSUMoKTsKIAogI2lmbmRlZiBOREVC
VUcKKyAgICAgICAgaWYgKCAobG9uZyltY3MtPmNhbGwucmVzdWx0ID49IDAgKQogICAgICAgICB7
CiAgICAgICAgICAgICAvKgogICAgICAgICAgICAgICogRGVsaWJlcmF0ZWx5IGNvcnJ1cHQgdGhl
IGNvbnRlbnRzIG9mIHRoZSBtdWx0aWNhbGwgc3RydWN0dXJlLgotLSAKMi4xNi40CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
