From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] xen/public: arch-arm: Restrict the
 visibility of struct vcpu_guest_core_regs
Date: Tue, 04 Jun 2019 01:15:42 -0600
Message-ID: <5CF61A9E0200007800234E81@prv1-mh.provo.novell.com>
References: <20190603161108.864-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY3fi-0003tA-9E
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 07:15:50 +0000
In-Reply-To: <20190603161108.864-1-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, WeiLiu <wl@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA2LjE5IGF0IDE4OjExLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oCj4gKysrIGIveGVuL2luY2x1ZGUv
cHVibGljL2FyY2gtYXJtLmgKPiBAQCAtMTk3LDYgKzE5Nyw3IEBACj4gICAgICB9IHdoaWxlICgg
MCApCj4gICNkZWZpbmUgc2V0X3hlbl9ndWVzdF9oYW5kbGUoaG5kLCB2YWwpIHNldF94ZW5fZ3Vl
c3RfaGFuZGxlX3JhdyhobmQsIHZhbCkKPiAgCj4gKyNpZiBkZWZpbmVkKF9fWEVOX18pIHx8IGRl
ZmluZWQoX19YRU5fVE9PTFNfXykKPiAgI2lmIGRlZmluZWQoX19HTlVDX18pICYmICFkZWZpbmVk
KF9fU1RSSUNUX0FOU0lfXykKPiAgLyogQW5vbnltb3VzIHVuaW9uIGluY2x1ZGVzIGJvdGggMzIt
IGFuZCA2NC1iaXQgbmFtZXMgKGUuZy4sIHIwL3gwKS4gKi8KPiAgIyBkZWZpbmUgX19ERUNMX1JF
RyhuNjQsIG4zMikgdW5pb24geyAgICAgICAgICBcCj4gQEAgLTI3Miw2ICsyNzMsOCBAQCBERUZJ
TkVfWEVOX0dVRVNUX0hBTkRMRSh2Y3B1X2d1ZXN0X2NvcmVfcmVnc190KTsKPiAgCj4gICN1bmRl
ZiBfX0RFQ0xfUkVHCj4gIAo+ICsjZW5kaWYKPiArCj4gIHR5cGVkZWYgdWludDY0X3QgeGVuX3Bm
bl90Owo+ICAjZGVmaW5lIFBSSV94ZW5fcGZuIFBSSXg2NAo+ICAjZGVmaW5lIFBSSXVfeGVuX3Bm
biBQUkl1NjQKCkknbSBwdXp6bGVkIGJ5IHlvdSBzdGlsbCBhZGRpbmcgYW5vdGhlciAjaWYsIHJh
dGhlciB0aGFuIG1vdmluZyB0aGUKYmxvY2sgZG93biBpbnRvIHRoZSBleGlzdGluZyBvbmUuIFlv
dSBzYWlkIHlvdSdkIHdhaXQgZm9yIFN0ZWZhbm8ncwpvcGluaW9uLCBhbmQgaGUgYXNrZWQgdGhh
dCB5b3UgZm9sbG93IG15IHN1Z2dlc3Rpb24uIERpZCBJIG1pc3MKc29tZSBmdXJ0aGVyIHBhcnQg
b2YgdGhlIGRpc2N1c3Npb24/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
