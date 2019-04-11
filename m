From: Chris Patterson <cjp256@gmail.com>
Subject: Re: [PATCH 1/2] libxl: Add virtio vga interface support
 for qemu
Date: Wed, 10 Apr 2019 20:02:41 -0400
Message-ID: <CABZSBQebNYDTSGZTMNJv6C2qvcNkW=MDMbbB2_1aUu37840yzQ@mail.gmail.com>
References: <1554406611-11262-1-git-send-email-cjp256@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EL0W=SN=gmail.com=cjp256@srs-us1.protection.inumbo.net>)
 id 1hENB8-000520-Jx
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 00:02:54 +0000
Received: by mail-it1-x141.google.com with SMTP id y204so6662841itf.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2019 17:02:53 -0700 (PDT)
In-Reply-To: <1554406611-11262-1-git-send-email-cjp256@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Chris Patterson <pattersonc@ainfosec.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Rm9yIGFueW9uZSBsb29raW5nIGF0IHRoaXMuLi4gd2hpbGUgSSBoYXZlIHRlc3RlZCBhbmQgdmVy
aWZpZWQgdGhhdApib3RoIHZpcnRpby1ncHUgYW5kIFZpckdMIHdvcmssIGl0J3Mgbm90IHdpdGhv
dXQgc29tZSBoaWNjdXAuCgpJIGhhdmUgYmVlbiBydW5uaW5nIFVidW50dSAxOS4wNCB3aXRoIHRo
aXMgY29uZmlnIGZvciBhIGZldyBkYXlzIGFuZCBJCmhhdmUgaGFkIGEgY291cGxlIFZNIGZyZWV6
ZXMuICd4bCBkbWVzZycgaXMgc3BhbW1pbmcgdGhlIGZvbGxvd2luZwpyZXBlYXRlZGx5OgooWEVO
KSBpcnEuYzoyNDc5OiBkb20zOiBwaXJxIDE0MyBvciBlbXVpcnEgLTMgYWxyZWFkeSBtYXBwZWQK
ClNlZW1zIHRvIGJlIHJlbGF0ZWQgdG8gTVNJLVggZm9yIHRoZSBkZXZpY2UsIGJ1dCBJIGhhdmVu
J3QgeWV0IGhhZCBhCmNoYW5jZSB0byBkaWcgaW50byBpdC4gIE1heWJlIHNvbWVvbmUga25vd3Mg
aWYgdGhpcyBpcyB0byBiZSBleHBlY3RlZApnaXZlbiB0aGUgc3RhdGUgb2YgdGhpbmdzPyA6KQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
