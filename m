From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/5] x86: split out cpuid objects and helpers
Date: Tue, 29 May 2018 06:32:42 -0600
Message-ID: <5B0D486A02000078001C69AF@prv1-mh.provo.novell.com>
References: <20180524160522.757-1-wei.liu2@citrix.com>
 <20180524160522.757-3-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gyld=iq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fNe7Z-0002At-UX
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 12:53:01 +0000
In-Reply-To: <20180524160522.757-3-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA1LjE4IGF0IDE4OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VGhleSBhcmUgbW92ZWQgdG8gYSBuZXcgaGVhZGVyIHdoaWNoIGlzIGdvaW5nIHRvIGJlIGNvbnN1
bWVkIGJ5IGJvdGgKPiB0aGUgaHlwZXJ2aXNvciBhbmQgdG9vbHN0YWNrLgoKQnkgdGhlIGVuZCBv
ZiB0aGlzIHNlcmllcyBpdCBpcyBub3QgY2xlYXIgd2hhdCB1c2UgYWxsIG9mIHRoZSBtb3ZlZCBz
dHVmZiBpcyBnb2luZwp0byBiZSB0byB0aGUgdG9vbCBzdGFjay4gQ2FuIHdlIG1vdmUgdGhpbmdz
IGFzIHRoZXkgYXJlIGluZGVlZCBnYWluaW5nIGEgMm5kCnVzZT8KCj4gQ3JlYXRlIGEgbmV3IGRp
cmVjdG9yeSBmb3IgdGhpcyBraW5kIG9mIGhlYWRlcnMgaW4gYW50aWNpcGF0aW9uIG9mCj4gbW9y
ZSB3aWxsIGNvbWUuCgpJIHByZWZlciBSb2dlcidzIHN1Z2dlc3Rpb24gdG8gZm9sbG93IG1vcmUg
dGhlIGxpYmVsZiBzdHlsZSBvZiBzaGFyaW5nIGJpdHMuCgo+ICB4ZW4vaW5jbHVkZS9hc20teDg2
L2FyY2gtc2hhcmVkL2NwdWlkLmggfCAyMTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9jcHVpZC5oICAgICAgICAgICAgIHwgMjEwICstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCkFuZCBpZiB0aGlzIHdhcyB0aGUgd2F5IHRvIGdv
LCBJIGZ1cnRoZXIgZGlzbGlrZSBzb21ldGhpbmcgbGlrZSBhcmNoLSovCnVuZGVybmVhdGggYXNt
LSovLiBIb3cgYWJvdXQgeGVuL2luY2x1ZGUvc2hhcmVkL3g4Ni9jcHVpZC5oPwoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
