From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 08/14] x86emul: add read-modify-write hook
Date: Thu, 15 Mar 2018 08:46:56 -0600
Message-ID: <5AAA957002000078001B23CB@prv-mh.provo.novell.com>
References: <5AAA7BAF02000078001B2242@prv-mh.provo.novell.com>
 <5AAA7E7102000078001B228B@prv-mh.provo.novell.com>
 <485afda7-5918-2bfc-2bf4-c07b06d194de@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ovtz=gf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewU9r-0006NP-2y
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 14:47:07 +0000
In-Reply-To: <485afda7-5918-2bfc-2bf4-c07b06d194de@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDE1OjE5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMTggMTM6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBAQCAtODUxNyw2
ICs4NjkwLDE0MiBAQCB4ODZfZW11bGF0ZSgKPj4gICN1bmRlZiB2ZXgKPj4gICN1bmRlZiBlYQo+
PiAgCj4+ICtpbnQgeDg2X2VtdWxfcm13KAo+PiArICAgIHZvaWQgKnB0ciwKPj4gKyAgICB1bnNp
Z25lZCBpbnQgYnl0ZXMsCj4+ICsgICAgdWludDMyX3QgKmVmbGFncywKPj4gKyAgICBzdHJ1Y3Qg
eDg2X2VtdWxhdGVfc3RhdGUgKnN0YXRlLAo+PiArICAgIHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0
ICpjdHh0KQo+PiArewo+PiArICAgIHVuc2lnbmVkIGxvbmcgKmRzdCA9IHB0cjsKPj4gKwo+PiAr
ICAgIEFTU0VSVChieXRlcyA9PSBzdGF0ZS0+b3BfYnl0ZXMpOwo+PiArCj4+ICsjaWZkZWYgX194
ODZfNjRfXwo+PiArIyBkZWZpbmUgSkNYWiAianJjeHoiCj4+ICsjZWxzZQo+PiArIyBkZWZpbmUg
SkNYWiAiamVjeHoiCj4+ICsjZW5kaWYKPj4gKwo+PiArI2RlZmluZSBDT05EX0xPQ0sob3ApIFwK
Pj4gKyAgICBKQ1haICIgLkwiICNvcCAiJT1cblx0IiBcCj4+ICsgICAgImxvY2tcbiIgXAo+PiAr
ICAgICIuTCIgI29wICIlPTpcblx0IiBcCj4+ICsgICAgI29wCj4gCj4gSSdkIGZvcmdvdHRlbiB0
aGF0IHRoZXNlIGVuY29kaW5nIG9mIGptcCBleGlzdGVkLCBidXQgdmFyaW91cyBPUk1zCj4gc3Vn
Z2VzdCB0aGF0IGl0IGlzIGZhciBzbG93ZXIgdG8gZXhlY3V0ZSB0aGFuIG90aGVyIGp1bXBzLgo+
IAo+IElycmVzcGVjdGl2ZSBvZiB0aGUgaW5zdHJ1Y3Rpb24gbGF0ZW5jeSBhcmd1bWVudCwgeW91
J2xsIGdldCBiZXR0ZXIgY29kZQo+IGdlbmVyYXRpb24gd2l0aCBjb25kX29wKCkgbG9va2luZyBy
YXRoZXIgbW9yZSBsaWtlOgo+IAo+IGNtcGIgJDAsICVbbG9ja10KPiBqZSAxZgo+IGxvY2sKPiAx
OiAjb3AKPiAKPiB3aGljaCB3aWxsIG1vc3QgbGlrZWx5IGNhdXNlIHRoZSBjbXAgdG8gYmUgZW5j
b2RlZCB3aXRoIGEgbWVtb3J5Cj4gb3BlcmFuZCwgcmF0aGVyIHRoYW4gZm9yY2luZyBpdCB0aGUg
dmFsdWUgaW50byAlZWN4LgoKWW91J3JlIG1pc3NpbmcgdGhlIG1haW4gcG9pbnQgb2YgaGF2aW5n
IGNob3NlbiBKe0UsUn1DWFogKGFyZ3VhYmx5Ckkgc2hvdWxkIGhhdmUgYWRkZWQgYSBjb21tZW50
LCBhbmQgSSBub3cgd2lsbCk6IFRoaXMgb3BlcmF0aW9uIHNpdHMKaW5zaWRlIHRoZSByYW5nZSB3
aGVyZSB3ZSBoYXZlIGxvYWRlZCBndWVzdCBFRkxBR1MgKHRoZSBzdGF0dXMKb25lcykgaW50byB0
aGUgaGFyZHdhcmUgRUZMQUdTIHJlZ2lzdGVyLiBGb3IgQURDLCBTQkIsIFJDTCwgYW5kClJDUiB0
byBmdW5jdGlvbiB3ZSBtdXN0IG5vdCBhbHRlciBDRiBoZXJlLCBhbmQgZm9yIGZsYWdzIG5vdApt
b2RpZmllZCBieSBhbiBpbnNuIChlLmcuIGV2ZXJ5dGhpbmcgb3RoZXIgdGhhbiBDRiBmb3IgQlQq
KSB3ZQptdXN0IG5vdCBhbHRlciBhbnkgb2YgdGhlIG90aGVyIHN0YXR1cyBmbGFncy4KCkphbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
