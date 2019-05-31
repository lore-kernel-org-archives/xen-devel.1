From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 54/60] xen/sched: add minimalistic idle
 scheduler for free cpus
Date: Fri, 31 May 2019 18:44:23 +0200
Message-ID: <386b50b3-e396-181a-8217-b34c547ab0fc@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-55-jgross@suse.com>
 <0c912c719f7fe4fcfcc329f90303b7c985c43c34.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hWkdo-00024M-4W
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 16:44:28 +0000
In-Reply-To: <0c912c719f7fe4fcfcc329f90303b7c985c43c34.camel@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDUvMjAxOSAxNzo1MiwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gVHVlLCAyMDE5
LTA1LTI4IGF0IDEyOjMzICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBJbnN0ZWFkIG9m
IGhhdmluZyBhIGZ1bGwgYmxvd24gc2NoZWR1bGVyIHJ1bm5pbmcgZm9yIHRoZSBmcmVlIGNwdXMK
Pj4gYWRkIGEgdmVyeSBtaW5pbWFsaXN0aWMgc2NoZWR1bGVyIGZvciB0aGF0IHB1cnBvc2Ugb25s
eSBldmVyCj4+IHNjaGVkdWxpbmcKPj4gdGhlIHJlbGF0ZWQgaWRsZSB2Y3B1LiBUaGlzIGhhcyB0
aGUgYmlnIGFkdmFudGFnZSBvZiBub3QgbmVlZGluZyBhbnkKPj4gcGVyLWNwdSwgcGVyLWRvbWFp
biBvciBwZXItc2NoZWR1bGluZyB1bml0IGRhdGEgZm9yIGZyZWUgY3B1cyBhbmQgaW4KPj4gdHVy
biBzaW1wbGlmeWluZyBtb3ZpbmcgY3B1cyB0byBhbmQgZnJvbSBjcHVwb29scyBhIGxvdC4KPj4K
Pj4gQXMgdGhpcyBuZXcgc2NoZWR1bGVyIGlzIG5vdCB1c2VyIHNlbGVjdGFibGUgZG9uJ3QgcmVn
aXN0ZXIgaXQgYXMgYW4KPj4gb2ZmaWNpYWwgc2NoZWR1bGVyLCBidXQganVzdCBpbmNsdWRlIGl0
IGluIHNjaGVkdWxlLmMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KPj4gLS0tCj4+IFYxOiBuZXcgcGF0Y2gKPj4gLS0tCj4gCj4+IC0tLSBhL3hl
bi9jb21tb24vc2NoZWR1bGUuYwo+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAg
LTgzLDYgKzgzLDU3IEBAIGV4dGVybiBjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyCj4+ICpfX3N0YXJ0
X3NjaGVkdWxlcnNfYXJyYXlbXSwgKl9fZW5kX3NjaGVkdWxlcnNfYXJyCj4+ICAKPj4gIHN0YXRp
YyBzdHJ1Y3Qgc2NoZWR1bGVyIF9fcmVhZF9tb3N0bHkgb3BzOwo+PiAgCj4+IFsuLi5dCj4+Cj4+
ICtzdGF0aWMgdm9pZCAqCj4+ICtzY2hlZF9pZGxlX2FsbG9jX3ZkYXRhKGNvbnN0IHN0cnVjdCBz
Y2hlZHVsZXIgKm9wcywgc3RydWN0Cj4+IHNjaGVkX3VuaXQgKnVuaXQsCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHZvaWQgKmRkKQo+PiArewo+PiArICAgIC8qIEFueSBub24tTlVMTCBwb2lu
dGVyIGlzIGZpbmUgaGVyZS4gKi8KPj4gKyAgICByZXR1cm4gKHZvaWQgKikxVUw7Cj4+ICt9Cj4+
ICsKPiBJIHRoaW5rIHRoZSBwcm9wZXIgdGhpbmcgdG8gZG8sIGhlcmUsIHdvdWxkIGJlIHRvIGNv
bnZlcnQgYWxsb2NfdmRhdGEoKQo+IHRvIFBUUl9FUlIoKSAmIElTX0VSUigpLgo+IAo+IFRoYXQn
cyBhbm90aGVyIHBhdGNoLCBvZiBjb3Vyc2UsIGFuZCBnaXZlbiB0aGF0IHRoaXMgc2VyaWVzIGlz
IHJhdGhlcgo+IGJpZyBhbHJlYWR5LCBJJ20gbm90IHN1cmUgYWJvdXQgYXNraW5nIGZvciBpdCB0
byBiZSBkb25lIGluIHRoZSBjb250ZXh0Cj4gb2YgdGhpcyB3b3JrLgo+IAo+IEkgY2FuIGRvIGl0
IG15c2VsZiwgZWl0aGVyIHJpZ2h0IG5vdyBvciBhZnRlciB0aGlzIHNlcmllcyBpcyBtZXJnZWQK
PiAoZm9yIHRoZSBzYWtlIG9mIG5vdCBtYWtpbmcgcmViYXNpbmcgNjAgcGF0Y2hlcyBtb3JlIGNv
bXBsaWNhdGVkIHRoYW4KPiBpdCBtdXN0IGJlIGFscmVhZHksIGZvciB5b3UgOi1EKS4KPiAKPiBM
ZXQgbWUga25vdyB3aGF0IHlvdSB0aGluay4KClRoZXJlIGlzIG9ubHkgb25lIHBsYWNlIGxlZnQg
d2hlcmUgYWxsb2NfdmRhdGEgaXMgYmVpbmcgY2FsbGVkIGZvciB0aGUKaWRsZSBzY2hlZHVsZXIs
IGFuZCB0aGF0IGlzIHNjaGVkX2luaXRfdmNwdSgpIG9mIGFuIGlkbGUgdmNwdS4KCkkgaGF2ZSBw
bGFubmVkIHRvIGRvIGEgZm9sbG93dXAgc2VyaWVzIGNsZWFuaW5nIHVwIHRoZSBzY2hlZHVsaW5n
IHN0dWZmCndoZXJlIEkgY2FuIGFkZCBhIHBhdGNoIHNwZWNpYWwgY2FzaW5nIHRoYXQgYW5kIHJl
bW92aW5nCnNjaGVkX2lkbGVfYWxsb2NfdmRhdGEoKS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
