From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VT-d/DMAR: accept DRHD with
 non-discoverable PCI devices
Date: Thu, 21 Mar 2019 13:17:07 +0000
Message-ID: <574cb5d6-fb95-d8e9-c281-2ed24a2f22a5@citrix.com>
References: <1553113323-14664-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mY5f=RY=citrix.com=prvs=97628d904=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h6xbu-0006Uh-VO
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2019 13:19:54 +0000
In-Reply-To: <1553113323-14664-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <JGross@suse.com>, kevin.tian@intel.com, sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, julien.grall@arm.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDMvMjAxOSAyMDoyMiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gU2luY2UgY29tbWl0
IGRjZjQxNzkwICgieDg2L21tY2ZnL2RyaGQ6IE1vdmUgYWNwaV9tbWNmZ19pbml0KCkgY2FsbAo+
IGJlZm9yZSBjYWxsaW5nIGFjcGlfcGFyc2VfZG1hcigpIikgUENJIHNlZ21lbnQgMCBpcyBub3cg
a25vd24gZWFybHkKPiB3aGljaCBtYWRlIHRoZSBzYW5pdHkgY2hlY2sgb24gRFJIRCBkZWZpbml0
aW9uIHN0cnVjdHVyZSB0byB3b3JrLgo+IFRoaXMsIGluIHR1cm4sIGNhdXNlZCBhIHJlZ3Jlc3Np
b24gb24gc29tZSBtYWNoaW5lcyAoaW4gcGFydGljdWxhciwKPiBIUCBQb3dlckVkZ2UgUjc0MCB3
aXRoIEkvTyBBVCBETUEgZGlzYWJsZWQpIHdoZXJlIElPTU1VIHdhcyBleHBsaWNpdGx5Cj4gZGlz
YWJsZWQgZHVlIHRvIHNvbWUgaW50ZXJuYWwgUENJIGRldmljZXMgYmVpbmcgbm9uLWRpc2NvdmVy
YWJsZSBidXQKPiBwcmVzZW50IGluIERNQVIuCj4KPiBXaGlsZSB0aGlzIGlzIGluZGVlZCBhIEJJ
T1MgbWlzdGFrZSBpdCBzZWVtcyB0byBiZSBub3QgdGhhdCBjcml0aWNhbAo+IHRvIGRpc2FibGUg
dGhlIHdob2xlIElPTU1VLiBJbnN0ZWFkLCBleHRlbmQgdGhlIHNjb3BlIG9mCj4gIndvcmthcm91
bmRfYmlvc19idWciIG9wdGlvbiBhbmQgbWFrZSBpdCBlbmFibGVkIGJ5IGRlZmF1bHQuIFRoaXMg
aXMKPiBjb25zaXN0ZW50IHdpdGggb3VyIGRvY3VtZW50YXRpb24gYW5kIGFjdHVhbGx5IHdoYXQg
YSB1c2VyIG1pZ2h0IGV4cGVjdAo+IGZyb20gYW4gb3B0aW9uIHdpdGggdGhhdCBuYW1lLiBJdCBh
bHNvIGRvZXNuJ3Qgc2VlbSBzYWZlIHRvIHNpbXBseSBpZ25vcmUKPiBEUkhEIHdpdGhvdXQgaW5p
dGlhbGl6YXRpb24gc28gcmVtb3ZlIHRoaXMgY2FzZS4gQnV0IGxlYXZlIHRoZSBvcmlnaW5hbAo+
IERNQVIgY2hlY2sgaW4gcGxhY2UgdG8gc3RpbGwgYWxsb3cgZXJyb3IgcmVwb3J0aW5nLgo+Cj4g
U2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+
CgpUaGlzIGlzIGNvZGUgd2hpY2ggd2FzIHByZXZpb3VzbHkgZGVhZC7CoCBUaGUgYmVoYXZpb3Vy
IG9mIGlnbm9yaW5nIGFuCklPTU1VIGJlY2F1c2UgdGhlcmUgaXMgdW5yZWFjaGFibGUgZGV2aWNl
IGJlaGluZCBpdCBpcyBhd2Z1bCBhbmQKc2hvdWxkbid0IGV4aXN0LCBidXQgd2Ugc2hvdWxkIGF0
IGxlYXN0IGxlYXZlIGEgdHJhY2Ugb2YgaXQgaW4gdGhlIGxvZ3MuCgpUQkgsIEknZCBwcmVmZXIg
dG8gZGVsZXRlIHRoZSBgd29ya2Fyb3VuZF9iaW9zX2J1Z2Agb3B0aW9uIGVudGlyZWx5LCBhbmQK
anVzdCBwcmludCBvdXQgdGhlIGJhZCBlbnRyaWVzLsKgIE5vdGhpbmcgdGhlIG9wdGlvbiBkb2Vz
IGlzIHdvcnRoeSBvZgpzaHV0dGluZyB0aGUgSU9NTVUgZG93bi4KCkNDLWluZyBKdWVyZ2VuIGFz
IHRoaXMgaXMgYSA0LjEyIHJlZ3Jlc3Npb24uCgpJIGNhbiBlYXNpbHkgc3BpbiBhIHBhdGNoIGFs
b25nIG15IHN1Z2dlc3RlZCByb3V0ZSBpZiBvdGhlcnMgYWdyZWUuCgp+QW5kcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
