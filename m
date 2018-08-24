From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 03/11] x86/paravirt: remove clobbers from
 struct paravirt_patch_site
Date: Fri, 24 Aug 2018 16:03:22 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1808241602140.1550__5995.33038116551$1535119339$gmane$org@nanos.tec.linutronix.de>
References: <20180813073739.26108-1-jgross@suse.com>
 <20180813073739.26108-4-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oirh=lh=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1ftCgR-0005zs-Oj
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 14:03:27 +0000
In-Reply-To: <20180813073739.26108-4-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: rusty@rustcorp.com.au, peterz@infradead.org, x86@kernel.org, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, mingo@redhat.com, hpa@zytor.com, xen-devel@lists.xenproject.org, akataria@vmware.com, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxMyBBdWcgMjAxOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKCj4gVGhlcmUgaXMgbm8g
bmVlZCBhbnkgbG9uZ2VyIHRvIHN0b3JlIHRoZSBjbG9iYmVycyBpbiBzdHJ1Y3QKPiBwYXJhdmly
dF9wYXRjaF9zaXRlLiBSZW1vdmUgY2xvYmJlcnMgZnJvbSB0aGUgc3RydWN0IGFuZCBmcm9tIHRo
ZQo+IHJlbGF0ZWQgbWFjcm9zLgo+IAo+IFdoaWxlIGF0IGl0IGZpeCBzb21lIGxpbmVzIGxvbmdl
ciB0aGFuIDgwIGNoYXJhY3RlcnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51
dHJvbml4LmRlPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
