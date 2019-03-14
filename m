From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen/netfront: Remove unneeded .resume
 callback
Date: Thu, 14 Mar 2019 11:02:12 -0400
Message-ID: <ecc825e6-89d3-bbd5-5243-5cc66fa93045__6456.78750458814$1552575819$gmane$org@oracle.com>
References: <20190314131749.25706-1-andr2000@gmail.com>
 <c87d2bfb-b029-6c18-e3ad-cb798055f761@oracle.com>
 <6205819a-af39-8cd8-db87-f3fe047ff064@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yXQ8=RR=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1h4RsV-0008Iz-NL
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 15:02:39 +0000
In-Reply-To: <6205819a-af39-8cd8-db87-f3fe047ff064@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, netdev@vger.kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, jgross@suse.com, sstabellini@kernel.org, davem@davemloft.net
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8xNC8xOSAxMDo1MiBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4gT24g
My8xNC8xOSA0OjQ3IFBNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IE9uIDMvMTQvMTkgOTox
NyBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+PiBGcm9tOiBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+Pgo+Pj4g
Q3VycmVudGx5IG9uIGRyaXZlciByZXN1bWUgd2UgcmVtb3ZlIGFsbCB0aGUgbmV0d29yayBxdWV1
ZXMgYW5kCj4+PiBkZXN0cm95IHNoYXJlZCBUeC9SeCByaW5ncyBsZWF2aW5nIHRoZSBkcml2ZXIg
aW4gaXRzIGN1cnJlbnQgc3RhdGUKPj4+IGFuZCBuZXZlciBzaWduYWxpbmcgdGhlIGJhY2tlbmQg
b2YgdGhpcyBmcm9udGVuZCdzIHN0YXRlIGNoYW5nZS4KPj4+IFRoaXMgbGVhZHMgdG8gdGhlIG51
bWJlciBvZiBjb25zZXF1ZW5jZXM6Cj4+PiAtIHdoZW4gZnJvbnRlbmQgd2l0aGRyYXdzIGdyYW50
ZWQgcmVmZXJlbmNlcyB0byB0aGUgcmluZ3MgZXRjLiBpdAo+Pj4gY2Fubm90Cj4+PiDCoMKgIGJl
IGNsZWFubHkgZG9uZSBhcyB0aGUgYmFja2VuZCBzdGlsbCBob2xkcyB0aG9zZSAoaXQgd2FzIG5v
dCB0b2xkIHRvCj4+PiDCoMKgIGZyZWUgdGhlIHJlc291cmNlcykKPj4+IC0gaXQgaXMgbm90IHBv
c3NpYmxlIHRvIHJlc3VtZSBkcml2ZXIgb3BlcmF0aW9uIGFzIGFsbCB0aGUKPj4+IGNvbW11bmlj
YXRpb24KPj4+IMKgwqAgbWVhbnMgd2l0aCB0aGUgYmFja25lZCB3ZXJlIGRlc3Ryb3llZCBieSB0
aGUgZnJvbnRlbmQsIHRodXMKPj4+IMKgwqAgbWFraW5nIHRoZSBmcm9udGVuZCBhcHBlYXIgdG8g
dGhlIGd1ZXN0IE9TIGFzIGZ1bmN0aW9uYWwsIGJ1dAo+Pj4gwqDCoCBub3QgcmVhbGx5Lgo+Pgo+
PiBXaGF0IGRvIHlvdSBtZWFuPyBBcmUgeW91IHNheWluZyB0aGF0IGFmdGVyIHJlc3VtZSB5b3Ug
bG9zZQo+PiBjb25uZWN0aXZpdHk/Cj4gRXhhY3RseSwgaWYgeW91IHRha2UgYSBsb29rIGF0IHRo
ZSAucmVzdW1lIGNhbGxiYWNrIGFzIGl0IGlzIG5vdwo+IHdoYXQgaXQgZG9lcyBpdCBkZXN0cm95
cyB0aGUgcmluZ3MgZXRjLiBhbmQgbmV2ZXIgbm90aWZpZXMgdGhlIGJhY2tlbmQKPiBvZiB0aGF0
LCBlLmcuIGl0IHN0YXlzIGluLCBzYXksIGNvbm5lY3RlZCBzdGF0ZSB3aXRoIGNvbW11bmljYXRp
b24KPiBjaGFubmVscyBkZXN0cm95ZWQuIEl0IG5ldmVyIGdvZXMgaW50byBhbnkgb3RoZXIgWGVu
IGJ1cyBzdGF0ZSwgc28KPiB0aGVyZSBpcwo+IG5vIHdheSBpdHMgc3RhdGUgbWFjaGluZSBjYW4g
aGVscCByZWNvdmVyaW5nLgoKCk15IHRyZWUgaXMgYWJvdXQgYSBtb250aCBvbGQgc28gcGVyaGFw
cyB0aGVyZSBpcyBzb21lIHNvcnQgb2YgcmVncmVzc2lvbgpidXQgdGhpcyBjZXJ0YWlubHkgd29y
a3MgZm9yIG1lLiBBZnRlciByZXN1bWUgbmV0ZnJvbnQgZ2V0cwpYZW5idXNTdGF0ZUluaXRXYWl0
IGZyb20gYmFja2VuZCB3aGljaCBjYXVzZXMgeGVubmV0X2Nvbm5lY3QoKS4KCi1ib3JpcwoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
