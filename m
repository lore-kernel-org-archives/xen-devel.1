From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12] gic-vgic: fix assert condition
Date: Tue, 5 Feb 2019 10:33:15 +0200
Message-ID: <7c3f413e-826c-d937-54df-f2272bb09c40@gmail.com>
References: <1548354814-23208-1-git-send-email-andrii.anisov@gmail.com>
 <1548355642.9022.23.camel@amazon.de>
 <CAC1WxdjgOg1Qg4=2Me0nwdEO+CMS4C1WMr7E=pxpi74-ME9uTw@mail.gmail.com>
 <c6cb57ce-3447-67ee-5629-322ee6207362@gmail.com>
 <alpine.DEB.2.10.1902041701470.22962@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0eyl=QM=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gqwAS-0005Ca-37
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 08:33:20 +0000
Received: by mail-lf1-x143.google.com with SMTP id l142so2009198lfe.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Feb 2019 00:33:18 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1902041701470.22962@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "jgross@suse.com" <jgross@suse.com>, Andrii Anisov <andrii_anisov@epam.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "Nuernberger,
 Stefan" <snu@amazon.de>, "julien.grall@arm.com" <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gU3RlZmFubywKCk9uIDA1LjAyLjE5IDAzOjAyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6Cj4gUGxlYXNlIHNlbmQgYW4gdXBkYXRlIHNvb24gYXMgSSB3b3VsZCBsaWtlIHRvIGdldCBp
dCBpbiA0LjEyLgoKSXQgaXMgYWxyZWFkeSB0aGVyZSBbMV0gWzJdLgoKWzFdIGh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wMS9tc2cwMjA0
OC5odG1sClsyXSBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNv
bW1pdDtoPTg2MzU0OTE1ODEyOWQzMjZiMmU1ODUwZjcyMmJmZGE2NDMyNjRmMmIKCi0tIApTaW5j
ZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
