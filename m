From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Mon, 26 Nov 2018 15:20:15 +0100
Message-ID: <20181126152015.7464c786__37612.884413875$1543241955$gmane$org@naga>
References: <20180928150357.12942-1-david@redhat.com>
 <b01a956b-080c-c643-6473-eb132b9f7200@redhat.com>
 <20181123190653.6da91461@kitsune.suse.cz>
 <fad04d80-4e72-1bd8-3e67-a3f7dd0bc2fa@redhat.com>
 <b64a0e1e-6aaa-66a9-2fb7-12daa6383ce1@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=fjgp=of=suse.de=msuchanek@srs-us1.protection.inumbo.net>)
 id 1gRHkQ-0004es-Mw
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 14:20:26 +0000
In-Reply-To: <b64a0e1e-6aaa-66a9-2fb7-12daa6383ce1@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Michal Hocko <mhocko@suse.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Rashmica Gupta <rashmica.g@gmail.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Rob Herring <robh@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>, linux-s390@vge
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyNiBOb3YgMjAxOCAxNDozMzoyOSArMDEwMApEYXZpZCBIaWxkZW5icmFuZCA8ZGF2
aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cgo+IE9uIDI2LjExLjE4IDEzOjMwLCBEYXZpZCBIaWxkZW5i
cmFuZCB3cm90ZToKPiA+IE9uIDIzLjExLjE4IDE5OjA2LCBNaWNoYWwgU3VjaMOhbmVrIHdyb3Rl
OiAgCgo+ID4+Cj4gPj4gSWYgd2UgYXJlIGdvaW5nIHRvIGZha2UgdGhlIGRyaXZlciBpbmZvcm1h
dGlvbiB3ZSBtYXkgYXMgd2VsbCBhZGQgdGhlCj4gPj4gdHlwZSBhdHRyaWJ1dGUgYW5kIGJlIGRv
bmUgd2l0aCBpdC4KPiA+Pgo+ID4+IEkgdGhpbmsgdGhlIHByb2JsZW0gd2l0aCB0aGUgcGF0Y2gg
d2FzIG1vcmUgd2l0aCB0aGUgc2VtYW50aWMgdGhhbiB0aGUKPiA+PiBhdHRyaWJ1dGUgaXRzZWxm
Lgo+ID4+Cj4gPj4gV2hhdCBpcyBub3JtYWwsIHBhcmF2aXJ0dWFsaXplZCwgYW5kIHN0YW5kYnkg
bWVtb3J5Pwo+ID4+Cj4gPj4gSSBjYW4gdW5kZXJzdGFuZCBESU1NIGRldmljZSwgYmFsb29uIGRl
dmljZSwgb3Igd2hhdGV2ZXIgbWVjaGFuaXNtIGZvcgo+ID4+IGFkZGluZyBtZW1vcnkgeW91IG1p
Z2h0IGhhdmUuCj4gPj4KPiA+PiBJIGNhbiB1bmRlcnN0YW5kICJtZW1vcnkgZGVzaWduYXRlZCBh
cyBzdGFuZGJ5IGJ5IHRoZSBjbHVzdGVyCj4gPj4gYWRtaW5pc3RyYXRvciIuCj4gPj4KPiA+PiBI
b3dldmVyLCBESU1NIHZzIGJhbG9vbiBpcyBvcnRob2dvbmFsIHRvIHN0YW5kYnkgYW5kIHNob3Vs
ZCBub3QgYmUKPiA+PiBjb25mbGF0ZWQgaW50byBvbmUgcHJvcGVydHkuCj4gPj4KPiA+PiBwYXJh
dmlydHVhbGl6ZWQgbWVhbnMgbm90aGluZyBhdCBhbGwgaW4gcmVsYXRpb25zaGlwIHRvIG1lbW9y
eSB0eXBlIGFuZAo+ID4+IHRoZSBkZXNpcmVkIG9ubGluZSBwb2xpY3kgdG8gbWUuICAKPiA+IAo+
ID4gUmlnaHQsIHNvIHdpdGggd2hhdGV2ZXIgd2UgY29tZSB1cCwgaXQgc2hvdWxkIGFsbG93IHRv
IG1ha2UgYSBkZWNpc2lvbgo+ID4gaW4gdXNlciBzcGFjZSBhYm91dAo+ID4gLSBpZiBtZW1vcnkg
aXMgdG8gYmUgb25saW5lZCBhdXRvbWF0aWNhbGx5ICAKPiAKPiBBbmQgSSB3aWxsIHRoaW5rIGFi
b3V0IGlmIHdlIHJlYWxseSBzaG91bGQgbW9kZWwgc3RhbmRieSBtZW1vcnkuIE1heWJlCj4gaXQg
aXMgcmVhbGx5IGJldHRlciB0byBoYXZlIGluIHVzZXIgc3BhY2Ugc29tZXRoaW5nIGxpa2UgKGFz
IERhbiBub3RlZCkKCklmIGl0IGlzIHBvc3NpYmxlIHRvIGRlc2lnbmF0ZSB0aGUgbWVtb3J5IGFz
IHN0YW5kYnkgb3Igb25saW5lIGluIHRoZQpzMzkwIGFkbWluIGludGVyZmFjZSBhbmQgdGhlIGtl
cm5lbCBkb2VzIGhhdmUgYWNjZXNzIHRvIHRoaXMKaW5mb3JtYXRpb24gaXQgbWFrZXMgc2Vuc2Ug
dG8gZm9yd2FyZCBpdCB0byB1c2Vyc3BhY2UgKGFzIHNlcGFyYXRlCnMzOTAtc3BlY2lmaWMgcHJv
cGVydHkpLiBJZiBub3QgdGhlbiB5b3UgbmVlZCB0byBtYWtlIHNvbWUga2luZCBvZgphc3N1bXB0
aW9uIGxpa2UgYmVsb3cgYW5kIHRoZSB1c2VyIGNhbiB0dW5lIHRoZSBzY3JpcHQgYWNjb3JkaW5n
IHRvCnRoZWlyIHVzZWNhc2UuCgo+IAo+IGlmIChpc1MzOTB4KCkgJiYgdHlwZSA9PSAiZGltbSIp
IHsKPiAJLyogZG9uJ3Qgb25saW5lLCBvbiBzMzkweCBzeXN0ZW0gRElNTXMgYXJlIHN0YW5kYnkg
bWVtb3J5ICovCj4gfQoKVGhhbmtzCgpNaWNoYWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
