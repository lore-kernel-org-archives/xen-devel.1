From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VMX: fix vmx_{find,del}_msr() build
Date: Tue, 17 Jul 2018 09:39:03 +0100
Message-ID: <d47221f7-6b21-026e-3a68-36253250b2e1@citrix.com>
References: <5B4CCBD302000078001D4907@prv1-mh.provo.novell.com>
 <8ac9748a-258c-a9e4-6d0d-b838b58466b5@citrix.com>
 <5B4D934902000078001D4AE9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=h9ca=kb=citrix.com=prvs=729a6f093=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ffLWm-0004MV-IN
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 08:40:12 +0000
In-Reply-To: <5B4D934902000078001D4AE9@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <Wei.Liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDcvMjAxOCAwNzo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTYuMDcuMTgg
YXQgMTg6NTYsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTYvMDcv
MTggMTc6NDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gRm9yIGEgcmVhc29uIHRoYXQgSSBjYW4n
dCBleHBsYWluLCBpdCBpcyBvbmx5IHRoZSBzaGltIGJ1aWxkIHRoYXQgZmFpbHMKPj4+IGZvciBt
ZSB3aXRoIGFuIG9sZGVyIGdjYyBkdWUgdG8gdGhlIGNvbXBpbGVyIG5vdCByZWNvZ25pemluZyB0
aGF0Cj4+PiBhcHBhcmVudGx5IHVuaW5pdGlhbGl6ZWQgdmFyaWFibGVzIGFyZW4ndCByZWFsbHkg
dW5pbml0aWFsaXplZC4KPj4gVGhlIG9ubHkgdGhpbmcgdGhhdCBjb21lcyB0byBtaW5kIGlzIHNv
bWUgZGlmZmVyZW5jZXMgaW4gQ0ZMQUdTIGV0IGFsLiAKPj4gVGhlcmUgaXMgbm90aGluZyBpbiBr
Y29uZmlnIHdoaWNoIHdvdWxkIHBsYXVzaWJseSBpbXBhY3QgdGhhdCBjb2RlLgo+IE9oLCByaWdo
dCAtIGxvb2tzIGxpa2UgdGhlIHNoaW0gYnVpbGQgaW5oZXJpdHMgdGhlIHRvb2wgc3RhY2sncyBD
RkxBR1MsCj4gd2hpY2ggc3BlY2lmeSAtTzAgaW4gZGVidWcgYnVpbGRzLiBPdG9oIEknbSBzdXJw
cmlzZWQgdGhlIGh5cGVydmlzb3IKPiBidWlsZHMgYXQgYWxsIHdpdGggLU8wLCBzbyBJIGd1ZXNz
IEknbGwgaGF2ZSB0byBsb29rIGF0IHRoYXQgaW4gc29tZQo+IG1vcmUgZGV0YWlsLCBub3QgdGhl
IGxlYXN0IGJlY2F1c2UgeGVuL1J1bGVzLm1rIHVzZXMgKz0gdG8gaW5zZXJ0Cj4gaXRzIG93biAt
TzxuPi4gSW4gYW55IGV2ZW50LCBjb21wYXJpbmcgdGhlIHR3byBvYmplY3QgZmlsZXMgY2xlYXJs
eQo+IHN1Z2dlc3RzIGEgZGlmZmVyZW5jZSBpbiBvcHRpbWl6YXRpb24gbGV2ZWwuCgpIbW0gLSBp
bnRlcmVzdGluZy7CoCBJIGhhZCBpbnRlbmRlZCBub3QgdG8gaW5oZXJpdCB0aGUgdG9vbHMgZHVi
aW91cwpDRkxBR1Mgc2V0dGluZyAobm90aGluZyBzaG91bGQgdXNlIE8wLCBub3QgZXZlbiBmb3Ig
ZGVidWdnaW5nKSwgYnV0IGhvdwp0aGF0IEkgdGhpbmsgYmFjaywgdGhhdCBwcm9iYWJseSBmZWxs
IHRocm91Z2ggdGhlIGNyYWNrcyBpbiB0aGUKYXNzb2NpYXRlZCBjaGFvcy4KCk5ldmVydGhlbGVz
cywgYWxsIG9mIG91ciBjb2RlIHNob3VsZCBidWlsZCBhdCBhbnkgb3B0aW1pc2F0aW9uIGxldmVs
LsKgIEkKa25vdyBmcm9tIG90aGVyIGF0dGVtcHRzIHRoYXQgWGVuIGFsc28gZG9lc24ndCBidWls
ZCBhdCBPMywgYW5kIHdlIGNvdWxkCmRvIHdpdGggYSB3YXkgdG8gc2VsZWN0IHRoZSBvcHRpbWlz
YXRpb24gbGV2ZWwsIGluZGVwZW5kZW50bHkgb2YgZGVidWcKc2V0dGluZ3MuCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
