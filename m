From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH for-4.11] Config.mk: Update QEMU to include
 build fixes
Date: Fri, 18 May 2018 17:17:54 +0100
Message-ID: <20180518161754.16361-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ktro=if=citrix.com=prvs=6693598a1=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fJi5c-0005ap-Bz
 for xen-devel@lists.xenproject.org; Fri, 18 May 2018 16:18:44 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyB0YWcgaW5jbHVkZXMgdHdvIGJ1aWxkIGZpeGVzOgotIGR1bXA6IEZpeCBidWlsZCB3aXRo
IG5ld2VyIGdjYwogICAgRml4IGJ1aWxkIHdpdGggR0NDLTgKLSBGaXggbGlidXNiLTEuMC4yMiBk
ZXByZWNhdGVkIGxpYnVzYl9zZXRfZGVidWcgd2l0aCBsaWJ1c2Jfc2V0X29wdGlvbgoKU2lnbmVk
LW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQpG
WUksIEkndmUgYWxyZWFkeSBhc2sgd2l0aCB0aGlzIG1haWw6Cj4gUUVNVSBidWlsZCBmaXhlcyBm
b3IgWGVuLTQuMTEKPiA8MjAxODA1MTAxMzU0MzguR0IyMDU3QHBlcmFyZC51ay54ZW5zb3VyY2Uu
Y29tPgo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2
ZWwvMjAxOC0wNS9tc2cwMDU3OS5odG1sCgpSZWdhcmRzLAotLS0KIENvbmZpZy5tayB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL0NvbmZpZy5tayBiL0NvbmZpZy5tawppbmRleCA3ZThhYzIxOWM5Li45MTgzNDk2YmJlIDEw
MDY0NAotLS0gYS9Db25maWcubWsKKysrIGIvQ29uZmlnLm1rCkBAIC0yNzUsNyArMjc1LDcgQEAg
U0VBQklPU19VUFNUUkVBTV9VUkwgPz0gZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3NlYWJpb3MuZ2l0
CiBNSU5JT1NfVVBTVFJFQU1fVVJMID89IGdpdDovL3hlbmJpdHMueGVuLm9yZy9taW5pLW9zLmdp
dAogZW5kaWYKIE9WTUZfVVBTVFJFQU1fUkVWSVNJT04gPz0gOTQ3ZjM3MzdhYmY2NWZkYTYzZjNm
ZmQ5N2ZkZGZhNjk4Njk4Njg2OAotUUVNVV9VUFNUUkVBTV9SRVZJU0lPTiA/PSBxZW11LXhlbi00
LjExLjAtcmMxCitRRU1VX1VQU1RSRUFNX1JFVklTSU9OID89IHFlbXUteGVuLTQuMTEuMC1yYzYK
IE1JTklPU19VUFNUUkVBTV9SRVZJU0lPTiA/PSB4ZW4tNC4xMS4wLXJjMS4xCiAKIFNFQUJJT1Nf
VVBTVFJFQU1fUkVWSVNJT04gPz0gcmVsLTEuMTEuMQotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
