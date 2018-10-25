From: Andrii Anisov <Andrii_Anisov@epam.com>
Subject: Re: [PATCH 06/22] xen/arm: Move VABORT_GEN_BY_GUEST to
 traps.h and turned into inline
Date: Thu, 25 Oct 2018 15:32:07 +0000
Message-ID: <642ad602-5988-fc25-fdf3-e8c34984878b@epam.com>
References: <20181018132109.31192-1-julien.grall@arm.com>
 <20181018132109.31192-7-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181018132109.31192-7-julien.grall@arm.com>
Content-Language: en-US
Content-ID: <94B809B6C8536B4F87D8886B562DE848@EPAM.onmicrosoft.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDE4LjEwLjE4IDE2OjIwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gVGhlIG1hY3JvIFZBQk9S
VF9HRU5fQllfR1VFU1QgaXMgb25seSB1c2VkIGJ5IHRoZSB0cmFwIGNvZGUuIFNvIG1vdmUgaXQK
PiB0byB0cmFwLmguCj4KPiBXaGlsZSBtb3ZpbmcgdGhlIGNvZGUsIGNvbnZlcnQgaXMgdG8gYSBz
dGF0aWMgaW5saW5lIHRvIGFsbG93IHR5cGVjaGVjay4KPgo+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogQW5kcmlp
IEFuaXNvdjxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0gCgoqQW5kcmlpIEFuaXNvdioKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
