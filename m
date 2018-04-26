From: Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: [PATCH] x86: correct vCPU dirty CPU handling
Date: Thu, 26 Apr 2018 14:39:13 +0200
Message-ID: <20180426123913.GA1119@mail.soc.lip6.fr>
References: <5AE19EC002000078001BEABB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=myaz=hp=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1fBgBE-0007wj-Ud
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 12:39:20 +0000
Content-Disposition: inline
In-Reply-To: <5AE19EC002000078001BEABB@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMjYsIDIwMTggYXQgMDM6NDE6MjBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQ29tbWl0IGRmODIzNGZkMmMgKCJyZXBsYWNlIHZDUFUncyBkaXJ0eSBDUFUgbWFzayBi
eSBudW1lcmljIElEIikgd2FzCj4gdG9vIGxheCBpbiB0d28gcmVzcGVjdHM6IEZpcnN0IG9mIGFs
bCBpdCBkaWRuJ3QgY29uc2lkZXIgdGhlIGNhc2Ugb2YgYQo+IHZDUFUgbm90IGhhdmluZyBhIHZh
bGlkIGRpcnR5IENQVSBpbiB0aGUgZGVzY3JpcHRvciB0YWJsZSBUTEIgZmx1c2gKPiBjYXNlLiBU
aGlzIGlzIHRoZSBpc3N1ZSBNYW51YWwgaGFzIHJ1biBpbnRvIHdpdGggTmV0QlNELgoKSGVsbG8s
CkkgdGVzdGVkIHRoaXMgcGF0Y2ggd2l0aCBOZXRCU0QsIGl0IGxvb2tzIGdvb2QuCgotLSAKTWFu
dWVsIEJvdXllciA8Ym91eWVyQGFudGlvY2hlLmV1Lm9yZz4KICAgICBOZXRCU0Q6IDI2IGFucyBk
J2V4cGVyaWVuY2UgZmVyb250IHRvdWpvdXJzIGxhIGRpZmZlcmVuY2UKLS0KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
