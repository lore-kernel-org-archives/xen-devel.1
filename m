From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/6] xen: extend XEN_DOMCTL_memory_mapping
 to handle cacheability
Date: Fri, 26 Apr 2019 01:12:14 -0600
Message-ID: <5CC2AF4E0200007800229537@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-1-git-send-email-sstabellini@kernel.org>
 <5C766799020000780021AA28@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1904171359470.1370@sstabellini-ThinkPad-X260>
 <5CC18ED10200007800228FAD@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1904251523070.24598@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJv21-0001mP-ID
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 07:12:25 +0000
In-Reply-To: <alpine.DEB.2.10.1904251523070.24598@sstabellini-ThinkPad-X260>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA0LjE5IGF0IDAwOjMxLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gVGh1LCAyNSBBcHIgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEJ1dCBJIGFncmVl
IHdpdGggSnVsaWVuIChpbiBjYXNlIHRoaXMgd2Fzbid0IGV4cGxpY2l0IGVub3VnaCBmcm9tCj4+
IG15IGVhcmxpZXIgcmVwbGF5KSB0aGF0IGl0IGZpcnN0IG5lZWRzIHRvIGJlIGNsYXJpZmllZCB3
aGV0aGVyIHN1Y2gKPj4gYW4gaW50ZXJmYWNlIGlzIHdhbnRlZCBpbiB0aGUgZmlyc3QgcGxhY2Uu
Cj4gCj4gSSBoYXZlIHdyaXR0ZW4gZG93biBhIGZldyBtb3JlIGRldGFpbHMgYWJvdXQgdGhlIHVz
ZS1jYXNlIGVsc2V3aGVyZSwKPiBJJ2xsIGNvcHkvcGFzdGUgaGVyZToKPiAKPiAgIFhpbGlueCBN
UFNvQyBoYXMgdHdvIENvcnRleCBSNSBjcHVzIGluIGFkZGl0aW9uIHRvIGZvdXIgQ29ydGV4IEE1
MyBjcHVzCj4gICBvbiB0aGUgYm9hcmQuICBJdCBpcyBhbHNvIHBvc3NpYmxlIHRvIGFkZCBhZGRp
dGlvbmFsIENvcnRleCBNNCBjcHVzIGFuZAo+ICAgTWljcm9ibGF6ZSBjcHVzIGluIGZhYnJpYy4g
VGhlcmUgY291bGQgYmUgZG96ZW4gaW5kZXBlbmRlbnQgcHJvY2Vzc29ycy4KPiAgIFVzZXJzIG5l
ZWQgdG8gZXhjaGFuZ2UgZGF0YSBiZXR3ZWVuIHRoZSBoZXRlcm9nZW5lb3VzIGNwdXMuIFRoZXkg
dXN1YWxseQo+ICAgc2V0IHVwIHRoZWlyIG93biByaW5nIHN0cnVjdHVyZXMgb3ZlciBzaGFyZWQg
bWVtb3J5LCBvciB0aGV5IHVzZQo+ICAgT3BlbkFNUC4gIEVpdGhlciB3YXksIHRoZXkgbmVlZCB0
byBzaGFyZSBhIGNhY2hlYWJsZSBtZW1vcnkgcmVnaW9uCj4gICBiZXR3ZWVuIHRoZW0uICBUaGUg
TVBTb0MgaXMgdmVyeSBmbGV4aWJsZSBhbmQgdGhlIG1lbW9yeSByZWdpb24gY2FuIGNvbWUKPiAg
IGZyb20gYSBtdWx0aXR1ZGUgb2Ygc291cmNlcywgaW5jbHVkaW5nIGEgcG9ydGlvbiBvZiBub3Jt
YWwgbWVtb3J5LCBvciBhCj4gICBwb3J0aW9uIG9mIGEgc3BlY2lhbCBtZW1vcnkgYXJlYSBvbiB0
aGUgYm9hcmQuIFRoZXJlIGFyZSBhIGNvdXBsZSBvZgo+ICAgc3BlY2lhbCBTUkFNIGJhbmtzIDY0
SyBvciAyNTZLIGxhcmdlIHRoYXQgY291bGQgYmUgdXNlZCBmb3IgdGhhdC4gQWxzbywKPiAgIFBS
QU0gY2FuIGJlIGVhc2lseSBhZGRlZCBpbiBmYWJyaWMgYW5kIHVzZWQgZm9yIHRoZSBwdXJwb3Nl
Lgo+IAo+IEF0IHRoZSB2ZXJ5IGxlYXN0IHRvIGhhbmRsZSB0aGUgc3BlY2lhbCBtZW1vcnkgcmVn
aW9ucywgd2UgbmVlZCB0byBiZQo+IGFibGUgdG8gYWxsb3cgaW9tZW0gdG8gbWFwIHRoZW0gYXMg
Y2FjaGVhYmxlIG1lbW9yeSB0byBhIERvbVUuIFNvIEkgZG8KPiB0aGluayB3ZSBuZWVkIHRoaXMg
aW50ZXJmYWNlIGV4dGVuc2lvbi4KPiAKPiBMZXQgbWUga25vdyBpZiB5b3Ugc3RpbGwgaGF2ZSBh
bnkgZG91YnRzL3F1ZXN0aW9ucy4gT3RoZXJ3aXNlIEknbGwgd29yawo+IHRvd2FyZCByZXNwaW5u
aW5nIHRoZSBzZXJpZXMgaW4gdGhlIHByb3Bvc2VkIGRpcmVjdGlvbi4KCldlbGwsIGFzIGxvbmcg
YXMgSnVsaWVuIGFuZCB5b3UgYWdyZWUgdGhhdCBzdWNoIGFuIGludGVyZmFjZSBpcwpuZWVkZWQg
b24gQXJtLCB0aGlzIGlzIGZpbmUgd2l0aCBtZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
