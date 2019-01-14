From: Julien Grall <julien.grall@arm.com>
Subject: Re: PING ARM [PATCH v2] xen/cmdline: Fix buggy
 strncmp(s, LITERAL, ss - s) construct
Date: Mon, 14 Jan 2019 17:16:18 +0000
Message-ID: <cf0da64b-1dd5-8dfc-a041-cefe077dd0ff@arm.com>
References: <1546622255-9324-1-git-send-email-andrew.cooper3@citrix.com>
 <8161196e-b6ff-2ab1-eaa8-cdb5341ae178@citrix.com>
 <4f1859e5-c901-3e3e-ffc2-0e7233d1c794@arm.com>
 <5d7290c3-02e2-c54d-9a65-cc8b8019a4cc@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5d7290c3-02e2-c54d-9a65-cc8b8019a4cc@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMTQvMDEvMjAxOSAxNjo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAxNC8wMS8yMDE5IDE2OjA3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDE0LzAxLzIwMTkg
MTU6MTcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9lZmkvZWZpLWJvb3QuaCBiL3hlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaAo+Pj4+IGluZGV4
IGNhNjU1ZmYuLjIyYTg2ZWMgMTAwNjQ0Cj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2VmaS9lZmkt
Ym9vdC5oCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2VmaS9lZmktYm9vdC5oCj4+Pj4gQEAgLTIx
Miw3ICsyMTIsNyBAQCBFRklfU1RBVFVTIF9faW5pdAo+Pj4+IGZkdF9hZGRfdWVmaV9ub2RlcyhF
RklfU1lTVEVNX1RBQkxFICpzeXNfdGFibGUsCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGJyZWFrOwo+Pj4+ICDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgdHlwZSA9IGZkdF9nZXRwcm9w
KGZkdCwgbm9kZSwgImRldmljZV90eXBlIiwgJmxlbik7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGlm
ICggdHlwZSAmJiBzdHJuY21wKHR5cGUsICJtZW1vcnkiLCBsZW4pID09IDAgKQo+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBpZiAoIHR5cGUgJiYgbGVuID09IDYgJiYgc3RybmNtcCh0eXBlLCAibWVtb3J5
IiwgNikgPT0gMCApCj4+Cj4+IHN0cmluZyBwcm9wZXJ0eSB0ZXJtaW5hdGVzIHdpdGggTlVMIGFu
ZCBpcyBpbmNsdWRlZCBpbiB0aGUgbGVuLiBTbyBJCj4+IGRvbid0IHRoaW5rIHRoaXMgY2hhbmdl
IGlzIGNvcnJlY3QuCj4gCj4gQXJlIHlvdSBzYXlpbmcgdGhhdCBsZW4gaXMgNyBoZXJlIHRoZW4/
CgpZZXMuIEJ1dCBJIGRvbid0IHRoaW5rIHRoaXMgY2hhbmdlIGlzIG5lY2Vzc2FyeSBhcyB3ZSBh
bHJlYWR5IGluY2x1ZGUgTlVMIGluIHRoZSAKY29tcGFyaXNvbi4KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
