From: Liam Merwick <liam.merwick@oracle.com>
Subject: Re: [Qemu-devel] [RFC 1/3] pvh: Add x86/HVM direct boot
 ABI header file
Date: Fri, 21 Dec 2018 20:03:33 +0000
Message-ID: <a577be2e-8753-93ab-3034-a6288733e32f@oracle.com>
References: <1544049446-6359-1-git-send-email-liam.merwick@oracle.com>
 <1544049446-6359-2-git-send-email-liam.merwick@oracle.com>
 <20181211140124.GA23460@stefanha-x1.localdomain>
 <83b577e6-691e-08b3-e9e4-90651e988ff2@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yhup=O6=oracle.com=liam.merwick@srs-us1.protection.inumbo.net>)
 id 1gaR1K-000802-Jh
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 20:03:42 +0000
In-Reply-To: <83b577e6-691e-08b3-e9e4-90651e988ff2@oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: liam.merwick@oracle.com, ehabkost@redhat.com, mst@redhat.com, Maran Wilson <maran.wilson@oracle.com>, George Kennedy <george.kennedy@oracle.com>, xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, rth@twiddle.net, sgarzare@redhat.com
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMTIvMjAxOCAxNDo1NywgTGlhbSBNZXJ3aWNrIHdyb3RlOgo+IE9uIDExLzEyLzIwMTgg
MTQ6MDEsIFN0ZWZhbiBIYWpub2N6aSB3cm90ZToKPj4gT24gV2VkLCBEZWMgMDUsIDIwMTggYXQg
MTA6Mzc6MjRQTSArMDAwMCwgTGlhbSBNZXJ3aWNrIHdyb3RlOgo+Pj4gRnJvbTogTGlhbSBNZXJ3
aWNrIDxMaWFtLk1lcndpY2tAb3JhY2xlLmNvbT4KPj4+Cj4+PiBUaGUgeDg2L0hWTSBkaXJlY3Qg
Ym9vdCBBQkkgcGVybWl0cyBRZW11IHRvIGJlIGFibGUgdG8gYm9vdCBkaXJlY3RseQo+Pj4gaW50
byB0aGUgdW5jb21wcmVzc2VkIExpbnV4IGtlcm5lbCBiaW5hcnkgd2l0aG91dCB0aGUgbmVlZCB0
byBydW4gCj4+PiBmaXJtd2FyZS4KPj4+Cj4+PiDCoMKgwqDCoGh0dHBzOi8veGVuYml0cy54ZW4u
b3JnL2RvY3MvdW5zdGFibGUvbWlzYy9wdmguaHRtbAo+Pj4KPj4+IFRoaXMgY29tbWl0IGFkZHMg
dGhlIGhlYWRlciBmaWxlIHRoYXQgZGVmaW5lcyB0aGUgc3RhcnRfaW5mbyBzdHJ1Y3QKPj4+IHRo
YXQgbmVlZHMgdG8gYmUgcG9wdWxhdGVkIGluIG9yZGVyIHRvIHVzZSB0aGlzIEFCSS4KPj4+Cj4+
PiBTaWduZWQtb2ZmLWJ5OiBNYXJhbiBXaWxzb24gPE1hcmFuLldpbHNvbkBvcmFjbGUuY29tPgo+
Pj4gU2lnbmVkLW9mZi1ieTogTGlhbSBNZXJ3aWNrIDxMaWFtLk1lcndpY2tAb3JhY2xlLmNvbT4K
Pj4+IFJldmlld2VkLWJ5OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPEtvbnJhZC5XaWxrQG9yYWNs
ZS5jb20+Cj4+PiAtLS0KPj4+IMKgIGluY2x1ZGUvaHcveGVuL3N0YXJ0X2luZm8uaCB8IDE0NiAK
Pj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgMTQ2IGluc2VydGlvbnMoKykKPj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBpbmNsdWRlL2h3L3hlbi9zdGFydF9pbmZvLmgKPj4KPj4gRG9lcyBpdCBtYWtlIHNlbnNlIHRv
IGJyaW5nIGluIExpbnV4Cj4+IGluY2x1ZGUveGVuL2ludGVyZmFjZS9odm0vc3RhcnRfaW5mby5o
IHZpYSBRRU1VJ3MKPj4gaW5jbHVkZS9zdGFuZGFyZC1oZWFkZXJzLz8KPj4KPj4gUUVNVSBoYXMg
YSBzY3JpcHQgaW4gc2NyaXB0cy91cGRhdGUtbGludXgtaGVhZGVyLnNoIGZvciBzeW5jaW5nIExp
bnV4Cj4+IGhlYWRlcnMgaW50byBpbmNsdWRlL3N0YW5kYXJkLWhlYWRlcnMvLsKgIFRoaXMgbWFr
ZXMgaXQgZWFzeSB0byBrZWVwCj4+IExpbnV4IGhlYWRlciBmaWxlcyB1cC10by1kYXRlLsKgIFdl
IGJhc2ljYWxseSB0cmVhdCBmaWxlcyBpbgo+PiBpbmNsdWRlL3N0YW5kYXJkLWhlYWRlcnMvIGFz
IGF1dG8tZ2VuZXJhdGVkLgo+Pgo+PiBJZiB5b3UgZGVmaW5lIHN0YXJ0X2luZm8uaCB5b3Vyc2Vs
ZiB3aXRob3V0IHVzaW5nCj4+IGluY2x1ZGUvc3RhbmRhcmQtaGVhZGVycy8sIHRoZW4gaXQgd29u
J3QgYmUgc3luY2VkIHdpdGggTGludXguCj4+Cj4gCj4gVGhhdCBkb2VzIHNlZW0gYmV0dGVyLsKg
IEkgd2lsbCBtYWtlIHRoYXQgY2hhbmdlLgoKV2hlbiBhdHRlbXB0aW5nIHRvIGltcGxlbWVudCB0
aGlzLCBJIGZvdW5kIHRoZSBjYW5vbmljYWwgY29weSBvZiB0aGlzIApoZWFkZXIgZmlsZSBpcyBh
Y3R1YWxseSBpbiBYZW4gYW5kIHRoZSBMaW51eCBjb3B5IGlzIGtlcHQgaW4gc3luYyB3aXRoIAp0
aGF0LiAgQWxzbywgJ21ha2UgaGVhZGVyc19pbnN0YWxsJyBkb2Vzbid0IGluc3RhbGwgdGhvc2Ug
WGVuIGhlYWRlcnMuCgpJbnN0ZWFkIEkgdXBkYXRlZCB0aGUgY29tbWl0IGNvbW1lbnQgdG8gbWVu
dGlvbiB0aGUgY2Fub25pY2FsIGNvcHkgCmxvY2F0aW9uLiAgVGhpcyBmaWxlIGlzbid0IGV4cGVj
dGVkIHRvIGNoYW5nZSBtdWNoIHNvIEkgdGhpbmsga2VlcGluZyBpdCAKaW4gc3luYyBpbiBmdXR1
cmUgc2hvdWxkbid0IGJlIG9uZXJvdXMuCgpSZWdhcmRzLApMaWFtCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
