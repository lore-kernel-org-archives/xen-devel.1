From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
Date: Tue, 14 May 2019 14:49:00 +0100
Message-ID: <8f1d8d76-b2a6-7443-a38b-201058b6e84d@arm.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <959c8975-ec44-a788-25b3-84ee17520abc@gmail.com>
 <24f3e2b1-4889-1780-0e48-0c909f555997@arm.com>
 <4ac886b5-ad15-f0cf-5af8-91aaf7d2460e@gmail.com>
 <7bbea412-f4af-4dc8-199a-1c02ac02a7af@arm.com>
 <f71bdb25-ebd3-31fc-f5fc-b8d591c3cc28@gmail.com>
 <5CDAAE4F020000780022E941@prv1-mh.provo.novell.com>
 <945c7543-7c49-f278-0b0d-5b6492ce93ca@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQXnl-0004DQ-TN
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 13:49:05 +0000
In-Reply-To: <945c7543-7c49-f278-0b0d-5b6492ce93ca@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNC8wNS8yMDE5IDE0OjA1LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IAo+IE9uIDE0
LjA1LjE5IDE1OjAyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gV2VsbCwgSSB0aGluayBKdWxpYW4n
cyBpbXBsaWNhdGlvbiB3YXMgdGhhdCB3ZSBjYW4ndCBzdXBwb3J0IGluIHBhcnRpY3VsYXIKPj4g
dGhlIGJvb3QgbG9hZGVyIC0+IGtlcm5lbCBoYW5kb3ZlciBjYXNlIHdpdGhvdXQgZXh0cmEgbWVh
c3VyZXMgKGlmCj4+IGF0IGFsbCksIGFuZCBoZW5jZSBoZSBhZGRlZCB0aGluZ3MgdG9nZXRoZXIg
YW5kIHNhaWQgd2hhdCByZXN1bHRzCj4+IGZyb20gdGhpcy4gT2YgY291cnNlIGlkZWFsbHkgd2Un
ZCByZWplY3QgbWl4ZWQgcmVxdWVzdHMsIGJ1dCB1bmxlc3MKPj4gc29tZW9uZSBjYW4gY29tZSB1
cCB3aXRoIGEgY2xldmVyIG1lYW5zIG9mIGhvdyB0byBkZXRlcm1pbmUgZW50aXR5Cj4+IGJvdW5k
YXJpZXMgSSdtIGFmcmFpZCB0aGlzIGlzIG5vdCBnb2luZyB0byBiZSBwb3NzaWJsZSB3aXRob3V0
IGJyZWFraW5nCj4+IGNlcnRhaW4gc2V0dXBzLgo+IAo+ICBGcm9tIG15IHVuZGVyc3RhbmRpbmcs
IGlmIHdlIGFyZSBzcGVha2luZyBvZiBkaWZmZXJlbnQgZW50aXRpZXMgaW4gYSBkb21haW4gYW5k
IAo+IHRoZWlyIGJvdW5kYXJpZXMsIHdlIGhhdmUgdG8gZGVmaW5lIHVucmVnaXN0ZXIgaW50ZXJm
YWNlIGFzIHdlbGwuIFNvIHRoYXQgdGhvc2UgCj4gZW50aXRpZXMgd291bGQgYmUgYWJsZSB0byB0
YWtlIGNhcmUgb2YgdGhlbXNlbHZlcyBleHBsaWNpdGx5LgoKWW91IGhhdmUgdG8ga2VlcCBpbiBt
aW5kIHRoYXQgZXhpc3RpbmcgT1MgaGF2ZSB0byBydW4gb24gbmV3ZXIgWGVuIHdpdGhvdXQgYW55
IAptb2RpZmljYXRpb24uCgpUaGUgZXhpc3RpbmcgaHlwZXJjYWxsIGFsbG93cyB5b3UgdG86CiAg
ICAxKSBEZS1yZWdpc3RlciBhbiBpbnRlcmZhY2UgdXNpbmcgdGhlIHZhbHVlIDAuCiAgICAyKSBS
ZXBsYWNpbmcgYSBjdXJyZW50IGV4aXN0aW5nIGludGVyZmFjZQoKWW91IHByb2JhYmx5IGNhbid0
IHVzZSAyKSBmb3IgYSBib290bG9hZGVyIC0+IGtlcm5lbCBoYW5kb3ZlciBiZWNhdXNlIHdlIGFy
ZSAKZGVhbGluZyB3aXRoIGd1ZXN0IHZpcnR1YWwgYWRkcmVzcy4gVGhlcmUgaXMgYW4gaGlnaCBj
aGFuY2UgdGhlIHZpcnR1YWwgYWRkcmVzcyAKc3BhY2UgbGF5b3V0IGlzIGdvaW5nIHRvIGJlIGRp
ZmZlcmVudCBvciBldmVuIHR1cm5pbmcgb2ZmIE1NVSBmb3IgYSBiaXQgKGRvbmUgb24gCkFybSku
IFNvIHlvdSBoYXZlIHRvIHVzZSAxKSBvdGhlcndpc2UgeW91IG1pZ2h0IHdyaXRlIGluIGEgcmFu
ZG9tIHBsYWNlIGluIG1lbW9yeS4KCkkgYW0gbm90IGVudGlyZWx5IHN1cmUgd2hldGhlciB0aGVy
ZSBhcmUgYWN0dWFsIHZhbHVlIGZvciAyKS4gVGhlIG9ubHkgcmVhc29uIEkgCmNhbiB0aGluayBv
ZiBpcyBpZiB5b3Ugd2FudCB0byBtb3ZlIGFyb3VuZCB0aGUgcnVuc3RhdGUgaW4geW91ciB2aXJ0
dWFsIGFkZHJlc3MgCnNwYWNlLiBCdXQgdGhhdCdzIHNvdW5kcyBhIGJpdCB3ZWlyZCBhdCBsZWFz
dCBvbiBBcm0uCgpGb3IgdGhlIG5ldyBoeXBlcmNhbGwsIEkgdGhpbmsgd2UgYXQgbGVhc3Qgd2Fu
dCAxKSAod2l0aCBhIG1hZ2ljIHZhbHVlIFRCRCkuIDIpIAptaWdodCBiZSBoZWxwZnVsIGluIHRo
ZSBjYXNlIHRoZSBib290bG9hZGVyIGRpZG4ndCBkbyB0aGUgcmlnaHQgdGhpbmcgb3Igd2UgYXJl
IAp1c2luZyBLZXhlYyB0byBib290IGEgbmV3IGtlcm5lbC4gVGhpcyB3b3VsZCBhbHNvIGJlIHNh
ZmVyIGFzIHBoeXNpY2FsIGFkZHJlc3MgCmNvdWxkIGJlIGV4Y2x1ZGVkIG1vcmUgZWFzaWx5LgoK
Mikgc2hvdWxkIG5vdCBiZSB0b28gZGlmZmljdWx0IHRvIGltcGxlbWVudC4gSXQgaXMganVzdCBh
IG1hdHRlciBvZiBjbGVhbi11cCAKd2hhdGV2ZXIgd2FzIHVzZWQgcHJldmlvdXMgYmVmb3JlIHJl
Z2lzdGVyaW5nIHRoZSBuZXcgaW50ZXJmYWNlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
