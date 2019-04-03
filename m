From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/4] xen/public: Document
 HYPERCALL_console_io()
Date: Wed, 03 Apr 2019 07:04:30 -0600
Message-ID: <5CA4AF5E0200007800224462@prv1-mh.provo.novell.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-4-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=57ha=SF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hBfZE-0005qS-8G
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 13:04:36 +0000
In-Reply-To: <20190402164238.1815-4-julien.grall@arm.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA0LjE5IGF0IDE4OjQyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3B1Ymxp
Yy94ZW4uaAo+IEBAIC05Nyw2ICs5Nyw3IEBAIERFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbl91
bG9uZ190KTsKPiAgI2RlZmluZSBfX0hZUEVSVklTT1Jfc2V0X3RpbWVyX29wICAgICAgICAgMTUK
PiAgI2RlZmluZSBfX0hZUEVSVklTT1JfZXZlbnRfY2hhbm5lbF9vcF9jb21wYXQgMTYgLyogY29t
cGF0IHNpbmNlIDB4MDAwMzAyMDIgKi8KPiAgI2RlZmluZSBfX0hZUEVSVklTT1JfeGVuX3ZlcnNp
b24gICAgICAgICAgMTcKPiArLyogSFlQRVJWSVNPUl9jb25zb2xlX2lvKGludCBjbWQsIGludCBj
b3VudCwgWEVOX0dVRVNUX0hBTkRMRShjaGFyKSBidWZmZXIpOyAqLwo+ICAjZGVmaW5lIF9fSFlQ
RVJWSVNPUl9jb25zb2xlX2lvICAgICAgICAgICAxOAoKSSBwcmV0dHkgc3Ryb25nbHkgb2JqZWN0
IHRvIHRoaXMgY29tbWVudCBnb2luZyB3aGVyZSB5b3UgcHV0IGl0LgpJJ2QgYmUgZmluZSBpZiB5
b3UgcHV0IGl0IC4uLgoKPiBAQCAtNDg2LDcgKzQ4NywyNSBAQCBERUZJTkVfWEVOX0dVRVNUX0hB
TkRMRShtbXVleHRfb3BfdCk7Cj4gIC8qIGAgfSAqLwo+ICAKPiAgLyoKPiAtICogQ29tbWFuZHMg
dG8gSFlQRVJWSVNPUl9jb25zb2xlX2lvKCkuCj4gKyAqIENvbW1hbmRzIHRvIEhZUEVSVklTT1Jf
Y29uc29sZV9pbygpCgouLi4gaW50byBoZXJlLCBqdXN0IGxpa2UgZG9uZSBmb3IgSFlQRVJWSVNP
Ul9tbXVleHRfb3AoKSBhbmQKSFlQRVJWSVNPUl91cGRhdGVfdmFfbWFwcGluZyooKSBpbW1lZGlh
dGVseSBhYm92ZS4gVGhpcwp3b3VsZCB0aGVuIGFsc28gaGVscCAuLi4KCj4gKyAqIEBjbWQ6IENv
bW1hbmQgKHNlZSBiZWxvdykKPiArICogQGNvdW50OiBTaXplIG9mIHRoZSBidWZmZXIgdG8gcmVh
ZC93cml0ZQo+ICsgKiBAYnVmZmVyOiBQb2ludGVyIGluIHRoZSBndWVzdCBtZW1vcnkKCi4uLiBh
c3NvY2lhdGluZyB0aGVzZSBuYW1lcy4KCkFsc28gcGxlYXNlIG5vdGUgdGhlIHF1b3RhdGlvbiB1
c2VkIGJ5IHRoZSBtZW50aW9uZWQKZXhpc3RpbmcgZG9jIGNvbW1lbnRzLCBhcyB3ZWxsIGFzIGEg
ZmV3IG90aGVyIGZvcm1hbCBhc3BlY3RzCihsaWtlIHRoZW0gYWxzbyBtYWtpbmcgY2xlYXIgd2hh
dCB0aGUgcmV0dXJuIHR5cGUgaXMpLiBJIHRoaW5rCnRoYXQncyBhIG1vZGVsIHVzZWQgZWxzZXdo
ZXJlIGFzIHdlbGwsIHNvIEkgdGhpbmsgeW91IHNob3VsZApmb2xsb3cgaXQgaGVyZS4KClRoZSBv
dGhlciB0aGluZyBpczogQXMgbWVudGlvbmVkIGVsc2V3aGVyZSwgSSBkb24ndCB0aGluayB0aGUK
Zmlyc3QgdHdvIHBhcmFtZXRlcnMgc2hvdWxkIGJlIHBsYWluIGludC4gSSdtIG5vdCBoYXBweSB0
byBzZWUKdGhpcyBwcm9saWZlcmF0ZSBpbnRvIGRvY3VtZW50YXRpb24gYXMgd2VsbCwgaS5lLiBJ
J2QgcHJlZmVyIGlmCnRoaXMgd2FzIGNvcnJlY3RlZCBiZWZvcmUgYWRkaW5nIGRvY3VtZW50YXRp
b24uIFdvdWxkIHlvdQpiZSB3aWxsaW5nIHRvIGRvIHRoaXMsIG9yIHNob3VsZCBJIGFkZCBpdCB0
byBteSB0b2RvIGxpc3Q/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
