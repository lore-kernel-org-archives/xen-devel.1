From: Viktor Mitin <viktor.mitin.19@gmail.com>
Subject: [PATCH v2] coverage: filter out libfdt.o and libelf.o
Date: Thu, 16 May 2019 16:20:16 +0300
Message-ID: <20190516132016.8032-1-viktor.mitin.19@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BGuO=TQ=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hRGKW-00069e-Q7
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:21:52 +0000
Received: by mail-lj1-x243.google.com with SMTP id d15so3075760ljc.7
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 06:21:51 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Viktor Mitin <viktor.mitin.19@gmail.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHBhdGNoIHJlc29sdmVzICd4ZW5jb3YnIGNyYXNoZXMgaW4gY2FzZSBvZiBBYXJjaDY0LgoK
QWxsIHRoZSAuaW5pdC4qIHNlY3Rpb25zIGFyZSBzdHJpcHBlZCBhZnRlciBib290LAppdCBtZWFu
cyB0aGF0IGFueXRoaW5nIGluIC5pbml0LmRhdGEgY2Fubm90IGJlIGFjY2Vzc2VkIGFueW1vcmUu
ClRoZSBidWlsZCBzeXN0ZW0gZXhwbGljaXRseSBjb21waWxlcyBhbnkgLmluaXQgYmluYXJ5IHdp
dGhvdXQgZ2NvdiBvcHRpb24uClRoZSBwcm9ibGVtIGlzIGNvbWluZyBmcm9tIGxpYmZkdCBhbmQg
bGliZWxmLgpUaGUgZW50aXJlIGxpYnJhcnkgaXMgbW92ZWQgdG8gLmluaXQgdXNpbmc6CiQoT0JK
Q09QWSkgJChmb3JlYWNoIHMsJChTRUNUSU9OUyksLS1yZW5hbWUtc2VjdGlvbiAuJChzKT0uaW5p
dC4kKHMpKSAkPCAkQApTbyB3ZSBuZWVkIHRvIHRlbGwgdGhlIHRvcCBNYWtlZmlsZSB0byBmaWx0
ZXIgb3V0IGxpYmZkdCBhbmQgbGliZWxmLgoKUmVwb3J0ZWQtYnk6IFZpa3RvciBNaXRpbiA8dmlr
dG9yLm1pdGluLjE5QGdtYWlsLmNvbT4KU3VnZ2VzdGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rvci5taXRp
bi4xOUBnbWFpbC5jb20+CkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KVGVz
dGVkLWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rvci5taXRpbi4xOUBnbWFpbC5jb20+CgotLS0KCkNo
YW5nZXMgZnJvbSB2MToKCiAtIGNvdmVyYWdlOiBmaWx0ZXJlZCBvdXQgbGliZWxmIGFzIHdlbGwK
LS0tCiB4ZW4vY29tbW9uL2xpYmVsZi9NYWtlZmlsZSB8IDEgKwogeGVuL2NvbW1vbi9saWJmZHQv
TWFrZWZpbGUgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9saWJlbGYvTWFrZWZpbGUgYi94ZW4vY29tbW9uL2xpYmVsZi9NYWtl
ZmlsZQppbmRleCA1YmY4Zjc2NGYxLi4zZDllMzhmMjdlIDEwMDY0NAotLS0gYS94ZW4vY29tbW9u
L2xpYmVsZi9NYWtlZmlsZQorKysgYi94ZW4vY29tbW9uL2xpYmVsZi9NYWtlZmlsZQpAQCAtMSw0
ICsxLDUgQEAKIG9iai1iaW4teSA6PSBsaWJlbGYubworbm9jb3YteSArPSBsaWJlbGYubwogCiBT
RUNUSU9OUyA6PSB0ZXh0IGRhdGEgJChTUEVDSUFMX0RBVEFfU0VDVElPTlMpCiAKZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vbGliZmR0L01ha2VmaWxlIGIveGVuL2NvbW1vbi9saWJmZHQvTWFrZWZp
bGUKaW5kZXggZDgxZjU0YjZiOC4uYzA3NWJiZjU0NiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9s
aWJmZHQvTWFrZWZpbGUKKysrIGIveGVuL2NvbW1vbi9saWJmZHQvTWFrZWZpbGUKQEAgLTMsNiAr
Myw3IEBAIGluY2x1ZGUgTWFrZWZpbGUubGliZmR0CiBTRUNUSU9OUyA6PSB0ZXh0IGRhdGEgJChT
UEVDSUFMX0RBVEFfU0VDVElPTlMpCiAKIG9iai15ICs9IGxpYmZkdC5vCitub2Nvdi15ICs9IGxp
YmZkdC5vCiAKIENGTEFHUyArPSAtSSQoQkFTRURJUikvaW5jbHVkZS94ZW4vbGliZmR0LwogCi0t
IAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
