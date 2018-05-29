From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86: suppress sync when XPTI is disabled
 for a domain
Date: Tue, 29 May 2018 12:16:45 +0200
Message-ID: <862376fe-fd14-39f6-d2fa-d1abc4635484@suse.com>
References: <5B0579AF02000078001C51CB@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ztdp=iq=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fNbgO-0003kE-Cj
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 10:16:48 +0000
In-Reply-To: <5B0579AF02000078001C51CB@suse.com>
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

T24gMjMvMDUvMTggMTY6MjQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE5vdyB0aGF0IHdlIGhhdmUg
YSBwZXItZG9tYWluIGZsYWcgd2UgY2FuIGFuZCBzaG91bGQgY29udHJvbCBzeW5jLWluZyBpbgo+
IGEgbW9yZSBmaW5lIGdyYWluZWQgbWFubmVyOiBPbmx5IGRvbWFpbnMgaGF2aW5nIFhQVEkgZW5h
YmxlZCBuZWVkIHRoZQo+IHN5bmMgdG8gb2NjdXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
