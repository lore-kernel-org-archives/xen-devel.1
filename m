From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: [PATCH v1] xen: Fix emfn calculation in
 init_domheap_pages()
Date: Mon, 16 Apr 2018 14:29:12 +0300
Message-ID: <1523878152-13818-1-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5cp6=hf=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1f82K3-0000ES-3F
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 11:29:23 +0000
Received: by mail-lf0-x244.google.com with SMTP id q5-v6so21481782lff.12
 for <xen-devel@lists.xenproject.org>; Mon, 16 Apr 2018 04:29:21 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKVGhlICJlbmQiIGFkZHJlc3MgbXVzdCBiZSByb3VuZGVkIGRvd24gYmVmb3JlIHNoaWZ0aW5n
LApvdGhlcndpc2Ugd2Ugd2lsbCBpbnNlcnQgd3JvbmcgcGFnZSByYW5nZSB0byBhIGhlYXAgaWYg
YWRkcmVzcyBpc24ndApwYWdlIGFsaWduZWQuCgpJdCBzZWVtcyB0aGF0IGEgY29weS1wYXN0ZSBt
aXN0YWtlIHRvb2sgcGxhY2UgaW4gdGhlIGZvbGxvd2luZyBjb21taXQ6CjBjMTI5NzJlMzRiMjBh
MjZmMmI0MjA0NGI5OGJmMTJkYjdlZDYyYjYKeGVuL21tOiBTd2l0Y2ggc29tZSBvZiBwYWdlX2Fs
bG9jLmMgdG8gdHlwZXNhZmUgTUZOCgpTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5r
byA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+CkNDOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgpDQzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBl
dS5jaXRyaXguY29tPgpDQzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
CkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNDOiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgpDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2ls
a0BvcmFjbGUuY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgpDQzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNDOiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgpDQzogeGVuLWRldmVsQGxpc3RzLnhlbi5vcmcKLS0tCiB4ZW4vY29tbW9uL3Bh
Z2VfYWxsb2MuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2NvbW1v
bi9wYWdlX2FsbG9jLmMKaW5kZXggMTg2YjM5YS4uMjBlZTFlNCAxMDA2NDQKLS0tIGEveGVuL2Nv
bW1vbi9wYWdlX2FsbG9jLmMKKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKQEAgLTIxNjYs
NyArMjE2Niw3IEBAIHZvaWQgaW5pdF9kb21oZWFwX3BhZ2VzKHBhZGRyX3QgcHMsIHBhZGRyX3Qg
cGUpCiAgICAgQVNTRVJUKCFpbl9pcnEoKSk7CiAKICAgICBzbWZuID0gbWFkZHJfdG9fbWZuKHJv
dW5kX3BndXAocHMpKTsKLSAgICBlbWZuID0gbWFkZHJfdG9fbWZuKHJvdW5kX3BndXAocGUpKTsK
KyAgICBlbWZuID0gbWFkZHJfdG9fbWZuKHJvdW5kX3BnZG93bihwZSkpOwogCiAgICAgaWYgKCBt
Zm5feChlbWZuKSA8PSBtZm5feChzbWZuKSApCiAgICAgICAgIHJldHVybjsKLS0gCjIuNy40CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
