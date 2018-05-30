From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 05/10] x86/SVM: Add AVIC vmexit handlers
Date: Wed, 30 May 2018 01:24:36 -0600
Message-ID: <5B0E51B402000078001C6D63@prv1-mh.provo.novell.com>
References: <20180507210753.2280-1-Janakarajan.Natarajan@amd.com>
 <20180507210753.2280-6-Janakarajan.Natarajan@amd.com>
 <5AFC54C202000078001C35AC@prv1-mh.provo.novell.com>
 <5bbd739a-548e-e317-87e5-896d36a8b72b@amd.com>
 <453a59cb-3d24-9eeb-0daa-3a7405b5ad03@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <453a59cb-3d24-9eeb-0daa-3a7405b5ad03@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, JanakarajanNatarajan <jnataraj@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA1LjE4IGF0IDAxOjMzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4+IFdvdWxkIHRoaXMgYmUgYmV0dGVyIHN1aXRlZCA/Cj4gCj4gQWxtb3N0Lgo+IAo+IFRo
ZSBwdXJwb3NlIG9mIHRoZSB2YWxpZGF0ZSBmdW5jdGlvbiBpcyB0byBmaXggYW4gaW5oZXJlbnQg
cmFjZQo+IGNvbmRpdGlvbiB3aGljaCBvY2N1cnMgd2l0aCBhIHZtZXhpdC4KPiAKPiBBZnRlciBh
IHZtZXhpdCwgcmVyZWFkaW5nIHRoZSBpbnN0cnVjdGlvbiBmb3IgZW11bGF0aW9uIGlzIGluaGVy
ZW50bHkKPiByYWN5LCBhbmQgYSBtYWxpY2lvdXMgVk0gY291bGQgcmV3cml0ZSB0aGUgaW5zdHJ1
Y3Rpb24gc3RyZWFtIHdoaWxlIHRoZQo+IHZtZXhpdCBpcyBvY2N1cmluZy4gIEFzIGEgcmVzdWx0
LCB3ZSBwcm92aWRlIGEgdmFsaWRhdGUgZnVuY3Rpb24gdG8KPiBjaGVjayB0aGF0IHRoZSBpbnN0
cnVjdGlvbiBkZWNvZGVkIG1hdGNoZXMgb25lIHdoaWNoIHBsYXVzaWJseSBicm9rZSBmb3IKPiBl
bXVsYXRpb24gaGVyZS4KPiAKPiBUaGVyZWZvcmUsIHlvdSB3YW50IGEgdmFsaWRhdGUgZnVuY3Rp
b24gd2hpY2ggY2hlY2tzIHRoYXQgdGhlCj4gaW5zdHJ1Y3Rpb24gaGFzIGEgbWVtb3J5IG9wZXJh
bmQsIGFuZCB0aGF0IGl0IGZhbGxzIHdpdGhpbiB0aGUgNGsgcmVnaW9uCj4gd2hpY2ggbWFwcyB0
aGUgQVBJQyByZWdpc3RlcnMuCgpUaGUgdmFsaWRhdGUgaG9vayBpcyBjYWxsZWQgcmlnaHQgYWZ0
ZXIgZGVjb2RlLCBpLmUuIGJlZm9yZSBvcGVyYW5kcyBoYXZlCmJlZW4gZXZhbHVhdGVkLCBzbyB0
aGUgbGF0dGVyIHBhcnQgb2Ygd2hhdCB5b3Ugc3VnZ2VzdCBjYW5ub3QgYmUgZG9uZS4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
