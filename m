From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/3] x86/alternatives: fully leverage
 automatic NOP filling
Date: Fri, 29 Jun 2018 14:22:05 +0100
Message-ID: <e90d4ae2-fe57-09d2-00fe-8204cdb3939c@citrix.com>
References: <5B362CC002000078001CF22A@prv1-mh.provo.novell.com>
 <5B362D7C02000078001CF23D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vmj+=jp=citrix.com=prvs=71170ba8f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fYtLm-0002Ic-LU
 for xen-devel@lists.xenproject.org; Fri, 29 Jun 2018 13:22:10 +0000
In-Reply-To: <5B362D7C02000078001CF23D@prv1-mh.provo.novell.com>
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
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDYvMTggMTQ6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEFzIG9mIGNvbW1pdCA0MDA4
YzcxZDdhICgieDg2L2FsdDogU3VwcG9ydCBmb3IgYXV0b21hdGljIHBhZGRpbmcKPiBjYWxjdWxh
dGlvbnMiKSB0aGVyZSdzIG5vIHBvaW50IGhhdmluZyBleHBsaWN0IEFTTV9OT1BuIGluc3RhbmNl
cyBpbgo+IGFsdGVybmF0aXZlcyBhbnltb3JlIC0gZHJvcCB0aGVtLiBBcyBhIHJlc3VsdCBhbHNv
IGRyb3AgdGhlIGFzbS9ub3BzLmgKPiBpbmNsdXNpb24gZnJvbSBhbHRlcm5hdGl2ZS5oLCBhZGRp
bmcgZXhwbGljaXQgaW5jbHVzaW9ucyBpbiB0aGUgdHdvCj4gcmVtYWluaW5nIEMgZmlsZXMgbmVl
ZGluZyB0aGVtLgo+Cj4gV2hpbGUgdG91Y2hpbmcgaXQgYWxzbyBtb3ZlIHRoZSBDUjRfUFYzMl9S
RVNUT1JFIGRlZmluaXRpb24gb3V0IG9mIHRoZQo+IFNNQVAtc3BlY2lmaWMgY29uZGl0aW9uYWwg
aW50byBhIG1vcmUgZ2VuZXJhbCBvbmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpJJ20gZmluZSB3aXRoIHRoaXMgaW4gcHJpbmNpcGxlLCBidXQg
SSdkIHByZWZlciBpZiBpdCBjYW4gd2FpdCB1bnRpbAphZnRlciBJIHJlYmFzZSBteSB0b29sY2hh
aW4gbm9wcyBwYXRjaC7CoCBBcyBpdCBzdGFuZHMsIHRoaXMgaW5jcmVhc2VzCnRoZSBudW1iZXIg
b2YgYm9vdCB0aW1lIHNpdGVzIHdlIGFjdHVhbGx5IG1vZGlmeSBmb3Igbm9wIG9wdGltc2lhdGlv
bgpwdXJwb3Nlcy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
