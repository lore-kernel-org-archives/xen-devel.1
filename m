From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.11] scripts/add_maintainers.pl: Don't
 call get_maintainers.pl with -f
Date: Tue, 12 Jun 2018 11:44:24 +0100
Message-ID: <b364326e-31c2-0635-ea70-b42d68f5d140@arm.com>
References: <20180605163938.28090-1-julien.grall@arm.com>
 <cc7b7fa2-1504-f801-60fc-c3470091fc93@suse.com>
 <83574C48-EFC2-42AE-901B-488F2E52D8F4@citrix.com>
 <f0908d19-4813-2f4d-5b01-9d9b30672e27@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f0908d19-4813-2f4d-5b01-9d9b30672e27@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>, Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNi8wNi8xOCAxMTowNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDA1
LzA2LzE4IDE5OjI2LCBMYXJzIEt1cnRoIHdyb3RlOgo+Pgo+Pgo+PiDvu79PbiAwNS8wNi8yMDE4
LCAxOToxNSwgIkp1ZXJnZW4gR3Jvc3MiIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pgo+PiDC
oMKgwqDCoCBPbiAwNS8wNi8xOCAxODozOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiDCoMKgwqDC
oCA+IFRoZSBvcHRpb24gLWYgb2Ygc2NyaXB0cy9nZXRfbWFpbnRhaW5lcnMucGwgd2lsbCByZXR1
cm4gdGhlIAo+PiBtYWludGFpbmVycwo+PiDCoMKgwqDCoCA+IG9mIGEgZ2l2ZW4gZmlsZSwgKm5v
dCogdGhlIGxpc3Qgb2YgbWFpbnRhaW5lcnMgaWYgdGhlIGZpbGUgd2FzIAo+PiBhIHBhdGNoLgo+
PiDCoMKgwqDCoCA+Cj4+IMKgwqDCoMKgID4gVGhlIG91dHB1dCBleHBlY3RlZCBvZiBhZGRfbWFp
bnRhaW5lcnMgaXMgdGhlIGxhdHRlciwgc28gZHJvcCAKPj4gdGhlIG9wdGlvbgo+PiDCoMKgwqDC
oCA+IC1mLgo+PiDCoMKgwqDCoCA+Cj4+IMKgwqDCoMKgID4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gwqDCoMKgwqAgUmVsZWFzZS1hY2tlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiBSZXZpZXdlZC1ieTogTGFycy5r
dXJ0aEBjaXRyaXguY29tCj4+Cj4+IFRoaXMgY2hhbmdlIGluIGJlaGF2aW91ciB3YXMgbWlzdGFr
ZW5seSBpbnRyb2R1Y2VkIGluIG9uZSBvZiB0aGUgbGF0ZXIgCj4+IHJldmlzaW9ucyAoY2FuJ3Qg
cmVjYWxsIHdoaWNoKSwgd2hlbiB3ZSByZWZhY3RvcmVkIHRoZSBjYWxsIHRvIAo+PiBnZXRfbWFp
bnRhaW5lcnMucGwKPiAKPiBUaGFuayB5b3UhIE90aGVyIHRoYW4gdGhhdCB0aGUgc2NyaXB0IGlz
IHdvcmtpbmcgcXVpdGUgd2VsbCBhbmQgc2F2ZSBtZSAKPiB0aW1lIHRvIGFkZCBhbGwgdGhlIEND
cy4KPiAKPiBJIHdpbGwgY29tbWl0IHRoZSBwYXRjaCBvbmNlIHdlIGJyYW5jaGVkLgoKSSB3YXMg
YWJvdXQgdG8gY29tbWl0IGJ1dCBJIGZvcmdvdCB0aGF0IEkgd291bGQgbmVlZCBhIGFjayBmcm9t
IHNvbWVvbmUgCmluICJUSEUgUkVTVCIuCgpDYW4gSSBnZXQgb25lIGZyb20gZWl0aGVyLCBBbmRy
ZXcsIEdlb3JnZSwgSWFuLCBKYW4sIFRpbSwgV2VpLCBTdGVmYW5vPwoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
