From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 7/7] x86/hvm: Drop hvm_{vmx,svm} shorthands
Date: Thu, 30 Aug 2018 01:39:40 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1912E11F1@SHSMSX101.ccr.corp.intel.com>
References: <1535477946-17892-1-git-send-email-andrew.cooper3@citrix.com>
 <1535477946-17892-8-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535477946-17892-8-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, George Dunlap <george.dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMjksIDIwMTggMTozOSBBTQ0KPiANCj4gQnkgbWFr
aW5nIHt2bXgsc3ZtfSBpbiBodm1fdmNwdSBpbnRvIGFuIGFub255bW91cyB1bmlvbiAoY29uc2lz
dGVudA0KPiB3aXRoDQo+IGRvbWFpbiBzaWRlIG9mIHRoaW5ncyksIHRoZSBodm1fe3ZteCxzdm19
IGRlZmluZXMgY2FuIGJlIGRyb3BwZWQsIGFuZCBhbGwNCj4gY29kZQ0KPiByZWZlciB0byB0aGUg
Y29ycmVjdGx5LW5hbWVkIGZpZWxkcy4gIFRoaXMgbWVhbnMgdGhhdCB0aGUgZGF0YSBoaWVyYWNo
eSBpcyBubw0KPiBsb25nZXIgb2JzY3VyZWQgZnJvbSBncmVwL2NzY29wZS90YWdzL2V0Yy4NCj4g
DQo+IFJlZm9ybWF0IG9uZSBjb21tZW50IGFuZCBzd2l0Y2ggb25lIGJvb2xfdCB0byBib29sIHdo
aWxlIG1ha2luZw0KPiBjaGFuZ2VzLg0KPiANCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQoNCm9u
ZSBzbWFsbCBub3RlLiBJbiBjb3ZlcmxldHRlcjoNCg0KCSIgVGhpcyBzZXJpZXMgc3RhcnRlZCBi
eSB0cnlpbmcgdG8gYWRkcmVzcyB0aGUgYnVnIGluIHBhdGNoIDcsIA0KYW5kIGJhbGxvb25lZCBz
b21ld2hhdC4iDQoNCnRoZXJlIGlzIG5vIGJ1ZyBwZXIgc2UgaW4gdGhpcyBwYXRjaCwgcmlnaHQ/
DQoNClRoYW5rcw0KS2V2aW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
