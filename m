From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 1/8] x86: NOP out XPTI entry/exit code
 when it's not in use
Date: Mon, 9 Apr 2018 10:34:16 +0200
Message-ID: <b26b4667-b4e4-5c28-2051-8de3367bdeac@suse.com>
References: <5AAFC9E202000078001B36F7@prv-mh.provo.novell.com>
 <5AAFCB4202000078001B3707@suse.com>
 <c4ae0f15-8320-17ca-1ead-db709fafc8e4@suse.com>
 <48ea57ad-537c-9196-bf49-17a6708a7a45@suse.com>
 <5ACB403502000078001B967C@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rfzc=g6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f5SFp-0000QC-83
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 08:34:21 +0000
In-Reply-To: <5ACB403502000078001B967C@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDQvMTggMTA6MjgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA0LjA0LjE4IGF0
IDA4OjA3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMDMvMDQvMTggMTk6NDgsIEp1
ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+PiBPbiAxOS8wMy8xOCAxNDozNywgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gSW50cm9kdWNlIGEgc3ludGhldGljIGZlYXR1cmUgZmxhZyB0byB1c2UgYWx0ZXJu
YXRpdmUgaW5zdHJ1Y3Rpb24KPj4+PiBwYXRjaGluZyB0byBOT1Agb3V0IGFsbCBjb2RlIG9uIGVu
dHJ5L2V4aXQgcGF0aHMuIEhhdmluZyBOT1BzIGhlcmUgaXMKPj4+PiBnZW5lcmFsbHkgYmV0dGVy
IHRoYW4gdXNpbmcgY29uZGl0aW9uYWwgYnJhbmNoZXMuCj4+Pj4KPj4+PiBBbHNvIGNoYW5nZSB0
aGUgbGltaXQgb24gdGhlIG51bWJlciBvZiBieXRlcyB3ZSBjYW4gcGF0Y2ggaW4gb25lIGdvIHRv
Cj4+Pj4gdGhhdCByZXN1bHRpbmcgZnJvbSB0aGUgZW5jb2RpbmcgaW4gc3RydWN0IGFsdF9pbnN0
ciAtIHRoZXJlJ3Mgbm8gcG9pbnQKPj4+PiByZWR1Y2luZyBpdCBiZWxvdyB0aGF0IGxpbWl0LCBh
bmQgd2l0aG91dCBhIGNoZWNrIGJlaW5nIGluIHBsYWNlIHRoYXQKPj4+PiB0aGUgbGltaXQgaXNu
J3QgYWN0dWFsbHkgZXhjZWVkZWQsIHN1Y2ggYW4gYXJ0aWZpY2lhbCBib3VuZGFyeSBpcyBhCj4+
Pj4gbGF0ZW50IHJpc2suCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4+Pgo+Pj4gSnVzdCBkaWQgYSBwYXJhbGxlbCBtYWtlIG9mIHRoZSBo
eXBlcnZpc29yIHdpdGggYW5kIHdpdGhvdXQgdGhlIHBhdGNoLAo+Pj4gd2l0aCB4cHRpPXRydWUg
YW5kIHdpdGggeHB0aT1mYWxzZSAodmFsdWVzIGluIGJyYWNlcyBhcmUgc3RkZGV2KS4KPj4KPj4g
VGhlIHVucGF0Y2hlZCB2ZXJzaW9uIHdhcyBjb25maWd1cmVkIGRpZmZlcmVudGx5IHRoYW4gdGhl
IHBhdGNoZWQgb25lLgo+PiBTbyB0aGUgcmVhbCBudW1iZXJzIGFyZToKPj4KPj4gICAgICAgICAg
ICAgICAgICAgICAgICBlbGFwc2VkICAgICAgICAgc3lzdGVtICAgICAgICAgIHVzZXIKPj4gdW5w
YXRjaGVkLCB4cHRpPWZhbHNlOiAgODkuOTYgKCA4LjA3KSAgIDk3LjA1ICggNS42OSkgIDE3OC42
NCAoIDIuMzkpCj4+IHVucGF0Y2hlZCwgeHB0aT10cnVlIDogMTEzLjQyICggOS44MCkgIDE2NS45
OSAoMTUuMTApICAxODAuOTkgKCAyLjY2KQo+PiBwYXRjaGVkLCAgIHhwdGk9ZmFsc2U6ICA5MC42
NSAoIDYuNjMpICAgOTkuNTAgKDE0Ljc5KSAgMTgwLjM1ICggNS45NykKPj4gcGF0Y2hlZCwgICB4
cHRpPXRydWUgOiAxMTEuNjkgKCA5LjkzKSAgMTYzLjYzICgxMy4wNSkgIDE4MS4yMiAoIDMuNzEp
Cj4+Cj4+IFNvIHRoZSBYUFRJIGNhc2UgaXMgYSBsaXR0bGUgYml0IGZhc3RlciB3aXRoIHRoZSBw
YXRjaCwgd2hpbGUgdGhlCj4+IG5vbi1YUFRJIGNhc2UgaXMgYSBsaXR0bGUgYml0IHNsb3dlci4K
PiAKPiBUaGF0J3MgcmF0aGVyIGNvdW50ZXJpbnR1aXRpdmUgYSByZXN1bHQuCgpPVE9IIHRoZSBz
dGFuZGFyZCBkZXZpYXRpb24gaXMgbm90IHJlYWxseSBzbWFsbCwgc28gaXQgbWlnaHQgYmUgdGhl
CnBlcmZvcm1hbmNlIGRpZmZlcmVuY2UgaXMganVzdCBiZWxvdyBub2lzZSBsZXZlbC4KCgpKdWVy
Z2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
