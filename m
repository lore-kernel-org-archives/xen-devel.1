From: "Kang, Luwei" <luwei.kang@intel.com>
Subject: Re: [PATCH RESEND v1 1/7] x86: add a flag to enable
 Intel processor trace
Date: Fri, 27 Apr 2018 09:01:45 +0000
Message-ID: <82D7661F83C1A047AF7DC287873BF1E167F67428@SHSMSX101.ccr.corp.intel.com>
References: <1516039953-2988-1-git-send-email-luwei.kang@intel.com>
 <1516039953-2988-2-git-send-email-luwei.kang@intel.com>
 <5AE1C63A02000078001BEC72@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AE1C63A02000078001BEC72@prv1-mh.provo.novell.com>
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiA+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLm1hcmtkb3duCj4gPiArKysgYi9k
b2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93bgo+ID4gQEAgLTEwMDksNiArMTAwOSwx
MyBAQCBkZWJ1ZyBoeXBlcnZpc29yIG9ubHkpLgo+ID4gICMjIyBpZGxlXF9sYXRlbmN5XF9mYWN0
b3IKPiA+ICA+IGA9IDxpbnRlZ2VyPmAKPiA+Cj4gPiArIyMjIGludGVsXF9wdAo+ID4gKz4gYD0g
PGJvb2xlYW4+YAo+ID4gKwo+ID4gKz4gRGVmYXVsdDogYHRydWVgCj4gPiArCj4gPiArRmxhZyB0
byBlbmFibGUgSW50ZWwgUHJvY2Vzc29yIFRyYWNlLgo+IAo+IEkgYWdyZWUgd2l0aCB3aGF0IFdl
aSBoYXMgc2FpZC4gSW4gYWRkaXRpb24gcGxlYXNlIHVzZSBkYXNoZXMgaW4gcHJlZmVyZW5jZQo+
IHRvIHVuZGVyc2NvcmVzIGZvciBib3RoIGNvbW1hbmQgbGluZSBvcHRpb25zIGFuZCBmaWxlIG5h
bWVzIChuZWl0aGVyIG9mIHRoZQo+IHR3byBpcyBjb25zdHJhaW5lZCBieSBDIGlkZW50aWZpZXIg
bmFtaW5nIHJlc3RyaWN0aW9ucykuIFRoYXQgc2FpZCwgSSdtIGFmcmFpZAo+ICJwdCIgaXMgYW4g
YWNyb255bSB3ZSBjb21tb25seSBhc3NvY2lhdGUgd2l0aCBwYXNzLXRocm91Z2gsIHNvIGZvciBh
bGwgb2YgZmlsZQo+IG5hbWVzLCBjb21tYW5kIGxpbmUgb3B0aW9uLCBhbmQgaWRlbnRpZmllcnMg
SSdkIGxpa2UgdG8gYXNrIGZvciBhbiBhbHRlcm5hdGl2ZQo+IHRvIGJlIGZvdW5kLgo+ICJwdHJh
Y2UiIG1heSBiZSBhbiBvcHRpb24sIGFzIC0gb3RoZXIgdGhhbiBlLmcuIExpbnV4IC0gd2UgZG9u
J3QgYXNzb2NpYXRlIGFueQo+IG1lYW5pbmcgdG8gaXQuCj4gCkhpIEphbiwKICAgVGhhbmtzIGZv
ciB5b3UgcmV2aWV3LiAicHRyYWNlIiBtYWtlIG1lIGFzc29jaWF0ZSAic3RyYWNlIiwgImZ0cmFj
ZSIuIEFsdGhvdWdoIHRoZXkgYXJlIGNvbXBsZXRlICBkaWZmZXJlbnQgdGhpbmdzIGJ1dCBJIHRo
aW5rICJwdHJhY2UiIGlzIG5vdCBnb29kIGVub3VnaCB0byBwcmVzZW50ICJJbnRlbCBQcm9jZXNz
b3IgVHJhY2UiLgoKVGhhbmtzLApMdXdlaSBLYW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
