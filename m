From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 20/20] xen/domain: Allocate d->vcpu[] in
 arch_domain_create()
Date: Tue, 20 Mar 2018 04:17:58 +0000
Message-ID: <7c75953e-8dc8-6ee4-df81-af9b92f55246@arm.com>
References: <1521486839-25617-1-git-send-email-andrew.cooper3@citrix.com>
 <1521486839-25617-21-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521486839-25617-21-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

KCsgQW5kcmUpCgpPbiAwMy8xOS8yMDE4IDA3OjEzIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+
IE9uIHRoZSBBUk0gc2lkZSwgYXVkaXQgY29uZmlnLT5tYXhfdmNwdXMgYWZ0ZXIgdGhlIHZnaWMg
aGFzIGJlZW4gaW5pdGlhbGlzZWQsCj4gYXQgd2hpY2ggcG9pbnQgd2UgaGF2ZSBhIHJlYWwgdXBw
ZXIgYm91bmQgdG8gdGVzdCBhZ2FpbnN0LiAgVGhpcyBhbGxvd3MgZm9yCj4gdGhlIHJlbW92YWwg
b2YgdGhlIHZnaWNfbWF4X3ZjcHVzKCkganVnZ2xpbmcgdG8gY29wZSB3aXRoIHRoZSBjYWxsIGZy
b20KPiBldnRjaG5faW5pdCgpIGJlZm9yZSB0aGUgdmdpYyBzZXR0aW5ncyBhcmUga25vd24uCgpJ
IHdvdWxkIHJhdGhlciBrZWVwIHZnaWNfbWF4X3ZjcHVzKCkgYXJvdW5kLiBXZSBhcmUgaW50cm9k
dWNpbmcgYSBuZXcgCnZHSUMgaW4gWGVuIHRoYXQgd2lsbCBjb2hhYml0IHdpdGggdGhlIGN1cnJl
bnQgdkdJQyBmb3IgYSBmZXcgcmVsZWFzZXMuIApTZWUgWzFdLgoKU28gYSBiZXR0ZXIgc29sdXRp
b24gaXMgdG8gcmV3b3JrIHZnaWNfbWF4X3ZjcHVzKCkgdG8gZHJvcCB0aGUgTlVMTCBjaGVjay4K
Ckkgd291bGQgYWxzbyBmaW5lIHRvIGRpcmVjdGx5IGNhbGwgdmdpY19tYXhfdmNwdXMoKSBpbiAK
YXJjaF9kb21haW5fY3JlYXRlIGFuZCB0aGVyZWZvcmUgZHJvcCBkb21haW5fbWF4X3ZjcHVzKCku
CgpDaGVlcnMsCgpbMV0gaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRl
dmVsLzIwMTgtMDMvbXNnMDE4MzEuaHRtbAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
