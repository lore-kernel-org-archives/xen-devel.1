From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 05/20] arm/boot: Mark construct_dom0() as
 __init
Date: Tue, 20 Mar 2018 08:31:07 +0000
Message-ID: <9dbf9e0e-738b-589b-3792-4f75b1041c2d@arm.com>
References: <1521486839-25617-1-git-send-email-andrew.cooper3@citrix.com>
 <1521486839-25617-6-git-send-email-andrew.cooper3@citrix.com>
 <a4ba8c4c-7b22-154e-57c7-0a24fbf3a47c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a4ba8c4c-7b22-154e-57c7-0a24fbf3a47c@arm.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8yMC8yMDE4IDAzOjQwIEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgQW5kcmV3
LAo+IAo+IE9uIDAzLzE5LzIwMTggMDc6MTMgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IEl0
cyBzb2xlIGNhbGxlciwgc3RhcnRfeGVuKCksIGlzIF9faW5pdC4KPiAKPiBBY3R1YWxseSwgbW9z
dCBvZiB0aGF0IGZpbGVzIGNvdWxkIGJlbmVmaXRzIG9mIF9faW5pdCBhcyB0aGlzIGlzIGRvbWFp
biAKPiBvbmx5IGJ1aWxkLgo+IAo+IEluIGFueSBjYXNlLCB0aGlzIHBhdGNoIGlzIGFscmVhZHkg
YSBnb29kIHN0YXJ0LiBTbzoKPiAKPiBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KCkNvbW1pdHRlZC4KCkNoZWVycywKCj4gCj4gQ2hlZXJzLAo+IAo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+
PiAtLS0KPj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4K
Pj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+IC0tLQo+PiDCoCB4
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAyICstCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4+IGluZGV4
IDI4ZWU4NzYuLjllZjkwMzAgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPj4gQEAgLTIwOTQsNyAr
MjA5NCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBmaW5kX2dudHRhYl9yZWdpb24oc3RydWN0IAo+
PiBkb21haW4gKmQsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBraW5mby0+Z250dGFiX3N0
YXJ0LCBraW5mby0+Z250dGFiX3N0YXJ0ICsgCj4+IGtpbmZvLT5nbnR0YWJfc2l6ZSk7Cj4+IMKg
IH0KPj4gLWludCBjb25zdHJ1Y3RfZG9tMChzdHJ1Y3QgZG9tYWluICpkKQo+PiAraW50IF9faW5p
dCBjb25zdHJ1Y3RfZG9tMChzdHJ1Y3QgZG9tYWluICpkKQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAg
c3RydWN0IGtlcm5lbF9pbmZvIGtpbmZvID0ge307Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHZjcHUg
KnNhdmVkX2N1cnJlbnQ7Cj4+Cj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
