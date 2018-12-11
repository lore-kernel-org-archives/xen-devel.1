From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 0/2] Misc patches for common/page_alloc.c
Date: Tue, 11 Dec 2018 11:56:29 +0000
Message-ID: <20181211115631.5133-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DjN1=OU=citrix.com=prvs=8762858e5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gWgeg-0005Qq-IK
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 11:56:50 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSAoMik6CiAgeGVuOiBjbGVhbiB1cCBjb21tb24vcGFnZV9hbGxvYy5jCiAgeGVuOiBz
aW1wbGlmeSB7Y2hlY2sscG9pc29ufV9vbmVfcGFnZQoKIHhlbi9jb21tb24vcGFnZV9hbGxvYy5j
IHwgNTYgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQoKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
