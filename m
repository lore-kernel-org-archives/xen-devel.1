From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [RFC Patch v4 8/8] x86/hvm: bump the maximum number
 of vcpus to 512
Date: Fri, 23 Feb 2018 18:11:39 +0000
Message-ID: <20180223181139.crabalgltt34ry7m@MacBook-Pro-de-Roger.local>
References: <1512546614-9937-1-git-send-email-chao.gao@intel.com>
 <1512546614-9937-9-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1512546614-9937-9-git-send-email-chao.gao@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMDYsIDIwMTcgYXQgMDM6NTA6MTRQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KPiAtLS0KPiAg
eGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1faW5mb190YWJsZS5oIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1faW5mb190YWJsZS5oIGIveGVuL2luY2x1ZGUvcHVi
bGljL2h2bS9odm1faW5mb190YWJsZS5oCj4gaW5kZXggMDhjMjUyZS4uNjgzM2E0YyAxMDA2NDQK
PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9pbmZvX3RhYmxlLmgKPiArKysgYi94
ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9pbmZvX3RhYmxlLmgKPiBAQCAtMzIsNyArMzIsNyBA
QAo+ICAjZGVmaW5lIEhWTV9JTkZPX1BBRERSICAgICAgICgoSFZNX0lORk9fUEZOIDw8IDEyKSAr
IEhWTV9JTkZPX09GRlNFVCkKPiAgCj4gIC8qIE1heGltdW0gd2UgY2FuIHN1cHBvcnQgd2l0aCBj
dXJyZW50IHZMQVBJQyBJRCBtYXBwaW5nLiAqLwo+IC0jZGVmaW5lIEhWTV9NQVhfVkNQVVMgICAg
ICAgIDEyOAo+ICsjZGVmaW5lIEhWTV9NQVhfVkNQVVMgICAgICAgIDUxMgoKV293LCB0aGF0IGxv
b2tzIGxpa2UgYSBwcmV0dHkgYmlnIGp1bXAuIEkgY2VydGFpbmx5IGRvbid0IGhhdmUgYWNjZXNz
CnRvIGFueSBib3ggd2l0aCB0aGlzIG51bWJlciBvZiB2Q1BVcywgc28gdGhhdCdzIGdvaW5nIHRv
IGJlIHF1aXRlIGhhcmQKdG8gdGVzdC4gV2hhdCB0aGUgcmVhc29uaW5nIGJlaGluZCB0aGlzIGJ1
bXA/IElzIGhhcmR3YXJlIHdpdGggNTEyCndheXMgZXhwZWN0ZWQgc29vbi1pc2g/CgpBbHNvIG9z
c3Rlc3QgaXMgbm90IGV2ZW4gYWJsZSB0byB0ZXN0IHRoZSBjdXJyZW50IGxpbWl0LCBzbyBJIHdv
dWxkCm1heWJlIGJ1bXAgdGhpcyB0byAyNTYsIGJ1dCBhcyBJIGV4cHJlc3NlZCBpbiBvdGhlciBv
Y2Nhc2lvbnMgSSBkb24ndApmZWVsIGNvbWZvcnRhYmxlIHdpdGggaGF2ZSBhIG51bWJlciBvZiB2
Q1BVcyB0aGF0IHRoZSBjdXJyZW50IHRlc3QKc3lzdGVtIGRvZXNuJ3QgaGF2ZSBoYXJkd2FyZSB0
byB0ZXN0IHdpdGguCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
