From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] add cpu_thread_id to struct cpuinfo_x86
Date: Mon, 3 Sep 2018 17:11:08 +0200
Message-ID: <0aa0e5e9-c2e2-aabd-b5c1-daf0741de8e0@suse.com>
References: =?UTF-8?B?PDIwMTgwODMxMTYyMjE1LjIzMzE477+977+977+977+9Me+/vQ==?=
 =?UTF-8?B?77+977+977+9amdyb3NzQHN1c2UuY29tPiA8MjAxODA4MzExNjIyMTUuMjMzMTg=?=
 =?UTF-8?B?77+977+977+977+9Mu+/ve+/ve+/ve+/vWpncm9zc0BzdXNlLmNvbT4gPDVCOEQz?=
 =?UTF-8?Q?B2702000078001E4A27@suse.com>_<412351d9=ef=bf=bdd3c6=ef=bf=bd81c6?=
 =?UTF-8?Q?=ef=bf=bde754=ef=bf=bd83180345aea7@suse.com>_<5B8D499202000078001?=
 =?UTF-8?Q?E4AE3@suse.com>_<a43cb3dc-e3a2-8ac5-a429-2b9be4fd324f@suse.com>_<?=
 =?UTF-8?Q?5B8D4E2202000078001E4B4D@suse.com>?=
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9gce=lr=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fwqVU-0002Uk-H0
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 15:11:12 +0000
In-Reply-To: <?= =?UTF-8?Q?5B8D4E2202000078001E4B4D@suse.com>
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

