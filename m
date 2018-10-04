From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 4/4] x86: support "pv-l1tf=default"
Date: Thu, 04 Oct 2018 04:09:39 -0600
Message-ID: <5BB5E6E302000078001EE363@prv1-mh.provo.novell.com>
References: <5BB20CE602000078001ED341@prv1-mh.provo.novell.com>
 <5BB20ED402000078001ED37F@prv1-mh.provo.novell.com>
 <9f7817cd-5796-40cf-6591-0ea775d4c1f7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=z6fo=mq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g80Zi-0007AF-NM
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 10:09:42 +0000
In-Reply-To: <9f7817cd-5796-40cf-6591-0ea775d4c1f7@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjEwLjE4IGF0IDE4OjU5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDEvMTAvMTggMTM6MTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBKdXN0IGxpa2Ug
dGhlIG90aGVyd2lzZSBzaW1pbGFyICJ4cHRpPSIgYWxsb3dzIGZvciwgdG8gcmV2ZXJ0IGJhY2sg
dG8KPj4gYnVpbHQtaW4gZGVmYXVsdHMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBJJ3ZlIG1hZGUgbXkgb3BpbmlvbiBvbiB0aGlzIG1h
dHRlciBjbGVhciBvbiBzZXZlcmFsIG9jY2FzaW9ucy4KPiAKPiBUaGlzIGlzIG5vdCBhIGNoYW5n
ZSBJJ20gaGFwcHkgd2l0aCB0YWtpbmcuCgpJIGtuZXcgeW91IHdvdWxkIHNheSB0aGlzLCBidXQg
SSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kIHdoeSB5b3UgdGhpbmsKeW91IG5lZWQgdG8gYmxvY2sg
c29tZXRoaW5nIHRoYXQgX2RvZXNuJ3QgaGFybV8gYW55b25lIHdoZW4gbm90CnVzZWQsIGJ1dCBp
cyB1c2VmdWwgdG8gY2VydGFpbiBwZW9wbGUuIEFzIHByZXZpb3VzbHkgc2FpZCwgSSBpbiBwYXJ0
aWN1bGFyCmRvbid0IGJ1eSB5b3VyIGFyZ3VtZW50IG9mIHRoaXMgYWRkaW5nIGZ1cnRoZXIgY29t
cGxleGl0eSB0byB0aGUKaW50ZXJhY3Rpb25zIG9mIGNvbW1hbmQgbGluZSBvcHRpb25zLCBtb3N0
IHNwZWNpZmljYWxseSB0aGUgZGVwZW5kZW5jeQpvZiBvdmVyYWxsIGVmZmVjdCBvbiB0aGVpciBv
cmRlcmluZyBvbiB0aGUgY29tbWFuZCBsaW5lOiBUaGlzIGlzCnNvbWV0aGluZyB3aGljaCBoYXMg
YWx3YXlzIGJlZW4gdGhlcmUsIGFuZCBkb2Vzbid0IGdldCBtYWRlIGFueQp3b3JzZSBhdCBhbGwg
d2l0aCB0aGlzIGFkZGl0aW9uLgoKSW4gdGhlIGVuZCB5b3UgY291bGQgc3VibWl0IGEgcGF0Y2gg
dG8gcmVtb3ZlIHRoZSAiZGVmYXVsdCIgc3ViLQpvcHRpb24gZnJvbSB4cHRpICh3aXRoIHdoYXRl
dmVyIHJhdGlvbmFsZSksIGFuZCBJIGNvdWxkIHNpbWlsYXJseQpyZWZ1c2UgdG8gYWNrIGl0LiBX
ZSdkIHRoZW4gYmUgc3R1Y2sgZm9yZXZlciB3aXRoIHR3byBzaW1pbGFyIGJ1dAppbmNvbnNpc3Rl
bnQgY29tbWFuZCBsaW5lIG9wdGlvbnMuIE5vdCBhIHZlcnkgbmljZSBzaXR1YXRpb24uLi4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
