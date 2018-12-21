From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 5/5] pvcalls-back: set -ENOTCONN in
 pvcalls_conn_back_read
Date: Fri, 21 Dec 2018 15:06:33 -0800
Message-ID: <1545433593-18874-5-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1812211501280.15901@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0AIz=O6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gaTsL-00006Y-Hf
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 23:06:37 +0000
In-Reply-To: <alpine.DEB.2.10.1812211501280.15901@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Stefano Stabellini <stefanos@xilinx.com>, boris.ostrovsky@oracle.com, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

V2hlbiBhIGNvbm5lY3Rpb24gaXMgY2xvc2luZyB3ZSByZWNlaXZlIG9uIHB2Y2FsbHNfc2tfc3Rh
dGVfY2hhbmdlCm5vdGlmaWNhdGlvbi4gSW5zdGVhZCBvZiBzZXR0aW5nIHRoZSBjb25uZWN0aW9u
IGFzIGNsb3NlZCBpbW1lZGlhdGVseQooLUVOT1RDT05OKSwgbGV0J3MgcmVhZCBvbmUgbW9yZSB0
aW1lIGZyb20gaXQ6IHB2Y2FsbHNfY29ubl9iYWNrX3JlYWQKd2lsbCBzZXQgdGhlIGNvbm5lY3Rp
b24gYXMgY2xvc2VkIHdoZW4gbmVjZXNzYXJ5LgoKVGhhdCB3YXksIHdlIGF2b2lkIHJhY2VzIGJl
dHdlZW4gcHZjYWxsc19za19zdGF0ZV9jaGFuZ2UgYW5kCnB2Y2FsbHNfYmFja19pb3dvcmtlci4K
ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4K
LS0tCiBkcml2ZXJzL3hlbi9wdmNhbGxzLWJhY2suYyB8IDcgKysrKy0tLQogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3hlbi9wdmNhbGxzLWJhY2suYyBiL2RyaXZlcnMveGVuL3B2Y2FsbHMtYmFjay5jCmluZGV4IDJl
NWQ4NDUuLjcxYjYyODcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3B2Y2FsbHMtYmFjay5jCisr
KyBiL2RyaXZlcnMveGVuL3B2Y2FsbHMtYmFjay5jCkBAIC0xNjAsOSArMTYwLDEwIEBAIHN0YXRp
YyB2b2lkIHB2Y2FsbHNfY29ubl9iYWNrX3JlYWQodm9pZCAqb3BhcXVlKQogCiAJLyogd3JpdGUg
dGhlIGRhdGEsIHRoZW4gbW9kaWZ5IHRoZSBpbmRleGVzICovCiAJdmlydF93bWIoKTsKLQlpZiAo
cmV0IDwgMCkKKwlpZiAocmV0IDwgMCkgeworCQlhdG9taWNfc2V0KCZtYXAtPnJlYWQsIDApOwog
CQlpbnRmLT5pbl9lcnJvciA9IHJldDsKLQllbHNlCisJfSBlbHNlCiAJCWludGYtPmluX3Byb2Qg
PSBwcm9kICsgcmV0OwogCS8qIHVwZGF0ZSB0aGUgaW5kZXhlcywgdGhlbiBub3RpZnkgdGhlIG90
aGVyIGVuZCAqLwogCXZpcnRfd21iKCk7CkBAIC0yODgsNyArMjg5LDcgQEAgc3RhdGljIHZvaWQg
cHZjYWxsc19za19zdGF0ZV9jaGFuZ2Uoc3RydWN0IHNvY2sgKnNvY2spCiAJCXJldHVybjsKIAog
CWludGYgPSBtYXAtPnJpbmc7Ci0JaW50Zi0+aW5fZXJyb3IgPSAtRU5PVENPTk47CisJYXRvbWlj
X2luYygmbWFwLT5yZWFkKTsKIAlub3RpZnlfcmVtb3RlX3ZpYV9pcnEobWFwLT5pcnEpOwogfQog
Ci0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
