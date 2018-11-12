From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 01/18] xen/arm: Move code that initializes
 VCPU context into a separate function
Date: Mon, 12 Nov 2018 04:41:39 -0700
Message-ID: <5BE966F302000078001FAD76@prv1-mh.provo.novell.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-2-git-send-email-mirela.simonovic@aggios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542022244-22977-2-git-send-email-mirela.simonovic@aggios.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: mirela.simonovic@aggios.com
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, dm@aggios.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, stefano.stabellini@xilinx.com, saeed.nowshadi@xilinx.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjExLjE4IGF0IDEyOjMwLCA8bWlyZWxhLnNpbW9ub3ZpY0BhZ2dpb3MuY29tPiB3
cm90ZToKPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmgKPiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vZG9tYWluLmgKPiBAQCAtNzMsNiArNzMsNyBAQCBpbnQgYXJjaF9kb21haW5fc29mdF9y
ZXNldChzdHJ1Y3QgZG9tYWluICpkKTsKPiAgdm9pZCBhcmNoX3AybV9zZXRfYWNjZXNzX3JlcXVp
cmVkKHN0cnVjdCBkb21haW4gKmQsIGJvb2wgYWNjZXNzX3JlcXVpcmVkKTsKPiAgCj4gIGludCBh
cmNoX3NldF9pbmZvX2d1ZXN0KHN0cnVjdCB2Y3B1ICosIHZjcHVfZ3Vlc3RfY29udGV4dF91KTsK
PiArdm9pZCBfYXJjaF9zZXRfaW5mb19ndWVzdChzdHJ1Y3QgdmNwdSAqLCBzdHJ1Y3QgdmNwdV9n
dWVzdF9jb250ZXh0ICopOwoKSWYgdGhlIEFybSBtYWludGFpbmVycyBhcmUgaGFwcHkgd2l0aCBz
dWNoIGEgbmFtZSBzcGFjZSB2aW9sYXRpb24KSSB3b24ndCBvYmplY3QsIGJ1dCBpZiB5b3UgcGxh
Y2UgdGhpcyBpbiBhIGNvbW1vbiBoZWFkZXIgKHdpdGhvdXQKc3RyaWN0IG5lZWQgYWZhaWN0KSBw
bGVhc2UgcmVzcGVjdCB0aGUgQyBzcGVjIHJlc2VydmluZyBuYW1lcyBsaWtlCnRoaXMgb25lIGZv
ciBmaWxlIHNjb3BlIHN5bWJvbHMuCgpBbHNvIHBsZWFzZSBkb24ndCBwb3N0IHBhdGNoZXMgdG8g
eGVuLWRldmVsQCB0d2ljZSAodXNpbmcgZGlmZmVyZW50CmRvbWFpbiBuYW1lcykuCgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
