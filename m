From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 01/12] checkpatch: Add xendevicemodel_handle to
	the list of types
Date: Thu, 8 Mar 2018 19:02:56 +0000
Message-ID: <1520535787-6223-2-git-send-email-ian.jackson@eu.citrix.com>
References: <1520535787-6223-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=awgw=f6=citrix.com=prvs=5980b9d75=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1eu0pW-0005pJ-Ct
 for xen-devel@lists.xenproject.org; Thu, 08 Mar 2018 19:03:54 +0000
In-Reply-To: <1520535787-6223-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Berrange" <berrange@redhat.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBhdm9pZHMgY2hlY2twYXRjaCBtaXNwYXJzaW5nIChhcyBzdGF0ZW1lbnRzKSBsb25nIGZ1
bmN0aW9uCmRlZmluaXRpb25zIG9yIGRlY2xhcmF0aW9ucywgd2hpY2ggc29tZXRpbWVzIHN0YXJ0
IHdpdGggY29uc3RydWN0cwpsaWtlIHRoaXM6CgogIHN0YXRpYyBpbmxpbmUgaW50IHhlbmRldmlj
ZW1vZGVsX3JlbG9jYXRlX21lbW9yeSgKICAgICAgeGVuZGV2aWNlbW9kZWxfaGFuZGxlICpkbW9k
LCBkb21pZF90IGRvbWlkLCAuLi4KCkNDOiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4K
Q0M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+CkNDOiBEYW5pZWwgUC4gQmVy
cmFuZ2UgPGJlcnJhbmdlQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJ
YW4uSmFja3NvbkBldS5jaXRyaXguY29tPgotLS0KdjYuMTogTmV3IHBhdGNoCi0tLQogc2NyaXB0
cy9jaGVja3BhdGNoLnBsIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRp
ZmYgLS1naXQgYS9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgYi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwK
aW5kZXggZDFmZTc5Yi4uM2U0ODhmNyAxMDA3NTUKLS0tIGEvc2NyaXB0cy9jaGVja3BhdGNoLnBs
CisrKyBiL3NjcmlwdHMvY2hlY2twYXRjaC5wbApAQCAtMjY2LDYgKzI2Niw3IEBAIG91ciBAdHlw
ZUxpc3QgPSAoCiAJcXJ7dGFyZ2V0Xyg/OnUpP2xvbmd9LAogCXFye2h3YWRkcn0sCiAJcXJ7eG1s
JHtJZGVudH19LAorCXFye3hlbmRldmljZW1vZGVsX2hhbmRsZX0sCiApOwogCiAjIFRoaXMgY2Fu
IGJlIG1vZGlmaWVkIGJ5IHN1YiBwb3NzaWJsZS4gIFNpbmNlIGl0IGNhbiBiZSBlbXB0eSwgYmUg
Y2FyZWZ1bAotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
