From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 5/6] x86/HVM: prefill cache with PDPTEs when
 possible
Date: Tue, 24 Jul 2018 09:27:15 +0200
Message-ID: <3849db3f-efe0-d0dd-e428-8f28d5a0e323@suse.com>
References: <5B506A6E02000078001D5D17@prv1-mh.provo.novell.com>
 <5B506CE302000078001D5D8A@prv1-mh.provo.novell.com>
 <2fa046b9-9d6f-caa0-d400-804f92332d2e@citrix.com>
 <5B507A6102000078001D5DDD@prv1-mh.provo.novell.com>
 <65e2cc63-e956-86ca-2c46-55dd0157ae9e@citrix.com>
 <5B50DA850200007800137618@prv1-mh.provo.novell.com>
 <95a0aace-ae9b-6595-978c-05a1de712f6c@citrix.com>
 <5B50DFE70200007800137635@prv1-mh.provo.novell.com>
 <4ba21c83-e1e5-fa2b-01e0-04f2b92b79aa@citrix.com>
 <5B56CF6402000078001D6F89@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kipv=ki=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fhrj5-0007hH-PL
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 07:27:19 +0000
In-Reply-To: <5B56CF6402000078001D6F89@prv1-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDcvMTggMDk6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE5LjA3LjE4IGF0
IDIxOjA3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9oIC0gSSdkIG5v
dCBsb29rZWQgaW4gdGhhdCBtdWNoIGRldGFpbCBhdCB5b3VyIGFsZ29yaXRobS4gIEFzIGEgZmly
c3QKPj4gZ3V0IGZlZWwsIHRhZ2dpbmcgYnkgbGV2ZWwgZG9lc24ndCBzb3VuZCBhcyBpZiBpdCB3
aWxsIGludGVyYWN0Cj4+IGNvcnJlY3RseSB3aXRoIGxpbmVhciBwYWdldGFibGVzLgo+Pgo+PiBC
b3RoIHRoZSBJbnRlbCBhbmQgQU1EIE9STSdzIG1haW50YWluIHBhZ2luZyBzdHJ1Y3R1cmUgY2Fj
aGVzIHNvIEknZAo+PiBleHBlY3QgdGhhdCBhIGxpbmVhciBwYWdldGFibGUgZW50cnkgd291bGQg
YmUgc2VydmVkIGZyb20gdGhhdCBjYWNoZQo+PiByYXRoZXIgdGhhbiBiZWluZyByZWFkIHR3aWNl
IGZyb20gUkFNLgo+IAo+IElzIHRoZXJlIGFueXdoZXJlIGVub3VnaCBkZXRhaWwgYWJvdXQgdGhl
IGFjdHVhbCBpbXBsZW1lbnRhdGlvbiBvZgo+IHRoZSBwYWdpbmcgc3RydWN0dXJlIGNhY2hlcz8g
SSBjb3VsZCBpbWFnaW5lIHRoZW0gYmVpbmcgcGVyIGxldmVsLiBJdAo+IHdvdWxkbid0IGJlIHZl
cnkgZGlmZmljdWx0IHRvIHN3aXRjaCB0byBhIHRyaXN0YXRlIGhlcmUgKG5vcm1hbCBkYXRhLAo+
IHBhZ2UgdGFibGUsIGFuZCBQQUUgTDMpLgo+IAoKRnJvbSBodHRwczovL3d3dy5jcy5yaWNlLmVk
dS9DUy9BcmNoaXRlY3R1cmUvZG9jcy9iYXJyLWlzY2ExMC5wZGYgOgoKVGhlcmVmb3JlLCBib3Ro
IEFNRCBhbmQgSW50ZWwgaGF2ZSBpbXBsZW1lbnRlZCBNTVUKY2FjaGVzIGZvciBwYWdlIHRhYmxl
IGVudHJpZXMgZnJvbSB0aGUgaGlnaGVyIGxldmVscyBvZiB0aGUgdHJlZSBbMywKOV0uIEhvd2V2
ZXIsIHRoZWlyIGNhY2hlcyBoYXZlIHF1aXRlIGRpZmZlcmVudCBzdHJ1Y3R1cmUuIEZvciBleGFt
LQpwbGUsIEFNROKAmXMgUGFnZSBXYWxrIENhY2hlIHN0b3JlcyBwYWdlIHRhYmxlIGVudHJpZXMg
ZnJvbSBhbnkKbGV2ZWwgb2YgdGhlIHRyZWUsIHdoZXJlYXMgSW50ZWwgaW1wbGVtZW50cyBkaXN0
aW5jdCBjYWNoZXMgZm9yIGVhY2gKbGV2ZWwgIG9mICB0aGUgIHRyZWUuICAgQWxzbywgIEFNROKA
mXMgIFBhZ2UgIFdhbGsgIENhY2hlICBpcyAgaW5kZXhlZCAgYnkKdGhlIHBoeXNpY2FsIGFkZHJl
c3Mgb2YgdGhlIGNhY2hlZCBwYWdlIHRhYmxlIGVudHJ5LCB3aGVyZWFzIEludGVs4oCZcwpQYWdp
bmctU3RydWN0dXJlIENhY2hlcyBhcmUgaW5kZXhlZCBieSBwb3J0aW9ucyBvZiB0aGUgdmlydHVh
bCBhZC0KZHJlc3MgYmVpbmcgdHJhbnNsYXRlZAoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
