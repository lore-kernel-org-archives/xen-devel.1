From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 4/6] xen: don't free percpu areas during suspend
Date: Mon, 18 Mar 2019 14:11:53 +0100
Message-ID: <20190318131155.29450-5-jgross@suse.com>
References: <20190318131155.29450-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nHQP=RV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h5s3f-0006Zs-3E
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 13:12:03 +0000
In-Reply-To: <20190318131155.29450-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW5zdGVhZCBvZiBmcmVlaW5nIHBlcmNwdSBhcmVhcyBkdXJpbmcgc3VzcGVuZCBhbmQgYWxsb2Nh
dGluZyB0aGVtCmFnYWluIHdoZW4gcmVzdW1pbmcga2VlcCB0aGVtLiBPbmx5IGZyZWUgYW4gYXJl
YSBpbiBjYXNlIGEgY3B1IGRpZG4ndApjb21lIHVwIGFnYWluIHdoZW4gcmVzdW1pbmcuCgpTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2FyY2gv
eDg2L3BlcmNwdS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvcGVyY3B1LmMgYi94ZW4vYXJj
aC94ODYvcGVyY3B1LmMKaW5kZXggOGJlNGViZGRmNC4uNWVhMTRiNmVjMyAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L3BlcmNwdS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wZXJjcHUuYwpAQCAtNzYs
NyArNzYsOCBAQCBzdGF0aWMgaW50IGNwdV9wZXJjcHVfY2FsbGJhY2soCiAgICAgICAgIGJyZWFr
OwogICAgIGNhc2UgQ1BVX1VQX0NBTkNFTEVEOgogICAgIGNhc2UgQ1BVX0RFQUQ6Ci0gICAgICAg
IGlmICggIXBhcmtfb2ZmbGluZV9jcHVzICkKKyAgICBjYXNlIENQVV9SRVNVTUVfRkFJTEVEOgor
ICAgICAgICBpZiAoICFwYXJrX29mZmxpbmVfY3B1cyAmJiBzeXN0ZW1fc3RhdGUgIT0gU1lTX1NU
QVRFX3N1c3BlbmQgKQogICAgICAgICAgICAgZnJlZV9wZXJjcHVfYXJlYShjcHUpOwogICAgICAg
ICBicmVhazsKICAgICBjYXNlIENQVV9SRU1PVkU6Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
