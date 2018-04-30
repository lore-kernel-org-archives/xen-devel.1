From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH 3/4] xen/PVH: Set up GS segment for stack canary
Date: Mon, 30 Apr 2018 12:23:38 -0400
Message-ID: <20180430162339.17143-4-boris.ostrovsky__5772.20435156978$1525105232$gmane$org@oracle.com>
References: <20180430162339.17143-1-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zpnp=ht=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fDBYZ-0003SE-2N
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 16:21:39 +0000
In-Reply-To: <20180430162339.17143-1-boris.ostrovsky@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

V2UgYXJlIG1ha2luZyBjYWxscyB0byBDIGNvZGUgKGUuZy4geGVuX3ByZXBhcmVfcHZoKCkpIHdo
aWNoIG1heSB1c2UKc3RhY2sgY2FuYXJ5IChzdG9yZWQgaW4gR1Mgc2VnbWVudCkuCgpTaWduZWQt
b2ZmLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwotLS0KIGFyY2gveDg2L3hlbi94ZW4tcHZoLlMgfCA3ICsr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNo
L3g4Ni94ZW4veGVuLXB2aC5TIGIvYXJjaC94ODYveGVuL3hlbi1wdmguUwppbmRleCAzNzNmZWYw
Li40ZWVkNTg2IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4veGVuLXB2aC5TCisrKyBiL2FyY2gv
eDg2L3hlbi94ZW4tcHZoLlMKQEAgLTU0LDYgKzU0LDkgQEAKICAqIGNoYXJnZSBvZiBzZXR0aW5n
IHVwIGl0J3Mgb3duIHN0YWNrLCBHRFQgYW5kIElEVC4KICAqLwogCisjZGVmaW5lIFBWSF9HRFRf
RU5UUllfQ0FOQVJZICAgIDQKKyNkZWZpbmUgUFZIX0NBTkFSWV9TRUwgICAgICAgICAgKFBWSF9H
RFRfRU5UUllfQ0FOQVJZICogOCkKKwogRU5UUlkocHZoX3N0YXJ0X3hlbikKIAljbGQKIApAQCAt
NjQsNiArNjcsOSBAQCBFTlRSWShwdmhfc3RhcnRfeGVuKQogCW1vdiAlZWF4LCVlcwogCW1vdiAl
ZWF4LCVzcwogCisJbW92ICQoUFZIX0NBTkFSWV9TRUwpLCVlYXgKKwltb3YgJWVheCwlZ3MKKwog
CS8qIFN0YXNoIGh2bV9zdGFydF9pbmZvLiAqLwogCW1vdiAkX3BhKHB2aF9zdGFydF9pbmZvKSwg
JWVkaQogCW1vdiAlZWJ4LCAlZXNpCkBAIC0xNTAsNiArMTU2LDcgQEAgZ2R0X3N0YXJ0OgogCS5x
dWFkIDB4MDBjZjlhMDAwMDAwZmZmZiAgICAgICAgICAgIC8qIF9fQk9PVF9DUyAqLwogI2VuZGlm
CiAJLnF1YWQgMHgwMGNmOTIwMDAwMDBmZmZmICAgICAgICAgICAgLyogX19CT09UX0RTICovCisJ
LnF1YWQgMHgwMDQwOTAwMDAwMDAwMDE4ICAgICAgICAgICAgLyogUFZIX0NBTkFSWV9TRUwgKi8K
IGdkdF9lbmQ6CiAKIAkuYmFsaWduIDQKLS0gCjIuOS4zCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
