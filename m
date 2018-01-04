From: Chao Peng <chao.p.peng@linux.intel.com>
Subject: Re: [RFC XEN PATCH v4 03/41] hvmloader/util: do not
 compare characters after '\0' in strncmp
Date: Thu, 04 Jan 2018 14:23:21 +0800
Message-ID: <1515047001.3139.6.camel@linux.intel.com>
References: <20171207101030.22364-1-haozhong.zhang@intel.com>
 <20171207101030.22364-4-haozhong.zhang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20171207101030.22364-4-haozhong.zhang@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Haozhong Zhang <haozhong.zhang@intel.com>, xen-devel@lists.xen.org
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Dan Williams <dan.j.williams@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMDE3LTEyLTA3IGF0IDE4OjA5ICswODAwLCBIYW96aG9uZyBaaGFuZyB3cm90ZToK
PiAuLi4gdG8gbWFrZSBpdHMgYmVoYXZpb3IgdGhlIHNhbWUgYXMgQyBzdGFuZGFyZCAoZS5nLiwg
Qzk5IGFuZCBDMTEpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhhb3pob25nIFpoYW5nIDxoYW96aG9u
Zy56aGFuZ0BpbnRlbC5jb20+Cj4gLS0tCj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBD
YzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gLS0tCj4gwqB0b29scy9maXJtd2FyZS9odm1sb2FkZXIv
dXRpbC5jIHwgNyArKysrKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci91dGlsLmMKPiBiL3Rvb2xz
L2Zpcm13YXJlL2h2bWxvYWRlci91dGlsLmMKPiBpbmRleCAwYzNmMmQyNGNkLi43NmE2MWVlMDUy
IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci91dGlsLmMKPiArKysgYi90
b29scy9maXJtd2FyZS9odm1sb2FkZXIvdXRpbC5jCj4gQEAgLTE0MSw5ICsxNDEsMTYgQEAgaW50
IHN0cmNtcChjb25zdCBjaGFyICpjcywgY29uc3QgY2hhciAqY3QpCj4gwqBpbnQgc3RybmNtcChj
b25zdCBjaGFyICpzMSwgY29uc3QgY2hhciAqczIsIHVpbnQzMl90IG4pCj4gwqB7Cj4gwqDCoMKg
wqDCoHVpbnQzMl90IGN0cjsKPiArCj4gwqDCoMKgwqDCoGZvciAoY3RyID0gMDsgY3RyIDwgbjsg
Y3RyKyspCj4gK8KgwqDCoMKgewo+IMKgwqDCoMKgwqDCoMKgwqDCoGlmIChzMVtjdHJdICE9IHMy
W2N0cl0pCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gKGludCkoczFbY3RyXSAt
IHMyW2N0cl0pOwo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoGlmICghczFbY3RyXSkKCkNvZGluZyBz
dHlsZSwgYnV0LCB0aGUgb3JpZ2luYWwgY29kZSBhYm92ZSBoYXMgaXNzdWUgdG9vLgpCZXNpZGVz
IHRoaXMsIFJldmlld2VkLWJ5OiBDaGFvIFBlbmcgPGNoYW8ucC5wZW5nQGxpbnV4LmludGVsLmNv
bT4KCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ICvCoMKgwqDCoH0KPiArCj4g
wqDCoMKgwqDCoHJldHVybiAwOwo+IMKgfQo+IMKgCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
