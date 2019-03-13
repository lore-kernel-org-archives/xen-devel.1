From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/7] Arm/atomic: correct asm() constraints
 in build_add_sized()
Date: Wed, 13 Mar 2019 04:21:19 -0600
Message-ID: <5C88D99F020000780021E06E@prv1-mh.provo.novell.com>
References: <5C869060020000780021D5D4@prv1-mh.provo.novell.com>
 <5C8691A0020000780021D5F7@prv1-mh.provo.novell.com>
 <9314781f-a219-591c-a35e-05163d114057@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GbKp=RQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h410n-0002uB-F4
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 10:21:25 +0000
In-Reply-To: <9314781f-a219-591c-a35e-05163d114057@arm.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjAzLjE5IGF0IDE5OjA4LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDExLzAzLzIwMTkgMTY6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUaGUgbWVtb3J5IG9w
ZXJhbmQgaXMgYW4gaW4vb3V0IG9uZSwgYW5kIHRoZSBhdXhpbGlhcnkgcmVnaXN0ZXIgZ2V0cwo+
PiB3cml0dGVuIHRvIGVhcmx5Lgo+PiAKPj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFsc28g
ZHJvcCB0aGUgcmVkdW5kYW50IGNhc3QgKHRoZSBpbmxpbmUKPj4gZnVuY3Rpb25zJyBwYXJhbWV0
ZXJzIGFyZSBhbHJlYWR5IG9mIHRoZSBjYXN0ZWQtdG8gdHlwZSkuCj4+IAo+PiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gSSBndWVzcyB0aGlzIGlz
IGNhbmRpZGF0ZSBmb3IgYmFja3BvcnRpbmcuCgpCdHcsIGRvIHlvdSB3YW50IG1lIHRvIHF1ZXVl
IHRoaXMsIG9yIHdpbGwgeW91IG9yIFN0ZWZhbm8gd2FudCB0bwp0YWtlIGNhcmU/CgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
