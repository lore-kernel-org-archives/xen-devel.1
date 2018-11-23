From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 10/14] x86/mm: Switch {get,
 put}_gfn() infrastructure to using gfn_t
Date: Fri, 23 Nov 2018 02:58:58 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE61AC0@SHSMSX101.ccr.corp.intel.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-11-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542806482-24030-11-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAyMSwgMjAxOCA5OjIxIFBNDQo+IA0KPiBTZWVt
aW5nbHksIGEgbWFqb3JpdHkgb2YgdXNlcnMgZWl0aGVyIG92ZXJyaWRlIHRoZSBoZWxwZXJzIGFu
eXdheSwgb3IgaGF2ZQ0KPiBhbg0KPiBnZm5fdCBpbiB0aGVpciBoYW5kcy4NCj4gDQo+IFVwZGF0
ZSB0aGUgQVBJLCBhbmQgYWRqdXN0IGFsbCB1c2VycyB0byBtYXRjaC4NCj4gDQo+IERvaW5nIHRo
aXMgaGlnaGxpZ2h0ZWQgYSBnYXBpbmcgYWx0cDJtIHNlY3VyaXR5IGhvbGUgaW4NCj4gdm14X3Zj
cHVfdXBkYXRlX3ZtZnVuY192ZSgpLCB3aGljaCB3aWxsIG5lZWQgYWRkcmVzc2luZyBub3cgd2Ug
Y2FuDQo+IGRpc2N1c3MgdGhlDQo+IHByb2JsZW0gYW5kIG9wdGlvbnMgcHVibGljbHkuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
