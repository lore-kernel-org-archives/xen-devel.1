From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.12 V4] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Fri, 15 Feb 2019 13:47:18 +0000
Message-ID: <23b1a02e-61fe-2469-cc18-0b92f9221360@citrix.com>
References: <1549971734-12795-1-git-send-email-rcojocaru@bitdefender.com>
 <AEB7DEFF-F671-4A5E-AC27-43D314D82741@citrix.com>
 <5C66BDA60200007800217025@prv1-mh.provo.novell.com>
 <64133DD0-7451-43B7-953F-DA38F601E8A4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yVz/=QW=citrix.com=prvs=942cbbc70=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gudpq-0006Bz-8y
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 13:47:22 +0000
In-Reply-To: <64133DD0-7451-43B7-953F-DA38F601E8A4@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDIvMjAxOSAxMzozNywgR2VvcmdlIER1bmxhcCB3cm90ZToKPgo+Pj4gVGhlIG9uZSBp
c3N1ZSBpcyB0aGF0IGRvbWFpbl9wYXVzZV9leGNlcHRfc2VsZigpIGN1cnJlbnRseSBpcyBhY3R1
YWxseSBhIAo+Pj4gZGVhZGxvY2sgcmlzayBpZiB0d28gZGlmZmVyZW50IHZjcHVzIHN0YXJ0IGl0
IGF0IHRoZSBzYW1lIHRpbWUuICBJIHRoaW5rIHRoZSAKPj4+IGF0dGFjaGVkIHBhdGNoIChjb21w
aWxlLXRlc3RlZCBvbmx5KSBzaG91bGQgZml4IHRoaXMgaXNzdWU7IGFmdGVyIHRoaXMgcGF0Y2gg
Cj4+PiB5b3Ugc2hvdWxkIGJlIGFibGUgdG8gdXNlIGRvbWFpbl9wYXVzZV9leGNlcHRfc2VsZigp
IGluIAo+Pj4gYWx0cDJtX3NldF9kb21haW5fc3RhdGUgaW5zdGVhZC4KPj4gVGhlcmUncyBvbmUg
dGhpbmcgSSBkb24ndCByZWFsbHkgbGlrZSBoZXJlLCB3aGljaCBpcyBhIHJlc3VsdCBvZiB0aGUK
Pj4gKG5lY2Vzc2FyeSkgcmUtdXNlIG9mIHRoZSBoeXBlcmNhbGwgZGVhZGxvY2sgbXV0ZXg6IFRo
aXMKPj4gY2VydGFpbmx5IHBvc2VzIHRoZSByaXNrIG9mIGdldHRpbmcgY2FsbGVkIGZyb20gYSBj
b250ZXh0IHdoZXJlCj4+IHRoZSBsb2NrIHdhcyBhbHJlYWR5IGFjcXVpcmVkLiBUaGVyZWZvcmUg
SSdkIGxpa2UgdG8gc3VnZ2VzdCB0bwo+PiB1c2UgdGhpcyBsb2NrIGluIGEgcmVjdXJzaXZlIHdh
eSAoaGVyZSBhbmQgZWxzZXdoZXJlKS4KCkkgY2FuJ3QgdGhpbmsgb2YgYSB1c2VjYXNlIHdlcmUg
d2Ugd291bGQgd2FudCB0byB0b2xlcmF0ZSByZWN1cnNpb24gb24KdGhlIGh5cGVyY2FsbCBkZWFk
bG9jayBzcGlubG9jay4KCkknZCBhc3NlcnQvZG9tYWluX2NyYXNoKCkgdGhhdCBpdHMgbm90IGxv
Y2tlZCBieSB0aGUgY3VycmVudCBjcHUsIHJhdGhlcgp0aGFuIGNvbXBsaWNhdGluZyBldmVyeXRo
aW5nIGZvciBhIHRoZW9yZXRpY2FsIGNhc2Ugb2YgcXVlc3Rpb25hYmxlIHV0aWxpdHkuCgpBdHRl
bXB0ZWQgbmVzdGluZyBvZiB0aGlzIGxvY2sgaXNuJ3QgYSBzZWN1cml0eSBpc3N1ZSwgYmVjYXVz
ZSBhbGwgdGhhdAp3aWxsIGhhcHBlbiBpcyB0aGF0IHRoZSB2Y3B1IHdpbGwgbGl2ZWxvY2sgdGFr
aW5nIGNvbnRpbnVhdGlvbnMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
