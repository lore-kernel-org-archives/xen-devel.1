From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/HVM: move vendor independent CPU
 save/restore logic to shared code
Date: Fri, 05 Oct 2018 07:33:18 -0600
Message-ID: <5BB7681E02000078001EEE5D@prv1-mh.provo.novell.com>
References: <5BB74B9702000078001EECE4@prv1-mh.provo.novell.com>
 <d724debc-e477-1a29-b2a0-db497be01252@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vier=mr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g8QEM-0000g1-Ca
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 13:33:22 +0000
In-Reply-To: <d724debc-e477-1a29-b2a0-db497be01252@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEwLjE4IGF0IDE0OjE4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDUvMTAvMTggMTI6MzEsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBBIGZldyBwaWVj
ZXMgb2YgdGhlIGhhbmRsaW5nIGhlcmUgYXJlIChubyBsb25nZXI/KSB2ZW5kb3Igc3BlY2lmaWMs
IGFuZAo+PiBoZW5jZSB0aGVyZSdzIG5vIHBvaW50IGluIHJlcGxpY2F0aW5nIHRoZSBjb2RlLgo+
IAo+IEVGRVIgcHJvYmFibHkgd2FzIHZlbmRvciBzcGVjaWZpYyBvcmlnaW5hbGx5LiAgVGhlIGNv
bnRyb2wgcmVnaXN0ZXJzCj4gcmVhbGx5IHNob3VsZG4ndCBoYXZlIGJlZW4uLi4KPiAKPj4gTWFr
ZSBzdXJlIG5vdCBvdGhlcndpc2UKPj4gcHJlLWZpbGxlZCBmaWVsZHMgb2Ygc3RydWN0IGh2bV9o
d19jcHUgaW5zdGFuY2VzIGFyZSB6ZXJvIGZpbGxlZCBiZWZvcmUKPj4gY2FsbGluZyB0aGUgdmVu
ZG9yICJzYXZlIiBob29rLCBlbGltaW5hdGluZyB0aGUgbmVlZCBmb3IgdGhlIGhvb2sKPj4gZnVu
Y3Rpb25zIHRvIHplcm8gaW5kaXZpZHVhbCBmaWVsZHMuCj4gCj4gVGhlIHN0YXJ0IG9mIHRoaXMg
c2VudGVuY2UgaXMgcmF0aGVyIGhhcmQgdG8gcGFyc2UuICBIb3cgYWJvdXQgIlplcm8gdGhlCj4g
ZnVsbCBzdHJ1Y3R1cmUgYmVmb3JlIGNhbGxpbmcgdGhlIHNhdmUgaG9vaywgZWxpbWluYXRpbmcg
dGhlIG5lZWQgdG8KPiB6ZXJvIGluZGl2aWR1YWwgZmllbGRzLiIgPwoKRmluZSB3aXRoIG1lLCBj
aGFuZ2VkLgoKPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+IAo+IENvZGUgd2lzZSwgdGhpcyBsb29rcyBmaW5lLiAgUmV2aWV3ZWQtYnk6IEFuZHJldyBD
b29wZXIKPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClRoYW5rcy4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
