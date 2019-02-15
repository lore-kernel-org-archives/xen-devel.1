From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH for-4.12 V4] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Fri, 15 Feb 2019 14:15:13 +0000
Message-ID: <429D75FD-E91B-4F8F-9FBD-D1E5B79BAB80@citrix.com>
References: <1549971734-12795-1-git-send-email-rcojocaru@bitdefender.com>
 <AEB7DEFF-F671-4A5E-AC27-43D314D82741@citrix.com>
 <5C66BDA60200007800217025@prv1-mh.provo.novell.com>
 <64133DD0-7451-43B7-953F-DA38F601E8A4@citrix.com>
 <23b1a02e-61fe-2469-cc18-0b92f9221360@citrix.com>
 <CC7A5FBC-56A1-4623-93CE-9C31697141B6@citrix.com>
 <5C66C6600200007800217083@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o/cr=QW=citrix.com=prvs=942b6a84d=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gueGq-0000lM-P3
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 14:15:16 +0000
In-Reply-To: <5C66C6600200007800217083@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <A3469E6978F0CB469B02836E79A56565@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gRmViIDE1LCAyMDE5LCBhdCAyOjAyIFBNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4+Pj4gT24gMTUuMDIuMTkgYXQgMTQ6NTEsIDxHZW9yZ2Uu
RHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4+IA0KPj4+IE9uIEZlYiAxNSwgMjAxOSwg
YXQgMTo0NyBQTSwgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6DQo+Pj4gDQo+Pj4gT24gMTUvMDIvMjAxOSAxMzozNywgR2VvcmdlIER1bmxhcCB3cm90ZToN
Cj4+Pj4gDQo+Pj4+Pj4gVGhlIG9uZSBpc3N1ZSBpcyB0aGF0IGRvbWFpbl9wYXVzZV9leGNlcHRf
c2VsZigpIGN1cnJlbnRseSBpcyBhY3R1YWxseSBhIA0KPj4+Pj4+IGRlYWRsb2NrIHJpc2sgaWYg
dHdvIGRpZmZlcmVudCB2Y3B1cyBzdGFydCBpdCBhdCB0aGUgc2FtZSB0aW1lLiAgSSB0aGluayB0
aGUgDQo+PiANCj4+Pj4+PiBhdHRhY2hlZCBwYXRjaCAoY29tcGlsZS10ZXN0ZWQgb25seSkgc2hv
dWxkIGZpeCB0aGlzIGlzc3VlOyBhZnRlciB0aGlzIHBhdGNoIA0KPj4gDQo+Pj4+Pj4geW91IHNo
b3VsZCBiZSBhYmxlIHRvIHVzZSBkb21haW5fcGF1c2VfZXhjZXB0X3NlbGYoKSBpbiANCj4+Pj4+
PiBhbHRwMm1fc2V0X2RvbWFpbl9zdGF0ZSBpbnN0ZWFkLg0KPj4+Pj4gVGhlcmUncyBvbmUgdGhp
bmcgSSBkb24ndCByZWFsbHkgbGlrZSBoZXJlLCB3aGljaCBpcyBhIHJlc3VsdCBvZiB0aGUNCj4+
Pj4+IChuZWNlc3NhcnkpIHJlLXVzZSBvZiB0aGUgaHlwZXJjYWxsIGRlYWRsb2NrIG11dGV4OiBU
aGlzDQo+Pj4+PiBjZXJ0YWlubHkgcG9zZXMgdGhlIHJpc2sgb2YgZ2V0dGluZyBjYWxsZWQgZnJv
bSBhIGNvbnRleHQgd2hlcmUNCj4+Pj4+IHRoZSBsb2NrIHdhcyBhbHJlYWR5IGFjcXVpcmVkLiBU
aGVyZWZvcmUgSSdkIGxpa2UgdG8gc3VnZ2VzdCB0bw0KPj4+Pj4gdXNlIHRoaXMgbG9jayBpbiBh
IHJlY3Vyc2l2ZSB3YXkgKGhlcmUgYW5kIGVsc2V3aGVyZSkuDQo+Pj4gDQo+Pj4gSSBjYW4ndCB0
aGluayBvZiBhIHVzZWNhc2Ugd2VyZSB3ZSB3b3VsZCB3YW50IHRvIHRvbGVyYXRlIHJlY3Vyc2lv
biBvbg0KPj4+IHRoZSBoeXBlcmNhbGwgZGVhZGxvY2sgc3BpbmxvY2suDQo+PiANCj4+IEl0IHNv
dW5kcyBsaWtlIEphbiBpcyBzcGVjaWZpY2FsbHkgdGhpbmtpbmcgdGhhdCBzb21lb25lIG1heSAo
c2F5KSBjYWxsIA0KPj4gZG9tY3RsX2xvY2soKSwgdGhlbiBhZnRlcndhcmRzIGNhbGwgZG9tYWlu
X3BhdXNlX2V4Y2VwdF9zZWxmKCkuDQo+PiANCj4+IE9mIGNvdXJzZSwgdGhhdCB3b3VsZCBkZWFk
bG9jayBpbW1lZGlhdGVseSwgc28gd291bGQgcHJvYmFibHkgZ2V0IGNhdWdodCANCj4+IGJlZm9y
ZSB0aGUgcGF0Y2ggZXZlbiBnb3QgdG8gYGdpdCBzZW5kLWVtYWlsYC4NCj4gDQo+IEluZGVlZC4g
VGhlIHNpdHVhdGlvbiBJJ20gd29ycmllZCBhYm91dCBpcyBpZiB0aGlzIHdhcyBwdXQgb24gc29t
ZQ0KPiBlcnJvciBwYXRoLCB3aGljaCBtaWdodCBuZXZlciBiZSBoaXQgaW4gdGVzdGluZy4NCg0K
SG1tLCBvciBvdGhlciB1bnVzdWFsIHBhdGhzLiAgSeKAmW0gbGVhbmluZyBtb3JlIHRvd2FyZHMg
c2F5aW5nIHdlIHNob3VsZCB1c2Ugc3Bpbl9sb2NrX3JlY3Vyc2l2ZSgpOyBpdOKAmXMgbm90ICp0
aGF0KiBtdWNoIG1vcmUgY29tcGxpY2F0aW9uLCBpcyBpdCwgQW5keT8NCg0KIC1HZW9yZ2UKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
