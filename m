From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 6/7] Arm/atomic: unify generation of u64
 read/write functions
Date: Mon, 11 Mar 2019 18:16:05 +0000
Message-ID: <0fae855d-b827-56c3-bf20-806eae68489c@arm.com>
References: <5C869060020000780021D5D4@prv1-mh.provo.novell.com>
 <5C86922A020000780021D600@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ahZP=RO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h3PT7-0003wD-U4
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 18:16:09 +0000
In-Reply-To: <5C86922A020000780021D600@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMS8wMy8yMDE5IDE2OjUxLCBKYW4gQmV1bGljaCB3cm90ZToKPiBCeSBhZGRpbmcg
YW5vdGhlciBzdWl0YWJsZSBhYnN0cmFjdGluZyBtYWNybyB0aGUgbmVlZCBmb3IgZXhwbGljaXQK
PiBpbmxpbmUgZnVuY3Rpb24gZGVmaW5pdGlvbnMgaW4gdGhlIDMyLWJpdCBjYXNlIGdvZXMgYXdh
eS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
LS0tCj4gVGhlIHNlbGVjdGVkIG5hbWUgZm9yIHRoZSBuZXcgbWFjcm8gKFBBSVIpIGlzIHN1Ympl
Y3QgdG8gaW1wcm92ZW1lbnQKPiBzdWdnZXN0aW9ucy4KCkkgZG9uJ3QgaGF2ZSBhIGJldHRlciBu
YW1lLgoKPiAKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2F0b21pYy5oCj4gKysrIGIveGVu
L2luY2x1ZGUvYXNtLWFybS9hdG9taWMuaAo+IEBAIC0zNSw0MiArMzUsMjkgQEAgc3RhdGljIGlu
bGluZSB2b2lkIG5hbWUodm9sYXRpbGUgdHlwZSAqYQo+ICAgfQo+ICAgCj4gICAjaWYgZGVmaW5l
ZCAoQ09ORklHX0FSTV8zMikKPiAtI2RlZmluZSBCWVRFKG4pICNuCj4gLSNkZWZpbmUgV09SRChu
KSAjbgo+ICsjZGVmaW5lIEJZVEUobikgICNuCj4gKyNkZWZpbmUgV09SRChuKSAgI24KPiArI2Rl
ZmluZSBEV09SRChuKSAiIiAjbiAiLCVIIiAjbgo+ICsjZGVmaW5lIFBBSVIgICAgICJkIgoKQ2Fu
IHlvdSBwbGVhc2UgYXZvaWQgY2hhbmdlcyB0aGF0IGp1c3QgaGVscCB0byBrZWVwIHRoaW5ncyBh
bGlnbmVkLiBUaGlzIGlzIGp1c3QgCm1ha2luZyB0aGUgcmV2aWV3IGEgYml0IG1vcmUgZGlmZmlj
dWx0IGZvciBub3QgcmVhbCBiZW5lZml0cy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
