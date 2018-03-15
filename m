From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86/alternatives: fully leverage
 automatic NOP filling
Date: Thu, 15 Mar 2018 12:43:34 +0000
Message-ID: <2786e383-87e3-377e-9200-a5c18b468cf3@citrix.com>
References: <5AA8E9BE02000078001B15B0@prv-mh.provo.novell.com>
 <5AA8EB6702000078001B15BE@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h5rp=gf=citrix.com=prvs=605c7d53e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ewSEN-0007MT-6f
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 12:43:39 +0000
In-Reply-To: <5AA8EB6702000078001B15BE@prv-mh.provo.novell.com>
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

T24gMTQvMDMvMTggMDg6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+IEFzIG9mIGNvbW1pdCA0MDA4
YzcxZDdhICgieDg2L2FsdDogU3VwcG9ydCBmb3IgYXV0b21hdGljIHBhZGRpbmcKPiBjYWxjdWxh
dGlvbnMiKSB0aGVyZSdzIG5vIHBvaW50IGhhdmluZyBleHBsaWN0IEFTTV9OT1BuIGluc3RhbmNl
cyBpbgo+IGFsdGVybmF0aXZlcyBhbnltb3JlIC0gZHJvcCB0aGVtLiBBcyBhIHJlc3VsdCBhbHNv
IGRyb3AgdGhlIGFzbS9ub3BzLmgKPiBpbmNsdXNpb24gZnJvbSBhbHRlcm5hdGl2ZS5oLCBhZGRp
bmcgZXhwbGljaXQgaW5jbHVzaW9ucyBpbiB0aGUgdHdvCj4gcmVtYWluaW5nIEMgZmlsZXMgbmVl
ZGluZyB0aGVtLgo+Cj4gV2hpbGUgdG91Y2hpbmcgaXQgYWxzbyBtb3ZlIHRoZSBDUjRfUFYzMl9S
RVNUT1JFIGRlZmluaXRpb24gb3V0IG9mIHRoZQo+IFNNQVAtc3BlY2lmaWMgY29uZGl0aW9uYWwg
aW50byBhIG1vcmUgZ2VuZXJhbCBvbmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpJIGhhZCBjb25zaWRlcmVkIGRvaW5nIHRoaXMsIGJ1dCBkZWNp
ZGVkIGFnYWluc3QgaXQuwqAgQXQgdGhlIG1vbWVudCwgdGhlCm1ham9yaXR5IG9mIGhhcmR3YXJl
IFhlbiBydW5zIG9uIChiZWluZyBJbnRlbCBwcmUtYnJvYWR3ZWxsKSBkb2Vzbid0Cm5lZWQgdG8g
dG91Y2ggdGhlIFNUQUMvQ0xBQyBwYXRjaCBzaXRlcywgYW5kIHRoaXMgY2hhbmdlIG1lYW5zIHdl
IHdpbGwKYWx3YXlzIHRvdWNoIHRob3NlIHNpdGVzLgoKT1RPSCwgKGZvbGxvd2luZyB1cCBmcm9t
IGxhdGVyIGRpc2N1c3Npb24pIGRvaW5nIHRoaXMgZG9lcyBtZWFuIHRoYXQgd2UKd291bGQgZW5k
IHVwIHJlcGxhY2luZyB3aXRoIEs4IG5vcHMgd2hlbiBhcHByb3ByaWF0ZS4KCkknZCBsaWtlIHRo
ZSB0b29sY2hhaW4tbm9wcyBjaGFuZ2UgdG8gZ28gaW4gZmlyc3QsIHNvIHdlIGRvbid0IHJlZ3Jl
c3MKdGhlIG1ham9yaXR5IHN0YXR1cyBxdW8sIGJ1dCBJIGhhdmUgbm8gb3RoZXIgaXNzdWVzIHdp
dGggdGhpcyBjaGFuZ2UuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
