From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 00/20] drop useless LIST_HEAD
Date: Sat, 29 Dec 2018 07:19:35 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1812290717010.2673__34807.050220161$1546064303$gmane$org@hadrien>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
 <CAKR_QVJefW1vxYb7-qiU8=0YdbFghYo15SK2eGjOC-dntRfyYA@mail.gmail.com>
 <alpine.DEB.2.21.1812232304130.2940@hadrien>
 <CAKR_QVLeZBL43W4x1mzcfcakSZyyh9L81vgUMxfnSccKawEfdg@mail.gmail.com>
 <20181227134055.GA2272@kadam> <20181229052504.GA16315@magnolia>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mDR3=PG=lip6.fr=julia.lawall@srs-us1.protection.inumbo.net>)
 id 1gd7yF-0001zC-5h
 for xen-devel@lists.xenproject.org; Sat, 29 Dec 2018 06:19:39 +0000
In-Reply-To: <20181229052504.GA16315@magnolia>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: linux-wireless@vger.kernel.org, linux-nfs@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, linux-btrfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Tom Psyborg <pozega.tomislav@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiBGcmksIDI4IERlYyAyMDE4LCBEYXJyaWNrIEouIFdvbmcgd3JvdGU6Cgo+IE9uIFRodSwg
RGVjIDI3LCAyMDE4IGF0IDA0OjQwOjU1UE0gKzAzMDAsIERhbiBDYXJwZW50ZXIgd3JvdGU6Cj4g
PiBPbiBUdWUsIERlYyAyNSwgMjAxOCBhdCAxMToxMjoyMFBNICswMTAwLCBUb20gUHN5Ym9yZyB3
cm90ZToKPiA+ID4gdGhlcmUgd2FzIGRpc2N1c3Npb24gYWJvdXQgdGhpcyBqdXN0IHNvbWUgZGF5
cyBhZ28uIENDIDQtNSBsaXN0cyBpcwo+ID4gPiBtb3JlIHRoYW4gZW5vdWdoCj4gPiA+Cj4gPgo+
ID4gSSBkb24ndCBrbm93IHdobyB5b3Ugd2VyZSBkaXNjdXNzaW5nIHRoaXMgd2l0aC4uLgo+ID4K
PiA+IFlvdSBzaG91bGQgQ0MgdGhlIDB0aCBwYXRjaCB0byBhbGwgdGhlIG1haWxpbmdsaXN0cy4g
IFRoYXQgbXVjaCBpcyBhCj4gPiBjbGVhciBydWxlLgo+ID4KPiA+IEZvciB0aGUgcmVzdCwgSnVs
aWEncyBwb3NpdGlvbiBpcyB0aGUgbW9yZSBjb25zZXJ2YXRpdmUgb25lLiAgSSB3YXMgaW4KPiA+
IGEgY29udmVyc2F0aW9uIGluIFJMIGFuZCB0aGV5IHdlcmUgbGlrZSwgIkNDIGV2ZXJ5b25lIGZv
ciBhbGwgdGhlCj4gPiBwYXRjaGVzIi4gIEl0IGRlcGVuZHMgb24gdGhlIGNvbnRleHQsIG9mIGNv
dXJzZS4gIElmIHRoZSBwYXRjaGVzIGFyZQo+ID4gZGVwZW5kZW50IG9uIGVhY2ggb3RoZXIgdGhl
biB5b3UgKmhhdmUqIHRvIENDIGV2ZXJ5b25lIGZvciBldmVyeXRoaW5nLgo+Cj4gQWdyZWVkLiAg
TXMuIExhd2FsbCwgc2VuZGluZyAiQ292ZXIgbGV0dGVyICsgYWxsIHJlbGV2YW50IFhGUyBwYXRj
aGVzIgo+IChhcyB5b3UgZGlkKSB3YXMgZXhhY3RseSB0aGUgcmlnaHQgdGhpbmcgZm9yIHVzIHhm
cyB0eXBlcy4gOikKPgo+IEZvciB0aGF0IG1hdHRlciwgd2UgcHJlZmVyIHRvIHJlY2VpdmUgdGhy
b3VnaCBsaW51eC14ZnMgbW9yZSBwYXRjaGVzCj4gdGhhbiBuZWNlc3NhcnkgKG9uZSBjYW4gc2Vu
ZCB0aGUgZW50aXJlIHNlcmllcyBpZiBvbmUgaXMgdW5zdXJlKSB0aGFuIHRvCj4gZ28gd2FudGlu
ZyBmb3IgbW9yZSBjb250ZXh0LgoKVGhhbmtzIGZvciB0aGUgY29uZmlybWF0aW9uLiAgSSB3YXMg
cGxhbm5pbmcgdG8gaWdub3JlIHRoZSA0LTUgYWR2aWNlLApiZWNhdXNlIHRoZXJlIGlzIG5vIHdh
eSBpbiB0aGlzIGNhc2UgdG8gbWFrZSBhIG1lYW5pbmdmdWwgNC01IGxpc3QKc3VnZ2VzdGlvbiAt
IGl0J3MgZWl0aGVyIGFsbCBvciBub3RoaW5nLiAgQnV0IDIwIHBhdGNoZXMgYXQgb25jZSBpcwpw
ZXJoYXBzIGEgbG90IGFzIHdlbGwuICBJbiB0aGlzIGNhc2UsIEkganVzdCB3YW50ZWQgdG8gZ2V0
IHJpZCBvZiB0aGUKd2hvbGUgaXNzdWUgYXQgb25jZS4KCmp1bGlhCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
