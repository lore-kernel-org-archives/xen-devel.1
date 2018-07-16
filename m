From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 4.9 and older] cmdline: fix parse_boolean() for
 NULL incoming end pointer
Date: Mon, 16 Jul 2018 02:50:20 -0600
Message-ID: <5B4C5C4C02000078001D42CC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=6083=ka=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fezDA-000427-5X
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 08:50:28 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

VXNlIHRoZSBjYWxjdWxhdGVkIGxlbmd0aHMgaW5zdGVhZCBvZiBwb2ludGVycywgYXMgJ2UnIGJl
aW5nIE5VTEwgd2lsbApvdGhlcndpc2UgY2F1c2UgdW5kdWUgcGFyc2luZyBmYWlsdXJlcy4KClJl
cG9ydGVkLWJ5OiBLYXJsIEpvaG5zb24gPGthcmxqb2huc29uLml0QGdtYWlsLmNvbT4KU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2NvbW1v
bi9rZXJuZWwuYworKysgYi94ZW4vY29tbW9uL2tlcm5lbC5jCkBAIC0yMDksMTAgKzIwOSwxMSBA
QCBpbnQgcGFyc2VfYm9vbGVhbihjb25zdCBjaGFyICpuYW1lLCBjb25zCiAgICAgICAgIGNoYXIg
YnVmWzhdOwogCiAgICAgICAgIHMgKz0gbmxlbiArIDE7Ci0gICAgICAgIGlmICggZSA8PSBzIHx8
IGUgLSBzID49IEFSUkFZX1NJWkUoYnVmKSApCisgICAgICAgIHNsZW4gLT0gbmxlbiArIDE7Cisg
ICAgICAgIGlmICggc2xlbiA+PSBBUlJBWV9TSVpFKGJ1ZikgKQogICAgICAgICAgICAgcmV0dXJu
IC0xOwotICAgICAgICBtZW1jcHkoYnVmLCBzLCBlIC0gcyk7Ci0gICAgICAgIGJ1ZltlIC0gc10g
PSAwOworICAgICAgICBtZW1jcHkoYnVmLCBzLCBzbGVuKTsKKyAgICAgICAgYnVmW3NsZW5dID0g
MDsKICAgICAgICAgcmV0dXJuIHBhcnNlX2Jvb2woYnVmKTsKICAgICB9CiAKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