T24gMDMvMDkvMTggMTc6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAzLjA5LjE4IGF0
IDE2OjUyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMDMvMDkvMTggMTY6NDcsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDMuMDkuMTggYXQgMTU6NTMsIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+IE9uIDAzLzA5LzE4IDE1OjQ2LCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+Pj4+Pj4gT24gMzEuMDguMTggYXQgMTg6MjIsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+
Pj4+Pj4gQWRkIHRoZSB0aHJlYWQtaWQgdG8gdGhlIGNwdSBjb25maWcgZGF0YSBhbmQgYW4gYWNj
ZXNzb3IgbWFjcm8KPj4+Pj4+IGNwdV90b190aHJlYWQoKS4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+
ICB4ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jICAgICAgIHwgIDEgKwo+Pj4+Pj4gIHhlbi9hcmNo
L3g4Ni9zbXBib290LmMgICAgICAgICAgfCAxMCArKysrKysrKysrCj4+Pj4+PiAgeGVuL2luY2x1
ZGUvYXNtLWFybS9wcm9jZXNzb3IuaCB8ICAxICsKPj4+Pj4+ICB4ZW4vaW5jbHVkZS9hc20teDg2
L3Byb2Nlc3Nvci5oIHwgIDIgKysKPj4+Pj4+ICB4ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgg
ICAgIHwgIDEgKwo+Pj4+Pj4gIDUgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQo+Pj4+
Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jIGIveGVuL2Fy
Y2gveDg2L2NwdS9jb21tb24uYwo+Pj4+Pj4gaW5kZXggMDU3ODU5YWIxNC4uZjYyNmE2YTUxMCAx
MDA2NDQKPj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMKPj4+Pj4+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMKPj4+Pj4+IEBAIC00MzQsNiArNDM0LDcgQEAgdm9p
ZCBpZGVudGlmeV9jcHUoc3RydWN0IGNwdWluZm9feDg2ICpjKQo+Pj4+Pj4gIAljLT5waHlzX3By
b2NfaWQgPSBYRU5fSU5WQUxJRF9TT0NLRVRfSUQ7Cj4+Pj4+PiAgCWMtPmNwdV9jb3JlX2lkID0g
WEVOX0lOVkFMSURfQ09SRV9JRDsKPj4+Pj4+ICAJYy0+Y29tcHV0ZV91bml0X2lkID0gSU5WQUxJ
RF9DVUlEOwo+Pj4+Pj4gKwljLT5jcHVfdGhyZWFkX2lkID0gWEVOX0lOVkFMSURfVEhSRUFEX0lE
Owo+Pj4+Pj4gIAltZW1zZXQoJmMtPng4Nl9jYXBhYmlsaXR5LCAwLCBzaXplb2YgYy0+eDg2X2Nh
cGFiaWxpdHkpOwo+Pj4+Pj4gIAo+Pj4+Pj4gIAlnZW5lcmljX2lkZW50aWZ5KGMpOwo+Pj4+Pj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMgYi94ZW4vYXJjaC94ODYvc21wYm9v
dC5jCj4+Pj4+PiBpbmRleCA3ZTc2Y2MzZDY4Li4yYzZhNDBjNTQzIDEwMDY0NAo+Pj4+Pj4gLS0t
IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+Pj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L3NtcGJv
b3QuYwo+Pj4+Pj4gQEAgLTI0Nyw2ICsyNDcsOCBAQCBzdGF0aWMgdm9pZCBzZXRfY3B1X3NpYmxp
bmdfbWFwKHVuc2lnbmVkIGludCBjcHUpCj4+Pj4+PiAgICAgIGNwdW1hc2tfc2V0X2NwdShjcHUs
IHBlcl9jcHUoY3B1X2NvcmVfbWFzaywgY3B1KSk7Cj4+Pj4+PiAgICAgIGNwdW1hc2tfc2V0X2Nw
dShjcHUsIHBlcl9jcHUoY3B1X3NpYmxpbmdfbWFzaywgY3B1KSk7Cj4+Pj4+PiAgCj4+Pj4+PiAr
ICAgIGNbY3B1XS5jcHVfdGhyZWFkX2lkID0gMDsKPj4+Pj4+ICsKPj4+Pj4+ICAgICAgaWYgKCBj
W2NwdV0ueDg2X251bV9zaWJsaW5ncyA+IDEgKQo+Pj4+Pj4gICAgICB7Cj4+Pj4+PiAgICAgICAg
ICBmb3JfZWFjaF9jcHUgKCBpLCAmY3B1X3NpYmxpbmdfc2V0dXBfbWFwICkKPj4+Pj4+IEBAIC0y
NzAsNiArMjcyLDE0IEBAIHN0YXRpYyB2b2lkIHNldF9jcHVfc2libGluZ19tYXAodW5zaWduZWQg
aW50IGNwdSkKPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICJDUFUldTogdW5jbGVhciBy
ZWxhdGlvbnNoaXAgd2l0aCBDUFUldVxuIiwKPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAg
IGNwdSwgaSk7Cj4+Pj4+PiAgICAgICAgICB9Cj4+Pj4+PiArCj4+Pj4+PiArICAgICAgICBmb3Jf
ZWFjaF9jcHUgKCBpLCBwZXJfY3B1KGNwdV9zaWJsaW5nX21hc2ssIGNwdSkgKQo+Pj4+Pj4gKyAg
ICAgICAgewo+Pj4+Pj4gKyAgICAgICAgICAgIGlmICggY3B1ID09IGkgKQo+Pj4+Pj4gKyAgICAg
ICAgICAgICAgICBicmVhazsKPj4+Pj4+ICsgICAgICAgICAgICBjW2NwdV0uY3B1X3RocmVhZF9p
ZCsrOwo+Pj4+Pgo+Pj4+PiBOby4gVGhpcyB3YW50cyBkb2luZyBhbG9uZ3NpZGUgc2V0dGluZyBv
ZiB0aGUgb3RoZXIgc2ltaWxhciBmaWVsZHMsCj4+Pj4+IGkuZS4gaW4gKGF0IGxlYXN0KSBkZXRl
Y3RfZXh0ZW5kZWRfdG9wb2xvZ3koKSBhbmQgZGV0ZWN0X2h0KCkuIEl0Cj4+Pj4+IGlzIHRoZSBo
YXJkd2FyZSB3aGljaCB0ZWxscyB1cyB3aGF0IHRoZSB0aHJlYWQgSUQgaXMuCj4+Pj4KPj4+PiBJ
IHdhc24ndCBhYmxlIHRvIGZpbmQgdGhlIHJlbGF0ZWQgaW5mb3JtYXRpb24gZm9yIEFNRCBjcHVz
LiBJbiBjYXNlIGl0Cj4+Pj4gaXMgaW4gdGhlIHNwZWNzIGl0IGlzIGhpZGRlbiB2ZXJ5IHdlbGwu
Cj4+Pgo+Pj4gV2hhdCB3YXMgdXNlZCBmb3IgY29tcHV0ZSB1bml0cyBpbiBGYW0xNiBhbmQgZWFy
bGllciBpcyB1c2VkIGZvcgo+Pj4gaHlwZXJ0aHJlYWRzIGluIEZhbTE3IChhbmQgZ29pbmcgZm9y
d2FyZCwgZnJvbSB3aGF0IGlpcmMgQnJpYW4KPj4+IGhhcyBzYWlkKS4KPj4KPj4gQW5kIHdoYXQg
YWJvdXQgaHlwZXJ0aHJlYWRzIGluIEZhbTE2IGFuZCBlYXJsaWVyPyBPciBhcmUgImNvbXB1dGUg
dW5pdHMiCj4+IGp1c3QgYW5vdGhlciBuYW1lIGZvciB0aGUgdGhyZWFkcyBhbmQgSSBjYW4gcmVu
YW1lIHRoYXQgZmllbGQ/Cj4gCj4gV2hlbiB0aGVyZSBhcmUgY29tcHV0ZSB1bml0cywgdGhlcmUg
YXJlIG5vIHRocmVhZHMuIEJ1dCB0aGUgZGlmZmVyZW5jZQo+IGlzIG1vcmUgdGhhbiBqdXN0IHRo
ZSBuYW1lcywgc28gZm9sZGluZyB0aGUgZmllbGRzIGlzIG5vdCBhIGdvb2QgaWRlYSBpbW8uCgpT
byBhbm90aGVyIGZsYWcgYW5kIGRpc3BsYXkgdGhlIGNvbHVtbiB0aXRsZSBhY2NvcmRpbmdseT8K
CkknZCBwdXQgdGhyZWFkIGFuZCBjb21wdXRlIHVuaXQgaW4gYSB1bmlvbiB0aGVuLgoKCkp1ZXJn
ZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
