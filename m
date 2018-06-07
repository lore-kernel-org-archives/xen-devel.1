From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 06/11] x86: Reorganise and rename debug
 register fields in struct vcpu
Date: Thu, 07 Jun 2018 04:59:13 -0600
Message-ID: <5B19100102000078001C90F1@prv1-mh.provo.novell.com>
References: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
 <1528120755-17455-7-git-send-email-andrew.cooper3@citrix.com>
 <5B17F72302000078001C8D47@prv1-mh.provo.novell.com>
 <5ab9bca7-041d-aee9-f50b-ef8d450ab652@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5ab9bca7-041d-aee9-f50b-ef8d450ab652@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, brian.woods@amd.com, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjA2LjE4IGF0IDE3OjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDYvMDYvMTggMTY6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNC4w
Ni4xOCBhdCAxNTo1OSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gQEAg
LTUxOCw3ICs1MjQsMTAgQEAgc3RydWN0IGFyY2hfdmNwdQo+Pj4gICAgICB2b2lkICAgICAgICAg
ICAgICAqZnB1X2N0eHQ7Cj4+PiAgICAgIHVuc2lnbmVkIGxvbmcgICAgICB2Z2NfZmxhZ3M7Cj4+
PiAgICAgIHN0cnVjdCBjcHVfdXNlcl9yZWdzIHVzZXJfcmVnczsKPj4+IC0gICAgdW5zaWduZWQg
bG9uZyAgICAgIGRlYnVncmVnWzhdOwo+Pj4gKwo+Pj4gKyAgICAvKiBEZWJ1ZyByZWdpc3RlcnMu
ICovCj4+PiArICAgIHVuc2lnbmVkIGxvbmcgZHJbNF07Cj4+PiArICAgIHVuc2lnbmVkIGxvbmcg
ZHI2LCBkcjc7Cj4+IFNpbmNlIHlvdSBtYWtlIHRoZSBsYXN0IHR3byBzZXBhcmF0ZSBmaWVsZHMs
IGFuZCBzaW5jZSB0aGVpciB1cHBlcgo+PiAzMiBiaXRzIGFyZSByZXNlcnZlZC16ZXJvLCB3aHkg
bm90IG1ha2UgdGhlbSB1aW50MzJfdCwganVzdCBsaWtlCj4+IGRyN19lbXVsIGlzPwo+IAo+IEJl
Y2F1c2UgX192bXJlYWQoKSB0YWtlcyB1bnNpZ25lZCBsb25nICouCj4gCj4gSSBkaWQgaW5pdGlh
bGx5IG1ha2UgdGhlbSB1aW50MzJfdCwgdGhlbiBoYWQgdGhlIGNvbXBpbGVyIGNvbXBsYWluIGF0
Cj4gbWUuICBJIGluZGVudGVkIHRvIGxlYXZlIGEgbm90ZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2Us
IGJ1dCBJIGZvcmdvdC4gIFNvcnJ5LgoKVGhhdCdzIGZvciBkcjcgb25seSwgdGhlbi4gZHI2IGFu
ZCBkcjdfZW11bCBjb3VsZCB0aGVuIHNoYXJlIHRoZSBvdGhlcgo2NC1iaXQgc2xvdC4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
