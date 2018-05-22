From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: correct vCPU dirty CPU handling
Date: Tue, 22 May 2018 05:08:47 -0600
Message-ID: <5B03FA3F02000078001C49C4@prv1-mh.provo.novell.com>
References: <5AE19EC002000078001BEABB@prv1-mh.provo.novell.com>
 <20180522110235.GB25181@mail.soc.lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qj7d=ij=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fL59w-0007Vz-LL
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 11:08:52 +0000
In-Reply-To: <20180522110235.GB25181@mail.soc.lip6.fr>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA1LjE4IGF0IDEzOjAyLCA8Ym91eWVyQGFudGlvY2hlLmV1Lm9yZz4gd3JvdGU6
Cj4gSSBzdGlsbCBoYWQgdG8gYXBwbHkgdGhlIHBhdGNoIGJlbG93IHdpdGggNC4xMXJjNCBmb3Ig
TmV0QlNELgo+IEFueSBjaGFuY2UgdG8gZ2V0IGl0IGluIHRoZSA0LjExIGJyYW5jaCBiZWZvcmUg
cmVsZWFzZSA/CgpTZWUgdGhlIHRocmVhZCAiUGVuZGluZyBwYXRjaGVzIGZvciA0LjExPyIgSU9X
IC0gSSB2ZXJ5IG11Y2ggaG9wZSBzby4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
