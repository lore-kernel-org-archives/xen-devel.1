From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 0/3] x86/svm: Improvements to SVM
 instruction length handling
Date: Thu, 31 Jan 2019 16:56:19 +0000
Message-ID: <01f28f67-f5ba-8f89-e88a-eb33c7236684@citrix.com>
References: <1546256270-11734-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1546256270-11734-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <JGross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMTIvMjAxOCAxMTozNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgbWFpbiBidWdm
aXggaW4gdjIgb2YgdGhpcyBzZXJpZXMgaGFzIG5vdyBiZWVuIGNvbW1pdHRlZCwgbGVhdmluZyBq
dXN0IHRoZQo+IGNsZWFudXAgcmVtYWluaW5nLiAgU2VlIHBhdGNoZXMgZm9yIGRldGFpbHMuCj4K
PiBBbmRyZXcgQ29vcGVyICgzKToKPiAgIHg4Ni9zdm06IFJlbW92ZSBsaXN0IGZ1bmN0aW9uYWxp
dHkgZnJvbSBfX2dldF9pbnN0cnVjdGlvbl9sZW5ndGhfKiBpbmZyYXN0cnVjdHVyZQo+ICAgeDg2
L3N2bTogRHJvcCBlbnVtIGluc3RydWN0aW9uX2luZGV4IGFuZCBzaW1wbGlmeSBzdm1fZ2V0X2lu
c25fbGVuKCkKPiAgIHg4Ni9zdm06IEltcHJvdmUgZGlhZ25vc3RpY3Mgd2hlbiBzdm1fZ2V0X2lu
c25fbGVuKCkgZmFpbHMKPgo+ICB4ZW4vYXJjaC94ODYvaHZtL3N2bS9lbXVsYXRlLmMgICAgICAg
IHwgMTE2ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgeGVuL2FyY2gveDg2
L2h2bS9zdm0vbmVzdGVkc3ZtLmMgICAgICB8ICAgOSArLS0KPiAgeGVuL2FyY2gveDg2L2h2bS9z
dm0vc3ZtLmMgICAgICAgICAgICB8ICAzOSArKysrKystLS0tLS0KPiAgeGVuL2luY2x1ZGUvYXNt
LXg4Ni9odm0vc3ZtL2VtdWxhdGUuaCB8ICA1OCArKysrKysrKy0tLS0tLS0tLQo+ICA0IGZpbGVz
IGNoYW5nZWQsIDg4IGluc2VydGlvbnMoKyksIDEzNCBkZWxldGlvbnMoLSkKCk5vdyB0aGF0IEkn
dmUgZ290IG1haW50YWluZXIgYWNrcywgY291bGQgSSBnZXQgYSB2aWV3IHRvIDQuMTIgcmVsZWFz
ZQphY2sgcGxlYXNlP8KgIFRoaXMgaW1wcm92ZXMgZGlhZ25vc3RpY3MgZm9yIGEgcmVhbCBpc3N1
ZSB3ZSBkaXNjb3ZlcmVkCmR1cmluZyB0aGUgNC4xMiBkZXZlbG9wbWVudCBjeWNsZS4KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
