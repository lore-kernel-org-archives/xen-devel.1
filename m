From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/3] xen/arm: fix nr_pdxs calculation
Date: Fri,  3 May 2019 13:50:12 -0700
Message-ID: <1556916614-21512-1-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lar+=TD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hMf8O-0006WM-4b
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 20:50:20 +0000
In-Reply-To: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, JBeulich@suse.com, Stefano Stabellini <stefanos@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

cGZuX3RvX3BkeCBleHBlY3RzIGFuIGFkZHJlc3MsIG5vdCBhIHNpemUsIGFzIGEgcGFyYW1ldGVy
LiBJdCBleHBlY3RzCnRoZSBlbmQgYWRkcmVzcywgYW5kIHRoZSBtYXNrcyBjYWxjdWxhdGlvbnMg
Y29tcGVuc2F0ZSBmb3IgYW55IGhvbGVzCmJldHdlZW4gc3RhcnQgYW5kIGVuZC4gUGFzcyB0aGUg
ZW5kIGFkZHJlc3MgdG8gcGZuX3RvX3BkeC4gQWxzbyByZW1vdmUKZnJvbSB0aGUgcmVzdWx0IHBm
bl90b19wZHgoc3RhcnRfYWRkcmVzcykgYmVjYXVzZSB3ZSBrbm93IHRoYXQgd2UKZG9uJ3QgbmVl
ZCB0byBjb3ZlciBhbnkgbWVtb3J5IGluIHRoZSByYW5nZSAwLXN0YXJ0IGluIHRoZSBmcmFtZXRh
YmxlLgoKUmVtb3ZlIHRoZSB2YXJpYWJsZSBgbnJfcGFnZXMnIGJlY2F1c2UgaXQgaXMgdW51c2Vk
LgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29t
PgpDQzogSkJldWxpY2hAc3VzZS5jb20KLS0tCiB4ZW4vYXJjaC9hcm0vbW0uYyB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCmluZGV4IDAxYWUyY2Mu
LjVjYjc5MzIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCisrKyBiL3hlbi9hcmNoL2Fy
bS9tbS5jCkBAIC04NzQsOCArODc0LDggQEAgdm9pZCBfX2luaXQgc2V0dXBfeGVuaGVhcF9tYXBw
aW5ncyh1bnNpZ25lZCBsb25nIGJhc2VfbWZuLAogLyogTWFwIGEgZnJhbWUgdGFibGUgdG8gY292
ZXIgcGh5c2ljYWwgYWRkcmVzc2VzIHBzIHRocm91Z2ggcGUgKi8KIHZvaWQgX19pbml0IHNldHVw
X2ZyYW1ldGFibGVfbWFwcGluZ3MocGFkZHJfdCBwcywgcGFkZHJfdCBwZSkKIHsKLSAgICB1bnNp
Z25lZCBsb25nIG5yX3BhZ2VzID0gKHBlIC0gcHMpID4+IFBBR0VfU0hJRlQ7Ci0gICAgdW5zaWdu
ZWQgbG9uZyBucl9wZHhzID0gcGZuX3RvX3BkeChucl9wYWdlcyk7CisgICAgdW5zaWduZWQgbG9u
ZyBucl9wZHhzID0gcGZuX3RvX3BkeCgocGUgPj4gUEFHRV9TSElGVCkgLSAxKSAtCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGZuX3RvX3BkeChwcyA+PiBQQUdFX1NISUZUKSArIDE7CiAg
ICAgdW5zaWduZWQgbG9uZyBmcmFtZXRhYmxlX3NpemUgPSBucl9wZHhzICogc2l6ZW9mKHN0cnVj
dCBwYWdlX2luZm8pOwogICAgIG1mbl90IGJhc2VfbWZuOwogICAgIGNvbnN0IHVuc2lnbmVkIGxv
bmcgbWFwcGluZ19zaXplID0gZnJhbWV0YWJsZV9zaXplIDwgTUIoMzIpID8gTUIoMikgOiBNQigz
Mik7Ci0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
