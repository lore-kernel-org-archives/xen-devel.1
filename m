From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] sched/null: skip vCPUs on the waitqueue
 that are blocked
Date: Tue, 19 Dec 2017 14:37:27 +0000
Message-ID: <20171219143607.v3crzjofw22ntd4y@MacBook-Pro-de-Roger.local>
References: <20171219141655.80982-1-roger.pau@citrix.com>
 <5A392F7F020000780019876E@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=u91z=dp=citrix.com=prvs=519ad8697=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eRJ25-00087w-Lf
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 14:38:13 +0000
Content-Disposition: inline
In-Reply-To: <5A392F7F020000780019876E@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org, Dario Faggioli <raistlin@linux.it>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMTksIDIwMTcgYXQgMDc6MjU6NTFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjEyLjE3IGF0IDE1OjE2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZF9udWxsLmMKPiA+ICsrKyBiL3hlbi9jb21t
b24vc2NoZWRfbnVsbC5jCj4gPiBAQCAtNzgxLDYgKzc4MSwxMCBAQCBzdGF0aWMgc3RydWN0IHRh
c2tfc2xpY2UgbnVsbF9zY2hlZHVsZShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsCj4gPiAg
ICAgICAgICB7Cj4gPiAgICAgICAgICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeSggd3ZjLCAmcHJ2
LT53YWl0cSwgd2FpdHFfZWxlbSApCj4gPiAgICAgICAgICAgICAgewo+ID4gKyAgICAgICAgICAg
ICAgICBpZiAoIHRlc3RfYml0KF9WUEZfZG93biwgJnd2Yy0+dmNwdS0+cGF1c2VfZmxhZ3MpICkK
PiA+ICsgICAgICAgICAgICAgICAgICAgIC8qIFNraXAgdkNQVXMgdGhhdCBhcmUgZG93bi4gKi8K
PiA+ICsgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+IAo+IElmIHN1Y2ggYSBjdXN0b20g
Y2hlY2sgaXMgaW5kZWVkIG5lY2Vzc2FyeSBoZXJlIChsb29rcyB0byByYXRoZXIgYmUKPiBzb21l
dGhpbmcgZ2VuZXJpYyBzY2hlZHVsaW5nIGNvZGUgc2hvdWxkIGJlIGRlYWxpbmcgd2l0aCksIHdo
eQo+IHdvdWxkIHlvdSB0YWtlIGludG8gY29uc2lkZXJhdGlvbiBvbmx5IHRoaXMgb25lIFZQRiBi
aXQ/CgpJIGtub3cgdGhhdCBhdCBsZWFzdCB3aGVuIGEgdkNQVSBpcyBicm91Z2h0IHVwIGEgY2Fs
bCB0byB2Y3B1X3dha2UKaGFwcGVucyBhbmQgdGhlIHZDUFUgaXMgc2NoZWR1bGVkLiBUaGUgc2Ft
ZSBoYXBwZW5zIGZvciB1bnBhdXNlIGFuZApzb21lIG9mIHRoZSBvdGhlciBldmVudHMsIGJ1dCBJ
J20gbm90IHN1cmUgd2hldGhlciBpdCBhcHBsaWVzIHRvIGFsbApvZiB0aGVtLgoKSU1ITyAnZG93
bicgd2FzIHRoZSBjbGVhcmVyIG9uZSBzaW5jZSB0aGVyZSdzIG5vIGNoYW5jZSB0aGUgdkNQVSBp
cwpnb2luZyB0byBydW4gaW4gdGhlIG5lYXIgZnV0dXJlIGlmIGl0J3Mgbm90IGJyb3VnaHQgdXAu
IE90aGVyCnBhdXNlX2ZsYWdzIGxpa2UgJ2Jsb2NrZWRfaW5feGVuJyBvciAnbWlncmF0aW5nJyBz
ZWVtIG1vcmUgdGVtcG9yYXJ5LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
