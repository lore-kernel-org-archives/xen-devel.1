From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12] gic-vgic: fix assert condition
Date: Fri, 25 Jan 2019 14:10:11 +0200
Message-ID: <c6cb57ce-3447-67ee-5629-322ee6207362@gmail.com>
References: <1548354814-23208-1-git-send-email-andrii.anisov@gmail.com>
 <1548355642.9022.23.camel@amazon.de>
 <CAC1WxdjgOg1Qg4=2Me0nwdEO+CMS4C1WMr7E=pxpi74-ME9uTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qSih=QB=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gn0JM-0001Mx-VJ
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 12:10:17 +0000
Received: by mail-lf1-x143.google.com with SMTP id a8so6761575lfk.5
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jan 2019 04:10:15 -0800 (PST)
In-Reply-To: <CAC1WxdjgOg1Qg4=2Me0nwdEO+CMS4C1WMr7E=pxpi74-ME9uTw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Nuernberger, Stefan" <snu@amazon.de>
Cc: "jgross@suse.com" <jgross@suse.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "julien.grall@arm.com" <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

U3RlZmFuLAoKSSBob3BlIHlvdSB3b3VsZCBub3QgbWluZCBpZiBJIHB1dCB5b3VyIFN1Z2dlc3Rl
ZC1ieSBmb3IgdjI/CgpPbiAyNS4wMS4xOSAwODo1NSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKCj4g
WW91IGFyZSBhYnNvbHV0ZWx5IGNvcnJlY3QuCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3Yu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
