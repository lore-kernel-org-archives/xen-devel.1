From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH for-4.12 V4] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Fri, 15 Feb 2019 13:51:18 +0000
Message-ID: <CC7A5FBC-56A1-4623-93CE-9C31697141B6@citrix.com>
References: <1549971734-12795-1-git-send-email-rcojocaru@bitdefender.com>
 <AEB7DEFF-F671-4A5E-AC27-43D314D82741@citrix.com>
 <5C66BDA60200007800217025@prv1-mh.provo.novell.com>
 <64133DD0-7451-43B7-953F-DA38F601E8A4@citrix.com>
 <23b1a02e-61fe-2469-cc18-0b92f9221360@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o/cr=QW=citrix.com=prvs=942b6a84d=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gudtx-00071z-55
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 13:51:37 +0000
In-Reply-To: <23b1a02e-61fe-2469-cc18-0b92f9221360@citrix.com>
Content-Language: en-US
Content-ID: <2B6CD5890193AC449C81A003701C0AF2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gRmViIDE1LCAyMDE5LCBhdCAxOjQ3IFBNLCBBbmRyZXcgQ29vcGVyIDxBbmRyZXcu
Q29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDE1LzAyLzIwMTkgMTM6MzcsIEdl
b3JnZSBEdW5sYXAgd3JvdGU6DQo+PiANCj4+Pj4gVGhlIG9uZSBpc3N1ZSBpcyB0aGF0IGRvbWFp
bl9wYXVzZV9leGNlcHRfc2VsZigpIGN1cnJlbnRseSBpcyBhY3R1YWxseSBhIA0KPj4+PiBkZWFk
bG9jayByaXNrIGlmIHR3byBkaWZmZXJlbnQgdmNwdXMgc3RhcnQgaXQgYXQgdGhlIHNhbWUgdGlt
ZS4gIEkgdGhpbmsgdGhlIA0KPj4+PiBhdHRhY2hlZCBwYXRjaCAoY29tcGlsZS10ZXN0ZWQgb25s
eSkgc2hvdWxkIGZpeCB0aGlzIGlzc3VlOyBhZnRlciB0aGlzIHBhdGNoIA0KPj4+PiB5b3Ugc2hv
dWxkIGJlIGFibGUgdG8gdXNlIGRvbWFpbl9wYXVzZV9leGNlcHRfc2VsZigpIGluIA0KPj4+PiBh
bHRwMm1fc2V0X2RvbWFpbl9zdGF0ZSBpbnN0ZWFkLg0KPj4+IFRoZXJlJ3Mgb25lIHRoaW5nIEkg
ZG9uJ3QgcmVhbGx5IGxpa2UgaGVyZSwgd2hpY2ggaXMgYSByZXN1bHQgb2YgdGhlDQo+Pj4gKG5l
Y2Vzc2FyeSkgcmUtdXNlIG9mIHRoZSBoeXBlcmNhbGwgZGVhZGxvY2sgbXV0ZXg6IFRoaXMNCj4+
PiBjZXJ0YWlubHkgcG9zZXMgdGhlIHJpc2sgb2YgZ2V0dGluZyBjYWxsZWQgZnJvbSBhIGNvbnRl
eHQgd2hlcmUNCj4+PiB0aGUgbG9jayB3YXMgYWxyZWFkeSBhY3F1aXJlZC4gVGhlcmVmb3JlIEkn
ZCBsaWtlIHRvIHN1Z2dlc3QgdG8NCj4+PiB1c2UgdGhpcyBsb2NrIGluIGEgcmVjdXJzaXZlIHdh
eSAoaGVyZSBhbmQgZWxzZXdoZXJlKS4NCj4gDQo+IEkgY2FuJ3QgdGhpbmsgb2YgYSB1c2VjYXNl
IHdlcmUgd2Ugd291bGQgd2FudCB0byB0b2xlcmF0ZSByZWN1cnNpb24gb24NCj4gdGhlIGh5cGVy
Y2FsbCBkZWFkbG9jayBzcGlubG9jay4NCg0KSXQgc291bmRzIGxpa2UgSmFuIGlzIHNwZWNpZmlj
YWxseSB0aGlua2luZyB0aGF0IHNvbWVvbmUgbWF5IChzYXkpIGNhbGwgZG9tY3RsX2xvY2soKSwg
dGhlbiBhZnRlcndhcmRzIGNhbGwgZG9tYWluX3BhdXNlX2V4Y2VwdF9zZWxmKCkuDQoNCk9mIGNv
dXJzZSwgdGhhdCB3b3VsZCBkZWFkbG9jayBpbW1lZGlhdGVseSwgc28gd291bGQgcHJvYmFibHkg
Z2V0IGNhdWdodCBiZWZvcmUgdGhlIHBhdGNoIGV2ZW4gZ290IHRvIGBnaXQgc2VuZC1lbWFpbGAu
ICBCdXQgaXQgc2VlbXMgbGlrZSBhIHJlYXNvbmFibGUgdGhpbmcgc29tZW9uZSBtaWdodCB3YW50
IHRvIGRvLg0KDQpPVE9ILCBJ4oCZbSBmaW5lIGxlYXZpbmcgbWFraW5nIGl0IHJlY3Vyc2l2ZSB1
bnRpbCBzb21lb25lIGRpc2NvdmVycyB0aGF0IGl0IG5lZWRzIHRvIGJlLg0KDQogLUdlb3JnZQ0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
