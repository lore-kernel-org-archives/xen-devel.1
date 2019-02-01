From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 0/3] x86/svm: Improvements to SVM
 instruction length handling
Date: Fri, 1 Feb 2019 07:05:30 +0100
Message-ID: <972eba1d-9608-9b26-2d24-0ab89c66bc3d@suse.com>
References: <1546256270-11734-1-git-send-email-andrew.cooper3@citrix.com>
 <01f28f67-f5ba-8f89-e88a-eb33c7236684@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <01f28f67-f5ba-8f89-e88a-eb33c7236684@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDEvMjAxOSAxNzo1NiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAzMS8xMi8yMDE4
IDExOjM3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBUaGUgbWFpbiBidWdmaXggaW4gdjIgb2Yg
dGhpcyBzZXJpZXMgaGFzIG5vdyBiZWVuIGNvbW1pdHRlZCwgbGVhdmluZyBqdXN0IHRoZQo+PiBj
bGVhbnVwIHJlbWFpbmluZy4gIFNlZSBwYXRjaGVzIGZvciBkZXRhaWxzLgo+Pgo+PiBBbmRyZXcg
Q29vcGVyICgzKToKPj4gICB4ODYvc3ZtOiBSZW1vdmUgbGlzdCBmdW5jdGlvbmFsaXR5IGZyb20g
X19nZXRfaW5zdHJ1Y3Rpb25fbGVuZ3RoXyogaW5mcmFzdHJ1Y3R1cmUKPj4gICB4ODYvc3ZtOiBE
cm9wIGVudW0gaW5zdHJ1Y3Rpb25faW5kZXggYW5kIHNpbXBsaWZ5IHN2bV9nZXRfaW5zbl9sZW4o
KQo+PiAgIHg4Ni9zdm06IEltcHJvdmUgZGlhZ25vc3RpY3Mgd2hlbiBzdm1fZ2V0X2luc25fbGVu
KCkgZmFpbHMKPj4KPj4gIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL2VtdWxhdGUuYyAgICAgICAgfCAx
MTYgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgeGVuL2FyY2gveDg2L2h2
bS9zdm0vbmVzdGVkc3ZtLmMgICAgICB8ICAgOSArLS0KPj4gIHhlbi9hcmNoL3g4Ni9odm0vc3Zt
L3N2bS5jICAgICAgICAgICAgfCAgMzkgKysrKysrLS0tLS0tCj4+ICB4ZW4vaW5jbHVkZS9hc20t
eDg2L2h2bS9zdm0vZW11bGF0ZS5oIHwgIDU4ICsrKysrKysrLS0tLS0tLS0tCj4+ICA0IGZpbGVz
IGNoYW5nZWQsIDg4IGluc2VydGlvbnMoKyksIDEzNCBkZWxldGlvbnMoLSkKPiAKPiBOb3cgdGhh
dCBJJ3ZlIGdvdCBtYWludGFpbmVyIGFja3MsIGNvdWxkIEkgZ2V0IGEgdmlldyB0byA0LjEyIHJl
bGVhc2UKPiBhY2sgcGxlYXNlP8KgIFRoaXMgaW1wcm92ZXMgZGlhZ25vc3RpY3MgZm9yIGEgcmVh
bCBpc3N1ZSB3ZSBkaXNjb3ZlcmVkCj4gZHVyaW5nIHRoZSA0LjEyIGRldmVsb3BtZW50IGN5Y2xl
LgoKRm9yIHRoZSBzZXJpZXM6CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
