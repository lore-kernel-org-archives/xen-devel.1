From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] pvcalls-front: fixes incorrect error
 handling
Date: Thu, 29 Nov 2018 17:54:53 +0100
Message-ID: <d57f36f0-3e90-855e-0e89-281e8facbc89__38771.6725854718$1543510413$gmane$org@suse.com>
References: <1542852432-30019-1-git-send-email-bianpan2016@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jnsg=oi=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gSPaa-0004go-OZ
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 16:54:56 +0000
In-Reply-To: <1542852432-30019-1-git-send-email-bianpan2016@163.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pan Bian <bianpan2016@163.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMTEvMjAxOCAwMzowNywgUGFuIEJpYW4gd3JvdGU6Cj4ga2ZyZWUoKSBpcyBpbmNvcnJl
Y3RseSB1c2VkIHRvIHJlbGVhc2UgdGhlIHBhZ2VzIGFsbG9jYXRlZCBieQo+IF9fZ2V0X2ZyZWVf
cGFnZSgpIGFuZCBfX2dldF9mcmVlX3BhZ2VzKCkuIFVzZSB0aGUgbWF0Y2hpbmcgZGVhbGxvY2F0
b3JzCj4gaS5lLiwgZnJlZV9wYWdlKCkgYW5kIGZyZWVfcGFnZXMoKSwgcmVzcGVjdGl2ZWx5Lgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFBhbiBCaWFuIDxiaWFucGFuMjAxNkAxNjMuY29tPgoKUHVzaGVk
IHRvIHhlbi90aXAuZ2l0IGZvci1saW51cy00LjIwYQoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
