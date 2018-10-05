From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/HVM: move vendor independent CPU
 save/restore logic to shared code
Date: Fri, 5 Oct 2018 13:18:55 +0100
Message-ID: <d724debc-e477-1a29-b2a0-db497be01252@citrix.com>
References: <5BB74B9702000078001EECE4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wiz4=mr=citrix.com=prvs=8095139d5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g8P4N-000309-6R
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 12:18:59 +0000
In-Reply-To: <5BB74B9702000078001EECE4@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTAvMTggMTI6MzEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEEgZmV3IHBpZWNlcyBvZiB0
aGUgaGFuZGxpbmcgaGVyZSBhcmUgKG5vIGxvbmdlcj8pIHZlbmRvciBzcGVjaWZpYywgYW5kCj4g
aGVuY2UgdGhlcmUncyBubyBwb2ludCBpbiByZXBsaWNhdGluZyB0aGUgY29kZS4KCkVGRVIgcHJv
YmFibHkgd2FzIHZlbmRvciBzcGVjaWZpYyBvcmlnaW5hbGx5LsKgIFRoZSBjb250cm9sIHJlZ2lz
dGVycwpyZWFsbHkgc2hvdWxkbid0IGhhdmUgYmVlbi4uLgoKPiBNYWtlIHN1cmUgbm90IG90aGVy
d2lzZQo+IHByZS1maWxsZWQgZmllbGRzIG9mIHN0cnVjdCBodm1faHdfY3B1IGluc3RhbmNlcyBh
cmUgemVybyBmaWxsZWQgYmVmb3JlCj4gY2FsbGluZyB0aGUgdmVuZG9yICJzYXZlIiBob29rLCBl
bGltaW5hdGluZyB0aGUgbmVlZCBmb3IgdGhlIGhvb2sKPiBmdW5jdGlvbnMgdG8gemVybyBpbmRp
dmlkdWFsIGZpZWxkcy4KClRoZSBzdGFydCBvZiB0aGlzIHNlbnRlbmNlIGlzIHJhdGhlciBoYXJk
IHRvIHBhcnNlLsKgIEhvdyBhYm91dCAiWmVybyB0aGUKZnVsbCBzdHJ1Y3R1cmUgYmVmb3JlIGNh
bGxpbmcgdGhlIHNhdmUgaG9vaywgZWxpbWluYXRpbmcgdGhlIG5lZWQgdG8KemVybyBpbmRpdmlk
dWFsIGZpZWxkcy4iID8KCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKQ29kZSB3aXNlLCB0aGlzIGxvb2tzIGZpbmUuwqAgUmV2aWV3ZWQtYnk6IEFuZHJl
dyBDb29wZXIKPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
