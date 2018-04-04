From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 1/8] x86: NOP out XPTI entry/exit code
 when it's not in use
Date: Wed, 4 Apr 2018 08:07:29 +0200
Message-ID: <48ea57ad-537c-9196-bf49-17a6708a7a45@suse.com>
References: <5AAFC9E202000078001B36F7@prv-mh.provo.novell.com>
 <5AAFCB4202000078001B3707@suse.com>
 <c4ae0f15-8320-17ca-1ead-db709fafc8e4@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=2lni=gz=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f3ba3-0002FJ-Jt
 for xen-devel@lists.xenproject.org; Wed, 04 Apr 2018 06:07:35 +0000
In-Reply-To: <c4ae0f15-8320-17ca-1ead-db709fafc8e4@suse.com>
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

T24gMDMvMDQvMTggMTk6NDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMTkvMDMvMTggMTQ6
MzcsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBJbnRyb2R1Y2UgYSBzeW50aGV0aWMgZmVhdHVyZSBm
bGFnIHRvIHVzZSBhbHRlcm5hdGl2ZSBpbnN0cnVjdGlvbgo+PiBwYXRjaGluZyB0byBOT1Agb3V0
IGFsbCBjb2RlIG9uIGVudHJ5L2V4aXQgcGF0aHMuIEhhdmluZyBOT1BzIGhlcmUgaXMKPj4gZ2Vu
ZXJhbGx5IGJldHRlciB0aGFuIHVzaW5nIGNvbmRpdGlvbmFsIGJyYW5jaGVzLgo+Pgo+PiBBbHNv
IGNoYW5nZSB0aGUgbGltaXQgb24gdGhlIG51bWJlciBvZiBieXRlcyB3ZSBjYW4gcGF0Y2ggaW4g
b25lIGdvIHRvCj4+IHRoYXQgcmVzdWx0aW5nIGZyb20gdGhlIGVuY29kaW5nIGluIHN0cnVjdCBh
bHRfaW5zdHIgLSB0aGVyZSdzIG5vIHBvaW50Cj4+IHJlZHVjaW5nIGl0IGJlbG93IHRoYXQgbGlt
aXQsIGFuZCB3aXRob3V0IGEgY2hlY2sgYmVpbmcgaW4gcGxhY2UgdGhhdAo+PiB0aGUgbGltaXQg
aXNuJ3QgYWN0dWFsbHkgZXhjZWVkZWQsIHN1Y2ggYW4gYXJ0aWZpY2lhbCBib3VuZGFyeSBpcyBh
Cj4+IGxhdGVudCByaXNrLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gCj4gSnVzdCBkaWQgYSBwYXJhbGxlbCBtYWtlIG9mIHRoZSBoeXBlcnZp
c29yIHdpdGggYW5kIHdpdGhvdXQgdGhlIHBhdGNoLAo+IHdpdGggeHB0aT10cnVlIGFuZCB3aXRo
IHhwdGk9ZmFsc2UgKHZhbHVlcyBpbiBicmFjZXMgYXJlIHN0ZGRldikuCgpUaGUgdW5wYXRjaGVk
IHZlcnNpb24gd2FzIGNvbmZpZ3VyZWQgZGlmZmVyZW50bHkgdGhhbiB0aGUgcGF0Y2hlZCBvbmUu
ClNvIHRoZSByZWFsIG51bWJlcnMgYXJlOgoKICAgICAgICAgICAgICAgICAgICAgICBlbGFwc2Vk
ICAgICAgICAgc3lzdGVtICAgICAgICAgIHVzZXIKdW5wYXRjaGVkLCB4cHRpPWZhbHNlOiAgODku
OTYgKCA4LjA3KSAgIDk3LjA1ICggNS42OSkgIDE3OC42NCAoIDIuMzkpCnVucGF0Y2hlZCwgeHB0
aT10cnVlIDogMTEzLjQyICggOS44MCkgIDE2NS45OSAoMTUuMTApICAxODAuOTkgKCAyLjY2KQpw
YXRjaGVkLCAgIHhwdGk9ZmFsc2U6ICA5MC42NSAoIDYuNjMpICAgOTkuNTAgKDE0Ljc5KSAgMTgw
LjM1ICggNS45NykKcGF0Y2hlZCwgICB4cHRpPXRydWUgOiAxMTEuNjkgKCA5LjkzKSAgMTYzLjYz
ICgxMy4wNSkgIDE4MS4yMiAoIDMuNzEpCgpTbyB0aGUgWFBUSSBjYXNlIGlzIGEgbGl0dGxlIGJp
dCBmYXN0ZXIgd2l0aCB0aGUgcGF0Y2gsIHdoaWxlIHRoZQpub24tWFBUSSBjYXNlIGlzIGEgbGl0
dGxlIGJpdCBzbG93ZXIuCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
