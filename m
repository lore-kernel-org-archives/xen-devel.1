From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH V6] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Tue, 16 Oct 2018 17:31:05 +0100
Message-ID: <f0a1b017-196c-2819-6424-9b0f95e5ef30@citrix.com>
References: <1538035134-10967-1-git-send-email-rcojocaru@bitdefender.com>
 <934c92cb-7b8e-d1b3-18e9-721ab6623dc2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g0qr=m4=citrix.com=prvs=820502905=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gCSFY-0004vJ-JC
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 16:31:16 +0000
In-Reply-To: <934c92cb-7b8e-d1b3-18e9-721ab6623dc2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: tamas@tklengyel.com, wei.liu2@citrix.com, konrad.wilk@oracle.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Adrian Pop <apop@bitdefender.com>, tim@xen.org, julien.grall@arm.com, sstabellini@kernel.org, jbeulich@suse.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMTYvMjAxOCAwNToyNiBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAwOS8yNy8y
MDE4IDA4OjU4IEFNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+IEN1cnJlbnRseSB0aGVyZSBp
cyBhIHN1Ym9wIGZvciBzZXR0aW5nIHRoZSBtZW1hY2Nlc3Mgb2YgYSBwYWdlLCBidXQgbm90Cj4+
IGZvciBjb25zdWx0aW5nIGl0LiAgVGhlIG5ldyBIVk1PUF9hbHRwMm1fZ2V0X21lbV9hY2Nlc3Mg
YWRkcyB0aGlzCj4+IGZ1bmN0aW9uYWxpdHkuCj4+Cj4+IEJvdGggYWx0cDJtIGdldC9zZXQgbWVt
IGFjY2VzcyBmdW5jdGlvbnMgdXNlIHRoZSBzdHJ1Y3QKPj4geGVuX2h2bV9hbHRwMm1fbWVtX2Fj
Y2VzcyB3aGljaCBoYXMgbm93IGRyb3BwZWQgdGhlIGBzZXQnIHBhcnQgYW5kIGhhcwo+PiBiZWVu
IHJlbmFtZWQgZnJvbSB4ZW5faHZtX2FsdHAybV9zZXRfbWVtX2FjY2Vzcy4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogQWRyaWFuIFBvcCA8YXBvcEBiaXRkZWZlbmRlci5jb20+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPiAKPiBTb3Jy
eSBpdCB0b29rIHNvIGxvbmcgdG8gZ2V0IHRvIHRoaXM6Cj4gCj4gUmV2aWV3ZWQtYnk6IEdlb3Jn
ZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCkFsdGhvdWdoIC0tIGxvb2tpbmcg
dGhyb3VnaCB0aGUgcGF0Y2gsIEkgZG9uJ3QgdGhpbmsgdGhpcyBuZWVkZWQgbXkgYWNrLgogQWxs
IHRoZSBjb2RlIHdhcyBlaXRoZXIgZGlyZWN0bHkgbWVtYWNjZXNzIG9yIHRvb2xzdGFjayByZWxh
dGVkOyBXZWkKYW5kIFRhbWFzJyBhY2tzIHNob3VsZCBoYXZlIGJlZW4gZW5vdWdoIGZvciBpdCB0
byBnbyBpbi4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
