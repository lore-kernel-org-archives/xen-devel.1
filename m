From: <staskins@amazon.com>
Subject: Re: [PATCH 2/3] xen netback: add fault injection
 facility
Date: Fri, 20 Apr 2018 15:02:35 +0200
Message-ID: <d205346f-d77a-8e5c-753d-c05623a6c55a__44425.0063425445$1524229287$gmane$org@amazon.com>
References: <20180420104603.17823.31095.stgit@dev-dsk-staskins-1a-ca5afbf2.eu-west-1.amazon.com>
 <20180420104731.17823.97617.stgit@dev-dsk-staskins-1a-ca5afbf2.eu-west-1.amazon.com>
 <e33c055c-5a5a-2329-7a2e-faf715bb95fc@suse.com>
 <909fd3b2-19e8-8c13-6ede-cfd6051c6f1d@amazon.com>
 <5c4e4f3d-03ce-b517-d451-3229c0d542c0@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mfka=hj=amazon.de=prvs=6414f13c5=staskins@srs-us1.protection.inumbo.net>)
 id 1f9Vgd-0000pa-5g
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 13:02:47 +0000
In-Reply-To: <5c4e4f3d-03ce-b517-d451-3229c0d542c0@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: jakub.kicinski@netronome.com, mcroce@redhat.com, hpa@zytor.com, boris.ostrovsky@oracle.com, daniel@iogearbox.net, x86@kernel.org, mingo@redhat.com, xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, paul.durrant@citrix.com, stefanha@redhat.com, dsa@cumulusnetworks.com, tglx@linutronix.de, ggarcia@abra.uab.cat, axboe@kernel.dk, amir.jer.levy@intel.com, wei.liu2@citrix.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, dwmw@amazon.co.uk, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMjAvMTggMTU6MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMjAvMDQvMTggMTQ6
NTIsIHN0YXNraW5zQGFtYXpvbi5jb20gd3JvdGU6Cj4+IE9uIDA0LzIwLzE4IDEzOjI1LCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOgo+Pj4gT24gMjAvMDQvMTggMTI6NDcsIFN0YW5pc2xhdiBLaW5zYnVy
c2tpaSB3cm90ZToKPj4+PiArwqDCoMKgIGZvciAoZmkgPSAwOyBmaSA8IFhFTlZJRl9GSV9NQVg7
IGZpKyspIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgdmZpLT5mYXVsdHNbZmldID0geGVuX2ZpX2Rp
cl9hZGQodmZpLT5kaXIsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZW52
aWZfZmlfbmFtZXNbZmldKTsKPj4+IEhvdyBkb2VzIHRoaXMgd29yaz8geGVudmlmX2ZpX25hbWVz
W10gaXMgYW4gZW1wdHkgYXJyYXkgYW5kIHRoaXMgaXMgdGhlCj4+PiBvbmx5IHJlZmVyZW5jZSB0
byBpdC4gV2hvIGlzIGFsbG9jYXRpbmcgdGhlIG1lbW9yeSBmb3IgdGhhdCBhcnJheT8KPj4gV2Vs
bCwgaXQgd29ya3MgaW4gdGhlIHdheSBvbmUgYWRkcyBhIHZhciB0byBlbnVtICh3aGljaCBpcyB1
c2VkIGFzIGEga2V5Cj4+IGxhdGVyKSBhbmQgYSBjb3JyZXNwb25kaW5nIHN0cmluZyBpbnRvIHRo
ZSBhcnJheSAod2hpY2ggaXMgdXNlZCBhcyBhCj4+IG5hbWUgZm9yIHRoZSBmYXVsdCBkaXJlY3Rv
cnkgaW4gc3lzZnMpLgo+IFRoZW4geW91IHNob3VsZCBzaXplIHRoZSBhcnJheSB2aWEgWEVOVklG
X0ZJX01BWC4KCk1ha2VzIHNlbnNlLgpUaGFua3MhCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVy
IEdlcm1hbnkgR21iSApCZXJsaW4gLSBEcmVzZGVuIC0gQWFjaGVuCm1haW4gb2ZmaWNlOiBLcmF1
c2Vuc3RyLiAzOCwgMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBEci4gUmFsZiBIZXJi
cmljaCwgQ2hyaXN0aWFuIFNjaGxhZWdlcgpVc3QtSUQ6IERFMjg5MjM3ODc5CkVpbmdldHJhZ2Vu
IGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
