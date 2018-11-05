From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v4 1/6] docs/qemu-deprivilege: Revise and
 update with status and future plans
Date: Mon, 5 Nov 2018 18:08:27 +0000
Message-ID: <40d58f77-29a2-19aa-ddd1-ba0f11b3748f@citrix.com>
References: <20181105180711.20322-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k8cf=nq=citrix.com=prvs=840cd6c1a=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gJjIl-0000jR-4O
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 18:08:39 +0000
In-Reply-To: <20181105180711.20322-1-george.dunlap@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDUvMjAxOCAwNjowNyBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBkb2NzL3FlbXUt
ZGVwcml2aWxlZ2UudHh0IGhhZCBzb21lIGJhc2ljIGluc3RydWN0aW9ucyBmb3IgdXNpbmcKPiBk
bV9yZXN0cmljdCwgYnV0IGl0IHdhcyBpbmNvbXBsZXRlLCBtaXNsZWFkaW5nLCBhbmQgc3RhbGUu
Cj4gCj4gVXBkYXRlIHRoZSBkb2NzIGluIGEgbnVtYmVyIG9mIHdheXMuCj4gCj4gRmlyc3QsIHNl
cGFyYXRlIHVzZXItZmFjaW5nIGRvY3VtZW50YXRpb24gYW5kIHRlY2huaWNhbCBkZXNjcmlwdGlv
bgo+IGludG8gZG9jcy9mZWF0dXJlcyBhbmQgZG9jcy9kZXNpZ24sIHJlc3BlY3RpdmVseS4KPiAK
PiBJbiB0aGUgZmVhdHVyZSBkb2M6Cj4gCj4gKiBJbnRyb2R1Y2UgYSBzZWN0aW9uIG1lbnRpb25p
bmcgbWluaW1pbSB2ZXJzaW9ucyBvZiBMaW51eCwgWGVuLCBhbmQKPiBxZW11IHJlcXVpcmVkIChU
QkQpCj4gCj4gKiBGaXggdGhlIGRpc2N1c3Npb24gb2YgcWVtdSB1c2VyaWQuICBNZW50aW9uIHhl
bi1xZW11dXNlci1yYW5nZS1iYXNlLAo+IGFuZCBwcm92aWRlIGV4YW1wbGUgc2hlbGwgY29kZSB0
aGF0IGFjdHVhbGx5IGhhcyBzb21lIGhvcGUgb2Ygd29ya2luZwo+IChpbnN0ZWFkIG9mIGZhaWxp
bmcgb3V0IGFmdGVyIGNyZWF0aW5nIDkwMCB1c2VyaWRzKS4KPiAKPiAqIERlc2NyaWJlIGhvdyB0
byBlbmFibGUgcmVzdHJpY3Rpb25zLCBhcyB3ZWxsIGFzIGZlYXR1cmVzIHdoaWNoCj4gcHJvYmFi
bHkgZG9uJ3Qgb3IgZGVmaW5pdGVseSBkb24ndCB3b3JrLgo+IAo+IEluIHRoZSBkZXNpZ24gZG9j
LCBpbnRyb2R1Y2UgYSAiVGVjaG5pY2FsIERldGFpbHMiIHNlY3Rpb24gd2hpY2gKPiBkZXNjcmli
ZXMgc3BlY2lmaWNhbGx5IHdoYXQgcmVzdHJpY3Rpb25zIGFyZSBjdXJyZW50bHkgZG9uZSwgYW5k
IGFsc28KPiB3aGF0IHJlc3RyaWN0aW9ucyB3ZSBhcmUgbG9va2luZyBhdCBkb2luZyBpbiB0aGUg
ZnV0dXJlLgo+IAo+IFRoZSBpZGVhIGhlcmUgaXMgdGhhdCBhcyB3ZSBpbXBsZW1lbnQgdGhlIHZh
cmlvdXMgaXRlbXMgZm9yIHRoZQo+IGZ1dHVyZSwgd2UgbW92ZSB0aGVtIGZyb20gIlJlc3RyaWN0
aW9ucyBzdGlsbCB0byBkbyIgdG8gIlJlc3RyaWN0aW9ucwo+IGRvbmUiLiAgVGhpcyBjYW4gYWxz
byBhY3QgYXMgYSBkZXNpZ24gZG9jdW1lbnQgLS0gYSBwbGFjZSBmb3IgcHVibGljCj4gZGlzY3Vz
c2lvbiBvZiB3aGF0IGNhbiBvciBzaG91bGQgYmUgZG9uZSBhbmQgaG93Lgo+IAo+IEFsc28gYWRk
IGFuIGVudHJ5IHRvIFNVUFBPUlQubWQuCgpTb3JyeSwgSSB0aG91Z2h0IEknZCByZW1vdmVkIHRo
aXMgLS0gdGhlIFNVUFBPUlQubWQgY2hhbmdlcyBoYXZlIGJlZW4KbW92ZWQgdG8gYW5vdGhlciBm
aWxlLiAgSSBjYW4gZml4IHRoaXMgdXAgb24gY2hlY2staW4gaWYgbmVjZXNzYXJ5LgoKIC1HZW9y
Z2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
