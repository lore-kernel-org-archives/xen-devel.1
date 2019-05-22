From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3] xen/drivers/char: Protect the
 asm/vpl011.h include
Date: Wed, 22 May 2019 13:24:53 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.1905221324450.20440@sstabellini-ThinkPad-T480s>
References: <20190521222418.27107-1-alistair.francis@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RDm=TW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hTXnE-00082E-1P
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 20:24:56 +0000
In-Reply-To: <20190521222418.27107-1-alistair.francis@wdc.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, alistair23@gmail.com, julien.grall@arm.com, jbeulich@suse.com, andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyMSBNYXkgMjAxOSwgQWxpc3RhaXIgRnJhbmNpcyB3cm90ZToKPiBUaGUgb25seSB1
c2Ugb2YgYXNtL3ZwbDAxMS5oIGlzIHByb3RlY3RlZCBieSB0aGUgQ09ORklHX1NCU0FfVlVBUlRf
Q09OU09MRQo+IGRlZmluZSBzbyBsZXRzIHByb3RlY3QgdGhlIGluY2x1ZGUgYXMgd2VsbC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5j
b20+CgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PgoKCj4gLS0tCj4gIHYzOgo+ICAgLSBSZXdvcmsgY29tbWl0IHRpdGxlIGFuZCBtZXNzYWdlCj4g
ICAtIFNwbGl0IGl0IGludG8gYSBzZXBlcmF0ZSBpZmRlZgo+IAo+ICB4ZW4vZHJpdmVycy9jaGFy
L2NvbnNvbGUuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMg
Yi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwo+IGluZGV4IDM4ZWNkOWMwMTUuLmQ3MjhlNzM3
ZDEgMTAwNjQ0Cj4gLS0tIGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKPiArKysgYi94ZW4v
ZHJpdmVycy9jaGFyL2NvbnNvbGUuYwo+IEBAIC0zNiw3ICszNiw4IEBACj4gICNpZmRlZiBDT05G
SUdfWDg2Cj4gICNpbmNsdWRlIDx4ZW4vY29uc29sZWQuaD4KPiAgI2luY2x1ZGUgPGFzbS9ndWVz
dC5oPgo+IC0jZWxzZQo+ICsjZW5kaWYKPiArI2lmZGVmIENPTkZJR19TQlNBX1ZVQVJUX0NPTlNP
TEUKPiAgI2luY2x1ZGUgPGFzbS92cGwwMTEuaD4KPiAgI2VuZGlmCj4gIAo+IC0tIAo+IDIuMjEu
MAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
