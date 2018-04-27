From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86emul: VMOVNTDQA should raise #GP(0) on
 mis-alignment
Date: Fri, 27 Apr 2018 14:34:15 +0200
Message-ID: <a1ef9a45-881c-a7ce-648c-c1e0c19f71d8@suse.com>
References: <5AE3132E02000078001BF183@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mnjk=hq=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fC2Zx-0002PO-Rc
 for xen-devel@lists.xenproject.org; Fri, 27 Apr 2018 12:34:21 +0000
In-Reply-To: <5AE3132E02000078001BF183@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDQvMTggMTQ6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IENvbW1pdCA1MGI3MzExOGQ1
IGludHJvZHVjZWQgZW11bGF0aW9uIG9mIHRoZSBpbnNuIHdpdGhvdXQgZXh0ZW5kaW5nIHRoZQo+
IHNldCBvZiBvcGNvZGVzIHJlcXVpcmluZyBzcGVjaWFsIGFsaWdubWVudCByZWxhdGVkICNHUCBi
ZWhhdmlvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoK
SnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
