From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 2/2] x86: fix indirect thunk usage of
	CONFIG_INDIRECT_THUNK
Date: Wed, 24 Jan 2018 15:48:49 +0000
Message-ID: <20180124154849.84889-3-roger.pau@citrix.com>
References: <20180124154849.84889-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rcjb=et=citrix.com=prvs=555701784=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eeNMl-0000io-J1
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 15:53:35 +0000
In-Reply-To: <20180124154849.84889-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBpbmRpcmVjdF90aHVua19hc20uaCBpcyBpbnN0YW50aWF0ZWQgZGlyZWN0bHkgaW50byBh
c3NlbWJseSBmaWxlcwpDT05GSUdfSU5ESVJFQ1RfVEhVTksgbWlnaHQgbm90IGJlIGRlZmluZWQs
IGFuZCB0aHVzIHVzaW5nIC5pZiBhZ2FpbnN0Cml0IGlzIHdyb25nLgoKQWRkIGEgY2hlY2sgdG8g
ZGVmaW5lIENPTkZJR19JTkRJUkVDVF9USFVOSyB0byAwIGlmIG5vdCBkZWZpbmVkLCBzbwp0aGF0
IHVzaW5nIC5pZiBDT05GSUdfSU5ESVJFQ1RfVEhVTksgaXMgYWx3YXlzIGNvcnJlY3QuCgpUaGlz
IHN1cHByZXNzZXMgdGhlIGZvbGxvd2luZyBjbGFuZyBlcnJvcjoKCjxpbnN0YW50aWF0aW9uPjo4
Ojk6IGVycm9yOiBleHBlY3RlZCBhYnNvbHV0ZSBleHByZXNzaW9uCiAgICAuaWYgQ09ORklHX0lO
RElSRUNUX1RIVU5LID09IDEKICAgICAgICBeCjxpbnN0YW50aWF0aW9uPjoxOjE6IG5vdGU6IHdo
aWxlIGluIG1hY3JvIGluc3RhbnRpYXRpb24KSU5ESVJFQ1RfQlJBTkNIIGNhbGwgJXJkeApeCmVu
dHJ5LlM6NTg5Ojk6IG5vdGU6IHdoaWxlIGluIG1hY3JvIGluc3RhbnRpYXRpb24KICAgICAgICBJ
TkRJUkVDVF9DQUxMICVyZHgKICAgICAgICBeCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgot
LS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvYXNtX2RlZm5zLmggfCAzICsrKwogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvYXNt
X2RlZm5zLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2FzbV9kZWZucy5oCmluZGV4IDYyN2E1NDQz
MjYuLmY3ZTUzNjI3ZmYgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvYXNtX2RlZm5z
LmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVmbnMuaApAQCAtMTQsNiArMTQsOSBA
QAogI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS5oPgogCiAjaWZkZWYgX19BU1NFTUJMWV9fCisj
IGlmbmRlZiBDT05GSUdfSU5ESVJFQ1RfVEhVTksKKyMgIGRlZmluZSBDT05GSUdfSU5ESVJFQ1Rf
VEhVTksgMAorIyBlbmRpZgogIyBpbmNsdWRlIDxhc20vaW5kaXJlY3RfdGh1bmtfYXNtLmg+CiAj
ZWxzZQogI2RlZmluZSBJTkNMVURFX0lORElSRUNUX1RIVU5LICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKLS0gCjIuMTUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
