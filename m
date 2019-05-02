From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 8/9] mg-repro-setup: Move flight
 creation up before task creation
Date: Thu, 2 May 2019 18:42:37 +0100
Message-ID: <20190502174238.23848-9-ian.jackson@eu.citrix.com>
References: <20190502174238.23848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yl7K=TC=citrix.com=prvs=018ff06f8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hMFtO-0006gF-IG
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 17:53:10 +0000
In-Reply-To: <20190502174238.23848-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm8gc2lnbmlmaWNhbnQgZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBtZy1yZXByby1zZXR1cCB8IDYg
KysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL21nLXJlcHJvLXNldHVwIGIvbWctcmVwcm8tc2V0dXAKaW5kZXggZDYzZTI5
YjYuLjJlMWQzYjg4IDEwMDc1NQotLS0gYS9tZy1yZXByby1zZXR1cAorKysgYi9tZy1yZXByby1z
ZXR1cApAQCAtMTY3LDYgKzE2Nyw5IEBAIHdoaWxlIFsgJCMgLW5lIDAgXTsgZG8KIAllc2FjCiBk
b25lCiAKK2ZsaWdodD0kKC4vY3MtYWRqdXN0LWZsaWdodCBuZXc6JGJsZXNzaW5nKQorcHJvZ3Jl
c3MgIm5ldyBmbGlnaHQgaXMgJGZsaWdodCIKKwogT1NTVEVTVF9UQVNLPSQocGVybCAtZSAnCiAJ
dXNlIE9zc3Rlc3Q7CiAJdXNlIE9zc3Rlc3Q6OkV4ZWN1dGl2ZTsKQEAgLTE3Niw5ICsxNzksNiBA
QCBPU1NURVNUX1RBU0s9JChwZXJsIC1lICcKICcpCiBleHBvcnQgT1NTVEVTVF9UQVNLCiAKLWZs
aWdodD0kKC4vY3MtYWRqdXN0LWZsaWdodCBuZXc6JGJsZXNzaW5nKQotcHJvZ3Jlc3MgIm5ldyBm
bGlnaHQgaXMgJGZsaWdodCIKLQogaWYgWyAiJHthbGxvY19pZGVudHNbKl19IiBdOyB0aGVuCiAJ
cHJvZ3Jlc3MgImFsbG9jYXRpbmcgJHthbGxvY19pZGVudHNbKl19IC4uLiIKIAlhbGxvY19vdXRw
dXQ9dG1wLyRmbGlnaHQuYWxsb2NhdGlvbnMKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
