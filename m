From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH V5] x86/hvm: fix domain crash when CR3 has
 the noflush bit set
Date: Sat, 24 Feb 2018 02:35:09 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191018484@SHSMSX101.ccr.corp.intel.com>
References: <1518776535-2951-1-git-send-email-rcojocaru@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1910152F1@SHSMSX101.ccr.corp.intel.com>
 <eb8c1245-824b-0468-432c-a6fa999be1db@bitdefender.com>
 <3e9f4e37-8e3c-ba03-f5f9-b8179a3f0b1a@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <3e9f4e37-8e3c-ba03-f5f9-b8179a3f0b1a@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "tim@xen.org" <tim@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBSYXp2YW4gQ29qb2NhcnUgW21haWx0bzpyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29t
XQ0KPiBTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDIzLCAyMDE4IDM6MzIgUE0NCj4gDQo+IE9uIDAy
LzIzLzIwMTggMDk6MjkgQU0sIFJhenZhbiBDb2pvY2FydSB3cm90ZToNCj4gPiBMYWNraW5nIFBD
SUQgc3VwcG9ydCBpbiB0aGUgZW11bGF0aW9uIGxheWVyIGNyZWF0ZXMgdHdvIGRpZmZlcmVudCB3
YXkgb2YNCj4gPiBoYW5kbGluZyB0aGUgTk9GTFVTSCBiZWluZyBzZXQ6IG9uZSBpcyBpbiBoYXJk
d2FyZSwgYW5kIHRoaXMgaGFwcGVucyBmb3INCj4gPiBldmVyeXRoaW5nIGV4Y2VwdCB0aGUgaW50
cm9zcGVjdGlvbiBjYXNlLCBhbmQgb25lIGluIHRoZSBlbXVsYXRpb24gbGF5ZXINCj4gPiAodGhp
cyBoYXBwZW5zIHdoZW4gYW4gaW50cm9zcGVjdGlvbiBhZ2VudCBhc2tzIFhlbiB0byBlbXVsYXRl
IGFuDQo+ID4gaW5zdHJ1Y3Rpb24gd2hlbiBpdCByZXBsaWVzIHRvIGFuIEVQVCBmYXVsdCB2bV9l
dmVudCkuDQo+IA0KPiBTb3JyeSwgbm90IHdoZW4gdGhlIGludHJvc3BlY3Rpb24gYWdlbnQgYXNr
cyBYZW4gdG8gZW11bGF0ZSBhbg0KPiBpbnN0cnVjdGlvbiB3aGVuIGl0IHJlcGxpZXMgdG8gYW4g
RVBUIGZhdWx0IHZtX2V2ZW50LCBidXQgd2hlbiB0aGUNCj4gaW50cm9zcGVjdGlvbiBhZ2VudCB3
YW50cyB0byBiZSBhYmxlIHRvIHZldG8gYSBDUjMgd3JpdGUgLSBpLmUuIHdoZW4gdGhlDQo+IGlu
dHJvc3BlY3Rpb24gYWdlbnQgc3Vic2NyaWJlcyB0byBDUjMgd3JpdGUgZXZlbnRzLg0KPiANCg0K
eWVzLCB0aGF0J3Mgd2hhdCBJIHdvbmRlcmVkIHdoZW4gcmVhZGluZyB5b3VyIDFzdCByZXBseS4g
DQoNCk5vdyBJIHVuZGVyc3Rvb2QgdGhlIGJhY2tncm91bmQgYW5kIHRoZSBwYXRjaCBvdmVyYWxs
IGxvb2tzDQpnb29kIHRvIG1lLiANCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRp
YW5AaW50ZWwuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
