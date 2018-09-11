From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH] perfc: Print a system time in a convenient
 format
Date: Tue, 11 Sep 2018 09:53:49 +0300
Message-ID: <1536648829-13743-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Ci0tLQogeGVuL2NvbW1v
bi9wZXJmYy5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3BlcmZjLmMgYi94ZW4vY29tbW9uL3Bl
cmZjLmMKaW5kZXggMDY3NTY3Ny4uMGFiZDk3NyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9wZXJm
Yy5jCisrKyBiL3hlbi9jb21tb24vcGVyZmMuYwpAQCAtMzMsOCArMzMsNyBAQCB2b2lkIHBlcmZj
X3ByaW50YWxsKHVuc2lnbmVkIGNoYXIga2V5KQogICAgIHVuc2lnbmVkIGludCBpLCBqOwogICAg
IHNfdGltZV90IG5vdyA9IE5PVygpOwogCi0gICAgcHJpbnRrKCJYZW4gcGVyZm9ybWFuY2UgY291
bnRlcnMgU0hPVyAgKG5vdyA9IDB4JTA4WDolMDhYKVxuIiwKLSAgICAgICAgICAgKHUzMikobm93
Pj4zMiksICh1MzIpbm93KTsKKyAgICBwcmludGsoIlhlbiBwZXJmb3JtYW5jZSBjb3VudGVycyBT
SE9XICAobm93ID0gJSJQUklfc3RpbWUiKVxuIiwgbm93KTsKIAogICAgIGZvciAoIGkgPSBqID0g
MDsgaSA8IE5SX1BFUkZDVFJTOyBpKysgKQogICAgIHsKLS0gCjIuNy40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
