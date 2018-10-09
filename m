From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/5] xen/domain: Allocate d->vcpu[] earlier
 during domain_create()
Date: Tue, 09 Oct 2018 00:06:12 -0600
Message-ID: <5BBC455402000078001EFD01@prv1-mh.provo.novell.com>
References: <1538751289-1109-1-git-send-email-andrew.cooper3@citrix.com>
 <1538751289-1109-5-git-send-email-andrew.cooper3@citrix.com>
 <5BBB60EC02000078001EF9D6@prv1-mh.provo.novell.com>
 <176fb2cc-6dd2-24e6-84b3-3f8b754a5b02@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <176fb2cc-6dd2-24e6-84b3-3f8b754a5b02@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjEwLjE4IGF0IDE5OjM5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDgvMTAvMTggMTQ6NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNS4x
MC4xOCBhdCAxNjo1NCwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gQEAg
LTQwNSwxOSArNDE5LDYgQEAgc3RydWN0IGRvbWFpbiAqZG9tYWluX2NyZWF0ZShkb21pZF90IGRv
bWlkLAo+Pj4gIAo+Pj4gICAgICBpZiAoICFpc19pZGxlX2RvbWFpbihkKSApCj4+PiAgICAgIHsK
Pj4+IC0gICAgICAgIC8qIENoZWNrIGQtPm1heF92Y3B1cyBhbmQgYWxsb2NhdGUgZC0+dmNwdVtd
LiAqLwo+Pj4gLSAgICAgICAgZXJyID0gLUVJTlZBTDsKPj4+IC0gICAgICAgIGlmICggY29uZmln
LT5tYXhfdmNwdXMgPCAxIHx8Cj4+PiAtICAgICAgICAgICAgIGNvbmZpZy0+bWF4X3ZjcHVzID4g
ZG9tYWluX21heF92Y3B1cyhkKSApCj4+PiAtICAgICAgICAgICAgZ290byBmYWlsOwo+PiBBaCwg
dGhlcmUgaXQgZ29lcyBhd2F5LiBCdXQgSSB0aGluayBpdCB3b3VsZCBiZSBtb3JlIGxvZ2ljYWwg
Zm9yIHRoaXMgdG8KPj4gaGFwcGVuIGluIHRoZSBwcmV2aW91cyBwYXRjaC4gQW55d2F5Cj4+IFJl
dmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IGZvciBib3RoLCBw
cmVmZXJhYmx5IChidXQgbm90IG5lY2Vzc2FyaWx5KSB3aXRoIHRoZSByZW1vdmFsIG1vdmVkCj4+
IHRoZXJlLgo+IAo+IFRoZSB4ODYgc2lkZSBpcyB0cml2aWFsLCBidXQgdGhlIEFSTSBzaWRlIGlz
IG5vdC4gIEkgZG9uJ3QgdGhpbmsgcGF0Y2hlcwo+IDMgYW5kIDQgc2hvdWxkIGJlIG1lcmdlZCwg
YnV0IEknbGwgbGV0IEp1bGllbi9TdGVmYW5vIGhhdmUgdGhlIGZpbmFsIHNheS4KCkkgZGlkbid0
IHN1Z2dlc3QgbWVyZ2luZyB0aGUgcGF0Y2hlcywgSSdkIG1lcmVseSBsaWtlIHRvIHNlZQp0aGUg
cmVtb3ZhbCBhYm92ZSB0byBtb3ZlIGludG8gdGhlIGVhcmxpZXIgcGF0Y2gsIGFuZCB0aGUKeDg2
IHZhcmlhbnQgb2YgZG9tYWluX21heF92Y3B1cygpIGJlIGRyb3BwZWQgdGhlcmUKaW5zdGVhZCBv
ZiBoZXJlIChiZWNhdXNlIHRoYXQncyB3aGVyZSB0aGUgbmVlZCBmb3IgYm90aApsb2dpY2FsbHkg
ZGlzYXBwZWFycykuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
