From: Samuel Ortiz <sameo@linux.intel.com>
Subject: [PATCH v5 24/24] hw: i386: Refactor PCI host getter
Date: Mon,  5 Nov 2018 02:40:47 +0100
Message-ID: <20181105014047.26447-25-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j2jf=nq=linux.intel.com=sameo@srs-us1.protection.inumbo.net>)
 id 1gJTvf-0004vl-W0
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 01:43:48 +0000
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogWWFuZyBaaG9uZyA8eWFuZy56aG9uZ0BpbnRlbC5jb20+CgpOb3cgdGhhdCB0aGUgQUNQ
SSBidWlsZGVyIG1ldGhvZHMgYXJlIGFkZGVkLCB3ZSBjYW4gcmVhY2ggdGhlIEFDUEkKY29uZmln
dXJhdGlvbiBwb2ludGVyIGZyb20gdGhlIE1hY2hpbmVTdGF0ZSBwb2ludGVyLiBGcm9tIHRoZXJl
IHdlIGNhbgpnZXQgdG8gdGhlIFBDSSBob3N0IHBvaW50ZXIgYW5kIHJldHVybiBpdC4KClRoaXMg
bWFrZXMgdGhlIFBDSSBob3N0IGdldHRlciBhbiBBQ1BJLCBhcmNoaXRlY3R1cmUgYWdub3N0aWMg
ZnVuY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBZYW5nIFpob25nIDx5YW5nLnpob25nQGludGVsLmNv
bT4KLS0tCiBody9hY3BpL2FtbC1idWlsZC5jIHwgMjAgKysrKysrKy0tLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2h3L2FjcGkvYW1sLWJ1aWxkLmMgYi9ody9hY3BpL2FtbC1idWlsZC5jCmluZGV4IDYxMTJj
YzIxNDkuLmI1MzI4MTdmYjUgMTAwNjQ0Ci0tLSBhL2h3L2FjcGkvYW1sLWJ1aWxkLmMKKysrIGIv
aHcvYWNwaS9hbWwtYnVpbGQuYwpAQCAtMjIsNiArMjIsOCBAQAogI2luY2x1ZGUgInFlbXUvb3Nk
ZXAuaCIKICNpbmNsdWRlIDxnbGliL2dwcmludGYuaD4KICNpbmNsdWRlICJody9hY3BpL2FtbC1i
dWlsZC5oIgorI2luY2x1ZGUgImh3L2FjcGkvYnVpbGRlci5oIgorI2luY2x1ZGUgImh3L21lbS9t
ZW1vcnktZGV2aWNlLmgiCiAjaW5jbHVkZSAicWVtdS9ic3dhcC5oIgogI2luY2x1ZGUgInFlbXUv
Yml0b3BzLmgiCiAjaW5jbHVkZSAic3lzZW11L251bWEuaCIKQEAgLTE2MTcsMjMgKzE2MTksMTUg
QEAgdm9pZCBhY3BpX2J1aWxkX3RhYmxlc19jbGVhbnVwKEFjcGlCdWlsZFRhYmxlcyAqdGFibGVz
LCBib29sIG1mcmUpCiAgICAgZ19hcnJheV9mcmVlKHRhYmxlcy0+dm1nZW5pZCwgbWZyZSk7CiB9
CiAKLS8qCi0gKiBCZWNhdXNlIG9mIHRoZSBQWEIgaG9zdHMgd2UgY2Fubm90IHNpbXBseSBxdWVy
eSBUWVBFX1BDSV9IT1NUX0JSSURHRS4KLSAqLwogT2JqZWN0ICphY3BpX2dldF9wY2lfaG9zdCh2
b2lkKQogewotICAgIFBDSUhvc3RTdGF0ZSAqaG9zdDsKKyAgICBNYWNoaW5lU3RhdGUgKm1zID0g
TUFDSElORShxZGV2X2dldF9tYWNoaW5lKCkpOworICAgIEFjcGlCdWlsZGVyICphYiA9IEFDUElf
QlVJTERFUihtcyk7CisgICAgQWNwaUNvbmZpZ3VyYXRpb24gKmFjcGlfY29uZjsKIAotICAgIGhv
c3QgPSBPQkpFQ1RfQ0hFQ0soUENJSG9zdFN0YXRlLAotICAgICAgICAgICAgICAgICAgICAgICAg
b2JqZWN0X3Jlc29sdmVfcGF0aCgiL21hY2hpbmUvaTQ0MGZ4IiwgTlVMTCksCi0gICAgICAgICAg
ICAgICAgICAgICAgICBUWVBFX1BDSV9IT1NUX0JSSURHRSk7Ci0gICAgaWYgKCFob3N0KSB7Ci0g
ICAgICAgIGhvc3QgPSBPQkpFQ1RfQ0hFQ0soUENJSG9zdFN0YXRlLAotICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG9iamVjdF9yZXNvbHZlX3BhdGgoIi9tYWNoaW5lL3EzNSIsIE5VTEwpLAot
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRZUEVfUENJX0hPU1RfQlJJREdFKTsKLSAgICB9
CisgICAgYWNwaV9jb25mID0gYWNwaV9idWlsZGVyX2NvbmZpZ3VyYXRpb24oYWIpOwogCi0gICAg
cmV0dXJuIE9CSkVDVChob3N0KTsKKyAgICByZXR1cm4gT0JKRUNUKGFjcGlfY29uZi0+cGNpX2hv
c3QpOwogfQogCiAKLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
