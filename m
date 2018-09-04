From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/5] xen/domain: Prepare data for is_{pv,
 hvm}_domain() as early as possible
Date: Tue, 4 Sep 2018 13:17:18 +0100
Message-ID: <88c1b1b8-3041-3815-4741-3a1f7a2c4edd@citrix.com>
References: <1535986020-15906-1-git-send-email-andrew.cooper3@citrix.com>
 <1535986020-15906-2-git-send-email-andrew.cooper3@citrix.com>
 <5B8D5B4F02000078001E4C4E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B8D5B4F02000078001E4C4E@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDkvMTggMTc6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAtLS0gYS94ZW4vY29tbW9u
L2RvbWFpbi5jCj4+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMKPj4gQEAgLTI3Miw4ICsyNzIs
MTIgQEAgc3RydWN0IGRvbWFpbiAqZG9tYWluX2NyZWF0ZShkb21pZF90IGRvbWlkLAo+PiAgICAg
IGlmICggKGQgPSBhbGxvY19kb21haW5fc3RydWN0KCkpID09IE5VTEwgKQo+PiAgICAgICAgICBy
ZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKPj4gIAo+PiArICAgIC8qIFNvcnQgb3V0IG91ciBpZGVh
IG9mIGlzX3N5c3RlbV9kb21haW4oKS4gKi8KPj4gICAgICBkLT5kb21haW5faWQgPSBkb21pZDsK
Pj4gIAo+PiArICAgIC8qIERlYnVnIHNhbml0eS4gKi8KPj4gKyAgICBBU1NFUlQoaXNfc3lzdGVt
X2RvbWFpbihkKSA/IGNvbmZpZyA9PSBOVUxMIDogY29uZmlnICE9IE5VTEwpOwo+IFdvdWxkIHlv
dSBtaW5kIHNob3J0ZW5pbmcgdGhpcyB0byBhdCBsZWFzdAo+Cj4gICAgIEFTU0VSVChpc19zeXN0
ZW1fZG9tYWluKGQpID8gIWNvbmZpZyA6IGNvbmZpZyk7Cj4KPiB3aGlsZSB5b3UgbW92ZSBpdD8K
ClVuZm9ydHVuYXRlbHkgbm90LgoKZG9tYWluLmM6IEluIGZ1bmN0aW9uIOKAmGRvbWFpbl9jcmVh
dGXigJk6CmRvbWFpbi5jOjI5Njo2NzogZXJyb3I6IHBvaW50ZXIvaW50ZWdlciB0eXBlIG1pc21h
dGNoIGluIGNvbmRpdGlvbmFsCmV4cHJlc3Npb24gWy1XZXJyb3JdCsKgwqDCoMKgIEFTU0VSVChp
c19zeXN0ZW1fZG9tYWluKGQpID8gIWNvbmZpZyA6IGNvbmZpZyk7CsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBeCmNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCi9sb2NhbC94ZW4u
Z2l0L3hlbi9SdWxlcy5tazoxOTQ6IHJlY2lwZSBmb3IgdGFyZ2V0ICdkb21haW4ubycgZmFpbGVk
Cgp3aGljaCByZW1pbmRzIG1lIHdoeSBJIHdyb3RlIGl0IHRoZSB3YXkgSSBkaWQgb3JpZ2luYWxs
eS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
