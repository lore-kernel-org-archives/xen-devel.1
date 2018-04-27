From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: VMOVNTDQA should raise #GP(0) on
 mis-alignment
Date: Fri, 27 Apr 2018 13:21:10 +0100
Message-ID: <8c90c216-b543-b669-4799-1a85e6a5b692@citrix.com>
References: <5AE3132E02000078001BF183@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=95ya=hq=citrix.com=prvs=64868680e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fC2NF-0001Wd-Dt
 for xen-devel@lists.xenproject.org; Fri, 27 Apr 2018 12:21:13 +0000
In-Reply-To: <5AE3132E02000078001BF183@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDQvMTggMTM6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IENvbW1pdCA1MGI3MzExOGQ1
IGludHJvZHVjZWQgZW11bGF0aW9uIG9mIHRoZSBpbnNuIHdpdGhvdXQgZXh0ZW5kaW5nIHRoZQo+
IHNldCBvZiBvcGNvZGVzIHJlcXVpcmluZyBzcGVjaWFsIGFsaWdubWVudCByZWxhdGVkICNHUCBi
ZWhhdmlvci4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
