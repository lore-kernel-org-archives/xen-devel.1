From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v9] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Mon, 1 Oct 2018 15:25:36 +0100
Message-ID: <83edf05c-8fcd-e9e2-1076-cc70d206ffb2@citrix.com>
References: <20180607130829.18811-1-olaf@aepfle.de>
 <20180626191113.2d8e6876.olaf@aepfle.de>
 <20180801181747.170405d8.olaf@aepfle.de>
 <20180913093913.328a523a.olaf@aepfle.de>
 <20180928155052.5d7f66db.olaf@aepfle.de>
 <23473.64592.699718.316856@mariner.uk.xensource.com>
 <5BB2044402000078001ED2E9@prv1-mh.provo.novell.com>
 <f9dc52a3-8f75-d652-ed78-731930017276@citrix.com>
 <5BB2287702000078001ED4A3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BB2287702000078001ED4A3@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDEvMjAxOCAwMzowMCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDEuMTAu
MTggYXQgMTU6MzgsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiAxMC8w
MS8yMDE4IDEyOjI1IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IEkgdGhpbmsgdGhlIG1haW4g
Y29uY2Vybgo+Pj4gd2FzIHdpdGggdGhlIHdheSBtaWdyYXRpb24gb2YgdGhlIG5ldyB2YWx1ZSB3
YXMgaW1wbGVtZW50ZWQuIEJ1dCBJCj4+PiByZWFsbHkgaGF2ZSB0byBkZWZlciB0byBBbmRyZXcg
Zm9yIHRoYXQsIGlycmVzcGVjdGl2ZSBvZiBoaW0gbm90Cj4+PiBoYXZpbmcgcmVzcG9uZGVkIChv
biB0aGUgbGlzdCkgdG8gcHJpb3IgcGluZ3MuCj4+Cj4+IElzIEFuZHJldyByZWFsbHkgdGhlIG9u
bHkgcGVyc29uIHdobyBrbm93cyBlbm91Z2ggYWJvdXQgbWlncmF0aW9uIHRvCj4+IGdpdmUgdGhp
cyB0aGUgdGh1bWJzLXVwPwo+IAo+IFRoYXQncyBub3QgdGhlIHBvaW50IGhlcmUsIGF0IGxlYXN0
IGFmYWljOiBIZSBoYWQgdm9pY2VkIF9zb21lXwo+IGNvbmNlcm4gb24gYW4gZWFybGllciB2ZXJz
aW9uLiBJbiBzdWNoIGEgY2FzZSBpdCBpcywgSSB0aGluaywgb25seQo+IGFwcHJvcHJpYXRlIHRv
IHdhaXQgd2l0aCBjb21taXR0aW5nIHVudGlsIHRoZXJlIHdhcyBpbmRpY2F0aW9uCj4gdGhhdCB0
aGUgY29uY2VybnMgd2VyZSBzdWZmaWNpZW50bHkgYWRkcmVzc2VkICh2ZXJiYWxseSBvciBieQo+
IGFkanVzdG1lbnRzIHRvIHRoZSBjb2RlKS4KClJpZ2h0IC0tIGJ1dCBpdCdzIG5vdCB5b3VyIGpv
YiB0byBtYWtlIHN1cmUgdGhlIG1pZ3JhdGlvbiBzdHVmZiBpcwpwcm9wZXJseSBhZGRyZXNzZWQ7
IGl0J3MgV2VpIGFuZCBJYW4ncyBqb2IuICBXZWkncyBSLWIgd2FzIGEgc3RhdGVtZW50CmZyb20g
aGltIHRoYXQgdGhlIGNvZGUgd2FzIGdvb2Q7IHdoZW4gQW5keSBxdWVzdGlvbmVkIHRoYXQsIEkg
dGhpbmsgaXQKd2FzIHRoZW4gKldlaSdzKiBqb2IgdG8gYWRkcmVzcyB0aGUgcXVlc3Rpb24sIG5v
dCB5b3VycyBvciBBbmR5J3MgKG9yCmV2ZW4gT2xhZidzKS4gIElmIFdlaSBzYXlzLCAiSSd2ZSBj
b25zaWRlcmVkIEFuZHkncyBvYmplY3Rpb25zIGFuZCBJCnRoaW5rIHRoZSBwYXRjaCBpcyBmaW5l
IGFzLWlzIiwgdGhlbiBpdCBjYW4gYmUgY2hlY2tlZCBpbiAoZ2l2ZW4gYQpyZWFzb25hYmxlIGFt
b3VudCBvZiB0aW1lIGZvciBBbmR5IHRvIHJlc3BvbmQpOyBhbmQgV2VpIGNhbiBvd24gd2hhdGV2
ZXIKY29uc2VxdWVuY2VzIHRoZXJlIGFyZS4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
