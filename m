From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/3] x86/alternatives: fully leverage
 automatic NOP filling
Date: Wed, 29 Aug 2018 14:57:28 +0100
Message-ID: <b2b82a5b-fedf-700f-2b87-03e6c63b42c9@citrix.com>
References: <5B362CC002000078001CF22A@prv1-mh.provo.novell.com>
 <5B86A2A202000078001E30C9@prv1-mh.provo.novell.com>
 <5B86A42602000078001E30E9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xzde=lm=citrix.com=prvs=772b5abf7=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fv0ym-0002iP-0D
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 13:57:52 +0000
In-Reply-To: <5B86A42602000078001E30E9@prv1-mh.provo.novell.com>
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

T24gMjkvMDgvMTggMTQ6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEFzIG9mIGNvbW1pdCA0MDA4
YzcxZDdhICgieDg2L2FsdDogU3VwcG9ydCBmb3IgYXV0b21hdGljIHBhZGRpbmcKPiBjYWxjdWxh
dGlvbnMiKSB0aGVyZSdzIG5vIHBvaW50IGhhdmluZyBleHBsaWN0IEFTTV9OT1BuIGluc3RhbmNl
cyBpbgo+IGFsdGVybmF0aXZlcyBhbnltb3JlIC0gZHJvcCB0aGVtLiBBcyBhIHJlc3VsdCBhbHNv
IGRyb3AgdGhlIGFzbS9ub3BzLmgKPiBpbmNsdXNpb24gZnJvbSBhbHRlcm5hdGl2ZS5oLCBhZGRp
bmcgZXhwbGljaXQgaW5jbHVzaW9ucyBpbiB0aGUgdHdvCj4gcmVtYWluaW5nIEMgZmlsZXMgbmVl
ZGluZyB0aGVtLgo+Cj4gV2hpbGUgdG91Y2hpbmcgaXQgYWxzbyBtb3ZlIHRoZSBDUjRfUFYzMl9S
RVNUT1JFIGRlZmluaXRpb24gb3V0IG9mIHRoZQo+IFNNQVAtc3BlY2lmaWMgY29uZGl0aW9uYWwg
aW50byBhIG1vcmUgZ2VuZXJhbCBvbmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
