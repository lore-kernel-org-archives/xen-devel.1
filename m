From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] xen: fill topology info for online cpus
 only
Date: Thu, 30 Aug 2018 10:46:07 +0200
Message-ID: <eab50c40-8180-5899-c30f-efeb8d6e33d4@suse.com>
References: =?UTF-8?Q?<20180829182302.9977=ef=bf=bd1=ef=bf=bdjgross@suse.com?=
 =?UTF-8?Q?>_<20180829182302.9977=ef=bf=bd3=ef=bf=bdjgross@suse.com>_<5B87A7?=
 =?UTF-8?Q?E502000078001E364A@suse.com>_<0d12f446-a6ba-add0-bded-6b90ee64fb5?=
 =?UTF-8?Q?a@suse.com>_<5B87AE1E02000078001E36DB@suse.com>?=
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=aext=ln=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fvIag-0002ke-0v
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 08:46:10 +0000
In-Reply-To: <5B87AE1E02000078001E36DB@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDgvMTggMTA6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDMwLjA4LjE4IGF0
IDEwOjMxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMzAvMDgvMTggMTA6MTYsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjkuMDguMTggYXQgMjA6MjMsIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+IFRoZSB0b3BvbG9neSBpbmZvcm1hdGlvbiBvYnRhaW5hYmxlIHZp
YSBYRU5fU1lTQ1RMX2NwdXRvcG9pbmZvIGlzCj4+Pj4gZmlsbGVkIHJhdGhlciB3ZWlyZDogdGhl
IHNpemUgb2YgdGhlIGFycmF5IGlzIGRlcml2ZWQgZnJvbSB0aGUgaGlnaGVzdAo+Pj4+IG9ubGlu
ZSBjcHUgbnVtYmVyLCB3aGlsZSB0aGUgZGF0YSBpcyBzZXQgdG8gImludmFsaWQiIGZvciBub3Qg
cHJlc2VudAo+Pj4+IGNwdXMgb25seS4KPj4+Pgo+Pj4+IFdpdGggc210PTAgdGhlIGluZm9ybWF0
aW9uIGZvciBwYXJrZWQgdGhyZWFkcyBpcyBhbGwgemVybywgc28gaXQgc2hvdWxkCj4+Pj4gYmUg
YmVzdCB0byByZXR1cm4gImludmFsaWQiIGluZm9ybWF0aW9uIGZvciBvZmZsaW5lIGNwdXMuCj4+
Pj4KPj4+PiBPbiBhIGR1YWwgY29yZSBzeXN0ZW0gd2l0aG91dCB0aGlzIHBhdGNoIHhsIGluZm8g
LW4gd2lsbCBwcmludDoKPj4+Pgo+Pj4+IGNwdV90b3BvbG9neSAgICAgICAgICAgOgo+Pj4+IGNw
dTogICAgY29yZSAgICBzb2NrZXQgICAgIG5vZGUKPj4+PiAgIDA6ICAgICAgIDAgICAgICAgIDAg
ICAgICAgIDAKPj4+PiAgIDE6ICAgICAgIDAgICAgICAgIDAgICAgICAgIDAKPj4+PiAgIDI6ICAg
ICAgIDEgICAgICAgIDAgICAgICAgIDAKPj4+Cj4+PiBCdXQgdGhlcmUncyBub3RoaW5nIHdyb25n
IGhlcmUuIFRoZSBpbnRlcmVzdGluZyBwYXJ0IGlzIHdoYXQgd291bGQgYmUKPj4+IHByaW50ZWQg
Zm9yIENQVSAzIChwZXJoYXBzIG9uIGEgbW9yZSB0aGFuIHR3byBjb3JlcyBzeXN0ZW0pLiBBZnRl
cgo+Pj4gYWxsIHRvcG9sb2d5IGlzIHZhbGlkIGlycmVzcGVjdGl2ZSBvZiB3aGV0aGVyIGEgQ1BV
IGlzIG9ubGluZSAtIGl0IGFsbAo+Pj4gZGVwZW5kcyBvbiB3aGV0aGVyIHRoZSBoeXBlcnZpc29y
IHN0aWxsIGhhcyB0aGUgaW5mb3JtYXRpb24gYXZhaWxhYmxlLgo+Pj4gSXQgaXMgZm9yIGEgcmVh
c29uIHRoYXQgY3B1X3NtcGJvb3RfZnJlZSgpIGludmFsaWRhdGVzIGNlcnRhaW4gZmllbGRzCj4+
PiBvbmx5IHVwb24gQ1BVIHJlbW92YWw6Cj4+Pgo+Pj4gICAgIGlmICggcmVtb3ZlICkKPj4+ICAg
ICB7Cj4+PiAgICAgICAgIGNbY3B1XS5waHlzX3Byb2NfaWQgPSBYRU5fSU5WQUxJRF9TT0NLRVRf
SUQ7Cj4+PiAgICAgICAgIGNbY3B1XS5jcHVfY29yZV9pZCA9IFhFTl9JTlZBTElEX0NPUkVfSUQ7
Cj4+PiAgICAgICAgIGNbY3B1XS5jb21wdXRlX3VuaXRfaWQgPSBJTlZBTElEX0NVSUQ7Cj4+Pgo+
Pj4gT24gYSA2LWNvcmUgc3lzdGVtIEkgc2VlCj4+Pgo+Pj4gY3B1OiAgICBjb3JlICAgIHNvY2tl
dCAgICAgbm9kZQo+Pj4gICAwOiAgICAgICAwICAgICAgICAwICAgICAgICAwCj4+PiAgIDE6ICAg
ICAgIDAgICAgICAgIDAgICAgICAgIDAKPj4+ICAgMjogICAgICAgMSAgICAgICAgMCAgICAgICAg
MAo+Pj4gICAzOiAgICAgICAxICAgICAgICAwICAgICAgICAwCj4+PiAgIDQ6ICAgICAgIDIgICAg
ICAgIDAgICAgICAgIDAKPj4+ICAgNTogICAgICAgMiAgICAgICAgMCAgICAgICAgMAo+Pj4gICA2
OiAgICAgICA4ICAgICAgICAwICAgICAgICAwCj4+PiAgIDc6ICAgICAgIDggICAgICAgIDAgICAg
ICAgIDAKPj4+ICAgODogICAgICAgOSAgICAgICAgMCAgICAgICAgMAo+Pj4gICA5OiAgICAgICA5
ICAgICAgICAwICAgICAgICAwCj4+PiAgMTA6ICAgICAgMTAgICAgICAgIDAgICAgICAgIDAKPj4+
Cj4+PiB3aGljaCBsb29rcyBmaW5lIHRvIG1lLCBhcGFydCBmcm9tIHRoZSBtaXNzaW5nIGluZm8g
b24gQ1BVIDExLgo+Pgo+PiBJIGNhbiBjaGFuZ2UgdGhlIHBhdGNoIHRvIHByaW50IHRoZSBpbmZv
cm1hdGlvbiBmb3IgdGhlIG9mZmxpbmUgY3B1cwo+PiAoaW5jbHVkaW5nIHRoZSBub3cgbWlzc2lu
ZyBvbmVzKSwgdG9vLgo+Pgo+PiBXaGF0IGlzIHRoZSBwcmVmZXJyZWQgc29sdXRpb24/Cj4gCj4g
V2VsbCwgYnkgaW1wbGljYXRpb24gZnJvbSBteSBlYXJsaWVyIHJlcGx5IEkgdGhpbmsgYWRkaW5n
IHRoZSBtaXNzaW5nCj4gQ1BVJ3MgaW5mbyB3b3VsZCBiZSBiZXR0ZXIuIExldCdzIHNlZSB3aGF0
IG90aGVycyB0aGluay4KCk9rYXkuCgpJJ2xsIGRvIHRoYXQgYW5kIGFkZCBhbm90aGVyIHBhdGNo
IGFkZGluZyAiKG9mZmxpbmUpIiB0byB0aGUgb3V0cHV0IGluCmNhc2UgYSBjcHUgaXMgb2ZmbGlu
ZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
