From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.11] x86/ioreq: Fix build from a
 collision of c/s f46b61973 and c/s 6e387461ed
Date: Mon, 9 Apr 2018 10:42:41 +0100
Message-ID: <2989f51b-c1f8-c335-9968-d6da072b0bb9@arm.com>
References: <1523037421-12880-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1523037421-12880-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwNi8wNC8xOCAxODo1NywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBEcm9wIHRoZSBf
bWZuKCkgd3JhcHBlcnMgbm93IHRoYXQgcGFnZV90b19tZm4oKSByZXR1cm5zIHRoZSBjb3JyZWN0
IHR5cGUuCgpTb3JyeSBmb3IgdGhlIGJyZWFrYWdlOgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNo
IDxKQmV1bGljaEBzdXNlLmNvbT4KPiBDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
PiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBDQzogUGF1bCBEdXJy
YW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiBDQzogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgo+IC0tLQo+ICAgeGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jIHwgNCArKy0tCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgYi94ZW4vYXJjaC94ODYvaHZtL2lv
cmVxLmMKPiBpbmRleCAzYTIwMWY1Li45MDUxMzI5IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vaW9yZXEuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwo+IEBAIC05NzMs
MTIgKzk3MywxMiBAQCBpbnQgaHZtX2dldF9pb3JlcV9zZXJ2ZXJfZnJhbWUoc3RydWN0IGRvbWFp
biAqZCwgaW9zZXJ2aWRfdCBpZCwKPiAgICAgICAgICAgaWYgKCAhSEFORExFX0JVRklPUkVRKHMp
ICkKPiAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICAgCj4gLSAgICAgICAgKm1mbiA9IF9tZm4o
cGFnZV90b19tZm4ocy0+YnVmaW9yZXEucGFnZSkpOwo+ICsgICAgICAgICptZm4gPSBwYWdlX3Rv
X21mbihzLT5idWZpb3JlcS5wYWdlKTsKPiAgICAgICAgICAgcmMgPSAwOwo+ICAgICAgICAgICBi
cmVhazsKPiAgIAo+ICAgICAgIGNhc2UgWEVOTUVNX3Jlc291cmNlX2lvcmVxX3NlcnZlcl9mcmFt
ZV9pb3JlcSgwKToKPiAtICAgICAgICAqbWZuID0gX21mbihwYWdlX3RvX21mbihzLT5pb3JlcS5w
YWdlKSk7Cj4gKyAgICAgICAgKm1mbiA9IHBhZ2VfdG9fbWZuKHMtPmlvcmVxLnBhZ2UpOwo+ICAg
ICAgICAgICByYyA9IDA7Cj4gICAgICAgICAgIGJyZWFrOwo+ICAgCj4gCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
