From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v4 3/4] x86: fix indirect thunk usage of
	CONFIG_INDIRECT_THUNK
Date: Mon, 19 Feb 2018 14:16:19 +0000
Message-ID: <20180219141620.20008-4-roger.pau@citrix.com>
References: <20180219141620.20008-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fu7w=fn=citrix.com=prvs=5814e79b2=roger.pau@srs-us1.protection.inumbo.net>)
 id 1enmFQ-0000sU-AB
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 14:16:52 +0000
In-Reply-To: <20180219141620.20008-1-roger.pau@citrix.com>
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
LS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaW5kaXJlY3RfdGh1bmtfYXNtLmggfCA0ICsrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9h
c20teDg2L2luZGlyZWN0X3RodW5rX2FzbS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9pbmRpcmVj
dF90aHVua19hc20uaAppbmRleCA5NmJjYzI1NDk3Li5hZDgzOTg2YjJkIDEwMDY0NAotLS0gYS94
ZW4vaW5jbHVkZS9hc20teDg2L2luZGlyZWN0X3RodW5rX2FzbS5oCisrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvaW5kaXJlY3RfdGh1bmtfYXNtLmgKQEAgLTMsNiArMywxMCBAQAogICogdXN1YWwg
I2lmZGVmJ2FyeSB0byB0dXJuIGludG8gY29tbWVudHMuCiAgKi8KIAorLmlmbmRlZiBDT05GSUdf
SU5ESVJFQ1RfVEhVTksKKyAgICAuZXF1IENPTkZJR19JTkRJUkVDVF9USFVOSywgMAorLmVuZGlm
CisKIC5tYWNybyBJTkRJUkVDVF9CUkFOQ0ggaW5zbjpyZXEgYXJnOnJlcQogLyoKICAqIENyZWF0
ZSBhbiBpbmRpcmVjdCBicmFuY2guICBpbnNuIGlzIG9uZSBvZiBjYWxsL2ptcCwgYXJnIGlzIGEg
c2luZ2xlCi0tIAoyLjE2LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
