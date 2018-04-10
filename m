From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 6/7] docs/Makefile: Introduce
 GENERATE_PANDOC_RULE_RAW
Date: Tue, 10 Apr 2018 18:22:52 +0100
Message-ID: <1523380973-15979-7-git-send-email-ian.jackson@eu.citrix.com>
References: <1523380973-15979-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=93ll=g7=citrix.com=prvs=6314176a9=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f5wzL-0004LQ-Nl
 for xen-devel@lists.xenproject.org; Tue, 10 Apr 2018 17:23:23 +0000
In-Reply-To: <1523380973-15979-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2UgYXJlIGdvaW5nIHRvIHdhbnQgdG8gZm9ybWF0IFNVUFBPUlQubWQgd2hpY2ggZG9lcyBub3Qg
bWF0Y2ggdGhlCmZpbGVuYW1lIHBhdHRlcm5zIGluIGRvY3MvLiAgU28gcHJvdmlkZSBhIHdheSB0
byBtYWtlIGFuIGFkLWhvYyBydWxlCnVzaW5nIHBhbmRvYyB3aXRoIHRoZSBzdGFuZGFyZCBvcHRp
b25zLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW4gdGhpcyBwYXRjaC4KClNpZ25lZC1vZmYtYnk6
IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIGRvY3MvTWFrZWZp
bGUgfCAxMSArKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kb2NzL01ha2VmaWxlIGIvZG9jcy9NYWtlZmlsZQpp
bmRleCA2NzQzZmEzLi5kODI0NjNmIDEwMDY0NAotLS0gYS9kb2NzL01ha2VmaWxlCisrKyBiL2Rv
Y3MvTWFrZWZpbGUKQEAgLTIzNywxNyArMjM3LDE4IEBAIHR4dC8lLnR4dDogJS5tYXJrZG93bgog
CSQoSU5TVEFMTF9EQVRBKSAkPCAkQAogCiAjIE1ldGFydWxlIGZvciBnZW5lcmF0aW5nIHBhbmRv
YyBydWxlcy4KLWRlZmluZSBHRU5FUkFURV9QQU5ET0NfUlVMRQotIyAkKDEpIGlzIHRoZSB0YXJn
ZXQgZG9jdW1lbnRhdGlvbiBmb3JtYXQuICQoMikgaXMgdGhlIHNvdXJjZSBmb3JtYXQuCi0KLSQo
MSkvJS4kKDEpOiAlLiQoMikKK2RlZmluZSBHRU5FUkFURV9QQU5ET0NfUlVMRV9SQVcKKyQoMSk6
ICQoMikKIGlmbmVxICgkKFBBTkRPQyksKQogCUAkKElOU1RBTExfRElSKSAkJChARCkKIAkkKFBB
TkRPQykgLS1udW1iZXItc2VjdGlvbnMgLS10b2MgLS1zdGFuZGFsb25lICQkPCAtLW91dHB1dCAk
JEAKIGVsc2UKIAlAZWNobyAicGFuZG9jIG5vdCBpbnN0YWxsZWQ7IHNraXBwaW5nICQkQCIKIGVu
ZGlmCi0KK2VuZGVmCitkZWZpbmUgR0VORVJBVEVfUEFORE9DX1JVTEUKKyMgJCgxKSBpcyB0aGUg
dGFyZ2V0IGRvY3VtZW50YXRpb24gZm9ybWF0LiAkKDIpIGlzIHRoZSBzb3VyY2UgZm9ybWF0Lgor
JChjYWxsIEdFTkVSQVRFX1BBTkRPQ19SVUxFX1JBVywkKDEpLyUuJCgxKSwlLiQoMikpCiBlbmRl
ZgogJChldmFsICQoY2FsbCBHRU5FUkFURV9QQU5ET0NfUlVMRSxwZGYscGFuZG9jKSkgICAjIHBk
Zi8lLnBkZjogJS5wYW5kb2MKICQoZXZhbCAkKGNhbGwgR0VORVJBVEVfUEFORE9DX1JVTEUsdHh0
LHBhbmRvYykpICAgIyB0eHQvJS50eHQ6ICUucGFuZG9jCi0tIAoyLjEuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
