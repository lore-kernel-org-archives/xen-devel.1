From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 25/31] OvmfPkg/PlatformBootManagerLib: Handle
 the absence of PCI bus on Xen PVH
Date: Tue, 9 Apr 2019 12:08:38 +0100
Message-ID: <20190409110844.14746-26-anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDoul-0000Ea-AM
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:27:43 +0000
In-Reply-To: <20190409110844.14746-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: devel@edk2.groups.io
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBydW5uaW5nIG9uIFBWSCB3aXRob3V0IFBDSSBidXMsIHRoZSBYZW5QbGF0Zm9ybVBlaSB3
aWxsIHNldApQY2RPdm1mSG9zdEJyaWRnZVBjaURldklkIHRvIFhFTl9QVkhfUENJX0hPU1RfQlJJ
REdFX0RFVklDRV9JRC4KCkNvbnRyaWJ1dGVkLXVuZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9u
IEFncmVlbWVudCAxLjEKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+Ci0tLQogT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJM
aWIvQmRzUGxhdGZvcm0uYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL0xpYnJhcnkvUGxhdGZvcm1Cb290TWFuYWdlckxpYi9C
ZHNQbGF0Zm9ybS5jIGIvT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIvQmRz
UGxhdGZvcm0uYwppbmRleCAxMjMwM2ZiMGYxLi4xYTZkNDc3MzJlIDEwMDY0NAotLS0gYS9Pdm1m
UGtnL0xpYnJhcnkvUGxhdGZvcm1Cb290TWFuYWdlckxpYi9CZHNQbGF0Zm9ybS5jCisrKyBiL092
bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL0Jkc1BsYXRmb3JtLmMKQEAgLTEy
MTMsNiArMTIxMywxMSBAQCBQY2lBY3BpSW5pdGlhbGl6YXRpb24gKAogICAgICAgUGNpV3JpdGU4
IChQQ0lfTElCX0FERFJFU1MgKDAsIDB4MWYsIDAsIDB4NmEpLCAweDBiKTsgLy8gRwogICAgICAg
UGNpV3JpdGU4IChQQ0lfTElCX0FERFJFU1MgKDAsIDB4MWYsIDAsIDB4NmIpLCAweDBiKTsgLy8g
SAogICAgICAgYnJlYWs7CisgICAgY2FzZSBYRU5fUFZIX1BDSV9IT1NUX0JSSURHRV9ERVZJQ0Vf
SUQ6CisgICAgICAvLworICAgICAgLy8gVGhlcmUgYXJlIG5vIFBDSSBidXMgaW4gdGhpcyBjYXNl
LgorICAgICAgLy8KKyAgICAgIHJldHVybjsKICAgICBkZWZhdWx0OgogICAgICAgREVCVUcgKChF
RklfRF9FUlJPUiwgIiVhOiBVbmtub3duIEhvc3QgQnJpZGdlIERldmljZSBJRDogMHglMDR4XG4i
LAogICAgICAgICBfX0ZVTkNUSU9OX18sIG1Ib3N0QnJpZGdlRGV2SWQpKTsKLS0gCkFudGhvbnkg
UEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
