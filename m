From: Huaisheng Ye <yehs2007@gmail.com>
Subject: [RFC PATCH v3 9/9] arch/x86/include/asm/page.h: update
 usage of movableflags
Date: Thu, 24 May 2018 01:13:41 +0800
Message-ID: <1527095621-5574-1-git-send-email-yehs2007__44477.8950688944$1527095590$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pyse=ik=gmail.com=yehs2007@srs-us1.protection.inumbo.net>)
 id 1fLXL2-0000VJ-QM
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 17:14:12 +0000
Received: by mail-pf0-x241.google.com with SMTP id p12-v6so10801181pff.13
 for <xen-devel@lists.xenproject.org>; Wed, 23 May 2018 10:14:11 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: akpm@linux-foundation.org, linux-mm@kvack.org
Cc: kstewart@linuxfoundation.org, "x86@kernel.org" <x86@kernel.org>, mhocko@suse.com, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, Philippe Ombredanne <pombredanne@nexb.com>, gregkh@linuxfoundation.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, willy@infradead.org, colyli@suse.de, Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, mgorman@techsingularity.net, hch@lst.de, vbabka@suse.cz
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgoKR0ZQX0hJR0hVU0VSX01PVkFC
TEUgZG9lc24ndCBlcXVhbCB0byBHRlBfSElHSFVTRVIgfCBfX0dGUF9NT1ZBQkxFLAptb2RpZnkg
aXQgdG8gYWRhcHQgcGF0Y2ggb2YgZ2V0dGluZyByaWQgb2YgR0ZQX1pPTkVfVEFCTEUvQkFELgoK
U2lnbmVkLW9mZi1ieTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgpDYzogVGhvbWFz
IEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVk
aGF0LmNvbT4KQ2M6ICJILiBQZXRlciBBbnZpbiIgPGhwYUB6eXRvci5jb20+CkNjOiBLYXRlIFN0
ZXdhcnQgPGtzdGV3YXJ0QGxpbnV4Zm91bmRhdGlvbi5vcmc+CkNjOiBHcmVnIEtyb2FoLUhhcnRt
YW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpDYzogeDg2QGtlcm5lbC5vcmcgPHg4NkBr
ZXJuZWwub3JnPgpDYzogUGhpbGlwcGUgT21icmVkYW5uZSA8cG9tYnJlZGFubmVAbmV4Yi5jb20+
CkNjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+Ci0tLQogYXJjaC94ODYv
aW5jbHVkZS9hc20vcGFnZS5oIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYWdl
LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYWdlLmgKaW5kZXggNzU1NWI0OC4uYTQ3ZjQyZCAx
MDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFnZS5oCisrKyBiL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL3BhZ2UuaApAQCAtMzUsNyArMzUsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgY29w
eV91c2VyX3BhZ2Uodm9pZCAqdG8sIHZvaWQgKmZyb20sIHVuc2lnbmVkIGxvbmcgdmFkZHIsCiB9
CiAKICNkZWZpbmUgX19hbGxvY196ZXJvZWRfdXNlcl9oaWdocGFnZShtb3ZhYmxlZmxhZ3MsIHZt
YSwgdmFkZHIpIFwKLQlhbGxvY19wYWdlX3ZtYShHRlBfSElHSFVTRVIgfCBfX0dGUF9aRVJPIHwg
bW92YWJsZWZsYWdzLCB2bWEsIHZhZGRyKQorCWFsbG9jX3BhZ2Vfdm1hKChtb3ZhYmxlZmxhZ3Mg
PyBHRlBfSElHSFVTRVJfTU9WQUJMRSA6IEdGUF9ISUdIVVNFUikgXAorCXwgX19HRlBfWkVSTywg
dm1hLCB2YWRkcikKICNkZWZpbmUgX19IQVZFX0FSQ0hfQUxMT0NfWkVST0VEX1VTRVJfSElHSFBB
R0UKIAogI2lmbmRlZiBfX3BhCi0tIAoxLjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
