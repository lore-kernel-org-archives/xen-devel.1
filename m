From: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH] livepatch-build-tools: Detect special
 section group sizes
Date: Tue, 16 Apr 2019 11:05:49 +0100
Message-ID: <1047159b-0061-fa64-c708-6c2be8b1f6b0@citrix.com>
References: <cc280176-7383-0600-9298-f6c981475245@rimuhosting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <cc280176-7383-0600-9298-f6c981475245@rimuhosting.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: glenn@rimuhosting.com, xen-devel <xen-devel@lists.xen.org>
Cc: Konrad Wilk <konrad.wilk@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8xMi8xOSA1OjUwIEFNLCBHbGVubiBFbnJpZ2h0IHdyb3RlOgo+IEEgcmVjZW50IHhzYSBs
aXZlcGF0Y2ggZmFpbGVkIHRvIGdlbmVyYXRlIGR1ZSB0byB0aGUgZm9sbG93aW5nCj4gbWVzc2Fn
ZSBpbiBjcmVhdGUtZGlmZi1vYmplY3QubG9nIC4uLgo+IAo+IC9saXZlcGF0Y2gtYnVpbGQtdG9v
bHMvY3JlYXRlLWRpZmYtb2JqZWN0OiBFUlJPUjogZ3JhbnRfdGFibGUubzoKPiBrcGF0Y2hfcmVn
ZW5lcmF0ZV9zcGVjaWFsX3NlY3Rpb246IDExNjI6IGdyb3VwIHNpemUgbWlzbWF0Y2ggZm9yIHNl
Y3Rpb24KPiAuYWx0aW5zdHJ1Y3Rpb25zCj4gCj4gVGhpcyBpcyBzaW1pbGFyIHRvIHRoZSBpc3N1
ZSByZXBvcnRlZCBhbmQgZml4ZWQgaW4KPiBodHRwczovL2dpdGh1Yi5jb20vZHludXAva3BhdGNo
L3B1bGwvNTI4IHdoaWNoIHNheXMgLi4uCj4gIkhhcmQtY29kaW5nIHRoZSBzcGVjaWFsIHNlY3Rp
b24gZ3JvdXAgc2l6ZXMgaXMgdW5yZWxpYWJsZS4KPiAgIEluc3RlYWQsIGRldGVybWluZSB0aGVt
IGR5bmFtaWNhbGx5IGJ5IGZpbmRpbmcgdGhlIHJlbGF0ZWQKPiAgIHN0cnVjdCBkZWZpbml0aW9u
cyBpbiB0aGUgRFdBUkYgbWV0YWRhdGEuIgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdsZW5uIEVucmln
aHQgPGdsZW5uQHJpbXVob3N0aW5nLmNvbT4KPiAtLS0KPiBDQzogUm9zcyBMYWdlcndhbGwgPHJv
c3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+Cj4gQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbT4KPiAKPiBUaGlzIHBhdGNoIHJlc3VsdGVkIGluIGEgbG9hZGFi
bGUgbGl2ZXBhdGNoLiBUaGUgYWx0IHNlY3Rpb24gc2l6ZSBpbiBteQo+IGNhc2Ugd2FzIGFjdHVh
bGx5IDE0LgpUaGFua3MgZm9yIHRoZSBwYXRjaCEKClJldmlld2VkLWJ5OiBSb3NzIExhZ2Vyd2Fs
bCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
