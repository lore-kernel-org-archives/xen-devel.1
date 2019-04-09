From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/9] libxl_internal: Remove lost comment
Date: Tue, 9 Apr 2019 17:45:34 +0100
Message-ID: <20190409164542.30274-2-anthony.perard@citrix.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDtsh-0008As-8h
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 16:45:55 +0000
In-Reply-To: <20190409164542.30274-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhhdCBjb21tZW50IGFzIGJlZW4gc2VwYXJhdGVkIGZyb20gdGhlIGZ1bmN0aW9uIGl0IGRlZmlu
ZXMgYnkKNDE5N2QzYWJiYjMwNTVkMzc5ODI1NGViN2JhMjM5YmZiNTgyNDM2MCwgYnV0IHRoZW4g
d2FzIG5vdCB1c2VmdWwKYW55bW9yZSB3aGVuIHRoZSBsaWJ4bF9fZGV2aWNlX2Rpc2tfYWRkKCkg
cHJvdG90eXBlIHdhcyByZW1vdmVkIGJ5CjIyZWE4YWQwMmU0NjVlMzJjZDQwODg3Yzc1MGI1NWMz
YTk5N2EyODguCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgNyAtLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4
bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCA0
NGUwMjIxMjg0Li45OGExZWU2MTU5IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRl
cm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTI3NDQsMTMgKzI3
NDQsNiBAQCBzdHJ1Y3QgbGlieGxfX211bHRpZGV2IHsKICAqICAgICAgICAgICAgICAgICAgIERP
TkUuCiAgKi8KIAotLyogQU8gb3BlcmF0aW9uIHRvIGNvbm5lY3QgYSBkaXNrIGRldmljZSwgY2Fs
bGVkIGJ5Ci0gKiBsaWJ4bF9kZXZpY2VfZGlza19hZGQgYW5kIGxpYnhsX19hZGRfZGlza3MuIFRo
aXMgZnVuY3Rpb24gY2FsbHMKLSAqIGxpYnhsX193YWl0X2RldmljZV9jb25uZWN0aW9uIHRvIHdh
aXQgZm9yIHRoZSBkZXZpY2UgdG8KLSAqIGZpbmlzaCB0aGUgY29ubmVjdGlvbiAobWlnaHQgaW52
b2x2ZSBleGVjdXRpbmcgaG90cGx1ZyBzY3JpcHRzKS4KLSAqCi0gKiBPbmNlIGZpbmlzaGVkLCBh
b2Rldi0+Y2FsbGJhY2sgd2lsbCBiZSBleGVjdXRlZC4KLSAqLwogLyoKICAqIEFzIG9mIFhlbiA0
LjUgd2UgbWFpbnRhaW4gdmFyaW91cyBpbmZvcm1hdGlvbiwgaW5jbHVkaW5nIGhvdHBsdWcKICAq
IGRldmljZSBpbmZvcm1hdGlvbiwgaW4gSlNPTiBmaWxlcywgc28gdGhhdCB3ZSBjYW4gdXNlIHRo
aXMgSlNPTgotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
