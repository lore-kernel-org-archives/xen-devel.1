From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12] gic-vgic: fix assert condition
Date: Mon, 4 Feb 2019 17:02:35 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902041701470.22962@sstabellini-ThinkPad-X260>
References: <1548354814-23208-1-git-send-email-andrii.anisov@gmail.com>
 <1548355642.9022.23.camel@amazon.de>
 <CAC1WxdjgOg1Qg4=2Me0nwdEO+CMS4C1WMr7E=pxpi74-ME9uTw@mail.gmail.com>
 <c6cb57ce-3447-67ee-5629-322ee6207362@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fYof=QM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gqp8H-0006QO-FL
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 01:02:37 +0000
In-Reply-To: <c6cb57ce-3447-67ee-5629-322ee6207362@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: jgross@suse.com, "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "Nuernberger,
 Stefan" <snu@amazon.de>, "julien.grall@arm.com" <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmlpLAoKUGxlYXNlIHNlbmQgYW4gdXBkYXRlIHNvb24gYXMgSSB3b3VsZCBsaWtlIHRv
IGdldCBpdCBpbiA0LjEyLgoKCkp1ZXJnZW4sCgpJIHdvdWxkIGxpa2UgdG8gaGF2ZSB5b3VyIHJl
bGVhc2UgYWNrIG9uIHRoaXMuCgoKT24gRnJpLCAyNSBKYW4gMjAxOSwgQW5kcmlpIEFuaXNvdiB3
cm90ZToKPiBTdGVmYW4sCj4gCj4gSSBob3BlIHlvdSB3b3VsZCBub3QgbWluZCBpZiBJIHB1dCB5
b3VyIFN1Z2dlc3RlZC1ieSBmb3IgdjI/Cj4gCj4gT24gMjUuMDEuMTkgMDg6NTUsIEFuZHJpaSBB
bmlzb3Ygd3JvdGU6Cj4gCj4gPiBZb3UgYXJlIGFic29sdXRlbHkgY29ycmVjdC4KPiAtLSAKPiBT
aW5jZXJlbHksCj4gQW5kcmlpIEFuaXNvdi4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
