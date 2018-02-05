From: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 2/3] xen: Fix credit1 Kconfig entry
Date: Mon, 5 Feb 2018 11:36:41 +0000
Message-ID: <20180205113642.3174-2-george.dunlap@citrix.com>
References: <20180205113642.3174-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=invn=e7=citrix.com=prvs=567d2a528=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1eif4v-0006Jv-Iw
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 11:36:53 +0000
In-Reply-To: <20180205113642.3174-1-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Li4uc28gdGhhdCBpdCBzaG93cyB1cCBpbiB0aGUgbWVudSBhbmQgY2FuIGJlIGRpc2FibGVkLgoK
U2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgot
LS0KQ0M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPgpDQzogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+CkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNDOiBUaW0gRGVl
Z2FuIDx0aW1AeGVuLm9yZz4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KQ0M6IEtvbnJhZCBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgotLS0KIHhl
bi9jb21tb24vS2NvbmZpZyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9LY29uZmlnIGIveGVuL2Nv
bW1vbi9LY29uZmlnCmluZGV4IDNkMjBhOTIzMWYuLjEzMTMxOGQ2M2EgMTAwNjQ0Ci0tLSBhL3hl
bi9jb21tb24vS2NvbmZpZworKysgYi94ZW4vY29tbW9uL0tjb25maWcKQEAgLTE2NCw3ICsxNjQs
OCBAQCBtZW51ICJTY2hlZHVsZXJzIgogCXZpc2libGUgaWYgRVhQRVJUID0gInkiCiAKIGNvbmZp
ZyBTQ0hFRF9DUkVESVQKLQlkZWZfYm9vbCB5CisJYm9vbCAiQ3JlZGl0IHNjaGVkdWxlciBzdXBw
b3J0IgorCWRlZmF1bHQgeQogCS0tLWhlbHAtLS0KIAkgIFRoZSB0cmFkaXRpb25hbCBjcmVkaXQg
c2NoZWR1bGVyIGlzIGEgZ2VuZXJhbCBwdXJwb3NlIHNjaGVkdWxlci4KIAotLSAKMi4xNS4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
