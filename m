From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 11/20] xen/arm32: head: Don't set MAIR0 and MAIR1
Date: Mon, 22 Apr 2019 17:49:28 +0100
Message-ID: <20190422164937.21350-12-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8t-0004xh-7J
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:07 +0000
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

VGhlIGNvLXByb2Nlc3NvciByZWdpc3RlcnMgTUFJUjAgYW5kIE1BSVIxIGFyZSBtYW5hZ2VkIGJ5
IEVMMS4gU28gdGhlcmUKYXJlIG5vIG5lZWQgdG8gaW5pdGlhbGl6ZSB0aGVtIGR1cmluZyBYZW4g
Ym9vdC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
Ci0tLQogeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgYi94
ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCmluZGV4IGQ0MmExMzU1NmMuLjM0NDg4MTdhYWIgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKKysrIGIveGVuL2FyY2gvYXJtL2Fy
bTMyL2hlYWQuUwpAQCAtMjEyLDggKzIxMiw2IEBAIGNwdV9pbml0X2RvbmU6CiAgICAgICAgIC8q
IFNldCB1cCBtZW1vcnkgYXR0cmlidXRlIHR5cGUgdGFibGVzICovCiAgICAgICAgIGxkciAgIHIw
LCA9TUFJUjBWQUwKICAgICAgICAgbGRyICAgcjEsID1NQUlSMVZBTAotICAgICAgICBtY3IgICBD
UDMyKHIwLCBNQUlSMCkKLSAgICAgICAgbWNyICAgQ1AzMihyMSwgTUFJUjEpCiAgICAgICAgIG1j
ciAgIENQMzIocjAsIEhNQUlSMCkKICAgICAgICAgbWNyICAgQ1AzMihyMSwgSE1BSVIxKQogCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
