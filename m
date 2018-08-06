From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: [PATCH v1 4/4] xen/arm: Reuse R-Car Gen2 platform code
 for Stout board
Date: Mon,  6 Aug 2018 21:35:52 +0300
Message-ID: <1533580552-938-5-git-send-email-olekstysh@gmail.com>
References: <1533580552-938-1-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ygvs=kv=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1fmkMX-0003hF-79
 for xen-devel@lists.xenproject.org; Mon, 06 Aug 2018 18:36:13 +0000
Received: by mail-lj1-x242.google.com with SMTP id s12-v6so11423862ljj.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Aug 2018 11:36:12 -0700 (PDT)
In-Reply-To: <1533580552-938-1-git-send-email-olekstysh@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, olekstysh@gmail.com, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKUmVuZXNhcyAiU3RvdXQiIGRldmVsb3BtZW50IGJvYXJkICh3aXRoIGRpZmZlcmVudCBleHBh
bnNpb24gYm9hcmRzKQppcyBhbHNvIGJhc2VkIG9uIFItQ2FyIEdlbjIgU29DLiBTbyBleHRlbmQg
Y29tcGF0IGFycmF5IHdpdGgKYm9hcmQncyBjb21wYXRpYmxlIHN0cmluZ3MuCgpTaWduZWQtb2Zm
LWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+
CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9hcmNoL2FybS9wbGF0Zm9y
bXMvcmNhcjIuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvcmNhcjIuYyBiL3hlbi9hcmNoL2FybS9w
bGF0Zm9ybXMvcmNhcjIuYwppbmRleCBkZjBhYzg0Li5lZTJkZWQwIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC9hcm0vcGxhdGZvcm1zL3JjYXIyLmMKKysrIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9y
Y2FyMi5jCkBAIC00OSw2ICs0OSwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCByY2FyMl9zbXBfaW5p
dCh2b2lkKQogc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IHJjYXIyX2R0X2NvbXBhdFtdIF9faW5p
dGNvbnN0ID0KIHsKICAgICAicmVuZXNhcyxsYWdlciIsCisgICAgInJlbmVzYXMscjhhNzc5MHN0
b3V0IiwKKyAgICAicmVuZXNhcyxyOGE3Nzkwc3RvdXQtdmlldyIsCisgICAgInJlbmVzYXMscjhh
Nzc5MHN0b3V0LWhhZCIsCisgICAgInJlbmVzYXMscjhhNzc5MHN0b3V0LWZ1bGwiLAogICAgIE5V
TEwKIH07CiAKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
